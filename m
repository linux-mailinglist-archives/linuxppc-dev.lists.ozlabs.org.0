Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A42B1646067
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 18:38:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NS4Jf414wz3c38
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 04:38:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f4VXUaOB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f4VXUaOB;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NS4Hf4MyKz2xJR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 04:37:50 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 94B2A61B8E;
	Wed,  7 Dec 2022 17:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E7EC433C1;
	Wed,  7 Dec 2022 17:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670434667;
	bh=l/hr3BP10VYHJeYpDguxTDL8VV9ctO18e0697lGL23A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=f4VXUaOBnDz1nVz+ytjxdy2D8CLl7kX5Yv5JY7ql4RBSUAdMti8E9PaBszdkfKYZ1
	 MYNoLzCpxrZcdneiYmj1GJkI8gwHzcwY48M8Johq3/l6KUpsm+ouFPNmhktLAjx2lF
	 xTdjiI+/XELJ0DB6PQA3S+m28IayyyyFBVZVfSHsc+SsF3180cqLhJtkXF/pOSng6l
	 HXrCrAn6PZvOQJ0LxlyaZ1c2MdMOFomHENjXyZ+R3xvH6tRQzWDEM/ueaNl/iA2UUS
	 x9MdwjM5lAEr1qpVSEM9U49KiGhnJK7lk00Wb++6Gfohrt7PvZDN46gjbAcic34BID
	 Q2LuIxwKdnDpQ==
From: Mark Brown <broonie@kernel.org>
To: ye.xingchen@zte.com.cn
In-Reply-To: <202212051943476482106@zte.com.cn>
References: <202212051943476482106@zte.com.cn>
Subject:  Re: [PATCH] ASoC: imx-audmux: use sysfs_emit() to instead of scnprintf()
Message-Id: <167043466270.393374.10705355616730317824.b4-ty@kernel.org>
Date: Wed, 07 Dec 2022 17:37:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-b77ec
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, xiubo.lee@gmail.com, shengjiu.wang@gmail.com, s.hauer@pengutronix.de, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 05 Dec 2022 19:43:47 +0800, ye.xingchen@zte.com.cn wrote:
> Follow the advice of the Documentation/filesystems/sysfs.rst and show()
> should only use sysfs_emit() or sysfs_emit_at() when formatting the
> value to be returned to user space.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-audmux: use sysfs_emit() to instead of scnprintf()
      commit: a39bc7cf8e284653fb6fd9d897f269f4ac80cf52

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
