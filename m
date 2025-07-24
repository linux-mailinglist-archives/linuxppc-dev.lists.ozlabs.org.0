Return-Path: <linuxppc-dev+bounces-10397-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C47F0B112D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jul 2025 23:09:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bp3XZ6fprz30Vn;
	Fri, 25 Jul 2025 07:09:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753391358;
	cv=none; b=Aqr/7wWLcMOOgu43ZmqcyqO3Hq7JGIk/0ArOaeTu9/r1UaqgxYIa8Jh0NSchfgry6sMOPgTS6XX/CJYiGNBhVjJDgoZIppNs3pTLQ7zPLqmV54nHkSyrNrQkxsqKoy1B3w+sfoOP27EsZ4xNuDL79LjolzPHsUKPPVdsFh9GiiKy9DAwiSy4/6L2HRTGQU/mBIyYbRg5uc2aNx5qkf/H2TO1JZwCNl31ZvHC4y7eGP68vhdR+MldrM5HR8tTFtfyqXECbo9oI9htaka4zHZKEymdeAbAbgokTvbSvFRSlJubRK+v6ALaiRg889iMsIy7WOrIaQ7C83TMFP3TkMoDhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753391358; c=relaxed/relaxed;
	bh=AkKQVebZcfp02bC/BwmgMQh6wZWPlUvYsPa7sRk1EU8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ngGt0CNqhjyJHmNonx4gyxgnjPG+HHsMAJbGwddj4wU7w0+N70cqoYohrIitEYJTouJ8ciLqJ8w7vS6/YJw3ZIMkjiTy8DYIOWrzGoNIjCaTKfzewWE8JsfpgCkCGR+VxnGCeZwpW+RQr664xRu918psmo3qfd3l+gPeueGoTPWtSyZfuz5NvTh3rf2iLD+H2D89JsIjpSte6z81ARAdguUM2Cb5GSWeqjAtS9TA8z1Tbi2hjbAIwG204MBwzdtQWkQYtZ4ADakpcJRJv73A+vJ4BF79CE6HR5kcn/t5k+AbPnPTZdwTzzPDQFBm2RGze6HZ+ESZhu8HZ4Q/UByG6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gSepwrjY; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gSepwrjY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bp3XZ2d4Xz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jul 2025 07:09:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2AC4545AA6;
	Thu, 24 Jul 2025 21:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BD2C4CEF5;
	Thu, 24 Jul 2025 21:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753391356;
	bh=nWp31srlWOly544EzYSydGTw01FUN6i0u3AAl2ah1sE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=gSepwrjYRHTadeORqfLdJJj+3A5uUgVNePHG2U2rxx0RxjUgeRkA8SD5R6E7W0Tqk
	 B0fIKoVSPZZsj9OhUXd4zAFk1438aywHt/cseC0oSCJtKbvB+w5yZMpj6bSZ/7ADMX
	 GhwVrY0Vaod6B4sgsx/UJB1V05XjCWpHcBC8yy3FqpsPdsfNtkIf70TCYrodVxsbLA
	 zsVSZtn0KHqqAneBwN+VztaWKUmybaFZCIZEAQwt3gRECNgvn0DjNg370fAPdc9sAM
	 9NpyUM/m6Bqh+D+IWde95lOIdzaZbOioE92BQicoNFL/C0reV5JHFc8tlsDFM0yHG9
	 P/EQf23ZcC52A==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20250723073725.787844-1-chancel.liu@nxp.com>
References: <20250723073725.787844-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v2] ASoC: imx-card: Add WM8524 support
Message-Id: <175339135330.153218.9643329948012933654.b4-ty@kernel.org>
Date: Thu, 24 Jul 2025 22:09:13 +0100
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

On Wed, 23 Jul 2025 16:37:25 +0900, Chancel Liu wrote:
> WM8524 is a stereo DAC. Add support for this codec in imx-card ASoC
> machine driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-card: Add WM8524 support
      commit: 2260bc6ea8bd57aec92cbda770de9cc95232f64d

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


