Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D82118ED71
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 01:13:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48lvwr2slZzDql8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 11:13:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=b/e3xVmx; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48lvsj0JTTzDqhN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 11:10:32 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id t24so6250262pgj.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 17:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=oMEMfvaE0shRK6FYeymWY1tEzr9chxg5k6hWlrZehHo=;
 b=b/e3xVmxStg1CgmVb79qURv2kZYJo70FBIdXlquaYZMeMSNrR6sL5XqQ3RAc03InyJ
 JHArAil5sT/yvC1voPun8Ma0ktqK/pmaZYfKdxHHz38zoAOpqhjhr7ikboMf43wTxcL3
 WxEjPeFgHahyiNtp8fqwyKgXwYqrXKY4dHNFcPFKnkdi1A9O4hQ1HiMUWcyguzsmpKko
 wTkyrpDpa33XqZyKo0MJQpEFRPn/gkSIAuVclC4U4bO+i6A3Zj8Z1a3eqoVGtE+oYlQr
 eMEEKgb7ve3+TEepYtz/5kPdjIfAS5XvrqhCQTmjqYUwA238XN9VnB8mjR2kYxV5eMNd
 wAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=oMEMfvaE0shRK6FYeymWY1tEzr9chxg5k6hWlrZehHo=;
 b=H6NCyjMrsKpMGBGir+7hSjEuGVyVYZJ7dZ7Pq/Ir6eVa9JFbsqTbEzsCT0kvMMbVE3
 H2HvGUsjI+eIpC27Jvmijxz2bfL90tdLV2UmpR5FulMLb2+C/wn7s6zedbTqSOYetqfT
 np2Scd+/qbC6r0imaSvNdMgOq0czFursGm6nHkWcRJwW6DctNo4tGAOPYemXzTyZMBYu
 TCi1yn6RydeOCMMxGG83vwkPHJvj4sVH3D2IZTyc40bu1NDW/rN0VckZVVbmK4Kxctcn
 dCx2lnUZ58KYu9JvODr+fsmsUjQMt3Z7VS68QfFE4pEe7W51sBDKautB5xju+e4h8Y0H
 8ohA==
X-Gm-Message-State: ANhLgQ1hp+13aKA1aBVpybQsIycLjpJ8f91eWu2IySyX1h7syI0Fj6rk
 2DEwAkk2DAeMdfoyNTvx+lI=
X-Google-Smtp-Source: ADFU+vsr9Ed76dyHSBETH3NZd5ty1Q3yxlETawjlfn4OQxI6wxq0lQZu0q3o7Dxxfs2J1CEwfOWIKQ==
X-Received: by 2002:aa7:947d:: with SMTP id t29mr20677194pfq.184.1584922230229; 
 Sun, 22 Mar 2020 17:10:30 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id e204sm11558546pfh.199.2020.03.22.17.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 17:10:29 -0700 (PDT)
Date: Mon, 23 Mar 2020 10:06:59 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH V7 09/14] powerpc/vas: Update CSB and notify process for
 fault CRBs
To: Haren Myneni <haren@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <1583525239.9256.5.camel@hbabu-laptop>
 <1583525805.9256.14.camel@hbabu-laptop> <877dzj35z8.fsf@mpe.ellerman.id.au>
 <1584473263.9256.14791.camel@hbabu-laptop>
In-Reply-To: <1584473263.9256.14791.camel@hbabu-laptop>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584920780.45onmviqrl.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: mikey@neuling.org, ajd@linux.ibm.com, hch@infradead.org, oohall@gmail.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 herbert@gondor.apana.org.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni's on March 18, 2020 5:27 am:
> On Tue, 2020-03-17 at 16:28 +1100, Michael Ellerman wrote:
>> Haren Myneni <haren@linux.ibm.com> writes:
>> > For each fault CRB, update fault address in CRB (fault_storage_addr)
>> > and translation error status in CSB so that user space can touch the
>> > fault address and resend the request. If the user space passed invalid
>> > CSB address send signal to process with SIGSEGV.
>> >
>> > Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
>> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
>> > ---
>> >  arch/powerpc/platforms/powernv/vas-fault.c | 114 ++++++++++++++++++++=
+++++++++
>> >  1 file changed, 114 insertions(+)
>> >
>> > diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc=
/platforms/powernv/vas-fault.c
>> > index 1c6d5cc..751ce48 100644
>> > --- a/arch/powerpc/platforms/powernv/vas-fault.c
>> > +++ b/arch/powerpc/platforms/powernv/vas-fault.c
>> > @@ -11,6 +11,7 @@
>> >  #include <linux/slab.h>
>> >  #include <linux/uaccess.h>
>> >  #include <linux/kthread.h>
>> > +#include <linux/sched/signal.h>
>> >  #include <linux/mmu_context.h>
>> >  #include <asm/icswx.h>
>> > =20
>> > @@ -26,6 +27,118 @@
>> >  #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
>> > =20
>> >  /*
>> > + * Update the CSB to indicate a translation error.
>> > + *
>> > + * If we are unable to update the CSB means copy_to_user failed due t=
o
>> > + * invalid csb_addr, send a signal to the process.
>> > + *
>> > + * Remaining settings in the CSB are based on wait_for_csb() of
>> > + * NX-GZIP.
>> > + */
>> > +static void update_csb(struct vas_window *window,
>> > +			struct coprocessor_request_block *crb)
>> > +{
>> > +	int rc;
>> > +	struct pid *pid;
>> > +	void __user *csb_addr;
>> > +	struct task_struct *tsk;
>> > +	struct kernel_siginfo info;
>> > +	struct coprocessor_status_block csb;
>>=20
>> csb is on the stack, and later copied to user, which is a risk for
>> creating an infoleak.
>>=20
>> Also please use reverse Christmas tree layout for your variables.
>>=20
>> > +
>> > +	/*
>> > +	 * NX user space windows can not be opened for task->mm=3DNULL
>> > +	 * and faults will not be generated for kernel requests.
>> > +	 */
>> > +	if (!window->mm || !window->user_win)
>> > +		return;
>>=20
>> If that's a should-never-happen condition then should it do a
>> WARN_ON_ONCE() rather than silently returning?
>=20
> Will add WARN_ON
>=20
>>=20
>> > +	csb_addr =3D (void __user *)be64_to_cpu(crb->csb_addr);
>> > +
>> > +	csb.cc =3D CSB_CC_TRANSLATION;
>> > +	csb.ce =3D CSB_CE_TERMINATION;
>> > +	csb.cs =3D 0;
>> > +	csb.count =3D 0;
>> > +
>> > +	/*
>> > +	 * NX operates and returns in BE format as defined CRB struct.
>> > +	 * So return fault_storage_addr in BE as NX pastes in FIFO and
>> > +	 * expects user space to convert to CPU format.
>> > +	 */
>> > +	csb.address =3D crb->stamp.nx.fault_storage_addr;
>> > +	csb.flags =3D 0;
>>=20
>> I'm pretty sure this has initialised all the fields of csb.
>>=20
>> But, I'd still be much happier if you zeroed the whole struct to begin
>> with, that way we know for sure we can't leak any uninitialised bytes to
>> userspace. It's only 16 bytes so it shouldn't add any noticeable
>> overhead.
> Sure, will initialize csb
>>=20
>> > +
>> > +	pid =3D window->pid;
>> > +	tsk =3D get_pid_task(pid, PIDTYPE_PID);
>> > +	/*
>> > +	 * Send window will be closed after processing all NX requests
>> > +	 * and process exits after closing all windows. In multi-thread
>> > +	 * applications, thread may not exists, but does not close FD
>> > +	 * (means send window) upon exit. Parent thread (tgid) can use
>> > +	 * and close the window later.
>> > +	 * pid and mm references are taken when window is opened by
>> > +	 * process (pid). So tgid is used only when child thread opens
>> > +	 * a window and exits without closing it in multithread tasks.
>> > +	 */
>> > +	if (!tsk) {
>> > +		pid =3D window->tgid;
>> > +		tsk =3D get_pid_task(pid, PIDTYPE_PID);
>> > +		/*
>> > +		 * Parent thread will be closing window during its exit.
>> > +		 * So should not get here.
>> > +		 */
>> > +		if (!tsk)
>> > +			return;
>>=20
>> Similar question on WARN_ON_ONCE()
> Yes, we can add WARN_ON
>>=20
>> > +	}
>> > +
>> > +	/* Return if the task is exiting. */
>>=20
>> Why? Just because it's no use? It's racy isn't it, so it can't be for
>> correctness?
> Yes process is exiting and no need to update CSB. We release the
> task->usage refcount after copy_to_user().
>=20
>>=20
>> > +	if (tsk->flags & PF_EXITING) {
>> > +		put_task_struct(tsk);
>> > +		return;
>> > +	}
>> > +
>> > +	use_mm(window->mm);
>>=20
>> There's no check that csb_addr is actually pointing into userspace, but
>> copy_to_user() does it for you.
>>=20
>> > +	rc =3D copy_to_user(csb_addr, &csb, sizeof(csb));
>> > +	/*
>> > +	 * User space polls on csb.flags (first byte). So add barrier
>> > +	 * then copy first byte with csb flags update.
>> > +	 */
>> > +	smp_mb();
>>=20
>> You only need to order the stores above vs the store below to csb.flags.
>> So you should only need an smp_wmb() here.
> Sure, will add
> if (!rc) {
> 	csb.flags =3D CSB_V;
> 	smp_mb();
> 	rc =3D copy_to_user(csb_addr, &csb, sizeof(u8));
> }
>=20
>>=20
>> > +	if (!rc) {
>> > +		csb.flags =3D CSB_V;
>> > +		rc =3D copy_to_user(csb_addr, &csb, sizeof(u8));
>> > +	}
>> > +	unuse_mm(window->mm);
>> > +	put_task_struct(tsk);
>> > +
>> > +	/* Success */
>> > +	if (!rc)
>> > +		return;
>> > +
>> > +	pr_debug("Invalid CSB address 0x%p signalling pid(%d)\n",
>> > +			csb_addr, pid_vnr(pid));
>> > +
>> > +	clear_siginfo(&info);
>> > +	info.si_signo =3D SIGSEGV;
>> > +	info.si_errno =3D EFAULT;
>> > +	info.si_code =3D SEGV_MAPERR;
>> > +	info.si_addr =3D csb_addr;
>> > +
>> > +	/*
>> > +	 * process will be polling on csb.flags after request is sent to
>> > +	 * NX. So generally CSB update should not fail except when an
>> > +	 * application does not follow the process properly. So an error
>> > +	 * message will be displayed and leave it to user space whether
>> > +	 * to ignore or handle this signal.
>> > +	 */

The code would read a bit better if this comment goes at the start of
this error handling process it describes (before the error message).

And I feel a bit hypocritical complaining about readability, but it=20
could possibly do with some work.

	/*
	 * The application should have provided a valid mapping for the=20
	 * csb, and not unmap it before the csb.flags update, so the=20
	 * copy_to_user should not fail.
	 *
	 * If the application fails to follow this protocol, log a kernel=20
	 * error and send a SEGV to the pid. This signal may be ignored,
	 * so can't use force_sig_fault_to_task()
	 */

Something like tthat?

>> > +	rcu_read_lock();
>> > +	rc =3D kill_pid_info(SIGSEGV, &info, pid);
>> > +	rcu_read_unlock();

ipc/mqueue.c says kill_pid_info doesn't need rcu_read_lock(). AFAIKS
it's held around kill_pid_info in kernel/signal.c for the find_vpid().

Thanks,
Nick

>>=20
>> Shouldn't this be using force_sig_fault_to_task() or another helper,
>> rather than open-coding?
>=20
> Applications or nxz library can ignore this signal based on si_addr or
> take action like resend new request with valid csb_addr. Hence I did not
> use force_sig_info_to_task().

>=20
>>=20
>> > +
>> > +	pr_devel("%s(): pid %d kill_proc_info() rc %d\n", __func__,
>> > +			pid_vnr(pid), rc);
>> > +}
>> > +
>> > +/*
>> >   * Process valid CRBs in fault FIFO.
>> >   */
>> >  irqreturn_t vas_fault_thread_fn(int irq, void *data)
>> > @@ -111,6 +224,7 @@ irqreturn_t vas_fault_thread_fn(int irq, void *dat=
a)
>> >  			return IRQ_HANDLED;
>> >  		}
>> > =20
>> > +		update_csb(window, crb);
>> >  	} while (true);
>> >  }
>> > =20
>> > --=20
>> > 1.8.3.1
>>=20
>> cheers
>=20
>=20
>=20
=
