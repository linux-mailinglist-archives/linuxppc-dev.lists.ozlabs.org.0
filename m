Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 220253ABF37
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:11:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5d8V5TVZz3c42
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 09:11:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=MAIEJin+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MAIEJin+; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5d7z6qN7z3bsG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 09:10:38 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id g24so4657750pji.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 16:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=e5Pt0kZsBxNEHIKD1Am2RxXX0rGU0t2MvLg8kEWEZFk=;
 b=MAIEJin+adv/lDbD8N9vBou5sd2HLwBSC2nMbkBpryb+TC+ZplveBYZx4AYQv3Z8eL
 p2Yusuzfu3W+wvkOvETbJWfCFAZA0yoM2tVJWL0pCgbN1YgcuRxJScb0ZutYbqhXPoyn
 3bbl1Co99dWwkdQcUZ7EWASJiSy9PSLTgb0zKoP9BnOr7n8mLa8APPnhDZkYQm4MvX2N
 vcugDrdaLwd42Lqs2LZfNfHWHIS8i11cGbcQTf+hO5/gIrsofg6T6qNn6DZXwzxNRiyd
 kqcZIMqhYvmLmzhGE8oNABbhOQnxUJFmyiVUAuvyfyWo5IKK7aeIY9QjMREM1slFaVOr
 zd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=e5Pt0kZsBxNEHIKD1Am2RxXX0rGU0t2MvLg8kEWEZFk=;
 b=sMF8Hsj2P+6vC3Fg4FxGYa3WbixYg0hEZHLSBkdhX5sVXrGwRFmFETLohNHN+upmaV
 ZHCqlwzPPAAfXGGhO7U/NOEx5ZJADF73z8cIdjbCLwKS0jTQROUiGq9SjTHR/MXmvFc/
 4yD+3DACacQyL5w8TJSMa3QYJzsutfPQ6KyqpJ0h4mADyql7mvCZg5o5bQEUE5Deop20
 yKiaWifiMSRS0GknVIMbw8Kkmcsh6vqFKEXcP97qNveLQlM6rmzQsW7De/j6/2vtDmx7
 FQoYlk9bzEVhp4UCtGa5yBJRE9HVEoD2EDubVbVj4NzKw7ya9GmnB//OLGovy5kmSM+d
 Pahw==
X-Gm-Message-State: AOAM533VLU+RE+tQojdf6bF5plvPP9Gkt6l/va2hIc2rsFge0+m4wkwm
 upZKlg3ZX+iuxLY5+xJ8knk=
X-Google-Smtp-Source: ABdhPJwiIfs8OhjgdC97QS99WwT3cMlYhVxXcLf0Zc4Ms9jIRhvW/hC7b4MyO9SgO8WQ2nUUfgSJfw==
X-Received: by 2002:a17:90a:d18f:: with SMTP id
 fu15mr7744651pjb.78.1623971435979; 
 Thu, 17 Jun 2021 16:10:35 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id y8sm681068pfe.162.2021.06.17.16.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 16:10:35 -0700 (PDT)
Date: Fri, 18 Jun 2021 09:10:29 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 06/17] powerpc/vas: Move update_csb/dump_crb to common
 book3s platform
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
 <bf8d5b0770fa1ef5cba88c96580caa08d999d3b5.camel@linux.ibm.com>
In-Reply-To: <bf8d5b0770fa1ef5cba88c96580caa08d999d3b5.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623971353.tmbx8zufeh.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Excerpts from Haren Myneni's message of June 18, 2021 6:32 am:
>=20
> If a coprocessor encounters an error translating an address, the
> VAS will cause an interrupt in the host. The kernel processes
> the fault by updating CSB. This functionality is same for both
> powerNV and pseries. So this patch moves these functions to
> common vas-api.c and the actual functionality is not changed.
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/vas.h             |   3 +
>  arch/powerpc/platforms/book3s/vas-api.c    | 167 +++++++++++++++++++++
>  arch/powerpc/platforms/powernv/vas-fault.c | 155 ++-----------------
>  3 files changed, 179 insertions(+), 146 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index 71cff6d6bf3a..6b41c0818958 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -230,4 +230,7 @@ int vas_register_coproc_api(struct module *mod, enum =
vas_cop_type cop_type,
>  void vas_unregister_coproc_api(void);
> =20
>  int get_vas_user_win_ref(struct vas_user_win_ref *task_ref);
> +void vas_update_csb(struct coprocessor_request_block *crb,
> +		    struct vas_user_win_ref *task_ref);
> +void vas_dump_crb(struct coprocessor_request_block *crb);
>  #endif /* __ASM_POWERPC_VAS_H */
> diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platf=
orms/book3s/vas-api.c
> index 4ce82500f4c5..30172e52e16b 100644
> --- a/arch/powerpc/platforms/book3s/vas-api.c
> +++ b/arch/powerpc/platforms/book3s/vas-api.c
> @@ -10,6 +10,9 @@
>  #include <linux/fs.h>
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
> +#include <linux/kthread.h>
> +#include <linux/sched/signal.h>
> +#include <linux/mmu_context.h>
>  #include <linux/io.h>
>  #include <asm/vas.h>
>  #include <uapi/asm/vas-api.h>
> @@ -94,6 +97,170 @@ int get_vas_user_win_ref(struct vas_user_win_ref *tas=
k_ref)
>  	return 0;
>  }
> =20
> +/*
> + * Successful return must release the task reference with
> + * put_task_struct
> + */
> +static bool ref_get_pid_and_task(struct vas_user_win_ref *task_ref,
> +			  struct task_struct **tskp, struct pid **pidp)
> +{
> +	struct task_struct *tsk;
> +	struct pid *pid;
> +
> +	pid =3D task_ref->pid;
> +	tsk =3D get_pid_task(pid, PIDTYPE_PID);
> +	if (!tsk) {
> +		pid =3D task_ref->tgid;
> +		tsk =3D get_pid_task(pid, PIDTYPE_PID);
> +		/*
> +		 * Parent thread (tgid) will be closing window when it
> +		 * exits. So should not get here.
> +		 */
> +		if (WARN_ON_ONCE(!tsk))
> +			return false;
> +	}
> +
> +	/* Return if the task is exiting. */
> +	if (tsk->flags & PF_EXITING) {
> +		put_task_struct(tsk);
> +		return false;
> +	}
> +
> +	*tskp =3D tsk;
> +	*pidp =3D pid;
> +
> +	return true;
> +}

Thanks for making this change.

I think that's good to factor all these out and put them together.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> +
> +/*
> + * Update the CSB to indicate a translation error.
> + *
> + * User space will be polling on CSB after the request is issued.
> + * If NX can handle the request without any issues, it updates CSB.
> + * Whereas if NX encounters page fault, the kernel will handle the
> + * fault and update CSB with translation error.
> + *
> + * If we are unable to update the CSB means copy_to_user failed due to
> + * invalid csb_addr, send a signal to the process.
> + */
> +void vas_update_csb(struct coprocessor_request_block *crb,
> +		    struct vas_user_win_ref *task_ref)
> +{
> +	struct coprocessor_status_block csb;
> +	struct kernel_siginfo info;
> +	struct task_struct *tsk;
> +	void __user *csb_addr;
> +	struct pid *pid;
> +	int rc;
> +
> +	/*
> +	 * NX user space windows can not be opened for task->mm=3DNULL
> +	 * and faults will not be generated for kernel requests.
> +	 */
> +	if (WARN_ON_ONCE(!task_ref->mm))
> +		return;
> +
> +	csb_addr =3D (void __user *)be64_to_cpu(crb->csb_addr);
> +
> +	memset(&csb, 0, sizeof(csb));
> +	csb.cc =3D CSB_CC_FAULT_ADDRESS;
> +	csb.ce =3D CSB_CE_TERMINATION;
> +	csb.cs =3D 0;
> +	csb.count =3D 0;
> +
> +	/*
> +	 * NX operates and returns in BE format as defined CRB struct.
> +	 * So saves fault_storage_addr in BE as NX pastes in FIFO and
> +	 * expects user space to convert to CPU format.
> +	 */
> +	csb.address =3D crb->stamp.nx.fault_storage_addr;
> +	csb.flags =3D 0;
> +
> +	/*
> +	 * Process closes send window after all pending NX requests are
> +	 * completed. In multi-thread applications, a child thread can
> +	 * open a window and can exit without closing it. May be some
> +	 * requests are pending or this window can be used by other
> +	 * threads later. We should handle faults if NX encounters
> +	 * pages faults on these requests. Update CSB with translation
> +	 * error and fault address. If csb_addr passed by user space is
> +	 * invalid, send SEGV signal to pid saved in window. If the
> +	 * child thread is not running, send the signal to tgid.
> +	 * Parent thread (tgid) will close this window upon its exit.
> +	 *
> +	 * pid and mm references are taken when window is opened by
> +	 * process (pid). So tgid is used only when child thread opens
> +	 * a window and exits without closing it.
> +	 */
> +
> +	if (!ref_get_pid_and_task(task_ref, &tsk, &pid))
> +		return;
> +
> +	kthread_use_mm(task_ref->mm);
> +	rc =3D copy_to_user(csb_addr, &csb, sizeof(csb));
> +	/*
> +	 * User space polls on csb.flags (first byte). So add barrier
> +	 * then copy first byte with csb flags update.
> +	 */
> +	if (!rc) {
> +		csb.flags =3D CSB_V;
> +		/* Make sure update to csb.flags is visible now */
> +		smp_mb();
> +		rc =3D copy_to_user(csb_addr, &csb, sizeof(u8));
> +	}
> +	kthread_unuse_mm(task_ref->mm);
> +	put_task_struct(tsk);
> +
> +	/* Success */
> +	if (!rc)
> +		return;
> +
> +
> +	pr_debug("Invalid CSB address 0x%p signalling pid(%d)\n",
> +			csb_addr, pid_vnr(pid));
> +
> +	clear_siginfo(&info);
> +	info.si_signo =3D SIGSEGV;
> +	info.si_errno =3D EFAULT;
> +	info.si_code =3D SEGV_MAPERR;
> +	info.si_addr =3D csb_addr;
> +	/*
> +	 * process will be polling on csb.flags after request is sent to
> +	 * NX. So generally CSB update should not fail except when an
> +	 * application passes invalid csb_addr. So an error message will
> +	 * be displayed and leave it to user space whether to ignore or
> +	 * handle this signal.
> +	 */
> +	rcu_read_lock();
> +	rc =3D kill_pid_info(SIGSEGV, &info, pid);
> +	rcu_read_unlock();
> +
> +	pr_devel("%s(): pid %d kill_proc_info() rc %d\n", __func__,
> +			pid_vnr(pid), rc);
> +}
> +
> +void vas_dump_crb(struct coprocessor_request_block *crb)
> +{
> +	struct data_descriptor_entry *dde;
> +	struct nx_fault_stamp *nx;
> +
> +	dde =3D &crb->source;
> +	pr_devel("SrcDDE: addr 0x%llx, len %d, count %d, idx %d, flags %d\n",
> +		be64_to_cpu(dde->address), be32_to_cpu(dde->length),
> +		dde->count, dde->index, dde->flags);
> +
> +	dde =3D &crb->target;
> +	pr_devel("TgtDDE: addr 0x%llx, len %d, count %d, idx %d, flags %d\n",
> +		be64_to_cpu(dde->address), be32_to_cpu(dde->length),
> +		dde->count, dde->index, dde->flags);
> +
> +	nx =3D &crb->stamp.nx;
> +	pr_devel("NX Stamp: PSWID 0x%x, FSA 0x%llx, flags 0x%x, FS 0x%x\n",
> +		be32_to_cpu(nx->pswid),
> +		be64_to_cpu(crb->stamp.nx.fault_storage_addr),
> +		nx->flags, nx->fault_status);
> +}
> +
>  static int coproc_open(struct inode *inode, struct file *fp)
>  {
>  	struct coproc_instance *cp_inst;
> diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/pl=
atforms/powernv/vas-fault.c
> index ac3a71ec3bd5..2729ac541fb3 100644
> --- a/arch/powerpc/platforms/powernv/vas-fault.c
> +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> @@ -26,150 +26,6 @@
>   */
>  #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
> =20
> -static void dump_crb(struct coprocessor_request_block *crb)
> -{
> -	struct data_descriptor_entry *dde;
> -	struct nx_fault_stamp *nx;
> -
> -	dde =3D &crb->source;
> -	pr_devel("SrcDDE: addr 0x%llx, len %d, count %d, idx %d, flags %d\n",
> -		be64_to_cpu(dde->address), be32_to_cpu(dde->length),
> -		dde->count, dde->index, dde->flags);
> -
> -	dde =3D &crb->target;
> -	pr_devel("TgtDDE: addr 0x%llx, len %d, count %d, idx %d, flags %d\n",
> -		be64_to_cpu(dde->address), be32_to_cpu(dde->length),
> -		dde->count, dde->index, dde->flags);
> -
> -	nx =3D &crb->stamp.nx;
> -	pr_devel("NX Stamp: PSWID 0x%x, FSA 0x%llx, flags 0x%x, FS 0x%x\n",
> -		be32_to_cpu(nx->pswid),
> -		be64_to_cpu(crb->stamp.nx.fault_storage_addr),
> -		nx->flags, nx->fault_status);
> -}
> -
> -/*
> - * Update the CSB to indicate a translation error.
> - *
> - * User space will be polling on CSB after the request is issued.
> - * If NX can handle the request without any issues, it updates CSB.
> - * Whereas if NX encounters page fault, the kernel will handle the
> - * fault and update CSB with translation error.
> - *
> - * If we are unable to update the CSB means copy_to_user failed due to
> - * invalid csb_addr, send a signal to the process.
> - */
> -static void update_csb(struct vas_window *window,
> -			struct coprocessor_request_block *crb)
> -{
> -	struct coprocessor_status_block csb;
> -	struct kernel_siginfo info;
> -	struct task_struct *tsk;
> -	void __user *csb_addr;
> -	struct pid *pid;
> -	int rc;
> -
> -	/*
> -	 * NX user space windows can not be opened for task->mm=3DNULL
> -	 * and faults will not be generated for kernel requests.
> -	 */
> -	if (WARN_ON_ONCE(!window->task_ref.mm || !window->user_win))
> -		return;
> -
> -	csb_addr =3D (void __user *)be64_to_cpu(crb->csb_addr);
> -
> -	memset(&csb, 0, sizeof(csb));
> -	csb.cc =3D CSB_CC_FAULT_ADDRESS;
> -	csb.ce =3D CSB_CE_TERMINATION;
> -	csb.cs =3D 0;
> -	csb.count =3D 0;
> -
> -	/*
> -	 * NX operates and returns in BE format as defined CRB struct.
> -	 * So saves fault_storage_addr in BE as NX pastes in FIFO and
> -	 * expects user space to convert to CPU format.
> -	 */
> -	csb.address =3D crb->stamp.nx.fault_storage_addr;
> -	csb.flags =3D 0;
> -
> -	pid =3D window->task_ref.pid;
> -	tsk =3D get_pid_task(pid, PIDTYPE_PID);
> -	/*
> -	 * Process closes send window after all pending NX requests are
> -	 * completed. In multi-thread applications, a child thread can
> -	 * open a window and can exit without closing it. May be some
> -	 * requests are pending or this window can be used by other
> -	 * threads later. We should handle faults if NX encounters
> -	 * pages faults on these requests. Update CSB with translation
> -	 * error and fault address. If csb_addr passed by user space is
> -	 * invalid, send SEGV signal to pid saved in window. If the
> -	 * child thread is not running, send the signal to tgid.
> -	 * Parent thread (tgid) will close this window upon its exit.
> -	 *
> -	 * pid and mm references are taken when window is opened by
> -	 * process (pid). So tgid is used only when child thread opens
> -	 * a window and exits without closing it.
> -	 */
> -	if (!tsk) {
> -		pid =3D window->task_ref.tgid;
> -		tsk =3D get_pid_task(pid, PIDTYPE_PID);
> -		/*
> -		 * Parent thread (tgid) will be closing window when it
> -		 * exits. So should not get here.
> -		 */
> -		if (WARN_ON_ONCE(!tsk))
> -			return;
> -	}
> -
> -	/* Return if the task is exiting. */
> -	if (tsk->flags & PF_EXITING) {
> -		put_task_struct(tsk);
> -		return;
> -	}
> -
> -	kthread_use_mm(window->task_ref.mm);
> -	rc =3D copy_to_user(csb_addr, &csb, sizeof(csb));
> -	/*
> -	 * User space polls on csb.flags (first byte). So add barrier
> -	 * then copy first byte with csb flags update.
> -	 */
> -	if (!rc) {
> -		csb.flags =3D CSB_V;
> -		/* Make sure update to csb.flags is visible now */
> -		smp_mb();
> -		rc =3D copy_to_user(csb_addr, &csb, sizeof(u8));
> -	}
> -	kthread_unuse_mm(window->task_ref.mm);
> -	put_task_struct(tsk);
> -
> -	/* Success */
> -	if (!rc)
> -		return;
> -
> -	pr_debug("Invalid CSB address 0x%p signalling pid(%d)\n",
> -			csb_addr, pid_vnr(pid));
> -
> -	clear_siginfo(&info);
> -	info.si_signo =3D SIGSEGV;
> -	info.si_errno =3D EFAULT;
> -	info.si_code =3D SEGV_MAPERR;
> -	info.si_addr =3D csb_addr;
> -
> -	/*
> -	 * process will be polling on csb.flags after request is sent to
> -	 * NX. So generally CSB update should not fail except when an
> -	 * application passes invalid csb_addr. So an error message will
> -	 * be displayed and leave it to user space whether to ignore or
> -	 * handle this signal.
> -	 */
> -	rcu_read_lock();
> -	rc =3D kill_pid_info(SIGSEGV, &info, pid);
> -	rcu_read_unlock();
> -
> -	pr_devel("%s(): pid %d kill_proc_info() rc %d\n", __func__,
> -			pid_vnr(pid), rc);
> -}
> -
>  static void dump_fifo(struct vas_instance *vinst, void *entry)
>  {
>  	unsigned long *end =3D vinst->fault_fifo + vinst->fault_fifo_size;
> @@ -272,7 +128,7 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
>  				vinst->vas_id, vinst->fault_fifo, fifo,
>  				vinst->fault_crbs);
> =20
> -		dump_crb(crb);
> +		vas_dump_crb(crb);
>  		window =3D vas_pswid_to_window(vinst,
>  				be32_to_cpu(crb->stamp.nx.pswid));
> =20
> @@ -293,7 +149,14 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
> =20
>  			WARN_ON_ONCE(1);
>  		} else {
> -			update_csb(window, crb);
> +			/*
> +			 * NX sees faults only with user space windows.
> +			 */
> +			if (window->user_win)
> +				vas_update_csb(crb, &window->task_ref);
> +			else
> +				WARN_ON_ONCE(!window->user_win);
> +
>  			/*
>  			 * Return credit for send window after processing
>  			 * fault CRB.
> --=20
> 2.18.2
>=20
>=20
>=20
