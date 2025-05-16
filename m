Return-Path: <linuxppc-dev+bounces-8617-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB04ABA27E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 May 2025 20:09:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzZpY2BD3z30Sv;
	Sat, 17 May 2025 04:09:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747418949;
	cv=none; b=WJGDKvwkCawaiTcYdyHxXrl0mZ6GOpllQSvFD/eCFL+KqSR6z7+wVp4ZO10f8oWC1+U+bNz7gz9FvAlnfeaLtVgZ5Xsqaf6dIok1dRNQDeqPBeCLD8dJED+lOhFCOflqdEVL4UQyV5UsJFT5HLUY9Eg5Vu8uwO1Ug8MU8zc6YYBqi4MbVEDvV/s5ydS4Zi9eX5AfsyqgwAkbJmele7Z1qxVDvB2hQPYSjei4virIRMKN6HDouBk+0+NlIZr4xDp4Zcmj2pu+hRKXIP7rFCBiGgtDvf5F7oROX6GNXLb2Ruw1VjijrjM6n1mYb/4V4yVuEcLu5F+xjmQBiLzbYCzvhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747418949; c=relaxed/relaxed;
	bh=rScaES0RJ3yXNAK/9VKm2KSwfh8fK1K2BIJJ/uwvAhE=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ctgLyvDRPQK2UKate86urM1FSi305ccFQ/n3zvpxKRNu0Oa6d919kqJ7tEH8lesxl1DfGOVQpjwUizX82xDa6SEuvW8jjQ2sv0EqCmHktwPxk2+IxcWIytBPngsdbcCrH6qb51im//dRbrorOhcqbRwf5Nru021kqS7DY2x99LhFhimZTINtRTrxOszy2gG45rrwKtFE+2nlhb+s3A4lz5MYHBenOZ6L2L6Eb/h7V8C14H8ZI+T9dOFRf0quWFdLmKL0Mk13j+hFcHpa8mvhZnY1fr1+XFA2729kV5+0+WN3Sk93kgO6lRHiL2w8kSxNFaqdCY4v0h2hl5qVEo1QZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V+sXX/AT; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V+sXX/AT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZzZpW5hkZz30RN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 May 2025 04:09:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C5884A934;
	Fri, 16 May 2025 18:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB871C4CEE4;
	Fri, 16 May 2025 18:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747418945;
	bh=wMHgGX4f7A4OzkkEqROlTliCv9zoUibb+ojdtAqddm4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=V+sXX/AToaSjCoTCT0M/v/i4+YCXkUlMX1vJYCGkDzdT56QjIC19Ez3JNS1YlAs4K
	 8JJUBuJQpgp3Bk8kRGSexl0j3P3rPyZbXNE19Tw/XlgfIJZ3tPyp48LNRpFDrrzESa
	 ZLzgeBH7GH+imVmHiPLs/8v1DlOqgy+fzx2bhwoxGQbRad/nHd3p72RcCvju80m5vV
	 5sZymBlvJ90oMRHijywzR6+qUB+cahiDt8QYG0w8uNzmUyFH2NOBgsOV4Q/1SGDUzt
	 uqxkE3qUqfA2NACt7iShBekweKBHFzbkILZLCoWgZ7ASQS5x7p2foePVIM3ah4z3VS
	 NcdcXE5ZIbASQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250516080334.3272878-1-shengjiu.wang@nxp.com>
References: <20250516080334.3272878-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: update platform driver name
Message-Id: <174741894247.384649.627225363726173031.b4-ty@kernel.org>
Date: Fri, 16 May 2025 19:09:02 +0100
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
X-Mailer: b4 0.15-dev-c25d1
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 16 May 2025 16:03:34 +0800, Shengjiu Wang wrote:
> XCVR driver is not only used for i.MX8MP platform, so update driver name
> to make it more generic.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: update platform driver name
      commit: c132d8d5ddfdc1f91fb1d0feee84912daa357f0d

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


