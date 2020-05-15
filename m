Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BD01D4C2D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 13:12:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Nm2W71cBzDqNx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 21:12:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=2OKpYtBF; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Nm0g14T4zDqj4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 21:10:26 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1FDB2074D;
 Fri, 15 May 2020 11:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589541023;
 bh=SLJ8q9ALaDgv+nU5BF1TbEJ2mglM/zXsGZrXaSF5RsM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=2OKpYtBFi78dOyoTHb5nG6B3uf262CEL31o5mUV0yWCV11KTrU1ZGh68tURsMZLib
 s9/tQAYeeTVvOU+AfihLQ5n4Sn3J7DFtrSccZWJdBPJZ0v4wqpp27+tM/KN8INudmv
 se6BD/ZE3sy5SJ/Huo2J2voX/QAxLh2z5RhsNN+s=
Date: Fri, 15 May 2020 12:10:20 +0100
From: Mark Brown <broonie@kernel.org>
To: nicoleotsuka@gmail.com, robh+dt@kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, perex@perex.cz,
 festevam@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <cover.1589537601.git.shengjiu.wang@nxp.com>
References: <cover.1589537601.git.shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 0/2] ASoC: fsl_esai: Add support for imx8qm
Message-Id: <158954102051.28239.13020944644998998751.b4-ty@kernel.org>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 15 May 2020 18:10:49 +0800, Shengjiu Wang wrote:
> Add support for imx8qm.
> 
> Shengjiu Wang (2):
>   ASoC: fsl_esai: introduce SoC specific data
>   ASoC: fsl_esai: Add new compatible string for imx8qm
> 
> Changes in v2
> - drop the 0002 patch in v1, the dma relate limitation should
>   be done in dma driver, or define a new DMA API for it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/2] ASoC: fsl_esai: introduce SoC specific data
      commit: 6878e75204e1d0420fd8130bad33f88053ba44de
[2/2] ASoC: fsl_esai: Add new compatible string for imx8qm
      commit: d59628b310a77e616ce2e5857e6ede5bf96c6784

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
