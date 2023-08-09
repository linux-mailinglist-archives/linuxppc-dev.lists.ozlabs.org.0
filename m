Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C94EC77650E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 18:30:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A2XFBAmb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLbBq4SGSz3c5H
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 02:30:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A2XFBAmb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLb9t5TCLz2ytb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 02:29:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 815FC64060;
	Wed,  9 Aug 2023 16:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE360C433C8;
	Wed,  9 Aug 2023 16:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691598575;
	bh=NzgcHUUZOX+VYfBoHP7NLY8e72NmRPh4DdS2d1SjmTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A2XFBAmbYrxo9zNanDn3hG9CGcjL29E1QXD3xGGN2vopARSS7PrkzZfTkkwM/RRyr
	 t09Htk41r35uOEw1QrlKMivToPMjVekL6hH9SBTSNMfjtBtBr2vO3hjllVQWFnq/hF
	 95x2xBqd/BGXW0TZ3DEplHDrI/a79cOO9NPSBtRM6nd5RykuXSSv2M14JzO7R4M9wb
	 ArSqXa59L/vWymke4tebmqyFI9YzJwkrIJ1Awun9/KobZZPJp+BWpGkVcUB33pEbAx
	 UgY65a+pw7CiGSP6OmolyoFcpRgb8p35sgcX1pYD/79QIW3TPGdNZYnmvrql9t/TV6
	 N0SdU5zKTNHsg==
From: Mark Brown <broonie@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <18a65dca9134f6fc35932408066d4a8284cbfa65.1691571190.git.christophe.leroy@csgroup.eu>
References: <18a65dca9134f6fc35932408066d4a8284cbfa65.1691571190.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] spi: fsl-cpm: Properly define and use IO pointers
Message-Id: <169159857463.143658.5802489571235545071.b4-ty@kernel.org>
Date: Wed, 09 Aug 2023 17:29:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
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
Cc: kernel test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 09 Aug 2023 10:54:27 +0200, Christophe Leroy wrote:
> Sparse reports several issues with IO pointers.
> 
> Fix it by adding missing __iomem flags and using iowriteXXbe()
> generic helpers instead of the powerpc specific out_beXX() ones.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: fsl-cpm: Properly define and use IO pointers
      commit: ddaec4e44d4e2a556b51159d48788a85ff67179d

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

