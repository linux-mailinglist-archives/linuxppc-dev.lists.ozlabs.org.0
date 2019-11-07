Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7840F368B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 19:03:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478B8m46QVzF6gH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 05:03:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478B4g065KzF6SR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2019 04:59:46 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA7HlaFN018728
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 7 Nov 2019 12:59:43 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w4py8ubgx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Nov 2019 12:59:43 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Thu, 7 Nov 2019 17:59:40 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 7 Nov 2019 17:59:31 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA7HxUZr262566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Nov 2019 17:59:30 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 246C44C046;
 Thu,  7 Nov 2019 17:59:30 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFF9E4C044;
 Thu,  7 Nov 2019 17:59:28 +0000 (GMT)
Received: from pic2.home (unknown [9.145.15.120])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  7 Nov 2019 17:59:28 +0000 (GMT)
Subject: Re: [PATCH 04/10] powerpc: Map & release OpenCAPI LPC memory
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20191025044721.16617-1-alastair@au1.ibm.com>
 <20191025044721.16617-5-alastair@au1.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Thu, 7 Nov 2019 18:59:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191025044721.16617-5-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19110717-0028-0000-0000-000003B3A27E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110717-0029-0000-0000-000024760386
Message-Id: <f947dca2-9be5-c9f5-6c55-5d4a92d1ec71@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-07_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911070165
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
Cc: Oscar Salvador <osalvador@suse.com>, Michal Hocko <mhocko@suse.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Hildenbrand <david@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Wei Yang <richard.weiyang@gmail.com>, Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, Ira Weiny <ira.weiny@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Allison Randal <allison@lohutok.net>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Qian Cai <cai@lca.pw>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 25/10/2019 à 06:46, Alastair D'Silva a écrit :
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> This patch adds platform support to map & release LPC memory.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>   arch/powerpc/include/asm/pnv-ocxl.h   |  2 ++
>   arch/powerpc/platforms/powernv/ocxl.c | 41 +++++++++++++++++++++++++++
>   include/linux/memory_hotplug.h        |  5 ++++
>   mm/memory_hotplug.c                   |  3 +-
>   4 files changed, 50 insertions(+), 1 deletion(-)
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
> index 8c65aacda9c8..c6d4234e0aba 100644
> --- a/arch/powerpc/platforms/powernv/ocxl.c
> +++ b/arch/powerpc/platforms/powernv/ocxl.c
> @@ -475,6 +475,47 @@ void pnv_ocxl_spa_release(void *platform_data)
>   }
>   EXPORT_SYMBOL_GPL(pnv_ocxl_spa_release);
>   
> +u64 pnv_ocxl_platform_lpc_setup(struct pci_dev *pdev, u64 size)
> +{
> +	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> +	struct pnv_phb *phb = hose->private_data;
> +	u32 bdfn = (pdev->bus->number << 8) | pdev->devfn;
> +	u64 base_addr = 0;
> +	int rc;
> +
> +	rc = opal_npu_mem_alloc(phb->opal_id, bdfn, size, &base_addr);
> +	if (rc) {
> +		dev_warn(&pdev->dev,
> +			 "OPAL could not allocate LPC memory, rc=%d\n", rc);
> +		return 0;
> +	}
> +
> +	base_addr = be64_to_cpu(base_addr);
> +
> +	rc = check_hotplug_memory_addressable(base_addr >> PAGE_SHIFT,
> +					      size >> PAGE_SHIFT);
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
> +	u32 bdfn = (pdev->bus->number << 8) | pdev->devfn;
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
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index f46ea71b4ffd..3f5f1a642abe 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -339,6 +339,11 @@ static inline int remove_memory(int nid, u64 start, u64 size)
>   static inline void __remove_memory(int nid, u64 start, u64 size) {}
>   #endif /* CONFIG_MEMORY_HOTREMOVE */
>   
> +#if CONFIG_MEMORY_HOTPLUG_SPARSE
> +int check_hotplug_memory_addressable(unsigned long pfn,
> +		unsigned long nr_pages);
> +#endif /* CONFIG_MEMORY_HOTPLUG_SPARSE */
> +
>   extern void __ref free_area_init_core_hotplug(int nid);
>   extern int __add_memory(int nid, u64 start, u64 size);
>   extern int add_memory(int nid, u64 start, u64 size);
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 2cecf07b396f..b39827dbd071 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -278,7 +278,7 @@ static int check_pfn_span(unsigned long pfn, unsigned long nr_pages,
>   	return 0;
>   }
>   
> -static int check_hotplug_memory_addressable(unsigned long pfn,
> +int check_hotplug_memory_addressable(unsigned long pfn,
>   					    unsigned long nr_pages)
>   {
>   	const u64 max_addr = PFN_PHYS(pfn + nr_pages) - 1;
> @@ -294,6 +294,7 @@ static int check_hotplug_memory_addressable(unsigned long pfn,
>   
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(check_hotplug_memory_addressable);


Making check_hotplug_memory_addressable() visible in the kernel could be 
a separate patch, to make sure it gets the proper attention instead of 
being buried in a powerpc patch.
Also, already mentioned, but it shouldn't be exported.


>   
>   /*
>    * Reasonably generic function for adding memory.  It is
> 

