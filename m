Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B27A2DF547
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Dec 2020 12:46:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CzLQz58swzDqNd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Dec 2020 22:46:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzLMr6JY8zDq5n
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Dec 2020 22:43:30 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CzLMc29mFz9txwk;
 Sun, 20 Dec 2020 12:43:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id q-PhtETQmiYu; Sun, 20 Dec 2020 12:43:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CzLMc186Dz9tyt6;
 Sun, 20 Dec 2020 12:43:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 742FB8B77E;
 Sun, 20 Dec 2020 12:43:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Jv6_NCnxZ8HD; Sun, 20 Dec 2020 12:43:27 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 394758B75B;
 Sun, 20 Dec 2020 12:43:26 +0100 (CET)
Subject: Re: [RFC PATCH 3/5] powerpc/64s: add CONFIG_PPC_NMMU for nest MMU
 support
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20201219234813.830747-1-npiggin@gmail.com>
 <20201219234813.830747-4-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7860a2b3-205f-9b27-42cb-e298264f8253@csgroup.eu>
Date: Sun, 20 Dec 2020 12:43:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201219234813.830747-4-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 20/12/2020 à 00:48, Nicholas Piggin a écrit :
> This allows some nest MMU features to be compiled away if coprocessor
> support is not selected.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/Kconfig                          | 1 +
>   arch/powerpc/include/asm/book3s/64/mmu.h      | 2 ++
>   arch/powerpc/include/asm/book3s/64/tlbflush.h | 2 ++
>   arch/powerpc/include/asm/mmu_context.h        | 5 +++--
>   arch/powerpc/platforms/Kconfig                | 3 +++
>   arch/powerpc/platforms/powernv/Kconfig        | 1 +
>   6 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index ae7391627054..4376bf4c53b4 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -888,6 +888,7 @@ config PPC_PROT_SAO_LPAR
>   
>   config PPC_COPRO_BASE
>   	bool
> +	select PPC_NMMU if PPC_BOOK3S_64
>   
>   config SCHED_SMT
>   	bool "SMT (Hyperthreading) scheduler support"
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> index 995bbcdd0ef8..07850d68a624 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -103,8 +103,10 @@ typedef struct {
>   	/* Number of bits in the mm_cpumask */
>   	atomic_t active_cpus;
>   
> +#ifdef CONFIG_PPC_NMMU
>   	/* Number of users of the external (Nest) MMU */
>   	atomic_t copros;
> +#endif
>   
>   	/* Number of user space windows opened in process mm_context */
>   	atomic_t vas_windows;
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
> index 0a7431e954c6..c70a82851f78 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
> @@ -16,8 +16,10 @@ enum {
>   
>   static inline bool mm_has_nmmu(struct mm_struct *mm)
>   {
> +#ifdef CONFIG_PPC_NMMU
>   	if (unlikely(atomic_read(&mm->context.copros) > 0))
>   		return true;
> +#endif
>   	return false;
>   }
>   
> diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
> index d5821834dba9..53eac0cc4929 100644
> --- a/arch/powerpc/include/asm/mmu_context.h
> +++ b/arch/powerpc/include/asm/mmu_context.h
> @@ -143,6 +143,7 @@ static inline void dec_mm_active_cpus(struct mm_struct *mm)
>   	atomic_dec(&mm->context.active_cpus);
>   }
>   
> +#ifdef CONFIG_PPC_NMMU
>   static inline void mm_context_add_copro(struct mm_struct *mm)
>   {
>   	/*
> @@ -187,6 +188,7 @@ static inline void mm_context_remove_copro(struct mm_struct *mm)
>   			dec_mm_active_cpus(mm);
>   	}
>   }
> +#endif
>   
>   /*
>    * vas_windows counter shows number of open windows in the mm
> @@ -218,8 +220,7 @@ static inline void mm_context_remove_vas_window(struct mm_struct *mm)
>   #else
>   static inline void inc_mm_active_cpus(struct mm_struct *mm) { }
>   static inline void dec_mm_active_cpus(struct mm_struct *mm) { }
> -static inline void mm_context_add_copro(struct mm_struct *mm) { }
> -static inline void mm_context_remove_copro(struct mm_struct *mm) { }

Are you sure you can remove those ?
If so, I think it belongs to another patch, I can't see how the new PPC_NMMU would allow that by itself.

> +static inline bool mm_has_nmmu(struct mm_struct *mm) { return false; }
>   #endif
>   
>   
> diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
> index 7a5e8f4541e3..b4b04b3f98d1 100644
> --- a/arch/powerpc/platforms/Kconfig
> +++ b/arch/powerpc/platforms/Kconfig
> @@ -191,6 +191,9 @@ config PPC_INDIRECT_MMIO
>   config PPC_IO_WORKAROUNDS
>   	bool
>   
> +config PPC_NMMU
> +	bool
> +
>   source "drivers/cpufreq/Kconfig"
>   
>   menu "CPUIdle driver"
> diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
> index 619b093a0657..145009d74457 100644
> --- a/arch/powerpc/platforms/powernv/Kconfig
> +++ b/arch/powerpc/platforms/powernv/Kconfig
> @@ -36,6 +36,7 @@ config PPC_MEMTRACE
>   config PPC_VAS
>   	bool "IBM Virtual Accelerator Switchboard (VAS)"
>   	depends on PPC_POWERNV && PPC_64K_PAGES
> +	select PPC_NMMU
>   	default y
>   	help
>   	  This enables support for IBM Virtual Accelerator Switchboard (VAS).
> 
