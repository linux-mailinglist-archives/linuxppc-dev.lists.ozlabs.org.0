Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A26660225
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 15:30:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NpQjJ2FzCz3c9K
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 01:30:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a4JlKq64;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a4JlKq64;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NpQhK4DGJz2ynD
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jan 2023 01:29:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D41E86136C;
	Fri,  6 Jan 2023 14:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3C4C433EF;
	Fri,  6 Jan 2023 14:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673015357;
	bh=Qvr7MD8G9FmZl4anXDch3jsk6CbjpCfuPfm12VW5+Ic=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=a4JlKq64k/lKtjCzWB0pqlmdoXg5kMPeZuuS+tg3MGZXfTuCOiKH0E3+pB+cdResy
	 km6mczt+G0UGYU9+VyLVLSwhcuIu5N8/AWbq0apNP0FtFCzspBiPKUjTCInxj55fR8
	 1Fb/WGapS/6rHYUlGXZn1U1SC7K30Xu1QLFm6jX0PczPu+o1KH3CWOkdfbX0ttfnQi
	 44lUxyYR38vGevkv8hyc5MuX3Q5WipfEFkxHkOHHQIZGN4+NTsRNXdjNBv4JWjn0pG
	 UIOB03YvQyKFdsjpFjJRZqwHmAvxvI3bqnwSN5zKMj9UzgTGF9Zff7Mn1XYy8xouBy
	 Qq87MKLzNJKjA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20230104025754.3019235-1-chancel.liu@nxp.com>
References: <20230104025754.3019235-1-chancel.liu@nxp.com>
Subject:  Re: [PATCH] ASoC: fsl_micfil: Correct the number of steps on SX controls
Message-Id: <167301535488.46037.15431956554804644558.b4-ty@kernel.org>
Date: Fri, 06 Jan 2023 14:29:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-214b3
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

On Wed, 04 Jan 2023 10:57:54 +0800, Chancel Liu wrote:
> The parameter "max" of SOC_SINGLE_SX_TLV() means the number of steps
> rather than maximum value. This patch corrects the minimum value to -8
> and the number of steps to 15.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_micfil: Correct the number of steps on SX controls
      commit: cdfa92eb90f5770b26a79824ef213ebdbbd988b1

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
