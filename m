Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3604A4C52
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 17:40:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnYhV2mhCz3bck
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 03:40:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bRhiw9Vi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bRhiw9Vi; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnYgq29HNz2ywb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 03:39:51 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EF6B2614DF;
 Mon, 31 Jan 2022 16:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7970C340EE;
 Mon, 31 Jan 2022 16:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643647187;
 bh=imto9F2z5oex/qRfPVAM1kIE3TqUhhJL2QnXPJoiuUo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bRhiw9Vibn3iUdRFJykebh1A2tkruLDvnIf5E4L5WuCCxf50YkSI8eeb7Plv6Ayy8
 bhX8kayBY9g4kC3UrjVWG1tf8WE2A7LnaqPnQM3y6wSJL1ljVER/B5+Uk8uIeynRt5
 u9uUl4DfCPO7lQdwxXxDBycZ2Gf5v82rcHl+UqJBhCvnCSYKFPMzUGxqnEH3+f2l8C
 0Vg2kpOiQgiz7OeAw5J7rMikxYADfeF1cNVX5bDMehARKTzgtIO+sZnPzUagkphPU6
 T+9kPgbz+hp3vksdhI45wIYFq99acNy5kmRxU8nTR7xRHhv+RWXmo/7pqr8ra+NvDA
 FqHhfjEKsTz3Q==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20220120002600.216667-1-linus.walleij@linaro.org>
References: <20220120002600.216667-1-linus.walleij@linaro.org>
Subject: Re: [PATCH v2] spi: mpc512x-psc: Convert to use GPIO descriptors
Message-Id: <164364718647.1030816.7386114038958613078.b4-ty@kernel.org>
Date: Mon, 31 Jan 2022 16:39:46 +0000
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
Cc: Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 20 Jan 2022 01:26:00 +0100, Linus Walleij wrote:
> This driver is already relying on the core to provide
> valid GPIO numbers in spi->cs_gpio through
> of_spi_get_gpio_numbers(), so we can switch to letting
> the core use GPIO descriptors instead.
> 
> The driver was assigning a local function to the custom
> chipselect callback, but I chose to just open code the
> gpiod setting instead, this is easier to read.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mpc512x-psc: Convert to use GPIO descriptors
      commit: 2818824ced4be5abc22c450340d548702f166d9a

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
