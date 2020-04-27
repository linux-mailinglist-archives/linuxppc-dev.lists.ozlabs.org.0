Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A64AE1BA456
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 15:13:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499lZT1XhPzDqcm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 23:13:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=TGwGFnbh; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499lV45HJHzDq63
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 23:09:16 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 643F22074F;
 Mon, 27 Apr 2020 13:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587992953;
 bh=F2J5+tCyCW2blznWC3DoSWefBae/flCTMt9vpZT3jpQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=TGwGFnbhgQsP++okUZdhRpPetk91J/pmzJ3IZb7o7KWrWLNaye1tT9g9iFKbb6HOP
 R5Mz+EMS9WZ7ajlO028s1+ZYpR1BABPxXrJI7jV5I2HqBFQPiUdJXuMna/DYWGF0NI
 2/8/qwkasN9awJw28hjtggcP5QFH8Wi/l08yoROs=
Date: Mon, 27 Apr 2020 14:09:11 +0100
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, timur@kernel.org, alsa-devel@alsa-project.org,
 tiwai@suse.com, festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com
In-Reply-To: <d23c939f1c9eeb3fce34b6c34d44e2d6156f663a.1587799355.git.shengjiu.wang@nxp.com>
References: <d23c939f1c9eeb3fce34b6c34d44e2d6156f663a.1587799355.git.shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl_easrc: Check for null pointer before
 dereferencing "ctx" in fsl_easrc_hw_free()
Message-Id: <158799293953.30174.7045413410563193676.b4-ty@kernel.org>
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

On Sat, 25 Apr 2020 15:19:29 +0800, Shengjiu Wang wrote:
> The patch 955ac624058f: "ASoC: fsl_easrc: Add EASRC ASoC CPU DAI
> drivers" from Apr 16, 2020, leads to the following Smatch complaint:
> 
> sound/soc/fsl/fsl_easrc.c:1529 fsl_easrc_hw_free()
> warn: variable dereferenced before check 'ctx' (see line 1527)
> 
> sound/soc/fsl/fsl_easrc.c
>   1526          struct fsl_asrc_pair *ctx = runtime->private_data;
>   1527          struct fsl_easrc_ctx_priv *ctx_priv = ctx->private;
>                                                       ^^^^^
> Dereference
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: fsl_easrc: Check for null pointer before dereferencing "ctx" in fsl_easrc_hw_free()
      commit: f3fc1ea011f09156886e8f4beb240ea814f2197a

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
