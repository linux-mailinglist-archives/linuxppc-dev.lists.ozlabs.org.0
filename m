Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 572D0212864
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 17:46:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yMs519hbzDqRY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 01:46:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=uXPoXcMN; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yMm46KM2zDqMv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 01:42:12 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A6AB208B8;
 Thu,  2 Jul 2020 15:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593704530;
 bh=3KFnK04vEi7SoR61rRMArD9b+BR7w1+k2R0YFZiePIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uXPoXcMNttT4jMn3+4BYmyeU01d4W2Mwcu1xJ7hI/S7P7RDqiNSek7TOZGa01uyLt
 URHmF5er8VNTpSNU52TEL/qkdUTT7kai/UGGQpku5+C/5aqPwntmUilLbQXqKC7Lbx
 PYdK7osKLzpwAWRFGK8g2ISveoUzKfhXMwmkJV8I=
Date: Thu, 2 Jul 2020 16:42:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: fsl-asoc-card: add new
 compatible for I2S slave
Message-ID: <20200702154207.GK4483@sirena.org.uk>
References: <20200702141114.232688-1-arnaud.ferraris@collabora.com>
 <20200702141114.232688-2-arnaud.ferraris@collabora.com>
 <20200702143145.GG4483@sirena.org.uk>
 <5de5ea5b-0716-8ed1-28b0-9ad3da7a2d47@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2feizKym29CxAecD"
Content-Disposition: inline
In-Reply-To: <5de5ea5b-0716-8ed1-28b0-9ad3da7a2d47@collabora.com>
X-Cookie: I'm rated PG-34!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--2feizKym29CxAecD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2020 at 05:28:03PM +0200, Arnaud Ferraris wrote:
> Le 02/07/2020 =E0 16:31, Mark Brown a =E9crit=A0:

> > Why require that the CODEC be clock master here - why not make this
> > configurable, reusing the properties from the generic and audio graph
> > cards?

> This is partly because I'm not sure how to do it (yet), but mostly
> because I don't have the hardware to test this (the 2 CODECs present on
> my only i.MX6 board are both clock master)

Take a look at what the generic cards are doing, it's a library function=20
asoc_simple_parse_daifmt().  It's not the end of the world if you can't
test it properly - if it turns out it's buggy somehow someone can always
fix the code later but an ABI is an ABI so we can't change it.

--2feizKym29CxAecD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7+AE4ACgkQJNaLcl1U
h9BYwQf+LRu606rmfYnqmbLMDcS82XnfLlMQpCccSxt5qRFkxPvsZqA1zoQUrt0n
o8061rU3fHuwt17/Mp4D0SbC4g9EGRIon64yUii1nqoPIHEgYWVQ+F7sOPTKVKD5
Z3LD+zP06AyjJxRDJ4+4pHRWpzQL2jxziBsxgQdp4W5mfU6fV3x5BvqdN1chcOPa
TmgXdbKXfoR1Q/HIaU0CH2PVjh94BZqRRMPs5++X7xDcCUCsYUY6GW+GS1tEXQPj
IdJ2Rgmt3M0273RzUlFQX8+akH03BBTlIJ8eCUYIp4H8dedN5w/2eXqjIOUIMnsT
zv1pY4Ufcdm6Uzc6A47isxUHlg565Q==
=K6iJ
-----END PGP SIGNATURE-----

--2feizKym29CxAecD--
