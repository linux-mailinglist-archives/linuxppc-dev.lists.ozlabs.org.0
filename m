Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B5D280A82
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Oct 2020 00:49:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2Sx00BWLzDqPn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Oct 2020 08:49:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ayROnTvh; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2StY1nLSzDqXq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Oct 2020 08:47:17 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0BF7C206C1;
 Thu,  1 Oct 2020 22:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601592434;
 bh=ucUxa0HaN69q6wpph89IAO8S5XFVyEHctS45bQykTig=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ayROnTvhBaiRXUk5chq6bsV9kiMz6CmC6J9M4Y+6EL41VlQrCGTv6NOoHaQMAZhqN
 LV5wrGawo78IHdC6pEk+p8Bx2fZd6Fqns30TWnYWqYYWJkIAbyfz8pciiDmEkyROl0
 6Ki78KVNUgVkCCYvxJDBNM1+KPxe7X8F0lQkjaVk=
Date: Thu, 01 Oct 2020 23:46:15 +0100
From: Mark Brown <broonie@kernel.org>
To: NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Timur Tabi <timur@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Qinglang Miao <miaoqinglang@huawei.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20200929112930.46848-1-miaoqinglang@huawei.com>
References: <20200929112930.46848-1-miaoqinglang@huawei.com>
Subject: Re: [PATCH -next] ASoC: fsl: imx-mc13783: use
 devm_snd_soc_register_card()
Message-Id: <160159237543.44588.1909303635189216096.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 29 Sep 2020 19:29:30 +0800, Qinglang Miao wrote:
> Using devm_snd_soc_register_card() can make the code
> shorter and cleaner.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: imx-mc13783: use devm_snd_soc_register_card()
      commit: bc772a46125f344ffabd7596c5b6b8c6ef703ea0

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
