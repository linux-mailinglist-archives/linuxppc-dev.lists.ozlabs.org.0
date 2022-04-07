Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A25D14F7BD7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 11:39:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYxCw3wcqz3bYS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 19:39:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jDs25bbn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jDs25bbn; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYxCF1kJMz2xsW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 19:38:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CCCF2B826EB;
 Thu,  7 Apr 2022 09:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1C8C385A8;
 Thu,  7 Apr 2022 09:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649324307;
 bh=q6HaN3d0Wc4BX8ScAWKhh8emcIaugeEwIsXTjJpawCQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jDs25bbn3/0QsT4YpXsLyKfbVWolN6z7t2NW5wae9Xx7AbvyoCskY4Gki2pAChFJh
 fxrPJTgP2NS2nU1lm9L+pHXj39Qf4lOZ9N7ohio9BBUbZpE7fInyEkJGOGbp/7L88v
 F9dRCwftYPgfY5XFZGfNOLUaV0ZJ9ACI1+3s6uTvEqnt3ld5/xMbmhvbRIuyVH+vnC
 ocUdo9UYJztl6mtBhYhhLtxSgNiKRjC+JSpDz/i8AalrcdBH2Nge4JvGcZqzeZzRUt
 3CVTb/XNaOEUrj1OHBDXgYaxVyw/ZiWzIP3bOsTvqJookhEHQwYE9bJictLCSj2Heg
 VN2Be9RiddtWg==
From: Mark Brown <broonie@kernel.org>
To: viorel.suman@nxp.com, shengjiu.wang@gmail.com, nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, Sascha Hauer <s.hauer@pengutronix.de>,
 a.fatoum@pengutronix.de, Xiubo.Lee@gmail.com, festevam@gmail.com
In-Reply-To: <20220405155731.745413-1-a.fatoum@pengutronix.de>
References: <20220405155731.745413-1-a.fatoum@pengutronix.de>
Subject: Re: [PATCH] ASoC: fsl_sai: fix 1:1 bclk:mclk ratio support
Message-Id: <164932430460.3844153.13561902931852849107.b4-ty@kernel.org>
Date: Thu, 07 Apr 2022 10:38:24 +0100
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, kernel@pengutronix.de,
 Jaroslav Kysela <perex@perex.cz>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 5 Apr 2022 17:57:31 +0200, Ahmad Fatoum wrote:
> Refactoring in commit a50b7926d015 ("ASoC: fsl_sai: implement 1:1
> bclk:mclk ratio support") led to the bypass never happening
> as (ratio = 1) was caught in the existing if (ratio & 1) continue;
> check. The correct check sequence instead is:
> 
>  - skip all ratios lower than one and higher than 512
>  - skip all odd ratios except for 1:1
>  - skip 1:1 ratio if and only if !support_1_1_ratio
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: fix 1:1 bclk:mclk ratio support
      commit: d00887c106dac47b9af6ed70e8d5c45b69c4bd52

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
