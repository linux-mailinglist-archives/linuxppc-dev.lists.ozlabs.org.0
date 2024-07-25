Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 125B593C6B2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 17:40:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LGFaBFor;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVFTP0FMgz3dBw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 01:40:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LGFaBFor;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVFSh5hQdz3cfK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 01:40:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1371CCE13A5;
	Thu, 25 Jul 2024 15:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7161AC4AF0B;
	Thu, 25 Jul 2024 15:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721922000;
	bh=b1xxyMOUKEHTM0fgA7cD5Ky7WM4hglICYTCKS++76WM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=LGFaBForeYM7v7INCmm8bGVhoycA1yBXjiM4EkajMOqGcSngGeisvOGul/VNRlRvV
	 X2+DZ3exNLic5d3hTcEPUV6JcJS2Y9nHCvuaRwxPyPHVRVKtFbczyE0YtKCnvvlV5K
	 MOtjzMAea32xMcAlHbw8z6wZmT2F0AO3wFJ9zo9WVtDiy+DVOvOpc30OeGhTL7gKIV
	 ZSKHKyiS7DrkkNIL1+ivKOf8b9BY3/v9eLwUSxPllsCQ2IoxM7gLRF834HeERh6ns7
	 gqX/sNYkALTRA3DXBUH2eHlEAGnadBA3hc6cy43mIqKarCkZGQ2bx8dWdRCFribHV4
	 LoNM5DdOCMRAg==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 elinor.montmasson@savoirfairelinux.com, alsa-devel@alsa-project.org, 
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1721877773-5229-1-git-send-email-shengjiu.wang@nxp.com>
References: <1721877773-5229-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Dynamically allocate memory for
 snd_soc_dai_link_components
Message-Id: <172192199718.45693.5848047744878489432.b4-ty@kernel.org>
Date: Thu, 25 Jul 2024 16:39:57 +0100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 25 Jul 2024 11:22:53 +0800, Shengjiu Wang wrote:
> The static snd_soc_dai_link_components cause conflict for multiple
> instances of this generic driver. For example, when there is
> wm8962 and SPDIF case enabled together, the contaminated
> snd_soc_dai_link_components will cause another device probe fail.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl-asoc-card: Dynamically allocate memory for snd_soc_dai_link_components
      commit: ab53dfdcdd1ec8df8729890aefa5b0e3c900afbb

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

