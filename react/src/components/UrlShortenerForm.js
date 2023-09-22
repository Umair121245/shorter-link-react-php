import React, { useState } from 'react';

function UrlShortenerForm() {
  const [longUrl, setLongUrl] = useState('');
  const [shortUrl, setShortUrl] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();

    // Create and Add your api link below
    const response = await fetch('http://localhost/short-link/index.php', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ longUrl }),
    });

    if (response.ok) {
      const data = await response.json();
      setShortUrl(data.shortUrl);
    } else {
      // Handle errors
      console.error('Error generating short URL');
    }
  };

  return (
    <div>
      <form onSubmit={handleSubmit}>
        <label>
          Long URL:
          <input
            type="text"
            value={longUrl}
            onChange={(e) => setLongUrl(e.target.value)}
          />
        </label>
        <button type="submit">Shorten URL</button>
      </form>
      {shortUrl && (
        <p>
          Short URL: <a href={shortUrl}>{shortUrl}</a>
        </p>
      )}
    </div>
  );
}

export default UrlShortenerForm;
