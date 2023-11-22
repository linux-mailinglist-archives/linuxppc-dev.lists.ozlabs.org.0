Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD4B7F4E6F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 18:32:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eIvJnsMS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sb7c40ZxGz3dSJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 04:32:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eIvJnsMS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sb7b95Jfcz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 04:31:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5498CCE2534;
	Wed, 22 Nov 2023 17:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6AAC433CA;
	Wed, 22 Nov 2023 17:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700674301;
	bh=b3bPrHVvEfkj5yHIcwFXP8t5jf2bdOaikqngl5P4eqA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eIvJnsMSKRo0Sxw8ALRT2YlbDfHrwaCl4YEAwMm986k4Dg9IwdqWMGtbGBHsKJKzZ
	 f6v1eyWxzKyoWRxoOlHO3W+boQ4GKyXb/fjK29H5IDuMwhkyYKykD7Bk8xISP1YIyP
	 O6riwcErC+giYU07cCtlZiU+hCJ8hMG1JldyNvUPl5Za7DGJrhRy+1ivpxDzpJ1CEw
	 SEApaVSTVEFhF3WswP7cG7HuOSHV0KvVUGsLtS/C/DTBK7C/uvDFut0UPmxifb6/hG
	 rf9FnGbbYI2mlAVDOIlZkA8lNN/k74pCRL5RJq4SJMLE5TLFh7fucTK4DGvIsNPKs+
	 bzfVfx0hiHHow==
From: Mark Brown <broonie@kernel.org>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, alsa-devel@alsa-project.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1700617373-6472-1-git-send-email-shengjiu.wang@nxp.com>
References: <1700617373-6472-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: Enable 2 * TX bit clock for spdif only
 case
Message-Id: <170067429848.2197522.15067671352238530085.b4-ty@kernel.org>
Date: Wed, 22 Nov 2023 17:31:38 +0000
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

On Wed, 22 Nov 2023 09:42:53 +0800, Shengjiu Wang wrote:
> The bit 10 in TX_DPTH_CTRL register controls the TX clock rate.
> If this bit is set, TX datapath clock should be = 2* TX bit rate.
> If this bit is not set, TX datapath clock should be 10* TX bit rate.
> 
> As the spdif only case, we always use 2 * TX bit clock, so
> this bit need to be set.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: Enable 2 * TX bit clock for spdif only case
      commit: c33fd110424dfcb544cf55a1b312f43fe1918235

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

