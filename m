Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A74F8FD93D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 23:39:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lQxwQXuR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvgpj1W7Gz30TB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 07:39:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lQxwQXuR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvgnP4VPTz3cF4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 07:38:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0106D61B1C;
	Wed,  5 Jun 2024 21:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B38C4AF09;
	Wed,  5 Jun 2024 21:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717623509;
	bh=yrMbNY2Gr7i5mUw30Jlna/5JAKzdrHFu4hvA2gyNBkg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=lQxwQXuRvfm9OWCFsbHuZEiWtVU5w6nccY6yS+rlo0rS2J+6lU3V/M6LSrtC2U0NK
	 l9brby4WmHNVoLDfTQn/MnwGvLoeFge6FjifxDqZTg3+7dw2P42pu3rwCcnk0Fo8LR
	 djuvepdmdBlyxG0uerykdOmWo4+bePL3hzmdc8Ei4+0mU7ry8ttbAhtWAxpKXQLLgB
	 Uu+PWn93L1CKJR4v/j05j+462Wa74MvY6sfGYtzT0dzNImxNELgR00pFp1Tt/7C7Zb
	 yS8YotY8URtKUMYU24Enw0Fugh7uPxyYALCETLFebOTPKfkjyghDGIAufUNb5sMnB1
	 Nkj1PnPb5aKLg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 shengjiu.wang@gmail.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org, 
 linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1716972002-2315-1-git-send-email-shengjiu.wang@nxp.com>
References: <1716972002-2315-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v4 0/2] ASoC: fsl_xcvr: Support i.MX95 platform
Message-Id: <171762350655.565712.3068600680938105880.b4-ty@kernel.org>
Date: Wed, 05 Jun 2024 22:38:26 +0100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 29 May 2024 16:40:00 +0800, Shengjiu Wang wrote:
> On i.MX95 wakeup domain, there is one instance of Audio XCVR
> supporting SPDIF mode with a connection to the Audio XCVR physical
> interface.
> 
> changes in v4:
> - refine the constarint for 'clocks' according to Rob's comments
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: fsl,xcvr: Add compatible string for i.MX95
      commit: fc1277335ffa0d180c76ddccf5fe27fc75674e67
[2/2] ASoC: fsl_xcvr: Add support for i.MX95 platform
      commit: f13b349e3c70320ef5a86edfc888a6feb612abb0

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

