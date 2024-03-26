Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D171388C6DF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 16:28:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cneiOIVU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3tx24B3Zz3vf1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 02:28:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cneiOIVU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3twJ5DX0z3vXG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 02:27:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E4ED4612BF;
	Tue, 26 Mar 2024 15:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A6BC43390;
	Tue, 26 Mar 2024 15:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711466861;
	bh=jnDKCBGZ3mEKwOzhDtE+4+tTWxXMCbPw9/Yta9NdMSU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=cneiOIVUSw3BIhivAzv7EQjXpMfXoxj46GIJw2UWv9LBhSZcI+8Yi55Oq07LD7G51
	 NqsrY++g921HTWD9o0mTh/l5wcYPQuNFK8W7f4UPFUz1cdWAD0J3LTxQ4aQV6bz2U9
	 blo7r8Er+d4IQtdlVHo+81d6QdYQ+smDe0FPSeMCYJNVw1TawIaKYZ2+k1qk+eud84
	 +La8Lh/eKF7BHyTnRK6feuaUcj0Mg9IWNzTNR8A6HUfn+KhhcCY3vqz3RYVXEUwFsy
	 VpzqEaUxk+KXWSHbvM/ZV5wO2OGTSvn+7+lO2jz8ptIQXJaan1vdB2oYGk7SAR2KZk
	 lGNXQMXuvvO7Q==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 linux-imx@nxp.com, alsa-devel@alsa-project.org, 
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20240311111349.723256-1-chancel.liu@nxp.com>
References: <20240311111349.723256-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v3 0/5] ASoC: fsl: Support register and unregister
 rpmsg sound card through remoteproc
Message-Id: <171146685832.132239.2142300799841463466.b4-ty@kernel.org>
Date: Tue, 26 Mar 2024 15:27:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
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

On Mon, 11 Mar 2024 20:13:44 +0900, Chancel Liu wrote:
> 	echo /lib/firmware/fw.elf > /sys/class/remoteproc/remoteproc0/firmware
> (A)	echo start > /sys/class/remoteproc/remoteproc0/state
> (B)	echo stop > /sys/class/remoteproc/remoteproc0/state
> 
> The rpmsg sound card is registered in (A) and unregistered in (B).
> After "start", imx-audio-rpmsg registers devices for ASoC platform driver
> and machine driver. Then sound card is registered. After "stop",
> imx-audio-rpmsg unregisters devices for ASoC platform driver and machine
> driver. Then sound card is unregistered.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: fsl: imx-pcm-rpmsg: Register component with rpmsg channel name
      commit: 41f96cd53f2838ac4894491ac5eadb06f1e5b858
[2/5] ASoC: fsl: imx-audio-rpmsg: Register device with rpmsg channel name
      commit: dacc7459745df168152b5cceba34efade9b5e063
[3/5] ASoC: fsl: Let imx-audio-rpmsg register platform device for card
      commit: c73524768e9e1a7ac9eb3a4d36a1ac0d34f22644
[4/5] ASoC: fsl: fsl_rpmsg: Register CPU DAI with name of rpmsg channel
      commit: 0aa7f5406afa828a93d84d75c9b9ac991cd75367
[5/5] ASoC: fsl: imx-rpmsg: Update to correct DT node
      commit: c14445bdcb98feddf9afaeb05e6193cc1f8eec1a

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

