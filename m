Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F8F3A77F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:26:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G40Hx3WhMz3bwZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 17:26:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dMv7xI9x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dMv7xI9x; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G40HQ5t2tz3048
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 17:26:26 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15F75LPn066048; Tue, 15 Jun 2021 03:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=W1eEDicscE0biyRUSl9dgwGh/xMGC4oDv+0cOmDQJMI=;
 b=dMv7xI9xwsv7eT9hnLqOGEx1uiEurtvwYZ5xt5brnIL9a+IWd+jN42wDGdAjllcNsLdY
 tM9yi3QtF10mmdh76UMUPszpzO9LHUTF4OIsLzhiopY0ok8/3Y2uD8HBxWGqhBcK0u79
 PV5mWUh+a9crRwcmiP1oMszUmYZDOovf93U0jccB41LIXnLfXBX/c2iDenEmF9sJPWJ5
 Mvr+EwcAdLLw98a0NzLkYHoMpw80SL2W9dmBTtgaHqC7My96l+0h40ViOa7kYq7Ra9F7
 xaYe+Hd8WF4yOMYe+6m4RqtQHxohgXpn/fP/suk02lz+qp4bNIVvG73Io95MoY8gZG+X ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396ng3c0kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 03:26:18 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15F75ZX3067286;
 Tue, 15 Jun 2021 03:26:17 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396ng3c0k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 03:26:17 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15F7I6WG013817;
 Tue, 15 Jun 2021 07:26:16 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 394mj9nry7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 07:26:16 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15F7QGeD15008226
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 07:26:16 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E4A2B206C;
 Tue, 15 Jun 2021 07:26:16 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C14C3B2064;
 Tue, 15 Jun 2021 07:26:14 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.180.39])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 07:26:14 +0000 (GMT)
Message-ID: <91d139adcbd9e4851fdb11d30888f5f5a923b764.camel@linux.ibm.com>
Subject: Re: [PATCH v5 12/17] powerpc/pseries/vas: Integrate API with
 open/close windows
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Tue, 15 Jun 2021 00:26:12 -0700
In-Reply-To: <1623638159.6pp87imz6a.astroid@bobo.none>
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
 <58c2f9debeff2ff6515ea950ebdd6483c147c843.camel@linux.ibm.com>
 <1623638159.6pp87imz6a.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zibvKjPVy9DDCZLZfhghDnYsV_4unums
X-Proofpoint-GUID: xmDcos6AX-TLy-q9oSlYZRe6mVrBoKa8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_04:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150042
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

On Mon, 2021-06-14 at 12:55 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of June 13, 2021 9:02 pm:
> > This patch adds VAS window allocatioa/close with the corresponding
> > hcalls. Also changes to integrate with the existing user space VAS
> > API and provide register/unregister functions to NX pseries driver.
> > 
> > The driver register function is used to create the user space
> > interface (/dev/crypto/nx-gzip) and unregister to remove this
> > entry.
> > 
> > The user space process opens this device node and makes an ioctl
> > to allocate VAS window. The close interface is used to deallocate
> > window.
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/vas.h          |   4 +
> >  arch/powerpc/platforms/pseries/Makefile |   1 +
> >  arch/powerpc/platforms/pseries/vas.c    | 223
> > ++++++++++++++++++++++++
> >  3 files changed, 228 insertions(+)
> > 
> > diff --git a/arch/powerpc/include/asm/vas.h
> > b/arch/powerpc/include/asm/vas.h
> > index eefc758d8cd4..9d5646d721c4 100644
> > --- a/arch/powerpc/include/asm/vas.h
> > +++ b/arch/powerpc/include/asm/vas.h
> > @@ -254,6 +254,10 @@ struct vas_all_caps {
> >  	u64     feat_type;
> >  };
> >  
> > +int h_query_vas_capabilities(const u64 hcall, u8 query_type, u64
> > result);
> > +int vas_register_api_pseries(struct module *mod,
> > +			     enum vas_cop_type cop_type, const char
> > *name);
> > +void vas_unregister_api_pseries(void);
> >  #endif
> >  
> >  /*
> > diff --git a/arch/powerpc/platforms/pseries/Makefile
> > b/arch/powerpc/platforms/pseries/Makefile
> > index c8a2b0b05ac0..4cda0ef87be0 100644
> > --- a/arch/powerpc/platforms/pseries/Makefile
> > +++ b/arch/powerpc/platforms/pseries/Makefile
> > @@ -30,3 +30,4 @@ obj-$(CONFIG_PPC_SVM)		+= svm.o
> >  obj-$(CONFIG_FA_DUMP)		+= rtas-fadump.o
> >  
> >  obj-$(CONFIG_SUSPEND)		+= suspend.o
> > +obj-$(CONFIG_PPC_VAS)		+= vas.o
> > diff --git a/arch/powerpc/platforms/pseries/vas.c
> > b/arch/powerpc/platforms/pseries/vas.c
> > index 98109a13f1c2..fe375f7a7029 100644
> > --- a/arch/powerpc/platforms/pseries/vas.c
> > +++ b/arch/powerpc/platforms/pseries/vas.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/export.h>
> >  #include <linux/types.h>
> >  #include <linux/delay.h>
> > +#include <linux/slab.h>
> >  #include <asm/machdep.h>
> >  #include <asm/hvcall.h>
> >  #include <asm/plpar_wrappers.h>
> > @@ -187,6 +188,228 @@ int h_query_vas_capabilities(const u64 hcall,
> > u8 query_type, u64 result)
> >  		return -EIO;
> >  	}
> >  }
> > +EXPORT_SYMBOL_GPL(h_query_vas_capabilities);
> > +
> > +/*
> > + * Allocate window and setup IRQ mapping.
> > + */
> > +static int allocate_setup_window(struct pseries_vas_window *txwin,
> > +				 u64 *domain, u8 wintype)
> > +{
> > +	int rc;
> > +
> > +	rc = h_allocate_vas_window(txwin, domain, wintype,
> > DEF_WIN_CREDS);
> > +	if (rc)
> > +		return rc;
> > +
> > +	txwin->vas_win.wcreds_max = DEF_WIN_CREDS;
> > +
> > +	return 0;
> > +}
> > +
> > +static struct vas_window *vas_allocate_window(struct
> > vas_tx_win_open_attr *uattr,
> > +					      enum vas_cop_type
> > cop_type)
> > +{
> > +	long domain[PLPAR_HCALL9_BUFSIZE] = {VAS_DEFAULT_DOMAIN_ID};
> > +	struct vas_ct_caps *ct_caps;
> > +	struct vas_caps *caps;
> > +	struct pseries_vas_window *txwin;
> > +	int rc;
> > +
> > +	txwin = kzalloc(sizeof(*txwin), GFP_KERNEL);
> > +	if (!txwin)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	/*
> > +	 * A VAS window can have many credits which means that many
> > +	 * requests can be issued simultaneously. But phyp restricts
> > +	 * one credit per window.
> > +	 * phyp introduces 2 different types of credits:
> > +	 * Default credit type (Uses normal priority FIFO):
> > +	 *	A limited number of credits are assigned to partitions
> > +	 *	based on processor entitlement. But these credits may be
> > +	 *	over-committed on a system depends on whether the CPUs
> > +	 *	are in shared or dedicated modes - that is, more requests
> > +	 *	may be issued across the system than NX can service at
> > +	 *	once which can result in paste command failure (RMA_busy).
> > +	 *	Then the process has to resend requests or fall-back to
> > +	 *	SW compression.
> > +	 * Quality of Service (QoS) credit type (Uses high priority
> > FIFO):
> > +	 *	To avoid NX HW contention, the system admins can assign
> > +	 *	QoS credits for each LPAR so that this partition is
> > +	 *	guaranteed access to NX resources. These credits are
> > +	 *	assigned to partitions via the HMC.
> > +	 *	Refer PAPR for more information.
> > +	 *
> > +	 * Allocate window with QoS credits if user requested.
> > Otherwise
> > +	 * default credits are used.
> > +	 */
> > +	if (uattr->flags & VAS_TX_WIN_FLAG_QOS_CREDIT)
> > +		caps = &vascaps[VAS_GZIP_QOS_FEAT_TYPE];
> > +	else
> > +		caps = &vascaps[VAS_GZIP_DEF_FEAT_TYPE];
> > +
> > +	ct_caps = &caps->caps;
> > +
> > +	if (atomic_inc_return(&ct_caps->used_lpar_creds) >
> > +			atomic_read(&ct_caps->target_lpar_creds)) {
> > +		pr_err("Credits are not available to allocate
> > window\n");
> > +		rc = -EINVAL;
> > +		goto out;
> > +	}
> > +
> > +	/*
> > +	 * The user space is requesting to allocate a window on a VAS
> > +	 * instance (or chip) where the process is executing.
> > +	 * On powerVM, domain values are passed to pHyp to select chip
> > /
> > +	 * VAS instance. Useful if the process is affinity to NUMA
> > node.
> > +	 * pHyp selects VAS instance if VAS_DEFAULT_DOMAIN_ID (-1) is
> > +	 * passed for domain values.
> > +	 */
> 
> s/powerVM/PowerVM
> s/pHyp/PowerVM
> 
> You could also just call it the hypervisor. KVM may not implement
> the 
> hcalls now, but in future it could.
> 
> > +	if (uattr->vas_id == -1) {
> 
> Should the above comment fit under here? vas_id == -1 means
> userspace 
> asks for any VAS but preferably a local one?
> 
> > +		/*
> > +		 * To allocate VAS window, pass same domain values
> > returned
> > +		 * from this HCALL.
> > +		 */
> 
> Then you could merge it with this comment and make it a bit clearer:
> the h_allocate_vas_window hcall is defined to take a domain as
> specified by h_home_node_associativity, so no conversions or
> unpacking
> needs to be done.
> 
> > +		rc = plpar_hcall9(H_HOME_NODE_ASSOCIATIVITY, domain,
> > +				  VPHN_FLAG_VCPU, smp_processor_id());
> > +		if (rc != H_SUCCESS) {
> > +			pr_err("HCALL(%x): failed with ret(%d)\n",
> > +			       H_HOME_NODE_ASSOCIATIVITY, rc);
> > +			goto out;
> > +		}
> > +	}
> > +
> > +	/*
> > +	 * Allocate / Deallocate window HCALLs and setup / free IRQs
> > +	 * have to be protected with mutex.
> > +	 * Open VAS window: Allocate window HCALL and setup IRQ
> > +	 * Close VAS window: Deallocate window HCALL and free IRQ
> > +	 *	The hypervisor waits until all NX requests are
> > +	 *	completed before closing the window. So expects OS
> > +	 *	to handle NX faults, means IRQ can be freed only
> > +	 *	after the deallocate window HCALL is returned.
> > +	 * So once the window is closed with deallocate HCALL before
> > +	 * the IRQ is freed, it can be assigned to new allocate
> > +	 * HCALL with the same fault IRQ by the hypervisor. It can
> > +	 * result in setup IRQ fail for the new window since the
> > +	 * same fault IRQ is not freed by the OS.
> > +	 */
> > +	mutex_lock(&vas_pseries_mutex);
> 
> Why? What's the mutex protecting here?
This mutex is protecting Allocate/ Deallocate HCAlls and setup/free
IRQ. Basically once the window is opened and setup IRQ successfully,
makes sure same IRQ is not assigned to otherwindow before the IRQ is
freed in OS. 

Allocate window: 
	Allocate window HCALL
	setup IRQ

Deallocate window:
	Deallocate window HCALL - The hypervisor waits all credits are
returned including any faults. Disable window on this VAS so that do
not take new requests and wait for all pending requests (faults are
processed) 
	free IRQ (We can not free IRQ before the HCALL so that pending
faults can be processed and credits returned)

So if we do not jave mutex, possible that same fault IRQ may be
assigned to different window open HCALL before it is actually freed in
OS.

Process A:
Allocate window HCALL (winID 123)
Setup IRQ (IRQ# 321)
Process requests
Deallocate HCALL(winID 123)       Process B:
                                    Allocate window HCALL (winID 123)
                                    setup IRQ (IRQ# 321) -- will fail.
Free IRQ (IRQ#321)

                        
> 
> > +	rc = allocate_setup_window(txwin, (u64 *)&domain[0],
> > +				   ct_caps->win_type);
> 
> If you define the types to be the same, can you avoid this casting?
> allocate_setup_window specifically needs an array of 
> PLPAR_HCALL9_BUFSIZE longs.

Yes H_HOME_NODE_ASSOCIATIVITY returns longs (PLPAR_HCALL9_BUFSIZE) but
H_ALLOCATE_VAS_WINDOW expects u64.

Syntax:
int64 /* H_Success, H_Parameter, H_Resource, H_Constrained */
/* H_Cop_Hw, H_Unsupported, H_Busy */
/* H_LongBusyOrder1mSec, LongBusyOrder10mSec */
hcall(const uint64 H_ALLOCATE_VAS_WINDOW /* Allocate a VAS window */
uint8 vasWindowType, /* The type of VAS window to allocate */
uint16 numCredits, /* Number of credits to assign to the window */
uint64 desiredAssociativityDomainIdentifier1, /* Associativity Domain
Identifier Doubleword 1 */
uint64 desiredAssociativityDomainIdentifier2, /* Associativity Domain
Identifier Doubleword 2 */
uint64 desiredAssociativityDomainIdentifier3, /* Associativity Domain
Identifier Doubleword 3 */
uint64 desiredAssociativityDomainIdentifier4, /* Associativity Domain
Identifier Doubleword 4 */
uint64 desiredAssociativityDomainIdentifier5, /* Associativity Domain
Identifier Doubleword 5 */
uint64 desiredAssociativityDomainIdentifier6) /* Associativity Domain
Identifier Doubleword 6 */

> 
> > +	mutex_unlock(&vas_pseries_mutex);
> > +	if (rc)
> > +		goto out;
> > +
> > +	/*
> > +	 * Modify window and it is ready to use.
> > +	 */
> > +	rc = h_modify_vas_window(txwin);
> > +	if (!rc)
> > +		rc = get_vas_user_win_ref(&txwin->vas_win.task_ref);
> > +	if (rc)
> > +		goto out_free;
> > +
> > +	vas_user_win_add_mm_context(&txwin->vas_win.task_ref);
> > +	txwin->win_type = ct_caps->win_type;
> > +	mutex_lock(&vas_pseries_mutex);
> > +	list_add(&txwin->win_list, &caps->list);
> > +	mutex_unlock(&vas_pseries_mutex);
> > +
> > +	return &txwin->vas_win;
> > +
> > +out_free:
> > +	h_deallocate_vas_window(txwin->vas_win.winid);
> 
> No mutex here in this deallocate hcall.

We do not need mutex just for this hcall which is executing during
failure. Need mutex only for the code patch as explained above. 

If the window open is not returned to user space successfully, window
close path will be:

 free_irq_setup(txwin);
 h_deallocate_vas_window(txwin->vas_win.winid);


> 
> I suspect you don't actually need the mutex for the hcalls
> themselves, 
> but the list manipulations. I would possibly consider putting 
> used_lpar_creds under that same lock rather than making it atomic and
> playing lock free games, unless you really need to.
> 
> Also... "creds". credentials? credits, right? Don't go through and 
> change everything now, but not skimping on naming helps a lot with
> reading code that you're not familiar with. All the vas/nx stuff
> could probably do with a pass to make the names a bit easier.

Yes creds is for credits. We have names like credits and capabilities
for VAS/NX. Using creds for credits and caps for capabilities. creds is
already used in the existing code.

> 
> (creds isn't so bad, "ct" for "coprocessor type" is pretty obscure 
> though).

So can I use 'copt' coprocessor type?

Thanks
Haren


> 
> Thanks,
> Nick
> 
> > +out:
> > +	atomic_dec(&ct_caps->used_lpar_creds);
> > +	kfree(txwin);
> > +	return ERR_PTR(rc);
> > +}
> > +
> > +static u64 vas_paste_address(struct vas_window *vwin)
> > +{
> > +	struct pseries_vas_window *win;
> > +
> > +	win = container_of(vwin, struct pseries_vas_window, vas_win);
> > +	return win->win_addr;
> > +}
> > +
> > +static int deallocate_free_window(struct pseries_vas_window *win)
> > +{
> > +	int rc = 0;
> > +
> > +	rc = h_deallocate_vas_window(win->vas_win.winid);
> > +
> > +	return rc;
> > +}
> > +
> > +static int vas_deallocate_window(struct vas_window *vwin)
> > +{
> > +	struct pseries_vas_window *win;
> > +	struct vas_ct_caps *caps;
> > +	int rc = 0;
> > +
> > +	if (!vwin)
> > +		return -EINVAL;
> > +
> > +	win = container_of(vwin, struct pseries_vas_window, vas_win);
> > +
> > +	/* Should not happen */
> > +	if (win->win_type >= VAS_MAX_FEAT_TYPE) {
> > +		pr_err("Window (%u): Invalid window type %u\n",
> > +				vwin->winid, win->win_type);
> > +		return -EINVAL;
> > +	}
> > +
> > +	caps = &vascaps[win->win_type].caps;
> > +	mutex_lock(&vas_pseries_mutex);
> > +	rc = deallocate_free_window(win);
> > +	if (rc) {
> > +		mutex_unlock(&vas_pseries_mutex);
> > +		return rc;
> > +	}
> > +
> > +	list_del(&win->win_list);
> > +	atomic_dec(&caps->used_lpar_creds);
> > +	mutex_unlock(&vas_pseries_mutex);
> > +
> > +	put_vas_user_win_ref(&vwin->task_ref);
> > +	mm_context_remove_vas_window(vwin->task_ref.mm);
> > +
> > +	kfree(win);
> > +	return 0;
> > +}
> > +
> > +static const struct vas_user_win_ops vops_pseries = {
> > +	.open_win	= vas_allocate_window,	/* Open and configure
> > window */
> > +	.paste_addr	= vas_paste_address,	/* To do copy/paste */
> > +	.close_win	= vas_deallocate_window, /* Close window */
> > +};
> > +
> > +/*
> > + * Supporting only nx-gzip coprocessor type now, but this API code
> > + * extended to other coprocessor types later.
> > + */
> > +int vas_register_api_pseries(struct module *mod, enum vas_cop_type
> > cop_type,
> > +			     const char *name)
> > +{
> > +	int rc;
> > +
> > +	if (!copypaste_feat)
> > +		return -ENOTSUPP;
> > +
> > +	rc = vas_register_coproc_api(mod, cop_type, name,
> > &vops_pseries);
> > +
> > +	return rc;
> > +}
> > +EXPORT_SYMBOL_GPL(vas_register_api_pseries);
> > +
> > +void vas_unregister_api_pseries(void)
> > +{
> > +	vas_unregister_coproc_api();
> > +}
> > +EXPORT_SYMBOL_GPL(vas_unregister_api_pseries);
> >  
> >  /*
> >   * Get the specific capabilities based on the feature type.
> > -- 
> > 2.18.2
> > 
> > 
> > 

