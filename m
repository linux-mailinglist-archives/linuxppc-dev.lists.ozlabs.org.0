Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9122229992
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 15:50:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBcKH5GQHzDqkb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 23:49:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=YBYISbNt; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBcD80j2QzDqW6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 23:45:27 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0DB62065D;
 Wed, 22 Jul 2020 13:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595425525;
 bh=o1jYZWn/sCrcloS83rhA9Xi9FUtFoKkQvr/MsgkeLvQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=YBYISbNtR3BPGk7DB4ghYIdUURz/gnTg3ZsGhlxk+C6N/KX/Iq+HIq7B+lrQs2/hD
 TJvWIT5UiSV4ppEYwLcOMNkRfOmxWodyn2Avw+2E8bhnIY4iRl6kcMZn490iOXXMJJ
 L6ebl0uRQ01KsH6l+NJQ+6YI/R+5/rP6CMQUuR/w=
Date: Wed, 22 Jul 2020 14:45:12 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20200714072226.26071-1-linus.walleij@linaro.org>
References: <20200714072226.26071-1-linus.walleij@linaro.org>
Subject: Re: [PATCH] spi: ppc4xx: Convert to use GPIO descriptors
Message-Id: <159542550175.19884.1291452700922629224.b4-ty@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Jul 2020 09:22:26 +0200, Linus Walleij wrote:
> This converts the PPC4xx SPI driver to use GPIO descriptors.
> 
> The driver is already just picking some GPIOs from the device
> tree so the conversion is pretty straight forward. However
> this driver is looking form a pure "gpios" property rather
> than the standard binding "cs-gpios" so we need to add a new
> exception to the gpiolib OF parser to allow this for this
> driver's compatibles.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: ppc4xx: Convert to use GPIO descriptors
      commit: 4726773292bfdb2917a0b4d369ddccd5e2f30991

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
