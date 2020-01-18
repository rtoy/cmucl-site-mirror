      import {html, render} from 'https://unpkg.com/lit-html?module';

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
      render(navbarTemplate(), document.getElementById('navbar'));
