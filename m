Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DAF68DA20
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 15:07:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PB4h74sgpz3cL1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 01:07:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p93Ap3nu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p93Ap3nu;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PB4g96QCNz307T
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 01:06:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AAE82B816D4;
	Tue,  7 Feb 2023 14:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBEAC433EF;
	Tue,  7 Feb 2023 14:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675778784;
	bh=h6Asegb3UosZ64SLaFl7xxcR07djTQ+PvmszvRBil6w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p93Ap3nummMzTCFrhTuIZj/pRJupCaGKWU2886vJi7VYMArbOWawjy7df6+SgP6ar
	 fmjWTVRM+c7pgNSFVvFCOFnmSjnxgWEXrcqX8H2zpEkPl0Lgu7ThM+wLFGO8dW0WYv
	 6CrKIqz1fGb2Or7NvZdHzkI1rLD9ZvD4EUbMNmIqxf5wAQsV5tQqrAs5EbUyZAAjKh
	 pqvu1AmoB37Z+S5Jg6UCdUSBLz3dbXY88k1ub18XXWClIekN8tSOpusycWYxTcGykR
	 8ldPt5g+CdT1PdhbfQD2HiY8xHTQGPsgukFWx6ahPE0MURRHv5p9EOT2M+rUl/86f4
	 QYXoHwKWQT03w==
From: Mark Brown <broonie@kernel.org>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, alsa-devel@alsa-project.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1675760664-25193-1-git-send-email-shengjiu.wang@nxp.com>
References: <1675760664-25193-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: fix getting version from VERID
Message-Id: <167577878194.133259.5914289862792868772.b4-ty@kernel.org>
Date: Tue, 07 Feb 2023 14:06:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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

On Tue, 07 Feb 2023 17:04:24 +0800, Shengjiu Wang wrote:
> The version information is at the bit31 ~ bit16 in the VERID
> register, so need to right shift 16bit to get it, otherwise
> the result of comparison "sai->verid.version >= 0x0301" is
> wrong.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: fix getting version from VERID
      commit: 29aab38823b61e482995c24644bd2d8acfe56185

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

