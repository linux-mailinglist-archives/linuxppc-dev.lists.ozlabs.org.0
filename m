Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B2B261728
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 19:27:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmBsl40zbzDqNZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 03:27:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=L8+4aczg; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmBl658vBzDqRb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 03:21:22 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E757206B5;
 Tue,  8 Sep 2020 17:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599585679;
 bh=l5Q+9JBKRPoCD6QymRFJVpPNknfC6qEsMVteCOdwfp8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=L8+4aczgivxtFFzt6J8jzxpFMUENyq/HhBGekGW9/9I+NxKIqJmk5IgRVkwEVxBzD
 LsGocg1cJ8V1KkWcHUDwZQ3MmqVUi1TbsAZ63bvPXTz/Q2PddnRChMjljXf3wAjyb9
 jgnrkTYj1E6uMVIN3jnNF+LsnoXAeVZfD7s3hUMk=
Date: Tue, 08 Sep 2020 18:20:35 +0100
From: Mark Brown <broonie@kernel.org>
To: kernel@pengutronix.de, lgirdwood@gmail.com, xobs@kosagi.com,
 nicoleotsuka@gmail.com, linux-imx@nxp.com, shengjiu.wang@gmail.com,
 tiwai@suse.com, s.hauer@pengutronix.de, timur@kernel.org, festevam@gmail.com,
 perex@perex.cz, Yu Kuai <yukuai3@huawei.com>, shawnguo@kernel.org,
 Xiubo.Lee@gmail.com
In-Reply-To: <20200825130224.1488694-1-yukuai3@huawei.com>
References: <20200825130224.1488694-1-yukuai3@huawei.com>
Subject: Re: [PATCH V2] ASoC: fsl: imx-es8328: add missing put_device() call
 in imx_es8328_probe()
Message-Id: <159958562064.16576.4755759237768710693.b4-ty@kernel.org>
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 yi.zhang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 25 Aug 2020 21:02:24 +0800, Yu Kuai wrote:
> if of_find_device_by_node() succeed, imx_es8328_probe() doesn't have
> a corresponding put_device(). Thus add a jump target to fix the exception
> handling for this function implementation.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: imx-es8328: add missing put_device() call in imx_es8328_probe()
      commit: e525db7e4b44c5b2b5aac0dad24e23cb58c54d22

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
