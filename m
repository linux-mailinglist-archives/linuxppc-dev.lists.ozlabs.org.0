Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 900DF4A9317
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 05:28:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqjGT1Y7Xz3bPK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 15:28:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ozy/d7PM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ozy/d7PM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqjFg3p8Sz2xsb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 15:28:06 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2143FCPn010398
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 4 Feb 2022 04:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=m7z/1g9zm5ZKeNIKlSqkhV3A/TbH4cnjH7gN5adF6rw=;
 b=Ozy/d7PM88td5Y+OTefCTFBgahsXAtcZDnP8w2BYaoo+nRxmnFg2XwuORnddBjKkN8em
 qi9orLTB3+1Dr7XcoIiw/FDsxWNYVA8IcvMUnNSY53KhvrdqGzHFIvK2Sf9Q0EOOPE+U
 FD5D84b7l3TlSQdoTF8SSF9IjmeusKGg6AuCEhkKtnJ427ZwVVOslU//Zmw/L7iXV5tq
 Sg2mYdvhg/xmKSw4ZtW5hO7b5CFKdsUicIRr37rm9iCmZ3LjHj1GSYrdd/cGsF230WW2
 Ijl2ZPdNznqwRW987d3JWvkMO19HjVssoT/VypwAf0YlOEDl1R6bYsW4f1mCSwaNIcNL aQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0r1a4ss4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Feb 2022 04:28:03 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2144PhFp004316
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 4 Feb 2022 04:28:02 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0r1a4srw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 04:28:02 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2144CdNY015279;
 Fri, 4 Feb 2022 04:28:01 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 3e0r0km3qk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 04:28:01 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2144S13633423734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Feb 2022 04:28:01 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3ED7AE05C;
 Fri,  4 Feb 2022 04:28:00 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D313AE064;
 Fri,  4 Feb 2022 04:27:59 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.63.99])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  4 Feb 2022 04:27:59 +0000 (GMT)
X-Mailer: emacs 29.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/64s/hash: Make hash faults work in NMI context
In-Reply-To: <20220204035348.545435-1-npiggin@gmail.com>
References: <20220204035348.545435-1-npiggin@gmail.com>
Date: Fri, 04 Feb 2022 09:57:55 +0530
Message-ID: <871r0j1cj8.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OcpfBb_6vzn3OAnpCfXwqI9RhWdL1SlF
X-Proofpoint-ORIG-GUID: BkvMn9gVTHFaMm33-kGZcvzTkR4qH35F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_01,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040019
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Hash faults are not resoved in NMI context, instead causing the access
> to fail. This is done because perf interrupts can get backtraces
> including walking the user stack, and taking a hash fault on those could
> deadlock on the HPTE lock if the perf interrupt hits while the same HPTE
> lock is being held by the hash fault code. The user-access for the stack
> walking will notice the access failed and deal with that in the perf
> code.
>
> The reason to allow perf interrupts in is to better profile hash faults.
>
> The problem with this is any hash fault on a kernel access that happens
> in NMI context will crash, because kernel accesses must not fail.
>
> Hard lockups, system reset, machine checks that access vmalloc space
> including modules and including stack backtracing and symbol lookup in
> modules, per-cpu data, etc could all run into this problem.
>
> Fix this by disallowing perf interrupts in the hash fault code (the
> direct hash fault is covered by MSR[EE]=0 so the PMI disable just needs
> to extend to the preload case). This simplifies the tricky logic in hash
> faults and perf, at the cost of reduced profiling of hash faults.
>
> perf can still latch addresses when interrupts are disabled, it just
> won't get the stack trace at that point, so it would still find hot
> spots, just sometimes with confusing stack chains.
>
> An alternative could be to allow perf interrupts here but always do the
> slowpath stack walk if we are in nmi context, but that slows down all
> perf interrupt stack walking on hash though and it does not remove as
> much tricky code.
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Reported-by: Laurent Dufour <ldufour@linux.ibm.com>
> Tested-by: Laurent Dufour <ldufour@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/interrupt.h  |  2 +-
>  arch/powerpc/mm/book3s64/hash_utils.c | 54 ++++-----------------------
>  arch/powerpc/perf/callchain.h         |  9 +----
>  arch/powerpc/perf/callchain_64.c      | 27 --------------
>  4 files changed, 10 insertions(+), 82 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index fc28f46d2f9d..5404f7abbcf8 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -612,7 +612,7 @@ DECLARE_INTERRUPT_HANDLER_RAW(do_slb_fault);
>  DECLARE_INTERRUPT_HANDLER(do_bad_segment_interrupt);
>  
>  /* hash_utils.c */
> -DECLARE_INTERRUPT_HANDLER_RAW(do_hash_fault);
> +DECLARE_INTERRUPT_HANDLER(do_hash_fault);
>  
>  /* fault.c */
>  DECLARE_INTERRUPT_HANDLER(do_page_fault);
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 7abf82a698d3..985cabdd7f67 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1621,8 +1621,7 @@ int hash_page(unsigned long ea, unsigned long access, unsigned long trap,
>  }
>  EXPORT_SYMBOL_GPL(hash_page);
>  
> -DECLARE_INTERRUPT_HANDLER(__do_hash_fault);
> -DEFINE_INTERRUPT_HANDLER(__do_hash_fault)
> +DEFINE_INTERRUPT_HANDLER(do_hash_fault)
>  {
>  	unsigned long ea = regs->dar;
>  	unsigned long dsisr = regs->dsisr;
> @@ -1681,35 +1680,6 @@ DEFINE_INTERRUPT_HANDLER(__do_hash_fault)
>  	}
>  }
>  
> -/*
> - * The _RAW interrupt entry checks for the in_nmi() case before
> - * running the full handler.
> - */
> -DEFINE_INTERRUPT_HANDLER_RAW(do_hash_fault)
> -{
> -	/*
> -	 * If we are in an "NMI" (e.g., an interrupt when soft-disabled), then
> -	 * don't call hash_page, just fail the fault. This is required to
> -	 * prevent re-entrancy problems in the hash code, namely perf
> -	 * interrupts hitting while something holds H_PAGE_BUSY, and taking a
> -	 * hash fault. See the comment in hash_preload().
> -	 *
> -	 * We come here as a result of a DSI at a point where we don't want
> -	 * to call hash_page, such as when we are accessing memory (possibly
> -	 * user memory) inside a PMU interrupt that occurred while interrupts
> -	 * were soft-disabled.  We want to invoke the exception handler for
> -	 * the access, or panic if there isn't a handler.
> -	 */
> -	if (unlikely(in_nmi())) {
> -		do_bad_page_fault_segv(regs);
> -		return 0;
> -	}
> -
> -	__do_hash_fault(regs);
> -
> -	return 0;
> -}
> -
>  #ifdef CONFIG_PPC_MM_SLICES
>  static bool should_hash_preload(struct mm_struct *mm, unsigned long ea)
>  {
> @@ -1776,26 +1746,18 @@ static void hash_preload(struct mm_struct *mm, pte_t *ptep, unsigned long ea,
>  #endif /* CONFIG_PPC_64K_PAGES */
>  
>  	/*
> -	 * __hash_page_* must run with interrupts off, as it sets the
> -	 * H_PAGE_BUSY bit. It's possible for perf interrupts to hit at any
> -	 * time and may take a hash fault reading the user stack, see
> -	 * read_user_stack_slow() in the powerpc/perf code.
> -	 *
> -	 * If that takes a hash fault on the same page as we lock here, it
> -	 * will bail out when seeing H_PAGE_BUSY set, and retry the access
> -	 * leading to an infinite loop.
> +	 * __hash_page_* must run with interrupts off, including PMI interrupts
> +	 * off, as it sets the H_PAGE_BUSY bit.
>  	 *
> -	 * Disabling interrupts here does not prevent perf interrupts, but it
> -	 * will prevent them taking hash faults (see the NMI test in
> -	 * do_hash_page), then read_user_stack's copy_from_user_nofault will
> -	 * fail and perf will fall back to read_user_stack_slow(), which
> -	 * walks the Linux page tables.
> +	 * It's otherwise possible for perf interrupts to hit at any time and
> +	 * may take a hash fault reading the user stack, which could take a
> +	 * hash miss and deadlock on the same H_PAGE_BUSY bit.
>  	 *
>  	 * Interrupts must also be off for the duration of the
>  	 * mm_is_thread_local test and update, to prevent preempt running the
>  	 * mm on another CPU (XXX: this may be racy vs kthread_use_mm).
>  	 */
> -	local_irq_save(flags);
> +	powerpc_local_irq_pmu_save(flags);
>  
>  	/* Is that local to this CPU ? */
>  	if (mm_is_thread_local(mm))
> @@ -1820,7 +1782,7 @@ static void hash_preload(struct mm_struct *mm, pte_t *ptep, unsigned long ea,
>  				   mm_ctx_user_psize(&mm->context),
>  				   pte_val(*ptep));
>  
> -	local_irq_restore(flags);
> +	powerpc_local_irq_pmu_restore(flags);
>  }
>  
>  /*
> diff --git a/arch/powerpc/perf/callchain.h b/arch/powerpc/perf/callchain.h
> index d6fa6e25234f..19a8d051ddf1 100644
> --- a/arch/powerpc/perf/callchain.h
> +++ b/arch/powerpc/perf/callchain.h
> @@ -2,7 +2,6 @@
>  #ifndef _POWERPC_PERF_CALLCHAIN_H
>  #define _POWERPC_PERF_CALLCHAIN_H
>  
> -int read_user_stack_slow(const void __user *ptr, void *buf, int nb);
>  void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
>  			    struct pt_regs *regs);
>  void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
> @@ -26,17 +25,11 @@ static inline int __read_user_stack(const void __user *ptr, void *ret,
>  				    size_t size)
>  {
>  	unsigned long addr = (unsigned long)ptr;
> -	int rc;
>  
>  	if (addr > TASK_SIZE - size || (addr & (size - 1)))
>  		return -EFAULT;
>  
> -	rc = copy_from_user_nofault(ret, ptr, size);
> -
> -	if (IS_ENABLED(CONFIG_PPC64) && !radix_enabled() && rc)
> -		return read_user_stack_slow(ptr, ret, size);
> -
> -	return rc;
> +	return copy_from_user_nofault(ret, ptr, size);
>  }
>  
>  #endif /* _POWERPC_PERF_CALLCHAIN_H */
> diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
> index 8d0df4226328..488e8a21a11e 100644
> --- a/arch/powerpc/perf/callchain_64.c
> +++ b/arch/powerpc/perf/callchain_64.c
> @@ -18,33 +18,6 @@
>  
>  #include "callchain.h"
>  
> -/*
> - * On 64-bit we don't want to invoke hash_page on user addresses from
> - * interrupt context, so if the access faults, we read the page tables
> - * to find which page (if any) is mapped and access it directly. Radix
> - * has no need for this so it doesn't use read_user_stack_slow.
> - */
> -int read_user_stack_slow(const void __user *ptr, void *buf, int nb)
> -{
> -
> -	unsigned long addr = (unsigned long) ptr;
> -	unsigned long offset;
> -	struct page *page;
> -	void *kaddr;
> -
> -	if (get_user_page_fast_only(addr, FOLL_WRITE, &page)) {
> -		kaddr = page_address(page);
> -
> -		/* align address to page boundary */
> -		offset = addr & ~PAGE_MASK;
> -
> -		memcpy(buf, kaddr + offset, nb);
> -		put_page(page);
> -		return 0;
> -	}
> -	return -EFAULT;
> -}
> -
>  static int read_user_stack_64(const unsigned long __user *ptr, unsigned long *ret)
>  {
>  	return __read_user_stack(ptr, ret, sizeof(*ret));
> -- 
> 2.23.0
