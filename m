Return-Path: <linuxppc-dev+bounces-2679-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FB19B459D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 10:23:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xd4Z66t5Tz2yNn;
	Tue, 29 Oct 2024 20:23:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730193822;
	cv=none; b=KtZXHV9qzO1Luvn11oCI3Rtf0t2CpS63k3LLyRG7pRgq61s6Ogihe6k809f4XkEofBM3YFmgqnG4G9WHqUwywsV9NdGeFQ50YioMIx8iSvrC0XOoL59gXd6kuG81l7MNWMMDESeRDbpCwr74jSy7qR0YZ/Yt8yInav83iPW801MCy6AykY3OyRuIavkZUvb9TJgGb399RCmCBxNn2J9Vati2ffYwuJZBRqJlsTEhAECQKHSsbpLb9mKh/VJJdu4pvGTp3W3FZm7HJ1NSyZFLPRkY+feMA9yYf9wgSSQuBh3k7VRpidq0TQeC7qr09d0Wxt3Uz8NVKHnSoct//1NjHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730193822; c=relaxed/relaxed;
	bh=CQnjdf1BvZTH4XhAxhOmXjNSVP+htdTUSRHZ+NtHwTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqYyLOQobdyNPObbD35UzCaxcEaN+I6U9HiXCGLC6w8mOmQsmvAs5dKZDMkid2FoJNqDQIjB4CXbd8NdSYXWxhS1MUcaI22r4K3a8CkS5nJKkNWro5q18QRRBcYp2PUGhOFqp8xPR5ZvbSA1yB+YBVX59nTIrCoY3x8Y0AT98wI2m9EJCr6AGREUUigJKy9WcOAtyKRGrGq+ZcR1kIhKYjl2gg0bugZMeb2w+dQRvwNFjOpTuZrKAjL3AXkQkAFhaLkFJ8zKHa2nfmAwR9Okh0GGt0PL/w0DM4E2igNdNpaIFe9U5TndkcoP4C1T8SiqXIWwO2YIDTuUDBzXm1qqFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=JyMn09qb; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=JyMn09qb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xd4Z41T5pz2yGf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 20:23:38 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so3506776f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 02:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730193813; x=1730798613; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CQnjdf1BvZTH4XhAxhOmXjNSVP+htdTUSRHZ+NtHwTM=;
        b=JyMn09qbHrVWCCf1uJXs7AbVvo47L8WiIE2XOfVcPYjGReNwcf8kOM7JSB9p2L2ibZ
         4+jHWiKqQKl6O1nsOT0THyaknnR61O/HoAqIDOBwK4hyN7vA5YtZqP0E8mswZqulIUaK
         E696MZ6ZO6aHEi1z7TRhMzuJLou6zISslGGlTup4jJkFALYyUR+LApRiC97ZygvuhAo7
         c7Z5oTCikT9D+3ucAhsB47JDYpsi93gjCp4sy8hzkAP7FAxZAT04Nhrj8h8q2J8BOtle
         2v8hf7Rp7hLjO/JUjRHO4l+18lf3zFL6lkitKdYdATPp9eZb3mcGMzAg2PbfA8lNPBOu
         uyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730193813; x=1730798613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQnjdf1BvZTH4XhAxhOmXjNSVP+htdTUSRHZ+NtHwTM=;
        b=Q5cEl29PV+nfTQfMujiq41xYMGU8aJcDt9f46CTGRz7fT0y4QLKV7iZ56y8QuMjHG2
         Nrdm27O1UBlRBiiV9MTnzv9oVMuLVXSugCH8CF5o8g3NUwzWWRY4sywhXYlKYTfQDXtI
         srFwQ9Xjby+Tw1mgThbHSEoU2hVjxEOerDhUS88RZa6h4qNYI8JqYyzyY4RHaq7bOLWz
         g8tBSikarFQfFoqqc1NZLi0PpV2ovCWmmnbmkT4Nv3M3bZcKCGjxgpVzuGWUG1j4XWXp
         Ju1iZAHRtRE0E6eAhtVc8emRDegIgV4533HgxRF/JrS1REcoC2BZzDFHKccyCaxdI7qY
         gjIw==
X-Forwarded-Encrypted: i=1; AJvYcCUtnnOBHCTnBdZ0NcC73NGplMj9voAOett1lJJ+eRv7QJ77fSpBX9hBENzGz44GAuP/Zi89y0HEzPppH/c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy0NBXreQ5VrSbQhGTIMiA/WZwpF4lztY21dfRcQ0CDsO1jQLSY
	CTkfUN7zZ6p1QqpjbiFeVvyjQDDliojQKFI+i8hOvvHpd8vQ3TjRFLciWJ68N3U=
X-Google-Smtp-Source: AGHT+IH1aaCnWxJ+190B4X3rRtI27v+kXSCMfEXtrprcgTAAwyxSHjsuSln+B4lGQpKN2Z0UMJ9hgw==
X-Received: by 2002:a05:6000:104a:b0:37e:f4ae:987d with SMTP id ffacd0b85a97d-38061159141mr7795045f8f.29.1730193813087;
        Tue, 29 Oct 2024 02:23:33 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b71479sm11836108f8f.69.2024.10.29.02.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 02:23:32 -0700 (PDT)
Date: Tue, 29 Oct 2024 10:23:31 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ivan Orlov <ivan.orlov0322@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] sound: Switch back to struct platform_driver::remove()
Message-ID: <mr7tjtqtmblum57yirmvfhzqg5rhyqdotlzn6kvjk4nlixyqrn@uyne6x2vefp6>
References: <20241029073748.508077-2-u.kleine-koenig@baylibre.com>
 <8734kf2sa6.wl-tiwai@suse.de>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e4aa3yd6q5uca44q"
Content-Disposition: inline
In-Reply-To: <8734kf2sa6.wl-tiwai@suse.de>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--e4aa3yd6q5uca44q
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] sound: Switch back to struct platform_driver::remove()
MIME-Version: 1.0

Hello Takashi,

On Tue, Oct 29, 2024 at 10:05:21AM +0100, Takashi Iwai wrote:
> On Tue, 29 Oct 2024 08:37:47 +0100,
> Uwe Kleine-K=F6nig wrote:
> >=20
> > After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> > return void") .remove() is (again) the right callback to implement for
> > platform drivers.
> >=20
> > Convert all platform drivers below sound to use .remove(), with
> > the eventual goal to drop struct platform_driver::remove_new(). As
> > .remove() and .remove_new() have the same prototypes, conversion is done
> > by just changing the structure member name in the driver initializer.
> >=20
> > On the way do a few whitespace changes to make indention consistent.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> > Hello,
> >=20
> > I did a single patch for all of sound. sound/soc was already converted
> > separately, so isn't mixed in here. While I usually prefer to do one
> > logical change per patch, this seems to be overengineering here as the
> > individual changes are really trivial and shouldn't be much in the way
> > for stable backports. But I'll happily split the patch if you prefer it
> > split.
>=20
> It's fine to do this in a single shot.
>=20
> I suppose this can be applied for 6.13, not necessarily to be merged
> for 6.12-rc?

Right, this is not critical and I consider this merge window material.
6.13-rc1 is fine.

Thanks
Uwe

--e4aa3yd6q5uca44q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcgqZEACgkQj4D7WH0S
/k7PTwf/RuQE2So+Bj2/unZ19jDNVY04i3Yaa0IrSvWShbO7Nv/nsVzANSVA6jUU
RRVMKI8AUoBJfFn4R+ZodJnwtjckrihdYHVIBnfB4krigFCmPCydnq1ANy0qMX+E
EbsWx9Q49q5Q7IQayl1BQA/PzL0GzKAase8VT+A9VlrJ5EHgz06aeEJtZTwutQKK
Q11L0Y0rkv/9abSCq1eyEDYvISb38m8iGr9J2iY7gAWVVuUmEkMqR816qixk7n2m
kPdT7cDib074IgZeN0ir30E+t4pT+IsIEDaelPwGia+A3iatvvG/D65jcThdIC9D
7GxxrOXjxiYz1IZcAJwESz+aYyScmA==
=w7Ha
-----END PGP SIGNATURE-----

--e4aa3yd6q5uca44q--

