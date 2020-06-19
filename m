Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D8C200A25
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 15:30:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pKRv6VYFzDrPW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 23:30:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=mAoOQ5S2; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pKNx3DYmzDqyS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 23:27:45 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 26668207FC;
 Fri, 19 Jun 2020 13:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592573262;
 bh=lu3A8dgfddBJOdAh48Om/2tmW8Fdzk+zN7yT4K1Hta0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=mAoOQ5S2dI0eG+mUTj3k4LYTRCwGkCXuZ0Ed8a8oUVDhRLNiRi1OnOcQhLIEW1R14
 sdRWoDgPRRmdNx43+xX9LgOEzxcHGhUWB0f+rxdQakxaejVm1eGPFQ6fwtnP9yXLyG
 jKCk8ZQjC/AqhcH0w6Hje01KzFQyEuxeWfAvcjZQ=
Date: Fri, 19 Jun 2020 14:27:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, timur@kernel.org, festevam@gmail.com,
 Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 perex@perex.cz, tiwai@suse.com
In-Reply-To: <579c0d71e976f34f23f40daa9f1aa06c4baca2f1.1592552389.git.shengjiu.wang@nxp.com>
References: <579c0d71e976f34f23f40daa9f1aa06c4baca2f1.1592552389.git.shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl_spdif: Add pm runtime function
Message-Id: <159257325526.5735.7482602069730796749.b4-ty@kernel.org>
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

On Fri, 19 Jun 2020 15:54:33 +0800, Shengjiu Wang wrote:
> Add pm runtime support and move clock handling there.
> Close the clocks at suspend to reduce the power consumption.
> 
> fsl_spdif_suspend is replaced by pm_runtime_force_suspend.
> fsl_spdif_resume is replaced by pm_runtime_force_resume.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: Add pm runtime function
      commit: 9cb2b3796e083169b368a7add19faec1750ad998

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
