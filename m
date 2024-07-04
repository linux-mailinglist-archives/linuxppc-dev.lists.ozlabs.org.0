Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37702927D34
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 20:36:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XwkC4aqR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFQMr6hm7z3fRs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 04:36:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XwkC4aqR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFQM934NWz3cSq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2024 04:35:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 44691CE391F;
	Thu,  4 Jul 2024 18:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBE4C32781;
	Thu,  4 Jul 2024 18:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720118145;
	bh=rCWEKZiJpFDMpQmRBe2oHF+Q4L1xuCzmJqFKI9sBbBU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XwkC4aqRrEk7dbyVe7FPkDuvLWRj1jidNP+euuAbzP9JjJzLszTewqZzPa+o+jBjC
	 FfFm5HKXGJqAADRL6npfN59JBc96M4knjbEw55jvee+lnAx4pced+gtLG/Id8VWOlX
	 UQaKQ5if+3ZNZlp6hHhpWOkCK8IUesi7Y+7OLE0lk5WaxQg3EGu/fmJaNrpwGR5QFa
	 TiIMvvL5uQCyFdh6L8HSwLkmE8hrqsRtVIJiouy9JLLCww5LkHFuXxaL0ZNkP965RM
	 mu/JfdeUKlnfOmLtHEJjNcf0T0eHBjGtDD9EamZCPEDDyP3EtBv9EaBAWPirYx85z0
	 kOEspMLmVOnEA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Herve Codina <herve.codina@bootlin.com>
In-Reply-To: <20240701113038.55144-1-herve.codina@bootlin.com>
References: <20240701113038.55144-1-herve.codina@bootlin.com>
Subject: Re: [PATCH v2 00/10] Add support for non-interleaved mode in
 qmc_audio
Message-Id: <172011814156.108577.6835000954041673379.b4-ty@kernel.org>
Date: Thu, 04 Jul 2024 19:35:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 01 Jul 2024 13:30:27 +0200, Herve Codina wrote:
> The qmc_audio driver supports only audio in interleaved mode.
> Non-interleaved mode can be easily supported using several QMC channel
> per DAI. In that case, data related to ch0 are sent to (received from)
> the first QMC channel, data related to ch1 use the next QMC channel and
> so on up to the last channel.
> 
> In terms of constraints and settings, the interleaved and
> non-interleaved modes are slightly different.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: fsl: fsl_qmc_audio: Check devm_kasprintf() returned value
        commit: e62599902327d27687693f6e5253a5d56583db58
[02/10] ASoC: fsl: fsl_qmc_audio: Fix issues detected by checkpatch
        commit: 86dd725b57a88869acfe15b0405937450d0aef30
[03/10] ASoC: fsl: fsl_qmc_audio: Split channel buffer and PCM pointer handling
        commit: 42212b2ce8b1182d536452eee2880d2de7cce059
[04/10] ASoC: fsl: fsl_qmc_audio: Identify the QMC channel involved in completion routines
        commit: 5e51a1f9dfd90de6e44cfb5340d48263f9e8f8d8
[05/10] ASoC: fsl: fsl_qmc_audio: Introduce qmc_audio_pcm_{read,write}_submit()
        commit: 33a6969fbc653f25d5204b17fb67d5a21e6295e6
[06/10] ASoC: fsl: fsl_qmc_audio: Introduce qmc_dai_constraints_interleaved()
        commit: b81cfa66435bdab896b4c24e11d24ec33bdb0601
[07/10] soc: fsl: cpm1: qmc: Introduce functions to get a channel from a phandle list
        commit: 37797c605da33445adc112561695f70bfaa11133
[08/10] soc: fsl: cpm1: qmc: Introduce qmc_chan_count_phandles()
        commit: af8432b2e41abc0a20bdc01a3b144ea7b2f1ee09
[09/10] dt-bindings: sound: fsl,qmc-audio: Add support for multiple QMC channels per DAI
        commit: fb6013168fa94d5863ed6085b24eaeb89102ad74
[10/10] ASoC: fsl: fsl_qmc_audio: Add support for non-interleaved mode.
        commit: 188d9cae54388171d28bd632a2561863db4b9f8b

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

