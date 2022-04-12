Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6CB4FE91B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 21:51:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdGYm50Xvz3bhQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 05:51:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=blgB7Bvq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=blgB7Bvq; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdGY60D0Bz2yHL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 05:50:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3038861B96;
 Tue, 12 Apr 2022 19:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FBFC385A6;
 Tue, 12 Apr 2022 19:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649793030;
 bh=aBRM9sG0Z1BLiszeFEO4ei/zQqmpiKFPvY0NHwUIN+c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=blgB7BvqvEnC87M+Fs1165CJSFVuZayx+JdjdPn20o5vOfGgfDCF3kmR3Ldr26gVm
 +YfHynIspRgj9LS/t1IsaJIX8E5JB9bgINEjfLE0HFjOgekwCt6DFBCQvJzZyDJUcg
 UAlz6508+yLZpmSAKKLowVjeH5HPCTfko5SbCwfFrItbQdl9Q1W5Pcyu9+nmS717S0
 mNygbCXNHfc02tnYQh9z2TMhLIsU1Tw+Exv6OFci/xD+gpsBmfCUtzSKncxCFcH9Jg
 sjcITaBrMrpRhRa3uBPh37w919hSHO98WA8RgngC6w6GIAjPCdB2PKcV+YZ+f1KmUD
 P/L5fKAXOpeOw==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com, shengjiu.wang@gmail.com
In-Reply-To: <20220412083000.2532711-1-chi.minghao@zte.com.cn>
References: <20220412083000.2532711-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH] ASoC: fsl: using pm_runtime_resume_and_get instead of
 pm_runtime_get_sync
Message-Id: <164979302826.449327.17327555437837608042.b4-ty@kernel.org>
Date: Tue, 12 Apr 2022 20:50:28 +0100
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
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 zealci@zte.com.cn, linux-kernel@vger.kernel.org, chi.minghao@zte.com.cn,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 12 Apr 2022 08:30:00 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get is more appropriate
> for simplifing code
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
      commit: c721905c54d913db0102973dbcdfb48d91146a2d

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
