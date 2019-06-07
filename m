Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DB5388B9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 13:14:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45L0KZ3hv8zDqty
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 21:14:26 +1000 (AEST)
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
 header.b="AWxRGyzY"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45L0Hr5HbZzDqSN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 21:12:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AspmKVjY7mJ8HlX6+G0jU6RWDgqTyzyWO77BW5lTioo=; b=AWxRGyzYu+UByYRVNF7xUoTci
 K9YJ7T+ee4KHFo/QooSYiSQYK+GMd9yWh6ldoSQK+1uBDAtTov4FoBIII1Z6AwYjhDhX7/7bJV4uK
 +OI9NFxvCnZIOTyDT+ITbW5MQ2wOj5DEQV7XTUtGeasr5KyirCok5/hC6m8n9KyfKSJFM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hZCnd-0001iM-BW; Fri, 07 Jun 2019 11:12:45 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 4F0CA440046; Fri,  7 Jun 2019 12:12:44 +0100 (BST)
Date: Fri, 7 Jun 2019 12:12:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [RFC/RFT PATCH] Revert "ASoC: fsl_esai: ETDR and TX0~5 registers
 are non volatile"
Message-ID: <20190607111244.GE2456@sirena.org.uk>
References: <20190606230105.4385-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cnnC1+vf4lqgEF19"
Content-Disposition: inline
In-Reply-To: <20190606230105.4385-1-nicoleotsuka@gmail.com>
X-Cookie: The other line moves faster.
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
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com, tiwai@suse.com,
 lgirdwood@gmail.com, perex@perex.cz, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--cnnC1+vf4lqgEF19
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 06, 2019 at 04:01:05PM -0700, Nicolin Chen wrote:
> This reverts commit 8973112aa41b8ad956a5b47f2fe17bc2a5cf2645.

Please use subject lines matching the style for the subsystem.  This
makes it easier for people to identify relevant patches.

> 1) Though ETDR and TX0~5 are not volatile but write-only registers,
>    they should not be cached either. According to the definition of
>    "volatile_reg", one should be put in the volatile list if it can
>    not be cached.

There's no problem with caching write only registers, having a cache
allows one to do read/modify/write cycles on them and can help with
debugging.  The original reason we had cache code in ASoC was for write
only devices.

--cnnC1+vf4lqgEF19
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz6RqkACgkQJNaLcl1U
h9Co7Qf7Bkg3ndyaPGB0nY7y53/txpehf1drjHOKGiWoZ0+zJMVKS1VxMRflVs5s
/jl1lph0ebC8gfz/UipI3j7ZrLPd1tRsasfmuIpa4aDTAd5h3ekJe2uMHyxDiATf
+riYjRV5ZiBQ5EFVZQN2j9VMvtJGfaLsDD6Wkc4laIvAevPThDKrs5YLyiH/ncrn
q1RktO/C3gfdAuUd0x0oGbHOlpXuMw8AaT0I6NNonOM5GlLqDq0jUw9Or/WdOepk
UMskpFmlTMYNm9AcJGvZ2JemvZ+fYCZUs+1nU2h6+MgEBIs1DqvdYagwnFXb4K1J
ZkaAUBJ2IdDf+r2aYfr+BVFEUIjuPA==
=AgxG
-----END PGP SIGNATURE-----

--cnnC1+vf4lqgEF19--
