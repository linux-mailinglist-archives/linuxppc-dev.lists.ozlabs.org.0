Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4AB8BF4AB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 04:39:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uC9nO7qw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYzrK06JLz3cVg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 12:39:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uC9nO7qw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYzqb0kz1z30WM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 12:39:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D36C861A7F;
	Wed,  8 May 2024 02:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02724C2BBFC;
	Wed,  8 May 2024 02:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715135939;
	bh=/3khDWZQ/GtML+FhSHCXGuNu/t+fIBx0N0zULUWpjWI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uC9nO7qwz/RZe+qVeAYA5qg8DRX2OHooEZGkUg+YOiFYZbymhIt5OYrroDkvwZHx+
	 rloiSSzfzkpfR3JH7MYR+nwgB19ILcw3crrUVKTntXNt13ThipsAWyeevB2r2yv6e4
	 5UcJx3pXdyw//cVj268GeKVZeeXlC8CscMEFYHrvrAsHMAGXLZQj4qiDjiJa6/msly
	 chVJr5LgPieHOEt1Z6CDmFMIZNYKLXUkYS08rHdms6UNqleqnU+9MAV5ZdML0t7FUe
	 4rh/5pt8ZbvdIsh9pgfWDTw1ynQIxfxgYcl1bu+Kl0Fem7Stn0h55Di594V579dsht
	 8SgBQFV9z+Mbg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
References: <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
Subject: Re: [PATCH 0/4] ASoC: Constify static snd_pcm_hardware
Message-Id: <171513593429.1997870.7721601606737894887.b4-ty@kernel.org>
Date: Wed, 08 May 2024 11:38:54 +0900
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
Cc: imx@lists.linux.dev, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 29 Apr 2024 13:48:45 +0200, Krzysztof Kozlowski wrote:
> No dependencies.
> 
> Static 'struct snd_pcm_hardware' is not modified by few drivers and its
> copy is passed to the core, so it can be made const for increased code
> safety.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: qcom: Constify static snd_pcm_hardware
      commit: e6fa3509cb32df373b15212a99f69a6595efd1c3
[2/4] ASoC: fsl: Constify static snd_pcm_hardware
      commit: ed90156037659473ee95eafe3f72d8498e5384ff
[3/4] ASoC: meson: Constify static snd_pcm_hardware
      commit: 7b5ce9f0c52a5885d34d46bba62e9eaedc3dd459
[4/4] ASoC: uniphier: Constify static snd_pcm_hardware
      commit: 74a15fabd271d0fd82ceecbbfa1b98ea0a4709dd

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

