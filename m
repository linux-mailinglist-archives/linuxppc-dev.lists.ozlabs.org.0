Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D91CC1FCE7E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 15:34:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49n5d82FtSzDqwF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 23:34:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=xScVLiM4; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49n5YN1c0CzDqDX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 23:30:48 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F26DD2080D;
 Wed, 17 Jun 2020 13:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592400645;
 bh=yqPhqEFGOGGnf8tKs0A9o2GYo4CEG0qvZht6TK9uQRk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=xScVLiM4utiA2ijBBxaLGjDzdmBjZPDtyufiTw9HFMGHgIjPQluNDgj2DFGvw+pYo
 N8nxi/imPtpCa7rZp+UhzFPRJ5WLLYGglf8qZBwDPSj1IApRb4QfEm+xJoHTuAnbRT
 MQBOSJFe6KPMaImD7l+tKBDnU2IWxM+KrQ1FgZQE=
Date: Wed, 17 Jun 2020 14:30:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, tiwai@suse.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org,
 festevam@gmail.com, timur@kernel.org, perex@perex.cz
In-Reply-To: <feda3bb02296455d43aeebb7575918d9b28e1a3f.1592376770.git.shengjiu.wang@nxp.com>
References: <feda3bb02296455d43aeebb7575918d9b28e1a3f.1592376770.git.shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 1/2] ASoC: bindings: fsl_spdif: Add new compatible
 string for imx6sx
Message-Id: <159240063808.19287.10407096002593271687.b4-ty@kernel.org>
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

On Wed, 17 Jun 2020 14:58:00 +0800, Shengjiu Wang wrote:
> Add new compatible string "fsl,imx6sx-spdif" in the binding document.
> And add compatible string "fsl,vf610-spdif" which was missed before.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: bindings: fsl_spdif: Add new compatible string for imx6sx
      commit: 632108afda6aa1d380e05f1eaa25463047fd00b3
[2/2] ASoC: fsl_spdif: Add support for imx6sx platform
      commit: f61b9273c347980f570d1f9cecb867a7835c613d

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
