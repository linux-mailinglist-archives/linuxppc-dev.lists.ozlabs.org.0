Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F58567ED5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 08:41:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ld91s62tlz3c5N
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 16:41:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=UmBMB+TJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=UmBMB+TJ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ld91H1ZkNz2yZc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 16:41:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 79AEEB81AEC;
	Wed,  6 Jul 2022 06:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4558C3411C;
	Wed,  6 Jul 2022 06:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657089676;
	bh=yRGgIJUHXkz2TXJ4J6jNOpjIOkNNlk8+GJwy5fMiZ+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UmBMB+TJVrq4Gw9/pfOPUH8FVR53qIvRVpi+/2bZ4Tl0ovU3eWwkhUstZr8i7ntPH
	 sWDra3CbZPk7FcieK4NosMw8F7902e+ydwYQXfv07XZQthiCA/VjT5a1qR9aUOe2LN
	 7Q6owf5BOUsMUFDooZhriCtR5IVyOMFojtZRxed8=
Date: Wed, 6 Jul 2022 08:41:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2] random: remove CONFIG_ARCH_RANDOM
Message-ID: <YsUuiSP1VW1ok69g@kroah.com>
References: <YsTXI3J+ptkN/vb4@zx2c4.com>
 <20220706003225.335768-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706003225.335768-1-Jason@zx2c4.com>
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
Cc: linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 06, 2022 at 02:32:25AM +0200, Jason A. Donenfeld wrote:
> When RDRAND was introduced, there was much discussion on whether it
> should be trusted and how the kernel should handle that. Initially, two
> mechanisms cropped up, CONFIG_ARCH_RANDOM, a compile time switch, and
> "nordrand", a boot-time switch.
> 
> Later the thinking evolved. With a properly designed RNG, using RDRAND
> values alone won't harm anything, even if the outputs are malicious.
> Rather, the issue is whether those values are being *trusted* to be good
> or not. And so a new set of options were introduced as the real
> ones that people use -- CONFIG_RANDOM_TRUST_CPU and "random.trust_cpu".
> With these options, RDRAND is used, but it's not always credited. So in
> the worst case, it does nothing, and in the best case, maybe it helps.
> 
> Along the way, CONFIG_ARCH_RANDOM's meaning got sort of pulled into the
> center and became something certain platforms force-select.
> 
> The old options don't really help with much, and it's a bit odd to have
> special handling for these instructions when the kernel can deal fine
> with the existence or untrusted existence or broken existence or
> non-existence of that CPU capability.
> 
> So this commit simplifies things down to the two options that are
> actually used, and removes the confusing old ones that aren't used or
> useful. It leaves "nordrand" for now, as the removal of that will take a
> different route.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  arch/arm64/Kconfig                                |  8 --------
>  arch/arm64/include/asm/archrandom.h               | 10 ----------
>  arch/arm64/kernel/cpufeature.c                    |  2 --
>  arch/powerpc/Kconfig                              |  3 ---
>  arch/powerpc/include/asm/archrandom.h             |  3 ---
>  arch/powerpc/include/asm/machdep.h                |  2 --
>  arch/powerpc/platforms/microwatt/Kconfig          |  1 -
>  arch/powerpc/platforms/powernv/Kconfig            |  1 -
>  arch/powerpc/platforms/pseries/Kconfig            |  1 -
>  arch/s390/Kconfig                                 | 15 ---------------
>  arch/s390/configs/zfcpdump_defconfig              |  1 -
>  arch/s390/crypto/Makefile                         |  2 +-
>  arch/s390/include/asm/archrandom.h                |  3 ---
>  arch/x86/Kconfig                                  |  9 ---------
>  arch/x86/include/asm/archrandom.h                 | 10 +---------
>  arch/x86/kernel/cpu/rdrand.c                      |  2 --
>  drivers/char/Kconfig                              |  1 -
>  drivers/char/hw_random/s390-trng.c                |  9 ---------
>  include/linux/random.h                            |  9 +--------
>  .../selftests/wireguard/qemu/kernel.config        |  1 -
>  20 files changed, 3 insertions(+), 90 deletions(-)


Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
