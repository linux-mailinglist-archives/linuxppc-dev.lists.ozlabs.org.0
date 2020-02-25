Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1540916C241
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 14:27:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Rfq84l5wzDqTY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 00:27:00 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Rflz1XxTzDqNS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 00:24:14 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01PDNXLF040416
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 08:24:12 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yb1b8k7kc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 08:24:11 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Tue, 25 Feb 2020 13:24:08 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Feb 2020 13:24:01 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01PDO0jc51773506
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Feb 2020 13:24:00 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0CB611C05B;
 Tue, 25 Feb 2020 13:23:59 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C212811C058;
 Tue, 25 Feb 2020 13:23:58 +0000 (GMT)
Received: from bali.tlslab.ibm.com (unknown [9.101.4.17])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Feb 2020 13:23:58 +0000 (GMT)
Subject: Re: [PATCH v3 04/27] ocxl: Remove unnecessary externs
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-5-alastair@au1.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Tue, 25 Feb 2020 14:23:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200221032720.33893-5-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022513-4275-0000-0000-000003A552DA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022513-4276-0000-0000-000038B968AA
Message-Id: <4a29677a-885e-d493-c9f0-2698ea41a58c@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-25_04:2020-02-21,
 2020-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002250106
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
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/02/2020 à 04:26, Alastair D'Silva a écrit :
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> Function declarations don't need externs, remove the existing ones
> so they are consistent with newer code
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---

Thanks for the cleanup!
Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>




>   arch/powerpc/include/asm/pnv-ocxl.h | 32 ++++++++++++++---------------
>   include/misc/ocxl.h                 |  6 +++---
>   2 files changed, 18 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/pnv-ocxl.h b/arch/powerpc/include/asm/pnv-ocxl.h
> index 0b2a6707e555..b23c99bc0c84 100644
> --- a/arch/powerpc/include/asm/pnv-ocxl.h
> +++ b/arch/powerpc/include/asm/pnv-ocxl.h
> @@ -9,29 +9,27 @@
>   #define PNV_OCXL_TL_BITS_PER_RATE       4
>   #define PNV_OCXL_TL_RATE_BUF_SIZE       ((PNV_OCXL_TL_MAX_TEMPLATE+1) * PNV_OCXL_TL_BITS_PER_RATE / 8)
>   
> -extern int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base, u16 *enabled,
> -			u16 *supported);
> -extern int pnv_ocxl_get_pasid_count(struct pci_dev *dev, int *count);
> +int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base, u16 *enabled, u16 *supported);
> +int pnv_ocxl_get_pasid_count(struct pci_dev *dev, int *count);
>   
> -extern int pnv_ocxl_get_tl_cap(struct pci_dev *dev, long *cap,
> +int pnv_ocxl_get_tl_cap(struct pci_dev *dev, long *cap,
>   			char *rate_buf, int rate_buf_size);
> -extern int pnv_ocxl_set_tl_conf(struct pci_dev *dev, long cap,
> +int pnv_ocxl_set_tl_conf(struct pci_dev *dev, long cap,
>   			uint64_t rate_buf_phys, int rate_buf_size);
>   
> -extern int pnv_ocxl_get_xsl_irq(struct pci_dev *dev, int *hwirq);
> -extern void pnv_ocxl_unmap_xsl_regs(void __iomem *dsisr, void __iomem *dar,
> -				void __iomem *tfc, void __iomem *pe_handle);
> -extern int pnv_ocxl_map_xsl_regs(struct pci_dev *dev, void __iomem **dsisr,
> -				void __iomem **dar, void __iomem **tfc,
> -				void __iomem **pe_handle);
> +int pnv_ocxl_get_xsl_irq(struct pci_dev *dev, int *hwirq);
> +void pnv_ocxl_unmap_xsl_regs(void __iomem *dsisr, void __iomem *dar,
> +			     void __iomem *tfc, void __iomem *pe_handle);
> +int pnv_ocxl_map_xsl_regs(struct pci_dev *dev, void __iomem **dsisr,
> +			  void __iomem **dar, void __iomem **tfc,
> +			  void __iomem **pe_handle);
>   
> -extern int pnv_ocxl_spa_setup(struct pci_dev *dev, void *spa_mem, int PE_mask,
> -			void **platform_data);
> -extern void pnv_ocxl_spa_release(void *platform_data);
> -extern int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle);
> +int pnv_ocxl_spa_setup(struct pci_dev *dev, void *spa_mem, int PE_mask, void **platform_data);
> +void pnv_ocxl_spa_release(void *platform_data);
> +int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle);
>   
> -extern int pnv_ocxl_alloc_xive_irq(u32 *irq, u64 *trigger_addr);
> -extern void pnv_ocxl_free_xive_irq(u32 irq);
> +int pnv_ocxl_alloc_xive_irq(u32 *irq, u64 *trigger_addr);
> +void pnv_ocxl_free_xive_irq(u32 irq);
>   #ifdef CONFIG_MEMORY_HOTPLUG_SPARSE
>   u64 pnv_ocxl_platform_lpc_setup(struct pci_dev *pdev, u64 size);
>   void pnv_ocxl_platform_lpc_release(struct pci_dev *pdev);
> diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
> index 06dd5839e438..0a762e387418 100644
> --- a/include/misc/ocxl.h
> +++ b/include/misc/ocxl.h
> @@ -173,7 +173,7 @@ int ocxl_context_detach(struct ocxl_context *ctx);
>    *
>    * Returns 0 on success, negative on failure
>    */
> -extern int ocxl_afu_irq_alloc(struct ocxl_context *ctx, int *irq_id);
> +int ocxl_afu_irq_alloc(struct ocxl_context *ctx, int *irq_id);
>   
>   /**
>    * Frees an IRQ associated with an AFU context
> @@ -182,7 +182,7 @@ extern int ocxl_afu_irq_alloc(struct ocxl_context *ctx, int *irq_id);
>    *
>    * Returns 0 on success, negative on failure
>    */
> -extern int ocxl_afu_irq_free(struct ocxl_context *ctx, int irq_id);
> +int ocxl_afu_irq_free(struct ocxl_context *ctx, int irq_id);
>   
>   /**
>    * Gets the address of the trigger page for an IRQ
> @@ -193,7 +193,7 @@ extern int ocxl_afu_irq_free(struct ocxl_context *ctx, int irq_id);
>    *
>    * returns the trigger page address, or 0 if the IRQ is not valid
>    */
> -extern u64 ocxl_afu_irq_get_addr(struct ocxl_context *ctx, int irq_id);
> +u64 ocxl_afu_irq_get_addr(struct ocxl_context *ctx, int irq_id);
>   
>   /**
>    * Provide a callback to be called when an IRQ is triggered
> 

