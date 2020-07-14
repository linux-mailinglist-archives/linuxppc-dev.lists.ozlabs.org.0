Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E68E220001
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 23:26:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5tqx1bVDzDqWN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 07:26:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=n3UTIs7m; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5tnq10g5zDqQt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 07:24:45 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id t11so8157552pfq.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 14:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eIAevkBeaME9YWTUo8UY0ZyBLFbUSSkkyRhcPQcy9So=;
 b=n3UTIs7mynRKGzDODTp8B/n0UT9hAcMkGo6wqEADm4JAiqx9DOfaMtF575iPea+rO0
 +I+S93Jdw7u+VxiRzWGRYMdACaoE5kX6lJPEoVX32JYHc1Sc3K3JA+wTo/4kPuPwvROM
 hCy9U5hMuEu91ng2d8vn6i4Z230VnARu4MqSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eIAevkBeaME9YWTUo8UY0ZyBLFbUSSkkyRhcPQcy9So=;
 b=kuaOwHBt57Q4WdsiDU/tuiVQV9Md5zGZiJAcUOlTY+xkmjcgLts1Leb01Y5HeaBnKt
 zrKbONAcsOYnfOyMuB7jw/7xDbozGAo1P6JnDhLTuWBwWm/dwHTjFnJIOR1iGU7C8/lO
 aa3r50QFG6+LpXVso7aTQ+Agv3CLyp1NAtgKOI6zwAzFjRg6SklWIkmuepr4331ki4W7
 xtO50ZwkwwxOAr4sP5khcGQNTzVBaYaQLLdBVozbRFUv9gQMlcbMNV+P2dTQqrbRkk9X
 0+flWd7+QpJ+Li9MffjS6/+S31wVXMP8hOwMHPIx6G5XkiMS5fZQ4JA2s5ShEA4m8Pb9
 Ij6Q==
X-Gm-Message-State: AOAM532jhROtppzhJEYV+LAlOw5pfRr/RPvNNz5htrnsRFj0KnLSjNAG
 7y6YVntn1Lr1WDg42pl7LyL30uvnwoU=
X-Google-Smtp-Source: ABdhPJwp5UkwyAfrDAMSmZPKmdv5E7KkH/X6aBFhZG6pvM9S40xTMTqgAHiSZkFdw4+UrgEFQyGEDQ==
X-Received: by 2002:a63:d951:: with SMTP id e17mr4856083pgj.318.1594761881770; 
 Tue, 14 Jul 2020 14:24:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id h6sm111216pfg.25.2020.07.14.14.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 14:24:40 -0700 (PDT)
Date: Tue, 14 Jul 2020 14:24:39 -0700
From: Kees Cook <keescook@chromium.org>
To: "Christopher M. Riedl" <cmr@informatik.wtf>
Subject: Re: [PATCH v2 5/5] powerpc: Add LKDTM test to hijack a patch mapping
Message-ID: <202007141406.43B82CCFD@keescook>
References: <20200709040316.12789-1-cmr@informatik.wtf>
 <20200709040316.12789-6-cmr@informatik.wtf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709040316.12789-6-cmr@informatik.wtf>
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel-hardening@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 08, 2020 at 11:03:16PM -0500, Christopher M. Riedl wrote:
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
>  drivers/misc/lkdtm/core.c  |  1 +
>  drivers/misc/lkdtm/lkdtm.h |  1 +
>  drivers/misc/lkdtm/perms.c | 99 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 101 insertions(+)
> 
> diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
> index a5e344df9166..482e72f6a1e1 100644
> --- a/drivers/misc/lkdtm/core.c
> +++ b/drivers/misc/lkdtm/core.c
> @@ -145,6 +145,7 @@ static const struct crashtype crashtypes[] = {
>  	CRASHTYPE(WRITE_RO),
>  	CRASHTYPE(WRITE_RO_AFTER_INIT),
>  	CRASHTYPE(WRITE_KERN),
> +	CRASHTYPE(HIJACK_PATCH),
>  	CRASHTYPE(REFCOUNT_INC_OVERFLOW),
>  	CRASHTYPE(REFCOUNT_ADD_OVERFLOW),
>  	CRASHTYPE(REFCOUNT_INC_NOT_ZERO_OVERFLOW),
> diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
> index 601a2156a0d4..bfcf3542370d 100644
> --- a/drivers/misc/lkdtm/lkdtm.h
> +++ b/drivers/misc/lkdtm/lkdtm.h
> @@ -62,6 +62,7 @@ void lkdtm_EXEC_USERSPACE(void);
>  void lkdtm_EXEC_NULL(void);
>  void lkdtm_ACCESS_USERSPACE(void);
>  void lkdtm_ACCESS_NULL(void);
> +void lkdtm_HIJACK_PATCH(void);
>  
>  /* lkdtm_refcount.c */
>  void lkdtm_REFCOUNT_INC_OVERFLOW(void);
> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> index 62f76d506f04..b7149daaeb6f 100644
> --- a/drivers/misc/lkdtm/perms.c
> +++ b/drivers/misc/lkdtm/perms.c
> @@ -9,6 +9,7 @@
>  #include <linux/vmalloc.h>
>  #include <linux/mman.h>
>  #include <linux/uaccess.h>
> +#include <linux/kthread.h>
>  #include <asm/cacheflush.h>
>  
>  /* Whether or not to fill the target memory area with do_nothing(). */
> @@ -213,6 +214,104 @@ void lkdtm_ACCESS_NULL(void)
>  	*ptr = tmp;
>  }
>  
> +#if defined(CONFIG_PPC) && defined(CONFIG_STRICT_KERNEL_RWX)
> +#include <include/asm/code-patching.h>
> +
> +static struct ppc_inst * const patch_site = (struct ppc_inst *)&do_nothing;

While this is probably fine, I'd prefer a new target instead of re-using
do_nothing.

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

Can this test be done for x86's instruction patching too?

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
>  void __init lkdtm_perms_init(void)
>  {
>  	/* Make sure we can write to __ro_after_init values during __init */
> -- 
> 2.27.0

Otherwise, looks good!

-- 
Kees Cook
