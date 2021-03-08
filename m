Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 281223312E8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 17:08:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvNYv0wqfz3d5s
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 03:08:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LfdzLPPb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LfdzLPPb; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvNYV42M5z2xYr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 03:08:30 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1EE6E65210;
 Mon,  8 Mar 2021 16:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615219707;
 bh=dp5CLRZ/qcCLRBLFiX1Elejcb5Arx4EDlbEp0HHDH1Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LfdzLPPbq9W7CZ7v8EHQghN3CFK/Zuhx8Ptho+UIORomAXGE68s+X9ZyN4SceEvh1
 8Br2eVy6SLaJb0vC7ecRnFhW++wAvubKpCz42XKOablLrp73rEVHca9J6/dMgr6zGR
 2Fyy2H0/RTOfVG3jkCVcfSiLYjYCAoH5MXTA+xRVLnkeUeOZ4YOwuCOJGT/sWsvURn
 wuh1Wc7dDzKQitA5V3AO41N1U/CyYFGcHJhZNTPj3AIGSrfuAOwXh9oi5XtB/QdyGn
 MDNCyBiceExcVP9s9Um6vT2rp3sTFJjMu2M1abXdD6g1WHdkGeCxzgEi59002NVdG5
 jpuMJEOK7JsDA==
From: Mark Brown <broonie@kernel.org>
To: Tang Bin <tangbin@cmss.chinamobile.com>, perex@perex.cz, timur@kernel.org,
 nicoleotsuka@gmail.com, tiwai@suse.com, Xiubo.Lee@gmail.com
In-Reply-To: <20210302125002.23900-1-tangbin@cmss.chinamobile.com>
References: <20210302125002.23900-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: Use
 devm_platform_ioremap_resource_byname() to simplify code
Message-Id: <161521960849.9621.15073900533403359434.b4-ty@kernel.org>
Date: Mon, 08 Mar 2021 16:06:48 +0000
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2 Mar 2021 20:50:02 +0800, Tang Bin wrote:
> In this function, devm_platform_ioremap_resource_byname() should be
> suitable to simplify code.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: Use devm_platform_ioremap_resource_byname() to simplify code
      commit: c5f48a78e0cb950eb821af36b8790b794cc745b1

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
