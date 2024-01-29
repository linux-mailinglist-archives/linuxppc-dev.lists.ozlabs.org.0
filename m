Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2169584114F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 18:52:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNwqk71pZz3cWw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 04:52:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 465 seconds by postgrey-1.37 at boromir; Tue, 30 Jan 2024 04:52:13 AEDT
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNwqK23vqz3byT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 04:52:11 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58831139F;
	Mon, 29 Jan 2024 09:52:24 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.48.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 529603F738;
	Mon, 29 Jan 2024 09:51:36 -0800 (PST)
Date: Mon, 29 Jan 2024 17:51:33 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH v10 2/6] arm64: add support for machine check error safe
Message-ID: <ZbflpQV7aVry0qPz@FVFF77S0Q05N>
References: <20240129134652.4004931-1-tongtiangen@huawei.com>
 <20240129134652.4004931-3-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129134652.4004931-3-tongtiangen@huawei.com>
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
Cc: wangkefeng.wang@huawei.com, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, "H. Peter Anvin" <hpa@zytor.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, linuxppc-dev@lists.ozlabs.org, Guohanjun <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 29, 2024 at 09:46:48PM +0800, Tong Tiangen wrote:
> For the arm64 kernel, when it processes hardware memory errors for
> synchronize notifications(do_sea()), if the errors is consumed within the
> kernel, the current processing is panic. However, it is not optimal.
> 
> Take uaccess for example, if the uaccess operation fails due to memory
> error, only the user process will be affected. Killing the user process and
> isolating the corrupt page is a better choice.
> 
> This patch only enable machine error check framework and adds an exception
> fixup before the kernel panic in do_sea().
> 
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> ---
>  arch/arm64/Kconfig               |  1 +
>  arch/arm64/include/asm/extable.h |  1 +
>  arch/arm64/mm/extable.c          | 16 ++++++++++++++++
>  arch/arm64/mm/fault.c            | 29 ++++++++++++++++++++++++++++-
>  4 files changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index aa7c1d435139..2cc34b5e7abb 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -20,6 +20,7 @@ config ARM64
>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
>  	select ARCH_HAS_CACHE_LINE_SIZE
> +	select ARCH_HAS_COPY_MC if ACPI_APEI_GHES
>  	select ARCH_HAS_CURRENT_STACK_POINTER
>  	select ARCH_HAS_DEBUG_VIRTUAL
>  	select ARCH_HAS_DEBUG_VM_PGTABLE
> diff --git a/arch/arm64/include/asm/extable.h b/arch/arm64/include/asm/extable.h
> index 72b0e71cc3de..f80ebd0addfd 100644
> --- a/arch/arm64/include/asm/extable.h
> +++ b/arch/arm64/include/asm/extable.h
> @@ -46,4 +46,5 @@ bool ex_handler_bpf(const struct exception_table_entry *ex,
>  #endif /* !CONFIG_BPF_JIT */
>  
>  bool fixup_exception(struct pt_regs *regs);
> +bool fixup_exception_mc(struct pt_regs *regs);
>  #endif
> diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
> index 228d681a8715..478e639f8680 100644
> --- a/arch/arm64/mm/extable.c
> +++ b/arch/arm64/mm/extable.c
> @@ -76,3 +76,19 @@ bool fixup_exception(struct pt_regs *regs)
>  
>  	BUG();
>  }
> +
> +bool fixup_exception_mc(struct pt_regs *regs)

Can we please replace 'mc' with something like 'memory_error' ?

There's no "machine check" on arm64, and 'mc' is opaque regardless.

> +{
> +	const struct exception_table_entry *ex;
> +
> +	ex = search_exception_tables(instruction_pointer(regs));
> +	if (!ex)
> +		return false;
> +
> +	/*
> +	 * This is not complete, More Machine check safe extable type can
> +	 * be processed here.
> +	 */
> +
> +	return false;
> +}

As with my comment on the subsequenty patch, I'd much prefer that we handle
EX_TYPE_UACCESS_ERR_ZERO from the outset.



> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 55f6455a8284..312932dc100b 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -730,6 +730,31 @@ static int do_bad(unsigned long far, unsigned long esr, struct pt_regs *regs)
>  	return 1; /* "fault" */
>  }
>  
> +static bool arm64_do_kernel_sea(unsigned long addr, unsigned int esr,
> +				     struct pt_regs *regs, int sig, int code)
> +{
> +	if (!IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC))
> +		return false;
> +
> +	if (user_mode(regs))
> +		return false;

This function is called "arm64_do_kernel_sea"; surely the caller should *never*
call this for a SEA taken from user mode?

> +
> +	if (apei_claim_sea(regs) < 0)
> +		return false;
> +
> +	if (!fixup_exception_mc(regs))
> +		return false;
> +
> +	if (current->flags & PF_KTHREAD)
> +		return true;

I think this needs a comment; why do we allow kthreads to go on, yet kill user
threads? What about helper threads (e.g. for io_uring)?

> +
> +	set_thread_esr(0, esr);

Why do we set the ESR to 0?

Mark.

> +	arm64_force_sig_fault(sig, code, addr,
> +		"Uncorrected memory error on access to user memory\n");
> +
> +	return true;
> +}
> +
>  static int do_sea(unsigned long far, unsigned long esr, struct pt_regs *regs)
>  {
>  	const struct fault_info *inf;
> @@ -755,7 +780,9 @@ static int do_sea(unsigned long far, unsigned long esr, struct pt_regs *regs)
>  		 */
>  		siaddr  = untagged_addr(far);
>  	}
> -	arm64_notify_die(inf->name, regs, inf->sig, inf->code, siaddr, esr);
> +
> +	if (!arm64_do_kernel_sea(siaddr, esr, regs, inf->sig, inf->code))
> +		arm64_notify_die(inf->name, regs, inf->sig, inf->code, siaddr, esr);
>  
>  	return 0;
>  }
> -- 
> 2.25.1
> 
