Return-Path: <linuxppc-dev+bounces-2487-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E5F9AB81B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2024 23:00:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XY4MP0C4Pz2xlF;
	Wed, 23 Oct 2024 08:00:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729630832;
	cv=none; b=S2xXPsmURGzOzRFKIB03swU/lGNvQ5SMWBYLd6GeKc8TU30uoyYj/dqJv/44dcrPigjMm6DlLJtLx+NUc/W/RWyAGfmyV0C6ZDHQaTuQofoSllSH6b+cZxjfT1g348Q/Kn1aK9+PN2YtDlvNuCkQnJzCyb48fQlV41uevRGE/INwZkOi1WCpUdIcGgLF/eK51rzc9wGpDMT2ny3NLMFxlKLeYEQwc19orgt/RxWnHmiJ5Z/b7tOdTl62VVf6wMbjKLupxdC/NUcVNNO+n0OIEqpRDTu4yBGdGnBaElMa89hacqpU52FcNFDvm/sSmJ30Tw6ZTY3MLugtqjN0O0fAag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729630832; c=relaxed/relaxed;
	bh=T2p1rNDmwJwD8dLUxYplivy+XINCoTIN5/yAE9W1Qlg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jccpXYk7Cano1Bm2vMdPI2xPP4RdaG36kfDepbCQyoJOuF6Gjd/u49Y3e+XcUifTVZgJ2XZlPWPrvhK9sxnA5T7hrHZTSMAoLk6binCr2vHsgNz1ka87nPwtABot/P236CuFs4SXV4XIs+2mgogpBpmUjw8bb5ygrp/eP/f3Vg4UsV19fD22JHwEur8rmHA6OddCyFqFvnjfx70xn9P3OpPeUzUMo7zo0RtW4YAJKs/EJ2PS5U2vfehor8V4PlrMFXSG8S2cTVIUjrvH/WqViJGmRJCkQeP60qxoG1Yz57slVT5vx4yTghVT8DrP/o7JAGy1hmkEAz5Ie1IidOWcqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bF3kPAPs; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bF3kPAPs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XY4MM4xt5z2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 08:00:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A7AB5C5755;
	Tue, 22 Oct 2024 21:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD627C4CEC7;
	Tue, 22 Oct 2024 21:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729630828;
	bh=gPLFmUbd/s1xG1U0lhSkTgFdqgBBXgJWtCXko/8udOY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=bF3kPAPsTJRgfQID5/10+n24ujJRtJlC4eEp7qOzfLgmJECivgijTTted45XGIOqT
	 gYe+OIII3QChKjIcJ4/+lyKCpBcbbd8DPkYdWg+uadMXNk7M08WJg202plQH9VQo5Q
	 /+hF5W/SqAmOyAGEK4wAO1N4ilP5twLW03Qe4IdiXQe4c3J/epCy/3DIepuJwqJlv1
	 KaK4PasoRafzpJKSMB9TOPCQBKxYVobp2GLtoRbWG0bcaNQX4dNdj2geIvLARvuQo+
	 dXeemevA1ffmdKEo+4NdD3ixLVzKYEyqzhIWMW4T2ZLHUGSdhkG7xu+v+cK/9qLGGX
	 FIsQ7iTo/4y9Q==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1728884313-6778-1-git-send-email-shengjiu.wang@nxp.com>
References: <1728884313-6778-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: Add sample rate constraint
Message-Id: <172963082563.164184.10497538395371277879.b4-ty@kernel.org>
Date: Tue, 22 Oct 2024 22:00:25 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 14 Oct 2024 13:38:33 +0800, Shengjiu Wang wrote:
> On some platforms, for example i.MX93, there is only one
> audio PLL source, so some sample rate can't be supported.
> If the PLL source is used for 8kHz series rates, then 11kHz
> series rates can't be supported.
> 
> So add constraints according to the frequency of available
> clock sources, then alsa-lib will help to convert the
> unsupported rate for the driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_micfil: Add sample rate constraint
      commit: b9a8ecf81066e01e8a3de35517481bc5aa0439e5

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


