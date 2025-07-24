Return-Path: <linuxppc-dev+bounces-10396-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3186B112D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jul 2025 23:09:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bp3XS749pz30Qk;
	Fri, 25 Jul 2025 07:09:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753391352;
	cv=none; b=J2DJiq4wp83Qa4VqlkeNP18Er/Ev6zQf04nAkoj1n/sj+CGjObDDJwKPpB/rjEHbG7poqfEOiwGeN6w1oYMli9Vmdg27gzGpOSVaDGKQEpfdRDrKYsd3/oXzbNOaulaEW971mjOSZoCJpN9gkAflZtzRYygbR0nqZPXUPkBmW1+5RbP71YKZMdqiZrExEhvxVe9UtENiayanrUop2qOf5sUmnTBJT3dMJfSmX4v91EHyCB/4ivX8rjGVg75tezBKdlY5Xzaw1rCDtQIdJS0+ukeIyaIBWNZ6OgjO7jWe1Cjc4otm+rtyIEu5slnExNKB2bUKIoNFq0Xpym6nWaEAyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753391352; c=relaxed/relaxed;
	bh=pqhmSE2X/5Lf6maaZmtUIVXjvqU4jt4Au1Lyim5DIq0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ULCgNIxJ752mMD98SJy3HqT+JAbYKeznY5e5+QynMtvFJx9abH7EDKuNPsL+BPtE9ofddyEOgArC/qNZb5Zw6tu8wR3SW3O0ZTjhqC9r5l1BDxL1XqKUsBkjgAhBk9VoccJrvOKgk5EGlHYQiH/koLyILOkKnx1QkIO6ZRslcx5i5niKXpOLoFU/ZuE8LnD0GamEYzI5mkLELgrkIEgmrGuUYK1d3fjXhWCQ2Mkj65GLl8IYQUYKw9c8abrf7ST213wsSitj/pNk5qDrN/T5IgTWtWHoYEUe9Pq0j1tLLVTq1NU+gpsM/Ixcb+muV1upsr8gnGEsSB/MryBF/2oHrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=amJyI82Y; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=amJyI82Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bp3XS1mWWz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jul 2025 07:09:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 93794A539A4;
	Thu, 24 Jul 2025 21:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5043C4CEED;
	Thu, 24 Jul 2025 21:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753391349;
	bh=9hBLthfeLJohmBKsdKVC7/N8g1CIumC4Qo8te0kkv2Q=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=amJyI82YFSXU59uf+xcB/1nflwqoq8fm8g0pbd8MAfhxMdpFCXg6C9Owt45GID8Z9
	 O6qkegnIzv2rzXQISHEExXuRyYMbHpZJdlhYCQlEN0ysPQ9hj711/COZcSZhFzaa8D
	 smZpp6unNhchBAbQt0+kNeQ0ueesDKOjKgQUqsIycVVT1+2qoITqLMOGapk+pscQJX
	 H/Ui85egm+n9Bn3lS9hCQoSF3HcMWT1i8r5aM6gHCy/XHNr9bZvHb4hE6uCGUIc7Zw
	 jbs+izz4PMj4FFDH3MT15/09icj4HhsmAnuTxUSm5sL+OC9uD9g3DYfy7VEC2gZByu
	 4LLhfrHzZeB0A==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20250619062413.3946142-1-chancel.liu@nxp.com>
References: <20250619062413.3946142-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: imx-card: Add WM8524 support
Message-Id: <175339134540.153218.11280213676101043795.b4-ty@kernel.org>
Date: Thu, 24 Jul 2025 22:09:05 +0100
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 19 Jun 2025 15:24:13 +0900, Chancel Liu wrote:
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


