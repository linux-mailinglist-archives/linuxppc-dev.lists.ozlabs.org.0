Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F21EB5A15B6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 17:28:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MD6Lk1n57z3bZY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 01:28:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r4z1ZEmg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r4z1ZEmg;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MD6L55Mb9z2xGj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 01:28:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 94148B82A1D;
	Thu, 25 Aug 2022 15:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682F0C433B5;
	Thu, 25 Aug 2022 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661441287;
	bh=PcjVIAYMkkfsODQkXxJEf6wliajJqMnE/RTILFVmcFo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r4z1ZEmg3T1Lhyb4jNf0hMpdVrLftix03K4Mpjw/qzMhpGO64vn9Wo4K4kqptcRjf
	 f4tc4vdseBnjYiEcWKeIII38wNT2gqCZaSE1wNTHRog4zr3sC7u+mEL0AaRxTqRROv
	 d/UD2hRfdK730jyWI5sqgGnx8+5mUyT/W7+sBlgm5USVgJX9Fd/k4a3Brvl3p3RnCQ
	 fEGj4ZeSDYd7dZ5X/X0KUl8hfMNXUdf0NB2PHpM8/EY3DpYJeshh2/xz9YxFb9UgEh
	 RPWwaGlFv79fx3KqczejL3LPbA6NfQ0KyUOq0wjU+bztkXpA3L8QkIx6i2vWKnvoHS
	 xtT/428jcm62A==
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, festevam@gmail.com, shengjiu.wang@nxp.com, perex@perex.cz, nicoleotsuka@gmail.com, tiwai@suse.com
In-Reply-To: <1661430460-5234-1-git-send-email-shengjiu.wang@nxp.com>
References: <1661430460-5234-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_aud2htx: register platform component before registering cpu dai
Message-Id: <166144128309.526608.9889332004047855940.b4-ty@kernel.org>
Date: Thu, 25 Aug 2022 16:28:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 25 Aug 2022 20:27:39 +0800, Shengjiu Wang wrote:
> There is no defer probe when adding platform component to
> snd_soc_pcm_runtime(rtd), the code is in snd_soc_add_pcm_runtime()
> 
> snd_soc_register_card()
>   -> snd_soc_bind_card()
>     -> snd_soc_add_pcm_runtime()
>       -> adding cpu dai
>       -> adding codec dai
>       -> adding platform component.
> 
> [...]

Applied to

   broonie/sound.git for-linus

Thanks!

[1/2] ASoC: fsl_aud2htx: register platform component before registering cpu dai
      commit: ea532c29972df96fda20393d9bf057e898f5e965
[2/2] ASoC: fsl_aud2htx: Add error handler for pm_runtime_enable
      commit: b1cd3fd42db7593a2d24c06f1c53b8c886592080

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
