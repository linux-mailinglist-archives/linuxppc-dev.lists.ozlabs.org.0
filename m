Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D967F5C7C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 11:37:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ToKrq8Ve;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbZLx3Zyfz2yMJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 21:37:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ToKrq8Ve;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbZL3376Yz3cNj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 21:36:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E6238CE26C5;
	Thu, 23 Nov 2023 10:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78887C433C8;
	Thu, 23 Nov 2023 10:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700735815;
	bh=YJV1iTKu6qPVsvyoYVWKMbnX3fgFVStil93e7chH+c0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ToKrq8VebgxJYQoU3Uy6NHNhbYGYHQhLdaROjeNY784kt9VR+IDqJl/f7ZirUFbVn
	 SQwk+omW31fjS72+nlQezRXwfaTw8nR2UDNC++WicNJZg6uzW9tJu1Hipj453M6EBh
	 1FUc1Ope7A5VXVozj3FoI0GCMSBN99KkDzL57018+SqQfFV3bEWfehNfhUc5+Kv+Co
	 f7S6iHywU1pvPyilVBDZEVJkJ8v3+6BrIPYEoaJeUTOzJUClwEmLRBSXgPhLQtrSZM
	 EGt5yuUGsEi8zbQhkiJfCjQRyKYf0FkVi7msxOetGyBHLu7p/Gt58Fi5lW8c7wsuVK
	 CFwJ3nKjprupQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, james.schulman@cirrus.com, david.rhodes@cirrus.com, 
 rf@opensource.cirrus.com, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20231122062712.2250426-1-mpe@ellerman.id.au>
References: <20231122062712.2250426-1-mpe@ellerman.id.au>
Subject: Re: (subset) [PATCH 1/2] ASoC: fsl: mpc8610_hpcd: Remove unused
 driver
Message-Id: <170073581102.2204618.3021059947930734828.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 10:36:51 +0000
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
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, tiwai@suse.com, linux-sound@vger.kernel.org, perex@perex.cz, paul.gortmaker@windriver.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 22 Nov 2023 17:27:11 +1100, Michael Ellerman wrote:
> The mpc8610_hpcd.c driver depends on CONFIG_MPC8610_HPCD which was
> removed in commit 248667f8bbde ("powerpc: drop HPCD/MPC8610 evaluation
> platform support"). That makes the driver unbuildable and unusable, so
> remove it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl: mpc8610_hpcd: Remove unused driver
      commit: b1cea462a79316bd619173f1ded8b28202b5ce3a

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

