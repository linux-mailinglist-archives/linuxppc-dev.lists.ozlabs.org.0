Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 721AC1F7944
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 16:04:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49k2XG4W1KzDqNx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 00:04:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Z9ioPCMu; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49k2QL4ZHbzDqw9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 23:59:06 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B6AA9206A4;
 Fri, 12 Jun 2020 13:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591970343;
 bh=7lLROIKj308gj2dNhR1qP0gVcCU/EHvwMTDRiLNOYnI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Z9ioPCMuDYl8KiWosYw3x0x+Vd03QskUIPH0bfkOcra/fTIx585gVcevB/XFbO9/H
 c9zURyT4/PlsW9+HY39b2xaPbA7BXwGWsd+BaoScDLcyVhqGtdhEgo2uOm9XDO9XaX
 7A2xgcZPQwYdp9m0/Ban4Q9tL1YmtesLKFgpIZ4o=
Date: Fri, 12 Jun 2020 14:59:01 +0100
From: Mark Brown <broonie@kernel.org>
To: nicoleotsuka@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 timur@kernel.org, tiwai@suse.com, festevam@gmail.com, lars@metafoo.de,
 Xiubo.Lee@gmail.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 perex@perex.cz, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <cover.1591947428.git.shengjiu.wang@nxp.com>
References: <cover.1591947428.git.shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH v3 0/4] Reuse the dma channel if available in Back-End
Message-Id: <159197034097.50978.12090792972224185067.b4-ty@kernel.org>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 12 Jun 2020 15:37:47 +0800, Shengjiu Wang wrote:
> Reuse the dma channel if available in Back-End
> 
> Shengjiu Wang (4):
>   ASoC: soc-card: export snd_soc_lookup_component_nolocked
>   ASoC: dmaengine_pcm: export soc_component_to_pcm
>   ASoC: fsl_asrc_dma: Reuse the dma channel if available in Back-End
>   ASoC: fsl_asrc_dma: Fix data copying speed issue with EDMA
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: soc-card: export snd_soc_lookup_component_nolocked
      commit: 6fbea6b6a838f9aa941fe53a3637fd8d8aab1eba
[2/4] ASoC: dmaengine_pcm: export soc_component_to_pcm
      commit: a9a21e1eafc94b79502cab8272b392f7f63ef7bb
[3/4] ASoC: fsl_asrc_dma: Reuse the dma channel if available in Back-End
      commit: 706e2c8811585f42612b6cff218ab3adbe63a4ee
[4/4] ASoC: fsl_asrc_dma: Fix data copying speed issue with EDMA
      commit: b287a6d9723c601dd947f1c27d4cc0192e384a5a

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
