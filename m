Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE3F45FB7C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 02:49:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1F090rHyz3f7k
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 12:49:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZMTM9jxM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZMTM9jxM; 
 dkim-atps=neutral
X-Greylist: delayed 394 seconds by postgrey-1.36 at boromir;
 Sat, 27 Nov 2021 12:36:39 AEDT
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1Djg1yrlz3fGl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 12:36:39 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 382E7B829B8;
 Sat, 27 Nov 2021 01:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6360DC004E1;
 Sat, 27 Nov 2021 01:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637976596;
 bh=mdcPkROBkg6g+bcaNVjEFJmr2PWE2x4mGjdd+HKP0EU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZMTM9jxMVLZOo0Vs2eGBhYKOI2tNG4bFm5tdAEyS+K9NNLD/lLvWOLCMhmHV8LqAu
 J0BFSLxe6W1FAsCY57gZJza8++/h/vOsoiL6h43XNzuKW0GBXBeB9iUy5xObZf8fIN
 +HAZrmYvmz0F0RzL6MXSpGrEVTx9XqHi/AAVh2dV4N5HZlLGjFPhuZ54cRwDdwSlnn
 Vur7Zhm64fubEi0D3OAXVhpFaeRzzet4qpF+E/5KX1hjW9cz38IaqFPGm9Y0Z67nw4
 xpSk2zjyGL8/FoUWyRC0MC18tpYAUFiXyigTJkuVFheKwa3SZY9vvQPTxd5arWKzV2
 1xQjfkqIq1+6w==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com, nicoleotsuka@gmail.com
In-Reply-To: <20211110002910.134915-1-ye.guojin@zte.com.cn>
References: <20211110002910.134915-1-ye.guojin@zte.com.cn>
Subject: Re: [PATCH] ASoC: imx-hdmi: add put_device() after
 of_find_device_by_node()
Message-Id: <163797659312.2987942.8864055300904325575.b4-ty@kernel.org>
Date: Sat, 27 Nov 2021 01:29:53 +0000
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
 Xiubo.Lee@gmail.com, shawnguo@kernel.org, Zeal Robot <zealci@zte.com.cn>,
 tiwai@suse.com, linux-kernel@vger.kernel.org, perex@perex.cz,
 linuxppc-dev@lists.ozlabs.org, linux-imx@nxp.com, kernel@pengutronix.de,
 Ye Guojin <ye.guojin@zte.com.cn>, festevam@gmail.com, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 10 Nov 2021 00:29:10 +0000, cgel.zte@gmail.com wrote:
> From: Ye Guojin <ye.guojin@zte.com.cn>
> 
> This was found by coccicheck:
> ./sound/soc/fsl/imx-hdmi.c,209,1-7,ERROR  missing put_device; call
> of_find_device_by_node on line 119, but without a corresponding object
> release within this function.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-hdmi: add put_device() after of_find_device_by_node()
      commit: f670b274f7f6f4b2722d7f08d0fddf606a727e92

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
