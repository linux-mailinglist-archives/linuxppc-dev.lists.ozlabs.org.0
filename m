Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C965E764076
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 22:25:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uwKJCO0E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RB54C59lgz2yh0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 06:25:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uwKJCO0E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RB53D4q7mz2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 06:24:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ADF3161C39;
	Wed, 26 Jul 2023 20:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B937C433C7;
	Wed, 26 Jul 2023 20:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690403062;
	bh=aLXUCgzmdbz5Uh/9NSOALUTpFEZu0cFA7fY6IgsRn0Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uwKJCO0EIijbinn/BW6Tuzp3Sb6UfSdMayIFex70PvuIrVYBqscKeX3A+9El2i2WM
	 rSLJs+hHUpXWlVVfA/oJwcyImAvUr7EgY8wseBov85LCS7CQ7HDZh3hYsP/K1v0hJi
	 R3GvIaft2KY4ENiulOBLZqOlLraoKloXGSEfihneXgEJ0fJ/MZG2ErIL9hO2gcwYXW
	 h6KKlwudgVdSRoitBdyZxWbwKEngJkcD4XIYt79MPzRVEGPdcZTlmen+l2/FwkHEpP
	 KXY6nAOAvjRKneEwsPp3sE7VAV4SM6yzBkfEGSqcJ4v5dVgo8AMK+H+qnvwBkOwRGt
	 3jSgox/lZ3PoQ==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Herve Codina <herve.codina@bootlin.com>
In-Reply-To: <20230726161620.495298-1-herve.codina@bootlin.com>
References: <20230726161620.495298-1-herve.codina@bootlin.com>
Subject: Re: [PATCH 1/1] ASoC: fsl: fsl_qmc_audio: Fix snd_pcm_format_t
 values handling
Message-Id: <169040305934.140086.11999495195860520544.b4-ty@kernel.org>
Date: Wed, 26 Jul 2023 21:24:19 +0100
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 26 Jul 2023 18:16:20 +0200, Herve Codina wrote:
> Running sparse on fsl_qmc_audio (make C=1) raises the following warnings:
>  fsl_qmc_audio.c:387:26: warning: restricted snd_pcm_format_t degrades to integer
>  fsl_qmc_audio.c:389:59: warning: incorrect type in argument 1 (different base types)
>  fsl_qmc_audio.c:389:59:    expected restricted snd_pcm_format_t [usertype] format
>  fsl_qmc_audio.c:389:59:    got unsigned int [assigned] i
>  fsl_qmc_audio.c:564:26: warning: restricted snd_pcm_format_t degrades to integer
>  fsl_qmc_audio.c:569:50: warning: incorrect type in argument 1 (different base types)
>  fsl_qmc_audio.c:569:50:    expected restricted snd_pcm_format_t [usertype] format
>  fsl_qmc_audio.c:569:50:    got int [assigned] i
>  fsl_qmc_audio.c:573:62: warning: incorrect type in argument 1 (different base types)
>  fsl_qmc_audio.c:573:62:    expected restricted snd_pcm_format_t [usertype] format
>  fsl_qmc_audio.c:573:62:    got int [assigned] i
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: fsl_qmc_audio: Fix snd_pcm_format_t values handling
      commit: 5befe22b3eebd07b334b2917f6d14ce7ee4c8404

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

