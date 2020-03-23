Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA8618ED8F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 02:09:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48lx9P3kZTzDqb5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 12:09:13 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48lx764hQqzDqbp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 12:07:14 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02N13whW117187; Sun, 22 Mar 2020 21:07:02 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywff4d82m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 22 Mar 2020 21:07:01 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02N14V7Z119077;
 Sun, 22 Mar 2020 21:07:01 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywff4d81n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 22 Mar 2020 21:07:01 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02N16pF6023778;
 Mon, 23 Mar 2020 01:07:00 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 2ywawm4mkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Mar 2020 01:07:00 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02N170ZL35848600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Mar 2020 01:07:00 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F117E112064;
 Mon, 23 Mar 2020 01:06:59 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 229E5112061;
 Mon, 23 Mar 2020 01:06:59 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 23 Mar 2020 01:06:59 +0000 (GMT)
Subject: Re: [PATCH V7 09/14] powerpc/vas: Update CSB and notify process
 for fault CRBs
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <1584920780.45onmviqrl.astroid@bobo.none>
References: <1583525239.9256.5.camel@hbabu-laptop>
 <1583525805.9256.14.camel@hbabu-laptop> <877dzj35z8.fsf@mpe.ellerman.id.au>
 <1584473263.9256.14791.camel@hbabu-laptop>
 <1584920780.45onmviqrl.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 22 Mar 2020 18:06:29 -0700
Message-ID: <1584925589.9256.15314.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-22_08:2020-03-21,
 2020-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003230001
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

On Mon, 2020-03-23 at 10:06 +1000, Nicholas Piggin wrote:
> Haren Myneni's on March 18, 2020 5:27 am:
> > On Tue, 2020-03-17 at 16:28 +1100, Michael Ellerman wrote:
> >> Haren Myneni <haren@linux.ibm.com> writes:
> >> > For each fault CRB, update fault address in CRB (fault_storage_addr)
> >> > and translation error status in CSB so that user space can touch the
> >> > fault address and resend the request. If the user space passed invalid
> >> > CSB address send signal to process with SIGSEGV.
> >> >
> >> > Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> >> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> >> > ---
> >> >  arch/powerpc/platforms/powernv/vas-fault.c | 114 +++++++++++++++++++++++++++++
> >> >  1 file changed, 114 insertions(+)
> >> >
> >> > diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
> >> > index 1c6d5cc..751ce48 100644
> >> > --- a/arch/powerpc/platforms/powernv/vas-fault.c
> >> > +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> >> > @@ -11,6 +11,7 @@
> >> >  #include <linux/slab.h>
> >> >  #include <linux/uaccess.h>
> >> >  #include <linux/kthread.h>
> >> > +#include <linux/sched/signal.h>
> >> >  #include <linux/mmu_context.h>
> >> >  #include <asm/icswx.h>
> >> >  
> >> > @@ -26,6 +27,118 @@
> >> >  #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
> >> >  
> >> >  /*
> >> > + * Update the CSB to indicate a translation error.
> >> > + *
> >> > + * If we are unable to update the CSB means copy_to_user failed due to
> >> > + * invalid csb_addr, send a signal to the process.
> >> > + *
> >> > + * Remaining settings in the CSB are based on wait_for_csb() of
> >> > + * NX-GZIP.
> >> > + */
> >> > +static void update_csb(struct vas_window *window,
> >> > +			struct coprocessor_request_block *crb)
> >> > +{
> >> > +	int rc;
> >> > +	struct pid *pid;
> >> > +	void __user *csb_addr;
> >> > +	struct task_struct *tsk;
> >> > +	struct kernel_siginfo info;
> >> > +	struct coprocessor_status_block csb;
> >> 
> >> csb is on the stack, and later copied to user, which is a risk for
> >> creating an infoleak.
> >> 
> >> Also please use reverse Christmas tree layout for your variables.
> >> 
> >> > +
> >> > +	/*
> >> > +	 * NX user space windows can not be opened for task->mm=NULL
> >> > +	 * and faults will not be generated for kernel requests.
> >> > +	 */
> >> > +	if (!window->mm || !window->user_win)
> >> > +		return;
> >> 
> >> If that's a should-never-happen condition then should it do a
> >> WARN_ON_ONCE() rather than silently returning?
> > 
> > Will add WARN_ON
> > 
> >> 
> >> > +	csb_addr = (void __user *)be64_to_cpu(crb->csb_addr);
> >> > +
> >> > +	csb.cc = CSB_CC_TRANSLATION;
> >> > +	csb.ce = CSB_CE_TERMINATION;
> >> > +	csb.cs = 0;
> >> > +	csb.count = 0;
> >> > +
> >> > +	/*
> >> > +	 * NX operates and returns in BE format as defined CRB struct.
> >> > +	 * So return fault_storage_addr in BE as NX pastes in FIFO and
> >> > +	 * expects user space to convert to CPU format.
> >> > +	 */
> >> > +	csb.address = crb->stamp.nx.fault_storage_addr;
> >> > +	csb.flags = 0;
> >> 
> >> I'm pretty sure this has initialised all the fields of csb.
> >> 
> >> But, I'd still be much happier if you zeroed the whole struct to begin
> >> with, that way we know for sure we can't leak any uninitialised bytes to
> >> userspace. It's only 16 bytes so it shouldn't add any noticeable
> >> overhead.
> > Sure, will initialize csb
> >> 
> >> > +
> >> > +	pid = window->pid;
> >> > +	tsk = get_pid_task(pid, PIDTYPE_PID);
> >> > +	/*
> >> > +	 * Send window will be closed after processing all NX requests
> >> > +	 * and process exits after closing all windows. In multi-thread
> >> > +	 * applications, thread may not exists, but does not close FD
> >> > +	 * (means send window) upon exit. Parent thread (tgid) can use
> >> > +	 * and close the window later.
> >> > +	 * pid and mm references are taken when window is opened by
> >> > +	 * process (pid). So tgid is used only when child thread opens
> >> > +	 * a window and exits without closing it in multithread tasks.
> >> > +	 */
> >> > +	if (!tsk) {
> >> > +		pid = window->tgid;
> >> > +		tsk = get_pid_task(pid, PIDTYPE_PID);
> >> > +		/*
> >> > +		 * Parent thread will be closing window during its exit.
> >> > +		 * So should not get here.
> >> > +		 */
> >> > +		if (!tsk)
> >> > +			return;
> >> 
> >> Similar question on WARN_ON_ONCE()
> > Yes, we can add WARN_ON
> >> 
> >> > +	}
> >> > +
> >> > +	/* Return if the task is exiting. */
> >> 
> >> Why? Just because it's no use? It's racy isn't it, so it can't be for
> >> correctness?
> > Yes process is exiting and no need to update CSB. We release the
> > task->usage refcount after copy_to_user().
> > 
> >> 
> >> > +	if (tsk->flags & PF_EXITING) {
> >> > +		put_task_struct(tsk);
> >> > +		return;
> >> > +	}
> >> > +
> >> > +	use_mm(window->mm);
> >> 
> >> There's no check that csb_addr is actually pointing into userspace, but
> >> copy_to_user() does it for you.
> >> 
> >> > +	rc = copy_to_user(csb_addr, &csb, sizeof(csb));
> >> > +	/*
> >> > +	 * User space polls on csb.flags (first byte). So add barrier
> >> > +	 * then copy first byte with csb flags update.
> >> > +	 */
> >> > +	smp_mb();
> >> 
> >> You only need to order the stores above vs the store below to csb.flags.
> >> So you should only need an smp_wmb() here.
> > Sure, will add
> > if (!rc) {
> > 	csb.flags = CSB_V;
> > 	smp_mb();
> > 	rc = copy_to_user(csb_addr, &csb, sizeof(u8));
> > }
> > 
> >> 
> >> > +	if (!rc) {
> >> > +		csb.flags = CSB_V;
> >> > +		rc = copy_to_user(csb_addr, &csb, sizeof(u8));
> >> > +	}
> >> > +	unuse_mm(window->mm);
> >> > +	put_task_struct(tsk);
> >> > +
> >> > +	/* Success */
> >> > +	if (!rc)
> >> > +		return;
> >> > +
> >> > +	pr_debug("Invalid CSB address 0x%p signalling pid(%d)\n",
> >> > +			csb_addr, pid_vnr(pid));
> >> > +
> >> > +	clear_siginfo(&info);
> >> > +	info.si_signo = SIGSEGV;
> >> > +	info.si_errno = EFAULT;
> >> > +	info.si_code = SEGV_MAPERR;
> >> > +	info.si_addr = csb_addr;
> >> > +
> >> > +	/*
> >> > +	 * process will be polling on csb.flags after request is sent to
> >> > +	 * NX. So generally CSB update should not fail except when an
> >> > +	 * application does not follow the process properly. So an error
> >> > +	 * message will be displayed and leave it to user space whether
> >> > +	 * to ignore or handle this signal.
> >> > +	 */
> 
> The code would read a bit better if this comment goes at the start of
> this error handling process it describes (before the error message).
> 
> And I feel a bit hypocritical complaining about readability, but it 
> could possibly do with some work.
> 
> 	/*
> 	 * The application should have provided a valid mapping for the 
> 	 * csb, and not unmap it before the csb.flags update, so the 
> 	 * copy_to_user should not fail.
> 	 *
> 	 * If the application fails to follow this protocol, log a kernel 
> 	 * error and send a SEGV to the pid. This signal may be ignored,
> 	 * so can't use force_sig_fault_to_task()
> 	 */
> 
> Something like tthat?

Thanks Nick, will update. 
> 
> >> > +	rcu_read_lock();
> >> > +	rc = kill_pid_info(SIGSEGV, &info, pid);
> >> > +	rcu_read_unlock();
> 
> ipc/mqueue.c says kill_pid_info doesn't need rcu_read_lock(). AFAIKS
> it's held around kill_pid_info in kernel/signal.c for the find_vpid().

I was following as in kill_proc_info(). Will remove rcu_read_lock().

> 
> Thanks,
> Nick
> 
> >> 
> >> Shouldn't this be using force_sig_fault_to_task() or another helper,
> >> rather than open-coding?
> > 
> > Applications or nxz library can ignore this signal based on si_addr or
> > take action like resend new request with valid csb_addr. Hence I did not
> > use force_sig_info_to_task().
> 
> > 
> >> 
> >> > +
> >> > +	pr_devel("%s(): pid %d kill_proc_info() rc %d\n", __func__,
> >> > +			pid_vnr(pid), rc);
> >> > +}
> >> > +
> >> > +/*
> >> >   * Process valid CRBs in fault FIFO.
> >> >   */
> >> >  irqreturn_t vas_fault_thread_fn(int irq, void *data)
> >> > @@ -111,6 +224,7 @@ irqreturn_t vas_fault_thread_fn(int irq, void *data)
> >> >  			return IRQ_HANDLED;
> >> >  		}
> >> >  
> >> > +		update_csb(window, crb);
> >> >  	} while (true);
> >> >  }
> >> >  
> >> > -- 
> >> > 1.8.3.1
> >> 
> >> cheers
> > 
> > 
> > 


