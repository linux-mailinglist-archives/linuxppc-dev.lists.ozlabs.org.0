Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 690CF15522B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 06:47:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DPTD4mm8zDqjv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 16:47:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DPRt0sXSzDqSj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 16:46:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=O1G3PeVW; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 48DPRs1y5lz9sRl;
 Fri,  7 Feb 2020 16:46:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1581054377;
 bh=Yc2O3+3NeNqlctn2qYN4WYsyidmXbM6n8Nf5VFIKs1U=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=O1G3PeVW3I0+itKczb/sTY8oOQeeWSyHj5ipiR1UMrVCj6NVCPgqtx+1d04KbKqwz
 0UzshtKFYJY6MEE/dkOnyUnQ0xv0oCxKZo/vhykBW8GtbyS9PXm6SCxOk75GLSAH9A
 tL6RTQ3rkAi3o2XuaW4rivIHuZJJ+t3HlSzcKuX19B4fGM2X93hs3/z/dBomHymcir
 gSe8Qi6eNTQLI7jmAFyXidlbS+8mGRQxyGYlWvba6pmSgR1jWPpa02I202ZzBCjRh4
 6aKZStWj+vuUn8A2F6XFgPRct/N+BnxH9bPqHCZOqJhDAQrAyL2L6C13VNM6L8rapw
 UN0jxE7CJ9HXQ==
Received: by neuling.org (Postfix, from userid 1000)
 id 145472C019C; Fri,  7 Feb 2020 16:46:17 +1100 (AEDT)
Message-ID: <67467b52ddd8fcd6ccd8390f9b1f0ed7c09bb3bf.camel@neuling.org>
Subject: Re: [PATCH V5 09/14] powerpc/vas: Update CSB and notify process for
 fault CRBs
From: Michael Neuling <mikey@neuling.org>
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au
Date: Fri, 07 Feb 2020 16:46:16 +1100
In-Reply-To: <1579681061.26081.48.camel@hbabu-laptop>
References: <1579679802.26081.6.camel@hbabu-laptop>
 <1579681061.26081.48.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
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
Cc: herbert@gondor.apana.org.au, npiggin@gmail.com, hch@infradead.org,
 oohall@gmail.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-01-22 at 00:17 -0800, Haren Myneni wrote:
> For each fault CRB, update fault address in CRB (fault_storage_addr)
> and translation error status in CSB so that user space can touch the
> fault address and resend the request. If the user space passed invalid
> CSB address send signal to process with SIGSEGV.
>=20
> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/vas-fault.c | 116
> +++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>=20
> diff --git a/arch/powerpc/platforms/powernv/vas-fault.c
> b/arch/powerpc/platforms/powernv/vas-fault.c
> index 5c2cada..2cfab0c 100644
> --- a/arch/powerpc/platforms/powernv/vas-fault.c
> +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> @@ -11,6 +11,7 @@
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
>  #include <linux/kthread.h>
> +#include <linux/sched/signal.h>
>  #include <linux/mmu_context.h>
>  #include <asm/icswx.h>
> =20
> @@ -26,6 +27,120 @@
>  #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
> =20
>  /*
> + * Update the CSB to indicate a translation error.
> + *
> + * If the fault is in the CSB address itself or if we are unable to
> + * update the CSB, send a signal to the process, because we have no
> + * other way of notifying the user process.
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
> +
> +	/*
> +	 * NX user space windows can not be opened for task->mm=3DNULL
> +	 * and faults will not be generated for kernel requests.
> +	 */
> +	if (!window->mm || !window->user_win)
> +		return;
> +
> +	csb_addr =3D (void *)be64_to_cpu(crb->csb_addr);
> +
> +	csb.cc =3D CSB_CC_TRANSLATION;
> +	csb.ce =3D CSB_CE_TERMINATION;
> +	csb.cs =3D 0;
> +	csb.count =3D 0;
> +
> +	/*
> +	 * Returns the fault address in CPU format since it is passed with
> +	 * signal. But if the user space expects BE format, need changes.
> +	 * i.e either kernel (here) or user should convert to CPU format.
> +	 * Not both!
> +	 */
> +	csb.address =3D be64_to_cpu(crb->stamp.nx.fault_storage_addr);

This looks wrong and I don't understand the comment. You need to convert th=
is
back to be64 to write it to csb.address. ie.

  csb.address =3D cpu_to_be64(be64_to_cpu(crb->stamp.nx.fault_storage_addr)=
);

Which I think you can just avoid the endian conversion all together.

> +	csb.flags =3D 0;
> +
> +	pid =3D window->pid;
> +	tsk =3D get_pid_task(pid, PIDTYPE_PID);
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
> +		pid =3D window->tgid;
> +		tsk =3D get_pid_task(pid, PIDTYPE_PID);
> +		/*
> +		 * Parent thread will be closing window during its exit.
> +		 * So should not get here.
> +		 */
> +		if (!tsk)
> +			return;
> +	}
> +
> +	/* Return if the task is exiting. */
> +	if (tsk->flags & PF_EXITING) {
> +		put_task_struct(tsk);
> +		return;
> +	}
> +
> +	use_mm(window->mm);
> +	rc =3D copy_to_user(csb_addr, &csb, sizeof(csb));
> +	/*
> +	 * User space polls on csb.flags (first byte). So add barrier
> +	 * then copy first byte with csb flags update.
> +	 */
> +	smp_mb();
> +	if (!rc) {
> +		csb.flags =3D CSB_V;
> +		rc =3D copy_to_user(csb_addr, &csb, sizeof(u8));
> +	}
> +	unuse_mm(window->mm);
> +	put_task_struct(tsk);
> +
> +	/* Success */
> +	if (!rc)
> +		return;
> +
> +	pr_err("Invalid CSB address 0x%p signalling pid(%d)\n",
> +			csb_addr, pid_vnr(pid));

This is a userspace error, not a kernel error. This should not be a pr_err(=
).

Userspace could spam the console with this.

> +
> +	clear_siginfo(&info);
> +	info.si_signo =3D SIGSEGV;
> +	info.si_errno =3D EFAULT;
> +	info.si_code =3D SEGV_MAPERR;
> +	info.si_addr =3D csb_addr;
> +
> +	/*
> +	 * process will be polling on csb.flags after request is sent to
> +	 * NX. So generally CSB update should not fail except when an
> +	 * application does not follow the process properly. So an error
> +	 * message will be displayed and leave it to user space whether
> +	 * to ignore or handle this signal.
> +	 */
> +	rcu_read_lock();
> +	rc =3D kill_pid_info(SIGSEGV, &info, pid);
> +	rcu_read_unlock();

why the rcu_read_un/lock() here?

> +
> +	pr_devel("%s(): pid %d kill_proc_info() rc %d\n", __func__,
> +			pid_vnr(pid), rc);
> +}
> +
> +/*
>   * Process CRBs that we receive on the fault window.
>   */
>  irqreturn_t vas_fault_handler(int irq, void *data)
> @@ -104,6 +219,7 @@ irqreturn_t vas_fault_handler(int irq, void *data)
>  			return IRQ_HANDLED;
>  		}
> =20
> +		update_csb(window, crb);
>  	} while (true);
> =20
>  	return IRQ_HANDLED;

