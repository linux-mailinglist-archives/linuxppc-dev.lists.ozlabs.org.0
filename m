Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAD216F454
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 01:31:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RxYv3ZG5zDqMx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 11:31:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=au1.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=alastair@au1.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RxWb0wVpzDqMx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 11:29:30 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01Q0KuWg035662
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 19:29:28 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydcnt290j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 19:29:28 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Wed, 26 Feb 2020 00:29:25 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 26 Feb 2020 00:29:19 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01Q0TI8544302718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Feb 2020 00:29:18 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F6735204F;
 Wed, 26 Feb 2020 00:29:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 73E275204E;
 Wed, 26 Feb 2020 00:29:17 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C7E00A00F1;
 Wed, 26 Feb 2020 11:29:12 +1100 (AEDT)
Subject: Re: [PATCH v3 06/27] ocxl: Tally up the LPC memory on a link &
 allow it to be mapped
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Wed, 26 Feb 2020 11:29:16 +1100
In-Reply-To: <4c8f704b-5607-5ca0-c00e-01e412117f6b@linux.ibm.com>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-7-alastair@au1.ibm.com>
 <4c8f704b-5607-5ca0-c00e-01e412117f6b@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022600-0028-0000-0000-000003DDFA10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022600-0029-0000-0000-000024A31410
Message-Id: <7833545b1c276ac62651c598af27728b8cacabed.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-25_09:2020-02-25,
 2020-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2 spamscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002260000
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-02-25 at 17:30 +0100, Frederic Barrat wrote:
> 
> Le 21/02/2020 à 04:26, Alastair D'Silva a écrit :
> > From: Alastair D'Silva <alastair@d-silva.org>
> > 
> > Tally up the LPC memory on an OpenCAPI link & allow it to be mapped
> > 
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > ---
> >   drivers/misc/ocxl/core.c          | 10 ++++++
> >   drivers/misc/ocxl/link.c          | 53
> > +++++++++++++++++++++++++++++++
> >   drivers/misc/ocxl/ocxl_internal.h | 33 +++++++++++++++++++
> >   3 files changed, 96 insertions(+)
> > 
> > diff --git a/drivers/misc/ocxl/core.c b/drivers/misc/ocxl/core.c
> > index b7a09b21ab36..2531c6cf19a0 100644
> > --- a/drivers/misc/ocxl/core.c
> > +++ b/drivers/misc/ocxl/core.c
> > @@ -230,8 +230,18 @@ static int configure_afu(struct ocxl_afu *afu,
> > u8 afu_idx, struct pci_dev *dev)
> >   	if (rc)
> >   		goto err_free_pasid;
> >   
> > +	if (afu->config.lpc_mem_size || afu-
> > >config.special_purpose_mem_size) {
> > +		rc = ocxl_link_add_lpc_mem(afu->fn->link, afu-
> > >config.lpc_mem_offset,
> > +					   afu->config.lpc_mem_size +
> > +					   afu-
> > >config.special_purpose_mem_size);
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
> > index 58d111afd9f6..1e039cc5ebe5 100644
> > --- a/drivers/misc/ocxl/link.c
> > +++ b/drivers/misc/ocxl/link.c
> > @@ -84,6 +84,11 @@ struct ocxl_link {
> >   	int dev;
> >   	atomic_t irq_available;
> >   	struct spa *spa;
> > +	struct mutex lpc_mem_lock; /* protects lpc_mem & lpc_mem_sz */
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
> > @@ -711,3 +718,49 @@ void ocxl_link_free_irq(void *link_handle, int
> > hw_irq)
> >   	atomic_inc(&link->irq_available);
> >   }
> >   EXPORT_SYMBOL_GPL(ocxl_link_free_irq);
> > +
> > +int ocxl_link_add_lpc_mem(void *link_handle, u64 offset, u64 size)
> > +{
> > +	struct ocxl_link *link = (struct ocxl_link *) link_handle;
> > +
> > +	// Check for overflow
> > +	if (offset > (offset + size))
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&link->lpc_mem_lock);
> > +	link->lpc_mem_sz = max(link->lpc_mem_sz, offset + size);
> > +
> > +	mutex_unlock(&link->lpc_mem_lock);
> > +
> > +	return 0;
> > +}
> > +
> > +u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev)
> > +{
> > +	struct ocxl_link *link = (struct ocxl_link *) link_handle;
> > +
> > +	mutex_lock(&link->lpc_mem_lock);
> > +
> > +	if(!link->lpc_mem)
> > +		link->lpc_mem = pnv_ocxl_platform_lpc_setup(pdev, link-
> > >lpc_mem_sz);
> > +
> > +	if(link->lpc_mem)
> > +		link->lpc_consumers++;
> > +	mutex_unlock(&link->lpc_mem_lock);
> > +
> > +	return link->lpc_mem;
> > +}
> > +
> > +void ocxl_link_lpc_release(void *link_handle, struct pci_dev
> > *pdev)
> > +{
> > +	struct ocxl_link *link = (struct ocxl_link *) link_handle;
> > +
> > +	mutex_lock(&link->lpc_mem_lock);
> > +	WARN_ON(--link->lpc_consumers < 0);
> 
> Here, we always decrement the lpc_consumers count. However, it was
> only 
> incremented if the mapping was setup correctly in opal.
> 
> We could arguably claim that ocxl_link_lpc_release() should only be 
> called if ocxl_link_lpc_map() succeeded, but it would make error
> path 
> handling easier if we only decrement the lpc_consumers count if 
> link->lpc_mem is set. So that we can just call
> ocxl_link_lpc_release() 
> in error paths without having to worry about triggering the WARN_ON
> message.
> 
>    Fred
> 
> 

Ok, this makes sense.

> 
> > +	if (link->lpc_consumers == 0) {
> > +		pnv_ocxl_platform_lpc_release(pdev);
> > +		link->lpc_mem = 0;
> > +	}
> > +
> > +	mutex_unlock(&link->lpc_mem_lock);
> > +}
> > diff --git a/drivers/misc/ocxl/ocxl_internal.h
> > b/drivers/misc/ocxl/ocxl_internal.h
> > index 198e4e4bc51d..d0c8c4838f42 100644
> > --- a/drivers/misc/ocxl/ocxl_internal.h
> > +++ b/drivers/misc/ocxl/ocxl_internal.h
> > @@ -142,4 +142,37 @@ int ocxl_irq_offset_to_id(struct ocxl_context
> > *ctx, u64 offset);
> >   u64 ocxl_irq_id_to_offset(struct ocxl_context *ctx, int irq_id);
> >   void ocxl_afu_irq_free_all(struct ocxl_context *ctx);
> >   
> > +/**
> > + * ocxl_link_add_lpc_mem() - Increment the amount of memory
> > required by an OpenCAPI link
> > + *
> > + * @link_handle: The OpenCAPI link handle
> > + * @offset: The offset of the memory to add
> > + * @size: The amount of memory to increment by
> > + *
> > + * Returns 0 on success, negative on overflow
> > + */
> > +int ocxl_link_add_lpc_mem(void *link_handle, u64 offset, u64
> > size);
> > +
> > +/**
> > + * ocxl_link_lpc_map() - Map the LPC memory for an OpenCAPI device
> > + * Since LPC memory belongs to a link, the whole LPC memory
> > available
> > + * on the link must be mapped in order to make it accessible to a
> > device.
> > + * @link_handle: The OpenCAPI link handle
> > + * @pdev: A device that is on the link
> > + *
> > + * Returns the address of the mapped LPC memory, or 0 on error
> > + */
> > +u64 ocxl_link_lpc_map(void *link_handle, struct pci_dev *pdev);
> > +
> > +/**
> > + * ocxl_link_lpc_release() - Release the LPC memory device for an
> > OpenCAPI device
> > + *
> > + * Offlines LPC memory on an OpenCAPI link for a device. If this
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

