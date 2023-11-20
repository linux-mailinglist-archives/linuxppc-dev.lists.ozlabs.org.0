Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EDF7F18AB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 17:33:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HUHEghF6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYtNW6HJ5z3cWF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 03:33:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HUHEghF6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYtMf2D84z3bpp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 03:32:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 899B56131B;
	Mon, 20 Nov 2023 16:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E810C433C7;
	Mon, 20 Nov 2023 16:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700497945;
	bh=Eg3tImi0mkQCJ6HTRCQEvLgTbOvveHdT1JhyGy7bH0s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HUHEghF6E+qzSd15aJUyYWeSJUKsr1IzS9i9+xZxN4m8pOdmEhBkgF/ISiGsBlND+
	 dCcapm+e1iIIJnU51NzBR3P2CPc1AO2o08miWDdxmUJikvKrUFmPlioKQXTKcFuayc
	 cKOxL4Rqeg22g3QB+syVToGk/e9mVk0uTjfnjWXTqGIuOhodjPLJGcKNEfpO/QUm6B
	 +3tMTN4WAErI05g0qQzuQvCJVjmtRgAiCreuUUVcb0DTKKB5xLdkjVXMdOBzhm92QT
	 Tp54ztVpTQ3lXxbn6EGSAXN3XJK8wX26PYZzvO79/IgAIlcDEV9scCG9r0BYNo1PZd
	 3emMAV6c/euTA==
From: Mark Brown <broonie@kernel.org>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, alsa-devel@alsa-project.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1700474735-3863-1-git-send-email-shengjiu.wang@nxp.com>
References: <1700474735-3863-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Fix no frame sync clock issue on
 i.MX8MP
Message-Id: <170049794283.439381.10112729019532929436.b4-ty@kernel.org>
Date: Mon, 20 Nov 2023 16:32:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 20 Nov 2023 18:05:35 +0800, Shengjiu Wang wrote:
> On i.MX8MP, when the TERE and FSD_MSTR enabled before configuring
> the word width, there will be no frame sync clock issue, because
> old word width impact the generation of frame sync.
> 
> TERE enabled earlier only for i.MX8MP case for the hardware limitation,
> So need to disable FSD_MSTR before configuring word width, then enable
> FSD_MSTR bit for this specific case.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Fix no frame sync clock issue on i.MX8MP
      commit: 14e8442e0789598514f3c9de014950de9feda7a4

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

