Return-Path: <linuxppc-dev+bounces-4916-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D07AA077D1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 14:40:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTQsQ5skZz3bbR;
	Fri, 10 Jan 2025 00:40:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736430042;
	cv=none; b=Vc81K9VVJ5S5SGFdgRozzdKs0w+S9KFpBRvKZdAbh0sqWQ+lOdS0sMx1u5QzHcqcWHwhJraYLO5U2ECfqYUrvgE9UsTiHGq0PrR0NbXUL+G3fEHUaNvQrNoXuUdvd18tv1mXqcWwFOL1/I7k0ukptxrzpEiwf7F3V3AqJAdKPQRPq/8kNSK3OmH+PcwYSnm6cn/1kvGUJx4tIJ8FpteBKVRNYgyKLG5XEFLX1S0Fl/9dLtnu7Zv3h+4zAAkSX9Lpq20bmD+e8MzmDot9JW/WNLl7OSkkzC+FQiJgOJI2USyXWeQLlQqkG4PC1UYuE439NIEwzGYGepfqZSnihw0vPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736430042; c=relaxed/relaxed;
	bh=iHKDVEr+afYDvtL49dGtRg7JueK3kTERh+uTubQ69PY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bg5Wz+6XqEXfRYa78M1XK3yerzEQ86Yw0097sWwJDPuzUlF+rZbrgzUZhxP/R/Jt6RWlpMzPXRxC7NnVYxsyRo2o16Sw9VdHQagmYVhQbmcenWRHvqvFf23fOyUX8YySwaCY7X0mWjZiIxSIuvK3FqklTFXlhdDmP60zooJ7si32aybXa4r/Ww/4PjjhhVBtf6T9tNQTUDlvxnh8gQSD+TJeTr+2WnB6BKAtjz59i3ENrprHqciWsb3WoJmr7+OT935kk5i11pI784IxJq5sdB+LZm2kjLd0vRWZThTpVGKoyl2DLcD0Nri+zD/N8nOVtggtoSvoIhZe55wQzluAPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jeZMDyg7; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jeZMDyg7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTQsP6GJhz3bWP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 00:40:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C85F65C2725;
	Thu,  9 Jan 2025 13:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE310C4CED2;
	Thu,  9 Jan 2025 13:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736430039;
	bh=8QXQuS3ZxeiaLM1ayescKH0xKuOZEihfBJNtlXKWO0E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jeZMDyg7iYijJrgWNjuiS07kcUghLzq+Pfm8rKwdJZfjNgH4+Fvdo2u6/sCAx9gYt
	 XoRQTe6i2pmhY7SSDO3s9N9EuzttjPQrQfbkfdMrpUNCzDJ6pp0DjozrC0eeZlN3ds
	 dN/9f4dKX/0wyOVfVbArGuzDMoy9Flx5EnkZ5mrVxHooww5U4y/nfLPPmpM0AhQtbP
	 eeRQCoDvsla4kYn1mhzgf661MHpcjOCpz7i8jnBLVeuIaztxsEWcZgabFNqGDW9Nv0
	 UKZ4g3fpJbQtPO3QuYHk1+MAvr+O6roFMYnPAGXTN+U9flykKzddlFsvYZ9mSNTLbM
	 ePMrerHh9bz/A==
From: Mark Brown <broonie@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-spi@vger.kernel.org
In-Reply-To: <8a37a960ff084dfdb9233849c00714e9317ae6a5.1736405336.git.christophe.leroy@csgroup.eu>
References: <8a37a960ff084dfdb9233849c00714e9317ae6a5.1736405336.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] spi: fsl-spi: Remove display of virtual address
Message-Id: <173643003851.53058.4009453720979125010.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 13:40:38 +0000
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
X-Mailer: b4 0.15-dev-1b0d6
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 09 Jan 2025 07:51:45 +0100, Christophe Leroy wrote:
> The following appears in kernel log at boot:
> 
> 	fsl_spi b01004c0.spi: at 0x(ptrval) (irq = 51), QE mode
> 
> This is useless, so remove the display of that virtual address and
> display the MMIO address instead, just like serial core does.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: fsl-spi: Remove display of virtual address
      commit: 636ee5781d259258dc9425a5552be1ffa458633c

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


