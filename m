Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD88169E42
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 07:10:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48QsB43qbFzDqVR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 17:10:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=au1.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=alastair@au1.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Qs853YZZzDqDp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 17:08:53 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01O63m7d115077
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 01:08:51 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yb161baep-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 01:08:50 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Mon, 24 Feb 2020 06:08:48 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 24 Feb 2020 06:08:41 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01O67h1j46531050
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 06:07:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F11911C06E;
 Mon, 24 Feb 2020 06:08:40 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FEBC11C04A;
 Mon, 24 Feb 2020 06:08:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 24 Feb 2020 06:08:39 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E4E50A00E5;
 Mon, 24 Feb 2020 17:08:34 +1100 (AEDT)
Subject: Re: [PATCH v3 07/27] ocxl: Add functions to map/unmap LPC memory
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
Date: Mon, 24 Feb 2020 17:08:38 +1100
In-Reply-To: <ebd1c438-1164-8c7c-7067-2389d64740e7@linux.ibm.com>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-8-alastair@au1.ibm.com>
 <ebd1c438-1164-8c7c-7067-2389d64740e7@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20022406-0008-0000-0000-00000355CFDF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022406-0009-0000-0000-00004A76E713
Message-Id: <776afc400612efce413ae7646b5d364b981f3ec4.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-24_01:2020-02-21,
 2020-02-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240052
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
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-02-24 at 17:02 +1100, Andrew Donnellan wrote:
> On 21/2/20 2:27 pm, Alastair D'Silva wrote:
> > From: Alastair D'Silva <alastair@d-silva.org>
> > 
> > Add functions to map/unmap LPC memory
> > 
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > ---
> >   drivers/misc/ocxl/core.c          | 51
> > +++++++++++++++++++++++++++++++
> >   drivers/misc/ocxl/ocxl_internal.h |  3 ++
> >   include/misc/ocxl.h               | 21 +++++++++++++
> >   3 files changed, 75 insertions(+)
> > 
> > diff --git a/drivers/misc/ocxl/core.c b/drivers/misc/ocxl/core.c
> > index 2531c6cf19a0..75ff14e3882a 100644
> > --- a/drivers/misc/ocxl/core.c
> > +++ b/drivers/misc/ocxl/core.c
> > @@ -210,6 +210,56 @@ static void unmap_mmio_areas(struct ocxl_afu
> > *afu)
> >   	release_fn_bar(afu->fn, afu->config.global_mmio_bar);
> >   }
> >   
> > +int ocxl_afu_map_lpc_mem(struct ocxl_afu *afu)
> > +{
> > +	struct pci_dev *dev = to_pci_dev(afu->fn->dev.parent);
> > +
> > +	if ((afu->config.lpc_mem_size + afu-
> > >config.special_purpose_mem_size) == 0)
> > +		return 0;
> 
> I'd prefer the comparison here to be:
> 
>    afu->config.lpc_mem_size == 0 &&
>      afu->config.special_purpose_mem_size == 0
> 
> so a reader doesn't have to think about what this means.
> 

Ok

> > +
> > +	afu->lpc_base_addr = ocxl_link_lpc_map(afu->fn->link, dev);
> > +	if (afu->lpc_base_addr == 0)
> > +		return -EINVAL;
> > +
> > +	if (afu->config.lpc_mem_size > 0) {
> > +		afu->lpc_res.start = afu->lpc_base_addr + afu-
> > >config.lpc_mem_offset;
> 
> Maybe not for this series - hmm, I wonder if we should print a
> warning 
> somewhere (maybe in read_afu_lpc_memory_info()?) if we see the case 
> where (lpc_mem_offset > 0 && lpc_mem_size == 0). Likewise for
> special 
> purpose?
> 

Sounds reasonable, might as well add it here since there are other LPC
changes.

> > +		afu->lpc_res.end = afu->lpc_res.start + afu-
> > >config.lpc_mem_size - 1;
> > +	}
> > +
> > +	if (afu->config.special_purpose_mem_size > 0) {
> > +		afu->special_purpose_res.start = afu->lpc_base_addr +
> > +						 afu-
> > >config.special_purpose_mem_offset;
> > +		afu->special_purpose_res.end = afu-
> > >special_purpose_res.start +
> > +					       afu-
> > >config.special_purpose_mem_size - 1;
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(ocxl_afu_map_lpc_mem);
> > +
> > +struct resource *ocxl_afu_lpc_mem(struct ocxl_afu *afu)
> > +{
> > +	return &afu->lpc_res;
> > +}
> > +EXPORT_SYMBOL_GPL(ocxl_afu_lpc_mem);
> 
> What's the point of this function? A layer of indirection just in
> case 
> we need it in future?
> 

struct ocxl_afu is opaque outsite the ocxl driver.

> > +
> > +static void unmap_lpc_mem(struct ocxl_afu *afu)
> > +{
> > +	struct pci_dev *dev = to_pci_dev(afu->fn->dev.parent);
> > +
> > +	if (afu->lpc_res.start || afu->special_purpose_res.start) {
> > +		void *link = afu->fn->link;
> > +
> > +		// only release the link when the the last consumer
> > calls release
> > +		ocxl_link_lpc_release(link, dev);
> > +
> > +		afu->lpc_res.start = 0;
> > +		afu->lpc_res.end = 0;
> > +		afu->special_purpose_res.start = 0;
> > +		afu->special_purpose_res.end = 0;
> > +	}
> > +}
> > +
> >   static int configure_afu(struct ocxl_afu *afu, u8 afu_idx, struct
> > pci_dev *dev)
> >   {
> >   	int rc;
> > @@ -251,6 +301,7 @@ static int configure_afu(struct ocxl_afu *afu,
> > u8 afu_idx, struct pci_dev *dev)
> >   
> >   static void deconfigure_afu(struct ocxl_afu *afu)
> >   {
> > +	unmap_lpc_mem(afu);
> >   	unmap_mmio_areas(afu);
> >   	reclaim_afu_pasid(afu);
> >   	reclaim_afu_actag(afu);
> > diff --git a/drivers/misc/ocxl/ocxl_internal.h
> > b/drivers/misc/ocxl/ocxl_internal.h
> > index d0c8c4838f42..ce0cac1da416 100644
> > --- a/drivers/misc/ocxl/ocxl_internal.h
> > +++ b/drivers/misc/ocxl/ocxl_internal.h
> > @@ -52,6 +52,9 @@ struct ocxl_afu {
> >   	void __iomem *global_mmio_ptr;
> >   	u64 pp_mmio_start;
> >   	void *private;
> > +	u64 lpc_base_addr; /* Covers both LPC & special purpose memory
> > */
> > +	struct resource lpc_res;
> > +	struct resource special_purpose_res;
> >   };
> >   
> >   enum ocxl_context_status {
> > diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
> > index 357ef1aadbc0..d8b0b4d46bfb 100644
> > --- a/include/misc/ocxl.h
> > +++ b/include/misc/ocxl.h
> > @@ -203,6 +203,27 @@ int ocxl_irq_set_handler(struct ocxl_context
> > *ctx, int irq_id,
> >   
> >   // AFU Metadata
> >   
> > +/**
> > + * ocxl_afu_map_lpc_mem() - Map the LPC system & special purpose
> > memory for an AFU
> > + * Do not call this during device discovery, as there may me
> > multiple
> 
> be
> 
> > + * devices on a link, and the memory is mapped for the whole link,
> > not
> > + * just one device. It should only be called after all devices
> > have
> > + * registered their memory on the link.
> > + *
> > + * @afu: The AFU that has the LPC memory to map
> > + *
> > + * Returns 0 on success, negative on failure
> > + */
> > +int ocxl_afu_map_lpc_mem(struct ocxl_afu *afu);
> > +
> > +/**
> > + * ocxl_afu_lpc_mem() - Get the physical address range of LPC
> > memory for an AFU
> > + * @afu: The AFU associated with the LPC memory
> > + *
> > + * Returns a pointer to the resource struct for the physical
> > address range
> > + */
> > +struct resource *ocxl_afu_lpc_mem(struct ocxl_afu *afu);
> > +
> >   /**
> >    * ocxl_afu_config() - Get a pointer to the config for an AFU
> >    * @afu: a pointer to the AFU to get the config for
> > 
-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

