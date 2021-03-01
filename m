Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0EA32953A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 00:36:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqGqV51N7z3cSX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 10:36:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=soAfoHz2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=soAfoHz2; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqGq51GTRz30Ng
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 10:36:01 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A464460C40;
 Mon,  1 Mar 2021 23:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641758;
 bh=U9KY075uL17cHjLwoFUiLbiSiP9SqIwNSTnM/y5bLxk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=soAfoHz23udT1nihIMXVoEl/L77zt8KvJoAzKKCODuzbMEu5IT+OVgyt1x+5Yq8wf
 K3cGs2JDA+ujba5QtnvOnPyL/Pc5pzjyTqPOVQ/hwzO9Pbh/69aEVgyZy/HjVMGagr
 Hl8ucZXw1YB7hI0UHumWDI4B6Y8FjdCKdRKERrCQtSdZHnhNWg6dw731UnIJ2Z+N7T
 PMUpSxHZLzHv2BagWK2BhxHeO9eek1Sj3qNT6mCR8bRUwlKbjea1Gs9ymNMXg6Ik2d
 ftxJvJyeNJHYflPEMbIv3KdCXmkZEKeOcU1Z+zIOc9fFeLMH31xit6If68+8bn5Snt
 bZaUK2DF9P3lg==
From: Mark Brown <broonie@kernel.org>
To: timur@kernel.org, Xiubo.Lee@gmail.com, tiwai@suse.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, nicoleotsuka@gmail.com,
 festevam@gmail.com, perex@perex.cz, alsa-devel@alsa-project.org
In-Reply-To: <1613983220-5373-1-git-send-email-shengjiu.wang@nxp.com>
References: <1613983220-5373-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Add pm qos cpu latency support
Message-Id: <161464168098.31144.7601836731718414126.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 22 Feb 2021 16:40:20 +0800, Shengjiu Wang wrote:
> On SoCs such as i.MX7ULP, cpuidle has some levels which
> may disable system/bus clocks, so need to add pm_qos to
> prevent cpuidle from entering low level idles and make sure
> system/bus clocks are enabled when sai is active.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Add pm qos cpu latency support
      commit: 6d85d770c171972c0f33f74b84bf0fedc111e89f

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
