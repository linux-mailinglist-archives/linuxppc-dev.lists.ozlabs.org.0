Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC232C4230
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 15:33:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch3KR6bDQzDqxX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 01:33:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EX3Yigf/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch2kF4xJ3zDqY0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 01:06:29 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0APE4cmP060167
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 09:06:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jWWoyzhcZhRsQPBmR/boTdA9ww3Jokt33tLbSITfGro=;
 b=EX3Yigf/embCZ2gdf2LKhWU14hXj3nBNqFc43FDBPLNJ5+V9NXvX5WB5tbcYAG5iJqRv
 pT5UnHpsgc5qWmmN5alkkkzjuyNUwdfvsILhunllod50vQct69PFEIjxbXT/5S13/fS2
 4PkYFOhcRTe/y1r8jXfhQKUB7ODmPcxx6YjrAzAsrOA4XsbrZWVL/a+AiURE12T/PQ7v
 7P+9WY6az/GPXOh85rSPkqfXOf5B0v1m1lSGE9O7NokSwcbUh/olPfRVKNNGsBMcCu/b
 cqLVXlsnzicrbZWDcLxqxUge4AlTjkfdVthkyi5sGOnJI3+v/nkVSpg0YLksKUbJLgR+ WQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 351347q0m3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 09:06:25 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0APDwREY007979
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 14:06:24 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 34xth8cq9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 14:06:23 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0APE6LDK48169300
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 14:06:21 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B77DAA4051;
 Wed, 25 Nov 2020 14:06:21 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C93BA4065;
 Wed, 25 Nov 2020 14:06:21 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.70.43])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 14:06:21 +0000 (GMT)
Subject: Re: [PATCH V3 2/5] ocxl: Initiate a TLB invalidate command
To: Christophe Lombard <clombard@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com
References: <20201124095838.18665-1-clombard@linux.vnet.ibm.com>
 <20201124095838.18665-3-clombard@linux.vnet.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <4f392167-beec-3a20-dfee-dd6b6b7ea65d@linux.ibm.com>
Date: Wed, 25 Nov 2020 15:06:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124095838.18665-3-clombard@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_08:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011250084
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



On 24/11/2020 10:58, Christophe Lombard wrote:
> When a TLB Invalidate is required for the Logical Partition, the following
> sequence has to be performed:
> 
> 1. Load MMIO ATSD AVA register with the necessary value, if required.
> 2. Write the MMIO ATSD launch register to initiate the TLB Invalidate
> command.
> 3. Poll the MMIO ATSD status register to determine when the TLB Invalidate
>     has been completed.
> 
> Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
> ---
>   arch/powerpc/include/asm/pnv-ocxl.h   | 51 +++++++++++++++++++
>   arch/powerpc/platforms/powernv/ocxl.c | 70 +++++++++++++++++++++++++++
>   2 files changed, 121 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/pnv-ocxl.h b/arch/powerpc/include/asm/pnv-ocxl.h
> index 60c3c74427d9..9acd1fbf1197 100644
> --- a/arch/powerpc/include/asm/pnv-ocxl.h
> +++ b/arch/powerpc/include/asm/pnv-ocxl.h
> @@ -3,12 +3,59 @@
>   #ifndef _ASM_PNV_OCXL_H
>   #define _ASM_PNV_OCXL_H
> 
> +#include <linux/bitfield.h>
>   #include <linux/pci.h>
> 
>   #define PNV_OCXL_TL_MAX_TEMPLATE        63
>   #define PNV_OCXL_TL_BITS_PER_RATE       4
>   #define PNV_OCXL_TL_RATE_BUF_SIZE       ((PNV_OCXL_TL_MAX_TEMPLATE+1) * PNV_OCXL_TL_BITS_PER_RATE / 8)
> 
> +#define PNV_OCXL_ATSD_TIMEOUT		1
> +
> +/* TLB Management Instructions */
> +#define PNV_OCXL_ATSD_LNCH		0x00
> +/* Radix Invalidate */
> +#define   PNV_OCXL_ATSD_LNCH_R		PPC_BIT(0)
> +/* Radix Invalidation Control
> + * 0b00 Just invalidate TLB.
> + * 0b01 Invalidate just Page Walk Cache.
> + * 0b10 Invalidate TLB, Page Walk Cache, and any
> + * caching of Partition and Process Table Entries.
> + */
> +#define   PNV_OCXL_ATSD_LNCH_RIC	PPC_BITMASK(1, 2)
> +/* Number and Page Size of translations to be invalidated */
> +#define   PNV_OCXL_ATSD_LNCH_LP		PPC_BITMASK(3, 10)
> +/* Invalidation Criteria
> + * 0b00 Invalidate just the target VA.
> + * 0b01 Invalidate matching PID.
> + */
> +#define   PNV_OCXL_ATSD_LNCH_IS		PPC_BITMASK(11, 12)
> +/* 0b1: Process Scope, 0b0: Partition Scope */
> +#define   PNV_OCXL_ATSD_LNCH_PRS	PPC_BIT(13)
> +/* Invalidation Flag */
> +#define   PNV_OCXL_ATSD_LNCH_B		PPC_BIT(14)
> +/* Actual Page Size to be invalidated
> + * 000 4KB
> + * 101 64KB
> + * 001 2MB
> + * 010 1GB
> + */
> +#define   PNV_OCXL_ATSD_LNCH_AP		PPC_BITMASK(15, 17)
> +/* Defines the large page select
> + * L=0b0 for 4KB pages
> + * L=0b1 for large pages)
> + */
> +#define   PNV_OCXL_ATSD_LNCH_L		PPC_BIT(18)
> +/* Process ID */
> +#define   PNV_OCXL_ATSD_LNCH_PID	PPC_BITMASK(19, 38)
> +/* NoFlush – Assumed to be 0b0 */
> +#define   PNV_OCXL_ATSD_LNCH_F		PPC_BIT(39)
> +#define   PNV_OCXL_ATSD_LNCH_OCAPI_SLBI	PPC_BIT(40)
> +#define   PNV_OCXL_ATSD_LNCH_OCAPI_SINGLETON	PPC_BIT(41)
> +#define PNV_OCXL_ATSD_AVA		0x08
> +#define   PNV_OCXL_ATSD_AVA_AVA		PPC_BITMASK(0, 51)
> +#define PNV_OCXL_ATSD_STAT		0x10
> +
>   int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base, u16 *enabled, u16 *supported);
>   int pnv_ocxl_get_pasid_count(struct pci_dev *dev, int *count);
> 
> @@ -31,4 +78,8 @@ int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle);
>   int pnv_ocxl_map_lpar(struct pci_dev *dev, uint64_t lparid,
>   		      uint64_t lpcr, void __iomem **arva);
>   void pnv_ocxl_unmap_lpar(void __iomem *arva);
> +void pnv_ocxl_tlb_invalidate(void __iomem *arva,
> +			     unsigned long pid,
> +			     unsigned long addr,
> +			     unsigned long page_size);
>   #endif /* _ASM_PNV_OCXL_H */
> diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
> index 57fc1062677b..f665846d2b28 100644
> --- a/arch/powerpc/platforms/powernv/ocxl.c
> +++ b/arch/powerpc/platforms/powernv/ocxl.c
> @@ -528,3 +528,73 @@ void pnv_ocxl_unmap_lpar(void __iomem *arva)
>   	iounmap(arva);
>   }
>   EXPORT_SYMBOL_GPL(pnv_ocxl_unmap_lpar);
> +
> +void pnv_ocxl_tlb_invalidate(void __iomem *arva,
> +			     unsigned long pid,
> +			     unsigned long addr,
> +			     unsigned long page_size)
> +{
> +	unsigned long timeout = jiffies + (HZ * PNV_OCXL_ATSD_TIMEOUT);
> +	u64 val = 0ull;
> +	int pend;
> +	u8 size;
> +
> +	if (!(arva))
> +		return;
> +
> +	if (addr) {
> +		/* load Abbreviated Virtual Address register with
> +		 * the necessary value
> +		 */
> +		val |= FIELD_PREP(PNV_OCXL_ATSD_AVA_AVA, addr >> (63-51));
> +		out_be64(arva + PNV_OCXL_ATSD_AVA, val);
> +	}
> +
> +	/* Write access initiates a shoot down to initiate the
> +	 * TLB Invalidate command
> +	 */
> +	val = PNV_OCXL_ATSD_LNCH_R;
> +	if (addr) {
> +		val |= FIELD_PREP(PNV_OCXL_ATSD_LNCH_RIC, 0b00);
> +		val |= FIELD_PREP(PNV_OCXL_ATSD_LNCH_IS, 0b00);
> +	} else {
> +		val |= FIELD_PREP(PNV_OCXL_ATSD_LNCH_RIC, 0b10);
> +		val |= FIELD_PREP(PNV_OCXL_ATSD_LNCH_IS, 0b01);
> +		val |= PNV_OCXL_ATSD_LNCH_OCAPI_SINGLETON;
> +	}
> +	val |= PNV_OCXL_ATSD_LNCH_PRS;
> +	/* Actual Page Size to be invalidated
> +	 * 000 4KB
> +	 * 101 64KB
> +	 * 001 2MB
> +	 * 010 1GB
> +	 */
> +	size = 0b101;
> +	if (page_size == 0x10000)
> +		size = 0b000;


Ooops, typo, we want page_size == 0x1000

   Fred


> +	if (page_size == 0x200000)
> +		size = 0b001;
> +	if (page_size == 0x40000000)
> +		size = 0b010;
> +	val |= FIELD_PREP(PNV_OCXL_ATSD_LNCH_AP, size);
> +	val |= FIELD_PREP(PNV_OCXL_ATSD_LNCH_PID, pid);
> +	out_be64(arva + PNV_OCXL_ATSD_LNCH, val);
> +
> +	/* Poll the ATSD status register to determine when the
> +	 * TLB Invalidate has been completed.
> +	 */
> +	val = in_be64(arva + PNV_OCXL_ATSD_STAT);
> +	pend = val >> 63;
> +
> +	while (pend) {
> +		if (time_after_eq(jiffies, timeout)) {
> +			pr_err("%s - Timeout while reading XTS MMIO ATSD status register (val=%#llx, pidr=0x%lx)\n",
> +			       __func__, val, pid);
> +			return;
> +		}
> +		cpu_relax();
> +		val = in_be64(arva + PNV_OCXL_ATSD_STAT);
> +		pend = val >> 63;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(pnv_ocxl_tlb_invalidate);
> 
