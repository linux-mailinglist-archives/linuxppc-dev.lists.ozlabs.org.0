Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC3150E70E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 19:25:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnBjw384Mz3cF7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 03:25:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ACFU4LD7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ACFU4LD7; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnBhR5xrvz3bps
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 03:24:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 99E31614C1;
 Mon, 25 Apr 2022 17:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F697C385A9;
 Mon, 25 Apr 2022 17:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650907460;
 bh=kGNKLYoYkIqyAIUqooIaCkDmUVcEL/KHpxMnxdUnrRc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ACFU4LD7VqRkiZApiylS1fOnq2RPRL/i0D0eEj9j11l26LRlXNcUfP0flySj5nH0N
 CZlLTaf5OfTdKYlW0x6/U5oEkxP3GmCRzI/SvYuTAYpM6532fGOpywGxCsqV+QkHGV
 LxkWTwG4Zd1nyQRDO1RxXZRvTRyLHoKOsxoRIfkf0dLx+Y57vhwkT9qwBodmmK0HeM
 B0GuAsX4WQ8V8bpaPJHRorlMNc4R1NKVtP0hI8a8vowE/JtKfPcxddIVPZObFqC0D4
 kKg+/OZyqoXeL6xYRlriZYJuv/53u9bhPuE21qxkmamjf07huqSwwbCLzzsYTuV3Lh
 Y02qO6wjsch3g==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>, lgirdwood@gmail.com,
 Xiubo Li <Xiubo.Lee@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 shawnguo@kernel.org, perex@perex.cz, kernel@pengutronix.de,
 Nicolin Chen <nicoleotsuka@gmail.com>, baihaowen@meizu.com, tiwai@suse.com,
 linux-imx@nxp.com, Shengjiu Wang <shengjiu.wang@gmail.com>
In-Reply-To: <1650509120-25377-1-git-send-email-baihaowen@meizu.com>
References: <1650509120-25377-1-git-send-email-baihaowen@meizu.com>
Subject: Re: [PATCH] ASoC: imx-hdmi: remove useless null check before call
 of_node_put()
Message-Id: <165090745710.583823.18355681135160167823.b4-ty@kernel.org>
Date: Mon, 25 Apr 2022 18:24:17 +0100
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 21 Apr 2022 10:45:20 +0800, Haowen Bai wrote:
> No need to add null check before call of_node_put(), since the
> implementation of of_node_put() has done it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-hdmi: remove useless null check before call of_node_put()
      commit: 666b0cad75dc9517100295aed590aef2ff9a73d1

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
