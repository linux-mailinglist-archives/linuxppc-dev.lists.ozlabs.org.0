Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 255EDAF9E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 12:06:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SyGg6S8nzF2FN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 20:06:19 +1000 (AEST)
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
 header.b="SyVqUXDT"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SyD50KWHzF27c
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 20:04:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jfmz88C6lrhs31cRlnO49TRqP1LMaWlkChTQG4q+Yew=; b=SyVqUXDTdYWAInG1jgsHwaWdH
 tFuY19DeE6XUnOA8U1ciXF7ZiKrzizIVnnPTY6a92MPIuOvWPmsjgqyQtrNbBWMkLEq0JsiR9WWN1
 cQeZAgZYhaSoiYcVYR/4luC1DZDJWUAVMCNaegctmk9+yh50ZCeqva6nVQmNIi4/WDrOQ=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i7zTd-0007XI-4R; Wed, 11 Sep 2019 10:03:53 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 87284D02D76; Wed, 11 Sep 2019 11:03:52 +0100 (BST)
Date: Wed, 11 Sep 2019 11:03:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_mqs: add DT binding documentation
Message-ID: <20190911100352.GS2036@sirena.org.uk>
References: <cff8bff1e8d3334fa308ddfcec266a5284e3c858.1568169346.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="//h4sZKAxcnndsN6"
Content-Disposition: inline
In-Reply-To: <cff8bff1e8d3334fa308ddfcec266a5284e3c858.1568169346.git.shengjiu.wang@nxp.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, nicoleotsuka@gmail.com, robh+dt@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--//h4sZKAxcnndsN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 11, 2019 at 10:42:38AM -0400, Shengjiu Wang wrote:

> +  - gpr : The gpr node.

What is a gpr node?

--//h4sZKAxcnndsN6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl14xocACgkQJNaLcl1U
h9DCkQf/boGjyVueB4AhrIMUugvRHAK7g8btFd64V3bz8anjolHMklTWGGeE9FGv
Z0dIvqYu+GNy8SdEDagnH4ZqeiGhgDyeNLCPCSg++HgsJLsw2PadGfxpIagEPm1X
5MXKVBiRW31EKo8d58xRsNVbWdWpkNsMW/4JiTRQR6IZ4op8DxAqGmpWpvjuAcPZ
KBNo78YpmO3x+stm5dC9zAXWro0NzcMu2G98bLWAHieY5yT8v7aQDFZtPvNRjxNr
2IyRhZDcE1NU+Kbi8QGKYtmTYICdgJtt4wsx2k4GZ9/+SXx+d+HL6UHu67imQm6N
/0diiJmTf9MkEXh05p1whRrAXYKiyA==
=XX1U
-----END PGP SIGNATURE-----

--//h4sZKAxcnndsN6--
