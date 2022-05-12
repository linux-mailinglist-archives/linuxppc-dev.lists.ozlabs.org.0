Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AF1524F9D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 16:13:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzYfs0zh0z3cdP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 00:13:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=csshdifP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=csshdifP; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzYdd4dRdz2xvF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 May 2022 00:12:53 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7279661B6B;
 Thu, 12 May 2022 14:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F089EC385B8;
 Thu, 12 May 2022 14:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652364770;
 bh=0hh3VnoWdrScswPThoUAz7IHRdvYsSrWyfqva7PClQk=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=csshdifPDDyuUKSgp96tlCgn60qYxckukQoSlyWxGcwgKeeuti4z2ik9F9AnEWPCQ
 isX4F+ZF4oFv6jtdWDMIwvW7h+mwk8AMvBzc17Q4186w43TgYeDmTf5G7VgxDDn3S0
 RN9WdsvQ939yycBgwp05MFZzXm7q0mXcwul1Fs9wKvIPht9HmyUd5UZm2upwxUoOur
 YZA9p0Q+EeWkWGKVit6GzIzoN/4hnfuv1cZBflk+uW5jReIYP+qTu9YR6WEODsaKfI
 dEovtkWepZcuPx/1G0rjE+e+GeyWKsFYJZejW2RpRAuzMBaVLiFc8q95X30AlBWoxH
 g74dxMGfow4Rw==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org,
 shawnguo@kernel.org, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Shengjiu Wang <shengjiu.wang@gmail.com>,
 kernel@pengutronix.de, Nicolin Chen <nicoleotsuka@gmail.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-imx@nxp.com, linmq006@gmail.com, richard.zhao@linaro.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20220511065803.3957-1-linmq006@gmail.com>
References: <20220511065803.3957-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: fsl: Fix refcount leak in imx_sgtl5000_probe
Message-Id: <165236476669.1016627.799553310382817495.b4-ty@kernel.org>
Date: Thu, 12 May 2022 15:12:46 +0100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 11 May 2022 10:58:03 +0400, Miaoqian Lin wrote:
> of_find_i2c_device_by_node() takes a reference,
> In error paths, we should call put_device() to drop
> the reference to aviod refount leak.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: Fix refcount leak in imx_sgtl5000_probe
      commit: 41cd312dfe980af869c3503b4d38e62ed20dd3b7

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
