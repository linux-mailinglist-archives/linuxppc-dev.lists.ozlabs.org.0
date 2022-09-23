Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1FC5E805B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 19:07:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYz9R4r8rz3cfk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 03:07:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EYo3+adf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EYo3+adf;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYz8n4mfVz2xHL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 03:07:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 444B3B8211A;
	Fri, 23 Sep 2022 17:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6DDC433D6;
	Fri, 23 Sep 2022 17:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663952820;
	bh=yv65ncJXP7zLVMNN7B/VDPHTlWRGuMb/y6L+TYsAh/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EYo3+adffwYq+V60pgZhrnEsjdK72Opshe6krDmqOjpA643KcE3o8fELUUZ83oaEF
	 CakBPYWSwvHxKiUb02XOIHkv8TkZ7TkRYc+JDWvJyBbJ19cocw0y6w3j1rCNVVljMB
	 M1Pf+Cue4ZXGgZJ8bj2kNjshLULKhVznlQNYGYapbFAcqLdOWFTXo8+w/KnEDgF2hu
	 RW0mANNFgode+5S6TMw+HyJ1dhHgbTcHxJ4NDM8hn7OiqWWUBowiAWW5JxgdJECTVu
	 lcIR1V9q9O7ElSItDp6Nitb5BpSClXbhbfEuPjzzJFyQ8T3YcfV+bn1fxlg0nrtW3r
	 J95mbaH4t3xlg==
From: Mark Brown <broonie@kernel.org>
To: linux-imx@nxp.com, shawnguo@kernel.org, perex@perex.cz, nicoleotsuka@gmail.com, shengjiu.wang@gmail.com,
 tiwai@suse.com, s.hauer@pengutronix.de, lgirdwood@gmail.com, kernel@pengutronix.de, Xiubo.Lee@gmail.com,
 Gaosheng Cui <cuigaosheng1@huawei.com>, festevam@gmail.com
In-Reply-To: <20220923090355.507648-1-cuigaosheng1@huawei.com>
References: <20220923090355.507648-1-cuigaosheng1@huawei.com>
Subject: Re: [PATCH] ASoC: fsl: Remove unused inline function imx_pcm_dma_params_init_data()
Message-Id: <166395281690.610218.17739272553546985512.b4-ty@kernel.org>
Date: Fri, 23 Sep 2022 18:06:56 +0100
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 23 Sep 2022 17:03:55 +0800, Gaosheng Cui wrote:
> The imx_pcm_dma_params_init_data() are no longer used since
> commit c31da0b196f9 ("ASoC: imx-ssi: Remove unused driver"),
> and the function is used to initialize some members of
> "struct imx_dma_data", it's more readable to assign the value
> directly, imx_pcm_dma_params_init_data is useless, so remove it.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: Remove unused inline function imx_pcm_dma_params_init_data()
      commit: 4f865485e8ef1d04de23fc1def1fa4e39fb00b91

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
