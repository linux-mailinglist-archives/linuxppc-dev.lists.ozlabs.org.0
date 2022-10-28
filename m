Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0120E6116BD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 18:03:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzS5T4J7Qz3cK8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 03:03:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DkLDaKvF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DkLDaKvF;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzS4b4x1tz30NS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 03:02:55 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7553FB82870;
	Fri, 28 Oct 2022 16:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A35EC433D6;
	Fri, 28 Oct 2022 16:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666972971;
	bh=Oxti1A+2ZLM13LWu91bH36f/Fx13AJFSM+jY4B3mE7U=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=DkLDaKvFD2Rwrze6hxXZRo9+kKLB8sEtVs8hwjQHbqkL7Q7ijbMoDuq/gFBKUR0Or
	 H0sImDSmMB4S2UDXg5jApERzjViHb30R5L1bHrFOoGA7P0aiVypEnvCfR+J78sdtJj
	 najlz55vlJ/guZaA5vJGCboYQn5O0+giD7iNJgIQ2IboHXAcVV7C1NCrAc6N4WIxHZ
	 D4LS+cONMnpTQrQGeP++D4qGyUh+ypmBFjINQTFR0/4nM07JEpW7hBXvpk1a0TUSGx
	 ai3K4gJso5h9quUOPIwPb75OdU7+DaspFSqjYHONOaM07jhkZ0YAWFuma6u0l9TyI0
	 syLrAx8KFkcpQ==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, tiwai@suse.com, festevam@gmail.com, linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, robh+dt@kernel.org, Chancel Liu <chancel.liu@nxp.com>,
 perex@perex.cz
In-Reply-To: <20221027060311.2549711-1-chancel.liu@nxp.com>
References: <20221027060311.2549711-1-chancel.liu@nxp.com>
Subject: Re: [PATCH 0/3] Add support for SAI on i.MX93 platform
Message-Id: <166697296821.717517.14812404041210557854.b4-ty@kernel.org>
Date: Fri, 28 Oct 2022 17:02:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Thu, 27 Oct 2022 14:03:08 +0800, Chancel Liu wrote:
> This patchset supports SAI on i.MX93 platform.
> 
> Chancel Liu (3):
>   ASoC: dt-bindings: fsl,sai: Add compatible string for i.MX93 platform
>   ASoC: fsl_sai: Add support for i.MX93 platform
>   ASoC: fsl_sai: Specify the maxburst to 8 on i.MX93 platform
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: fsl,sai: Add compatible string for i.MX93 platform
      commit: aa8289fda86ede0e164a260316647c8bf0400d41
[2/3] ASoC: fsl_sai: Add support for i.MX93 platform
      commit: 67d5c6c19923ad26def8a001e86fc0f42264a8b5
[3/3] ASoC: fsl_sai: Specify the maxburst to 8 on i.MX93 platform
      commit: 870b89d118a29bd845ea706a74e313f9b83f5a45

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
