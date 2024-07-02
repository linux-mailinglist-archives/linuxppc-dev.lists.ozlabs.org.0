Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C91B923C65
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 13:30:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DTtgxuOa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD11c4JhKz3fsb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 21:30:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DTtgxuOa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD10x3zfPz3fSX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 21:30:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 48E66CE1DD2;
	Tue,  2 Jul 2024 11:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA95C2BD10;
	Tue,  2 Jul 2024 11:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719919806;
	bh=ZEBaVU6KtOqS65U4pWx3ZRaX/O4ExxXq3npKnwdQAtE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DTtgxuOanW2fBW/ZV+zeYbRpGLfSG6m7KVdHV788+OXLEZIkpODkqa1H/yKDiEpUW
	 MLExm6b1b2PESzTM3udHlJ1STxLrYN+LNYaZFhwlnOJoWilrsRWCJ7/KBnzOqgPWls
	 k5FPANYDqv5dp8aTEKrJxiPew2Z7k5vtzL1Q/yc8K6wxOjAaEZK6X0vZzoRf2vwdC2
	 vdgNyZkb/OEATiz3JJqRWcXXR9bfTgv+qpfrqUuinBkFktrRrgR194IGxw5z5MdN20
	 58cINbsQuDUv3XDuNUPrA1+/YumETbMmbCf8EH6BXjbVsnlQ289OF+6+8GDy1/InRC
	 mHexAq0PmuUjg==
From: Mark Brown <broonie@kernel.org>
To: "J.M.B. Downing" <jonathan.downing@nautel.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Nathan Chancellor <nathan@kernel.org>
In-Reply-To: <20240701-lpc32xx-asoc-fix-include-for-field_prep-v1-1-0c5d7f71921b@kernel.org>
References: <20240701-lpc32xx-asoc-fix-include-for-field_prep-v1-1-0c5d7f71921b@kernel.org>
Subject: Re: [PATCH] ASoC: fsl: lpc3xxx-i2s: Include bitfield.h for
 FIELD_PREP
Message-Id: <171991980440.18111.17479068162057597635.b4-ty@kernel.org>
Date: Tue, 02 Jul 2024 12:30:04 +0100
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, patches@lists.linux.dev, linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 01 Jul 2024 11:26:38 -0700, Nathan Chancellor wrote:
> bitfield.h is not explicitly included but it is required for FIELD_PREP
> to be expanded by the preprocessor. If it is not implicitly included,
> there will be a compiler error (as seen with ARCH=hexagon allmodconfig):
> 
>   sound/soc/fsl/lpc3xxx-i2s.c:169:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>     169 |                 tmp |= LPC3XXX_I2S_WW8 | LPC3XXX_I2S_WS_HP(LPC3XXX_I2S_WW8_HP);
>         |                        ^
>   sound/soc/fsl/lpc3xxx-i2s.h:42:30: note: expanded from macro 'LPC3XXX_I2S_WW8'
>      42 | #define LPC3XXX_I2S_WW8      FIELD_PREP(0x3, 0) /* Word width is 8bit */
>         |                              ^
>   sound/soc/fsl/lpc3xxx-i2s.c:205:34: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>     205 |                              LPC3XXX_I2S_DMA1_TX_EN | LPC3XXX_I2S_DMA0_TX_DEPTH(4));
>         |                                                       ^
>   sound/soc/fsl/lpc3xxx-i2s.h:65:38: note: expanded from macro 'LPC3XXX_I2S_DMA0_TX_DEPTH'
>      65 | #define LPC3XXX_I2S_DMA0_TX_DEPTH(s) FIELD_PREP(0xF0000, s) /* Set the DMA1 TX Request level */
>         |                                      ^
>   sound/soc/fsl/lpc3xxx-i2s.c:210:34: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>     210 |                              LPC3XXX_I2S_DMA0_RX_EN | LPC3XXX_I2S_DMA1_RX_DEPTH(4));
>         |                                                       ^
>   sound/soc/fsl/lpc3xxx-i2s.h:70:38: note: expanded from macro 'LPC3XXX_I2S_DMA1_RX_DEPTH'
>      70 | #define LPC3XXX_I2S_DMA1_RX_DEPTH(s) FIELD_PREP(0x700, s) /* Set the DMA1 RX Request level */
>         |                                      ^
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: lpc3xxx-i2s: Include bitfield.h for FIELD_PREP
      commit: f1afb360b6f1f49e943ac85b26d4224ec67d22d3

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

