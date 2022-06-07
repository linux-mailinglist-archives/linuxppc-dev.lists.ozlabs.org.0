Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A9753FBD6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 12:47:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHRr640LJz3bxt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 20:47:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wpnhz2pz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wpnhz2pz;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHRq76f5cz3cBL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jun 2022 20:46:11 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AF581B81EF8;
	Tue,  7 Jun 2022 10:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D30C3411F;
	Tue,  7 Jun 2022 10:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654598766;
	bh=fUWj1cWqPq80cipRk8uUYphKUiT2JJ/NvVIZffcYwZM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Wpnhz2pzpJAMkkf5hX97XA6VF86Yke8jikzPNFKYIaN8VgFr14KLTDcPWkOe0iTye
	 /MgYSYEQfuRf3W9OTW3pSjz67/EJ4eqgb6EXfsdXtlWvx8Smqoy1MV2KU8xWC7HB74
	 dEvlI+8Vfkggqa+RQlAEi+Y82WGnEggMfW+GIhaYWWfa9VW48HlLt/Epy2gFvo6r3t
	 WYfdVgdZaGv+zxlt36B0qq9gWOxF4DxLkeCH2iim4Y0LqFQYDwo6zs85IA9GfnKnSz
	 MfzFeKiZiknqRs1qKqDfpb966yXAFyhMbUsSz/zFhtGI4QPU/NmOGnq3Bvgp1fwRJr
	 Qc1XgpxIE8P/Q==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com, perex@perex.cz, zhangqilong3@huawei.com
In-Reply-To: <20220602072024.33236-1-zhangqilong3@huawei.com>
References: <20220602072024.33236-1-zhangqilong3@huawei.com>
Subject: Re: [PATCH V4] ASoC: fsl_xcvr:Fix unbalanced pm_runtime_enable in fsl_xcvr_probe
Message-Id: <165459876415.301808.9458096235617694686.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:46:04 +0100
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
Cc: nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, festevam@gmail.com, lgirdwood@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2 Jun 2022 15:20:24 +0800, zhangqilong wrote:
> a) Add missing pm_runtime_disable() when probe error out. It could
> avoid pm_runtime implementation complains when removing and probing
> again the driver.
> b) Add remove for missing pm_runtime_disable().
> 
> Fix:c590fa80b3928 ("ASoC: fsl_xcvr: register platform component before registering cpu dai")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr:Fix unbalanced pm_runtime_enable in fsl_xcvr_probe
      commit: 9c3148dec7d2d40ef727b8789d3e9410ad6d4a1f

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
