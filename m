Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D357E18793E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 06:30:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hMF26bs9zDqXw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 16:29:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hMCM322bzDqKg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 16:28:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=d91RdLS+; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48hMCJ0k7Nz9sPF;
 Tue, 17 Mar 2020 16:28:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584422909;
 bh=MC7b550T0UEn3drzTQSwKJbnBymjcHLQYxopp0o0TlI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=d91RdLS+w0OBqsSohbMCBFtTXzvt2cYiGdB2907ElTzecbWUSddNYERGfLe3M0IQP
 Ip9ln0Xszw+0h6rQiG9w4uCZaMyKCJvg9HGDcQHq/BIsoOWtX59qACkb8ucJDjZU1y
 CSgRoNwnYMBTpiV3G8JQWOq9kGvxRExzL9x3EOmLen0532vgpuiVGSJe8G92nEl/Rv
 u6f/oHJc0/iFUDnKI/c2FdM85kzixcq7QGUVAWJn9gof8drXkCYMcFtivLYBoCgkXh
 AQjPJOO7yUozoLCAQOxaR11MG2QdGhsfd6zEkqb/ffUuU0Vebi3ZpsAkJZ6b/0bEpz
 02aRl2JAKM9zQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Haren Myneni <haren@linux.ibm.com>
Subject: Re: [PATCH V7 09/14] powerpc/vas: Update CSB and notify process for
 fault CRBs
In-Reply-To: <1583525805.9256.14.camel@hbabu-laptop>
References: <1583525239.9256.5.camel@hbabu-laptop>
 <1583525805.9256.14.camel@hbabu-laptop>
Date: Tue, 17 Mar 2020 16:28:27 +1100
Message-ID: <877dzj35z8.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au, npiggin@gmail.com,
 hch@infradead.org, oohall@gmail.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> For each fault CRB, update fault address in CRB (fault_storage_addr)
> and translation error status in CSB so that user space can touch the
> fault address and resend the request. If the user space passed invalid
> CSB address send signal to process with SIGSEGV.
>
> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/vas-fault.c | 114 +++++++++++++++++++++++++++++
>  1 file changed, 114 insertions(+)
>
> diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
> index 1c6d5cc..751ce48 100644
> --- a/arch/powerpc/platforms/powernv/vas-fault.c
> +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> @@ -11,6 +11,7 @@
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
>  #include <linux/kthread.h>
> +#include <linux/sched/signal.h>
>  #include <linux/mmu_context.h>
>  #include <asm/icswx.h>
>  
> @@ -26,6 +27,118 @@
>  #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
>  
>  /*
> + * Update the CSB to indicate a translation error.
> + *
> + * If we are unable to update the CSB means copy_to_user failed due to
> + * invalid csb_addr, send a signal to the process.
> + *
> + * Remaining settings in the CSB are based on wait_for_csb() of
> + * NX-GZIP.
> + */
> +static void update_csb(struct vas_window *window,
> +			struct coprocessor_request_block *crb)
> +{
> +	int rc;
> +	struct pid *pid;
> +	void __user *csb_addr;
> +	struct task_struct *tsk;
> +	struct kernel_siginfo info;
> +	struct coprocessor_status_block csb;

csb is on the stack, and later copied to user, which is a risk for
creating an infoleak.

Also please use reverse Christmas tree layout for your variables.

> +
> +	/*
> +	 * NX user space windows can not be opened for task->mm=NULL
> +	 * and faults will not be generated for kernel requests.
> +	 */
> +	if (!window->mm || !window->user_win)
> +		return;

If that's a should-never-happen condition then should it do a
WARN_ON_ONCE() rather than silently returning?

> +	csb_addr = (void __user *)be64_to_cpu(crb->csb_addr);
> +
> +	csb.cc = CSB_CC_TRANSLATION;
> +	csb.ce = CSB_CE_TERMINATION;
> +	csb.cs = 0;
> +	csb.count = 0;
> +
> +	/*
> +	 * NX operates and returns in BE format as defined CRB struct.
> +	 * So return fault_storage_addr in BE as NX pastes in FIFO and
> +	 * expects user space to convert to CPU format.
> +	 */
> +	csb.address = crb->stamp.nx.fault_storage_addr;
> +	csb.flags = 0;

I'm pretty sure this has initialised all the fields of csb.

But, I'd still be much happier if you zeroed the whole struct to begin
with, that way we know for sure we can't leak any uninitialised bytes to
userspace. It's only 16 bytes so it shouldn't add any noticeable
overhead.

> +
> +	pid = window->pid;
> +	tsk = get_pid_task(pid, PIDTYPE_PID);
> +	/*
> +	 * Send window will be closed after processing all NX requests
> +	 * and process exits after closing all windows. In multi-thread
> +	 * applications, thread may not exists, but does not close FD
> +	 * (means send window) upon exit. Parent thread (tgid) can use
> +	 * and close the window later.
> +	 * pid and mm references are taken when window is opened by
> +	 * process (pid). So tgid is used only when child thread opens
> +	 * a window and exits without closing it in multithread tasks.
> +	 */
> +	if (!tsk) {
> +		pid = window->tgid;
> +		tsk = get_pid_task(pid, PIDTYPE_PID);
> +		/*
> +		 * Parent thread will be closing window during its exit.
> +		 * So should not get here.
> +		 */
> +		if (!tsk)
> +			return;

Similar question on WARN_ON_ONCE()

> +	}
> +
> +	/* Return if the task is exiting. */

Why? Just because it's no use? It's racy isn't it, so it can't be for
correctness?

> +	if (tsk->flags & PF_EXITING) {
> +		put_task_struct(tsk);
> +		return;
> +	}
> +
> +	use_mm(window->mm);

There's no check that csb_addr is actually pointing into userspace, but
copy_to_user() does it for you.

> +	rc = copy_to_user(csb_addr, &csb, sizeof(csb));
> +	/*
> +	 * User space polls on csb.flags (first byte). So add barrier
> +	 * then copy first byte with csb flags update.
> +	 */
> +	smp_mb();

You only need to order the stores above vs the store below to csb.flags.
So you should only need an smp_wmb() here.

> +	if (!rc) {
> +		csb.flags = CSB_V;
> +		rc = copy_to_user(csb_addr, &csb, sizeof(u8));
> +	}
> +	unuse_mm(window->mm);
> +	put_task_struct(tsk);
> +
> +	/* Success */
> +	if (!rc)
> +		return;
> +
> +	pr_debug("Invalid CSB address 0x%p signalling pid(%d)\n",
> +			csb_addr, pid_vnr(pid));
> +
> +	clear_siginfo(&info);
> +	info.si_signo = SIGSEGV;
> +	info.si_errno = EFAULT;
> +	info.si_code = SEGV_MAPERR;
> +	info.si_addr = csb_addr;
> +
> +	/*
> +	 * process will be polling on csb.flags after request is sent to
> +	 * NX. So generally CSB update should not fail except when an
> +	 * application does not follow the process properly. So an error
> +	 * message will be displayed and leave it to user space whether
> +	 * to ignore or handle this signal.
> +	 */
> +	rcu_read_lock();
> +	rc = kill_pid_info(SIGSEGV, &info, pid);
> +	rcu_read_unlock();

Shouldn't this be using force_sig_fault_to_task() or another helper,
rather than open-coding?

> +
> +	pr_devel("%s(): pid %d kill_proc_info() rc %d\n", __func__,
> +			pid_vnr(pid), rc);
> +}
> +
> +/*
>   * Process valid CRBs in fault FIFO.
>   */
>  irqreturn_t vas_fault_thread_fn(int irq, void *data)
> @@ -111,6 +224,7 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
>  			return IRQ_HANDLED;
>  		}
>  
> +		update_csb(window, crb);
>  	} while (true);
>  }
>  
> -- 
> 1.8.3.1

cheers
