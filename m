Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A55188E03
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 20:30:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hjtd5z7KzDqdw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 06:30:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hjrQ1ztwzDqRr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 06:28:21 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02HJKUIU030551; Tue, 17 Mar 2020 15:28:07 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yrue3ju9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Mar 2020 15:28:07 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02HJKWL7030852;
 Tue, 17 Mar 2020 15:28:06 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yrue3ju93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Mar 2020 15:28:06 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02HJ9rQD003335;
 Tue, 17 Mar 2020 19:28:05 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 2yrpw6hfur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Mar 2020 19:28:05 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02HJS4Uu47251722
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 19:28:04 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1FD1B206A;
 Tue, 17 Mar 2020 19:28:04 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01B97B2064;
 Tue, 17 Mar 2020 19:28:03 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 17 Mar 2020 19:28:03 +0000 (GMT)
Subject: Re: [PATCH V7 09/14] powerpc/vas: Update CSB and notify process
 for fault CRBs
From: Haren Myneni <haren@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <877dzj35z8.fsf@mpe.ellerman.id.au>
References: <1583525239.9256.5.camel@hbabu-laptop>
 <1583525805.9256.14.camel@hbabu-laptop> <877dzj35z8.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 17 Mar 2020 12:27:43 -0700
Message-ID: <1584473263.9256.14791.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-17_08:2020-03-17,
 2020-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003170071
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

On Tue, 2020-03-17 at 16:28 +1100, Michael Ellerman wrote:
> Haren Myneni <haren@linux.ibm.com> writes:
> > For each fault CRB, update fault address in CRB (fault_storage_addr)
> > and translation error status in CSB so that user space can touch the
> > fault address and resend the request. If the user space passed invalid
> > CSB address send signal to process with SIGSEGV.
> >
> > Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/powernv/vas-fault.c | 114 +++++++++++++++++++++++++++++
> >  1 file changed, 114 insertions(+)
> >
> > diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
> > index 1c6d5cc..751ce48 100644
> > --- a/arch/powerpc/platforms/powernv/vas-fault.c
> > +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/uaccess.h>
> >  #include <linux/kthread.h>
> > +#include <linux/sched/signal.h>
> >  #include <linux/mmu_context.h>
> >  #include <asm/icswx.h>
> >  
> > @@ -26,6 +27,118 @@
> >  #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
> >  
> >  /*
> > + * Update the CSB to indicate a translation error.
> > + *
> > + * If we are unable to update the CSB means copy_to_user failed due to
> > + * invalid csb_addr, send a signal to the process.
> > + *
> > + * Remaining settings in the CSB are based on wait_for_csb() of
> > + * NX-GZIP.
> > + */
> > +static void update_csb(struct vas_window *window,
> > +			struct coprocessor_request_block *crb)
> > +{
> > +	int rc;
> > +	struct pid *pid;
> > +	void __user *csb_addr;
> > +	struct task_struct *tsk;
> > +	struct kernel_siginfo info;
> > +	struct coprocessor_status_block csb;
> 
> csb is on the stack, and later copied to user, which is a risk for
> creating an infoleak.
> 
> Also please use reverse Christmas tree layout for your variables.
> 
> > +
> > +	/*
> > +	 * NX user space windows can not be opened for task->mm=NULL
> > +	 * and faults will not be generated for kernel requests.
> > +	 */
> > +	if (!window->mm || !window->user_win)
> > +		return;
> 
> If that's a should-never-happen condition then should it do a
> WARN_ON_ONCE() rather than silently returning?

Will add WARN_ON

> 
> > +	csb_addr = (void __user *)be64_to_cpu(crb->csb_addr);
> > +
> > +	csb.cc = CSB_CC_TRANSLATION;
> > +	csb.ce = CSB_CE_TERMINATION;
> > +	csb.cs = 0;
> > +	csb.count = 0;
> > +
> > +	/*
> > +	 * NX operates and returns in BE format as defined CRB struct.
> > +	 * So return fault_storage_addr in BE as NX pastes in FIFO and
> > +	 * expects user space to convert to CPU format.
> > +	 */
> > +	csb.address = crb->stamp.nx.fault_storage_addr;
> > +	csb.flags = 0;
> 
> I'm pretty sure this has initialised all the fields of csb.
> 
> But, I'd still be much happier if you zeroed the whole struct to begin
> with, that way we know for sure we can't leak any uninitialised bytes to
> userspace. It's only 16 bytes so it shouldn't add any noticeable
> overhead.
Sure, will initialize csb
> 
> > +
> > +	pid = window->pid;
> > +	tsk = get_pid_task(pid, PIDTYPE_PID);
> > +	/*
> > +	 * Send window will be closed after processing all NX requests
> > +	 * and process exits after closing all windows. In multi-thread
> > +	 * applications, thread may not exists, but does not close FD
> > +	 * (means send window) upon exit. Parent thread (tgid) can use
> > +	 * and close the window later.
> > +	 * pid and mm references are taken when window is opened by
> > +	 * process (pid). So tgid is used only when child thread opens
> > +	 * a window and exits without closing it in multithread tasks.
> > +	 */
> > +	if (!tsk) {
> > +		pid = window->tgid;
> > +		tsk = get_pid_task(pid, PIDTYPE_PID);
> > +		/*
> > +		 * Parent thread will be closing window during its exit.
> > +		 * So should not get here.
> > +		 */
> > +		if (!tsk)
> > +			return;
> 
> Similar question on WARN_ON_ONCE()
Yes, we can add WARN_ON
> 
> > +	}
> > +
> > +	/* Return if the task is exiting. */
> 
> Why? Just because it's no use? It's racy isn't it, so it can't be for
> correctness?
Yes process is exiting and no need to update CSB. We release the
task->usage refcount after copy_to_user().

> 
> > +	if (tsk->flags & PF_EXITING) {
> > +		put_task_struct(tsk);
> > +		return;
> > +	}
> > +
> > +	use_mm(window->mm);
> 
> There's no check that csb_addr is actually pointing into userspace, but
> copy_to_user() does it for you.
> 
> > +	rc = copy_to_user(csb_addr, &csb, sizeof(csb));
> > +	/*
> > +	 * User space polls on csb.flags (first byte). So add barrier
> > +	 * then copy first byte with csb flags update.
> > +	 */
> > +	smp_mb();
> 
> You only need to order the stores above vs the store below to csb.flags.
> So you should only need an smp_wmb() here.
Sure, will add
if (!rc) {
	csb.flags = CSB_V;
	smp_mb();
	rc = copy_to_user(csb_addr, &csb, sizeof(u8));
}

> 
> > +	if (!rc) {
> > +		csb.flags = CSB_V;
> > +		rc = copy_to_user(csb_addr, &csb, sizeof(u8));
> > +	}
> > +	unuse_mm(window->mm);
> > +	put_task_struct(tsk);
> > +
> > +	/* Success */
> > +	if (!rc)
> > +		return;
> > +
> > +	pr_debug("Invalid CSB address 0x%p signalling pid(%d)\n",
> > +			csb_addr, pid_vnr(pid));
> > +
> > +	clear_siginfo(&info);
> > +	info.si_signo = SIGSEGV;
> > +	info.si_errno = EFAULT;
> > +	info.si_code = SEGV_MAPERR;
> > +	info.si_addr = csb_addr;
> > +
> > +	/*
> > +	 * process will be polling on csb.flags after request is sent to
> > +	 * NX. So generally CSB update should not fail except when an
> > +	 * application does not follow the process properly. So an error
> > +	 * message will be displayed and leave it to user space whether
> > +	 * to ignore or handle this signal.
> > +	 */
> > +	rcu_read_lock();
> > +	rc = kill_pid_info(SIGSEGV, &info, pid);
> > +	rcu_read_unlock();
> 
> Shouldn't this be using force_sig_fault_to_task() or another helper,
> rather than open-coding?

Applications or nxz library can ignore this signal based on si_addr or
take action like resend new request with valid csb_addr. Hence I did not
use force_sig_info_to_task().

> 
> > +
> > +	pr_devel("%s(): pid %d kill_proc_info() rc %d\n", __func__,
> > +			pid_vnr(pid), rc);
> > +}
> > +
> > +/*
> >   * Process valid CRBs in fault FIFO.
> >   */
> >  irqreturn_t vas_fault_thread_fn(int irq, void *data)
> > @@ -111,6 +224,7 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
> >  			return IRQ_HANDLED;
> >  		}
> >  
> > +		update_csb(window, crb);
> >  	} while (true);
> >  }
> >  
> > -- 
> > 1.8.3.1
> 
> cheers


