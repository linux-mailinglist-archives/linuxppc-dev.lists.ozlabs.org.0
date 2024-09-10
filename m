Return-Path: <linuxppc-dev+bounces-1221-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA599745BE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 00:20:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3J6h06Vyz2xZj;
	Wed, 11 Sep 2024 08:20:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726006811;
	cv=none; b=YIfou8KC3QSaQZ5moLskCvifHTda56AsxjGfaiB/f7Pj5f03MWffxPEQBhRN7BCUPmXnl1TKBQRVMMezBSHB6R/fJN2/16H8UPdTy3bIwjSisUhpOPLqwkIIQx4B8Kq0u1OpxXByr5EwpSJz0isObCURAwhkMQN7Yay53vChhIKWG7Pf31ZlgK2uo1/s/8BcbkDKR2PPG+FmiwYNqRK5IB+sCnqOp4aGknAJNMaiMPUYvscWv81SD3s5dzSMUmBrtxoIuJJnePyHxkrQS7yVxr8nNive0ZyMU42KHFHQZeRH90QKfIfJzdArcspC0ETqpJnWIdIR2p+W9ZRKUFqNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726006811; c=relaxed/relaxed;
	bh=pPtpQHE11IQ1rKEMMihk2r8UZCyNFdPRil9LEPt4gj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bi9+ki65X1ff3JqVaRh+YTenc4cddiraiDKM4PKiwVpfBiV5W4jcqM+/VyEfLAlQsMduKYGL9lSE9rA9QX8qB57MmrR8dzfiM6V6RgQMPSPcgPSqkfYgWMGz6I0uK7fxB2ws2KsJfOvFe9xPfvIC2JAwSSbd1j1kOfWdZHXErzXcT81XE4TUiN4uTSXk6Lv6cFAEn0ksyX0dksItwtcyuXSqzTI9dakUvJHvMSk1rC/EzfP8b8cWBhG/947wiFVBXEFb9Pf8CAwoHH7G1r37RoUyARWVBn33Whj6fqrU5dFh71n73BKpm8RDjshJd7FlHKg67IvjGdQk7UT0PMyjbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bXvC/AMd; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bXvC/AMd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3J6g5Xyrz2xYq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 08:20:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ABD535C054A;
	Tue, 10 Sep 2024 22:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA255C4CEC3;
	Tue, 10 Sep 2024 22:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726006808;
	bh=48YI4pbgmYlCiPT43kBVwkkPa58PT2DK2GN26WL06Zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXvC/AMdALgzeciEYcNb3c7MPlwl1Ldpk8m3EmiuiaLfyLLWLC4BnWS4SIe+MdZa6
	 6mZMlroCrRgIPDG8EyJyzVb39LE+5OAes1gED325p1M9hGm7e8hNTrWk1oAxCuxmy9
	 iEVZo/7+4ouPBj6jySGz6RzsogWcFaGmQrpjVQchYuIJoCEY5cSdDgGO/udItb1/3t
	 MqPWOsC7+j7ZUEm8A9BmF0Es+nKRaVpzowcRgRqJMhsA0rYSK6BUJoTclK4mXQN8iV
	 dPdtSGzTqhto6BkXQMoVkYE3eQs122rcEq6o1b5I1D5+KbbY3Ry5QIsFY3f/9nVqAJ
	 /zH+eyi3rKtdA==
Date: Tue, 10 Sep 2024 17:20:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Li Zetao <lizetao1@huawei.com>, linux-clk@vger.kernel.org,
	dmaengine@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Yangtao Li <frank.li@vivo.com>, alsa-devel@alsa-project.org,
	Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Chancel Liu <chancel.liu@nxp.com>,
	Russell King <linux@armlinux.org.uk>, linux-sound@vger.kernel.org,
	Vladimir Zapolskiy <vz@mleia.com>,
	Corentin Labbe <clabbe@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Takashi Iwai <tiwai@suse.com>, devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>, Arnd Bergmann <arnd@arndb.de>,
	Vinod Koul <vkoul@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [Patch v5 02/12] dt-bindings: dma: Add lpc32xx DMA mux binding
Message-ID: <172600677256.860315.3249804427139743181.robh@kernel.org>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
 <20240627150046.258795-3-piotr.wojtaszczyk@timesys.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627150046.258795-3-piotr.wojtaszczyk@timesys.com>

On Thu, 27 Jun 2024 17:00:20 +0200, Piotr Wojtaszczyk wrote:
> LPC32XX SoCs use pl080 dma controller which have few request signals
> multiplexed between peripherals. This binding describes how devices can
> use the multiplexed request signals.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> ---
> Changes for v5:
> - Corrected property order
> - Added maxItems to properties
> - Fixed example
> - Removed "N:: from the MAINTAINERS entry
> - Added Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com> to LPC32XX maintainers
> 
> Changes for v4:
> - This patch is new in v4
> 
>  .../bindings/dma/nxp,lpc3220-dmamux.yaml      | 49 +++++++++++++++++++
>  MAINTAINERS                                   |  9 ++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
> 

Applied, thanks!

