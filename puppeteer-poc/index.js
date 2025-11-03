const puppeteer = require('puppeteer');

(async () => {
  try {
    // Launch the browser and open a new blank page.
    const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();

    // Set screen size.
    await page.setViewport({width: 1080, height: 1024});

    // Navigate to Node.js website
    await page.goto('https://nodejs.org/', { waitUntil: 'load', timeout: 60000 });
    console.log('Navigated to Node.js website');

    // Wait for page to fully load
    await page.waitForTimeout(3000);

    // Find and click the "Learn" link
    const learnUrl = await page.evaluate(() => {
      const allLinks = [...document.querySelectorAll('a')];
      const learnLink = allLinks.find(el => 
        el.textContent.trim() === 'Learn' || 
        el.textContent.trim().toLowerCase() === 'learn'
      );
      if (learnLink) {
        return learnLink.href;
      }
      return null;
    });

    if (learnUrl) {
      console.log('Found Learn link:', learnUrl);
      // Navigate to the Learn page
      await page.goto(learnUrl, { waitUntil: 'load', timeout: 30000 });
      console.log('Navigated to Learn page');
      await page.waitForTimeout(3000);
    } else {
      console.log('Could not find Learn link');
    }

    // Get the page title
    const pageTitle = await page.title();
    const currentUrl = page.url();
    console.log('Page title:', pageTitle);
    console.log('Current URL:', currentUrl);

    // Create a safe filename from the page title
    const safeFileName = pageTitle.replace(/[^a-z0-9]/gi, '_').toLowerCase();
    const pdfPath = `output/${safeFileName}.pdf`;

    // Generate PDF of the page
    await page.pdf({
      path: pdfPath,
      format: 'A4',
      printBackground: true
    });
    console.log(`PDF saved to ${pdfPath}`);

    await browser.close();
    process.exit(0);
  } catch (err) {
    console.error('Puppeteer error:', err);
    process.exit(1);
  }
})();
