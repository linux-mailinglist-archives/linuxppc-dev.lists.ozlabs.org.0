Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F9F88AC26
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 18:45:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CM0olkc8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3L1r5wC2z3vnw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 04:45:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CM0olkc8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3L0N51tqz3vYF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 04:44:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 724FC61012;
	Mon, 25 Mar 2024 17:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF51C433F1;
	Mon, 25 Mar 2024 17:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711388658;
	bh=qb0iwJLbOS+LnSN4h1wK8br8fS0Emdh+02cjuu/+jmQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CM0olkc8ABVp8KmSIRMh1EoZWuTErWkfpQ+hJU4vDTWnSETmZfbGeyRGVE4x9Nyxa
	 27DwkyOdKYLCruQnOqbQHzR05Rp3BAE2hAyghZiJ8C137RVPkChKjQqD/PQV+L4ejY
	 2reiR8/UxcV8rWkRIj9u0WCdGg5J1pte9EghB0pRGEYPKf2DtOoAsSQ5r4dGkgxqPZ
	 eQTqsvSSW3FZK4OC3sMVhHKGAkLI2w3TT5ACE1yGocgfq9tUuug0T44ZD3bdxHFEZv
	 f/WiEP9nvnZXMqXQbbBQSQZvSGXUeZyebHHHVztGIihBia+vYv1+x4Lhc0CHDh/WRj
	 eV5x9HYl8IfSA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240318200804.181516-1-andriy.shevchenko@linux.intel.com>
References: <20240318200804.181516-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] ASoC: fsl: imx-es8328: Switch to using gpiod
 API
Message-Id: <171138865464.327140.5568916833564730450.b4-ty@kernel.org>
Date: Mon, 25 Mar 2024 17:44:14 +0000
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
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 18 Mar 2024 22:07:56 +0200, Andy Shevchenko wrote:
> This updates the driver to gpiod API, and removes yet another use of
> of_get_named_gpio().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: imx-es8328: Switch to using gpiod API
      commit: 9855f05e553637f05494cf47a3154cbf9a5cfc67

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

