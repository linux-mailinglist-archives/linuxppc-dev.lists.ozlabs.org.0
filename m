Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5B93E10F0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 11:13:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgNFM1HnHz3d8t
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 19:13:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgNF16sdtz2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 19:13:09 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GgNDy6WrNz9sWJ;
 Thu,  5 Aug 2021 11:13:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WLD2irFs-efJ; Thu,  5 Aug 2021 11:13:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GgNDy4yPCz9sWH;
 Thu,  5 Aug 2021 11:13:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7F11E8B7BE;
 Thu,  5 Aug 2021 11:13:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id phH389F5x-jc; Thu,  5 Aug 2021 11:13:06 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BC0988B7BD;
 Thu,  5 Aug 2021 11:13:05 +0200 (CEST)
Subject: Re: [PATCH v5 2/8] lkdtm/powerpc: Add test to hijack a patch mapping
To: "Christopher M. Riedl" <cmr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210713053113.4632-1-cmr@linux.ibm.com>
 <20210713053113.4632-3-cmr@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f933e9de-ff3b-aa5a-bb6e-55770d5ab868@csgroup.eu>
Date: Thu, 5 Aug 2021 11:13:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210713053113.4632-3-cmr@linux.ibm.com>
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
Cc: keescook@chromium.org, peterz@infradead.org, x86@kernel.org,
 npiggin@gmail.com, linux-hardening@vger.kernel.org, tglx@linutronix.de,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/07/2021 à 07:31, Christopher M. Riedl a écrit :
> When live patching with STRICT_KERNEL_RWX the CPU doing the patching
> must temporarily remap the page(s) containing the patch site with +W
> permissions. While this temporary mapping is in use, another CPU could
> write to the same mapping and maliciously alter kernel text. Implement a
> LKDTM test to attempt to exploit such an opening during code patching.
> The test is implemented on powerpc and requires LKDTM built into the
> kernel (building LKDTM as a module is insufficient).
> 
> The LKDTM "hijack" test works as follows:
> 
>    1. A CPU executes an infinite loop to patch an instruction. This is
>       the "patching" CPU.
>    2. Another CPU attempts to write to the address of the temporary
>       mapping used by the "patching" CPU. This other CPU is the
>       "hijacker" CPU. The hijack either fails with a fault/error or
>       succeeds, in which case some kernel text is now overwritten.
> 
> The virtual address of the temporary patch mapping is provided via an
> LKDTM-specific accessor to the hijacker CPU. This test assumes a
> hypothetical situation where this address was leaked previously.
> 
> How to run the test:
> 
> 	mount -t debugfs none /sys/kernel/debug
> 	(echo HIJACK_PATCH > /sys/kernel/debug/provoke-crash/DIRECT)
> 
> A passing test indicates that it is not possible to overwrite kernel
> text from another CPU by using the temporary mapping established by
> a CPU for patching.
> 
> Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>
> 
> ---
> 
> v5:  * Use `u32*` instead of `struct ppc_inst*` based on new series in
>         upstream.
> 
> v4:  * Separate the powerpc and x86_64 bits into individual patches.
>       * Use __put_kernel_nofault() when attempting to hijack the mapping
>       * Use raw_smp_processor_id() to avoid triggering the BUG() when
>         calling smp_processor_id() in preemptible code - the only thing
>         that matters is that one of the threads is bound to a different
>         CPU - we are not using smp_processor_id() to access any per-cpu
>         data or similar where preemption should be disabled.
>       * Rework the patching_cpu() kthread stop condition to avoid:
>         https://lwn.net/Articles/628628/
> ---
>   drivers/misc/lkdtm/core.c  |   1 +
>   drivers/misc/lkdtm/lkdtm.h |   1 +
>   drivers/misc/lkdtm/perms.c | 134 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 136 insertions(+)
> 
> diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
> index 8024b6a5cc7fc..fbcb95eda337b 100644
> --- a/drivers/misc/lkdtm/core.c
> +++ b/drivers/misc/lkdtm/core.c
> @@ -147,6 +147,7 @@ static const struct crashtype crashtypes[] = {
>   	CRASHTYPE(WRITE_RO),
>   	CRASHTYPE(WRITE_RO_AFTER_INIT),
>   	CRASHTYPE(WRITE_KERN),
> +	CRASHTYPE(HIJACK_PATCH),
>   	CRASHTYPE(REFCOUNT_INC_OVERFLOW),
>   	CRASHTYPE(REFCOUNT_ADD_OVERFLOW),
>   	CRASHTYPE(REFCOUNT_INC_NOT_ZERO_OVERFLOW),
> diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
> index 99f90d3e5e9cb..87e7e6136d962 100644
> --- a/drivers/misc/lkdtm/lkdtm.h
> +++ b/drivers/misc/lkdtm/lkdtm.h
> @@ -62,6 +62,7 @@ void lkdtm_EXEC_USERSPACE(void);
>   void lkdtm_EXEC_NULL(void);
>   void lkdtm_ACCESS_USERSPACE(void);
>   void lkdtm_ACCESS_NULL(void);
> +void lkdtm_HIJACK_PATCH(void);
>   
>   /* refcount.c */
>   void lkdtm_REFCOUNT_INC_OVERFLOW(void);
> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> index 2dede2ef658f3..39e7456852229 100644
> --- a/drivers/misc/lkdtm/perms.c
> +++ b/drivers/misc/lkdtm/perms.c
> @@ -9,6 +9,7 @@
>   #include <linux/vmalloc.h>
>   #include <linux/mman.h>
>   #include <linux/uaccess.h>
> +#include <linux/kthread.h>
>   #include <asm/cacheflush.h>
>   
>   /* Whether or not to fill the target memory area with do_nothing(). */
> @@ -222,6 +223,139 @@ void lkdtm_ACCESS_NULL(void)
>   	pr_err("FAIL: survived bad write\n");
>   }
>   
> +#if (IS_BUILTIN(CONFIG_LKDTM) && defined(CONFIG_STRICT_KERNEL_RWX) && \
> +	defined(CONFIG_PPC))


I think this test shouldn't be limited to CONFIG_PPC and shouldn't be limited to 
CONFIG_STRICT_KERNEL_RWX. It should be there all the time.

Also why limiting it to IS_BUILTIN(CONFIG_LKDTM) ?

> +/*
> + * This is just a dummy location to patch-over.
> + */
> +static void patching_target(void)
> +{
> +	return;
> +}
> +
> +#include <asm/code-patching.h>
> +const u32 *patch_site = (const u32 *)&patching_target;
> +
> +static inline int lkdtm_do_patch(u32 data)
> +{
> +	return patch_instruction((u32 *)patch_site, ppc_inst(data));
> +}
> +
> +static inline u32 lkdtm_read_patch_site(void)
> +{
> +	return READ_ONCE(*patch_site);
> +}
> +
> +/* Returns True if the write succeeds */
> +static inline bool lkdtm_try_write(u32 data, u32 *addr)
> +{
> +	__put_kernel_nofault(addr, &data, u32, err);
> +	return true;
> +
> +err:
> +	return false;
> +}
> +
> +static int lkdtm_patching_cpu(void *data)
> +{
> +	int err = 0;
> +	u32 val = 0xdeadbeef;
> +
> +	pr_info("starting patching_cpu=%d\n", raw_smp_processor_id());
> +
> +	do {
> +		err = lkdtm_do_patch(val);
> +	} while (lkdtm_read_patch_site() == val && !err && !kthread_should_stop());
> +
> +	if (err)
> +		pr_warn("XFAIL: patch_instruction returned error: %d\n", err);
> +
> +	while (!kthread_should_stop()) {
> +		set_current_state(TASK_INTERRUPTIBLE);
> +		schedule();
> +	}
> +
> +	return err;
> +}
> +
> +void lkdtm_HIJACK_PATCH(void)
> +{
> +	struct task_struct *patching_kthrd;
> +	int patching_cpu, hijacker_cpu, attempts;
> +	unsigned long addr;
> +	bool hijacked;
> +	const u32 bad_data = 0xbad00bad;
> +	const u32 original_insn = lkdtm_read_patch_site();
> +
> +	if (!IS_ENABLED(CONFIG_SMP)) {
> +		pr_err("XFAIL: this test requires CONFIG_SMP\n");
> +		return;
> +	}
> +
> +	if (num_online_cpus() < 2) {
> +		pr_warn("XFAIL: this test requires at least two cpus\n");
> +		return;
> +	}
> +
> +	hijacker_cpu = raw_smp_processor_id();
> +	patching_cpu = cpumask_any_but(cpu_online_mask, hijacker_cpu);
> +
> +	patching_kthrd = kthread_create_on_node(&lkdtm_patching_cpu, NULL,
> +						cpu_to_node(patching_cpu),
> +						"lkdtm_patching_cpu");
> +	kthread_bind(patching_kthrd, patching_cpu);
> +	wake_up_process(patching_kthrd);
> +
> +	addr = offset_in_page(patch_site) | read_cpu_patching_addr(patching_cpu);
> +
> +	pr_info("starting hijacker_cpu=%d\n", hijacker_cpu);
> +	for (attempts = 0; attempts < 100000; ++attempts) {
> +		/* Try to write to the other CPU's temp patch mapping */
> +		hijacked = lkdtm_try_write(bad_data, (u32 *)addr);
> +
> +		if (hijacked) {
> +			if (kthread_stop(patching_kthrd)) {
> +				pr_info("hijack attempts: %d\n", attempts);
> +				pr_err("XFAIL: error stopping patching cpu\n");
> +				return;
> +			}
> +			break;
> +		}
> +	}
> +	pr_info("hijack attempts: %d\n", attempts);
> +
> +	if (hijacked) {
> +		if (lkdtm_read_patch_site() == bad_data)
> +			pr_err("overwrote kernel text\n");
> +		/*
> +		 * There are window conditions where the hijacker cpu manages to
> +		 * write to the patch site but the site gets overwritten again by
> +		 * the patching cpu. We still consider that a "successful" hijack
> +		 * since the hijacker cpu did not fault on the write.
> +		 */
> +		pr_err("FAIL: wrote to another cpu's patching area\n");
> +	} else {
> +		kthread_stop(patching_kthrd);
> +	}
> +
> +	/* Restore the original data to be able to run the test again */
> +	lkdtm_do_patch(original_insn);
> +}
> +
> +#else
> +
> +void lkdtm_HIJACK_PATCH(void)
> +{
> +	if (!IS_ENABLED(CONFIG_PPC))
> +		pr_err("XFAIL: this test only runs on powerpc\n");
> +	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> +		pr_err("XFAIL: this test requires CONFIG_STRICT_KERNEL_RWX\n");
> +	if (!IS_BUILTIN(CONFIG_LKDTM))
> +		pr_err("XFAIL: this test requires CONFIG_LKDTM=y (not =m!)\n");
> +}
> +
> +#endif
> +
>   void __init lkdtm_perms_init(void)
>   {
>   	/* Make sure we can write to __ro_after_init values during __init */
> 
