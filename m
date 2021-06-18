Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2A63AC0B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 04:09:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5j6h58bXz3bvs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 12:09:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eL+S4PBN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=eL+S4PBN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5j673wF2z309g
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 12:09:18 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15I23PoW122777; Thu, 17 Jun 2021 22:09:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=CDvDUJ9lGuEW5fVkMiSdllq6N5HsFkKaefCea8olEq8=;
 b=eL+S4PBN1iQsweJKQ9bBAubz64WXn0nRrVI3/IgR97s7k3kwiEzgskakNT2mSQlE1HCS
 XSgbkYavYxMjDL7mNS2FyvT5FWUk/b0OlvBhW52+HAFuE+lfG5cd9z8c3EN/tFQGkwpX
 u88W3e89hgPxHAec1u0botmY5W2edhMgTtN7GSjmrQQmqxFEGhVjYqIpgz8U9Mlvufjc
 cKVJRd4zxfzlKh6q7+cBmeA4ZgDARl3eIvthtMf7MAan4CE5/A4IVKQ1+8BIfUXoXj41
 UqeZnl1uWEPES6fMl43HWQGxb0bmQzWziEJ3JNYuXnH8RgeWFhUwLHmGlGruVcwKrg6R Kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398gy0a5c8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 22:09:08 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15I23mQo124028;
 Thu, 17 Jun 2021 22:09:07 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398gy0a5bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 22:09:07 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15I21nZk010160;
 Fri, 18 Jun 2021 02:09:06 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 394mjah2kp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 02:09:06 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15I295Hf24641942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 02:09:05 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FBF313605D;
 Fri, 18 Jun 2021 02:09:05 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47907136055;
 Fri, 18 Jun 2021 02:09:04 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.180.39])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 18 Jun 2021 02:09:04 +0000 (GMT)
Message-ID: <a19e7839316c9ec4f7901e97b551fcf4219de82f.camel@linux.ibm.com>
Subject: Re: [PATCH v6 13/17] powerpc/pseries/vas: Setup IRQ and fault handling
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Thu, 17 Jun 2021 19:09:01 -0700
In-Reply-To: <1623972635.u8jj6g26re.astroid@bobo.none>
References: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
 <b8fc66dcb783d06a099a303e5cfc69087bb3357a.camel@linux.ibm.com>
 <1623972635.u8jj6g26re.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PzkMWa4scMM60VapGycZCKD4jBky2VXF
X-Proofpoint-GUID: L-6EETqXBBZPgrS1ivjT0QnKbUva0FnR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_17:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106180008
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

On Fri, 2021-06-18 at 09:34 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of June 18, 2021 6:37 am:
> > NX generates an interrupt when sees a fault on the user space
> > buffer and the hypervisor forwards that interrupt to OS. Then
> > the kernel handles the interrupt by issuing H_GET_NX_FAULT hcall
> > to retrieve the fault CRB information.
> > 
> > This patch also adds changes to setup and free IRQ per each
> > window and also handles the fault by updating the CSB.
> 
> In as much as this pretty well corresponds to the PowerNV code
> AFAIKS,
> it looks okay to me.
> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> 
> Could you have an irq handler in your ops vector and have 
> the core code set up the irq and call your handler, so the Linux irq
> handling is in one place? Not something for this series, I was just
> wondering.

Not possible to have common core code for IRQ  setup. 

PowerNV: Every VAS instance will be having IRQ and this setup will be
done during initialization (system boot). A fault FIFO will be assigned
for each instance and registered to VAS so that VAS/NX writes fault CRB
into this FIFO.  

PowerVM: Each window will have an IRQ and the setup will be done during
window open. 

Thanks
Haren

> 
> Thanks,
> Nick
> 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/pseries/vas.c | 102
> > +++++++++++++++++++++++++++
> >  1 file changed, 102 insertions(+)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/vas.c
> > b/arch/powerpc/platforms/pseries/vas.c
> > index f5a44f2f0e99..3385b5400cc6 100644
> > --- a/arch/powerpc/platforms/pseries/vas.c
> > +++ b/arch/powerpc/platforms/pseries/vas.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/types.h>
> >  #include <linux/delay.h>
> >  #include <linux/slab.h>
> > +#include <linux/interrupt.h>
> >  #include <asm/machdep.h>
> >  #include <asm/hvcall.h>
> >  #include <asm/plpar_wrappers.h>
> > @@ -155,6 +156,50 @@ int h_query_vas_capabilities(const u64 hcall,
> > u8 query_type, u64 result)
> >  }
> >  EXPORT_SYMBOL_GPL(h_query_vas_capabilities);
> >  
> > +/*
> > + * hcall to get fault CRB from the hypervisor.
> > + */
> > +static int h_get_nx_fault(u32 winid, u64 buffer)
> > +{
> > +	long rc;
> > +
> > +	rc = plpar_hcall_norets(H_GET_NX_FAULT, winid, buffer);
> > +
> > +	if (rc == H_SUCCESS)
> > +		return 0;
> > +
> > +	pr_err("H_GET_NX_FAULT error: %ld, winid %u, buffer 0x%llx\n",
> > +		rc, winid, buffer);
> > +	return -EIO;
> > +
> > +}
> > +
> > +/*
> > + * Handle the fault interrupt.
> > + * When the fault interrupt is received for each window, query the
> > + * hypervisor to get the fault CRB on the specific fault. Then
> > + * process the CRB by updating CSB or send signal if the user
> > space
> > + * CSB is invalid.
> > + * Note: The hypervisor forwards an interrupt for each fault
> > request.
> > + *	So one fault CRB to process for each H_GET_NX_FAULT hcall.
> > + */
> > +irqreturn_t pseries_vas_fault_thread_fn(int irq, void *data)
> > +{
> > +	struct pseries_vas_window *txwin = data;
> > +	struct coprocessor_request_block crb;
> > +	struct vas_user_win_ref *tsk_ref;
> > +	int rc;
> > +
> > +	rc = h_get_nx_fault(txwin->vas_win.winid,
> > (u64)virt_to_phys(&crb));
> > +	if (!rc) {
> > +		tsk_ref = &txwin->vas_win.task_ref;
> > +		vas_dump_crb(&crb);
> > +		vas_update_csb(&crb, tsk_ref);
> > +	}
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> >  /*
> >   * Allocate window and setup IRQ mapping.
> >   */
> > @@ -166,10 +211,51 @@ static int allocate_setup_window(struct
> > pseries_vas_window *txwin,
> >  	rc = h_allocate_vas_window(txwin, domain, wintype,
> > DEF_WIN_CREDS);
> >  	if (rc)
> >  		return rc;
> > +	/*
> > +	 * On PowerVM, the hypervisor setup and forwards the fault
> > +	 * interrupt per window. So the IRQ setup and fault handling
> > +	 * will be done for each open window separately.
> > +	 */
> > +	txwin->fault_virq = irq_create_mapping(NULL, txwin->fault_irq);
> > +	if (!txwin->fault_virq) {
> > +		pr_err("Failed irq mapping %d\n", txwin->fault_irq);
> > +		rc = -EINVAL;
> > +		goto out_win;
> > +	}
> > +
> > +	txwin->name = kasprintf(GFP_KERNEL, "vas-win-%d",
> > +				txwin->vas_win.winid);
> > +	if (!txwin->name) {
> > +		rc = -ENOMEM;
> > +		goto out_irq;
> > +	}
> > +
> > +	rc = request_threaded_irq(txwin->fault_virq, NULL,
> > +				  pseries_vas_fault_thread_fn,
> > IRQF_ONESHOT,
> > +				  txwin->name, txwin);
> > +	if (rc) {
> > +		pr_err("VAS-Window[%d]: Request IRQ(%u) failed with
> > %d\n",
> > +		       txwin->vas_win.winid, txwin->fault_virq, rc);
> > +		goto out_free;
> > +	}
> >  
> >  	txwin->vas_win.wcreds_max = DEF_WIN_CREDS;
> >  
> >  	return 0;
> > +out_free:
> > +	kfree(txwin->name);
> > +out_irq:
> > +	irq_dispose_mapping(txwin->fault_virq);
> > +out_win:
> > +	h_deallocate_vas_window(txwin->vas_win.winid);
> > +	return rc;
> > +}
> > +
> > +static inline void free_irq_setup(struct pseries_vas_window
> > *txwin)
> > +{
> > +	free_irq(txwin->fault_virq, txwin);
> > +	kfree(txwin->name);
> > +	irq_dispose_mapping(txwin->fault_virq);
> >  }
> >  
> >  static struct vas_window *vas_allocate_window(int vas_id, u64
> > flags,
> > @@ -284,6 +370,11 @@ static struct vas_window
> > *vas_allocate_window(int vas_id, u64 flags,
> >  	return &txwin->vas_win;
> >  
> >  out_free:
> > +	/*
> > +	 * Window is not operational. Free IRQ before closing
> > +	 * window so that do not have to hold mutex.
> > +	 */
> > +	free_irq_setup(txwin);
> >  	h_deallocate_vas_window(txwin->vas_win.winid);
> >  out:
> >  	atomic_dec(&cop_feat_caps->used_lpar_creds);
> > @@ -303,7 +394,18 @@ static int deallocate_free_window(struct
> > pseries_vas_window *win)
> >  {
> >  	int rc = 0;
> >  
> > +	/*
> > +	 * The hypervisor waits for all requests including faults
> > +	 * are processed before closing the window - Means all
> > +	 * credits have to be returned. In the case of fault
> > +	 * request, a credit is returned after OS issues
> > +	 * H_GET_NX_FAULT hcall.
> > +	 * So free IRQ after executing H_DEALLOCATE_VAS_WINDOW
> > +	 * hcall.
> > +	 */
> >  	rc = h_deallocate_vas_window(win->vas_win.winid);
> > +	if (!rc)
> > +		free_irq_setup(win);
> >  
> >  	return rc;
> >  }
> > -- 
> > 2.18.2
> > 
> > 
> > 

