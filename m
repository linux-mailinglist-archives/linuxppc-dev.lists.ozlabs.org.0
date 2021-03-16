Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCEB33DBDA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 19:01:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0Lgw60zgz3c1n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 05:01:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vk1OzZlj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Vk1OzZlj; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0Lfd0Pfkz30Fj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 05:00:09 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56D5065138;
 Tue, 16 Mar 2021 18:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615917606;
 bh=iGiBNRxaPcDr+iH013raTIVuSi+f7uXGwsktWMiJ3zA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vk1OzZljn21yoof0f5+sxZerNH5nku57uhEErWCu0wqClyD4i6+Q2gbSbinH/hoX/
 Poq/vNUJiY/GJRdmdYa4dy0OgbxuWygENGWFNGJxR89EDL9/78UysElnpg21NKbXw3
 dHmhgaKTG+tQt/c3LtCQ8qWbaLFIFrWbvqrfSGFAcNarYf5zhp/nPIvochh1Nk2zX/
 /iQmt9+9gN+yM1Qzw0QDlvx610nIKv6apmWOqSYnVYx7KkGj4UQwREqOEzXHtdR7lx
 3h+LSG2S/3G7RkIPagCZMjiVT9fa2EGi41cX+jUOfYFHx+iHShBzl51X69GHAScRa1
 i8iYkO/X4yU8A==
From: Mark Brown <broonie@kernel.org>
To: timur@kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: Re: [PATCH v2] ASoC: imx-hdmi: fix platform_no_drv_owner.cocci
 warnings
Date: Tue, 16 Mar 2021 17:59:44 +0000
Message-Id: <161591744695.13544.5664238144081084443.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1614848881-29637-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1614848881-29637-1-git-send-email-yang.lee@linux.alibaba.com>
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de,
 shawnguo@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 4 Mar 2021 17:08:01 +0800, Yang Li wrote:
> ./sound/soc/fsl/imx-hdmi.c:226:3-8: No need to set .owner here. The core
> will do it.
> 
> Remove .owner field if calls are used which set it automatically

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-hdmi: fix platform_no_drv_owner.cocci warnings
      commit: 2e2bf6d479616a15c54c4e668558f61caffa4db4

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
