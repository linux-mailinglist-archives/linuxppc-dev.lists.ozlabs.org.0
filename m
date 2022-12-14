Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABBE64CF92
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 19:41:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXPMw0bJjz3chR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 05:41:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KZ3P2Jv9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KZ3P2Jv9;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXPLy4Nl6z3blt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 05:40:42 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 05095B819F3;
	Wed, 14 Dec 2022 18:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C064C433D2;
	Wed, 14 Dec 2022 18:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671043237;
	bh=BfPmRbxFCqUCV8U+jqF/ZUYDmw0wAT7lnJ27V9BdeZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KZ3P2Jv9oF0WMB2ZBUF8BZEtYZa176QxZ/CgppeP2V/ZRZb1Q+XA4uKrx14uaydIa
	 JLi5AO3VrEeT67vretVugZV2ptRwxX7gMv0bBKz+0U81WAz+cXR9C3iKiVQRHi+sTM
	 QfV05JduPaGsWxj/SkXIX7doH/ycy9MUp/RrRYsZKolGh+3OPu7WTNvbls6YQkAxiP
	 1ICtOk0GbuVzjPWHNDwORhPIFdcCieVZeVbOcPqQDt8ZHmB9jnIKGeDy8rLqbqyGqs
	 ie4+AZQ1jcKhNHX0npRoypQTT9b49vGVqgwRwQeMGW82mr3cNwrPQ9KGZhESwjuRz3
	 yh1TF3SdKsU5w==
From: Mark Brown <broonie@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: =?utf-8?q?=3C8aab84c51aa330cf91f4b43782a1c483e150a4e3=2E1671025?=
 =?utf-8?q?244=2Egit=2Echristophe=2Eleroy=40csgroup=2Eeu=3E?=
References: =?utf-8?q?=3C8aab84c51aa330cf91f4b43782a1c483e150a4e3=2E16710252?=
 =?utf-8?q?44=2Egit=2Echristophe=2Eleroy=40csgroup=2Eeu=3E?=
Subject:  Re: [PATCH] spi: fsl_spi: Don't change speed while chipselect is active
Message-Id: <167104323615.416042.13205866259522482706.b4-ty@kernel.org>
Date: Wed, 14 Dec 2022 18:40:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-7e003
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
Cc: Herve Codina <herve.codina@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-spi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 14 Dec 2022 14:41:33 +0100, Christophe Leroy wrote:
> Commit c9bfcb315104 ("spi_mpc83xx: much improved driver") made
> modifications to the driver to not perform speed changes while
> chipselect is active. But those changes where lost with the
> convertion to tranfer_one.
> 
> Previous implementation was allowing speed changes during
> message transfer when cs_change flag was set.
> At the time being, core SPI does not provide any feature to change
> speed while chipselect is off, so do not allow any speed change during
> message transfer, and perform the transfer setup in prepare_message
> in order to set correct speed while chipselect is still off.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: fsl_spi: Don't change speed while chipselect is active
      commit: 3b553e0041a65e499fa4e25ee146f01f4ec4e617

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
