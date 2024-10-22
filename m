Return-Path: <linuxppc-dev+bounces-2488-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B98D9AB81D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2024 23:00:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XY4MP4t92z2xHW;
	Wed, 23 Oct 2024 08:00:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729630833;
	cv=none; b=Ep3M9J2x89QV6mZ7HZ8OZee/PNX1qHj0FEZ11HEBBNy+JodSEoc6ZTxkozP+XBEpkJTQxX1Yq0pZDFUSqBg9fGHICTHuT4wABOVZ7yTi4+AUO3KxRNpdeMcr5Dwp0db1ErHGVySvdmKH35E2/0Q+EZ5CeednnocnuaDYDrZLXTDy/tr5iX1OZMucH+N7ZLmiqupAZz6H7WiGX4JhsXUVPx3mw2CH/E5+fPYyiTWTO695hkRq9PsBRPzxQYzzJYaM791O3NJcCQm1JP+UcS8wl8Fe872GchVxrHZLiVOoxe/yaGom9HnCaaWA17fcvCd7civNCuu+EHHM6W1BG8msvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729630833; c=relaxed/relaxed;
	bh=SgupZW4ZrXxlqQVYaItaC7AY4yvNs9wYDzGkWPOY29g=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DzhhLZFz4Nvm4s79kqqCdi+3ptiUvXqsNJRrkxF/9SDPIMm/Z/FFdBGxLktbLTlK9h8Q1+vlB9V2YG42PS5zLGLnlvPLCq73cD5Api0W/xWg7k6KwAadsPOyrmWJwACql98bW6mpx2JvCr7xn703NKzuIt1Wo+OFuMzZYueArHq5Nd3t2VFysOIxZh44OSjbpZdlx7VUB9CVvu/PqRB5j+RSfZM0QNe6aCP8DnHYCILIQIL/CTZb7zMR6HwDIiAw0SlMTECgOOLwc/Th06Mcf7Ep39YKC5n3AehJRmuRarmpWnxLvcGLT8H6tfXt4efsFMYQyU+NFkFsrSzM+6pEwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sRySlJva; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sRySlJva;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XY4MN6k8cz2xdZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 08:00:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92B345C5CDB;
	Tue, 22 Oct 2024 21:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BAFDC4CEE3;
	Tue, 22 Oct 2024 21:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729630830;
	bh=xqtlUhw8rmrDSpNkrqtyPtQIJUIMIG4Xa/kCuAim9xs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=sRySlJvaDIgA7CqpeVCHlCjQ9N3IDeVH64OWYdmvNY7+5xl4VEWoVhw9/MPcuQgnf
	 CjEVJa21+IvZCM5NRpxh0eVky+wFMAVGZXkeixfxhlUvDW1I2bD9aTb2AXSGn4j2Su
	 tGtIkgCGfsoOg8lzflkZsZ93+pv5E69x6WOT6W7KHZvdy3vopi8SEAuqkgTR2FdIg/
	 aXPBI0WTQZ8L6vy3jDSa1XU2b1OeSx/koxQx95XBW/S/CM+VfiJMPkzYvchVKvBv0l
	 DI2zIFB51RfszhjbrHuyL5KorFUaGmputCN/bdy+V9ohn61/BV5Ra5CEVSs7E6NxW6
	 PLR67TCUEBhAQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1728368873-31379-1-git-send-email-shengjiu.wang@nxp.com>
References: <1728368873-31379-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: fsl_xcvr: enable some interrupts
Message-Id: <172963082823.164184.11756068817626809151.b4-ty@kernel.org>
Date: Tue, 22 Oct 2024 22:00:28 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 08 Oct 2024 14:27:51 +0800, Shengjiu Wang wrote:
> Enable interrupt of cmdc status update and the interrupts for
> wrong preamble received.
> 
> Shengjiu Wang (2):
>   ASoC: fsl_xcvr: enable interrupt of cmdc status update
>   ASoC: fsl_xcvr: reset RX dpath after wrong preamble
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_xcvr: enable interrupt of cmdc status update
      commit: 06461e288abcd6d67d0a870cd25731c79ebe66ab
[2/2] ASoC: fsl_xcvr: reset RX dpath after wrong preamble
      commit: 1e5d0f106164d2089826c16bb521891d1d06d3ad

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


