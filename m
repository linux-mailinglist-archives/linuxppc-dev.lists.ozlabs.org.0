Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC02248C85
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 19:07:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWHQp5dj3zDqdr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 03:07:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=uR9TA7jf; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWH9P1CmCzDqdD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 02:55:53 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C32C207D3;
 Tue, 18 Aug 2020 16:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769751;
 bh=kWZIADp0fbyfmlx1mMs190XGGSwSELp1BU6+YcV3YmI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=uR9TA7jfh5MpSxsGF3Mqvhc3Fsc5jKlT8kz8nhAYvI6PhpdUCgS/WaisC3yk2A5tT
 ROtFHmSaDLjq5evfNlKoE4nSZ/exNXuKAxwZTp/GF+e+2d88toPBiXijAfHlQddONU
 Pj1/FYuHr5KtL9DjoOhvs/2C1+75NXErvmwFnvm0=
Date: Tue, 18 Aug 2020 17:55:20 +0100
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, Xiubo.Lee@gmail.com, tiwai@suse.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, timur@kernel.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com,
 linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, perex@perex.cz
In-Reply-To: <20200805063413.4610-1-shengjiu.wang@nxp.com>
References: <20200805063413.4610-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 0/3] refine and clean code for synchronous mode
Message-Id: <159776961930.56094.11883381459081946963.b4-ty@kernel.org>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 5 Aug 2020 14:34:10 +0800, Shengjiu Wang wrote:
> refine and clean code for synchronous mode
> 
> Shengjiu Wang (3):
>   ASoC: fsl_sai: Refine enable/disable TE/RE sequence in trigger()
>   ASoC: fsl_sai: Drop TMR/RMR settings for synchronous mode
>   ASoC: fsl_sai: Replace synchronous check with fsl_sai_dir_is_synced
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: fsl_sai: Refine enable/disable TE/RE sequence in trigger()
      commit: 94741eba63c23b0f1527b0ae0125e6b553bde10e
[2/3] ASoC: fsl_sai: Drop TMR/RMR settings for synchronous mode
      commit: 7b3bee091ec375777ade2a37e4b0c9319f92de27
[3/3] ASoC: fsl_sai: Replace synchronous check with fsl_sai_dir_is_synced
      commit: 9355a7b1896f6fadcbd63d199d1f343bf2e4fed8

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
