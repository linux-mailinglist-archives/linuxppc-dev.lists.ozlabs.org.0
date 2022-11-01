Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D57614CA3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 15:34:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1swz0Wpqz3cH0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 01:34:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OHqr7Vo/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OHqr7Vo/;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1sw415wnz3cB9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 01:33:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2CF3A6119B;
	Tue,  1 Nov 2022 14:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2CCC433D6;
	Tue,  1 Nov 2022 14:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667313233;
	bh=5wW5fMffXJgRHGmoyZvOIkPaV2Johu/1uvLcafbGSG0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=OHqr7Vo/xB2puwUuLILh2ggR5FlTfNTzr+bxUpXT1Q2MyStbEvdrIz+u1euEv6J5C
	 8dCmpItF0Qv4j0reelkFGia/zaYAbr7s/Nke8I8m61t15DacLt3ERd6AY7szsYhGkR
	 Z7DeaheSdF2O0g4qti0p6HiB75qEjfIPow9TH+Hd9X0qaCBnj3xVydFjtdOsk2IuA7
	 FVroEkRxkUTzjlvyk4IrzK8QZ0wO/3XKeHrDcSIJ5PFN06GO2ei+zNA02XymRv3cce
	 sQxpeRV4Gg4TnVstaAzlmSQ8ANtNjuZPDSDiKmxJKuqD93ygeKoUmuaQ5JnqNC0cu0
	 8JRE86XpHOAmg==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, festevam@gmail.com, perex@perex.cz, Xiubo.Lee@gmail.com, robh+dt@kernel.org,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 nicoleotsuka@gmail.com, tiwai@suse.com, Chancel Liu <chancel.liu@nxp.com>, krzysztof.kozlowski+dt@linaro.org,
 lgirdwood@gmail.com
In-Reply-To: <20221028082750.991822-1-chancel.liu@nxp.com>
References: <20221028082750.991822-1-chancel.liu@nxp.com>
Subject: Re: [PATCH 0/3] Add support for MICFIL on i.MX93 platform
Message-Id: <166731323052.255497.10142620061824758896.b4-ty@kernel.org>
Date: Tue, 01 Nov 2022 14:33:50 +0000
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

On Fri, 28 Oct 2022 16:27:47 +0800, Chancel Liu wrote:
> This patchset supports MICFIL on i.MX93 platform.
> 
> Chancel Liu (3):
>   ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX93
>     platform
>   ASoC: fsl_micfil: Add support for i.MX93 platform
>   ASoC: fsl_micfil: Add support when using eDMA
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX93 platform
      commit: fb3425689699daebecf27a37d729ae43ef66ebab
[2/3] ASoC: fsl_micfil: Add support for i.MX93 platform
      commit: a10a52541f644a1fdf8876d474f31a54c4142ccc
[3/3] ASoC: fsl_micfil: Add support when using eDMA
      commit: 77a7a6e9a94df0ac7ba46677b5ce4a743a931fce

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
