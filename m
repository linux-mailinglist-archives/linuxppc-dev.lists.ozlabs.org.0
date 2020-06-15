Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C211F9058
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 09:50:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lk5520BPzDqZ1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 17:50:01 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lhV46C6ZzDqLJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 16:38:00 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49lhTq0VvNzB09ZK;
 Mon, 15 Jun 2020 08:37:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 543VWa93fzS9; Mon, 15 Jun 2020 08:37:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49lhTp5lySzB09ZJ;
 Mon, 15 Jun 2020 08:37:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EBF338B77C;
 Mon, 15 Jun 2020 08:37:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FklWuunmRl_A; Mon, 15 Jun 2020 08:37:56 +0200 (CEST)
Received: from [172.25.230.104] (po15451.idsi0.si.c-s.fr [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C22E48B75F;
 Mon, 15 Jun 2020 08:37:56 +0200 (CEST)
Subject: Re: [PATCH 5/5] powerpc: Add LKDTM test to hijack a patch mapping
To: "Christopher M. Riedl" <cmr@informatik.wtf>,
 linuxppc-dev@lists.ozlabs.org, kernel-hardening@lists.openwall.com
References: <20200603051912.23296-1-cmr@informatik.wtf>
 <20200603051912.23296-6-cmr@informatik.wtf>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6a96f2d6-ae15-7745-9c22-cf8cb1980afe@csgroup.eu>
Date: Mon, 15 Jun 2020 08:37:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200603051912.23296-6-cmr@informatik.wtf>
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



Le 03/06/2020 à 07:19, Christopher M. Riedl a écrit :
> When live patching with STRICT_KERNEL_RWX, the CPU doing the patching
> must use a temporary mapping which allows for writing to kernel text.
> During the entire window of time when this temporary mapping is in use,
> another CPU could write to the same mapping and maliciously alter kernel
> text. Implement a LKDTM test to attempt to exploit such a openings when
> a CPU is patching under STRICT_KERNEL_RWX. The test is only implemented
> on powerpc for now.
> 
> The LKDTM "hijack" test works as follows:
> 
> 	1. A CPU executes an infinite loop to patch an instruction.
> 	   This is the "patching" CPU.
> 	2. Another CPU attempts to write to the address of the temporary
> 	   mapping used by the "patching" CPU. This other CPU is the
> 	   "hijacker" CPU. The hijack either fails with a segfault or
> 	   succeeds, in which case some kernel text is now overwritten.
> 
> How to run the test:
> 
> 	mount -t debugfs none /sys/kernel/debug
> 	(echo HIJACK_PATCH > /sys/kernel/debug/provoke-crash/DIRECT)
> 
> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> ---
>   drivers/misc/lkdtm/core.c  |   1 +
>   drivers/misc/lkdtm/lkdtm.h |   1 +
>   drivers/misc/lkdtm/perms.c | 101 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 103 insertions(+)
> 
> diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
> index a5e344df9166..482e72f6a1e1 100644
> --- a/drivers/misc/lkdtm/core.c
> +++ b/drivers/misc/lkdtm/core.c
> @@ -145,6 +145,7 @@ static const struct crashtype crashtypes[] = {
>   	CRASHTYPE(WRITE_RO),
>   	CRASHTYPE(WRITE_RO_AFTER_INIT),
>   	CRASHTYPE(WRITE_KERN),
> +	CRASHTYPE(HIJACK_PATCH),
>   	CRASHTYPE(REFCOUNT_INC_OVERFLOW),
>   	CRASHTYPE(REFCOUNT_ADD_OVERFLOW),
>   	CRASHTYPE(REFCOUNT_INC_NOT_ZERO_OVERFLOW),
> diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
> index 601a2156a0d4..bfcf3542370d 100644
> --- a/drivers/misc/lkdtm/lkdtm.h
> +++ b/drivers/misc/lkdtm/lkdtm.h
> @@ -62,6 +62,7 @@ void lkdtm_EXEC_USERSPACE(void);
>   void lkdtm_EXEC_NULL(void);
>   void lkdtm_ACCESS_USERSPACE(void);
>   void lkdtm_ACCESS_NULL(void);
> +void lkdtm_HIJACK_PATCH(void);
>   
>   /* lkdtm_refcount.c */
>   void lkdtm_REFCOUNT_INC_OVERFLOW(void);
> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> index 62f76d506f04..8bda3b56bc78 100644
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
> @@ -213,6 +214,106 @@ void lkdtm_ACCESS_NULL(void)
>   	*ptr = tmp;
>   }
>   
> +#if defined(CONFIG_PPC) && defined(CONFIG_STRICT_KERNEL_RWX)

Should also depend on CONFIG_SMP.

Christophe

> +#include <include/asm/code-patching.h>
> +
> +extern unsigned long read_cpu_patching_addr(unsigned int cpu);
> +
> +static struct ppc_inst * const patch_site = (struct ppc_inst *)&do_nothing;
> +
> +static int lkdtm_patching_cpu(void *data)
> +{
> +	int err = 0;
> +	struct ppc_inst insn = ppc_inst(0xdeadbeef);
> +
> +	pr_info("starting patching_cpu=%d\n", smp_processor_id());
> +	do {
> +		err = patch_instruction(patch_site, insn);
> +	} while (ppc_inst_equal(ppc_inst_read(READ_ONCE(patch_site)), insn) &&
> +			!err && !kthread_should_stop());
> +
> +	if (err)
> +		pr_warn("patch_instruction returned error: %d\n", err);
> +
> +	set_current_state(TASK_INTERRUPTIBLE);
> +	while (!kthread_should_stop()) {
> +		schedule();
> +		set_current_state(TASK_INTERRUPTIBLE);
> +	}
> +
> +	return err;
> +}
> +
> +void lkdtm_HIJACK_PATCH(void)
> +{
> +	struct task_struct *patching_kthrd;
> +	struct ppc_inst original_insn;
> +	int patching_cpu, hijacker_cpu, attempts;
> +	unsigned long addr;
> +	bool hijacked;
> +
> +	if (num_online_cpus() < 2) {
> +		pr_warn("need at least two cpus\n");
> +		return;
> +	}
> +
> +	original_insn = ppc_inst_read(READ_ONCE(patch_site));
> +
> +	hijacker_cpu = smp_processor_id();
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
> +		/* Use __put_user to catch faults without an Oops */
> +		hijacked = !__put_user(0xbad00bad, (unsigned int *)addr);
> +
> +		if (hijacked) {
> +			if (kthread_stop(patching_kthrd))
> +				goto out;
> +			break;
> +		}
> +	}
> +	pr_info("hijack attempts: %d\n", attempts);
> +
> +	if (hijacked) {
> +		if (*(unsigned int *)READ_ONCE(patch_site) == 0xbad00bad)
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
> +out:
> +	/* Restore the original insn for any future lkdtm tests */
> +	patch_instruction(patch_site, original_insn);
> +}
> +
> +#else
> +
> +void lkdtm_HIJACK_PATCH(void)
> +{
> +	if (!IS_ENABLED(CONFIG_PPC))
> +		pr_err("XFAIL: this test is powerpc-only\n");
> +	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> +		pr_err("XFAIL: this test requires CONFIG_STRICT_KERNEL_RWX\n");
> +}
> +
> +#endif /* CONFIG_PPC && CONFIG_STRICT_KERNEL_RWX */
> +
>   void __init lkdtm_perms_init(void)
>   {
>   	/* Make sure we can write to __ro_after_init values during __init */
> 
