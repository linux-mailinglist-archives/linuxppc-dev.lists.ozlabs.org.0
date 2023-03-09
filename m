Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9E26B2A74
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 17:10:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXZ0c65DWz3cjC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 03:10:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=alKJkV+T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=alKJkV+T;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXYzj5m5Gz2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 03:09:53 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DF253B81F63;
	Thu,  9 Mar 2023 16:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5104C4339B;
	Thu,  9 Mar 2023 16:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678378188;
	bh=Vs5yR73fwenbspC7Hc7MZqjQddF+NqnLXNP8Zyl3t5I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=alKJkV+TfvLPRdueZ1xcZnxDkXUBPNyJmhNvaOyn3Yko+Z8MknKt40SxrToOw1lmT
	 NMcYCCb/dLiF1ZAZghf5v/Zi+KW1vcCojkX9dmPVsDAmSpeEIdFMzetdk5YTk4WtyZ
	 XPrDwHV5LsZqIZiS30nYkAMsQ3G2/jQPJhpOyyUccduBTRWAKtSkgcHaqgJnIJ2dO+
	 bP42RdWk5zO+VNLw9uU2V5iPJDhjZX5T0qpsDnHuRRE6t110JuPu+wDvuzDehAgCA3
	 tGmCWZax8mMqz8v3XzNOZDrZisMXFA7KegDEBmyWWRGSNYqJyABTqEfWdlvDY9ygFr
	 C7r8+LxONRvxw==
From: Mark Brown <broonie@kernel.org>
To: Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Qiang Zhao <qiang.zhao@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, 
 Herve Codina <herve.codina@bootlin.com>
In-Reply-To: <20230307141503.159766-1-herve.codina@bootlin.com>
References: <20230307141503.159766-1-herve.codina@bootlin.com>
Subject: Re: [PATCH 0/3] Fix the PowerQUICC audio support using the QMC
Message-Id: <167837818442.37742.7557223272230360155.b4-ty@kernel.org>
Date: Thu, 09 Mar 2023 16:09:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 07 Mar 2023 15:15:00 +0100, Herve Codina wrote:
> A previous series added the PowerQUICC audio support using the QMC.
> The v6 version of this previous series was applied but some feedbacks
> lead to a v7 version.
> 
> The v6 can be found here:
>  https://lore.kernel.org/linux-kernel/20230217145645.1768659-1-herve.codina@bootlin.com/
> and the v7, here:
>  https://lore.kernel.org/linux-kernel/20230306161754.89146-1-herve.codina@bootlin.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc: Remove unneeded property
      commit: 33a33005b2db0966c00d4f58dd2a36e5a44217db
[2/3] dt-bindings: soc: fsl: cpm_qe: cpm1-tsa: Remove unneeded property
      commit: 0fb6f518cb46cf8bac7c30c29171050e355cd738
[3/3] soc: fsl: cpm1: qmc: Fix assigned timeslot masks
      commit: f37acbde076d8dbf5e4c694f29760e608fdffe11

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

