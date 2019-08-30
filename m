Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FAEA3EE9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 22:23:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KrX040tfzDr7H
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 06:23:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="t3DdXlqf"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KrTm3dmHzDq9L
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 06:21:15 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46KrTf4sJsz9v7DV;
 Fri, 30 Aug 2019 22:21:10 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=t3DdXlqf; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id i8KdkaTkTAHG; Fri, 30 Aug 2019 22:21:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46KrTf3fvrz9v7DT;
 Fri, 30 Aug 2019 22:21:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567196470; bh=5mIcW5Ma3DiUVmOtdXBzHpmioRdV9+1g1JCs5ObvG4U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=t3DdXlqf6AB9+SFlptqH0lcdn9EFs2KUWrWSK80SjZRYqLygw7RJuWcBSmAo0RtZl
 gWVswbFGEHM+vi/lxTQi0BcjJYISm1MccPLm+8ZJO86ORIL9v3LvblzCLwXl6r9j40
 Hum7QV5VvL2J/RFUHm9RR6/1TzKKgbG5lNh93jSo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C18488B911;
 Fri, 30 Aug 2019 22:21:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DtZa8Q-OHiqT; Fri, 30 Aug 2019 22:21:10 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6830B8B90B;
 Fri, 30 Aug 2019 22:21:09 +0200 (CEST)
Subject: Re: [PATCH v6 4/6] powerpc/64: make buildable without CONFIG_COMPAT
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
References: <cover.1567188299.git.msuchanek@suse.de>
 <6192bddc4631d2691b98316908432ffabc5d4b40.1567188299.git.msuchanek@suse.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a04b5750-a160-01a1-c208-7950f4c495bd@c-s.fr>
Date: Fri, 30 Aug 2019 22:21:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6192bddc4631d2691b98316908432ffabc5d4b40.1567188299.git.msuchanek@suse.de>
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
Cc: David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Nicolai Stange <nstange@suse.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Allison Randal <allison@lohutok.net>, Firoz Khan <firoz.khan@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Christian Brauner <christian@brauner.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/08/2019 à 20:57, Michal Suchanek a écrit :
> There are numerous references to 32bit functions in generic and 64bit
> code so ifdef them out.
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
> v2:
> - fix 32bit ifdef condition in signal.c
> - simplify the compat ifdef condition in vdso.c - 64bit is redundant
> - simplify the compat ifdef condition in callchain.c - 64bit is redundant
> v3:
> - use IS_ENABLED and maybe_unused where possible
> - do not ifdef declarations
> - clean up Makefile
> v4:
> - further makefile cleanup
> - simplify is_32bit_task conditions
> - avoid ifdef in condition by using return
> v5:
> - avoid unreachable code on 32bit
> - make is_current_64bit constant on !COMPAT
> - add stub perf_callchain_user_32 to avoid some ifdefs
> v6:
> - consolidate current_is_64bit
> ---
>   arch/powerpc/include/asm/thread_info.h |  4 +--
>   arch/powerpc/kernel/Makefile           |  7 +++--
>   arch/powerpc/kernel/entry_64.S         |  2 ++
>   arch/powerpc/kernel/signal.c           |  3 +--
>   arch/powerpc/kernel/syscall_64.c       |  6 ++---
>   arch/powerpc/kernel/vdso.c             |  5 ++--
>   arch/powerpc/perf/callchain.c          | 37 +++++++++++++++-----------
>   7 files changed, 33 insertions(+), 31 deletions(-)
> 

[...]

> diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
> index b7cdcce20280..788ad2c63f18 100644
> --- a/arch/powerpc/perf/callchain.c
> +++ b/arch/powerpc/perf/callchain.c
> @@ -15,7 +15,7 @@
>   #include <asm/sigcontext.h>
>   #include <asm/ucontext.h>
>   #include <asm/vdso.h>
> -#ifdef CONFIG_PPC64
> +#ifdef CONFIG_COMPAT
>   #include "../kernel/ppc32.h"
>   #endif
>   #include <asm/pte-walk.h>
> @@ -268,16 +268,6 @@ static void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
>   	}
>   }
>   
> -static inline int current_is_64bit(void)
> -{
> -	/*
> -	 * We can't use test_thread_flag() here because we may be on an
> -	 * interrupt stack, and the thread flags don't get copied over
> -	 * from the thread_info on the main stack to the interrupt stack.
> -	 */
> -	return !test_ti_thread_flag(task_thread_info(current), TIF_32BIT);
> -}
> -
>   #else  /* CONFIG_PPC64 */
>   static int read_user_stack_slow(void __user *ptr, void *buf, int nb)
>   {
> @@ -314,11 +304,6 @@ static inline void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry
>   {
>   }
>   
> -static inline int current_is_64bit(void)
> -{
> -	return 0;
> -}
> -
>   static inline int valid_user_sp(unsigned long sp, int is_64)
>   {
>   	if (!sp || (sp & 7) || sp > TASK_SIZE - 32)
> @@ -334,6 +319,7 @@ static inline int valid_user_sp(unsigned long sp, int is_64)
>   
>   #endif /* CONFIG_PPC64 */
>   
> +#if defined(CONFIG_PPC32) || defined(CONFIG_COMPAT)
>   /*
>    * Layout for non-RT signal frames
>    */
> @@ -475,6 +461,25 @@ static void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
>   		sp = next_sp;
>   	}
>   }
> +#else /* 32bit */
> +static void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
> +				   struct pt_regs *regs)
> +{
> +	(void)&read_user_stack_32; /* unused if !COMPAT */

You don't need that anymore do you ?

Christophe

> +}
> +#endif /* 32bit */
> +
> +static inline int current_is_64bit(void)
> +{
> +	if (!IS_ENABLED(CONFIG_COMPAT))
> +		return IS_ENABLED(CONFIG_PPC64);
> +	/*
> +	 * We can't use test_thread_flag() here because we may be on an
> +	 * interrupt stack, and the thread flags don't get copied over
> +	 * from the thread_info on the main stack to the interrupt stack.
> +	 */
> +	return !test_ti_thread_flag(task_thread_info(current), TIF_32BIT);
> +}
>   
>   void
>   perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
> 
