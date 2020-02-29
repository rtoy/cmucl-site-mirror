import {html, render} from 'https://unpkg.com/lit-html?module';

const headerTemplate = () =>
html`
  <!-- top banner -->  
  <div style="text-align: center">
    <img src="../images/CMUCL.jpg"
         alt="cmucl">
  </div><!-- top rule -->
  <div style="height: 20px; background: #003333"></div>
`;

const footerTemplate = () =>
html`
  <!-- Horizonal line that works the same everywhere -->
  <div style="height: 2px; background: #003333;"></div>
  <p>
    <a href="https://validator.w3.org/check?uri=referer"><img src=
    "https://www.w3.org/Icons/valid-html40"
         alt="Valid HTML 4.0 Transitional"
         height="31"
         width="88"></a> <a href=
         "https://jigsaw.w3.org/css-validator/check/referer"><img style=
         "border:0;width:88px;height:31px"
         src="https://jigsaw.w3.org/css-validator/images/vcss"
         alt="Valid CSS!"></a>
  </p>
  <p style="font-size: smaller; font-family: Helvetica, Arial;">
    Copyright © 1999-2019 CMUCL Project<br>
    Validate <a id="links"
       href="https://validator.w3.org/checklink?uri=//URI//"
       target="_blank">links</a>, <a id="html"
       href="https://validator.w3.org/check?uri=//URI//"
       target="_blank">HTML</a>, <a id="css"
       href=
       "https://jigsaw.w3.org/css-validator/validator?uri=//BASE//cmucl.css"
       target="_blank">stylesheet</a>.
  </p>
  <address>
    <a href="https://gitlab.common-lisp.net/cmucl/cmucl-site/issues"
             target="_blank">CMUCL Site Issue tracker</a>
  </address>
`;

const navbarTemplate = () => 
html`
  <nav id="navlist"
       class="navlist">
    <ol id="navitems" style="list-style-type: none; text-align: center; padding: 0; margin: 0">
      <li>
        <a href="../FAQ.html">FAQ</a>
      </li>
      <li>
        <a href="../benchmarks/index.html">Benchmarks</a>
      </li>
      <li>
        <a href="../credits.html">Credits</a>
      </li>
      <li>
        <a href="../doc/index.html">Documentation</a>
      </li>
      <li>
        <a href="../download.html">Download</a>
      </li>
      <li>
        <a href="../hemlock/index.html">Hemlock</a>
      </li>
      <li>
        <a href="../index.html">Home</a>
      </li>
      <li>
        <a href="../install.html">Install</a>
      </li>
      <li>
        <a href="../news/index.html">News</a>
      </li>
      <li>
        <a href="../platforms.html">Platforms</a>
      </li>
      <li>
        <a href="../ports.html">Ports</a>
      </li>
      <li>
        <a href="../projects.html">Projects</a>
      </li>
      <li>
        <a href="../search.html">Search</a>
      </li>
      <li>
        <a href="../support.html">Support</a>
      </li>
    </ol>
  </nav>
`;

render(headerTemplate(), document.getElementById('header'));
render(navbarTemplate(), document.getElementById('navbar'));
render(footerTemplate(), document.getElementById('footer'));
