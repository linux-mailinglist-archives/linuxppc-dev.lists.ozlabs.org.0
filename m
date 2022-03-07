Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBB44D0416
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 17:26:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KC3kH5sCRz3bY5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 03:26:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CpH6ITx2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CpH6ITx2; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KC3jf70s6z2xKJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 03:25:58 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 495F5B81630;
 Mon,  7 Mar 2022 16:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3A6C340E9;
 Mon,  7 Mar 2022 16:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646670354;
 bh=KpKI6qgGwDUwwLWxU1qaL2a44GAcKr4iZtGWpWGYJMs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CpH6ITx2pU0aJmp+sjZpLmce+nHz3VuHJ4vSd0yJFz7JN+yIbVvVTI7mMZvpazB5y
 2DOmmBplhkuHluzAoQQVGK80dcizAl8vdKoeCwXw0WWpv1gcLOMcmUPPbJ5d9wqrIW
 ChgohkIkSD0DTszRgc6XGXAml/QmqQzK1OyvxxWp4cp0uh/i1+gA4wCMKF1P1NuPzQ
 2PhwsFeOPqcimMgw4z2RtTFONcCdp/oTfAp/Ep9u7MuwyOY23p1Zl8V6kk6eXp9lTE
 eyLob+D7IiUflZ4KBqoYAcDIERFu5MljuYGci1vczIr08puMtYjO/OfhtvU1iJl7K9
 fVshh7WBcCxvA==
Date: Mon, 7 Mar 2022 16:25:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Alifer Moraes <alifer.m@variscite.com>
Subject: Re: [PATCH 4/4] ASoC: wm8904: add DMIC support
Message-ID: <YiYyC1MVd+oCMU4x@sirena.org.uk>
References: <20220307141041.27538-1-alifer.m@variscite.com>
 <20220307141041.27538-4-alifer.m@variscite.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1iwP804p5/iDUb1W"
Content-Disposition: inline
In-Reply-To: <20220307141041.27538-4-alifer.m@variscite.com>
X-Cookie: Whatever became of eternal truth?
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
Cc: pierluigi.p@variscite.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, eran.m@variscite.com,
 robh+dt@kernel.org, patches@opensource.cirrus.com, perex@perex.cz,
 festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--1iwP804p5/iDUb1W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 07, 2022 at 11:10:41AM -0300, Alifer Moraes wrote:

> +static const char *cin_text[] = {
> +	"ADC", "DMIC"
> +};
> +
> +static SOC_ENUM_SINGLE_DECL(cin_enum,
> +			    WM8904_DIGITAL_MICROPHONE_0, 12, cin_text);

Why would this be runtime selectable?  I'd expect the decision to use
an analogue or digital microphone to be made in the hardware design.

--1iwP804p5/iDUb1W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmImMgoACgkQJNaLcl1U
h9CVtwf+Nl6A9aOjLebqzdwWyr4hAKLag1cq9s4w8/dqa2QzayNcPU+m11c7Pc+v
LCTqp1AlwYRMPznHYVXQbIP6Vy3rK6XHJpfU5vlib/7VUfOCE3Od3rmsD+1OtvDX
QYgjz3RZz1TgeQaKHk5O77GUIhmw1xRSQI+kxuUu2I6JKmETEkOkcvgbF6NyR1oN
NBtwQe7cJhJ1QHhB0PoNrB5cK6LIPlNgrxB6rqFsXyz1tOYN+/ObjvgJHsC9kCUc
vr3cIPI1Hy5lw3vEyFJuqnP0FKcO/CZjb4Wbk0ZFqTBDkBiqFLJTaFWLsRzngEk+
Nnu6Iq3gFIdDvBfmoAUHTBmB7dsKhw==
=Rd11
-----END PGP SIGNATURE-----

--1iwP804p5/iDUb1W--
