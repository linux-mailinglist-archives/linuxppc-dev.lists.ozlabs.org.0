Return-Path: <linuxppc-dev+bounces-1765-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0A299142E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Oct 2024 05:51:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XLBKn4nwNz2yDt;
	Sat,  5 Oct 2024 13:51:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728100285;
	cv=none; b=NqqsxfW5LDGiRaTm5/+wM33c9CCwG9TYA1cPbKnr5COHyWMSLNndwMset62iPT4ym+/MEPc7SsSVQR8mgF73s9zfx1gCfdj87rCCpIlKAdeCp2MI0/GaVfbHh9JHL9ZaqRtyj7Es98WIOTAmmTXuhCfV6wGmXtnmn33nk68IjvFeSU5fvovT/LbWV+P/0l9o3Dd3N2OOcKaSJK3LX9Nn1wWvx5lOYHkZLQxzJlJp2ra3lnIocCM0Q+TwwroYucquCDm/FykRuvMkxO+t88rMyU4FRCHxMp506Dc+kY0gcbQrQjisOtWncMK6SbXj2V4QTLF1PIX/KSAxI8g8Mv/gPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728100285; c=relaxed/relaxed;
	bh=dHk14linz07dfsyMct7Srg6ZsEEiYAXw0j0Frers2Wc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZT6Y/YKC1QOcyU/FntW4cP2wwZWUSbLgJRxaHrmNmZILCRPUlFeBb9IPRYnift4Cc//znwtyOJoI7YD7JbgV6HNus5m7wMXfNlNsJdvHhgiCUN41nCPOVQeVIHwzYbOXWmzoBu353QjG3hiSJs8nlaCdDd2SO87Jklk7zJzOPCOKaE1b7BHh2OH4J9C73pdHJ3A4vJ8x0oxBhF/fOa8nl7oqSt8teF8pSFnhLII4H9gC5NBTXZ3iNw8KGofGppKhwI926cWBrK1kEzZ9IFcMRT0k5IZNCL7QSc18Q9CncYcLWEVimGXnL/tCH2icOxBuyQhyi/RUvfBuOpD16nZqNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pb/Ik5ac; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pb/Ik5ac;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XLBKm0pZGz2y8X
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Oct 2024 13:51:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 33563A443E6;
	Sat,  5 Oct 2024 03:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB33CC4CEC2;
	Sat,  5 Oct 2024 03:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728100279;
	bh=LwpJjL/sAZamAjbREfwblRFe/pUWGWf4oudQBiz54rk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Pb/Ik5ac1zGRheA15syfndYOOvy73c90bPQPVxm871bmWsMbGYDrjomhqi2AtbxIE
	 3nsrYWCJn7l+VIKNngJ0bxbREgXEv5BuJ2Q5z4y6hba1GWlTElttgb6nwxfmi8uZuc
	 SIVoAWPjaF8jE70V4EX/Fbiqoo5LUO+BX+EIBZn5CxRfI10qQQKL6OAZ4AmBfXg35H
	 Wp49z25WRy/1b95jcLtLvq3YcFA2IARpS/KtMzoUcBtw6K51CODQQcXDIGF+213Zwj
	 qUpf67QGvVTeO5mCeUKV1Ww5FyjrIozk/Cv38jTo5T02w033VxkIZ/EbLWN+iZuWdp
	 Fh4SjQetlVBlA==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Herve Codina <herve.codina@bootlin.com>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20241003122015.677681-1-herve.codina@bootlin.com>
References: <20241003122015.677681-1-herve.codina@bootlin.com>
Subject: Re: [PATCH] ASoC: fsl: fsl_qmc_audio: Remove the logging when
 parsing channels
Message-Id: <172810027430.832098.16999500333273178564.b4-ty@kernel.org>
Date: Sat, 05 Oct 2024 04:51:14 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 03 Oct 2024 14:20:15 +0200, Herve Codina wrote:
> On each channel parsing, a log message is issued. This log message is
> not needed and become annoying when many channels are used (up to 64
> channel supported).
> 
> Simply remove this unneeded log message.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: fsl_qmc_audio: Remove the logging when parsing channels
      commit: c6e86e19e778553dbedab617aafb25b6bbaf4cd9

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


