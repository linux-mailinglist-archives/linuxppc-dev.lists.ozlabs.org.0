Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8BA683B0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 08:51:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nDhQ3hhgzDqTv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 16:51:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nDfW2VLSzDqRg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 16:49:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45nDfV4TBTz9sND;
 Mon, 15 Jul 2019 16:49:38 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Oliver O'Halloran <oohall@gmail.com>,
 Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 2/4] powerpc/32: activate ARCH_HAS_PMEM_API and
 ARCH_HAS_UACCESS_FLUSHCACHE
In-Reply-To: <0e779b35cf66fd4aa5ec0ec09fb7820f6c518cb3.1557824379.git.christophe.leroy@c-s.fr>
References: <239d1c8f15b8bedc161a234f9f1a22a07160dbdf.1557824379.git.christophe.leroy@c-s.fr>
 <0e779b35cf66fd4aa5ec0ec09fb7820f6c518cb3.1557824379.git.christophe.leroy@c-s.fr>
Date: Mon, 15 Jul 2019 16:49:38 +1000
Message-ID: <87y30z94hp.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> PPC32 also have flush_dcache_range() so it can also support
> ARCH_HAS_PMEM_API and ARCH_HAS_UACCESS_FLUSHCACHE without changes.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index d7996cfaceca..cf6e30f637be 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -127,13 +127,13 @@ config PPC
>  	select ARCH_HAS_KCOV
>  	select ARCH_HAS_MMIOWB			if PPC64
>  	select ARCH_HAS_PHYS_TO_DMA
> -	select ARCH_HAS_PMEM_API                if PPC64
> +	select ARCH_HAS_PMEM_API
>  	select ARCH_HAS_PTE_SPECIAL
>  	select ARCH_HAS_MEMBARRIER_CALLBACKS
>  	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC64
>  	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !RELOCATABLE && !HIBERNATION)
>  	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
> -	select ARCH_HAS_UACCESS_FLUSHCACHE	if PPC64
> +	select ARCH_HAS_UACCESS_FLUSHCACHE
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>  	select ARCH_HAS_ZONE_DEVICE		if PPC_BOOK3S_64
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG

This didn't build for me, probably due to something that's changed in
the long period between you posting it and me applying it?

corenet32_smp_defconfig:

  powerpc64-unknown-linux-gnu-ld: lib/iov_iter.o: in function `_copy_from_iter_flushcache':
  powerpc64-unknown-linux-gnu-ld: /scratch/michael/build/maint/build~/../lib/iov_iter.c:825: undefined reference to `memcpy_page_flushcache'
  powerpc64-unknown-linux-gnu-ld: /scratch/michael/build/maint/build~/../lib/iov_iter.c:825: undefined reference to `memcpy_flushcache'
  powerpc64-unknown-linux-gnu-ld: /scratch/michael/build/maint/build~/../lib/iov_iter.c:825: undefined reference to `__copy_from_user_flushcache'
  powerpc64-unknown-linux-gnu-ld: /scratch/michael/build/maint/build~/../lib/iov_iter.c:825: undefined reference to `memcpy_flushcache'

cheers
