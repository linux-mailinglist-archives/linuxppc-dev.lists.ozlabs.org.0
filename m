Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0174B15D683
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 12:26:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Jrgd58mFzDqbx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 22:26:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JrHL1fDhzDqTY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 22:09:17 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01EB6xvp022339
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 06:09:15 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y4j8at313-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 06:09:14 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Fri, 14 Feb 2020 11:09:12 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 14 Feb 2020 11:09:06 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01EB94aI55640210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Feb 2020 11:09:04 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 787A5A405B;
 Fri, 14 Feb 2020 11:09:04 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74ADFA406A;
 Fri, 14 Feb 2020 11:09:03 +0000 (GMT)
Received: from pic2.home (unknown [9.145.28.205])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Feb 2020 11:09:03 +0000 (GMT)
Subject: Re: [PATCH v2 05/27] powerpc: Map & release OpenCAPI LPC memory
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20191203034655.51561-1-alastair@au1.ibm.com>
 <20191203034655.51561-6-alastair@au1.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Fri, 14 Feb 2020 12:09:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20191203034655.51561-6-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20021411-0020-0000-0000-000003AA12A9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021411-0021-0000-0000-000022020116
Message-Id: <85e5a3d4-bac2-a8fc-8fc7-865be539dc3c@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_03:2020-02-12,
 2020-02-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=894
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 suspectscore=2 lowpriorityscore=0 spamscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002140091
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
 Alexey Kardashevskiy <aik@ozlabs.ru>, Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/12/2019 à 04:46, Alastair D'Silva a écrit :
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> This patch adds platform support to map & release LPC memory.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>   arch/powerpc/include/asm/pnv-ocxl.h   |  2 ++
>   arch/powerpc/platforms/powernv/ocxl.c | 42 +++++++++++++++++++++++++++
>   2 files changed, 44 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/pnv-ocxl.h b/arch/powerpc/include/asm/pnv-ocxl.h
> index 7de82647e761..f8f8ffb48aa8 100644
> --- a/arch/powerpc/include/asm/pnv-ocxl.h
> +++ b/arch/powerpc/include/asm/pnv-ocxl.h
> @@ -32,5 +32,7 @@ extern int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle)
>   
>   extern int pnv_ocxl_alloc_xive_irq(u32 *irq, u64 *trigger_addr);
>   extern void pnv_ocxl_free_xive_irq(u32 irq);
> +extern u64 pnv_ocxl_platform_lpc_setup(struct pci_dev *pdev, u64 size);
> +extern void pnv_ocxl_platform_lpc_release(struct pci_dev *pdev);
>   
>   #endif /* _ASM_PNV_OCXL_H */
> diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
> index 8c65aacda9c8..b56a48daf48c 100644
> --- a/arch/powerpc/platforms/powernv/ocxl.c
> +++ b/arch/powerpc/platforms/powernv/ocxl.c
> @@ -475,6 +475,48 @@ void pnv_ocxl_spa_release(void *platform_data)
>   }
>   EXPORT_SYMBOL_GPL(pnv_ocxl_spa_release);
>   
> +u64 pnv_ocxl_platform_lpc_setup(struct pci_dev *pdev, u64 size)
> +{
> +	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> +	struct pnv_phb *phb = hose->private_data;
> +	u32 bdfn = pci_dev_id(pdev);
> +	__be64 base_addr_be64;
> +	u64 base_addr;
> +	int rc;
> +
> +	rc = opal_npu_mem_alloc(phb->opal_id, bdfn, size, &base_addr_be64);
> +	if (rc) {
> +		dev_warn(&pdev->dev,
> +			 "OPAL could not allocate LPC memory, rc=%d\n", rc);
> +		return 0;
> +	}
> +
> +	base_addr = be64_to_cpu(base_addr_be64);
> +
> +	rc = check_hotplug_memory_addressable(base_addr >> PAGE_SHIFT,
> +					      size >> PAGE_SHIFT);


check_hotplug_memory_addressable() is only declared if 
CONFIG_MEMORY_HOTPLUG_SPARSE is selected.
I think we also need a #ifdef here.

   Fred


> +	if (rc)
> +		return 0;
> +
> +	return base_addr;
> +}
> +EXPORT_SYMBOL_GPL(pnv_ocxl_platform_lpc_setup);
> +
> +void pnv_ocxl_platform_lpc_release(struct pci_dev *pdev)
> +{
> +	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> +	struct pnv_phb *phb = hose->private_data;
> +	u32 bdfn = pci_dev_id(pdev);
> +	int rc;
> +
> +	rc = opal_npu_mem_release(phb->opal_id, bdfn);
> +	if (rc)
> +		dev_warn(&pdev->dev,
> +			 "OPAL reported rc=%d when releasing LPC memory\n", rc);
> +}
> +EXPORT_SYMBOL_GPL(pnv_ocxl_platform_lpc_release);
> +
> +
>   int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle)
>   {
>   	struct spa_data *data = (struct spa_data *) platform_data;
> 

