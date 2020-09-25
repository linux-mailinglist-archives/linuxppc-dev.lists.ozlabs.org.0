Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97641279279
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 22:45:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BykSh1h39zDqNP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Sep 2020 06:45:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=wTxbbRMK; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BykP25WRtzDqcF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Sep 2020 06:42:14 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4BD920838;
 Fri, 25 Sep 2020 20:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601066531;
 bh=mM9gr7QmADGTaHoBJX4KS+CFOPur7mCrz2hx6I90bGQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=wTxbbRMKHhd+IoB87nAYO/s7aUKxKtfhy0AUZAI3UqcBSrc6tPgmDi//Lzbp19twN
 IFl3lHKAokLm10rqrXHQYU5qMNfdDllKCZt9ZiW+wMiSV11laOv+IsVGUV2k+oH5Ek
 Fw82xKAYop0eOg1bxQxAwPUCQRWH3N6H9AKceWBg=
Date: Fri, 25 Sep 2020 21:41:16 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, shawnguo@kernel.org,
 nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, linux-imx@nxp.com,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 perex@perex.cz, festevam@gmail.com, alsa-devel@alsa-project.org,
 Xu Wang <vulab@iscas.ac.cn>, shengjiu.wang@gmail.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, timur@kernel.org
In-Reply-To: <20200916061420.10403-1-vulab@iscas.ac.cn>
References: <20200916061420.10403-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] fsl: imx-audmix : Replace seq_printf with seq_puts
Message-Id: <160106647646.2866.15040520105336965712.b4-ty@kernel.org>
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 16 Sep 2020 06:14:20 +0000, Xu Wang wrote:
> A multiplication for the size determination of a memory allocation
> indicated that an array data structure should be processed.
> Thus use the corresponding function "devm_kcalloc".

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: imx-audmix: Use devm_kcalloc() instead of devm_kzalloc()
      commit: f95cc5c18c15a425c3dceec48df6b4e27a202dda

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
