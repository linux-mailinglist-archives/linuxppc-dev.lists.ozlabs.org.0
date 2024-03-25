Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D6788AC21
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 18:44:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kLwbbKKR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3L1418y9z3vlJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 04:44:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kLwbbKKR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3L0J6F4cz3vYF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 04:44:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BDD14CE1C0D;
	Mon, 25 Mar 2024 17:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3FFC433F1;
	Mon, 25 Mar 2024 17:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711388652;
	bh=rwbT+Rd3okr1qwfVbwVcY3pmiq1BxSNd33xG79KtlE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kLwbbKKRSG24OfQv4aAskaKKW3cI7i4aJ5xQQ7aWR+6/oM++s8Mc83D8aJwGKZS73
	 CAMw/nWjpAlhXDnLj7wM78qsf9i11kbmI9hYKwOqG3PEEIJjnYbuTk6ESHtUqEPbSa
	 vO08va9UmZ9HQSBZ9Sv0fBbm5IC6UY8Yi8zhr+OFfauqxDdziOF30800m32EFZVS4o
	 q3jNVDMsoeoWfWkbPiDanzRTnLnJsNFUm3EUu95lSHKmEZTizlztZV7w4biGTnQEp1
	 myIG/5mLWuYaQ1zFZqQzHyI6aI0htamKAe+ZWtnbPYeBNkk5yQsxU20y88sn+mPWk/
	 fhHfANJFvAmNA==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20240314141642.2943605-1-alexander.stein@ew.tq-group.com>
References: <20240314141642.2943605-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] ASoC: fsl: fsl_ssi: Add dev_err_probe if PCM DMA
 init fails
Message-Id: <171138864957.327140.15499315160101216810.b4-ty@kernel.org>
Date: Mon, 25 Mar 2024 17:44:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 14 Mar 2024 15:16:42 +0100, Alexander Stein wrote:
> This happens especially if this driver is built-in, but SDMA driver
> is configured as module.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: fsl_ssi: Add dev_err_probe if PCM DMA init fails
      commit: 3ca49e7f9475ac06614edf1bfece123eafbdf8f3

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

