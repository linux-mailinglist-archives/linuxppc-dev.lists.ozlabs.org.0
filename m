Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 888CF156E9B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 06:15:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GDcq0QCMzDqBV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 16:15:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GDZl2MXMzDqMl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 16:13:34 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01A57HJN037509; Mon, 10 Feb 2020 00:13:15 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y1u1hfg7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 00:13:15 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01A59lYc043319;
 Mon, 10 Feb 2020 00:13:14 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y1u1hfg76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 00:13:14 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01A568Hn004524;
 Mon, 10 Feb 2020 05:13:14 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 2y1mm6jd5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 05:13:13 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01A5DDRh10290066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Feb 2020 05:13:13 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29D95112065;
 Mon, 10 Feb 2020 05:13:13 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7186B112061;
 Mon, 10 Feb 2020 05:13:12 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 10 Feb 2020 05:13:12 +0000 (GMT)
Subject: Re: [PATCH V5 09/14] powerpc/vas: Update CSB and notify process
 for fault CRBs
From: Haren Myneni <haren@linux.ibm.com>
To: Michael Neuling <mikey@neuling.org>
In-Reply-To: <67467b52ddd8fcd6ccd8390f9b1f0ed7c09bb3bf.camel@neuling.org>
References: <1579679802.26081.6.camel@hbabu-laptop>
 <1579681061.26081.48.camel@hbabu-laptop>
 <67467b52ddd8fcd6ccd8390f9b1f0ed7c09bb3bf.camel@neuling.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 09 Feb 2020 21:12:49 -0800
Message-ID: <1581311569.18705.18.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-10_01:2020-02-07,
 2020-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002100040
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

Mikey, Thanks for your review comments.

On Fri, 2020-02-07 at 16:46 +1100, Michael Neuling wrote:
> On Wed, 2020-01-22 at 00:17 -0800, Haren Myneni wrote:
> > For each fault CRB, update fault address in CRB (fault_storage_addr)
> > and translation error status in CSB so that user space can touch the
> > fault address and resend the request. If the user space passed invalid
> > CSB address send signal to process with SIGSEGV.
> > 
> > Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/powernv/vas-fault.c | 116
> > +++++++++++++++++++++++++++++
> >  1 file changed, 116 insertions(+)
> > 
> > diff --git a/arch/powerpc/platforms/powernv/vas-fault.c
> > b/arch/powerpc/platforms/powernv/vas-fault.c
> > index 5c2cada..2cfab0c 100644
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
> > @@ -26,6 +27,120 @@
> >  #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
> >  
> >  /*
> > + * Update the CSB to indicate a translation error.
> > + *
> > + * If the fault is in the CSB address itself or if we are unable to
> > + * update the CSB, send a signal to the process, because we have no
> > + * other way of notifying the user process.
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
> > +
> > +	/*
> > +	 * NX user space windows can not be opened for task->mm=NULL
> > +	 * and faults will not be generated for kernel requests.
> > +	 */
> > +	if (!window->mm || !window->user_win)
> > +		return;
> > +
> > +	csb_addr = (void *)be64_to_cpu(crb->csb_addr);
> > +
> > +	csb.cc = CSB_CC_TRANSLATION;
> > +	csb.ce = CSB_CE_TERMINATION;
> > +	csb.cs = 0;
> > +	csb.count = 0;
> > +
> > +	/*
> > +	 * Returns the fault address in CPU format since it is passed with
> > +	 * signal. But if the user space expects BE format, need changes.
> > +	 * i.e either kernel (here) or user should convert to CPU format.
> > +	 * Not both!
> > +	 */
> > +	csb.address = be64_to_cpu(crb->stamp.nx.fault_storage_addr);
> 
> This looks wrong and I don't understand the comment. You need to convert this
> back to be64 to write it to csb.address. ie.
> 
>   csb.address = cpu_to_be64(be64_to_cpu(crb->stamp.nx.fault_storage_addr));
> 
> Which I think you can just avoid the endian conversion all together.

NX pastes fault CRB in big-endian, so passing this address in CPU format
to user space, otherwise the library has to convert. 

What is the standard way for passing to user space? 

> 
> > +	csb.flags = 0;
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
> > +	}
> > +
> > +	/* Return if the task is exiting. */
> > +	if (tsk->flags & PF_EXITING) {
> > +		put_task_struct(tsk);
> > +		return;
> > +	}
> > +
> > +	use_mm(window->mm);
> > +	rc = copy_to_user(csb_addr, &csb, sizeof(csb));
> > +	/*
> > +	 * User space polls on csb.flags (first byte). So add barrier
> > +	 * then copy first byte with csb flags update.
> > +	 */
> > +	smp_mb();
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
> > +	pr_err("Invalid CSB address 0x%p signalling pid(%d)\n",
> > +			csb_addr, pid_vnr(pid));
> 
> This is a userspace error, not a kernel error. This should not be a pr_err().
> 
> Userspace could spam the console with this.

Will change it to pr_debug/info. Added pr_err() during development and
missed to remove. 
> 
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
> why the rcu_read_un/lock() here?

Used same as in kill_proc_info()/kill_something_info()
> 
> > +
> > +	pr_devel("%s(): pid %d kill_proc_info() rc %d\n", __func__,
> > +			pid_vnr(pid), rc);
> > +}
> > +
> > +/*
> >   * Process CRBs that we receive on the fault window.
> >   */
> >  irqreturn_t vas_fault_handler(int irq, void *data)
> > @@ -104,6 +219,7 @@ irqreturn_t vas_fault_handler(int irq, void *data)
> >  			return IRQ_HANDLED;
> >  		}
> >  
> > +		update_csb(window, crb);
> >  	} while (true);
> >  
> >  	return IRQ_HANDLED;
> 


