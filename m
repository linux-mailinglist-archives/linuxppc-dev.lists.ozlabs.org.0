Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8C6526610
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 17:27:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0CF60z5Wz3cFs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 01:27:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4L0CDd6z1Lz3bqY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 May 2022 01:26:55 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AB9A113E;
 Fri, 13 May 2022 08:26:22 -0700 (PDT)
Received: from lakrids (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D19A3F73D;
 Fri, 13 May 2022 08:26:19 -0700 (PDT)
Date: Fri, 13 May 2022 16:26:16 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH -next v4 3/7] arm64: add support for machine check error
 safe
Message-ID: <Yn54mA7KnlAs1dER@lakrids>
References: <20220420030418.3189040-1-tongtiangen@huawei.com>
 <20220420030418.3189040-4-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420030418.3189040-4-tongtiangen@huawei.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Guohanjun <guohanjun@huawei.com>,
 Will Deacon <will@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Xie XiuQi <xiexiuqi@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 20, 2022 at 03:04:14AM +0000, Tong Tiangen wrote:
> During the processing of arm64 kernel hardware memory errors(do_sea()), if
> the errors is consumed in the kernel, the current processing is panic.
> However, it is not optimal.
> 
> Take uaccess for example, if the uaccess operation fails due to memory
> error, only the user process will be affected, kill the user process
> and isolate the user page with hardware memory errors is a better choice.

Conceptually, I'm fine with the idea of constraining what we do for a
true uaccess, but I don't like the implementation of this at all, and I
think we first need to clean up the arm64 extable usage to clearly
distinguish a uaccess from another access.

> This patch only enable machine error check framework, it add exception
> fixup before kernel panic in do_sea() and only limit the consumption of
> hardware memory errors in kernel mode triggered by user mode processes.
> If fixup successful, panic can be avoided.
> 
> Consistent with PPC/x86, it is implemented by CONFIG_ARCH_HAS_COPY_MC.
> 
> Also add copy_mc_to_user() in include/linux/uaccess.h, this helper is
> called when CONFIG_ARCH_HAS_COPOY_MC is open.
> 
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> ---
>  arch/arm64/Kconfig               |  1 +
>  arch/arm64/include/asm/extable.h |  1 +
>  arch/arm64/mm/extable.c          | 17 +++++++++++++++++
>  arch/arm64/mm/fault.c            | 27 ++++++++++++++++++++++++++-
>  include/linux/uaccess.h          |  9 +++++++++
>  5 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index d9325dd95eba..012e38309955 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -19,6 +19,7 @@ config ARM64
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
> index 489455309695..4f0083a550d4 100644
> --- a/arch/arm64/mm/extable.c
> +++ b/arch/arm64/mm/extable.c
> @@ -9,6 +9,7 @@
>  
>  #include <asm/asm-extable.h>
>  #include <asm/ptrace.h>
> +#include <asm/esr.h>
>  
>  static inline unsigned long
>  get_ex_fixup(const struct exception_table_entry *ex)
> @@ -84,3 +85,19 @@ bool fixup_exception(struct pt_regs *regs)
>  
>  	BUG();
>  }
> +
> +bool fixup_exception_mc(struct pt_regs *regs)
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

This is at best misnamed; It doesn't actually apply the fixup, it just
searches for one.

> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 77341b160aca..a9e6fb1999d1 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -695,6 +695,29 @@ static int do_bad(unsigned long far, unsigned int esr, struct pt_regs *regs)
>  	return 1; /* "fault" */
>  }
>  
> +static bool arm64_do_kernel_sea(unsigned long addr, unsigned int esr,
> +				     struct pt_regs *regs, int sig, int code)
> +{
> +	if (!IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC))
> +		return false;
> +
> +	if (user_mode(regs) || !current->mm)
> +		return false;
> +
> +	if (apei_claim_sea(regs) < 0)
> +		return false;
> +
> +	if (!fixup_exception_mc(regs))
> +		return false;
> +
> +	set_thread_esr(0, esr);
> +
> +	arm64_force_sig_fault(sig, code, addr,
> +		"Uncorrected hardware memory error in kernel-access\n");
> +
> +	return true;
> +}
> +
>  static int do_sea(unsigned long far, unsigned int esr, struct pt_regs *regs)
>  {
>  	const struct fault_info *inf;
> @@ -720,7 +743,9 @@ static int do_sea(unsigned long far, unsigned int esr, struct pt_regs *regs)
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
> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> index 546179418ffa..884661b29c17 100644
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -174,6 +174,15 @@ copy_mc_to_kernel(void *dst, const void *src, size_t cnt)
>  }
>  #endif
>  
> +#ifndef copy_mc_to_user
> +static inline unsigned long __must_check
> +copy_mc_to_user(void *dst, const void *src, size_t cnt)
> +{
> +	check_object_size(src, cnt, true);
> +	return raw_copy_to_user(dst, src, cnt);
> +}
> +#endif

Why do we need a special copy_mc_to_user() ?

Why are we not making *every* true uaccess recoverable? That way the
regular copy_to_user() would just work.

Thanks,
Mark.
