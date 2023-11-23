Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 547A17F64A5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 18:01:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MtCQPBEX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sbks921MJz3dTk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 04:01:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MtCQPBEX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbkrH6G6pz3dHf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 04:00:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD4C962272;
	Thu, 23 Nov 2023 17:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15857C433CC;
	Thu, 23 Nov 2023 17:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700758811;
	bh=8F/jiguRcq32VOINzefmDyYIkXt/3k3NK5/RQR1wYU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MtCQPBEXWTX4xUsNeYiJze7scCumxb+pLoonCyIRI3n/ioJzllWZCfbTm679Z2sxX
	 KSA/OIwXxihNsDYi5Tw8H+l7+2FnI0exz8p3+aDp/ZCcqWyK2WGR0VRKyiuMgGLdQ6
	 MKe4G90ieENhC5dz5UVGt8ezJ72xxQHe2Sk82kBZcDvDY8XEMWkrgtBpav1ePSDfOH
	 30lmj1nMaq4fA0VJLGrPHFNXsv95i5MbNcKDnwvG4C0jOmX4xm458D68Z6PEuf1vXl
	 mWjeZPv/Xo2xWEhFc8GMXsJPfXtYP/jrAU3hcPKeYRSCmxbkeK7lYzbTQz8H10G6wJ
	 vc7V4ZGJIRHHQ==
From: Mark Brown <broonie@kernel.org>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, alsa-devel@alsa-project.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1700702093-8008-1-git-send-email-shengjiu.wang@nxp.com>
References: <1700702093-8008-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: refine the requested phy clock
 frequency
Message-Id: <170075880893.2448402.4841454362054924374.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 17:00:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 23 Nov 2023 09:14:53 +0800, Shengjiu Wang wrote:
> As the input phy clock frequency will divided by 2 by default
> on i.MX8MP with the implementation of clk-imx8mp-audiomix driver,
> So the requested frequency need to be updated.
> 
> The relation of phy clock is:
>     sai_pll_ref_sel
>        sai_pll
>           sai_pll_bypass
>              sai_pll_out
>                 sai_pll_out_div2
>                    earc_phy_cg
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: refine the requested phy clock frequency
      commit: 347ecf29a68cc8958fbcbd26ef410d07fe9d82f4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

