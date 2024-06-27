Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF45691A6DB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 14:48:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BOJvLtm1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8yzw2vpvz3cTp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 22:48:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BOJvLtm1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8yzD58G6z3cPS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 22:48:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 30E4FCE2E9D;
	Thu, 27 Jun 2024 12:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B8DC32786;
	Thu, 27 Jun 2024 12:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719492480;
	bh=ZSLfv18TPLtxO7NM7kuw1m/QWZeg3i2KDlFZOp8uhPI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BOJvLtm1GkcoTRy+WOzgbU7r/Oe/0Xz7nvroqA5qLxEgzWByDvUGsa2qMpVrcTPKK
	 7FK8JrKCosMIWiE2y+Gx/KXbnJ/C/eRqb9Av98AV62xyizopNUlqjhyr5O13KawpmR
	 bB32IO/nGX5uE6L2lXNZYCVQxgW8cEK1WrjhlMyyZYVbnvkn2KXA+W7WTSq6wGWN8j
	 DiDAUYqYoTGkHbVaUkp3qDTb+P+rceX5VEb+A6+ge4u1HtIlyqPA1wGgXge1E26CZg
	 HrWi3t6jKAiTIQmHzXwO2RDTsHg9/jRC/d3tMtysaH2P7NMFCrxIZ6NKIJhYmkWIpt
	 AXhkM9FnO25QQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1718174452-17596-1-git-send-email-shengjiu.wang@nxp.com>
References: <1718174452-17596-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/3] ASoC: imx-audmix: Split capture device to be a new
 device
Message-Id: <171949247673.260548.13585472243049698949.b4-ty@kernel.org>
Date: Thu, 27 Jun 2024 13:47:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
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
Cc: viorel.suman@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 12 Jun 2024 14:40:49 +0800, Shengjiu Wang wrote:
> The transmitter and receiver part of the SAI interface need to be
> configured with different master/slave mode, especially to work
> with the audiomix module.
> 
> The SAI1 TX is in master mode, but SAI1 RX is in slave mode.
> So add another two DAIs for TX and RX separately in fsl_sai driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: fsl_sai: Add separate DAI for transmitter and receiver
      commit: 15c958390460f964ec707ae6c5d1843638ebfe69
[2/3] ASoC: fsl_audmix: Split playback and capture stream to different DAI
      commit: 6232a7eb1afc842d0daf1c0314e1eda65731783f
[3/3] ASoC: imx-audmix: Split capture device for audmix
      commit: 05d996e113481fdd9ac40ccf5cadabd1e73f2404

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

