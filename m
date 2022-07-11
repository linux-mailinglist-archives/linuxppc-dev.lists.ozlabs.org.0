Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9FA570489
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 15:43:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhQ7M3LpMz3c5h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 23:42:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yh4+12vn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yh4+12vn;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhQ6m4Myxz3by6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 23:42:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EFF68B80F10;
	Mon, 11 Jul 2022 13:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1876C3411C;
	Mon, 11 Jul 2022 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657546938;
	bh=KqT9jXk7gPcHs0OREpA0JbWzkxkbkXw/FOHUWxufhRo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Yh4+12vnfz/2k7t73GAfVvazukytAqGwPao+x+u63zCaZL4Ed1Et6Pd6qTMkTuVhH
	 G62ZGbXc5ca1lpNJmS4AHKmiSO1cGZFv7A5Ez/skc2P/E4ib4x6Nm8F1GGYFGmlKUe
	 jdqg9f8RZ0m5m1jQQn4TwF4Dy/68gsc4RcbQg4J4Ic+yxz5Hx5J14pZeGgSnGZjxwe
	 YWwtmifKVmuztiw6SJzq4vmtONW1aXJE1mA2qZqstUuVhFqdX//Wv9UNXgKpHB0iNT
	 Q4se9Xx61BaiigNoUqPFsE09l9Lsp1fQQg3kM5pkv2xy829N7Qnf7uHPzWwq5j0K5t
	 wDC8Sbj6efthQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@nxp.com, perex@perex.cz, festevam@gmail.com, lgirdwood@gmail.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, tiwai@suse.com
In-Reply-To: <1657507190-14546-1-git-send-email-shengjiu.wang@nxp.com>
References: <1657507190-14546-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_utils: Drop usage of __clk_get_name()
Message-Id: <165754693638.334539.15476852072708408930.b4-ty@kernel.org>
Date: Mon, 11 Jul 2022 14:42:16 +0100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 11 Jul 2022 10:39:50 +0800, Shengjiu Wang wrote:
> Avoid build errors when CONFIG_COMMON_CLK is not set/enabled.
> 
> ERROR: modpost: "__clk_get_name" [sound/soc/fsl/snd-soc-fsl-utils.ko] undefined!
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_utils: Drop usage of __clk_get_name()
      commit: eaa27e7fe43f16fe587c3e93fd5c25ce86be3c43

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
