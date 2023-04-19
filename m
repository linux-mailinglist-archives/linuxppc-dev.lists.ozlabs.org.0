Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 341AE6E7C8A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 16:26:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1jlB6bnpz3fZm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 00:26:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WZkty0bQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WZkty0bQ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1jgy1J9Hz3fCn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 00:23:26 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7454F63FC1;
	Wed, 19 Apr 2023 14:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADC8C4339C;
	Wed, 19 Apr 2023 14:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681914203;
	bh=Y7NtdRvmYffAP0FrGkf+Pv8B5hj7E6uae/PQvl6MaS0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WZkty0bQqzMKfoyrRccbSKpbRiEzNS5m3vNdN9kjx4OK+ujf8Dr7zDBRIDEJX7l+A
	 /oaqUG6MTOm2Cb3rB6COeQ69GRfdloleSwXfcmCkf5mLvVTqyXGlK0PoJLGmR9UayM
	 R/TStqm3LXaUJoQ9NHiSPsVlhvt09qBj1cC/v6SEAirutEftAoikqibiLJPm/aO3Ph
	 OCpz5Yt0apuLBnaqx2riz2GDI2PWh1rJvxYYR7QZuBBnecaJtS9HuDDdpCOGF9zyXk
	 ZotnIDTRuRHkHr7lcJJPZl4fvZI49fsnsqA1KBKvAZdJOBaSdwYH6iCC0hBoydNMoY
	 /zxpAsncbTrbQ==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Nikita Zhandarovich <n.zhandarovich@fintech.ru>
In-Reply-To: <20230417133242.53339-1-n.zhandarovich@fintech.ru>
References: <20230417133242.53339-1-n.zhandarovich@fintech.ru>
Subject: Re: [PATCH] ASoC: fsl_asrc_dma: fix potential null-ptr-deref
Message-Id: <168191420102.83860.17076301173895914430.b4-ty@kernel.org>
Date: Wed, 19 Apr 2023 15:23:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
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
Cc: alsa-devel@alsa-project.org, Natalia Petrova <n.petrova@fintech.ru>, lvc-project@linuxtesting.org, Liam Girdwood <lgirdwood@gmail.com>, linuxppc-dev@lists.ozlabs.org, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 17 Apr 2023 06:32:42 -0700, Nikita Zhandarovich wrote:
> dma_request_slave_channel() may return NULL which will lead to
> NULL pointer dereference error in 'tmp_chan->private'.
> 
> Correct this behaviour by, first, switching from deprecated function
> dma_request_slave_channel() to dma_request_chan(). Secondly, enable
> sanity check for the resuling value of dma_request_chan().
> Also, fix description that follows the enacted changes and that
> concerns the use of dma_request_slave_channel().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc_dma: fix potential null-ptr-deref
      commit: 86a24e99c97234f87d9f70b528a691150e145197

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

