Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B62F4D45CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 12:36:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDn8H036Hz308B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 22:36:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VJ8IdfaH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VJ8IdfaH; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDn721xXQz2xKR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 22:35:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 42C1361625;
 Thu, 10 Mar 2022 11:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84ED5C340E9;
 Thu, 10 Mar 2022 11:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646912122;
 bh=L1YRU57z+t1MV+KfRtHvqyjYc86lOQpafAuQ+QMnSkU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VJ8IdfaHULgmtZbnG12wBjgsKUabfVGLpNiMjU4HwmiBJPUB4G45haTmR7eJecfrE
 7/VEEts2D4wpUDV9H+16U+SxgXOFTqQinFlZrkiOHEIOK5g5bk3tcxUBDmaQdmVXXx
 Qk408BeOg5XDYK+cyUNZfBeUrfF2V6+WCRBRNAQ9INFHSMZmHb4aywv/VAniF/osPs
 MC8dMCIuBuyB8p2/mLZgDc7qaQWnfAh50GokZ9/VYNRmlVyYtIwQ7VcBT7hEk6BM2O
 6Fc28SkLDNNlaktdI9eyovVZ55ewbl31QgjpxIQ+gpx/YOAkXdzfr5Eovl4mO/ggcB
 kkvXes9LVW2+w==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, perex@perex.cz,
 tiwai@suse.com, nicoleotsuka@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org, festevam@gmail.com, lgirdwood@gmail.com
In-Reply-To: <1646817523-26800-1-git-send-email-shengjiu.wang@nxp.com>
References: <1646817523-26800-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: keep all TxClk sources by txclk array
Message-Id: <164691212026.13798.15345880576925268759.b4-ty@kernel.org>
Date: Thu, 10 Mar 2022 11:35:20 +0000
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

On Wed, 9 Mar 2022 17:18:43 +0800, Shengjiu Wang wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> Use txclk array to keep all TxClk sources instead of keeping
> clocks per rate - need to do this in order to avoid multiple
> prepare_enable/disable_unprepare of the same clock during
> suspend/resume.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: keep all TxClk sources by txclk array
      commit: 5bd998af5b69cf21fd4db5eaf7e9db85a4a35295

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
