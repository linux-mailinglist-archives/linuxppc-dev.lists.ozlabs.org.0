Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C56A5B414
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 19:20:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44ryNW1B4jzDqLv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 03:20:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=sirena.org.uk
 (client-ip=2a01:7e01::f03c:91ff:fed4:a3b6; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="daPx8Yik"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ryL002SnzDqQK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 03:17:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Ni2YRPbf4GMMunOYWIHYcrCRiFTp5FPuVt13sVOpXA=; b=daPx8YikwrUepaPWMqT4aN8tI
 SsXhwvgRFVOFZwsMtbroir3Z3uFn2W3wa/io6Npseaelpj5R4Sx10dcqtBSDhLWea/OenRSOJzpt+
 LmrSZnN7aIPhLKz5XY+Vdel7xQqa5tYtZR53RQatBvM5tjlZURKGKY3nLlR4iVaDcDDZQ=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKQxS-0004YI-UN; Sat, 27 Apr 2019 17:17:51 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 1E81C441D3B; Sat, 27 Apr 2019 18:17:46 +0100 (BST)
Date: Sat, 27 Apr 2019 18:17:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH 2/3 v2] ASoC: fsl_sai: Add support for runtime pm
Message-ID: <20190427171746.GG14916@sirena.org.uk>
References: <20190421193853.10188-1-daniel.baluta@nxp.com>
 <20190421193853.10188-3-daniel.baluta@nxp.com>
 <20190426100025.GD14916@sirena.org.uk>
 <CAEnQRZCPPr1iHvKEj=fOsE8A2iW=XZd=CaoFqAoUqJftg4pN9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p7qwJlK53pWzbayA"
Content-Disposition: inline
In-Reply-To: <CAEnQRZCPPr1iHvKEj=fOsE8A2iW=XZd=CaoFqAoUqJftg4pN9Q@mail.gmail.com>
X-Cookie: -- I have seen the FUN --
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--p7qwJlK53pWzbayA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 26, 2019 at 03:10:10PM +0300, Daniel Baluta wrote:

> The only patch left in the series that needs to be applied is this:

> https://www.spinics.net/lists/alsa-devel/msg89733.html

> I will reply also to that email, to be easier for you to find it.

Content free pings don't help...

--p7qwJlK53pWzbayA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzEjrkACgkQJNaLcl1U
h9AWVwf+KSlrvfBfUuZMLNHSHD7WREpZgHjLFsCPB8QHrdYC2CjypGjl9cjkYFDL
zvVk9IotX8UodiLJN5KwgU9eO38JRbxXR+oVTN4+HnRIJv690m8LztYI9tAcqGIp
2BvosaU2xv5RTitkpD8v3rykVDyAvDNvYDWK6gj8/Mz4UHi68onYaKMmoDNTnTKC
9jAwU6oCeivjDydZIzMbyoQb1lUBpeHXHZrTn4e8iar9AfOEGEoR8QEhD+7D5k01
y/t2YU6KD1U9YlHUK+FEfUeXLAMslI4284MVKw960xesrxvOcSltnQozVvR/tESL
a+JaBF7FAsQc29UsdOCjSKKubkfKQw==
=phjH
-----END PGP SIGNATURE-----

--p7qwJlK53pWzbayA--
