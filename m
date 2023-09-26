Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2152E7AE77D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 10:09:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cA2N1EB/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvspK0F78z3clG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 18:09:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cA2N1EB/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvsnR2q2kz3bbW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 18:08:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EACEF6130D;
	Tue, 26 Sep 2023 08:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78BFDC43391;
	Tue, 26 Sep 2023 08:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695715704;
	bh=aH7ozQDhP9+rq7B4jdXLYIVBH8NAT/Xa3VrnhdITKYM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=cA2N1EB/lkUXDBj7skkCBPE9ET93tY348x5+OtyzW0VOVK3FNkYS/qnQKMpn8NfAt
	 SDZeYQGbg8TwoZQ4S2gkmzcY1E5vpWwHCrqFWMJ12/8W3m6B81YzX6NWdUE2lFC+io
	 7Y4RWyuyhQeHVaNVV93n8gqs21mY/Ip1VPtW6J+dhY1U59P9ZQQ7uF157qc9GxqVif
	 nNMo6gK/TfS1KAUv3KjsD65+RzGeF1LXwQFsiooPbYAux7uZd0cJCri2BRJMAoVkI0
	 a7B3WJU+ufJ5mWC1Z6IwhWl9KkZJF4ik/IJX5FFFMAB8RmBAkF2WMDaSkVBLRT2xn1
	 ye1yKzgOK+/aQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, matuszpd@gmail.com, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1695116533-23287-1-git-send-email-shengjiu.wang@nxp.com>
References: <1695116533-23287-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Don't disable bitclock for i.MX8MP
Message-Id: <169571570223.2520438.2470473456796299214.b4-ty@kernel.org>
Date: Tue, 26 Sep 2023 10:08:22 +0200
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

On Tue, 19 Sep 2023 17:42:13 +0800, Shengjiu Wang wrote:
> On i.MX8MP, the BCE and TERE bit are binding with mclk
> enablement, if BCE and TERE are cleared the MCLK also be
> disabled on output pin, that cause the external codec (wm8960)
> in wrong state.
> 
> Codec (wm8960) is using the mclk to generate PLL clock,
> if mclk is disabled before disabling PLL, the codec (wm8960)
> won't generate bclk and frameclk when sysclk switch to
> MCLK source in next test case.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Don't disable bitclock for i.MX8MP
      commit: 197c53c8ecb34f2cd5922f4bdcffa8f701a134eb

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

