Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5D716F430
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 01:21:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RxL82JfQzDqM7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 11:21:18 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RxHs2hfjzDqFC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 11:19:20 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01Q0E629034577
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 19:19:18 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydcnbt5tg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 19:19:18 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Wed, 26 Feb 2020 00:19:15 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 26 Feb 2020 00:19:08 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01Q0J7EO62914758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Feb 2020 00:19:07 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9ECAD11C050;
 Wed, 26 Feb 2020 00:19:07 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC63211C04A;
 Wed, 26 Feb 2020 00:19:06 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 26 Feb 2020 00:19:06 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 18A29A00F1;
 Wed, 26 Feb 2020 11:19:02 +1100 (AEDT)
Subject: Re: [PATCH v3 03/27] powerpc: Map & release OpenCAPI LPC memory
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Wed, 26 Feb 2020 11:19:05 +1100
In-Reply-To: <69991128-3cf1-a8ba-4d9f-9ff90f1783db@linux.ibm.com>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-4-alastair@au1.ibm.com>
 <69991128-3cf1-a8ba-4d9f-9ff90f1783db@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022600-0020-0000-0000-000003AD9382
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022600-0021-0000-0000-00002205ABB7
Message-Id: <20f0a729962c1fe58f34f500c2666b4516073508.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-25_09:2020-02-25,
 2020-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=447
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
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

On Tue, 2020-02-25 at 11:02 +0100, Frederic Barrat wrote:
> 
> Le 21/02/2020 à 04:26, Alastair D'Silva a écrit :
> > From: Alastair D'Silva <alastair@d-silva.org>
> > 
> > This patch adds platform support to map & release LPC memory.
> > 
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > ---
> >   arch/powerpc/include/asm/pnv-ocxl.h   |  4 +++
> >   arch/powerpc/platforms/powernv/ocxl.c | 43
> > +++++++++++++++++++++++++++
> >   2 files changed, 47 insertions(+)
> > 
> > diff --git a/arch/powerpc/include/asm/pnv-ocxl.h
> > b/arch/powerpc/include/asm/pnv-ocxl.h
> > index 7de82647e761..0b2a6707e555 100644
> > --- a/arch/powerpc/include/asm/pnv-ocxl.h
> > +++ b/arch/powerpc/include/asm/pnv-ocxl.h
> > @@ -32,5 +32,9 @@ extern int pnv_ocxl_spa_remove_pe_from_cache(void
> > *platform_data, int pe_handle)
> >   
> >   extern int pnv_ocxl_alloc_xive_irq(u32 *irq, u64 *trigger_addr);
> >   extern void pnv_ocxl_free_xive_irq(u32 irq);
> > +#ifdef CONFIG_MEMORY_HOTPLUG_SPARSE
> > +u64 pnv_ocxl_platform_lpc_setup(struct pci_dev *pdev, u64 size);
> > +void pnv_ocxl_platform_lpc_release(struct pci_dev *pdev);
> > +#endif
> 
> This breaks the compilation of the ocxl driver if
> CONFIG_MEMORY_HOTPLUG=n
> 
> Those functions still make sense even without memory hotplug, for 
> example in the context of the implementation you had to access
> opencapi 
> LPC memory through mmap(). The #ifdef is really needed only around
> the 
> check_hotplug_memory_addressable() call.
> 
>    Fred

Hmm, we do still need sparsemem though. Let me think about his some
more.

> 
> 
> >   #endif /* _ASM_PNV_OCXL_H */
> > diff --git a/arch/powerpc/platforms/powernv/ocxl.c
> > b/arch/powerpc/platforms/powernv/ocxl.c
> > index 8c65aacda9c8..f2edbcc67361 100644
> > --- a/arch/powerpc/platforms/powernv/ocxl.c
> > +++ b/arch/powerpc/platforms/powernv/ocxl.c
> > @@ -475,6 +475,49 @@ void pnv_ocxl_spa_release(void *platform_data)
> >   }
> >   EXPORT_SYMBOL_GPL(pnv_ocxl_spa_release);
> >   
> > +#ifdef CONFIG_MEMORY_HOTPLUG_SPARSE
> > +u64 pnv_ocxl_platform_lpc_setup(struct pci_dev *pdev, u64 size)
> > +{
> > +	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> > +	struct pnv_phb *phb = hose->private_data;
> > +	u32 bdfn = pci_dev_id(pdev);
> > +	__be64 base_addr_be64;
> > +	u64 base_addr;
> > +	int rc;
> > +
> > +	rc = opal_npu_mem_alloc(phb->opal_id, bdfn, size,
> > &base_addr_be64);
> > +	if (rc) {
> > +		dev_warn(&pdev->dev,
> > +			 "OPAL could not allocate LPC memory, rc=%d\n",
> > rc);
> > +		return 0;
> > +	}
> > +
> > +	base_addr = be64_to_cpu(base_addr_be64);
> > +
> > +	rc = check_hotplug_memory_addressable(base_addr >> PAGE_SHIFT,
> > +					      size >> PAGE_SHIFT);
> > +	if (rc)
> > +		return 0;
> > +
> > +	return base_addr;
> > +}
> > +EXPORT_SYMBOL_GPL(pnv_ocxl_platform_lpc_setup);
> > +
> > +void pnv_ocxl_platform_lpc_release(struct pci_dev *pdev)
> > +{
> > +	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> > +	struct pnv_phb *phb = hose->private_data;
> > +	u32 bdfn = pci_dev_id(pdev);
> > +	int rc;
> > +
> > +	rc = opal_npu_mem_release(phb->opal_id, bdfn);
> > +	if (rc)
> > +		dev_warn(&pdev->dev,
> > +			 "OPAL reported rc=%d when releasing LPC
> > memory\n", rc);
> > +}
> > +EXPORT_SYMBOL_GPL(pnv_ocxl_platform_lpc_release);
> > +#endif
> > +
> >   int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int
> > pe_handle)
> >   {
> >   	struct spa_data *data = (struct spa_data *) platform_data;
> > 
-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

