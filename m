Return-Path: <linuxppc-dev+bounces-12434-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F431B8B462
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 23:06:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cT4nP3sgrz2yZ6;
	Sat, 20 Sep 2025 07:06:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758316009;
	cv=none; b=FLqsiVZxwwIyKEJ1AvYCfhEaJ7jQ2bbL5BVYecAIbXSTQ+Y8fXMMwjMtktvh1hlAy0A1tNWnVTbSJsKiWZOa6H+j3ME/Jcb5AWdYevhL0/PUKqJWFCDDHPeKGh7DP5y9HKWPcns2TXKtk84M+TwMGggnB45ule43Qa2V2M+dhKBxR2LMTTomeK/2Nqw1kKSVhzRQSpL4jWcBbI1+R50B8u6RGB2wTW/G/W9JwvkZd2EKHkF/hnMiZ9Jt0wneUesKXE0bH19jBE8RiOXgAiKNqFRIBXcjEa0bM5qrfYd16Oup8kLk2X/DuL2053jCipSnzY5I5DdhbiqECWlYjQgO+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758316009; c=relaxed/relaxed;
	bh=2Fj6M1q9KQ1Ru4BAuLDTfX9zC7BgQcWSax5mSaV4yDg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZUPgiK6Cd608JKrJSJ2lKMxqrRonL+ZA7rneTObs8TXcs5mbZOSyW8uylQ/y4PKSNAJvq/bYHI83013JHnF1goFqN/htJzbOqFwEXVNCZ0GOzcgsOOet33LBPyTnt9fvq+IZ4+0X4e9JLuTHlWEBp5VcLDayLQSaa+mqCBjaeRiQaCWVF1ElYI2lxHyRsYkeiWw/QE+qN5KcGyRBeIVGZXqoj/6yFd+c93lWtiOdvFHXhmiCxxJ5sNmfAJk8UF1nh/IhO2zbolnWjRANKy660uAk1v+8zUYNrHTeAWzBTQnDHsPUzMT0z8S5MtCuIeTzLMRvlfCEPbuGRwOxaHbvrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CNWybv6K; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CNWybv6K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cT4nN4sHmz2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 07:06:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0E6643737;
	Fri, 19 Sep 2025 21:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A28DC4CEF0;
	Fri, 19 Sep 2025 21:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758316006;
	bh=AZyVB8V6Ey50Gr7OmuBq23KPrawUMGKWsAlF4V2ssKg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CNWybv6KN/koR1Nk2/3ZqLBy+tEj6tOo+bUae3egY6K9HPQl/cTEvhkqos2R/MFe9
	 jxE8tivDGfYIIYSsruQfYXZpe4QCs36Jyrt2BTgN+zitvlAwoGkQGk1WQb0VoHlMrx
	 08Q1dqAMhu4oYjnO0UCN/8NLwRyCf7POV1xIIZWHngcWuXFZfiXYGH9cpOG8TPPtOW
	 qJTSbegUxcJntN7pMAXrKi7T+6t4xUN/bUSIdoqp8/y55v7EIzumSUdge+WB2duZCq
	 J7C0JfYC1/kZV5/+bbuD+BfvjB6VmMF26BVEK1Z0wXzdn3jUPCQldIaH4JsluWf+4a
	 Svxybdp9x09HQ==
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>, 
 Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <cover.1758209158.git.christophe.leroy@csgroup.eu>
References: <cover.1758209158.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH RESEND v3 0/4] ASoC: fsl: fsl_qmc_audio: Reduce amount
 of interrupts
Message-Id: <175831600403.228965.1508351336751078255.b4-ty@kernel.org>
Date: Fri, 19 Sep 2025 22:06:44 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 18 Sep 2025 17:34:07 +0200, Christophe Leroy wrote:
> This is a RESEND of v3 sent one month ago, see:
> https://lore.kernel.org/all/cover.1754993232.git.christophe.leroy@csgroup.eu/
> 
> This series reduces significantly the amount of interrupts on
> fsl_qmc_audio device.
> 
> Patches 1 and 2 are preparatory patches.
> Patch 3 is the main change
> Patch 4 is a cleanup which is enabled by previous patch
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] soc: fsl: qmc: Only set completion interrupt when needed
      commit: c2a60426e94a56e5329f6c2681c251281f63ab24
[2/4] ASoc: fsl: fsl_qmc_audio: Ensure audio channels are ordered in TDM bus
      commit: fb418fe26d28378700bddc16f5fa3362dda86d1b
[3/4] ASoC: fsl: fsl_qmc_audio: Only request completion on last channel
      commit: 4c5f8c25561f36407cb137d4c350651820068148
[4/4] ASoc: fsl: fsl_qmc_audio: Drop struct qmc_dai_chan
      commit: 2c618f361ae6b9da7fafafc289051728ef4c6ea3

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


