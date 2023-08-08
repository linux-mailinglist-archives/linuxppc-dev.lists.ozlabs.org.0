Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 526DE774AB2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 22:33:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iKFAgVD3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RL4dm10Kqz3cHN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 06:33:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iKFAgVD3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RL4cr3lBsz2xW7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Aug 2023 06:32:44 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B501A62C78;
	Tue,  8 Aug 2023 20:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264BEC433C8;
	Tue,  8 Aug 2023 20:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691526760;
	bh=qewne48Hucqc657V12FXXvGjJPxSyV07SN2JHI9cYD8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iKFAgVD3iFl5s8e93Hf1+1OwVYtQwUpxFuksU0TNXw1W74bWzz+fBh1Cv7SVGuBUT
	 8YTzjIyhPUWQG9JlkAkay8qP7dSt4htMNusG0N+brPKoN/nDcpc29cXy2irRsh6tKf
	 McNSp0HAP1AHFjKm++QXPKcgfD7TjOGWjxUKwbUvCokAYJi6gG9Ch9JMjtsLnTzcuk
	 /9x+Xpvnun7GhrAdSOD6cMKNUXjKGumTylyODKq6xxj3kHlS/9ETeL28blPNHg7bNj
	 03Lf1B+NEB136u6P3ScDKtyg6/KWuLesmvwUCNkRdWVMmrKcX8tHiljMuJtPX4IUmZ
	 dIsKOrF5RrLEA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 linux-imx@nxp.com, Li Zetao <lizetao1@huawei.com>
In-Reply-To: <20230808021728.2978035-1-lizetao1@huawei.com>
References: <20230808021728.2978035-1-lizetao1@huawei.com>
Subject: Re: [PATCH -next] ASoC: imx-audio-rpmsg: Remove redundant
 initialization owner in imx_audio_rpmsg_driver
Message-Id: <169152675686.192712.3518358575478738982.b4-ty@kernel.org>
Date: Tue, 08 Aug 2023 21:32:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 08 Aug 2023 10:17:28 +0800, Li Zetao wrote:
> The module_rpmsg_driver() will set "THIS_MODULE" to driver.owner when
> register a rpmsg_driver driver, so it is redundant initialization to set
> driver.owner in the statement. Remove it for clean code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-audio-rpmsg: Remove redundant initialization owner in imx_audio_rpmsg_driver
      commit: 8e5c4a9fc47ab6d8e1d9cf6c1f11c90675c1d968

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

