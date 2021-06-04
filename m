Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E2339B137
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 06:08:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fx8Qc6g4kz30LG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 14:08:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o2zRQTTb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=o2zRQTTb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fx8Q60kBNz2yXb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 14:08:29 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15444LeO184392; Fri, 4 Jun 2021 00:08:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=QwhkEDTGgfwD/P3nkbmfDrPdWfWplfT9dYlqWKiEPHU=;
 b=o2zRQTTbZ3PCziDXQ+t7YcbyfoRcHLsI804vXQeXFQvDBzy0idU5IKTWRrOypdch114s
 zAiKtMnantLV8LB6g+lFGCV73g701Nj9pnQxkeg76tuzRnZxldrRhmIg9ashoEvxNUQH
 BDXDFGWDfFBARewIHuKqNKzh7j84aTxNnOb7cwJuxNluH66oiHiY7ZmOhOsIg5Xp+YXV
 M47xhp5RU/folfIHgKoro6KGGXG2WQlRoLjub4IxCyS32jGuLTOygUnVsPhhFSy8yavM
 vTYGr16Y9vZngW8HZRmGp9mpkgfBASa89qOIySiAqVTl3csJf1iOG5rx2dPej9FDZ469 EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38ybnpsfku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 00:08:18 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 154458Rk187328;
 Fri, 4 Jun 2021 00:08:18 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38ybnpsfkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 00:08:18 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15447GVl030650;
 Fri, 4 Jun 2021 04:08:17 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 38ud8ag9nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 04:08:17 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15448G7431981984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Jun 2021 04:08:16 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68038136053;
 Fri,  4 Jun 2021 04:08:16 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 944A413604F;
 Fri,  4 Jun 2021 04:08:14 +0000 (GMT)
Received: from sig-9-77-136-17.ibm.com (unknown [9.77.136.17])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  4 Jun 2021 04:08:14 +0000 (GMT)
Message-ID: <6a67ebd5f728966312063e132c4f6aba70285c72.camel@linux.ibm.com>
Subject: Re: [PATCH v4 04/16] powerpc/vas: Create take/drop pid and mm
 references
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Thu, 03 Jun 2021 21:08:12 -0700
In-Reply-To: <1622693213.hz0uqko6dk.astroid@bobo.none>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <16a319614a7ab4ce843f42a49c3ecf68ed03dd36.camel@linux.ibm.com>
 <1622693213.hz0uqko6dk.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -hYI19aW5LoVwBSOo7SGBv3Vm6HbAUoP
X-Proofpoint-GUID: JEID1MEzCJWsf_IOqdXbKsHnedpYiG-m
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-04_01:2021-06-04,
 2021-06-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxlogscore=917 lowpriorityscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106040030
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

On Thu, 2021-06-03 at 14:21 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of May 21, 2021 7:31 pm:
> > Take pid and mm references when each window opens and drops during
> > close. This functionality is needed for powerNV and pseries. So
> > this patch defines the existing code as functions in common book3s
> > platform vas-api.c
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> 
> Seems like a good idea to put these into their own helper functions.
> 
> > ---
> >  arch/powerpc/include/asm/vas.h              | 25 +++++++++
> >  arch/powerpc/platforms/book3s/vas-api.c     | 51
> > ++++++++++++++++++
> >  arch/powerpc/platforms/powernv/vas-fault.c  | 10 ++--
> >  arch/powerpc/platforms/powernv/vas-window.c | 57 ++---------------
> > ----
> >  arch/powerpc/platforms/powernv/vas.h        |  6 +--
> >  5 files changed, 88 insertions(+), 61 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/vas.h
> > b/arch/powerpc/include/asm/vas.h
> > index 668303198772..3f2b02461a76 100644
> > --- a/arch/powerpc/include/asm/vas.h
> > +++ b/arch/powerpc/include/asm/vas.h
> > @@ -5,6 +5,9 @@
> >  
> >  #ifndef _ASM_POWERPC_VAS_H
> >  #define _ASM_POWERPC_VAS_H
> > +#include <linux/sched/mm.h>
> > +#include <linux/mmu_context.h>
> > +#include <asm/icswx.h>
> >  #include <uapi/asm/vas-api.h>
> >  
> >  struct vas_window;
> > @@ -49,6 +52,17 @@ enum vas_cop_type {
> >  	VAS_COP_TYPE_MAX,
> >  };
> >  
> > +/*
> > + * User space VAS windows are opened by tasks and take references
> > + * to pid and mm until windows are closed.
> > + * Stores pid, mm, and tgid for each window.
> > + */
> > +struct vas_user_win_ref {
> > +	struct pid *pid;	/* PID of owner */
> > +	struct pid *tgid;	/* Thread group ID of owner */
> > +	struct mm_struct *mm;	/* Linux process mm_struct */
> > +};
> > +
> >  /*
> >   * User space window operations used for powernv and powerVM
> >   */
> > @@ -59,6 +73,16 @@ struct vas_user_win_ops {
> >  	int (*close_win)(void *);
> >  };
> >  
> > +static inline void vas_drop_reference_pid_mm(struct
> > vas_user_win_ref *ref)
> > +{
> > +	/* Drop references to pid and mm */
> > +	put_pid(ref->pid);
> > +	if (ref->mm) {
> > +		mm_context_remove_vas_window(ref->mm);
> > +		mmdrop(ref->mm);
> > +	}
> > +}
> 
> You don't have to make up a new name for such a thing because you 
> already have one
> 
> put_vas_user_win_ref(struct vas_user_win_ref *ref)
> 
> 
> > +
> >  /*
> >   * Receive window attributes specified by the (in-kernel) owner of
> > window.
> >   */
> > @@ -192,4 +216,5 @@ int vas_register_coproc_api(struct module *mod,
> > enum vas_cop_type cop_type,
> >  			    struct vas_user_win_ops *vops);
> >  void vas_unregister_coproc_api(void);
> >  
> > +int vas_reference_pid_mm(struct vas_user_win_ref *task_ref);
> >  #endif /* __ASM_POWERPC_VAS_H */
> > diff --git a/arch/powerpc/platforms/book3s/vas-api.c
> > b/arch/powerpc/platforms/book3s/vas-api.c
> > index 6c39320bfb9b..a0141bfb2e4b 100644
> > --- a/arch/powerpc/platforms/book3s/vas-api.c
> > +++ b/arch/powerpc/platforms/book3s/vas-api.c
> > @@ -55,6 +55,57 @@ static char *coproc_devnode(struct device *dev,
> > umode_t *mode)
> >  	return kasprintf(GFP_KERNEL, "crypto/%s", dev_name(dev));
> >  }
> >  
> > +/*
> > + * Take reference to pid and mm
> > + */
> > +int vas_reference_pid_mm(struct vas_user_win_ref *task_ref)
> > +{
> 
> So this is quite different from a typical refcount object in that
> it's 
> opening it for access as well. I would split it in two functions, one
> matching put_vas_user_win_ref() and appearing in the same place in
> code,
> which is up to about mmput and another function that adds the window
> and
> does the CP_ABORT etc... hmm, where do you release tgid?

Basically copied the existing code in to these functions
(vas_reference_pid_mm/vas_drop_reference_pid_mm) so that useful for
both platforms. 

mm_context_add/remove_vas_window() is also like taking reference. So
instead of adding 2 seperate functions, how about naming
get/put_vas_user_win_ref() 

Regarding tgid, the reference is taking only with pid, but not tgid.
pid reuse can happen only in the case of multithread applications when
the child that opened VAS window exits. But these windows will be
closed when tgid exists. So do not need tgid reference.
  
Thanks
Haren


> 
> Thanks,
> Nick
> 
> > +	/*
> > +	 * Window opened by a child thread may not be closed when
> > +	 * it exits. So take reference to its pid and release it
> > +	 * when the window is free by parent thread.
> > +	 * Acquire a reference to the task's pid to make sure
> > +	 * pid will not be re-used - needed only for multithread
> > +	 * applications.
> > +	 */
> > +	task_ref->pid = get_task_pid(current, PIDTYPE_PID);
> > +	/*
> > +	 * Acquire a reference to the task's mm.
> > +	 */
> > +	task_ref->mm = get_task_mm(current);
> > +	if (!task_ref->mm) {
> > +		put_pid(task_ref->pid);
> > +		pr_err("VAS: pid(%d): mm_struct is not found\n",
> > +				current->pid);
> > +		return -EPERM;
> > +	}
> > +
> > +	mmgrab(task_ref->mm);
> > +	mmput(task_ref->mm);
> > +	mm_context_add_vas_window(task_ref->mm);
> > +	/*
> > +	 * Process closes window during exit. In the case of
> > +	 * multithread application, the child thread can open
> > +	 * window and can exit without closing it. Expects parent
> > +	 * thread to use and close the window. So do not need
> > +	 * to take pid reference for parent thread.
> > +	 */
> > +	task_ref->tgid = find_get_pid(task_tgid_vnr(current));
> > +	/*
> > +	 * Even a process that has no foreign real address mapping can
> > +	 * use an unpaired COPY instruction (to no real effect). Issue
> > +	 * CP_ABORT to clear any pending COPY and prevent a covert
> > +	 * channel.
> > +	 *
> > +	 * __switch_to() will issue CP_ABORT on future context switches
> > +	 * if process / thread has any open VAS window (Use
> > +	 * current->mm->context.vas_windows).
> > +	 */
> > +	asm volatile(PPC_CP_ABORT);
> > +
> > +	return 0;
> > +}
> > +
> >  static int coproc_open(struct inode *inode, struct file *fp)
> >  {
> >  	struct coproc_instance *cp_inst;
> > diff --git a/arch/powerpc/platforms/powernv/vas-fault.c
> > b/arch/powerpc/platforms/powernv/vas-fault.c
> > index 3d21fce254b7..ac3a71ec3bd5 100644
> > --- a/arch/powerpc/platforms/powernv/vas-fault.c
> > +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> > @@ -73,7 +73,7 @@ static void update_csb(struct vas_window *window,
> >  	 * NX user space windows can not be opened for task->mm=NULL
> >  	 * and faults will not be generated for kernel requests.
> >  	 */
> > -	if (WARN_ON_ONCE(!window->mm || !window->user_win))
> > +	if (WARN_ON_ONCE(!window->task_ref.mm || !window->user_win))
> >  		return;
> >  
> >  	csb_addr = (void __user *)be64_to_cpu(crb->csb_addr);
> > @@ -92,7 +92,7 @@ static void update_csb(struct vas_window *window,
> >  	csb.address = crb->stamp.nx.fault_storage_addr;
> >  	csb.flags = 0;
> >  
> > -	pid = window->pid;
> > +	pid = window->task_ref.pid;
> >  	tsk = get_pid_task(pid, PIDTYPE_PID);
> >  	/*
> >  	 * Process closes send window after all pending NX requests are
> > @@ -111,7 +111,7 @@ static void update_csb(struct vas_window
> > *window,
> >  	 * a window and exits without closing it.
> >  	 */
> >  	if (!tsk) {
> > -		pid = window->tgid;
> > +		pid = window->task_ref.tgid;
> >  		tsk = get_pid_task(pid, PIDTYPE_PID);
> >  		/*
> >  		 * Parent thread (tgid) will be closing window when it
> > @@ -127,7 +127,7 @@ static void update_csb(struct vas_window
> > *window,
> >  		return;
> >  	}
> >  
> > -	kthread_use_mm(window->mm);
> > +	kthread_use_mm(window->task_ref.mm);
> >  	rc = copy_to_user(csb_addr, &csb, sizeof(csb));
> >  	/*
> >  	 * User space polls on csb.flags (first byte). So add barrier
> > @@ -139,7 +139,7 @@ static void update_csb(struct vas_window
> > *window,
> >  		smp_mb();
> >  		rc = copy_to_user(csb_addr, &csb, sizeof(u8));
> >  	}
> > -	kthread_unuse_mm(window->mm);
> > +	kthread_unuse_mm(window->task_ref.mm);
> >  	put_task_struct(tsk);
> >  
> >  	/* Success */
> > diff --git a/arch/powerpc/platforms/powernv/vas-window.c
> > b/arch/powerpc/platforms/powernv/vas-window.c
> > index 3ccd3edcaf1a..ffd619e5a218 100644
> > --- a/arch/powerpc/platforms/powernv/vas-window.c
> > +++ b/arch/powerpc/platforms/powernv/vas-window.c
> > @@ -1065,51 +1065,9 @@ struct vas_window *vas_tx_win_open(int
> > vasid, enum vas_cop_type cop,
> >  			rc = -ENODEV;
> >  			goto free_window;
> >  		}
> > -
> > -		/*
> > -		 * Window opened by a child thread may not be closed
> > when
> > -		 * it exits. So take reference to its pid and release
> > it
> > -		 * when the window is free by parent thread.
> > -		 * Acquire a reference to the task's pid to make sure
> > -		 * pid will not be re-used - needed only for
> > multithread
> > -		 * applications.
> > -		 */
> > -		txwin->pid = get_task_pid(current, PIDTYPE_PID);
> > -		/*
> > -		 * Acquire a reference to the task's mm.
> > -		 */
> > -		txwin->mm = get_task_mm(current);
> > -
> > -		if (!txwin->mm) {
> > -			put_pid(txwin->pid);
> > -			pr_err("VAS: pid(%d): mm_struct is not
> > found\n",
> > -					current->pid);
> > -			rc = -EPERM;
> > +		rc = vas_reference_pid_mm(&txwin->task_ref);
> > +		if (rc)
> >  			goto free_window;
> > -		}
> > -
> > -		mmgrab(txwin->mm);
> > -		mmput(txwin->mm);
> > -		mm_context_add_vas_window(txwin->mm);
> > -		/*
> > -		 * Process closes window during exit. In the case of
> > -		 * multithread application, the child thread can open
> > -		 * window and can exit without closing it. Expects
> > parent
> > -		 * thread to use and close the window. So do not need
> > -		 * to take pid reference for parent thread.
> > -		 */
> > -		txwin->tgid = find_get_pid(task_tgid_vnr(current));
> > -		/*
> > -		 * Even a process that has no foreign real address
> > mapping can
> > -		 * use an unpaired COPY instruction (to no real
> > effect). Issue
> > -		 * CP_ABORT to clear any pending COPY and prevent a
> > covert
> > -		 * channel.
> > -		 *
> > -		 * __switch_to() will issue CP_ABORT on future context
> > switches
> > -		 * if process / thread has any open VAS window (Use
> > -		 * current->mm->context.vas_windows).
> > -		 */
> > -		asm volatile(PPC_CP_ABORT);
> >  	}
> >  
> >  	set_vinst_win(vinst, txwin);
> > @@ -1339,14 +1297,9 @@ int vas_win_close(struct vas_window *window)
> >  
> >  	/* if send window, drop reference to matching receive window */
> >  	if (window->tx_win) {
> > -		if (window->user_win) {
> > -			/* Drop references to pid and mm */
> > -			put_pid(window->pid);
> > -			if (window->mm) {
> > -				mm_context_remove_vas_window(window-
> > >mm);
> > -				mmdrop(window->mm);
> > -			}
> > -		}
> > +		if (window->user_win)
> > +			vas_drop_reference_pid_mm(&window->task_ref);
> > +
> >  		put_rx_win(window->rxwin);
> >  	}
> >  
> > diff --git a/arch/powerpc/platforms/powernv/vas.h
> > b/arch/powerpc/platforms/powernv/vas.h
> > index c7db3190baca..f354dd5c51bd 100644
> > --- a/arch/powerpc/platforms/powernv/vas.h
> > +++ b/arch/powerpc/platforms/powernv/vas.h
> > @@ -357,11 +357,9 @@ struct vas_window {
> >  	bool user_win;		/* True if user space window */
> >  	void *hvwc_map;		/* HV window context */
> >  	void *uwc_map;		/* OS/User window context */
> > -	struct pid *pid;	/* Linux process id of owner */
> > -	struct pid *tgid;	/* Thread group ID of owner */
> > -	struct mm_struct *mm;	/* Linux process mm_struct */
> >  	int wcreds_max;		/* Window credits */
> >  
> > +	struct vas_user_win_ref task_ref;
> >  	char *dbgname;
> >  	struct dentry *dbgdir;
> >  
> > @@ -443,7 +441,7 @@ extern void vas_win_paste_addr(struct
> > vas_window *window, u64 *addr,
> >  
> >  static inline int vas_window_pid(struct vas_window *window)
> >  {
> > -	return pid_vnr(window->pid);
> > +	return pid_vnr(window->task_ref.pid);
> >  }
> >  
> >  static inline void vas_log_write(struct vas_window *win, char
> > *name,
> > -- 
> > 2.18.2
> > 
> > 
> > 

