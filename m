Return-Path: <linuxppc-dev+bounces-3221-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A74A9C8D8B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 16:04:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq3MM16msz2ysb;
	Fri, 15 Nov 2024 02:03:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731596639;
	cv=none; b=EFbl1RRLOuOWAzXAf5ej4ibEI2YaSuInUYv1tBKuzgSMxWoCvnWJOQKBIjHWaUBPUsGAeHxuThUkJrwAnJTL1Y6So/DaoaxBktxvNwKoSmJ04gSRSS/T647DhRFRrtde+GedDWPdRDifAuxIS5slxW1+HHm8KiojRGr3kL5vuORNb8/aMHZyaR/Nhbgcn9D5uBlji1aufnRkZtQxVGuQ1spK4vhbmEU7G/22S1X7mBg3JlWMrfL5SaIoAcWF2Wjc2XPd+TwLEcvnVU51sUXNWBoYaIRTndSYQzGxkzOhqm9KkxIFDCFy3CmkqLKZIERtBl4DFajqND2SdjB/bN0qDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731596639; c=relaxed/relaxed;
	bh=dRsJqeYZfBgIesQfn/MHcP7T/a2QWpqLVvkqC7gdriE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5m/YtHJyXKOzObA+BMA0cu4WVaJuom/YZV//OJYjeg0IpSqwOEQuQ+1xwC35MY1CTFXxFXExoWBnhE2hriWYm7CcwAw2Ht1pB7EtB+pw5x2Ob5MtxTn73cfoiI7OcLIvqoEINX3E7BS+X9H5+yxSoG9ThOyKlSykPTAs3epOME98hkxOJKooIpLiBXZNCiaNn5p5NagxHbuXeyXmkHH7MkE/fO+xxPGF1nN9QwHsWlMCPAU6NPGfOKaViAN6woeGQ878TXQrcEUggDcjYNHY8PAe4E90X1JRDg7kToXa+IE+JzjFEgF0AqPkB1a4wwuDlHHYUYt0rcJsat+06Vavg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=TPg2wrns; dkim-atps=neutral; spf=pass (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=sang-engineering.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=TPg2wrns;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 396 seconds by postgrey-1.37 at boromir; Fri, 15 Nov 2024 02:03:53 AEDT
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq3MF3Ldwz2ynL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 02:03:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=dRsJ
	qeYZfBgIesQfn/MHcP7T/a2QWpqLVvkqC7gdriE=; b=TPg2wrnsiZu1NYDo0UWQ
	WWGaj67MS0s9qoeBXwcUmvL6YpuoQuDzh409d61LeLTl02dCuil29KbG0ReeCImf
	P9vm6WmT4lHb1ArPYSJL2G4kbgTB9kaknO+ZhDjpwn1PTO0KyPQADDYyrvAxBnqb
	eCgDHKrpqdAnkswYs4xbS6IZxfwXImZrg4MfcX8wB+JbsoDI42pK7QfUlrFX1h8r
	cC2qFgUG3JVv2bExD0BeLSbVGmm0A4P7cuxQ6r9/s/3vAxV8gi2+aKcXCZe0OYz1
	2Tvcv1v5UWcNuO6oMtOXOuBshikV0regki5T0UFd/WPDZ44w4u/rNN8dsjiSxqpn
	Pw==
Received: (qmail 3195118 invoked from network); 14 Nov 2024 15:57:08 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Nov 2024 15:57:08 +0100
X-UD-Smtp-Session: l3s3148p1@nFYUquAmstJehhtH
Date: Thu, 14 Nov 2024 15:57:08 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, arnd@arndb.de,
	Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [RFC PATCH 09/10] i2c: Remove I2C_HYDRA
Message-ID: <ZzYPxBvZ44pMzeJN@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	arnd@arndb.de, Linux I2C <linux-i2c@vger.kernel.org>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
 <20241114131114.602234-9-mpe@ellerman.id.au>
 <CAMuHMdXLM-eeAa9=YwkU6gcwmD60Wba5v=F6PU20QMqzxRbM4w@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="b3oYDcQCh8M8X+Z5"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXLM-eeAa9=YwkU6gcwmD60Wba5v=F6PU20QMqzxRbM4w@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--b3oYDcQCh8M8X+Z5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 03:37:15PM +0100, Geert Uytterhoeven wrote:
> CC linux-i2c
>=20
> On Thu, Nov 14, 2024 at 2:11=E2=80=AFPM Michael Ellerman <mpe@ellerman.id=
=2Eau> wrote:
> > The i2c-hydra driver depends on PPC_CHRP which has now been removed,
> > remove the driver also.
> >
> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>=20
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>=20
> > ---

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--b3oYDcQCh8M8X+Z5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmc2D8AACgkQFA3kzBSg
KbYpqQ//cTHdKtv+OT5iUTvVPKKtfZLUlFRc3Sf4Y0Ui+JFxjueaUVzQ16CzDyy8
VcRTIJHL2t4AjIpp1LSAVp8Tcc7xJTEiksfx6ycdnIXgnvvgk/RaCz5gwMH+1W+j
U6QMG1b1tVoFZF69zHn7G6XU84cvqPO8JdUuZB0WGbzAKZcbsIKoagg2LykuZa5h
BWC21WX9Ze+Vkao46dtUKvrkWA63u89a3xlv4yoFjlkEVwCd1fXYqoLMFEjiVtk+
2ouXqCX73imUI66OWlBnoNGuhwuh+RAnuHlnu8eskko6ggILkRUZ87SZWd1WR4x2
fkduX62y8/B+qVFuKPqmWV+2lR38fwEU2CY72Ild4XtgPaBX5wyFAAdVDGaE14er
94saEMP2pHWJXNTa/AuH/PV4cSZcRUVzDm5kcRaEj2hQkn4u8YTPlCCIvyJ8Dnjr
TpxKl4PxmSYaVGYlyLwbD8oM5JsTiyOcZNBshLCvJE1IHdgKsJZiIMSiBs6Itazl
/mRksfIhshodHSS/ebydCbHQTWp1LAKTJDeqxvw2fuq2W0ZAigtkc67qisWJEQ53
p7r0iccjMim8QrhGROyxZCE+50JxuqVoKRgsgTuG53jIYjETzGcumqrqAVhskxWR
vZljCognLV9cSah+JDPKZ9oovcJ2pfxSjyL314DQF4hvkMgGmIQ=
=t0n4
-----END PGP SIGNATURE-----

--b3oYDcQCh8M8X+Z5--

