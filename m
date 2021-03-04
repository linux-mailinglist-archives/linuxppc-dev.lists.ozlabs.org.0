Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE8B32C4D3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 01:56:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrXWV521Bz3cZF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 11:56:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RmOiUzLt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RmOiUzLt; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrXW54dkzz30N0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 11:56:33 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CE3C64E86;
 Thu,  4 Mar 2021 00:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614819390;
 bh=HTFsv6Fv1iYZbTyUPYTDVHFZqM3lA61amO6iQi9gLgU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RmOiUzLtiSBt3o6wiPFTH/7CT6WnBQdjuEL4dQjWNhho1+B5vpNaFuEBU1P6uVTlY
 jGXkSWC3Ei62k9+vSdzEEYKWn4LRUPvAvZZNmAgWHa3ahVuIShNcjKbkWKStqZ//uI
 zbCnkL96OGJdTfNcanMJ8tujdTxYJGDmCVzFHL5GNAE4VjAVhxp+VBgNzU7VnkBC53
 U44g+O0RvJ6s3nEao8PxuCphPWOB1GP8HQyz8wzILRFQ3vCkZuxpaFyjfPCbDklEXx
 qvKYf4snK+6fjxHfF5zd6r7R0BAkXs7xGX0p0Ge4hO99r20Z6SImNUx0UVSKElmqcv
 mIILruaj7Jc0A==
From: Mark Brown <broonie@kernel.org>
To: Colin King <colin.king@canonical.com>, linuxppc-dev@lists.ozlabs.org,
 Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20210303091835.5024-1-colin.king@canonical.com>
References: <20210303091835.5024-1-colin.king@canonical.com>
Subject: Re: [PATCH][next] ASoC: fsl: fsl_easrc: Fix uninitialized variable
 st2_mem_alloc
Message-Id: <161481924070.9553.9267870549828564094.b4-ty@kernel.org>
Date: Thu, 04 Mar 2021 00:54:00 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 3 Mar 2021 09:18:35 +0000, Colin King wrote:
> A previous cleanup commit removed the ininitialization of st2_mem_alloc.
> Fix this by restoring the original behaviour by initializing it to zero.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: fsl_easrc: Fix uninitialized variable st2_mem_alloc
      commit: 84e4eb57ed620adc0371579a5662c4924a72a306

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
