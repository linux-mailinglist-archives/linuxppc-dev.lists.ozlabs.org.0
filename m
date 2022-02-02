Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2C14A77B3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 19:17:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpqlQ07QCz3cRn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 05:17:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S48S6MVn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S48S6MVn; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jpqkn1TtRz2xb8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Feb 2022 05:16:49 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 102B2B83238;
 Wed,  2 Feb 2022 18:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C113C004E1;
 Wed,  2 Feb 2022 18:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643825799;
 bh=l0AT3Zz97rtWMBtgue/gT0zconI+43qODz67uMRZOOw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=S48S6MVnU3vitex52P58eWgrBA/WaDudypwCiXghUQ4wR9DhWQXGF2X3I75aWpkBH
 OoCL1HdRLfY5psTC/E10PH0rFVsnJ1YP7Pnfb941VCiMiiPzuKhz2LKMZi7065zN5B
 nO1WhFXhwvg4X8evGi7QLPS1CMP9nkHX8kQNrBvVkLOtcG9ipiN3Ftl3uqTu+ZnK68
 e7h74AkQzEC2GeI5YLtAPSk4l4BzJ0AALb3oFY7GvX2L17Gk6aZwIb+a+Mvo3RuBGA
 kJNIauPWgpgbCZmDgl8kAU2UtTfokhipXF81QdtDtAopD8An+qN6Ank/bMzzyKN9ix
 qeOn5qWm+1WzA==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20220201234535.569973-1-linus.walleij@linaro.org>
References: <20220201234535.569973-1-linus.walleij@linaro.org>
Subject: Re: [PATCH] spi: mpc512x-psc: Fix compile errors
Message-Id: <164382579833.3628373.8560517182774707854.b4-ty@kernel.org>
Date: Wed, 02 Feb 2022 18:16:38 +0000
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
Cc: Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2 Feb 2022 00:45:35 +0100, Linus Walleij wrote:
> My patch created compilation bugs in the MPC512x-PSC driver.
> Fix them up.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mpc512x-psc: Fix compile errors
      commit: 8d37f2710f022837635d9f97db3ac8c853e86979

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
