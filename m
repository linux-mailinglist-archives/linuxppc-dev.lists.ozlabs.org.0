Return-Path: <linuxppc-dev+bounces-7648-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5377A8836A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Apr 2025 15:56:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zbpk03QD1z2yqh;
	Mon, 14 Apr 2025 23:56:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744639000;
	cv=none; b=EvU8H6Bsx08yOvzm64ioLGrPdIIyy46mu7KbHThMf5VQ68z2KYCoPQzEwgOAOHObXbANqH1bipvJBP/NKBc/7JIgug78sei4zL817vTeCQhFXpAZkGSjVq7osAXk4vSQlCA5XMjDjBQcc8OK7jFsa9ZK8T9XcV0NYK6tWfsabJFnci0uyvojoHKQXzG0Q4mTP3Ncg6iGsGq3uQR4xVXpj0Y3E57S0JXYtgvhsjPwtX8uakJJ2ivr5AW16I2QsKAT7XO5TEOFMrv7ErDevhIsmZ2hj9e0dbdauIKa0jzU+QgRXpBrVkKI+S79ytQ6qZFlQUJTMbRPZAJeWAjXE7Yhyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744639000; c=relaxed/relaxed;
	bh=C2YzrtzksWoByah64h8ARraUHZCef7Jene9biKZAWp4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Z74xMGh0iUVM1Tlu05XAXJBdimkhe8L+FKPAjVXSucco0ahkfnmnSP6NSbez7yUIoiS/bhnq12QTp8yn9JJUZcssjzgY9OPYo2U7K2jTgOARw5FLwVm8vq18vJk9jc67Gs2Oejb3nNMl/LyU5Q/x4gBGuDwTT+J+mEEwYF39gGfLFwTLWLVGw2jphHMs73wB6lWPynKPZCkzLJ3zHl+xM/blDXLqbHmwQVRFGp+ouGCAH3JtRAg84evbYu8aWh3/C4JScd0FKQyhBK6bxa5wJa75Sr+7AwEA3pCOmNgTqLrDgysHY4GpMwM+LwMJR54oNP1WtF+NZAxSmzwDNB8G6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dB9UyK6S; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dB9UyK6S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zbpjz4NRCz2ygD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Apr 2025 23:56:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 35D1EA49EB0;
	Mon, 14 Apr 2025 13:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C9CC4CEE9;
	Mon, 14 Apr 2025 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744638996;
	bh=29CBNrmVgcleWs/1i5/OqniYiRJUuyIR6MeG209LKl4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dB9UyK6SQsNlLJcabiwyJemljW95vqKAZb2O+9EN0pHJJD4rbL9lQ4Ohw/AfdmmgN
	 CMnJDLQwZpaoY8YuzyQKS2rY6NCLm3dkEyxdKkL87/xntcZLoFiUZ42XgjxPDc/pya
	 q4GaI+GpiTLItc6p744cWrh3e8g939GMhB9+0wPAd4vDR0/qsNfiBbMJczwiwO0E5X
	 9pu5CPEBYpATSg+mXYSodFS8TppSG98JDRpO9gGuKwERLnaRm3L/Mn0l7hkCTlaxDP
	 gIz21jKkd5wmWERLAuw/Q6muYYbq8k7vM/otixiVJRe7nJObgG5h/oiC7oEMdhvqdl
	 /8ofSeiRwUdMA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 Chenyuan Yang <chenyuan0y@gmail.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250406210854.149316-1-chenyuan0y@gmail.com>
References: <20250406210854.149316-1-chenyuan0y@gmail.com>
Subject: Re: [PATCH] ASoC: imx-card: Adjust over allocation of memory in
 imx_card_parse_of()
Message-Id: <174463899312.86688.17897930299767743328.b4-ty@kernel.org>
Date: Mon, 14 Apr 2025 14:56:33 +0100
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 06 Apr 2025 16:08:54 -0500, Chenyuan Yang wrote:
> Incorrect types are used as sizeof() arguments in devm_kcalloc().
> It should be sizeof(dai_link_data) for link_data instead of
> sizeof(snd_soc_dai_link).
> 
> This is found by our static analysis tool.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
      commit: a9a69c3b38c89d7992fb53db4abb19104b531d32

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


