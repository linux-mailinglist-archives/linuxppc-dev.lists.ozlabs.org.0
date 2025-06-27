Return-Path: <linuxppc-dev+bounces-9853-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB0FAEBDCF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jun 2025 18:50:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bTM4b3SnSz2yNG;
	Sat, 28 Jun 2025 02:50:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751043038;
	cv=none; b=k5AekjPssbqgHPlwRiJ0V6uTDD4I1pSC/o3o35/+4OqEWLybHEm1sK1yIeeBrvjVQoahudB7gAOBHs+wBAtrKB5yQMgp2DoT/UtHfLGWXfp8Q1U/hjyegkyCzKo8rLSUW6hX2VjjN6+aCsZlCwvfcu5c0bjmGxrw+gFLMEfIi2P68QlUqL+Jq/xyctelaWIrb+XrKC3nQjP8s6J8eQ63ZyvLr0pw00a0W+Rn8Mw97ftRywGMF3g7fDVP2SMZdC8kejl8VN5+o3H49QqulJ+vBI/cBVKXPKwwKHFi0Z06tLxL6KYgSHriJqlKpmH6PYMSNf3l7xMu/2V9dBCwmxzZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751043038; c=relaxed/relaxed;
	bh=p9okuRDbCVY7a5r1Bx2bw39EwNLe91oBC1vxj6ex3/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ibXn54ea8xtPjQKHXeGusnAuvGW10XgO8R0oqzSeVY9FYS1guQ+QV7MBk/onqmN8JzSDMmzMSFbQC3Tjsr6dRQz3W+5NmS0V7Qxt0/nI8I9FZtE57AL/x8w8ISmZ2StsCLdj/tWqnoh/PTYGQTugwK8hQGNGzzp4ocGfEjrJp0GfO+xZ9okp9kz4HKA8fOjV6pArsrKK5hxjDdEKGviHdgY2OVyp/uEZDYCLKrUNISAQX2+h1LIJl+4EjXrCRb18fZ8ZkoIpbDYpXfbkW114Nd6n7fc4du2FtnHm4FJceTAxJccckCAa8C7hRJSv6EV4vByqayY+KEqDSgsyILk0nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bTM4Y6Vlpz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jun 2025 02:50:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bTLkY73wNz9vHw;
	Fri, 27 Jun 2025 18:35:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KDIXtx_acZHc; Fri, 27 Jun 2025 18:35:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bTLkY629lz9vHn;
	Fri, 27 Jun 2025 18:35:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C430B8B7B7;
	Fri, 27 Jun 2025 18:35:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id eaDpLvMbeWNr; Fri, 27 Jun 2025 18:35:01 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E96A18B7A7;
	Fri, 27 Jun 2025 18:34:57 +0200 (CEST)
Message-ID: <5c371310-525c-4432-88f2-7c62ed563c9b@csgroup.eu>
Date: Fri, 27 Jun 2025 18:34:57 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kmap: fix header include to reflect actual path
To: Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Guo Ren <guoren@kernel.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org
References: <20250627153259.301946-1-aurabindo.pillai@amd.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250627153259.301946-1-aurabindo.pillai@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 27/06/2025 à 17:32, Aurabindo Pillai a écrit :
> [Vous ne recevez pas souvent de courriers de aurabindo.pillai@amd.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> There are plenty of header includes like:
> 
>          #include <asm/kmap_size.h>

Yes and in reality that includes those,

./arch/arm64/include/generated/asm/kmap_size.h
./arch/riscv/include/generated/asm/kmap_size.h
./arch/arc/include/generated/asm/kmap_size.h
./arch/x86/include/generated/asm/kmap_size.h
./arch/powerpc/include/generated/asm/kmap_size.h
./arch/arm/include/generated/asm/kmap_size.h

Which contain:

$ cat arch/powerpc/include/generated/asm/kmap_size.h
#include <asm-generic/kmap_size.h>

So what is the problem really ?

architectures are allowed to override the generic kmap_size.h, so you 
should definitely not change include/linux/sched.h

Or if you think architectures shouldn't be allowed to override it, then 
explain it and remove the following line in include/asm-generic/Kbuild:

	mandatory-y += kmap_size.h

Also I wonder why you didn't change in mm/highmem.c:

	#include <asm/kmap_size.h>

If you change how it works you have to explain it.

Christophe

> 
> However, the file kmap_size.h is actually inside the folder asm-generic.
> Fix the includes in various header files so that the correct path is
> referenced in the source, so rename them to:
> 
>          #include <asm-generic/kmap_size.h>
> 
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> ---
>   arch/arc/include/asm/highmem.h       | 2 +-
>   arch/arm/include/asm/fixmap.h        | 2 +-
>   arch/csky/include/asm/fixmap.h       | 2 +-
>   arch/csky/include/asm/highmem.h      | 2 +-
>   arch/microblaze/include/asm/fixmap.h | 2 +-
>   arch/mips/include/asm/fixmap.h       | 2 +-
>   arch/mips/include/asm/highmem.h      | 2 +-
>   arch/powerpc/include/asm/fixmap.h    | 2 +-
>   arch/sparc/include/asm/vaddrs.h      | 2 +-
>   arch/x86/include/asm/fixmap.h        | 2 +-
>   arch/xtensa/include/asm/fixmap.h     | 2 +-
>   include/linux/sched.h                | 2 +-
>   12 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arc/include/asm/highmem.h b/arch/arc/include/asm/highmem.h
> index a6b8e2c352c44..3be6754ab304d 100644
> --- a/arch/arc/include/asm/highmem.h
> +++ b/arch/arc/include/asm/highmem.h
> @@ -9,7 +9,7 @@
>   #ifdef CONFIG_HIGHMEM
> 
>   #include <uapi/asm/page.h>
> -#include <asm/kmap_size.h>
> +#include <asm-generic/kmap_size.h>
> 
>   #define FIXMAP_SIZE            PGDIR_SIZE
>   #define PKMAP_SIZE             PGDIR_SIZE
> diff --git a/arch/arm/include/asm/fixmap.h b/arch/arm/include/asm/fixmap.h
> index 707068f852c27..149669def2e92 100644
> --- a/arch/arm/include/asm/fixmap.h
> +++ b/arch/arm/include/asm/fixmap.h
> @@ -7,7 +7,7 @@
>   #define FIXADDR_TOP            (FIXADDR_END - PAGE_SIZE)
> 
>   #include <linux/pgtable.h>
> -#include <asm/kmap_size.h>
> +#include <asm-generic/kmap_size.h>
> 
>   enum fixed_addresses {
>          FIX_EARLYCON_MEM_BASE,
> diff --git a/arch/csky/include/asm/fixmap.h b/arch/csky/include/asm/fixmap.h
> index 49a77cbbe2a9c..c68aabec22429 100644
> --- a/arch/csky/include/asm/fixmap.h
> +++ b/arch/csky/include/asm/fixmap.h
> @@ -7,7 +7,7 @@
>   #include <asm/memory.h>
>   #ifdef CONFIG_HIGHMEM
>   #include <linux/threads.h>
> -#include <asm/kmap_size.h>
> +#include <asm-generic/kmap_size.h>
>   #endif
> 
>   enum fixed_addresses {
> diff --git a/arch/csky/include/asm/highmem.h b/arch/csky/include/asm/highmem.h
> index 1ed810effb3d1..c3c4d51a93d0d 100644
> --- a/arch/csky/include/asm/highmem.h
> +++ b/arch/csky/include/asm/highmem.h
> @@ -8,7 +8,7 @@
>   #include <linux/init.h>
>   #include <linux/interrupt.h>
>   #include <linux/uaccess.h>
> -#include <asm/kmap_size.h>
> +#include <asm-generic/kmap_size.h>
>   #include <asm/cache.h>
> 
>   /* undef for production */
> diff --git a/arch/microblaze/include/asm/fixmap.h b/arch/microblaze/include/asm/fixmap.h
> index e6e9288bff761..77996f6605949 100644
> --- a/arch/microblaze/include/asm/fixmap.h
> +++ b/arch/microblaze/include/asm/fixmap.h
> @@ -20,7 +20,7 @@
>   #include <asm/page.h>
>   #ifdef CONFIG_HIGHMEM
>   #include <linux/threads.h>
> -#include <asm/kmap_size.h>
> +#include <asm-generic/kmap_size.h>
>   #endif
> 
>   #define FIXADDR_TOP    ((unsigned long)(-PAGE_SIZE))
> diff --git a/arch/mips/include/asm/fixmap.h b/arch/mips/include/asm/fixmap.h
> index b037718d7e8b4..85e2854a2fc50 100644
> --- a/arch/mips/include/asm/fixmap.h
> +++ b/arch/mips/include/asm/fixmap.h
> @@ -17,7 +17,7 @@
>   #include <spaces.h>
>   #ifdef CONFIG_HIGHMEM
>   #include <linux/threads.h>
> -#include <asm/kmap_size.h>
> +#include <asm-generic/kmap_size.h>
>   #endif
> 
>   /*
> diff --git a/arch/mips/include/asm/highmem.h b/arch/mips/include/asm/highmem.h
> index 92a3802100178..80a6409d4a137 100644
> --- a/arch/mips/include/asm/highmem.h
> +++ b/arch/mips/include/asm/highmem.h
> @@ -24,7 +24,7 @@
>   #include <linux/interrupt.h>
>   #include <linux/uaccess.h>
>   #include <asm/cpu-features.h>
> -#include <asm/kmap_size.h>
> +#include <asm-generic/kmap_size.h>
> 
>   /* declarations for highmem.c */
>   extern unsigned long highstart_pfn, highend_pfn;
> diff --git a/arch/powerpc/include/asm/fixmap.h b/arch/powerpc/include/asm/fixmap.h
> index f9068dd8dfce7..b0622370fbab1 100644
> --- a/arch/powerpc/include/asm/fixmap.h
> +++ b/arch/powerpc/include/asm/fixmap.h
> @@ -20,7 +20,7 @@
>   #include <asm/page.h>
>   #ifdef CONFIG_HIGHMEM
>   #include <linux/threads.h>
> -#include <asm/kmap_size.h>
> +#include <asm-generic/kmap_size.h>
>   #endif
> 
>   /*
> diff --git a/arch/sparc/include/asm/vaddrs.h b/arch/sparc/include/asm/vaddrs.h
> index 4fec0341e2a81..f21d51153d6ef 100644
> --- a/arch/sparc/include/asm/vaddrs.h
> +++ b/arch/sparc/include/asm/vaddrs.h
> @@ -32,7 +32,7 @@
>   #define SRMMU_NOCACHE_ALCRATIO 64      /* 256 pages per 64MB of system RAM */
> 
>   #ifndef __ASSEMBLY__
> -#include <asm/kmap_size.h>
> +#include <asm-generic/kmap_size.h>
> 
>   enum fixed_addresses {
>          FIX_HOLE,
> diff --git a/arch/x86/include/asm/fixmap.h b/arch/x86/include/asm/fixmap.h
> index d0dcefb5cc59d..ed2dc040747e4 100644
> --- a/arch/x86/include/asm/fixmap.h
> +++ b/arch/x86/include/asm/fixmap.h
> @@ -14,7 +14,7 @@
>   #ifndef _ASM_X86_FIXMAP_H
>   #define _ASM_X86_FIXMAP_H
> 
> -#include <asm/kmap_size.h>
> +#include <asm-generic/kmap_size.h>
> 
>   /*
>    * Exposed to assembly code for setting up initial page tables. Cannot be
> diff --git a/arch/xtensa/include/asm/fixmap.h b/arch/xtensa/include/asm/fixmap.h
> index 1c65dc1d33971..af09aafb66687 100644
> --- a/arch/xtensa/include/asm/fixmap.h
> +++ b/arch/xtensa/include/asm/fixmap.h
> @@ -16,7 +16,7 @@
>   #ifdef CONFIG_HIGHMEM
>   #include <linux/threads.h>
>   #include <linux/pgtable.h>
> -#include <asm/kmap_size.h>
> +#include <asm-generic/kmap_size.h>
> 
>   /* The map slots for temporary mappings via kmap_atomic/local(). */
>   enum fixed_addresses {
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 9c15365a30c08..28507df174ee7 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -46,7 +46,7 @@
>   #include <linux/rv.h>
>   #include <linux/livepatch_sched.h>
>   #include <linux/uidgid_types.h>
> -#include <asm/kmap_size.h>
> +#include <asm-generic/kmap_size.h>
> 
>   /* task_struct member predeclarations (sorted alphabetically): */
>   struct audit_context;
> --
> 2.50.0
> 


