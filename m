Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 435D9344476
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 14:01:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3vkv1mbDz302V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 00:01:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RFdk6ckm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RFdk6ckm; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3vkN4fRvz2xff
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 00:00:44 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9AC6601FF;
 Mon, 22 Mar 2021 13:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616418041;
 bh=I1rM7cd8e3ihOuidStsjXpCvxgU1JeiBWj6CfWBrf9c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RFdk6ckm9eiho+qzdSEVj3R7AXpWUyPH5xzgSXVyLnutLIrf0qAWBmBGGzPx+gTwZ
 je3PB2ZElXSDsJKiViOINfQcTlZSEPfYTW9FdmdbwPb6ceDYXPVMsMayHCJ5DqlE2x
 9eqvzFkZ/7UedCS9HC1SSndw/e/KNW886NoG1msvllmra12pcQusywpjEkSuiKrLWb
 u8Zn3+aDwGiomWJT5m9SZISSiOo2fxR/wWumCfSHn+r6IeVRg31HcSWYKCmSdKnRmI
 NfYXc8MeFDS+HeEDkny1SQEnfWLM7yY521nel4kyjn38Nxp5rXABNm/7MyZfohtL4W
 1m+8ik2SwURSg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, festevam@gmail.com,
 timur@kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, nicoleotsuka@gmail.com
Subject: Re: [PATCH] ASoC: fsl_sai: Don't use devm_regmap_init_mmio_clk
Date: Mon, 22 Mar 2021 13:00:30 +0000
Message-Id: <161641797252.25992.12180615467371169455.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1616141203-13344-1-git-send-email-shengjiu.wang@nxp.com>
References: <1616141203-13344-1-git-send-email-shengjiu.wang@nxp.com>
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
Cc: Mark Brown <broonie@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Mar 2021 16:06:43 +0800, Shengjiu Wang wrote:
> When there is power domain bind with bus clock,
> 
> The call flow:
> devm_regmap_init_mmio_clk
>    - clk_prepare()
>       - clk_pm_runtime_get()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Don't use devm_regmap_init_mmio_clk
      commit: 2277e7e36b4b8c27eb8d2fb33a20440bc800c2d7

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
