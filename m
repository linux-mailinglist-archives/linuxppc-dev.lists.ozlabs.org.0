Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30631AFB2A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 13:10:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Szh63cKdzF32G
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 21:09:58 +1000 (AEST)
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
 header.b="qK7u45WB"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Szf81XfgzF31M
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 21:08:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HHnXmjuPtzS2mOWRO4aXJSHL1FSaP/89qlf1dDrZaEE=; b=qK7u45WBdtW6VEw40C6FxeWOV
 TomAOJYtYL8dsv7+JXT0kLU+drfE1E/Z6mE4zWCgcOXC3ybMerTnM1uvNko2zCF6ExJLedM6oEnl0
 xpmIwJrtBW4K6IKp60dsSjADNbuq2+Ip7RAq4yX6CVESBdxmCboPFgiP3y1/OhtRQAQHY=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i80To-0008Rd-Kh; Wed, 11 Sep 2019 11:08:08 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id E841FD00451; Wed, 11 Sep 2019 12:08:07 +0100 (BST)
Date: Wed, 11 Sep 2019 12:08:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl_asrc: Fix error with S24_3LE format
 bitstream in i.MX8
Message-ID: <20190911110807.GB2036@sirena.org.uk>
References: <cover.1568025083.git.shengjiu.wang@nxp.com>
 <2b6e028ca27b8569da4ab7868d7b90ff8c3225d0.1568025083.git.shengjiu.wang@nxp.com>
 <20190910015212.GA16760@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1ozVqH6bFr/3sC51"
Content-Disposition: inline
In-Reply-To: <20190910015212.GA16760@Asurada-Nvidia.nvidia.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--1ozVqH6bFr/3sC51
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 09, 2019 at 06:52:13PM -0700, Nicolin Chen wrote:

> And a quick feeling is that below code is mostly identical to what
> is in the soc-generic-dmaengine-pcm.c file. So I'm wondering if we
> could abstract a helper function somewhere in the ASoC core: Mark?

That's roughly what sound/core/pcm_dmaengine.c is doing -
possibly we should move more stuff into there.

--1ozVqH6bFr/3sC51
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl141ZcACgkQJNaLcl1U
h9BiLAf/TB2E4wy6DNKmjy1tOffUwKYDmy9RgufK7HCIINZHzoiiwRgXY0IcsAnQ
/l2Qpn8LKUi3uc4Db4urdP6TaWvOecadb/PX8ifkRVAUSIEWkbYumPmdfNeKQ2Sq
oUXlxF682VrGakytUZlz4dh/BFhiWxda52tfs4WUuzO4TyHjpmCM3dZg3Em3J536
FjgP4H1tnb1d/6j1am+7o5b4YBuQRmYo39ZJrEHOCliEZk6L7ycncUV+Ye4QSYCk
iOYjeb9FmZxK0JZErs0Eu7rXsk5JZQptegeJ8kTSZv7darXCSpVltusGB92mMij5
akx0MmeZQdSoM83elUgbLWuJtBnkjQ==
=7lNC
-----END PGP SIGNATURE-----

--1ozVqH6bFr/3sC51--
