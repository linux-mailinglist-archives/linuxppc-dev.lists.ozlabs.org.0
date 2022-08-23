Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E57EE59EB69
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 20:51:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MByx4628rz3cdQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 04:51:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vAcy88Zb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vAcy88Zb;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MByvy2zpgz2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 04:50:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0E9766170E;
	Tue, 23 Aug 2022 18:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA23C433D7;
	Tue, 23 Aug 2022 18:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661280602;
	bh=fNT/ML6CsNqu6evXVhQ1GENE4bqQBehy5fIvG9sMLLI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vAcy88Zbsbm73QG9RIBN7kLheKv9zuhvbQlRaY7AIi5FEIXCshoGeECGld6vuQkAY
	 JmT92EdCP5kYMFzPBE/2Bekz1REZJwBuLdTvusoJJv1wRln5cQkXR3wC2NgwKXBx1D
	 pyFyPB8IDBVWU8XRQKXBcD+pbHW+As9qsWwsyQEEfpWW/LqfnbZQVCMaJ/DeU1c6Pt
	 yfhCKb250jG3LHHYURi4HiQU+Wkg3CWVFs4mtAnPCgjD/TGnKpQJNtmtDEZuDv0Zzh
	 ddKlSjcQV8wjpaWD/td+90Vxa3CZuJ9bdtvwrPl0II4b0CMojmeMfWPTvm5pM0RW+t
	 TJnFTafdyU06w==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, shengjiu.wang@gmail.com, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, perex@perex.cz,
 alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@nxp.com>, nicoleotsuka@gmail.com, festevam@gmail.com
In-Reply-To: <1661218573-2154-1-git-send-email-shengjiu.wang@nxp.com>
References: <1661218573-2154-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [RESEND PATCH] ASoC: fsl_sai: Add support multi fifo sdma script
Message-Id: <166128060004.1031684.56373454264278530.b4-ty@kernel.org>
Date: Tue, 23 Aug 2022 19:50:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
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

On Tue, 23 Aug 2022 09:36:13 +0800, Shengjiu Wang wrote:
> With disabling combine mode, the multiple successive
> FIFO registers or non successive FIFO registers of SAI module
> can work with the sdma multi fifo script.
> 
> This patch is to configure the necessary information to
> the SDMA engine driver for support multi fifo script.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Add support multi fifo sdma script
      commit: 88630575406fdf2a7853545a884484bd55dab8a0

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
