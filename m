Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF4D1E841C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 18:53:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YVxp5HsSzDqjl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 May 2020 02:53:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=JvBnWf2+; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YVvX1G4QzDqjJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 May 2020 02:51:19 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CB66207BC;
 Fri, 29 May 2020 16:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590771076;
 bh=509pJFb+h4EzxXQ9huxUCMGnV93J5bxttZJZDwp+jKo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=JvBnWf2+Uk8diKibDr9y6lSOSG/X/cJ4gdmVD5Gx7MIDMJiPoaIACDxzeYRtJQJ+9
 nzq6oe000/AbHB7p/WalQfrAl7J2e47miz7jqatUBA3xUWb2D6Iywzo596DjMp5vSW
 mSw5gTMIug/XgSsduNUIB0VNNah3z8JhFH3W7FGw=
Date: Fri, 29 May 2020 17:51:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Xiyu Yang <xiyuyang19@fudan.edu.cn>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Timur Tabi <timur@kernel.org>,
 linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
In-Reply-To: <1590415966-52416-1-git-send-email-xiyuyang19@fudan.edu.cn>
References: <1590415966-52416-1-git-send-email-xiyuyang19@fudan.edu.cn>
Subject: Re: [PATCH] ASoC: fsl_asrc_dma: Fix dma_chan leak when config DMA
 channel failed
Message-Id: <159077105220.28617.9185476806800586420.b4-ty@kernel.org>
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn, kjlu@umn.edu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 25 May 2020 22:12:46 +0800, Xiyu Yang wrote:
> fsl_asrc_dma_hw_params() invokes dma_request_channel() or
> fsl_asrc_get_dma_channel(), which returns a reference of the specified
> dma_chan object to "pair->dma_chan[dir]" with increased refcnt.
> 
> The reference counting issue happens in one exception handling path of
> fsl_asrc_dma_hw_params(). When config DMA channel failed for Back-End,
> the function forgets to decrease the refcnt increased by
> dma_request_channel() or fsl_asrc_get_dma_channel(), causing a refcnt
> leak.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc_dma: Fix dma_chan leak when config DMA channel failed
      commit: 36124fb19f1ae68a500cd76a76d40c6e81bee346

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
