Return-Path: <linuxppc-dev+bounces-14572-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F04A4C9D380
	for <lists+linuxppc-dev@lfdr.de>; Tue, 02 Dec 2025 23:34:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLbD624VMz3c4y;
	Wed, 03 Dec 2025 09:34:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764714854;
	cv=none; b=b00dchxJ4Xsn5kUFIZD8b9WQvzpHgHSfBOL0pbJzyxRnYEjajNiIpc193xh+V0NcyaPcniqGGjOWFmH9WlLJ2SOhYFdLtR9RRqQCuFnpO4J4K6jbNI+i1IXnv2mr8IaJ/MTNLNK1337RzMIVC+hYayYduR49EoXNvyVf8CFPnZzNW6SR9d92RYRZeRl8FvpIG9uz1xbkrnAHRd0ebL4Fwf5j+AEqmTmHxIGxm9TJLBXlS7FLDPZlsxnanjS1tqq/uK+0jPFb5FS/1B9KdyZ73ZrUQcy4BaeZL1oHqmLMzEdtbOLV4/1UoBmlDFGiWIgrllZClrSx8PaxQVAL/oHG1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764714854; c=relaxed/relaxed;
	bh=i1iWK7HzBETWByZIaP7P7npHDZXzi12UJs1BJ0A4xzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=on+i/ubgJx9eXJcjXIapMce2X27NPmdK3rV3x2PTqwm5gR8W/KGqUsRJiTmiBbnlFQOD0D2J7xG4lH0pfS8e/WqSavZtuRfGJxZ7h2woqOvHOvErrfzOJOQZK0WLJw95lJEdbhKxV3qny+MXmrWSkm1H8oJAq2+l6MlX3czjcKi/PwpyeS4mKHT4D6W8R1O4TvGYSdhdhfnRAO5VIsAA8dnr9ESiHA4I+0TCxZLKYDhLDQ7CYk5vJWDpERMlGuBrTq7w6L232ewFtFUgLjqsW/TuKp9X54dGn6fJU7lsaor7rgH4Ag1GsmLQqBf5vnflyjX/FrQmz7BEFbBjt4sn4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=2vz05kRM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=2vz05kRM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLbD368vNz3bn8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Dec 2025 09:34:10 +1100 (AEDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b79b9113651so316352466b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Dec 2025 14:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764714845; x=1765319645; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i1iWK7HzBETWByZIaP7P7npHDZXzi12UJs1BJ0A4xzs=;
        b=2vz05kRMqO4fq8KBtURf7KQ036FRa2WQWq46WJXfKiZezXjGPE2tM7qyWcVB17yZ+6
         QqW3fTogRpXQDNmNiWr2VYvnKxdm0oy+RGOXI9nkpMlK7pdSyNbltd9zFLy8QHeIZbv7
         SX9z1Fxy6c54GdGpPoIuqDpCzzW2KnBkVpCbayszhuSB2TocicGCW9xnqWmoCm9JpGlV
         n8qUnWjogmfjKU19vueHMqKtUAtvyJ0mSmy86uAirJBle+smuxiNge773aAzzNzWCg0W
         CW1934fvtr9SWZFxc3Nq+IC7Lgfc2z8UQ8D3TJlVi9XwRAzcUNE+yd5DGQ900zObmhaJ
         Vd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764714845; x=1765319645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1iWK7HzBETWByZIaP7P7npHDZXzi12UJs1BJ0A4xzs=;
        b=HafG636yES0ZbpVbdJl5STd3zgglFnUXwr50A1xRL+eSvNSMssrpgae59efB4Zb3EU
         ne59XZk2Lc+9GAejD4u2aHtmFquFB8smgCQFRinLwKVCe6NP6tvfXBRXeObkqGQdrc8F
         UawvAc4YTgcRbVG7Du5EPK2uoWV7Ttbf8NEqJWoA9r+2MqfAcDMtJt5KkTe2MQBweS0a
         Uw5EHWqIiRHaesmzav/uRjg0fHIILQR+RP6MZ7GaLN2jMGZQM1+q0HGb11ZEfNYYnQCP
         4QvWq97w3kEeRgNa29M/T8SavtPW2W0fGEjtAQNZQJxGnY6n0GYBi2hHoGO4h4/06xLm
         IGTg==
X-Forwarded-Encrypted: i=1; AJvYcCUw7ETDCeioy/OPchZBuxgzif3bGm5Q9bjuDBr/msz41pFjf+ZoxxgjadK5AxK4cwsj52KOGnZ8he6ZLK8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyRCrRXgxbNBiTLKSDi6Qg7+9SZ9aiSVPJ8sjKiEhFboyIYfJ0I
	o4jMaxcRQoQLGsuUeVIENYgPUnsCSa/D2TbJNQTp7I/e1jZvIzoYWmryipkqx2eFFNs=
X-Gm-Gg: ASbGnctsCN0+/DmlovBFCw3Txo9PL5aoMqeOGYO3xNZRFXmH4fSVRbT9pnKFCGpwn1F
	Ck9OlhceLsr4CvYDztxAL1oAk8S5rPuNs/Ye9rDNCgNijPXtImxwd/BINZLtZIQTlVDL8/dj1Rn
	fDRHxlWM4SVT2bavC2D7a8a3hm6AukHH/c6tILOW1cOGA5eJRZ3kFm9M+ynyoMFQEsQc/Vex+P5
	O7mvUo5Sgi2OAoGb+u+hA4Z04GMdDx6BfPOTlZ760pFgkakcDkNG6C591qYcEWRdF4sxRDlYT1d
	QiMfbqnf71wXRFxY6bSjtmlUw7Ky1/3AdnLOsMMIqPjejzi7V4t/z/tl23Q09oTqFqWlIp9r0d9
	covCr1b99aN7hZF77uLlsSBJs80QAQRo8n79XP/mPMcgEWSHPlL8ZnwtT1pHC0OsZgNycyyfex8
	dRO3hGOCPMBF9w0hZE
X-Google-Smtp-Source: AGHT+IEhD3Zywc+9GoO6m5s6v97El3zg9UavfzIOuA3BhbneVmlAi+ti1PX/xaT32pN3YSr/QKkGVQ==
X-Received: by 2002:a17:907:6ea4:b0:b72:b433:1bb2 with SMTP id a640c23a62f3a-b79dbec8a63mr1272866b.7.1764714844713;
        Tue, 02 Dec 2025 14:34:04 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f59a6a74sm1631218266b.45.2025.12.02.14.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 14:34:04 -0800 (PST)
Date: Tue, 2 Dec 2025 23:34:02 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] bus: fsl-mc: Convert to bus callbacks
Message-ID: <l6m65shnnd2ulgzmbaydtowrdmuskjvy6c7lxjgie6x5okxgt5@fa56vfytbszn>
References: <cover.1764684327.git.u.kleine-koenig@baylibre.com>
 <848fffe5c479d899c04a4c99ccb5f0128ccc942d.1764684327.git.u.kleine-koenig@baylibre.com>
 <2025120253-bullseye-diaper-8bd9@gregkh>
 <crbruv2pp24ljufun5ki3ow3ips326tpuitxch464b2iuhwwem@i2yf5wynizvl>
 <667c52f6-ee74-4d8b-b683-c1c7027467d0@kernel.org>
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
	protocol="application/pgp-signature"; boundary="i4xjjg3cyowidsmm"
Content-Disposition: inline
In-Reply-To: <667c52f6-ee74-4d8b-b683-c1c7027467d0@kernel.org>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--i4xjjg3cyowidsmm
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] bus: fsl-mc: Convert to bus callbacks
MIME-Version: 1.0

Hello Christophe,

On Tue, Dec 02, 2025 at 06:47:52PM +0100, Christophe Leroy (CS GROUP) wrote:
> Le 02/12/2025 =E0 17:07, Uwe Kleine-K=F6nig a =E9crit=A0:
> > I wonder what the merge plan for this series is. The last changes to
> > drivers/fsl-mc were merged by Christophe Leroy (added to Cc:)
>=20
> As per https://lore.kernel.org/all/2xzljdzktgpsyag5jhfwbxc2sroaacljecsq36=
hlxefu6jnz6g@zlorxu7niqnq/
>=20
> Also see commit 586739b1e8b1 ("MAINTAINERS: add the linuppc-dev list to t=
he
> fsl-mc bus entry")

Ok, the fact that was unexpected by me is, that you, as the one who
picks up patches, are not listed in MAINTAINERS. But it seems to work
fine.

> It is a bit late for v6.19 though, will go in v6.20 ?

I'm in no hurry, getting it into 6.20 is completely fine for me. Thanks
for picking my patches up.

Best regards
Uwe

--i4xjjg3cyowidsmm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkvaU4ACgkQj4D7WH0S
/k605AgApNBwNGKrsH0Vkh8KrXIDV5+Y3NbwlyJ2z4eZ+ELZpnidpZ3GAT+yprvi
hMkgkq4NOk+McXXAxX70nffMF5vtQbXXNssobl+elRKGsTIgbEPHQSfdZABmNGP9
Uz3swqTcRhUGgA3f84HCeABCFyfaWO26Xo35/sGmENaCt+C7C30qDGeNihD9dXft
xLKu3K56pNAuLUa7LgFH065QSgiRHRzTUxzo9O32lfac5ql3meRLS42hvyPSLUG0
n9COxUJMz3cWYQ3v0UhttRAdrnfiozTZlEz/cdi80sDjefbk7FtMe8sHajVr6nWw
APfmxqnhaYWoYzZUEKuFgSff02j4kg==
=ocyn
-----END PGP SIGNATURE-----

--i4xjjg3cyowidsmm--

