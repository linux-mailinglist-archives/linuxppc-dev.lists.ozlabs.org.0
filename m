Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB78C191F85
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 04:02:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nCb86pmBzDqvh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 14:02:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nCWw5R1LzDqPn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 13:59:40 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02P2WwvE102683; Tue, 24 Mar 2020 22:59:17 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywejx2vmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 22:59:16 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02P2XRiB103755;
 Tue, 24 Mar 2020 22:59:16 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywejx2vky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 22:59:16 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02P2uj25021197;
 Wed, 25 Mar 2020 02:59:15 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 2ywawfwg9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Mar 2020 02:59:15 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02P2xDZ442795506
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Mar 2020 02:59:13 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70D8813604F;
 Wed, 25 Mar 2020 02:59:13 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA491136053;
 Wed, 25 Mar 2020 02:59:12 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 25 Mar 2020 02:59:12 +0000 (GMT)
Subject: Re: [PATCH v8 06/14] powerpc/vas: Setup thread IRQ handler per VAS
 instance
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <1584926621.6b1zd5e2im.astroid@bobo.none>
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598540.9256.15252.camel@hbabu-laptop>
 <1584926621.6b1zd5e2im.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Mar 2020 19:58:39 -0700
Message-ID: <1585105119.10664.351.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_10:2020-03-23,
 2020-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 suspectscore=2 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003250021
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

On Mon, 2020-03-23 at 12:23 +1000, Nicholas Piggin wrote:
> Haren Myneni's on March 19, 2020 4:15 pm:
> > 
> > Setup thread IRQ handler per each VAS instance. When NX sees a fault
> > on CRB, kernel gets an interrupt and vas_fault_handler will be
> > executed to process fault CRBs. Read all valid CRBs from fault FIFO,
> > determine the corresponding send window from CRB and process fault
> > requests.
> 
> Perhaps some more overview/why.
> 
> "If NX encounters a translation error when accessing the CRB or one
> of addresses in the request, it raises an interrupt on the CPU to
> handle the fault.
> 
> 
> > 
> > Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/powernv/vas-fault.c  | 90 +++++++++++++++++++++++++++++
> >  arch/powerpc/platforms/powernv/vas-window.c | 60 +++++++++++++++++++
> >  arch/powerpc/platforms/powernv/vas.c        | 49 +++++++++++++++-
> >  arch/powerpc/platforms/powernv/vas.h        |  6 ++
> >  4 files changed, 204 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
> > index 4044998..1c6d5cc 100644
> > --- a/arch/powerpc/platforms/powernv/vas-fault.c
> > +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/uaccess.h>
> >  #include <linux/kthread.h>
> > +#include <linux/mmu_context.h>
> >  #include <asm/icswx.h>
> >  
> >  #include "vas.h"
> > @@ -25,6 +26,95 @@
> >  #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
> >  
> >  /*
> > + * Process valid CRBs in fault FIFO.
> > + */
> > +irqreturn_t vas_fault_thread_fn(int irq, void *data)
> 
> Are page faults the only reason why VAS would raise this interrupt? Is 
> NX really the only possible user of this, so you can have NX specifics
> in here?

Yes, When NX sees page faults, it generates interrupts on specific VAS
instance. Right now NX is the only user. So trying to make as
generalized as possible. 

> 
> > +{
> > +	struct vas_instance *vinst = data;
> > +	struct coprocessor_request_block *crb, *entry;
> > +	struct coprocessor_request_block buf;
> > +	struct vas_window *window;
> > +	unsigned long flags;
> > +	void *fifo;
> > +
> > +	crb = &buf;
> 
> The below comment could just be moved to replace the one at the top of the
> function. Can you explain slightly more about how the faults work, and 
> be more clear about what the coprocessor does versus what the host does? The
> use of VAS and NX is a bit confusing too. VAS doesn't interrupt with
> page faults, does it? NX has the page fault(s), and it requests VAS to
> interrupt the host?
NX is the one who raises interrupt on specific VAS port that is
registered with fault window. I will make it clear in the comment.  
> 
> > +
> > +	/*
> > +	 * VAS can interrupt with multiple page faults. So process all
> > +	 * valid CRBs within fault FIFO until reaches invalid CRB.
> 
>  When NX encounters a fault accessing a memory address for a particular
>  CRB, it updates the nx_fault_stamp field in the CRB (to what?), and 
>  copies the CRB to the fault FIFO memory, then raises an interrupt on the
>  CPU (memory ordering on the store and load sides are provided how?). NX
>  can store multiple faults into the FIFO per interrupt (does it proceed
>  asynchronously after the interrupt? what's the stopping condition?).

User space fills CRB and sends request (CRB). NX processes the request
and update CSB (in CRB struct). If NX sees any page fault either on
request buffers or csb address, updates nx_fault_stamp struct (in user
space CRB) and pastes CRB in fault_fifo. Then raises interrupt on port
defined in fault_window (which is per VAS instance). 

NX can raise single interrupt for multiple faults and can paste in fault
FIFO. But OS and NX use credits to control fault FIFO. 

Initially FIFO_SIZE/CRB_SIZE credits are available for fault window. For
example, When NX pastes CRB in fault fifo, credits will be reduced by 1.
It can continue paste CRBs in FIFO until credits reached to 0. 
When OS handles the fault CRB, increments index in FIFO and returns the
credit so that NX knows one more CRB slot is available. 

struct coprocessor_request_block {
        __be32 ccw;
        __be32 flags;
        __be64 csb_addr;

        struct data_descriptor_entry source;
        struct data_descriptor_entry target;

        struct coprocessor_completion_block ccb;

        union {
                struct nx_fault_stamp nx;
                u8 reserved[16];
        } stamp;

        u8 reserved[32];

        struct coprocessor_status_block csb;
} __packed __aligned(CRB_ALIGN);
 


> 
>  When the CPU takes this interrupt, it reads the faulting CRBs from the
>  FIFO and processes them in order until it reaches an invalid entry, FIFO
>  empty (memory ordering how?). After each FIFO entry is processed, store
>  to mark them as invalid. (How does NX resume after this?)

NX should do atomic copy of CRB in fault FIFO. But we had barrier (as
part of spin_unlock()) for the safe side which is suggested by HW team.

NX stops pasting CRBs if credits are not available and start when credit
is returned by OS after handling fault. 

> 
> How is the fault actually even "handled" here? Nothing seems to be
> actually done for them.
> 
> > +	 * NX updates nx_fault_stamp in CRB and pastes in fault FIFO.
> > +	 * kernel retrives send window from parition send window ID
> > +	 * (pswid) in nx_fault_stamp. So pswid should be valid and
> > +	 * ccw[0] (in be) should be zero since this bit is reserved.
> > +	 * If user space touches this bit, NX returns with "CRB format
> > +	 * error".
> > +	 *
> > +	 * After reading CRB entry, invalidate it with pswid (set
> > +	 * 0xffffffff) and ccw[0] (set to 1).
> 
> Al this is very busy and hard to decipher unambiguously. It should read
> more like a spec, a precise sequence of things happening.
Sure, will make it clear
> 
> > +	 *
> > +	 * In case kernel receives another interrupt with different page
> > +	 * fault, CRBs are already processed by the previous handling. So
> > +	 * will be returned from this function when it sees invalid CRB.
> > +	 */
> 
> Ambiguous at best. Assuming the NX continues running asynchronously and
> it's a usual kind of FIFO, I assume this means if the kernel gets 
> another interrupt for a page fault corresponding to a FIFO entry that
> has already been processed by this fault.
> 
> 
> > +	do {
> 
> Can you make this 'while (true)' or 'for (;;)' so you don't need to go
> to the bottom to see it's an infinite loop.
> 
> > +		mutex_lock(&vinst->mutex);
> 
> What does this protect? Threaded handlers don't run concurrently for the
> same request_threaded_irq?

We can remove this mutex_lock. 
> 
> > +
> > +		spin_lock_irqsave(&vinst->fault_lock, flags);
> > +		/*
> > +		 * Advance the fault fifo pointer to next CRB.
> 
> The code below the comment isn't advancing the fault fifo pointer, it's
> grabbing the current one. The pointer (fault_crbs) is advanced later. 
> You presumabl don't want to advance over an invalid entry.

Advancing to next entry which is invalid means start processing from
this entry in the next fault. 

> 
> > +		 * Use CRB_SIZE rather than sizeof(*crb) since the latter is
> > +		 * aligned to CRB_ALIGN (256) but the CRB written to by VAS is
> > +		 * only CRB_SIZE in len.
> > +		 */
> > +		fifo = vinst->fault_fifo + (vinst->fault_crbs * CRB_SIZE);
> > +		entry = fifo;
> 
> Don't think you should really do this. It may be harmless in this case,
> but the compiler expects the type to be aligned. Make it another type,
> like coprocessor_fault_block or something?

Can add like "entry = (struct coprocessor_request_block *)fifo;

> 
> > +
> > +		if ((entry->stamp.nx.pswid == cpu_to_be32(FIFO_INVALID_ENTRY))
> > +			|| (entry->ccw & cpu_to_be32(CCW0_INVALID))) {
> > +			atomic_set(&vinst->faults_in_progress, 0);
> > +			spin_unlock_irqrestore(&vinst->fault_lock, flags);
> 
> So what does the fault_lock protect? The only data it protects is 
> faults_in_progress (vs the hard interrupt handler), which doesn't 
> achieve anything by itself, so I guess it also prevents the hard irq
> handler from returning until the handler here has checked that the
> fault FIFO is empty then returns IRQ_HANDLED? That seems fine (so long
> as memory ordering details are okay), but it should be documented
> that way.

In the case of using default_handler, wakes up thread if it is not in
progress and checks whether interrupts are handled with in some
duration. If un_handled interrupts reached 99000, display bad_irq trace
and disables IRQ. In our case we do not have one fault per interrupt. 
We ran some test case which continuously generates NX faults, the
handler thread is busy processing fault CRBs in FIFO and the later
interrupts are not handled. 

So added own handler which checks whether fault_thread is in progress.
If so returned IRQ_HANDLED. fault_lock is used to check valid entry
section and check faults_in_progress in handler. 

Added comment in vas_fault_handler(). 

> 
> Also why is the hard handler in a different file? Makes it harder to
> see how this works at a glance.

OK, Will change. I thought IRQ handler per VAS is added in vas.c since
it has VAS initialization and vas_fault.c is only for fault handling. 

> 
> faults_in_progress does not have to be atomic because it's always
> accessed under the lock. And IMO it should have a better name. If the
> NX can be causing more faults as we go, it really doesn't indicate
> anything about faults. It's whether or not the threaded handler is
> currently woken and processing faults.

Used atomic since not using spin_lock/unlock for failing case when
window (from CRB) is not valid. 

Sure, How about fault_thread_in_progress? As it is long name, used
faults_in_progress. 

> 
> > +			mutex_unlock(&vinst->mutex);
> > +			return IRQ_HANDLED;
> > +		}
> > +
> > +		spin_unlock_irqrestore(&vinst->fault_lock, flags);
> > +		vinst->fault_crbs++;
> > +		if (vinst->fault_crbs == (vinst->fault_fifo_size / CRB_SIZE))
> > +			vinst->fault_crbs = 0;
> > +
> > +		memcpy(crb, fifo, CRB_SIZE);
> > +		entry->stamp.nx.pswid = cpu_to_be32(FIFO_INVALID_ENTRY);
> > +		entry->ccw |= cpu_to_be32(CCW0_INVALID);
> > +		mutex_unlock(&vinst->mutex);
> > +
> > +		pr_devel("VAS[%d] fault_fifo %p, fifo %p, fault_crbs %d\n",
> > +				vinst->vas_id, vinst->fault_fifo, fifo,
> > +				vinst->fault_crbs);
> > +
> > +		window = vas_pswid_to_window(vinst,
> > +				be32_to_cpu(crb->stamp.nx.pswid));
> > +
> > +		if (IS_ERR(window)) {
> > +			/*
> > +			 * We got an interrupt about a specific send
> > +			 * window but we can't find that window and we can't
> > +			 * even clean it up (return credit).
> > +			 * But we should not get here.
> > +			 */
> > +			pr_err("VAS[%d] fault_fifo %p, fifo %p, pswid 0x%x, fault_crbs %d bad CRB?\n",
> > +				vinst->vas_id, vinst->fault_fifo, fifo,
> > +				be32_to_cpu(crb->stamp.nx.pswid),
> > +				vinst->fault_crbs);
> > +
> > +			WARN_ON_ONCE(1);
> > +			atomic_set(&vinst->faults_in_progress, 0);
> > +			return IRQ_HANDLED;
> 
> Shouldn't get here but you have a handler for it, so it should try to
> be graceful. Keep processing the rest of the FIFO until it's empty
> otherwise you have a missed wakeup here? Probably less code too, just
> delete the last 2 lines.

Derive window address from pswid which is pasted by NX. So if window
address is not valid means a bug, we should not be reached this. If
getting this failure, printed data in FIFO for around 10 CRBs. Not sure
whether proceeding with this failure. We may end up receiving lots of
messages on the console if we see similar failures in later CRBs.
Thinking may be disable IRQ so that kernel will not receive any
interrupts. I have not tested this case. I can change it to continue now
and Can I add disable IRQ as TODO? 

Thanks for your detailed review. 

> 
> Thanks,
> Nick
> 
> > +		}
> > +
> > +	} while (true);
> > +}
> > +
> > +/*
> >   * Fault window is opened per VAS instance. NX pastes fault CRB in fault
> >   * FIFO upon page faults.
> >   */
> > diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
> > index 1783fa9..1f31c18 100644
> > --- a/arch/powerpc/platforms/powernv/vas-window.c
> > +++ b/arch/powerpc/platforms/powernv/vas-window.c
> > @@ -1040,6 +1040,15 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
> >  		}
> >  	} else {
> >  		/*
> > +		 * Interrupt hanlder or fault window setup failed. Means
> > +		 * NX can not generate fault for page fault. So not
> > +		 * opening for user space tx window.
> > +		 */
> > +		if (!vinst->virq) {
> > +			rc = -ENODEV;
> > +			goto free_window;
> > +		}
> > +		/*
> >  		 * A user mapping must ensure that context switch issues
> >  		 * CP_ABORT for this thread.
> >  		 */
> > @@ -1254,3 +1263,54 @@ int vas_win_close(struct vas_window *window)
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(vas_win_close);
> > +
> > +struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
> > +		uint32_t pswid)
> > +{
> > +	struct vas_window *window;
> > +	int winid;
> > +
> > +	if (!pswid) {
> > +		pr_devel("%s: called for pswid 0!\n", __func__);
> > +		return ERR_PTR(-ESRCH);
> > +	}
> > +
> > +	decode_pswid(pswid, NULL, &winid);
> > +
> > +	if (winid >= VAS_WINDOWS_PER_CHIP)
> > +		return ERR_PTR(-ESRCH);
> > +
> > +	/*
> > +	 * If application closes the window before the hardware
> > +	 * returns the fault CRB, we should wait in vas_win_close()
> > +	 * for the pending requests. so the window must be active
> > +	 * and the process alive.
> > +	 *
> > +	 * If its a kernel process, we should not get any faults and
> > +	 * should not get here.
> > +	 */
> > +	window = vinst->windows[winid];
> > +
> > +	if (!window) {
> > +		pr_err("PSWID decode: Could not find window for winid %d pswid %d vinst 0x%p\n",
> > +			winid, pswid, vinst);
> > +		return NULL;
> > +	}
> > +
> > +	/*
> > +	 * Do some sanity checks on the decoded window.  Window should be
> > +	 * NX GZIP user send window. FTW windows should not incur faults
> > +	 * since their CRBs are ignored (not queued on FIFO or processed
> > +	 * by NX).
> > +	 */
> > +	if (!window->tx_win || !window->user_win || !window->nx_win ||
> > +			window->cop == VAS_COP_TYPE_FAULT ||
> > +			window->cop == VAS_COP_TYPE_FTW) {
> > +		pr_err("PSWID decode: id %d, tx %d, user %d, nx %d, cop %d\n",
> > +			winid, window->tx_win, window->user_win,
> > +			window->nx_win, window->cop);
> > +		WARN_ON(1);
> > +	}
> > +
> > +	return window;
> > +}
> > diff --git a/arch/powerpc/platforms/powernv/vas.c b/arch/powerpc/platforms/powernv/vas.c
> > index 557c8e4..3d9ba58 100644
> > --- a/arch/powerpc/platforms/powernv/vas.c
> > +++ b/arch/powerpc/platforms/powernv/vas.c
> > @@ -14,6 +14,8 @@
> >  #include <linux/of_platform.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/interrupt.h>
> >  #include <asm/prom.h>
> >  #include <asm/xive.h>
> >  
> > @@ -24,9 +26,53 @@
> >  
> >  static DEFINE_PER_CPU(int, cpu_vas_id);
> >  
> > +static irqreturn_t vas_fault_handler(int irq, void *dev_id)
> > +{
> > +	struct vas_instance *vinst = dev_id;
> > +	irqreturn_t ret = IRQ_WAKE_THREAD;
> > +	unsigned long flags;
> > +
> > +	/*
> > +	 * NX can generate an interrupt for multiple faults. So the
> > +	 * fault handler thread process all CRBs until finds invalid
> > +	 * entry. In case if NX sees continuous faults, it is possible
> > +	 * that the thread function entered with the first interrupt
> > +	 * can execute and process all valid CRBs.
> > +	 * So wake up thread only if the fault thread is not in progress.
> > +	 */
> > +	spin_lock_irqsave(&vinst->fault_lock, flags);
> > +
> > +	if (atomic_read(&vinst->faults_in_progress))
> > +		ret = IRQ_HANDLED;
> > +	else
> > +		atomic_set(&vinst->faults_in_progress, 1);
> > +
> > +	spin_unlock_irqrestore(&vinst->fault_lock, flags);
> > +
> > +	return ret;
> > +}
> > +
> >  static int vas_irq_fault_window_setup(struct vas_instance *vinst)
> >  {
> > -	return vas_setup_fault_window(vinst);
> > +	char devname[64];
> > +	int rc = 0;
> > +
> > +	snprintf(devname, sizeof(devname), "vas-%d", vinst->vas_id);
> > +	rc = request_threaded_irq(vinst->virq, vas_fault_handler,
> > +				vas_fault_thread_fn, 0, devname, vinst);
> > +
> > +	if (rc) {
> > +		pr_err("VAS[%d]: Request IRQ(%d) failed with %d\n",
> > +				vinst->vas_id, vinst->virq, rc);
> > +		goto out;
> > +	}
> > +
> > +	rc = vas_setup_fault_window(vinst);
> > +	if (rc)
> > +		free_irq(vinst->virq, vinst);
> > +
> > +out:
> > +	return rc;
> >  }
> >  
> >  static int init_vas_instance(struct platform_device *pdev)
> > @@ -109,6 +155,7 @@ static int init_vas_instance(struct platform_device *pdev)
> >  	list_add(&vinst->node, &vas_instances);
> >  	mutex_unlock(&vas_mutex);
> >  
> > +	spin_lock_init(&vinst->fault_lock);
> >  	/*
> >  	 * IRQ and fault handling setup is needed only for user space
> >  	 * send windows.
> > diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
> > index 6c4baf5..ecae7cd 100644
> > --- a/arch/powerpc/platforms/powernv/vas.h
> > +++ b/arch/powerpc/platforms/powernv/vas.h
> > @@ -326,7 +326,10 @@ struct vas_instance {
> >  
> >  	u64 irq_port;
> >  	int virq;
> > +	int fault_crbs;
> >  	int fault_fifo_size;
> > +	atomic_t faults_in_progress;
> > +	spinlock_t fault_lock;
> >  	void *fault_fifo;
> >  	struct vas_window *fault_win; /* Fault window */
> >  
> > @@ -424,6 +427,9 @@ struct vas_winctx {
> >  extern void vas_window_init_dbgdir(struct vas_window *win);
> >  extern void vas_window_free_dbgdir(struct vas_window *win);
> >  extern int vas_setup_fault_window(struct vas_instance *vinst);
> > +extern irqreturn_t vas_fault_thread_fn(int irq, void *data);
> > +extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
> > +						uint32_t pswid);
> >  
> >  static inline void vas_log_write(struct vas_window *win, char *name,
> >  			void *regptr, u64 val)
> > -- 
> > 1.8.3.1
> > 
> > 
> > 
> > 


