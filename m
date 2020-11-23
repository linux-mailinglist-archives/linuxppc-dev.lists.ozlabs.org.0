Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7432C0388
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Nov 2020 11:43:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CfkKR5JCpzDqF3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Nov 2020 21:43:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZYtMHXsB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CfkG633WbzDqQ8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 21:41:02 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ANAXqQp031441
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 05:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=FEoNXq24gOnt8mDVXN8EmXTM7lMVrdguSlXRr9l2Pew=;
 b=ZYtMHXsBpmnctEn2e+hf88kzbtjGk91AA0ksV34DRqKtt9qkYYLXQkkUQdKj0zgPwKBo
 VDGxbXZQaKF5pd3z0KTi8gZM75f28Ve9czu5XH+5uHJY+0Akmcphrna/oiYA6k8BLNj8
 +lG9OXXqCvnSxdMfixcTEl4F4xKodMs6/7CoXb3I9fvJWSL6QiwDdNV76zsFNKVe7bXa
 I5hoxfaPK5J7AN1T893nVypuj1nSdozmOGb25FT5QSTr9nEIDRwLTz7QVA3sDvUm0VgG
 ZW0u5Xh9I64kx/Lw3W/8ixQYE50VUoY7B4DzwNXN1KqCqFWB6rdAaGl50QnUALXMZIg1 FQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34ypahg72g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 05:40:59 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0ANAcAcd018898
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 10:40:57 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 34xt5hadeu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 10:40:57 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0ANAetWn4784864
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Nov 2020 10:40:55 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 110E45205A;
 Mon, 23 Nov 2020 10:40:55 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.86.73])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id E5D1552065;
 Mon, 23 Nov 2020 10:40:54 +0000 (GMT)
Subject: Re: [PATCH V2 4/5] ocxl: Add mmu notifier
To: Christophe Lombard <clombard@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com
References: <20201120173241.59229-1-clombard@linux.vnet.ibm.com>
 <20201120173241.59229-5-clombard@linux.vnet.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <906bd9a9-15d2-fb87-5033-60e21e8d1fdd@linux.ibm.com>
Date: Mon, 23 Nov 2020 11:40:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120173241.59229-5-clombard@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-23_06:2020-11-23,
 2020-11-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011230072
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



On 20/11/2020 18:32, Christophe Lombard wrote:
> Add invalidate_range mmu notifier, when required (ATSD access of MMIO
> registers is available), to initiate TLB invalidation commands.
> For the time being, the ATSD0 set of registers is used by default.
> 
> The pasid and bdf values have to be configured in the Process Element
> Entry.
> The PEE must be set up to match the BDF/PASID of the AFU.
> 
> Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
> ---
>   drivers/misc/ocxl/link.c | 58 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
> index 20444db8a2bb..100bdfe9ec37 100644
> --- a/drivers/misc/ocxl/link.c
> +++ b/drivers/misc/ocxl/link.c
> @@ -2,8 +2,10 @@
>   // Copyright 2017 IBM Corp.
>   #include <linux/sched/mm.h>
>   #include <linux/mutex.h>
> +#include <linux/mm.h>
>   #include <linux/mm_types.h>
>   #include <linux/mmu_context.h>
> +#include <linux/mmu_notifier.h>
>   #include <asm/copro.h>
>   #include <asm/pnv-ocxl.h>
>   #include <asm/xive.h>
> @@ -33,6 +35,7 @@
> 
>   #define SPA_PE_VALID		0x80000000
> 
> +struct ocxl_link;
> 
>   struct pe_data {
>   	struct mm_struct *mm;
> @@ -41,6 +44,8 @@ struct pe_data {
>   	/* opaque pointer to be passed to the above callback */
>   	void *xsl_err_data;
>   	struct rcu_head rcu;
> +	struct ocxl_link *link;
> +	struct mmu_notifier mmu_notifier;
>   };
> 
>   struct spa {
> @@ -83,6 +88,8 @@ struct ocxl_link {
>   	int domain;
>   	int bus;
>   	int dev;
> +	void __iomem *arva;     /* ATSD register virtual address */
> +	spinlock_t atsd_lock;   /* to serialize shootdowns */
>   	atomic_t irq_available;
>   	struct spa *spa;
>   	void *platform_data;
> @@ -403,6 +410,11 @@ static int alloc_link(struct pci_dev *dev, int PE_mask, struct ocxl_link **out_l
>   	if (rc)
>   		goto err_xsl_irq;
> 
> +	rc = pnv_ocxl_map_lpar(dev, mfspr(SPRN_LPID), 0,
> +					  &link->arva);
> +	if (!rc)
> +		spin_lock_init(&link->atsd_lock);
> +


We could use a comment to say that if arva = 0, then we don't need mmio 
shootdowns and we rely on hardware snooping.

Also, we could always initialize the spin lock, it doesn't hurt and make 
the code more readable.

   Fred


>   	*out_link = link;
>   	return 0;
> 
> @@ -454,6 +466,11 @@ static void release_xsl(struct kref *ref)
>   {
>   	struct ocxl_link *link = container_of(ref, struct ocxl_link, ref);
> 
> +	if (link->arva) {
> +		pnv_ocxl_unmap_lpar(&link->arva);
> +		link->arva = NULL;
> +	}
> +
>   	list_del(&link->list);
>   	/* call platform code before releasing data */
>   	pnv_ocxl_spa_release(link->platform_data);
> @@ -470,6 +487,26 @@ void ocxl_link_release(struct pci_dev *dev, void *link_handle)
>   }
>   EXPORT_SYMBOL_GPL(ocxl_link_release);
> 
> +static void invalidate_range(struct mmu_notifier *mn,
> +			     struct mm_struct *mm,
> +			     unsigned long start, unsigned long end)
> +{
> +	struct pe_data *pe_data = container_of(mn, struct pe_data, mmu_notifier);
> +	struct ocxl_link *link = pe_data->link;
> +	unsigned long addr, pid, page_size = PAGE_SIZE;
> +
> +	pid = mm->context.id;
> +
> +	spin_lock(&link->atsd_lock);
> +	for (addr = start; addr < end; addr += page_size)
> +		pnv_ocxl_tlb_invalidate(&link->arva, pid, addr);
> +	spin_unlock(&link->atsd_lock);
> +}
> +
> +static const struct mmu_notifier_ops ocxl_mmu_notifier_ops = {
> +	.invalidate_range = invalidate_range,
> +};
> +
>   static u64 calculate_cfg_state(bool kernel)
>   {
>   	u64 state;
> @@ -526,6 +563,8 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>   	pe_data->mm = mm;
>   	pe_data->xsl_err_cb = xsl_err_cb;
>   	pe_data->xsl_err_data = xsl_err_data;
> +	pe_data->link = link;
> +	pe_data->mmu_notifier.ops = &ocxl_mmu_notifier_ops;
> 
>   	memset(pe, 0, sizeof(struct ocxl_process_element));
>   	pe->config_state = cpu_to_be64(calculate_cfg_state(pidr == 0));
> @@ -542,8 +581,16 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>   	 * by the nest MMU. If we have a kernel context, TLBIs are
>   	 * already global.
>   	 */
> -	if (mm)
> +	if (mm) {
>   		mm_context_add_copro(mm);
> +		if (link->arva) {
> +			/* Use MMIO registers for the TLB Invalidate
> +			 * operations.
> +			 */
> +			mmu_notifier_register(&pe_data->mmu_notifier, mm);
> +		}
> +	}
> +
>   	/*
>   	 * Barrier is to make sure PE is visible in the SPA before it
>   	 * is used by the device. It also helps with the global TLBI
> @@ -674,6 +721,15 @@ int ocxl_link_remove_pe(void *link_handle, int pasid)
>   		WARN(1, "Couldn't find pe data when removing PE\n");
>   	} else {
>   		if (pe_data->mm) {
> +			if (link->arva) {
> +				mmu_notifier_unregister(&pe_data->mmu_notifier,
> +							pe_data->mm);
> +				spin_lock(&link->atsd_lock);
> +				pnv_ocxl_tlb_invalidate(&link->arva,
> +							pe_data->mm->context.id,
> +							0ull);
> +				spin_unlock(&link->atsd_lock);
> +			}
>   			mm_context_remove_copro(pe_data->mm);
>   			mmdrop(pe_data->mm);
>   		}
> 
