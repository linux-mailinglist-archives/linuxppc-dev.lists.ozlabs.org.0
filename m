Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6BE66C2AA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 15:50:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwZhK1q4Vz3cgR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 01:50:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P/FlmRyx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P/FlmRyx;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwZfP0MWLz3bY1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 01:49:01 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E1B2D60FA4;
	Mon, 16 Jan 2023 14:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144B1C433D2;
	Mon, 16 Jan 2023 14:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673880538;
	bh=5y8EjuuWrUtRSX+nP9yTf8cYciNolM1/Qlkwjk/PDFA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=P/FlmRyxl1UZ2yu8AoKG/xAC1RGS9xsiQyg3XPn1KLrVgT4shshAXH62pTfP2nQ8w
	 mB7gLBsdOQ9F//nOUmtNaorUrXyo6JXXYXyFduWgUP9vfY0sKfoV0WJou4p3GhPI8W
	 XntGzAkA5Xk4SLRc6XT8NVEP0G7kff3DDtIOaSf5saPfLi3/1sX9CQbNpZ16TyrikU
	 zLPhnYQP4r7kCstDVTs/zITNir4TpwcIxVy7ja6nqepv1gU1+R/TKLYbhNXvlblN/J
	 xauurGGII/tMDWsjvBW4GMN1dRwf5W5KLkVvzDvYr8Z/pP2Vi77cb+KBSWB5Rj0y9l
	 knxQ64PU9Xl7w==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20230111161144.3275546-1-alexander.stein@ew.tq-group.com>
References: <20230111161144.3275546-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] ASoC: fsl_sai: Use dev_err_probe
Message-Id: <167388053477.388539.10455579881880286809.b4-ty@kernel.org>
Date: Mon, 16 Jan 2023 14:48:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-69c4d
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 11 Jan 2023 17:11:44 +0100, Alexander Stein wrote:
> This helps figuring out why the device probe is deferred, e.g. missing
> FSL_EDMA driver.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Use dev_err_probe
      commit: aea11bcddcafc7f548c4fa574cb6019e7690008d

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
