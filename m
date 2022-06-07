Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4880E53FBDF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 12:47:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHRrm1rBYz3dpX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 20:47:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gWeuZElk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gWeuZElk;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHRqF2bxGz3c9k
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jun 2022 20:46:17 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0DB30B81F02;
	Tue,  7 Jun 2022 10:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB98C3411E;
	Tue,  7 Jun 2022 10:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654598773;
	bh=aG9ovN6guKRQSvZdWZO5Xr00Umv+n1SAAe5wFZIzgsQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gWeuZElkb0dkbDC+RT5NbKzPN52MZIV1arnMMYpXZ8wGrRg3N3T6vEQ3mIJeC+DNY
	 F7yhLeoUEcvz/5EO4xKF/2dn+CBtbzxLsqC9GnT4aXw4RjPMA3WTgtdAWzcLOdgaL3
	 H71Yj56XsZllAODCFzxuAY1T6s15fe0m2OVwhPolS/lZCnE8Yptv+JOplb0sKKkvWz
	 LJxPj4WSaWLPMkqy8UtTwqLySqll9+NjvUvs1oXCe7ODW2aJijeDG9rrBOxA7VJWBs
	 gKMOswu/apRM1uxpAGXyT6BCbvR0cRxYlf1Z0SztU/NeiUz7icaiNjXma8eyPY/oiI
	 7Od4yj4g3f3fg==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, m.felsch@pengutronix.de, lgirdwood@gmail.com, shengjiu.wang@gmail.com
In-Reply-To: <20220601092342.3328644-1-m.felsch@pengutronix.de>
References: <20220601092342.3328644-1-m.felsch@pengutronix.de>
Subject: Re: (subset) [PATCH 1/3] ASoC: fsl_sai: use local device pointer
Message-Id: <165459877177.301808.17694507316184674663.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:46:11 +0100
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 1 Jun 2022 11:23:40 +0200, Marco Felsch wrote:
> Use a local variable to dereference the device pointer once and use the
> local variable in further calls. No functional changes.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: fsl_sai: use local device pointer
      commit: f53f50ee21d46094a8c48970e95e38a4deaa128e
[3/3] ASoC: fsl_sai: add error message in case of missing imx-pcm-dma support
      commit: 22205521770ee740f64a3ec90301f50e34738cfd

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
