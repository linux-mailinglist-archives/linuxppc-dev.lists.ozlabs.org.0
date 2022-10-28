Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFA66115AD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 17:17:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzR3b3gF8z3cJd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 02:16:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q11wdu/k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q11wdu/k;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzR2f2gNKz30NS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 02:16:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 484CD62909;
	Fri, 28 Oct 2022 15:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6307BC433D6;
	Fri, 28 Oct 2022 15:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666970166;
	bh=AcI+yswH+2IbcHUpYNQ9KmXw7+ZnsTQFzdaCM3sr5zU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q11wdu/kZuFgRdKuJnGuJzp2/PsP9miDo3cwvfWcWFLL6T7QPrwNN90pz1Rar9G2r
	 F0z8VW4AJckbaBeV7bfAfS7MPFxX/7NBlLcLKJnQ775AHHw0GarOEoPKZZL2bqwRjO
	 Gk2hMWVBbMV5HGdkc3vdbzxV26uwBDosGSzFv7whAL8X1rljBpdqjGuGirNr33Oj9m
	 2aeHDSvqDCzq1u0xwLea3wuD7dvIAAmRoyOQ88mkMqLwb7n2x3F75WzGeTtPkR2HXX
	 /VTdk66bElhVbLzLsNquZQCePtqP4yf19HrMU3FY6nsrzqrTNW+kVNw89zQBoF/Khl
	 gAWcM695Ah8Zg==
Date: Fri, 28 Oct 2022 16:16:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Maarten Zanders <maarten.zanders@mind.be>
Subject: Re: [PATCH] ASoC: fsl_asrc fsl_esai fsl_sai: allow CONFIG_PM=N
Message-ID: <Y1vyMQ8Jj7/smeC6@sirena.org.uk>
References: <20221028141129.100702-1-maarten.zanders@mind.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5YV3kYcAJnGOoxea"
Content-Disposition: inline
In-Reply-To: <20221028141129.100702-1-maarten.zanders@mind.be>
X-Cookie: Life -- Love It or Leave It.
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--5YV3kYcAJnGOoxea
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 28, 2022 at 04:11:28PM +0200, Maarten Zanders wrote:

> This commit fixes:
> cab04ab (ASoC: fsl_asrc: Don't use devm_regmap_init_mmio_clk)
> 203773e (ASoC: fsl_esai: Don't use devm_regmap_init_mmio_clk)
> 2277e7e (ASoC: fsl_sai: Don't use devm_regmap_init_mmio_clk)

Please use 12 character hashes for disambiguation.

--5YV3kYcAJnGOoxea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNb8jAACgkQJNaLcl1U
h9BPkwf+JDWLwUW4JY8Nn+45+cQNp7ekugOkKUUyMa5cWq66XKGMsFYPkbx6YNay
H2eN9b4GeQtYwkLRkf50yidDuVkevyxVQJ7FIX7Tq9+/Th6RPiydXixG1iegEI/Q
4lCMamv4jAigNGi6ZcVFpehuxicesCFLVNISNJscEaM6kY14lP8Bgygw/2YKez/0
B1fq09ZE2oDFerrjUid5+CCEPwOO7DEH4rX4kEuCtSUO6cJfNSgSRF0/qczNbkYM
BXmPfkFUjvBmQEhX0n2dy/LWWEixRiGOJOpKoOK7kQmo3sIrZW/WepTrDGoTQ0GQ
PYMB8pzbp4O270F4CpI7NvUz/FqsYQ==
=UpvD
-----END PGP SIGNATURE-----

--5YV3kYcAJnGOoxea--
