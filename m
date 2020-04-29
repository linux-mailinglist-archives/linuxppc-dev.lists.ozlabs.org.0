Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5A91BE097
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 16:18:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49C0xM2SLpzDqLd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 00:18:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=q/DOOSTb; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C0rt6f6XzDqLM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 00:14:54 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D77BE206B8;
 Wed, 29 Apr 2020 14:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588169690;
 bh=43u72/t/ee5ojO4oVLnLby9cPaSn1J3/cJbGM3NvKqA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q/DOOSTbPKc+xKJLH+AfDJ9GyvLsoxLf4W6Jh5vUtR2dTsdFlyiiyHaTTW5M4I3Md
 7K9pEv5tgIEftLbJ7Mv7ISf68HCuyKQWOewny9CHLhftj2OT2aG9GFwjcAJnljkrWw
 86L3hTwWlwWuHU7sQrn2k7Fq5hB2tRfxGeej34a8=
Date: Wed, 29 Apr 2020 15:14:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_easrc: Check NULL pinter before dereference
Message-ID: <20200429141447.GA7115@sirena.org.uk>
References: <1587731404-29750-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <1587731404-29750-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Colors may fade in time.
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
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, nicoleotsuka@gmail.com, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 24, 2020 at 08:30:04PM +0800, Shengjiu Wang wrote:
> The patch 955ac624058f: "ASoC: fsl_easrc: Add EASRC ASoC CPU DAI
> drivers" from Apr 16, 2020, leads to the following Smatch complaint:

This doesn't apply against current code, please check and resend.

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6pi9cACgkQJNaLcl1U
h9ABhgf/Uk314RG7VeGN0KlDEV4ZB3mUNgKCSP9bX8M2Qvz69PM7MUKLD3rRJf0m
vlTonmGIhCOWSdlO2wv3hGVZpvGBVGEZqVAvhNjR6FhYKGkxwRtorX2ST1YVJtOQ
EwhPHr8mLG9PEpgqKI6AP04IWYb4oMjSnBENXghM5OsN8yo6kcTXGKmghbArxlIN
KXafD8ZgEy+U2roducwWjOZeSfIj9agN5F+so91mH883uymDWGAiWQ/g4AkxdJRx
Qdl0xw10BAwSKTZ+Nc2aJTHEs+ZzCLfxq+d4X7aGSJ4wBk/7ZdtmGsw+yxxFux/L
9HFw4EnfuD5Imx5whPbJd6WJ7yIkzg==
=X07d
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
