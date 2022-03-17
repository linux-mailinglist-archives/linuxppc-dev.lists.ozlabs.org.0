Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 108F24DCE9C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 20:15:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKH186rYHz3bXd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 06:15:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YyV2Y3NN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YyV2Y3NN; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKH0V52flz2xtb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Mar 2022 06:15:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2224CCE2457;
 Thu, 17 Mar 2022 19:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 689FCC340EC;
 Thu, 17 Mar 2022 19:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647544517;
 bh=Y+apd5wGVAcbGhJSYKEioR4SaIWjP+1tnLbv+JCtuTs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YyV2Y3NNRcDkNQ91mK4rRWosiPM6MGwZq9m1P8FwcGCGV1iQiSijyjAMR981+MIjF
 znFuwFdxgDM6391YZkQ4Ifm91A01c3yN77rkj0ag3e1rY2BFnh7VrTevnW7GYICvaG
 HeBRWJamGYKtyjiyw963tqomW9uZXWe/zllzz4mT1nv6RRCFWBXQaUtfeUKRNBbv5X
 fHirIWXXn/2rxHB/MW3ttc4gy21na47hxcx7XwrfUYjWyEOk4pybewsEI4Li55SWL7
 nRTVqvyJ/06aaLd1v+B8FN94HkSge75odjzuSx4IJkCo9/YskymnkRcX3Da06dGsmP
 Lgn3XryG/Ey5Q==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 perex@perex.cz, nicoleotsuka@gmail.com, tiwai@suse.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com,
 shengjiu.wang@gmail.com
In-Reply-To: <1647408538-2982-1-git-send-email-shengjiu.wang@nxp.com>
References: <1647408538-2982-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Add new registers included on i.MX8ULP
Message-Id: <164754451515.3036648.9457796820741527004.b4-ty@kernel.org>
Date: Thu, 17 Mar 2022 19:15:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 16 Mar 2022 13:28:58 +0800, Shengjiu Wang wrote:
> There are some new registers added on i.MX8ULP, they are
> the SPDIF transmit Professional C channel registers,
> 192bit SPDIF receive C channel registers, and 192bit SPDIF
> transmit C channel registers.
> 
> There are two output lines, SPDIF_OUT1 and SPDIF_OUT2, the
> original REG_SPDIF_STCSCH and REG_SPDIF_STCSCL are used for
> SPDIF_OUT1, the new REG_SPDIF_STCSPH and REG_SPDIF_STCSPL
> are used for SPDIF_OUT2, the 192bit SPDIF C channel registers
> are used for both.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: Add new registers included on i.MX8ULP
      commit: 638cec39339db40df9fc2ece0411a64856669b93

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
