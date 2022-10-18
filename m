Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0F8602A27
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 13:30:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsBVK1TnGz3c7H
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 22:30:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ozVGQfH0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ozVGQfH0;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsBSY4ljnz3c4W
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Oct 2022 22:28:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C77BEB81EA9;
	Tue, 18 Oct 2022 11:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706DCC433B5;
	Tue, 18 Oct 2022 11:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666092503;
	bh=t7x/A8HbCw3ENFEa0NBFmoMvgPlcglz9IsJ2LAmequw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ozVGQfH0HK6rhGMYDfgkvZ7uDwIlPojVdg/p4xZ88I8W+do/H21R2wJAEFCQdBmYl
	 zGLhNAWispSleNoCgX4JpVq/95Igt4iaxVg2o76xaBTPcYGQ7gfxgPVW8xoZ6DKfEZ
	 663qNLqrKCTr1+Dv6nviBSf6nlm2PyRBXPRjAKxKkAl3jI2gGCkVaWNBPpcRzL1zi8
	 kIi7dTe//g7Pf5n40tCRdWDfIbPUs07wmbNCcWFGl7gOHv5PUdTQNRwbxtsj2bXIAY
	 vG1Lb19RpFPIlfgSagsfXJiunqgcB0MGGT1J1QzoRaho1MtY/jO6VKSt8kLhgvFBqd
	 w+bQSKsm+Feug==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, tiwai@suse.com, shengjiu.wang@gmail.com,
 nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, festevam@gmail.com, perex@perex.cz
In-Reply-To: <1663925494-9941-1-git-send-email-shengjiu.wang@nxp.com>
References: <1663925494-9941-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: Add Hardware Voice Activity Detector support
Message-Id: <166609250118.155136.1014438138123181100.b4-ty@kernel.org>
Date: Tue, 18 Oct 2022 12:28:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Fri, 23 Sep 2022 17:31:34 +0800, Shengjiu Wang wrote:
> The Hardware Voice Activity Detector (HWVAD) is a block
> responsible for detect voice activity in a channel selected
> by the user. It can be configured in Envelope-based or
> Energy-based mode.
> 
> There are additional two interrupts for HWVAD, one is event
> interrupt, another is error interrupt.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_micfil: Add Hardware Voice Activity Detector support
      commit: 29dbfeecab85fc998d8c5c29473da33d272d0c85

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
