Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A1084FDEC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 21:49:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BX354ORZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWmF04dSrz3cVK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 07:49:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BX354ORZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWmDF3jl2z3c2G
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Feb 2024 07:49:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AE421CE1E85;
	Fri,  9 Feb 2024 20:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3336FC433F1;
	Fri,  9 Feb 2024 20:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707511738;
	bh=QRg2R8un/qUCSLzzdjxaC2y88MIa1qgY+xSCzkKqNxU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=BX354ORZXNorzTr+fiNY8SCAHQ5MVe3ULcYfV3WEcBnOL/bHnWsauNaLkbhi6x5fF
	 E+0dwGajd9PNUNprT/ciIcRWjCzox7Hk4ysDxeIorTKJ0yyiDGPJiTfvv8BNQZWXUM
	 UQ6zZdWfMzoRObYadIlEoScQ22uXUphl4UNLP96FoNeHy25Sol/QmeIa+l7orN/4ia
	 xBYwA55Iuhh2VPrmFVc40FHZtIFXhkqZgmD2fRJKcJB1GxmJA+C+5qTc0LKE1XeB3k
	 29YF2sGQ4S3aqsFDoN/YpWqhkbLMxhi9ZTe4lqSqE+dzsLsYYkeN9+jFzAeRX50InZ
	 KN7/Xh6+KKkLA==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <3eb3f9c4407ba99d1cd275662081e46b9e839173.1707490664.git.chunkeey@gmail.com>
References: <3eb3f9c4407ba99d1cd275662081e46b9e839173.1707490664.git.chunkeey@gmail.com>
Subject: Re: [PATCH v1] spi: spi-ppc4xx: include missing platform_device.h
Message-Id: <170751173690.2414604.16858513850600028471.b4-ty@kernel.org>
Date: Fri, 09 Feb 2024 20:48:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 09 Feb 2024 15:59:07 +0100, Christian Lamparter wrote:
> the driver currently fails to compile on 6.8-rc3 due to:
> | spi-ppc4xx.c: In function ‘spi_ppc4xx_of_probe’:
> | @346:36: error: invalid use of undefined type ‘struct platform_device’
> | 346 |         struct device_node *np = op->dev.of_node;
> |     |                                    ^~
> | ... (more similar errors)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-ppc4xx: include missing platform_device.h
      commit: 9f208e097801f9c2088eb339a1162fff81c08b4e

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

