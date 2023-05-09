Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D72F56FBED1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 07:45:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFnDX5XjTz3fHn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 15:45:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PsJpDp+R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PsJpDp+R;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFnBr0FGfz3fJq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 15:43:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 50B476442F;
	Tue,  9 May 2023 05:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF24FC433EF;
	Tue,  9 May 2023 05:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683611008;
	bh=BHjVGIukBgoK+CmqFhhYd0En5hML1F44t+AhacSIdS0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=PsJpDp+RRGSpjMf9SvOivDlyCqHh1gqXZZMd7EUL1fpcPdY2HQ5cLRTDpZQ5Rxe1c
	 dZCwir2Kr98oQU0p+bVsAuawAxoIIeDKlNceQDqNQaxNVOkjoO6INcKPU5roWQBsl4
	 Ije1iZNFpBvmbGev+V0Sk6jS8WtrqnUQ1/Q65g/dln+vzCMARQOa67tlwsIKiYJCKa
	 VlKzad0gISZFYQZ+WrnXo7fFvviH8xsplBqOefRgJuu8tJkG4++zdiXaPgXIypOygF
	 nRZOGIX6Evbvup7kHb5uEZaiPz74JnrDbASEm1NF8DnaLiSiVg57lBZ5dQQhM1Mo29
	 R8M3qmcW3h7ZQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1683540996-6136-1-git-send-email-shengjiu.wang@nxp.com>
References: <1683540996-6136-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: Fix error handler with
 pm_runtime_enable
Message-Id: <168361090204.282894.7680884514075566269.b4-ty@kernel.org>
Date: Tue, 09 May 2023 14:41:42 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
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

On Mon, 08 May 2023 18:16:36 +0800, Shengjiu Wang wrote:
> There is error message when defer probe happens:
> 
> fsl-micfil-dai 30ca0000.micfil: Unbalanced pm_runtime_enable!
> 
> Fix the error handler with pm_runtime_enable and add
> fsl_micfil_remove() for pm_runtime_disable.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_micfil: Fix error handler with pm_runtime_enable
      commit: 17955aba7877a4494d8093ae5498e19469b01d57

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

