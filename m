Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E6A46A3AA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 19:01:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7B7w5RbLz304v
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 05:01:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AJUiWkk4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AJUiWkk4; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7B7H4DLYz2yN4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 05:00:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 71600B811E1;
 Mon,  6 Dec 2021 18:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90F3C341C2;
 Mon,  6 Dec 2021 18:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638813652;
 bh=qOyUKJ/q4tpHts63eyHa7j3yANk+RknprGHSSCDq6dQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AJUiWkk4/dvF/Mxl/SYYahxRDSzTN/YisNZjONLfZcJmOuPoUZQXKDhkqL1aJPIS0
 AsT+MJRn9wCUp5sbiXYGPoZNgPYIYNPL+IyRETeM867t4H5PL9X/CDk5n7z4Uk+gVr
 t2Ai+kfM7zjporxfkGjlldR1X2q+DI1kFEvdeXM9sH9JLI3eKfhCpGFAkf/TF8hT96
 ubl+ajkWmBhf5x3Y8NultoU/HuqqqsRKOT4Fyd5f85PMIP8+ad2kY18g71DkaXFN3I
 96xERwQpPWTwRoASaQWUraPK9y5y7EKHMl43Z3caoSEz7hxAUSM2fdwAxXDtdWO+tR
 yr3pybWl7j5Cg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 devicetree@vger.kernel.org
In-Reply-To: <20211203175018.252641-1-ariel.dalessandro@collabora.com>
References: <20211203175018.252641-1-ariel.dalessandro@collabora.com>
Subject: Re: [PATCH 1/1] ASoC: fsl-asoc-card: Add missing Kconfig option for
 tlv320aic31xx
Message-Id: <163881364846.2769299.4416026362989007354.b4-ty@kernel.org>
Date: Mon, 06 Dec 2021 18:00:48 +0000
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
Cc: kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com, tony@atomide.com,
 festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz,
 nicoleotsuka@gmail.com, robh+dt@kernel.org, bcousson@baylibre.com,
 michael@amarulasolutions.com, shengjiu.wang@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 3 Dec 2021 14:50:17 -0300, Ariel D'Alessandro wrote:
> This is a follow up of patchsets:
> 
>   [RFC patch 0/5] Support BCLK input clock in tlv320aic31xx
>   [PATCH 0/4] fsl-asoc-card: Add optional dt property for setting mclk-id
> 
> Patch "ASoC: fsl-asoc-card: Support fsl,imx-audio-tlv320aic31xx codec"
> in "[RFC patch 0/5] Support BCLK input clock in tlv320aic31xx" missed a
> Kconfig option. Sending incremental patch fix.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl-asoc-card: Add missing Kconfig option for tlv320aic31xx
      commit: b6ce5d85b1425d3a1211f85835ab152c9bf3803a

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
