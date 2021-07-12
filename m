Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C74CE3C518D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 12:48:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNgTk5ShTz3bNr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 20:48:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rU49web7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rU49web7; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNgTK0ht3z2yMr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 20:47:48 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6D99610FA;
 Mon, 12 Jul 2021 10:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626086865;
 bh=p+qLz+HhOqEFcAKXAJHCu8puLmOSYZop39X5dZG07EY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rU49web7RUua2IMfaM//7+M8yiIKwUXhdv/e9Lsl0tVAtN/EQj9BVMhbCL8YKua1j
 8nqoKs2sXd54M4LPlV1bq1W1VKT9dKMeRyT0E2wMNN/7JA24+0XwLvO9tTEnOJHP+c
 oBVojxFrYQ9Un5iayEwV6932dPiboBqfLQJc+3K3fEr4K+/hh8ofXz9kz/Ofx8ENti
 Mvz9XizXA8pcuNqnrWLaP0P/gSaNyMNfrGgRBKdMQC6dvc51jb7Sib1xtw3NkH9dfw
 2MS6M/Rx4rAAmiyXXO7OUf2KCWmSJzYSKe256pA3Ntsct+etX7uKAi16h0mq5WeZjw
 ZE7Nhg7tdikPQ==
From: Mark Brown <broonie@kernel.org>
To: timur@kernel.org, nicoleotsuka@gmail.com,
 Tang Bin <tangbin@cmss.chinamobile.com>, Xiubo.Lee@gmail.com,
 tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz
Subject: Re: [PATCH] ASoC: fsl_xcvr: Omit superfluous error message in
 fsl_xcvr_probe()
Date: Mon, 12 Jul 2021 11:45:59 +0100
Message-Id: <162608623153.3192.455683453441836535.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210624104505.13680-1-tangbin@cmss.chinamobile.com>
References: <20210624104505.13680-1-tangbin@cmss.chinamobile.com>
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
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 24 Jun 2021 18:45:05 +0800, Tang Bin wrote:
> In the function fsl_xcvr__probe(), when get irq failed,
> the function platform_get_irq() logs an error message, so remove
> redundant message here.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: Omit superfluous error message in fsl_xcvr_probe()
      commit: 8620c40002db9679279546cc3be2aceb8c5e5e76

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
