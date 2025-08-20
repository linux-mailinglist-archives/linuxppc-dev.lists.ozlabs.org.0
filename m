Return-Path: <linuxppc-dev+bounces-11169-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17124B2E7FB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Aug 2025 00:17:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6gn35TJYz2xQ3;
	Thu, 21 Aug 2025 08:17:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755728263;
	cv=none; b=egYrNdVe5T45bWlTPNuWPXIj2cT0PuO5D5Odn1CpUyPcbXzWL49y5uuv9QQ9Fwd64cshdaXz+5+Ef/Lvhvc5nHze5Zu9N69YV3t0T7u8LZGEZhpsepUm9KXa7v50457rZLFojS2H23b1MIKr6ZiBPOjn0qXoSmbwXTU8Wl110CMn1VsCmvf0v7P+SZnz19giaCENr1T0X8/4bfTjn3lhjCQCnnv6cLVp9idUzcJHj3DOxw15QDp5kzHFNRk49DFYlOCWaeTGvZCTRA2iz61oNnUcQKJ8GeaAUDcKsRhN9rPqElaWUndE/AA2OD3poAZQfiT/tSKvXxgrvi1OZdA97w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755728263; c=relaxed/relaxed;
	bh=CCrCunTdU8xEFp07Ey9PdiNzt/IieIkKwVuDc+HiN88=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nMBNmX3SeUMU1gmRaQbRvnrNPLvoCxwzFs0n6/0GS4Zz3O76N4TeCV9gK9xl8yTSda6sH5vetJD84JiLtqe1l9MWq08I93X8qAky/XWiJFlQxUZqE5YMB2KVJVTLToQEYe54SQHhl/X8daLjalZRjFHbq2rb8H3mI2QnPpSAOj8rd5Tysknic7axQZuVXWbI3HaraVaDpCoWu7c+Gdwip4Dpt5gsAVXfBj4Fc63dkgCn7hANZ6r+i1MoJYVG+c0xvPEZ13ui8NvaT588T4z2Pb5Nf/uKD2QgSC3e8Oo0MmybF5OixJq84Waux+1Jg9yakNttG/ZR4hqVzUruIshx9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=deFp5pNH; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=deFp5pNH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6gn30Cgnz2xQ2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Aug 2025 08:17:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4F474A57880;
	Wed, 20 Aug 2025 22:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F05CC4CEE7;
	Wed, 20 Aug 2025 22:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755728260;
	bh=eDu8QR5kIr07udxsRmoFGBACAqMZM7dZomdO2wR2NFw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=deFp5pNHdK9Cn8YK/W/UKn93sLyXcRafl7AIdHn4ca4HS+VyBIBvZhfkU3SqZkqOO
	 Pd+zHaWlLPUw9NZEkK4FY+bWmjAHkgnjdA5JAvuXVx1pH5myfGRuY0j0skW6VlEXxI
	 jxb/FIxaydITafislJLf9s9gY+BR4oKz8S2VhPZV0/4uuYIy34UFhnOYig6d7eXaZH
	 7J92rop1Ic+bftYa4Dk3KrEIO30AfYuVx3el0WAoMB189W8Ie5xcPZTEvKfjUpOXnj
	 MKTiK92pD2q/dfi1duF3KTjvCWSK8t3AJKSMHSwWvL76SzEIOE/fiyKLJ47YDlXWFL
	 KansHdGD6Jxog==
From: Mark Brown <broonie@kernel.org>
To: Nick Li <nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Andrew Davis <afd@ti.com>, Chen Ni <nichen@iscas.ac.cn>, 
 Linus Walleij <linus.walleij@linaro.org>, Al Viro <viro@zeniv.linux.org.uk>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <20250820123423.470486-1-rongqianfeng@vivo.com>
References: <20250820123423.470486-1-rongqianfeng@vivo.com>
Subject: Re: [PATCH 0/3] ASoC: Use kcalloc() instead of kzalloc()
Message-Id: <175572825608.300376.7595587079585456413.b4-ty@kernel.org>
Date: Wed, 20 Aug 2025 23:17:36 +0100
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 20 Aug 2025 20:34:17 +0800, Qianfeng Rong wrote:
> Replace devm_kzalloc() with devm_kcalloc() in sound/soc.  As noted in the
> kernel documentation [1], open-coded multiplication in allocator arguments
> is discouraged because it can lead to integer overflow.
> 
> Using devm_kcalloc() provides built-in overflow protection, making the
> memory allocation safer when calculating the allocation size compared
> to explicit multiplication.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codecs: Use kcalloc() instead of kzalloc()
      commit: 45441b933cdfb7a018674049f269d7a1bc1688df
[2/3] ASoC: fsl: Use kcalloc() instead of kzalloc()
      commit: 3b6f4bd6cda2797b0d999a129376c112d41604f4
[3/3] ASoC: test-component: Use kcalloc() instead of kzalloc()
      commit: 96bcb34df55f7fee99795127c796315950c94fed

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


