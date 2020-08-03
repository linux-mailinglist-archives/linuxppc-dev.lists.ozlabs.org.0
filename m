Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE7C23A9F1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 17:55:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BL2XM3hvnzDqVB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 01:55:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=GJfBCVCE; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BL2Tz0J0VzDqQx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 01:53:10 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 595502072A;
 Mon,  3 Aug 2020 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596469986;
 bh=XeYM1rRZOkWuIGWs2dZo48AiU58GKKjioVDTipaaTp4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=GJfBCVCERYczWrzRwIKu61UKHM57s5ntL+rWpDdYN0ZhK3ZstcH3QIQisS6vNUikc
 ke7JZAqeDR34Cqspn0Xa61dQHl+uRVNKPoGzimarFLVS7FQS6p1vKkqLfwVRpoD7NR
 2NdyngBPn5egBEmzDsuwocTAeFvLY8HaNOvRk+p0=
Date: Mon, 03 Aug 2020 16:52:46 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, festevam@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, timur@kernel.org, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <1596420811-16690-1-git-send-email-shengjiu.wang@nxp.com>
References: <1596420811-16690-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3] ASoC: fsl-asoc-card: Remove
 fsl_asoc_card_set_bias_level function
Message-Id: <159646994087.2524.15435181634413034183.b4-ty@kernel.org>
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

On Mon, 3 Aug 2020 10:13:31 +0800, Shengjiu Wang wrote:
> With this case:
> aplay -Dhw:x 16khz.wav 24khz.wav
> There is sound distortion for 24khz.wav. The reason is that setting
> PLL of WM8962 with set_bias_level function, the bias level is not
> changed when 24khz.wav is played, then the PLL won't be reset, the
> clock is not correct, so distortion happens.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl-asoc-card: Remove fsl_asoc_card_set_bias_level function
      commit: f36e8edb95734c03134db628afa25ee23b8e0d95

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
