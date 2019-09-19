Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 382B0B7050
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 03:00:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Ydmg5Sp5zF4jm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 11:00:03 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Ydkj4rGDzDrQR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 10:58:21 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8J0ufmq083045
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 20:58:18 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v3vdevn90-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 20:58:17 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Thu, 19 Sep 2019 01:58:15 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 19 Sep 2019 01:58:10 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8J0w9RA54919296
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Sep 2019 00:58:09 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 904394C044;
 Thu, 19 Sep 2019 00:58:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EACFF4C040;
 Thu, 19 Sep 2019 00:58:08 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 19 Sep 2019 00:58:08 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5EC2FA01EB;
 Thu, 19 Sep 2019 10:58:07 +1000 (AEST)
Subject: Re: [PATCH 2/5] powerpc: Map & release OpenCAPI LPC memory
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Thu, 19 Sep 2019 10:58:07 +1000
In-Reply-To: <c644b511-86c8-e71b-11ae-dd425c3be28d@linux.ibm.com>
References: <20190917014307.30485-1-alastair@au1.ibm.com>
 <20190917014307.30485-3-alastair@au1.ibm.com>
 <c644b511-86c8-e71b-11ae-dd425c3be28d@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19091900-0028-0000-0000-0000039FBEB8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091900-0029-0000-0000-00002461C3DC
Message-Id: <aa0be6fd63fd65fa66467234ce9790b39ac6b689.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-18_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=822 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909190006
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
 Vaibhav Jain <vaibhav@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 David Gibson <david@gibson.dropbear.id.au>, linuxppc-dev@lists.ozlabs.org,
 Allison Randal <allison@lohutok.net>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-09-18 at 16:03 +0200, Frederic Barrat wrote:
> 
> Le 17/09/2019 à 03:42, Alastair D'Silva a écrit :
> > From: Alastair D'Silva <alastair@d-silva.org>
> > 
> > Map & release OpenCAPI LPC memory.
> > 
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > ---
> >   arch/powerpc/include/asm/pnv-ocxl.h   |  2 ++
> >   arch/powerpc/platforms/powernv/ocxl.c | 42
> > +++++++++++++++++++++++++++
> >   2 files changed, 44 insertions(+)
> > 
> > diff --git a/arch/powerpc/include/asm/pnv-ocxl.h
> > b/arch/powerpc/include/asm/pnv-ocxl.h
> > index 7de82647e761..f8f8ffb48aa8 100644
> > --- a/arch/powerpc/include/asm/pnv-ocxl.h
> > +++ b/arch/powerpc/include/asm/pnv-ocxl.h
> > @@ -32,5 +32,7 @@ extern int pnv_ocxl_spa_remove_pe_from_cache(void
> > *platform_data, int pe_handle)
> >   
> >   extern int pnv_ocxl_alloc_xive_irq(u32 *irq, u64 *trigger_addr);
> >   extern void pnv_ocxl_free_xive_irq(u32 irq);
> > +extern u64 pnv_ocxl_platform_lpc_setup(struct pci_dev *pdev, u64
> > size);
> > +extern void pnv_ocxl_platform_lpc_release(struct pci_dev *pdev);
> >   
> >   #endif /* _ASM_PNV_OCXL_H */
> > diff --git a/arch/powerpc/platforms/powernv/ocxl.c
> > b/arch/powerpc/platforms/powernv/ocxl.c
> > index 8c65aacda9c8..81393728d6a3 100644
> > --- a/arch/powerpc/platforms/powernv/ocxl.c
> > +++ b/arch/powerpc/platforms/powernv/ocxl.c
> > @@ -475,6 +475,48 @@ void pnv_ocxl_spa_release(void *platform_data)
> >   }
> >   EXPORT_SYMBOL_GPL(pnv_ocxl_spa_release);
> >   
> > +u64 pnv_ocxl_platform_lpc_setup(struct pci_dev *pdev, u64 size)
> > +{
> > +	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> > +	struct pnv_phb *phb = hose->private_data;
> > +	struct pci_dn *pdn = pci_get_pdn(pdev);
> > +	u32 bdfn = (pdn->busno << 8) | pdn->devfn;
> 
> We can spare a call to pci_get_pdn() with
> bdfn = (pdev->bus->number << 8) | pdev->devfn;
> 

Ok.

> 
> > +	u64 base_addr = 0;
> > +
> > +	int rc = opal_npu_mem_alloc(phb->opal_id, bdfn, size,
> > &base_addr);
> > +
> > +	WARN_ON(rc);
> 
> Instead of a WARN, we should catch the error and return a null
> address 
> to the caller.
> 

base_addr will be 0 in the error case, are you suggesting we just
remove the WARN_ON()?

> > +
> > +	base_addr = be64_to_cpu(base_addr);
> > +
> > +	rc = check_hotplug_memory_addressable(base_addr, base_addr +
> > size);
> 
> That code is missing?
> 

That's added in the following patch on the mm list:
 [PATCH v3 1/2] memory_hotplug: Add a bounds check to
check_hotplug_memory_range()

> 
> > +	if (rc) {
> > +		dev_warn(&pdev->dev,
> > +			 "LPC memory range 0x%llx-0x%llx is not fully
> > addressable",
> > +			 base_addr, base_addr + size - 1);
> > +		return 0;
> > +	}
> > +
> > +
> > +	return base_addr;
> > +}
> > +EXPORT_SYMBOL_GPL(pnv_ocxl_platform_lpc_setup);
> > +
> > +void pnv_ocxl_platform_lpc_release(struct pci_dev *pdev)
> > +{
> > +	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> > +	struct pnv_phb *phb = hose->private_data;
> > +	struct pci_dn *pdn = pci_get_pdn(pdev);
> > +	u32 bdfn;
> > +	int rc;
> > +
> > +	bdfn = (pdn->busno << 8) | pdn->devfn;
> > +	rc = opal_npu_mem_release(phb->opal_id, bdfn);
> > +	WARN_ON(rc);
> 
> Same comments as above.
> 
>    Fred
> 
> 
> 
> > +}
> > +EXPORT_SYMBOL_GPL(pnv_ocxl_platform_lpc_release);
> > +
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

