Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4091B7269
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 06:58:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Yl392frbzF4Yg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 14:57:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alastair@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Yl0t2tLhzF4Lf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 14:55:57 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8J4pqYD039214
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 00:55:54 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v41aftmpn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 00:55:53 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Thu, 19 Sep 2019 05:55:51 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 19 Sep 2019 05:55:46 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8J4tjmj43516084
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Sep 2019 04:55:45 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B226A4054;
 Thu, 19 Sep 2019 04:55:45 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5BEBA4060;
 Thu, 19 Sep 2019 04:55:44 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 19 Sep 2019 04:55:44 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 813DAA01EB;
 Thu, 19 Sep 2019 14:55:41 +1000 (AEST)
Subject: Re: [PATCH 3/5] ocxl: Tally up the LPC memory on a link & allow it
 to be mapped
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Thu, 19 Sep 2019 14:55:41 +1000
In-Reply-To: <268bcb76-fd37-6996-e5ff-43625b60a95a@linux.ibm.com>
References: <20190917014307.30485-1-alastair@au1.ibm.com>
 <20190917014307.30485-4-alastair@au1.ibm.com>
 <268bcb76-fd37-6996-e5ff-43625b60a95a@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19091904-0008-0000-0000-00000318413B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091904-0009-0000-0000-00004A36C4DD
Message-Id: <16a0270590e50a45854ae2e57a3b0ef969fd0c78.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-19_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909190044
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 David Gibson <david@gibson.dropbear.id.au>, linuxppc-dev@lists.ozlabs.org,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-09-18 at 16:02 +0200, Frederic Barrat wrote:
> 
> Le 17/09/2019 à 03:42, Alastair D'Silva a écrit :
> > From: Alastair D'Silva <alastair@d-silva.org>
> > 
> > Tally up the LPC memory on an OpenCAPI link & allow it to be mapped
> > 
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > ---
> >   drivers/misc/ocxl/core.c          |  9 +++++
> >   drivers/misc/ocxl/link.c          | 61
> > +++++++++++++++++++++++++++++++
> >   drivers/misc/ocxl/ocxl_internal.h | 42 +++++++++++++++++++++
> >   3 files changed, 112 insertions(+)
> > 
> > diff --git a/drivers/misc/ocxl/core.c b/drivers/misc/ocxl/core.c
> > index b7a09b21ab36..fdfe4e0a34e1 100644
> > --- a/drivers/misc/ocxl/core.c
> > +++ b/drivers/misc/ocxl/core.c
> > @@ -230,8 +230,17 @@ static int configure_afu(struct ocxl_afu *afu,
> > u8 afu_idx, struct pci_dev *dev)
> >   	if (rc)
> >   		goto err_free_pasid;
> >   
> > +	if (afu->config.lpc_mem_size || afu-
> > >config.special_purpose_mem_size) {
> > +		rc = ocxl_link_add_lpc_mem(afu->fn->link,
> > +			afu->config.lpc_mem_size + afu-
> > >config.special_purpose_mem_size);
> 
> I don't think we should count the special purpose memory, as it's
> not 
> meant to be accessed through the GPU mem BAR, but I'll check.

At least for OpenCAPI 3.0, there is no other in-spec way to access the
memory if it is not mapped by the NPU.

> 
> What happens when unconfiguring the AFU? We should reduce the range
> (see 
> also below). Partial reconfig doesn't seem so far off, so we should
> take 
> it into account.
> 

The mapping is left until the last AFU on the link offlines it's
memory, at which point we clear the mapping from the NPU.

> 
> > +		if (rc)
> > +			goto err_free_mmio;
> > +	}
> > +
> >   	return 0;
> >   
> > +err_free_mmio:
> > +	unmap_mmio_areas(afu);
> >   err_free_pasid:
> >   	reclaim_afu_pasid(afu);
> >   err_free_actag:
> > diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
> > index 58d111afd9f6..2874811a4398 100644
> > --- a/drivers/misc/ocxl/link.c
> > +++ b/drivers/misc/ocxl/link.c
> > @@ -84,6 +84,11 @@ struct ocxl_link {
> >   	int dev;
> >   	atomic_t irq_available;
> >   	struct spa *spa;
> > +	struct mutex lpc_mem_lock;
> > +	u64 lpc_mem_sz; /* Total amount of LPC memory presented on the
> > link */
> > +	u64 lpc_mem;
> > +	int lpc_consumers;
> > +
> >   	void *platform_data;
> >   };
> >   static struct list_head links_list = LIST_HEAD_INIT(links_list);
> > @@ -396,6 +401,8 @@ static int alloc_link(struct pci_dev *dev, int
> > PE_mask, struct ocxl_link **out_l
> >   	if (rc)
> >   		goto err_spa;
> >   
> > +	mutex_init(&link->lpc_mem_lock);
> > +
> >   	/* platform specific hook */
> >   	rc = pnv_ocxl_spa_setup(dev, link->spa->spa_mem, PE_mask,
> >   				&link->platform_data);
> > @@ -711,3 +718,57 @@ void ocxl_link_free_irq(void *link_handle, int
> > hw_irq)
> >   	atomic_inc(&link->irq_available);
> >   }
> >   EXPORT_SYMBOL_GPL(ocxl_link_free_irq);
> > +
> > +int ocxl_link_add_lpc_mem(void *link_handle, u64 size)
> > +{
> > +	struct ocxl_link *link = (struct ocxl_link *) link_handle;
> > +
> > +	u64 orig_size;
> > +	bool good = false;
> > +
> > +	mutex_lock(&link->lpc_mem_lock);
> > +	orig_size = link->lpc_mem_sz;
> > +	link->lpc_mem_sz += size;
> 
> 
> We have a choice to make here:
> 1. either we only support one LPC memory-carrying AFU (and the above
> is 
> overkill)
> 2. or we support multiple AFUs with LPC memory (on the same
> function), 
> but then I think the above is too simple.
> 
>  From the opencapi spec, each AFU can define a chunk of memory with
> a 
> starting address and a size. There's no rule which says they have to
> be 
> contiguous. There's no rule which says it must start at 0. So to
> support 
> multiple AFUs with LPC memory, we should record the current maximum 
> range instead of just the global size. Ultimately, we need to tell
> the 
> NPU the range of permissible addresses. It starts at 0, so we need
> to 
> take into account any intial offset and holes.
> 
> I would go for option 2, to at least be consistent within ocxl and 
> support multiple AFUs. Even though I don't think we'll see FPGA
> images 
> with multiple AFUs with LPC memory any time soon.
> 

Ill rework this to take an offset & size, the NPU will map from the
base address up to the largest offset + size provided across all AFUs
on the link.

> 
> > +	good = orig_size < link->lpc_mem_sz;
> > +	mutex_unlock(&link->lpc_mem_lock);
> > +
> > +	// Check for overflow
> > +	return (good) ? 0 : -EINVAL;
> > +}
> > +EXPORT_SYMBOL_GPL(ocxl_link_add_lpc_mem);
> 
> Do the symbol really need to be exported? IIUC, the next patch
> defines a 
> higher level ocxl_afu_map_lpc_mem() which is meant to be called by a 
> calling driver.
> 

No, I'll remove it.

> 
> > +
> > +u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev)
> > +{
> > +	struct ocxl_link *link = (struct ocxl_link *) link_handle;
> > +
> > +	mutex_lock(&link->lpc_mem_lock);
> > +	if (link->lpc_mem) {
> > +		u64 lpc_mem = link->lpc_mem;
> > +
> > +		link->lpc_consumers++;
> > +		mutex_unlock(&link->lpc_mem_lock);
> > +		return lpc_mem;
> > +	}
> > +
> > +	link->lpc_mem = pnv_ocxl_platform_lpc_setup(pdev, link-
> > >lpc_mem_sz);
> > +	if (link->lpc_mem)
> > +		link->lpc_consumers++;
> > +	mutex_unlock(&link->lpc_mem_lock);
> > +
> > +	return link->lpc_mem;
> 
> Should be cached in a temp variable, like on the fast path,
> otherwise 
> it's accessed with no lock.

Good spotting, thanks.

> 
> > +}
> > +
> > +void ocxl_link_lpc_release(void *link_handle, struct pci_dev
> > *pdev)
> > +{
> > +	struct ocxl_link *link = (struct ocxl_link *) link_handle;
> > +
> > +	mutex_lock(&link->lpc_mem_lock);
> > +	link->lpc_consumers--;
> > +	if (link->lpc_consumers == 0) {
> > +		pnv_ocxl_platform_lpc_release(pdev);
> > +		link->lpc_mem = 0;
> > +	}
> > +
> > +	mutex_unlock(&link->lpc_mem_lock);
> > +}
> > diff --git a/drivers/misc/ocxl/ocxl_internal.h
> > b/drivers/misc/ocxl/ocxl_internal.h
> > index 97415afd79f3..db2647a90fc8 100644
> > --- a/drivers/misc/ocxl/ocxl_internal.h
> > +++ b/drivers/misc/ocxl/ocxl_internal.h
> > @@ -141,4 +141,46 @@ int ocxl_irq_offset_to_id(struct ocxl_context
> > *ctx, u64 offset);
> >   u64 ocxl_irq_id_to_offset(struct ocxl_context *ctx, int irq_id);
> >   void ocxl_afu_irq_free_all(struct ocxl_context *ctx);
> >   
> > +/**
> > + * Increment the amount of memory required by an OpenCAPI link
> > + *
> > + * link_handle: The OpenCAPI link handle
> > + * size: The amount of memory to increment by
> > + *
> > + * Return 0 on success, negative on overflow
> > + */
> > +extern int ocxl_link_add_lpc_mem(void *link_handle, u64 size);
> 
> We've removed all the 'extern' in a previous patch.

Thanks, I spotted this too (after I posted it).

> > +
> > +/**
> > + * Get the amount of memory required by an OpenCAPI link
> > + *
> > + * link_handle: The OpenCAPI link handle
> > + *
> > + * Return the amount of memory required by the link, this value is
> > undefined if
> > + * ocxl_link_add_lpc_mem failed.
> > + */
> > +extern u64 ocxl_link_get_lpc_mem_sz(void *link_handle);
> 
> I don't see that one defined anywhere.
> 

Whoops, I'll remove it.

>    Fred
> 
> 
> > +
> > +/**
> > + * Map the LPC memory for an OpenCAPI device
> > + *
> > + * Since LPC memory belongs to a link, the whole LPC memory
> > available
> > + * on the link bust be mapped in order to make it accessible to a
> > device.
> > + *
> > + * @link_handle: The OpenCAPI link handle
> > + * @pdev: A device that is on the link
> > + */
> > +u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev);
> > +
> > +/**
> > + * Release the LPC memory device for an OpenCAPI device
> > + *
> > + * Releases LPC memory on an OpenCAPI link for a device. If this
> > is the
> > + * last device on the link to release the memory, unmap it from
> > the link.
> > + *
> > + * @link_handle: The OpenCAPI link handle
> > + * @pdev: A device that is on the link
> > + */
> > +void ocxl_link_lpc_release(void *link_handle, struct pci_dev
> > *pdev);
> > +
> >   #endif /* _OCXL_INTERNAL_H_ */
> > 
-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

