Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A12F0930FC0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 10:28:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMwMr4QF4z3fn0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 18:28:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMwLd10BTz3dBh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 18:27:52 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E188ADA7;
	Mon, 15 Jul 2024 01:27:46 -0700 (PDT)
Received: from [10.162.40.16] (a077893.blr.arm.com [10.162.40.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 538F93F73F;
	Mon, 15 Jul 2024 01:27:12 -0700 (PDT)
Message-ID: <3c655663-3407-4602-a958-c5382a6b3133@arm.com>
Date: Mon, 15 Jul 2024 13:57:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/29] arm64: context switch POR_EL0 register
To: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-7-joey.gouly@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240503130147.1154804-7-joey.gouly@arm.com>
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



On 5/3/24 18:31, Joey Gouly wrote:
> POR_EL0 is a register that can be modified by userspace directly,
> so it must be context switched.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/cpufeature.h |  6 ++++++
>  arch/arm64/include/asm/processor.h  |  1 +
>  arch/arm64/include/asm/sysreg.h     |  3 +++
>  arch/arm64/kernel/process.c         | 28 ++++++++++++++++++++++++++++
>  4 files changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index 8b904a757bd3..d46aab23e06e 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -832,6 +832,12 @@ static inline bool system_supports_lpa2(void)
>  	return cpus_have_final_cap(ARM64_HAS_LPA2);
>  }
>  
> +static inline bool system_supports_poe(void)
> +{
> +	return IS_ENABLED(CONFIG_ARM64_POE) &&

CONFIG_ARM64_POE has not been defined/added until now ?

> +		alternative_has_cap_unlikely(ARM64_HAS_S1POE);
> +}
> +
>  int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
>  bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
>  
> diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
> index f77371232d8c..e6376f979273 100644
> --- a/arch/arm64/include/asm/processor.h
> +++ b/arch/arm64/include/asm/processor.h
> @@ -184,6 +184,7 @@ struct thread_struct {
>  	u64			sctlr_user;
>  	u64			svcr;
>  	u64			tpidr2_el0;
> +	u64			por_el0;
>  };

As there going to be a new config i.e CONFIG_ARM64_POE, should not this
register be wrapped up with #ifdef CONFIG_ARM64_POE as well ? Similarly
access into p->thread.por_el0 should also be conditional on that config.

>  
>  static inline unsigned int thread_get_vl(struct thread_struct *thread,
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 9e8999592f3a..62c399811dbf 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -1064,6 +1064,9 @@
>  #define POE_RXW		UL(0x7)
>  #define POE_MASK	UL(0xf)
>  
> +/* Initial value for Permission Overlay Extension for EL0 */
> +#define POR_EL0_INIT	POE_RXW

The idea behind POE_RXW as the init value is to be all permissive ?

> +
>  #define ARM64_FEATURE_FIELD_BITS	4
>  
>  /* Defined for compatibility only, do not add new users. */
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 4ae31b7af6c3..0ffaca98bed6 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -271,12 +271,23 @@ static void flush_tagged_addr_state(void)
>  		clear_thread_flag(TIF_TAGGED_ADDR);
>  }
>  
> +static void flush_poe(void)
> +{
> +	if (!system_supports_poe())
> +		return;
> +
> +	write_sysreg_s(POR_EL0_INIT, SYS_POR_EL0);
> +	/* ISB required for kernel uaccess routines when chaning POR_EL0 */
> +	isb();
> +}
> +
>  void flush_thread(void)
>  {
>  	fpsimd_flush_thread();
>  	tls_thread_flush();
>  	flush_ptrace_hw_breakpoint(current);
>  	flush_tagged_addr_state();
> +	flush_poe();
>  }
>  
>  void arch_release_task_struct(struct task_struct *tsk)
> @@ -371,6 +382,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>  		if (system_supports_tpidr2())
>  			p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
>  
> +		if (system_supports_poe())
> +			p->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> +
>  		if (stack_start) {
>  			if (is_compat_thread(task_thread_info(p)))
>  				childregs->compat_sp = stack_start;
> @@ -495,6 +509,19 @@ static void erratum_1418040_new_exec(void)
>  	preempt_enable();
>  }
>  
> +static void permission_overlay_switch(struct task_struct *next)
> +{
> +	if (!system_supports_poe())
> +		return;
> +
> +	current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> +	if (current->thread.por_el0 != next->thread.por_el0) {
> +		write_sysreg_s(next->thread.por_el0, SYS_POR_EL0);
> +		/* ISB required for kernel uaccess routines when chaning POR_EL0 */
> +		isb();
> +	}
> +}
> +
>  /*
>   * __switch_to() checks current->thread.sctlr_user as an optimisation. Therefore
>   * this function must be called with preemption disabled and the update to
> @@ -530,6 +557,7 @@ struct task_struct *__switch_to(struct task_struct *prev,
>  	ssbs_thread_switch(next);
>  	erratum_1418040_thread_switch(next);
>  	ptrauth_thread_switch_user(next);
> +	permission_overlay_switch(next);
>  
>  	/*
>  	 * Complete any pending TLB or cache maintenance on this CPU in case
