Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D969D1E114F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 17:10:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49W0rh1GnjzDqQF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 01:10:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Vt8IWFBM; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49W0Yx1phVzDqDr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 00:57:25 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B3CD20890;
 Mon, 25 May 2020 14:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590418643;
 bh=xv7x59AoctvLsjyArJKKMotK6vJa0TElIvyKjP6jGP4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Vt8IWFBMCLjX7YmfudACYHN6YkW0RjJpqgJvENaS7c5aEw29p6ZZk3RbUWC5/sUTM
 W0kL4PGYN3Yfjsa1p+kOX3PLGuw6Berq1xpEYkBhnH32um3c5Js0Xnp3yNsa9NDPw9
 S+yCeM8jYheAPvYy/g539gCH+E2VbaJCsC4CL+GQ=
Date: Mon, 25 May 2020 15:57:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, lgirdwood@gmail.com,
 Tang Bin <tangbin@cmss.chinamobile.com>, festevam@gmail.com, timur@kernel.org,
 perex@perex.cz, nicoleotsuka@gmail.com
In-Reply-To: <20200513111408.11452-1-tangbin@cmss.chinamobile.com>
References: <20200513111408.11452-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: fsl: imx-audmix: Fix unused assignment to variable
 'ret'
Message-Id: <159041861697.1370.3156349238499561936.b4-ty@kernel.org>
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
 linux-kernel@vger.kernel.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 13 May 2020 19:14:08 +0800, Tang Bin wrote:
> Omit unused initialized value, because 'ret' will be assigined
> by the function snd_soc_component_read().

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: imx-audmix: Fix unused assignment to variable 'ret'
      commit: 085c02d355ac585184ef4f00eb333cd86f6add80

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
