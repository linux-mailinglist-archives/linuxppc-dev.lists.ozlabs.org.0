Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C55279B4F7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 02:02:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H2B1meau;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rl3gV2nwCz3cGk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 10:02:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H2B1meau;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rl3fc20t4z2yN8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 10:02:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 20C7E614A4;
	Tue, 12 Sep 2023 00:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27E0C32787;
	Tue, 12 Sep 2023 00:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476916;
	bh=b7QKl0a0AEHRzG/6bKiidEwJZlxjVK/5NxsY7VlNA8Q=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=H2B1meaujGjdupBvdKujlqBDeO+9jyKuGE747IQuFVPFFSmruNXZYdxPcCcDW2aCE
	 SX3TIKkNBV1YjsBqRpxtvCmmFuHcPksCKc1PHACOUz7yB9mx84z6xOuZ6xvrC99V0R
	 SJ2se1JUKRlOA+p6cawZzrRkSAkNGq43GTJhR2Qs59VLEAsCis1d1i2zG1UTRwj4qE
	 j2NOVEqjqXstwTczrGuj+GF0S4g6WYZi0x2mlYqfVL54mx31Zl0xI7t62E2bvoGUqI
	 ip4Qt4O5if/a02Zyd/RegMMGZ67J/MV3AzbMxlm7znXn3it3v/kes7+7XNcR2b2LEd
	 ttonejNGSDKtw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1694414287-13291-1-git-send-email-shengjiu.wang@nxp.com>
References: <1694414287-13291-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl: imx-pcm-rpmsg: Add SNDRV_PCM_INFO_BATCH
 flag
Message-Id: <169447691360.2390116.6423554135052140931.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 01:01:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
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

On Mon, 11 Sep 2023 14:38:07 +0800, Shengjiu Wang wrote:
> The rpmsg pcm device is a device which should support
> double buffering.
> 
> Found this issue with pipewire. When there is no
> SNDRV_PCM_INFO_BATCH flag in driver, the pipewire will
> set headroom to be zero, and because rpmsg pcm device
> don't support residue report, when the latency setting
> is small, the "delay" always larger than "target" in
> alsa-pcm.c, that reading next period data is not
> scheduled on time.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: imx-pcm-rpmsg: Add SNDRV_PCM_INFO_BATCH flag
      commit: 2f9426905a63be7ccf8cd10109caf1848aa0993a

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

