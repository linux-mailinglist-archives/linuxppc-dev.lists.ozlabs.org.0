Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF70867F9D2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 18:20:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P41Rn59VPz3cdD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Jan 2023 04:20:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q/h7ILGe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q/h7ILGe;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P41Pv6zbxz3cdB
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Jan 2023 04:18:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8854CB8069C;
	Sat, 28 Jan 2023 17:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F1FC433EF;
	Sat, 28 Jan 2023 17:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674926336;
	bh=UykfPTbGDvILC/tRy7XI1XkGj0Yf2yNGJ45GzxQQ+ZQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Q/h7ILGefhpfAwyN2R6Cfm0yd3vzqOWqf1/37XqBIzM6FUeS9VfVVZlUDMiNDuHnO
	 yrXf0bhwP30iGJVmoFviQ7RMQ+q78tKuo87b8kyTJRvFz+B249R6cSGI3A10GlGO9A
	 HqVM1QevzjZJ0Vx4Zra/k+Df1MsKAd0RjrmsgAuwpfWNKtx6H3vgZgHdwRUiIV5x3N
	 tp2Y5e4xYbjdKVAzQNydZhlqM7+5VyaqzsbevEXPtvoQkK6T4RpjoCZhgu0bntAXbO
	 tpE5K5UJZJdZNdqP5iAXLXAWChDA4BoffIXIBjc6BhqORr18cblKGmmrooV1FZS2Z+
	 T1bOSnNX00f4w==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20230119073416.3064918-1-alexander.stein@ew.tq-group.com>
References: <20230119073416.3064918-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] ASoC: imx-hdmi: Use dev_err_probe
Message-Id: <167492633131.2479102.10605156106740609522.b4-ty@kernel.org>
Date: Sat, 28 Jan 2023 17:18:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 19 Jan 2023 08:34:16 +0100, Alexander Stein wrote:
> This silences -517 errors and helps figuring out why the device probe
> is deferred.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-hdmi: Use dev_err_probe
      commit: 362e8d0f27c40864b4f8994624409f7b4316d2dd

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

