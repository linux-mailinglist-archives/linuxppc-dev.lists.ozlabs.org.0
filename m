Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB6B50E70A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 19:25:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnBjG4SRCz3c8n
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 03:25:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K3/sW0BY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=K3/sW0BY; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnBhM5C6dz3bky
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 03:24:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D6AD761588;
 Mon, 25 Apr 2022 17:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3953C385A9;
 Mon, 25 Apr 2022 17:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650907455;
 bh=UYeLk4eFqLkaYMknBOIlAl5C6wWequqNThJQkWUVbRs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=K3/sW0BYOT+EPsoPyW71Vl4OtX8MamBhCgTSRWFIpE9TC2uYVxWjeWDWlfZ6P2n3v
 oNBmoNIZVmX+Lnl3diZcYpwuftv5a4au4uhUcd1cfayoJswzvyuS+n9drdgyOB0rEp
 8CZU/HV5H/8Q+I2hjFEClSCpVKTpLzdqbdlgdoQdBOJ7mIdj6Gl6Pbty88pPuDNOSq
 i5fLHAoJcIaRGQRDzAHVYnCOvLCDJEscnjP3PyZ/3AJc1usBYFmVRMMUcC/ElUvnqQ
 pOpaDssmAZBcUxYm9IQooCBnRiUTfhw7SF2BHdVcFqpqiGFOjHsN0G8MBeX/Nz/QPy
 2UosfSoz7no5w==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, cgel.zte@gmail.com
In-Reply-To: <20220420030402.2575755-1-chi.minghao@zte.com.cn>
References: <20220420030402.2575755-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH] ASoC: fsl_asrc: using pm_runtime_resume_and_get to
 simplify the code
Message-Id: <165090745244.583823.17649634383855678993.b4-ty@kernel.org>
Date: Mon, 25 Apr 2022 18:24:12 +0100
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
 zealci@zte.com.cn, lgirdwood@gmail.com, chi.minghao@zte.com.cn,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 20 Apr 2022 03:04:02 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle. This change is just to simplify the code, no
> actual functional changes.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc: using pm_runtime_resume_and_get to simplify the code
      commit: d05040741afef6eb5d4366de7d5b62f700958787

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
