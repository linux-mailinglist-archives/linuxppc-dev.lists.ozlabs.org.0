Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B842348566
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 00:40:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5PqW4tYsz3bs1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 10:40:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VQ+wU+ly;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VQ+wU+ly; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5Pq42srkz2yYr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 10:40:00 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88BE461A25;
 Wed, 24 Mar 2021 23:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616629196;
 bh=sE82qgo6DjUJmVvzp7IsDmSwvXE5yvUHIUem2fZuhbE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VQ+wU+lyP9CR7fqVu3PRXeHIlED38cpAQz38kOSLpgcmSZxOTXq0cAFXPgz82hONa
 1hRlLEgKcO3OMOeNUyCz8IDWRl/gsJ3iznsk0KxBA85nFIj0zfcAYCgSupxKqMOsGq
 V2t7JuobEhiwHPYN1eCaCvzUOsNwJxUku+o7/pWgQteUlwd805X773V2ysioR/i6jO
 5eSwVxEef54bTvJFElMBW84edC49K5OaPq12XZ2oGYedWIij7C8Xir5Q7pZ569onc7
 b8H/aP9aJt/16R52j4p2tPB2/pUBME7ppKZzuImbcROWQanU/wbQlclKOZ7D9aelN9
 rNDuZolLpyEaA==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, festevam@gmail.com,
 Xiubo.Lee@gmail.com, timur@kernel.org, nicoleotsuka@gmail.com,
 tiwai@suse.com, perex@perex.cz, alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/6] ASoC: fsl: Don't use devm_regmap_init_mmio_clk
Date: Wed, 24 Mar 2021 23:39:36 +0000
Message-Id: <161662872375.51441.3639448957854720448.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1616579928-22428-1-git-send-email-shengjiu.wang@nxp.com>
References: <1616579928-22428-1-git-send-email-shengjiu.wang@nxp.com>
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
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 24 Mar 2021 17:58:42 +0800, Shengjiu Wang wrote:
> When there is power domain bind with ipg clock,
> 
> The call flow:
> devm_regmap_init_mmio_clk
>     - clk_prepare()
>         - clk_pm_runtime_get()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: fsl_esai: Don't use devm_regmap_init_mmio_clk
      commit: 203773e39347922b3923df6094324d430664466e
[2/6] ASoC: fsl_spdif: Don't use devm_regmap_init_mmio_clk
      commit: c2562572467a74fd637d2d22fb773b052512528c
[3/6] ASoC: fsl_asrc: Don't use devm_regmap_init_mmio_clk
      commit: cab04ab5900fea6655f2a49d1f94c37200b63a59
[4/6] ASoC: fsl_easrc: Don't use devm_regmap_init_mmio_clk
      commit: 069b24f22eb9dba2e0886b40ea3feaa98e3f4f9b
[5/6] ASoC: fsl_audmix: Don't use devm_regmap_init_mmio_clk
      commit: 3feaba79d8f701a774815483aa0e7f4edb15c880
[6/6] ASoC: fsl_micfil: Don't use devm_regmap_init_mmio_clk
      commit: b5cf28f7a890f3554ca15a43edbbb86dd1b9663c

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
