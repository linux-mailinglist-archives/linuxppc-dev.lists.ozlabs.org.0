Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8495EBFD7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 12:35:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McGGZ48gvz3c0g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 20:35:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LI+DMpEb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LI+DMpEb;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McGFx6BMYz2ywc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 20:34:29 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C8DA3B81ADD;
	Tue, 27 Sep 2022 10:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3863CC433C1;
	Tue, 27 Sep 2022 10:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664274862;
	bh=Owy1eL2zE7HjhpIKBG9ABMOlVvTMODzZLcYVa8P0yAg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LI+DMpEborBOpALwawGLrA7Gp6QTKN9vCaonpEbHUS3pywUfHGgbjEcLZVvOGuB24
	 oCikCvvncq1xAOHSRShgaZ6wxdyjW5P+R6TGVLFNuyVPbzlJZTf2aXuJr6/bx8rnOI
	 Rfz09p+BdnMsKCUr7OXgWFntqOCcEP/V9RAtcOdh/TfA+fMml7FIHaNFIYNfGNi2T6
	 pVTHWOy8bnlEN+NiFxJQ/aNvqVKTFbkKlRyg7hzf1oVtGUQ65ZEspimTMYmEGh1/Mf
	 1mZ/3uhLCUfEWzMTbWKrA0AZwxgYvCroGbmaPt38qNEfwOZ7iAggm57nihzPjI8e7H
	 b19wcoTmMwgPA==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
 shengjiu.wang@gmail.com, alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com
In-Reply-To: <1663928147-10106-1-git-send-email-shengjiu.wang@nxp.com>
References: <1663928147-10106-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [RESEND PATCH] ASoC: fsl_asrc_dma: fully initialize structs
Message-Id: <166427485994.60697.4779578506404492678.b4-ty@kernel.org>
Date: Tue, 27 Sep 2022 11:34:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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
Cc: s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 23 Sep 2022 18:15:47 +0800, Shengjiu Wang wrote:
> From: Sascha Hauer <s.hauer@pengutronix.de>
> 
> The driver uses two statically ininitialized struct dma_slave_config,
> but only one of them is initialized to zero. Initialize config_be to
> zero as well to make sure that no fields are filled with random values.
> Let the compiler do this instead of explicitly calling memset() which
> makes it easier to read.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc_dma: fully initialize structs
      commit: 1849a1505533501ea39ed0538c2d35eba4704baa

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
