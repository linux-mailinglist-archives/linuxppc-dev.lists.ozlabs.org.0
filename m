Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D324D47D8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 14:14:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDqKP4KNkz3bW3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 00:14:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kd3PDT/W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Kd3PDT/W; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDqJl3lLFz2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 00:13:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8AAD61A34;
 Thu, 10 Mar 2022 13:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D35C340E8;
 Thu, 10 Mar 2022 13:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646918035;
 bh=t2XbWwQwvFMkiF2+x62xGVRkeCafGaXLEBPkGZlDV0E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Kd3PDT/WHiC0r1y03Q9M9UNClYYdwsirULQWFXWuwXuGjnNLph6HgKPPd/A8QeImb
 EinmR0G3aeTUv1e9T3mu4l9gFOM8zVDD/eF+2pbBvdOuewP8bI4espTABMiHg6CGzF
 FPBMA6BuWGslBd0AOh1pO1+Fn+IupyZRzK/Cm4wsUZ3WtZi97iN+Cb8B6xmEczAxDc
 isEuU5Vqg1F60Jud761jRazT83SfiDMiyQ7MKCk5MUUX71un25KK7XpFETsY9m/3bA
 t/OcZ5PgchwWdbxi+JDpaOHXPiDtMgDXxukd0wCWnXDzWY34OWm+P0PQYz0esItPiV
 3OKywL0t0lepQ==
From: Mark Brown <broonie@kernel.org>
To: s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 shawnguo@kernel.org, linux-imx@nxp.com, tiwai@suse.com, xobs@kosagi.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Wang Wensheng <wangwensheng4@huawei.com>, nicoleotsuka@gmail.com,
 shengjiu.wang@gmail.com, festevam@gmail.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, kernel@pengutronix.de,
 Xiubo.Lee@gmail.com
In-Reply-To: <20220310091902.129299-1-wangwensheng4@huawei.com>
References: <20220310091902.129299-1-wangwensheng4@huawei.com>
Subject: Re: [PATCH -next] ASoC: imx-es8328: Fix error return code in
 imx_es8328_probe()
Message-Id: <164691803138.2018412.9652252221395822627.b4-ty@kernel.org>
Date: Thu, 10 Mar 2022 13:13:51 +0000
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
Cc: xuqiang36@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 10 Mar 2022 09:19:02 +0000, Wang Wensheng wrote:
> Fix to return a negative error code from the error handling case instead
> of 0, as done elsewhere in this function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-es8328: Fix error return code in imx_es8328_probe()
      commit: 3b891513f95cba3944e72c1139ea706d04f3781b

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
