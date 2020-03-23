Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFD418EDFB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 03:29:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48lyxQ6nbbzDqfb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 13:28:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=T/R8MXTl; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48lyvD44lgzDqkp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 13:27:03 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id b72so6739194pfb.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 19:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=XaEIMX7JSQ7XdJp9Bx4H+l3TjrmYA2lLGlfRFJ+aJs8=;
 b=T/R8MXTlLGi/nNTngd4ffR9BxCOPryMGenb5/bjGMuKSIFE5+bQOV+gxmbYmrEu377
 j29TBhPxuaqxtwbajk9xAN8/FPtdUd/ac7teW7avYY0wriG6VAOKV6JccZe4de1a5Wfx
 0DMStaRaF8DPI1RZA5/l0pJZBGwI+fCWfl1EILFhjOWtEsmKDFihAGO8pjvumN0roC1g
 ZmXzoJ2cmYp/DCkNiXqkIG/aQD70bnVfHewHh7I1ON1uOBX2L16JrPcp41F8aHeEoDdM
 imNeBbB/IlhTeX+be4IPHrTZ/7SJbMBBEwirD6thEn0Dws6YsjLoO+KwBipxSP6x0+hq
 Cp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=XaEIMX7JSQ7XdJp9Bx4H+l3TjrmYA2lLGlfRFJ+aJs8=;
 b=qBRI4UDqyzlUe7iHAE9elTAg1z/ggGYI8fUfwKQ6KCKr8CEixfS/r16jIiEbwsQtL4
 8IYw8FVja+FiPrdvfdwPAJHCI3D53IU7n5AtetePTBajSP+4Jrit0ffuPmMSIayD3aat
 QCDU5AZJejPaOm45sf32BxOVOIK3fHauIfsgnKrdy0pOIQPmrP2/sfuTVPvGUmm73azH
 es5xImRXjTSl5Jnx/fdei/i2xvuiF9ONV3sqwhAQp/S4rL3ePSMvleLdqyQvdOCsA11S
 NRA3DMZWyOQQmBuuua4cpPiyqXPanAiWVZY/SZ+2+ooS9pXDBcHAU8T6zQmsXOzmJar9
 XQ5g==
X-Gm-Message-State: ANhLgQ3XT97UjGhe+aaQDtvhvjW5NU61uxLysOnh8tOeJIsnBO+KOxrH
 9FbPp1ffpjHlYCjUsGIPsmI=
X-Google-Smtp-Source: ADFU+vsbxVhXzylKko5woNevIURVyYKlruDoXcjj2ZmRXsUCV8pDBA2MCTLWxSD578WkP0FmPU6fuw==
X-Received: by 2002:a62:16c4:: with SMTP id 187mr21469943pfw.325.1584930420037; 
 Sun, 22 Mar 2020 19:27:00 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id l7sm11333447pff.204.2020.03.22.19.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 19:26:59 -0700 (PDT)
Date: Mon, 23 Mar 2020 12:23:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v8 06/14] powerpc/vas: Setup thread IRQ handler per VAS
 instance
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au
References: <1584598120.9256.15237.camel@hbabu-laptop>
 <1584598540.9256.15252.camel@hbabu-laptop>
In-Reply-To: <1584598540.9256.15252.camel@hbabu-laptop>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584926621.6b1zd5e2im.astroid@bobo.none>
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

Haren Myneni's on March 19, 2020 4:15 pm:
>=20
> Setup thread IRQ handler per each VAS instance. When NX sees a fault
> on CRB, kernel gets an interrupt and vas_fault_handler will be
> executed to process fault CRBs. Read all valid CRBs from fault FIFO,
> determine the corresponding send window from CRB and process fault
> requests.

Perhaps some more overview/why.

"If NX encounters a translation error when accessing the CRB or one
of addresses in the request, it raises an interrupt on the CPU to
handle the fault.


>=20
> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/vas-fault.c  | 90 +++++++++++++++++++++++=
++++++
>  arch/powerpc/platforms/powernv/vas-window.c | 60 +++++++++++++++++++
>  arch/powerpc/platforms/powernv/vas.c        | 49 +++++++++++++++-
>  arch/powerpc/platforms/powernv/vas.h        |  6 ++
>  4 files changed, 204 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/pl=
atforms/powernv/vas-fault.c
> index 4044998..1c6d5cc 100644
> --- a/arch/powerpc/platforms/powernv/vas-fault.c
> +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> @@ -11,6 +11,7 @@
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
>  #include <linux/kthread.h>
> +#include <linux/mmu_context.h>
>  #include <asm/icswx.h>
> =20
>  #include "vas.h"
> @@ -25,6 +26,95 @@
>  #define VAS_FAULT_WIN_FIFO_SIZE	(4 << 20)
> =20
>  /*
> + * Process valid CRBs in fault FIFO.
> + */
> +irqreturn_t vas_fault_thread_fn(int irq, void *data)

Are page faults the only reason why VAS would raise this interrupt? Is=20
NX really the only possible user of this, so you can have NX specifics
in here?

> +{
> +	struct vas_instance *vinst =3D data;
> +	struct coprocessor_request_block *crb, *entry;
> +	struct coprocessor_request_block buf;
> +	struct vas_window *window;
> +	unsigned long flags;
> +	void *fifo;
> +
> +	crb =3D &buf;

The below comment could just be moved to replace the one at the top of the
function. Can you explain slightly more about how the faults work, and=20
be more clear about what the coprocessor does versus what the host does? Th=
e
use of VAS and NX is a bit confusing too. VAS doesn't interrupt with
page faults, does it? NX has the page fault(s), and it requests VAS to
interrupt the host?

> +
> +	/*
> +	 * VAS can interrupt with multiple page faults. So process all
> +	 * valid CRBs within fault FIFO until reaches invalid CRB.

 When NX encounters a fault accessing a memory address for a particular
 CRB, it updates the nx_fault_stamp field in the CRB (to what?), and=20
 copies the CRB to the fault FIFO memory, then raises an interrupt on the
 CPU (memory ordering on the store and load sides are provided how?). NX
 can store multiple faults into the FIFO per interrupt (does it proceed
 asynchronously after the interrupt? what's the stopping condition?).

 When the CPU takes this interrupt, it reads the faulting CRBs from the
 FIFO and processes them in order until it reaches an invalid entry, FIFO
 empty (memory ordering how?). After each FIFO entry is processed, store
 to mark them as invalid. (How does NX resume after this?)

How is the fault actually even "handled" here? Nothing seems to be
actually done for them.

> +	 * NX updates nx_fault_stamp in CRB and pastes in fault FIFO.
> +	 * kernel retrives send window from parition send window ID
> +	 * (pswid) in nx_fault_stamp. So pswid should be valid and
> +	 * ccw[0] (in be) should be zero since this bit is reserved.
> +	 * If user space touches this bit, NX returns with "CRB format
> +	 * error".
> +	 *
> +	 * After reading CRB entry, invalidate it with pswid (set
> +	 * 0xffffffff) and ccw[0] (set to 1).

Al this is very busy and hard to decipher unambiguously. It should read
more like a spec, a precise sequence of things happening.

> +	 *
> +	 * In case kernel receives another interrupt with different page
> +	 * fault, CRBs are already processed by the previous handling. So
> +	 * will be returned from this function when it sees invalid CRB.
> +	 */

Ambiguous at best. Assuming the NX continues running asynchronously and
it's a usual kind of FIFO, I assume this means if the kernel gets=20
another interrupt for a page fault corresponding to a FIFO entry that
has already been processed by this fault.


> +	do {

Can you make this 'while (true)' or 'for (;;)' so you don't need to go
to the bottom to see it's an infinite loop.

> +		mutex_lock(&vinst->mutex);

What does this protect? Threaded handlers don't run concurrently for the
same request_threaded_irq?

> +
> +		spin_lock_irqsave(&vinst->fault_lock, flags);
> +		/*
> +		 * Advance the fault fifo pointer to next CRB.

The code below the comment isn't advancing the fault fifo pointer, it's
grabbing the current one. The pointer (fault_crbs) is advanced later.=20
You presumabl don't want to advance over an invalid entry.

> +		 * Use CRB_SIZE rather than sizeof(*crb) since the latter is
> +		 * aligned to CRB_ALIGN (256) but the CRB written to by VAS is
> +		 * only CRB_SIZE in len.
> +		 */
> +		fifo =3D vinst->fault_fifo + (vinst->fault_crbs * CRB_SIZE);
> +		entry =3D fifo;

Don't think you should really do this. It may be harmless in this case,
but the compiler expects the type to be aligned. Make it another type,
like coprocessor_fault_block or something?

> +
> +		if ((entry->stamp.nx.pswid =3D=3D cpu_to_be32(FIFO_INVALID_ENTRY))
> +			|| (entry->ccw & cpu_to_be32(CCW0_INVALID))) {
> +			atomic_set(&vinst->faults_in_progress, 0);
> +			spin_unlock_irqrestore(&vinst->fault_lock, flags);

So what does the fault_lock protect? The only data it protects is=20
faults_in_progress (vs the hard interrupt handler), which doesn't=20
achieve anything by itself, so I guess it also prevents the hard irq
handler from returning until the handler here has checked that the
fault FIFO is empty then returns IRQ_HANDLED? That seems fine (so long
as memory ordering details are okay), but it should be documented
that way.

Also why is the hard handler in a different file? Makes it harder to
see how this works at a glance.

faults_in_progress does not have to be atomic because it's always
accessed under the lock. And IMO it should have a better name. If the
NX can be causing more faults as we go, it really doesn't indicate
anything about faults. It's whether or not the threaded handler is
currently woken and processing faults.

> +			mutex_unlock(&vinst->mutex);
> +			return IRQ_HANDLED;
> +		}
> +
> +		spin_unlock_irqrestore(&vinst->fault_lock, flags);
> +		vinst->fault_crbs++;
> +		if (vinst->fault_crbs =3D=3D (vinst->fault_fifo_size / CRB_SIZE))
> +			vinst->fault_crbs =3D 0;
> +
> +		memcpy(crb, fifo, CRB_SIZE);
> +		entry->stamp.nx.pswid =3D cpu_to_be32(FIFO_INVALID_ENTRY);
> +		entry->ccw |=3D cpu_to_be32(CCW0_INVALID);
> +		mutex_unlock(&vinst->mutex);
> +
> +		pr_devel("VAS[%d] fault_fifo %p, fifo %p, fault_crbs %d\n",
> +				vinst->vas_id, vinst->fault_fifo, fifo,
> +				vinst->fault_crbs);
> +
> +		window =3D vas_pswid_to_window(vinst,
> +				be32_to_cpu(crb->stamp.nx.pswid));
> +
> +		if (IS_ERR(window)) {
> +			/*
> +			 * We got an interrupt about a specific send
> +			 * window but we can't find that window and we can't
> +			 * even clean it up (return credit).
> +			 * But we should not get here.
> +			 */
> +			pr_err("VAS[%d] fault_fifo %p, fifo %p, pswid 0x%x, fault_crbs %d bad=
 CRB?\n",
> +				vinst->vas_id, vinst->fault_fifo, fifo,
> +				be32_to_cpu(crb->stamp.nx.pswid),
> +				vinst->fault_crbs);
> +
> +			WARN_ON_ONCE(1);
> +			atomic_set(&vinst->faults_in_progress, 0);
> +			return IRQ_HANDLED;

Shouldn't get here but you have a handler for it, so it should try to
be graceful. Keep processing the rest of the FIFO until it's empty
otherwise you have a missed wakeup here? Probably less code too, just
delete the last 2 lines.

Thanks,
Nick

> +		}
> +
> +	} while (true);
> +}
> +
> +/*
>   * Fault window is opened per VAS instance. NX pastes fault CRB in fault
>   * FIFO upon page faults.
>   */
> diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/p=
latforms/powernv/vas-window.c
> index 1783fa9..1f31c18 100644
> --- a/arch/powerpc/platforms/powernv/vas-window.c
> +++ b/arch/powerpc/platforms/powernv/vas-window.c
> @@ -1040,6 +1040,15 @@ struct vas_window *vas_tx_win_open(int vasid, enum=
 vas_cop_type cop,
>  		}
>  	} else {
>  		/*
> +		 * Interrupt hanlder or fault window setup failed. Means
> +		 * NX can not generate fault for page fault. So not
> +		 * opening for user space tx window.
> +		 */
> +		if (!vinst->virq) {
> +			rc =3D -ENODEV;
> +			goto free_window;
> +		}
> +		/*
>  		 * A user mapping must ensure that context switch issues
>  		 * CP_ABORT for this thread.
>  		 */
> @@ -1254,3 +1263,54 @@ int vas_win_close(struct vas_window *window)
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(vas_win_close);
> +
> +struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
> +		uint32_t pswid)
> +{
> +	struct vas_window *window;
> +	int winid;
> +
> +	if (!pswid) {
> +		pr_devel("%s: called for pswid 0!\n", __func__);
> +		return ERR_PTR(-ESRCH);
> +	}
> +
> +	decode_pswid(pswid, NULL, &winid);
> +
> +	if (winid >=3D VAS_WINDOWS_PER_CHIP)
> +		return ERR_PTR(-ESRCH);
> +
> +	/*
> +	 * If application closes the window before the hardware
> +	 * returns the fault CRB, we should wait in vas_win_close()
> +	 * for the pending requests. so the window must be active
> +	 * and the process alive.
> +	 *
> +	 * If its a kernel process, we should not get any faults and
> +	 * should not get here.
> +	 */
> +	window =3D vinst->windows[winid];
> +
> +	if (!window) {
> +		pr_err("PSWID decode: Could not find window for winid %d pswid %d vins=
t 0x%p\n",
> +			winid, pswid, vinst);
> +		return NULL;
> +	}
> +
> +	/*
> +	 * Do some sanity checks on the decoded window.  Window should be
> +	 * NX GZIP user send window. FTW windows should not incur faults
> +	 * since their CRBs are ignored (not queued on FIFO or processed
> +	 * by NX).
> +	 */
> +	if (!window->tx_win || !window->user_win || !window->nx_win ||
> +			window->cop =3D=3D VAS_COP_TYPE_FAULT ||
> +			window->cop =3D=3D VAS_COP_TYPE_FTW) {
> +		pr_err("PSWID decode: id %d, tx %d, user %d, nx %d, cop %d\n",
> +			winid, window->tx_win, window->user_win,
> +			window->nx_win, window->cop);
> +		WARN_ON(1);
> +	}
> +
> +	return window;
> +}
> diff --git a/arch/powerpc/platforms/powernv/vas.c b/arch/powerpc/platform=
s/powernv/vas.c
> index 557c8e4..3d9ba58 100644
> --- a/arch/powerpc/platforms/powernv/vas.c
> +++ b/arch/powerpc/platforms/powernv/vas.c
> @@ -14,6 +14,8 @@
>  #include <linux/of_platform.h>
>  #include <linux/of_address.h>
>  #include <linux/of.h>
> +#include <linux/irqdomain.h>
> +#include <linux/interrupt.h>
>  #include <asm/prom.h>
>  #include <asm/xive.h>
> =20
> @@ -24,9 +26,53 @@
> =20
>  static DEFINE_PER_CPU(int, cpu_vas_id);
> =20
> +static irqreturn_t vas_fault_handler(int irq, void *dev_id)
> +{
> +	struct vas_instance *vinst =3D dev_id;
> +	irqreturn_t ret =3D IRQ_WAKE_THREAD;
> +	unsigned long flags;
> +
> +	/*
> +	 * NX can generate an interrupt for multiple faults. So the
> +	 * fault handler thread process all CRBs until finds invalid
> +	 * entry. In case if NX sees continuous faults, it is possible
> +	 * that the thread function entered with the first interrupt
> +	 * can execute and process all valid CRBs.
> +	 * So wake up thread only if the fault thread is not in progress.
> +	 */
> +	spin_lock_irqsave(&vinst->fault_lock, flags);
> +
> +	if (atomic_read(&vinst->faults_in_progress))
> +		ret =3D IRQ_HANDLED;
> +	else
> +		atomic_set(&vinst->faults_in_progress, 1);
> +
> +	spin_unlock_irqrestore(&vinst->fault_lock, flags);
> +
> +	return ret;
> +}
> +
>  static int vas_irq_fault_window_setup(struct vas_instance *vinst)
>  {
> -	return vas_setup_fault_window(vinst);
> +	char devname[64];
> +	int rc =3D 0;
> +
> +	snprintf(devname, sizeof(devname), "vas-%d", vinst->vas_id);
> +	rc =3D request_threaded_irq(vinst->virq, vas_fault_handler,
> +				vas_fault_thread_fn, 0, devname, vinst);
> +
> +	if (rc) {
> +		pr_err("VAS[%d]: Request IRQ(%d) failed with %d\n",
> +				vinst->vas_id, vinst->virq, rc);
> +		goto out;
> +	}
> +
> +	rc =3D vas_setup_fault_window(vinst);
> +	if (rc)
> +		free_irq(vinst->virq, vinst);
> +
> +out:
> +	return rc;
>  }
> =20
>  static int init_vas_instance(struct platform_device *pdev)
> @@ -109,6 +155,7 @@ static int init_vas_instance(struct platform_device *=
pdev)
>  	list_add(&vinst->node, &vas_instances);
>  	mutex_unlock(&vas_mutex);
> =20
> +	spin_lock_init(&vinst->fault_lock);
>  	/*
>  	 * IRQ and fault handling setup is needed only for user space
>  	 * send windows.
> diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platform=
s/powernv/vas.h
> index 6c4baf5..ecae7cd 100644
> --- a/arch/powerpc/platforms/powernv/vas.h
> +++ b/arch/powerpc/platforms/powernv/vas.h
> @@ -326,7 +326,10 @@ struct vas_instance {
> =20
>  	u64 irq_port;
>  	int virq;
> +	int fault_crbs;
>  	int fault_fifo_size;
> +	atomic_t faults_in_progress;
> +	spinlock_t fault_lock;
>  	void *fault_fifo;
>  	struct vas_window *fault_win; /* Fault window */
> =20
> @@ -424,6 +427,9 @@ struct vas_winctx {
>  extern void vas_window_init_dbgdir(struct vas_window *win);
>  extern void vas_window_free_dbgdir(struct vas_window *win);
>  extern int vas_setup_fault_window(struct vas_instance *vinst);
> +extern irqreturn_t vas_fault_thread_fn(int irq, void *data);
> +extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst=
,
> +						uint32_t pswid);
> =20
>  static inline void vas_log_write(struct vas_window *win, char *name,
>  			void *regptr, u64 val)
> --=20
> 1.8.3.1
>=20
>=20
>=20
>=20
=
