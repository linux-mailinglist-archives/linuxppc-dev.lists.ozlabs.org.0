Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2239A9323B2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 12:15:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNZgw6qDVz3dBp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 20:15:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNZgW2bzqz30T3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 20:14:44 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7FB01063;
	Tue, 16 Jul 2024 03:14:36 -0700 (PDT)
Received: from [10.163.52.225] (unknown [10.163.52.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EBFA3F762;
	Tue, 16 Jul 2024 03:14:00 -0700 (PDT)
Message-ID: <dce55e36-7325-42f9-93c9-abe9efba3a22@arm.com>
Date: Tue, 16 Jul 2024 15:43:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/29] arm64: handle PKEY/POE faults
To: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-16-joey.gouly@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240503130147.1154804-16-joey.gouly@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A minor nit. The fault is related to POE in terms of the HW rather than PKEY
which it is abstracted out in core MM. Hence it might be better to describe
the fault as POE one rather than PKEY related.

arm64/mm: Handle POE faults

On 5/3/24 18:31, Joey Gouly wrote:
> If a memory fault occurs that is due to an overlay/pkey fault, report that to
> userspace with a SEGV_PKUERR.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/traps.h |  1 +
>  arch/arm64/kernel/traps.c      | 12 ++++++--
>  arch/arm64/mm/fault.c          | 56 ++++++++++++++++++++++++++++++++--
>  3 files changed, 64 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/traps.h b/arch/arm64/include/asm/traps.h
> index eefe766d6161..f6f6f2cb7f10 100644
> --- a/arch/arm64/include/asm/traps.h
> +++ b/arch/arm64/include/asm/traps.h
> @@ -25,6 +25,7 @@ try_emulate_armv8_deprecated(struct pt_regs *regs, u32 insn)
>  void force_signal_inject(int signal, int code, unsigned long address, unsigned long err);
>  void arm64_notify_segfault(unsigned long addr);
>  void arm64_force_sig_fault(int signo, int code, unsigned long far, const char *str);
> +void arm64_force_sig_fault_pkey(int signo, int code, unsigned long far, const char *str, int pkey);
>  void arm64_force_sig_mceerr(int code, unsigned long far, short lsb, const char *str);
>  void arm64_force_sig_ptrace_errno_trap(int errno, unsigned long far, const char *str);
>  
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 215e6d7f2df8..1bac6c84d3f5 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -263,16 +263,24 @@ static void arm64_show_signal(int signo, const char *str)
>  	__show_regs(regs);
>  }
>  
> -void arm64_force_sig_fault(int signo, int code, unsigned long far,
> -			   const char *str)
> +void arm64_force_sig_fault_pkey(int signo, int code, unsigned long far,
> +			   const char *str, int pkey)
>  {
>  	arm64_show_signal(signo, str);
>  	if (signo == SIGKILL)
>  		force_sig(SIGKILL);
> +	else if (code == SEGV_PKUERR)
> +		force_sig_pkuerr((void __user *)far, pkey);
>  	else
>  		force_sig_fault(signo, code, (void __user *)far);
>  }
>  
> +void arm64_force_sig_fault(int signo, int code, unsigned long far,
> +			   const char *str)
> +{
> +	arm64_force_sig_fault_pkey(signo, code, far, str, 0);
> +}
> +

arm64_force_sig_fault_pkey() could not be added as a new stand alone
helper, without refactoring with arm64_force_sig_fault() ? Is there
any benefit ?

>  void arm64_force_sig_mceerr(int code, unsigned long far, short lsb,
>  			    const char *str)
>  {
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 8251e2fea9c7..585295168918 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -23,6 +23,7 @@
>  #include <linux/sched/debug.h>
>  #include <linux/highmem.h>
>  #include <linux/perf_event.h>
> +#include <linux/pkeys.h>
>  #include <linux/preempt.h>
>  #include <linux/hugetlb.h>
>  
> @@ -489,6 +490,23 @@ static void do_bad_area(unsigned long far, unsigned long esr,
>  #define VM_FAULT_BADMAP		((__force vm_fault_t)0x010000)
>  #define VM_FAULT_BADACCESS	((__force vm_fault_t)0x020000)
>  
> +static bool fault_from_pkey(unsigned long esr, struct vm_area_struct *vma,
> +			unsigned int mm_flags)
> +{
> +	unsigned long iss2 = ESR_ELx_ISS2(esr);
> +
> +	if (!arch_pkeys_enabled())
> +		return false;
> +
> +	if (iss2 & ESR_ELx_Overlay)
> +		return true;

Should not there be a spurious POE fault check with an WARN_ONCE()
splash, when ESR_ELx_Overlay is set without arch_pkeys_enabled().

> +
> +	return !arch_vma_access_permitted(vma,
> +			mm_flags & FAULT_FLAG_WRITE,
> +			mm_flags & FAULT_FLAG_INSTRUCTION,
> +			mm_flags & FAULT_FLAG_REMOTE);
> +}

FAULT_FLAG_REMOTE is applicable here ?

> +
>  static vm_fault_t __do_page_fault(struct mm_struct *mm,
>  				  struct vm_area_struct *vma, unsigned long addr,
>  				  unsigned int mm_flags, unsigned long vm_flags,
> @@ -529,6 +547,8 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>  	unsigned int mm_flags = FAULT_FLAG_DEFAULT;
>  	unsigned long addr = untagged_addr(far);
>  	struct vm_area_struct *vma;
> +	bool pkey_fault = false;
> +	int pkey = -1;
>  
>  	if (kprobe_page_fault(regs, esr))
>  		return 0;
> @@ -590,6 +610,12 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>  		vma_end_read(vma);
>  		goto lock_mmap;
>  	}
> +
> +	if (fault_from_pkey(esr, vma, mm_flags)) {
> +		vma_end_read(vma);
> +		goto lock_mmap;
> +	}
> +
>  	fault = handle_mm_fault(vma, addr, mm_flags | FAULT_FLAG_VMA_LOCK, regs);
>  	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
>  		vma_end_read(vma);
> @@ -617,6 +643,11 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>  		goto done;
>  	}
>  
> +	if (fault_from_pkey(esr, vma, mm_flags)) {
> +		pkey_fault = true;
> +		pkey = vma_pkey(vma);
> +	}
> +
>  	fault = __do_page_fault(mm, vma, addr, mm_flags, vm_flags, regs);
>  
>  	/* Quick path to respond to signals */
> @@ -682,9 +713,28 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>  		 * Something tried to access memory that isn't in our memory
>  		 * map.
>  		 */
> -		arm64_force_sig_fault(SIGSEGV,
> -				      fault == VM_FAULT_BADACCESS ? SEGV_ACCERR : SEGV_MAPERR,
> -				      far, inf->name);
> +		int fault_kind;
> +		/*
> +		 * The pkey value that we return to userspace can be different
> +		 * from the pkey that caused the fault.
> +		 *
> +		 * 1. T1   : mprotect_key(foo, PAGE_SIZE, pkey=4);
> +		 * 2. T1   : set POR_EL0 to deny access to pkey=4, touches, page
> +		 * 3. T1   : faults...
> +		 * 4.    T2: mprotect_key(foo, PAGE_SIZE, pkey=5);
> +		 * 5. T1   : enters fault handler, takes mmap_lock, etc...
> +		 * 6. T1   : reaches here, sees vma_pkey(vma)=5, when we really
> +		 *	     faulted on a pte with its pkey=4.
> +		 */
> +
> +		if (pkey_fault)
> +			fault_kind = SEGV_PKUERR;
> +		else
> +			fault_kind = fault == VM_FAULT_BADACCESS ? SEGV_ACCERR : SEGV_MAPERR;
> +
> +		arm64_force_sig_fault_pkey(SIGSEGV,
> +				      fault_kind,
> +				      far, inf->name, pkey);
>  	}
>  
>  	return 0;
