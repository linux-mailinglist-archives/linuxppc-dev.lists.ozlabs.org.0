Return-Path: <linuxppc-dev+bounces-14656-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0729ACA8A5C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 18:39:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNJXs0pWyz2yC9;
	Sat, 06 Dec 2025 04:39:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764956381;
	cv=none; b=QFdKT8dnqknym62SzXo91unY+fWEyQQRHYLoX373gjmw2fwP3DFwu+gIg/8a7Hei4TOsTUSy1+Sm70Fwew92QRMYLQJKqtjTQeGM3BELHN/0gmLCXiKug5bgjP6bF4nVVuACkSXCNuPMMXQZbKAToQ7vToT1F3LbHwi+Clquo7YPqFN5HQuEkkTFIWKCjybwPtbc1lHHRIPXNMzQCa0Ir/SzUDEsdIgMWUAcjhPmPLRLjLqhMk1mWJdTjXl4upCviEK5nf2buTLk60NJMwY9sLIjIXXixbZkmiHQ6G8X8mtbJzAYBpf58vWAYiza/ajGwr76a9xnwbAE9YvSoefo/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764956381; c=relaxed/relaxed;
	bh=hvc6LjpYmZ7fnKnlwMjz7iqxbgTTzoNx/4g5P6CwKag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHiDhproyL73HWdGDzZ/BTP5cDZE6Bmd5imSJaFxplv9x6NcydIhGdClzTtLSLqQDaVckLW0lG2YC2QoxHndwjzmfMvWTZ9BWdL/0A5eUqr+xUw4xYSHF+U6Qk+XHRFAV1xRnVncGdYoxsMAiilkauNL1EZKOPJkCB5f9mHJK3aszmih6Ny1wcYLy0dzrn3Gqk5Wxx2hX5sRIp5dvt9McPtLtzEnNFlvEEwtVLE4uVODz4N+0nakEwjqaqQwMlTJViSP2OKwNKqaJQ2DtRJClUP8yelcD0i4QqtCY29m7uw2iKIAsWOJkRwHlYzNl/Cc8MAzvMxyqxl1Wh3E/E64kw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=OzkFKLkO; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=OzkFKLkO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNJXp4GCzz2y8c
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 04:39:37 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47118259fd8so21791005e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 09:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764956374; x=1765561174; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hvc6LjpYmZ7fnKnlwMjz7iqxbgTTzoNx/4g5P6CwKag=;
        b=OzkFKLkO7y2RnYF638RHK2CP6SqxpAdEMwvJqpwP8BZtE6L9uzNpo5NApQeKUeRXxP
         SQtMvWHzvYe+Ylu+C9j7jGvcLMS4j9MdrhW9MPbRtNSkqYbgzzLm0ses0jMEzPmTXO5Q
         dO+gtzh/N68zUos8XPyVQ7HmSrBmeFIcBkmEAKEbbrjVKhPiWJedcb7KvPcCr9HSbzl7
         JhzjtctWwIxkcnbtgRvwQjfBRswcHLnjJUe120jnPgn4gvvOadjkjk+AceuiYsl8UlJo
         vPf91FKSSwr6veYqHUQ2M0PD+dU23QPlMf60OsKoHqID8LLEjqTRea57s5hYxj2BjHvT
         Dtsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764956374; x=1765561174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvc6LjpYmZ7fnKnlwMjz7iqxbgTTzoNx/4g5P6CwKag=;
        b=GA/L2cx6N6QBCTK1H1J77hGsrEay35aSFUesWuppI0zcYd5jQjqqSSEDCzIh7g6imL
         QbXUH0B7tL7b/Z4fOPSGK2Ekef0K9yAbpu9Xd9cn1ubXyw7vlOd2KYZTuFssNARCmStd
         0gvRtQmPOTz/3Pu94aCa0lmhJpq2w620lMHZGx7THCuIT16e+oxJDt4JZfEKZlrUymwU
         gAQUJN7/r/sY/Wd3VayWawuoE/Yz7dOFObDvZ4ZR1Lz1WqqXP7B9mq345cRH2I7JS1L5
         5dGfoEYa/EVG3RmaQIFc8027Zkkb/67izEH7h+kWahkcy7OWKLmDGs6RV/RoamKuImpi
         tf9g==
X-Gm-Message-State: AOJu0YxSYrxrhszvfWqQZ85lAIw6dwAi1jo7VxeRkx7qoOBhff8TgfeK
	DSYyBkC2NwtkPQ3BWJNcrwMVxbc34SMg8ZLGv9+TrrRAkPV5bVfLv5d5o41vPGuP3BY=
X-Gm-Gg: ASbGncux6t5UdXJH8hMe1+OHk5twkMyt/Rg9Hk/+As6SXp3iHDy9kp5tsoqJgbG6JuF
	7+ClwvPalEgYKShh6BLSUztWGjtQGq3UYnN/rIwsteobbXyFriF9qMz/AjTyWw5y41kGv0j+k/L
	qAPvROGPFS5aH8yBzFVxnCc9dLuSpXVJ6x9js+svZTPLWu3rJYSE9hEaEqcpfwhcyVtue9eJOKP
	Hx/LX2bzOYq+EqzikRRynuh5xlSOSmXrecIYsBut64THgi8+0zox/oYW4am4ORw8zDaYKVQFFQY
	hJEDvCobfjNs1sGSABEB2sIiPafOm7rDmWbsWSt13ZKpiiSgvgFbKGADxTiEJNxNn/bNt1xApXB
	WWqowcTR6yQDgfw3AA22G9sro6mJEUjRTsETlwYaf0JSyt4oO4HKBmuBnxTZuAzA6aw7W6ZxABN
	AeQF9EtVm5xOy5UcE3rxwGUaUsCuyuQefbjcqvdEiUH2lzSzGCWAAm5tgtOep39DiheL29KG9Tv
	g==
X-Google-Smtp-Source: AGHT+IHcfVoiT26Qr3rRxfQuD7/qs90EyfxCz94MbmwVZPSbbx8q/IcTAkbr+H+oM9s6afA+WUN7rQ==
X-Received: by 2002:a05:600c:1d28:b0:475:de68:3c30 with SMTP id 5b1f17b1804b1-47939e27931mr1221335e9.16.1764956374234;
        Fri, 05 Dec 2025 09:39:34 -0800 (PST)
Received: from localhost (p200300f65f0066080f2a7d55dcab4de7.dip0.t-ipconnect.de. [2003:f6:5f00:6608:f2a:7d55:dcab:4de7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-479310ca502sm97602685e9.7.2025.12.05.09.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 09:39:33 -0800 (PST)
Date: Fri, 5 Dec 2025 18:39:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] bus: fsl-mc: Convert to bus callbacks
Message-ID: <l3rm6hpfco7oterr3xfmlvvjr35ypirt5mfecrk4fn4golpm5l@rorig6egruji>
References: <cover.1764684327.git.u.kleine-koenig@baylibre.com>
 <848fffe5c479d899c04a4c99ccb5f0128ccc942d.1764684327.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dutvy34so7mguxag"
Content-Disposition: inline
In-Reply-To: <848fffe5c479d899c04a4c99ccb5f0128ccc942d.1764684327.git.u.kleine-koenig@baylibre.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--dutvy34so7mguxag
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] bus: fsl-mc: Convert to bus callbacks
MIME-Version: 1.0

Hello,

On Tue, Dec 02, 2025 at 03:09:20PM +0100, Uwe Kleine-K=F6nig wrote:
> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-=
bus.c
> index 0f0a5067f109..6bc163d2ca49 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> [...]
> +static void fsl_mc_shutdown(struct device *dev)
> +{
> +	struct fsl_mc_driver *mc_drv =3D to_fsl_mc_driver(dev->driver);
> +	struct fsl_mc_device *mc_dev =3D to_fsl_mc_device(dev);
> +
> +	if (mc_drv->shutdown)
> +		mc_drv->shutdown(mc_dev);
> +}

As the bus callback for shutdown is also called for unbound devices, the
condition has to be

	if (dev->driver && mc_drv->shutdown)
 	=09
Can you please squash this in, or should I resend?

Best regards
Uwe

--dutvy34so7mguxag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkzGNIACgkQj4D7WH0S
/k7L2gf/aTJF/YlytnD7NlHwvaNUmd2V7WJqVd/MNKxCh8w12fEy137q6WOTq+2u
S8jqLXf8abEnntHDBz4BBVfTuUtiR+FnwwsX0UfkZ2MaT6MVz5qKT5zuTxq+iGYg
Nr1Pyak6CJLb24VNDoFSEGNCQ5lNKeZOUOJLIBwvyjM8VGQaAafr8YYgaXHsm0bU
TSDhZKOtiuSDVPGO6N94v//LVJAaqI2zAvuO1VUYoUeQosMu6sIMKwgoCqLoqMNv
OQNFyyIddKbWS+De4JWbTXOiZAHA4H8yVF7ygVOl8npXQUQC0JC/n8n9NSvOexz3
Qk5ICGGJBAmQwbkrmYI+jW2X7KePlA==
=2KZG
-----END PGP SIGNATURE-----

--dutvy34so7mguxag--

