Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1A751C1C8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 16:00:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvFhB5kL2z3c8n
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 00:00:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hhdZBqTp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvFgZ6dWjz3bdR
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 23:59:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hhdZBqTp; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KvFgX0SzKz4ySp;
 Thu,  5 May 2022 23:59:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651759176;
 bh=BLmOX2JTJUtsf6cp+fQ5NjvJNurLWC3DJXNDMhwryvY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hhdZBqTp0KxTl5o0xmkH99R1gX2msFo5zA156PlY86YUxIbU5ayfEs8ASsMIaeNyK
 +k3arSXiRIBXDDDz8EwNzAoXJBONPP9oEGCTra5MONrZDVEVXtA/xjVdmmJ7zu5WCq
 JH317o5mcUOrxUFMBjT9dzlXb+SV4YuCVfaFUIKeooJ/2ZACg2ktQauaKHgNvquTD9
 mR2X/XRVj4ZBWq4U19N1NocMo2HU3qT90BagPJLSkdWoE6iob3Mk1fSLi2FIyythDf
 MBBOlBvipa3ilILuBcnk18rHEP9y+bOaN5wdej9b0KFBHgXFYm9S24+rUUZk645iQL
 tsqnaGFnrY4pg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/ftrace: Remove ftrace init tramp once kernel
 init is complete
In-Reply-To: <20220323171834.42637-1-naveen.n.rao@linux.vnet.ibm.com>
References: <20220323171834.42637-1-naveen.n.rao@linux.vnet.ibm.com>
Date: Thu, 05 May 2022 23:59:32 +1000
Message-ID: <87tua4t70b.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> Stop using the ftrace trampoline for init section once kernel init is
> complete.
>
> Fixes: 67361cf8071286 ("powerpc/ftrace: Handle large kernel configs")
> Cc: stable@vger.kernel.org # v4.20+
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/ftrace.h  |  2 ++
>  arch/powerpc/kernel/trace/ftrace.c | 15 ++++++++++++---
>  arch/powerpc/mm/mem.c              |  2 ++
>  3 files changed, 16 insertions(+), 3 deletions(-)

This breaks the corenet64_smp_defconfig build:

  ld: arch/powerpc/mm/mem.o: in function `.free_initmem':
  (.text+0x130): undefined reference to `.ftrace_free_init_tramp'
  make[1]: *** [/home/michael/linux/Makefile:1158: vmlinux] Error 1
  make: *** [Makefile:219: __sub-make] Error 2


> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
> index d83758acd1c7c3..d329f4ad18944d 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -110,11 +110,13 @@ static inline u8 this_cpu_get_ftrace_enabled(void)
>  	return get_paca()->ftrace_enabled;
>  }
>  
> +void ftrace_free_init_tramp(void);
>  #else /* CONFIG_PPC64 */
>  static inline void this_cpu_disable_ftrace(void) { }
>  static inline void this_cpu_enable_ftrace(void) { }
>  static inline void this_cpu_set_ftrace_enabled(u8 ftrace_enabled) { }
>  static inline u8 this_cpu_get_ftrace_enabled(void) { return 1; }
> +static inline void ftrace_free_init_tramp(void) { }
>  #endif /* CONFIG_PPC64 */

I think because we need that stub to be defined.

But this config does have PPC64=y but *doesn't* have DYNAMIC_FTRACE or
FTRACE_SYSCALLS or FUNCTION_GRAPH_TRACER enabled.

cheers
