Return-Path: <linuxppc-dev+bounces-10079-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF08AF7E64
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 19:10:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bY3Dq0Lhrz2yPd;
	Fri,  4 Jul 2025 03:10:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751562634;
	cv=none; b=AeWqRgJk6woUqNGhSWTQRsuxx8sknmQoQYyaVVRIcFRhZDI4i1wmA4RhauyIRJ8Iy4WiIEaiMta3ceak7WjlKez1vbGanxoWFFI2QjMUyklpbv9G+Zkz7wjRe+PbQ9IxWq7IYDKGQiFMpfcXZi3JCTLcVH/O26EnxBhxKrHKscBXIudGH39nJN0S8B8MFskm9g5P0eDRkLpuqlOm9/Vg49cwyroP2T4B+pRGLyogpo9mSOICF3ceO3N7SUIlTKP4/9wq5gU/6xohuouR1neM2l6HlDBhrmMlW32so/sP7qC6h8rqGqvllVR7AKHb9ccEI40/kHnWfA2OkTRwkLZKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751562634; c=relaxed/relaxed;
	bh=Q4igWQZKqN8f1ZpvNdpopowoaBAOy09IG44SgyEbavM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iCAUwTYY6ne6Q101TKWD6c4YeYVEuc37KBcfwKxdzJolH25lnzxn18ztP9tUgtPdumiF9e+uop7pElNKD7qTMDmKogJpGxrACRF/4duPQX6+eWjiFS5orTx6gXiP+lsZuhyQCN1E40IlcnKNbxLJMje9ixgqCELBf82en481zgW74AL9BvPyHNkWWnzfo7kzrtBsw41bySY2IFuG63LN7nwsk7ySL+JAnz3GSw1giwJ01k3SZmaWmE+cqNn5tpNnERbrhCY3F6zS9iuso+aDIv9GB5GuWgZ7pmBaEAjPSHjNiGfiEd7HhXbxhpbED6rAi+DRNDofdja9rCjGY9KEug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fkVZJJm1; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fkVZJJm1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bY3Dp1JtFz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 03:10:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBCFE5C3F9D;
	Thu,  3 Jul 2025 17:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDDBC4CEED;
	Thu,  3 Jul 2025 17:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751562630;
	bh=VBNBTHMTAZlDZfjt9bZrrU4QHStDFo99Vh/bJIt/n/s=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=fkVZJJm1iGyGdp1Ja5Tu7Hch65JO16hxP0lASxwcxLGUwtJQu5KhA+/rbghPX8WOd
	 n7HF7bEC35BDP86O+2jDjpro7I1wSGc0l8/kzK2wy2Wp8jyIWDFDNTZHSw9b5iLNcW
	 Yyir5cL8JKJnM6WonM33j4aBQh/yJEW2ZiQV2ybl8LxoLn4vYm2mXZQYHT6Z0vMhsZ
	 BxiIZSdLAnLWt1XC8t/lQzg1aQOHbpv0mR8aP0/jNKauYtj3QPVvTzy1p2CGCjqp74
	 PRciY3DOiw0Lw2YQ0dr8aEsMBosEPslC8LW/bMSi26BkNmP4UeWl3j7o/KyDf+Wffj
	 NsheR+fjLrhCw==
From: Mark Brown <broonie@kernel.org>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 cristian.marussi@arm.com, peng.fan@nxp.com, sudeep.holla@arm.com, 
 arnd@arndb.de, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250620055229.965942-1-shengjiu.wang@nxp.com>
References: <20250620055229.965942-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: fsl_mqs: support MQS2 on i.MX94 platform
Message-Id: <175156262671.651944.3516186569995786227.b4-ty@kernel.org>
Date: Thu, 03 Jul 2025 18:10:26 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 20 Jun 2025 13:52:27 +0800, Shengjiu Wang wrote:
> ASoC: fsl_mqs: support MQS2 on i.MX94 platform
> 
> Shengjiu Wang (2):
>   ASoC: fsl_mqs: Distinguish different modules by system manager indices
>   ASoC: fsl_mqs: rename system manager indices for i.MX95
> 
> include/linux/firmware/imx/sm.h | 20 ++++++++++++++------
>  sound/soc/fsl/fsl_mqs.c         | 11 ++++++++---
>  2 files changed, 22 insertions(+), 9 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_mqs: Distinguish different modules by system manager indices
      commit: 9931d2899eec3737f4e4fa9fc900be7329816e94
[2/2] ASoC: fsl_mqs: rename system manager indices for i.MX95
      commit: baee26a9d6cd3d3c6c3c03c56270aa647a67e4bd

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


