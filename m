Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE108943168
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 15:54:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fsCfmhZS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYtqd4XTmz3dGr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 23:54:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fsCfmhZS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYtpx65Lwz3cDR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 23:53:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3EA3962388;
	Wed, 31 Jul 2024 13:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D1EC116B1;
	Wed, 31 Jul 2024 13:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722434006;
	bh=h4jkxfwJQEcLEg45LO0JMK3kGyr4gy5FVoR95arp49E=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=fsCfmhZSDqAoNxS7TL+g2Cyvt+P/djSELkOmXa7C+3x69n/p7AFXQLdp2LZdv1Uva
	 N6idLgS1d45bF4NwpxbF4ai0HmK61KoO0CBvLcOAIr0a3XT/+daWBl+E7Y9Htsof+3
	 6oeBJt5ZvQyZjPAH6gUD4Nd0+7yFubIJL3QzbOAaAwo/Efb/XaE28ORi0xDqbbYIYi
	 Zw8l179LS9wrWRqCetYFm+GD9YWwsPEgYBC84TU5FxTr0Zyq2D/2s7dJva9X0yRnIj
	 Ks4BYMr873zY+q6Hx/Rk8GzroKrJpVeSA5K2DQOSPzzuvxBgXm3h7d6UJK4iav9xQ8
	 0uEV4bU/px5XA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1721897694-6088-1-git-send-email-shengjiu.wang@nxp.com>
References: <1721897694-6088-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: fsl_micfil: Check the difference for i.MX8
 and i.MX9
Message-Id: <172243400439.75630.6636735348572180704.b4-ty@kernel.org>
Date: Wed, 31 Jul 2024 14:53:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 25 Jul 2024 16:54:52 +0800, Shengjiu Wang wrote:
> There are some register difference for i.MX8 and i.MX9
> REG_MICFIL_FIFO_CTRL definition is updated.
> REG_MICFIL_FSYNC_CTRL, REG_MICFIL_VERID, REG_MICFIL_PARAM are added from
> i.MX9
> 
> Shengjiu Wang (2):
>   ASoC: fsl_micfil: Expand the range of FIFO watermark mask
>   ASoC: fsl_micfil: Differentiate register access permission for
>     platforms
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_micfil: Expand the range of FIFO watermark mask
      commit: 4ddd51ccff911a2e9e961307692532a325f6c78a
[2/2] ASoC: fsl_micfil: Differentiate register access permission for platforms
      commit: aa4f76ef09a993efa9b5fab6ddf5d6d324baaea3

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

