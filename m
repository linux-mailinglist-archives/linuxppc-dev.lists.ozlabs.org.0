Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C473C2B4E7C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 18:53:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZcBm5NCQzDqFp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 04:53:52 +1100 (AEDT)
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
 header.s=pp1 header.b=XmVKGuPj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZc8F6CrNzDqMt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 04:51:40 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AGHWi08111631
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 12:51:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sgqgpdl0BCYayfyzuu4eGzur2ElTh/xkLOiv750cFK4=;
 b=XmVKGuPjslrk7kSStrABZRRkGiWA5QiNJI9z/4lRTEvnojTZ1fLpi6mm3aVMCcBO4HRC
 FEZZvVP/WI76Yczpek167a1tFcDKJxTC/UUlqyEUWIbSTO8PpXnlwH1YRyIC4aTq0Bw8
 MxlDkb4VUTUxZKvuscXSw/8i//bS/66zIpfWg68UaPvbw+JmZQ7IM6vOFkODW59yLzs6
 FnhZCm+7MyVGFZZKdms7u9ZEOYy/+7oFfPNx0QmSKP6jNSNd56Ki1Jh/eYDeiaK/RPML
 TANI2u4NWwzOJy08FAZonGAphBAhC942EurQ+AtqW2YMdZxtrJFO6b5gihzv3yjy/KAP HQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34uvbcbcb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 12:51:37 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AGHmLEb032005
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 17:51:35 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 34t6v896tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 17:51:35 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AGHpX4C918182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Nov 2020 17:51:33 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 205114C046;
 Mon, 16 Nov 2020 17:51:33 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D87AF4C044;
 Mon, 16 Nov 2020 17:51:32 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.12.170])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 16 Nov 2020 17:51:32 +0000 (GMT)
Subject: Re: [PATCH] ocxl: Mmio invalidation support
To: Christophe Lombard <clombard@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>
References: <20201113153333.290505-1-clombard@linux.vnet.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <b6357be9-4b65-eb53-8265-5898381d950f@linux.ibm.com>
Date: Mon, 16 Nov 2020 18:51:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113153333.290505-1-clombard@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-16_09:2020-11-13,
 2020-11-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 suspectscore=2
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011160100
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



On 13/11/2020 16:33, Christophe Lombard wrote:
> OpenCAPI 4.0/5.0 with TLBI/SLBI Snooping, is not used due to performance
> problems caused by the PAU having to process all incoming TLBI/SLBI
> commands which will cause them to back up on the PowerBus.
> 
> When the Address Translation Mode requires TLB and SLB Invalidate
> operations to be initiated using MMIO registers, a set of registers like
> the following is used:
> • XTS MMIO ATSD0 LPARID register
> • XTS MMIO ATSD0 AVA register
> • XTS MMIO ATSD0 launch register, write access initiates a shoot down
> • XTS MMIO ATSD0 status register
> 
> The MMIO based mechanism also blocks the NPU/PAU from snooping TLBIE
> commands from the PowerBus.
> 
> The Shootdown commands (ATSD) will be generated using MMIO registers
> in the NPU/PAU and sent to the device.
> 
> Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
> ---
>   arch/powerpc/include/asm/pnv-ocxl.h   |   2 +
>   arch/powerpc/platforms/powernv/ocxl.c |  19 +++
>   drivers/misc/ocxl/link.c              | 180 ++++++++++++++++++++++----
>   drivers/misc/ocxl/ocxl_internal.h     |  46 ++++++-
>   drivers/misc/ocxl/trace.h             | 125 ++++++++++++++++++
>   5 files changed, 348 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/pnv-ocxl.h b/arch/powerpc/include/asm/pnv-ocxl.h
> index d37ededca3ee..4a23abcc347b 100644
> --- a/arch/powerpc/include/asm/pnv-ocxl.h
> +++ b/arch/powerpc/include/asm/pnv-ocxl.h
> @@ -28,4 +28,6 @@ int pnv_ocxl_spa_setup(struct pci_dev *dev, void *spa_mem, int PE_mask, void **p
>   void pnv_ocxl_spa_release(void *platform_data);
>   int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle);
> 
> +extern int pnv_ocxl_map_lpar(struct pci_dev *dev, uint64_t lparid,
> +			     uint64_t lpcr);


"extern" is useless



>   #endif /* _ASM_PNV_OCXL_H */
> diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
> index ecdad219d704..100546ea635f 100644
> --- a/arch/powerpc/platforms/powernv/ocxl.c
> +++ b/arch/powerpc/platforms/powernv/ocxl.c
> @@ -483,3 +483,22 @@ int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle)
>   	return rc;
>   }
>   EXPORT_SYMBOL_GPL(pnv_ocxl_spa_remove_pe_from_cache);
> +
> +int pnv_ocxl_map_lpar(struct pci_dev *dev, uint64_t lparid,
> +		      uint64_t lpcr)
> +{
> +	struct pci_controller *hose = pci_bus_to_host(dev->bus);
> +	struct pnv_phb *phb = hose->private_data;
> +	u32 bdfn;
> +	int rc;
> +
> +	bdfn = (dev->bus->number << 8) | dev->devfn;


I was told a bit too late that pci_dev_id() exists, so we should 
probably use from now on.



> +	rc = opal_npu_map_lpar(phb->opal_id, bdfn, lparid, lpcr);
> +	if (rc) {
> +		dev_err(&dev->dev, "Error mapping device to LPAR: %d\n", rc);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(pnv_ocxl_map_lpar);
> diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
> index fd73d3bc0eb6..9b5b77d40734 100644
> --- a/drivers/misc/ocxl/link.c
> +++ b/drivers/misc/ocxl/link.c



Overall, there are many changes in that file and it would help the 
review if it could be broken up in a set of smaller patches.



> @@ -4,6 +4,8 @@
>   #include <linux/mutex.h>
>   #include <linux/mm_types.h>
>   #include <linux/mmu_context.h>
> +#include <linux/mm.h>
> +#include <linux/mmu_notifier.h>
>   #include <asm/copro.h>
>   #include <asm/pnv-ocxl.h>
>   #include <asm/xive.h>
> @@ -33,6 +35,31 @@
> 
>   #define SPA_PE_VALID		0x80000000
> 
> +struct spa;
> +
> +/*
> + * A opencapi link can be used be by several PCI functions. We have
> + * one link per device slot.
> + *
> + * A linked list of opencapi links should suffice, as there's a
> + * limited number of opencapi slots on a system and lookup is only
> + * done when the device is probed
> + */
> +struct ocxl_link {
> +	struct list_head list;
> +	struct kref ref;
> +	int domain;
> +	int bus;
> +	int dev;
> +	u64 mmio_atsd; /* ATSD physical address */
> +	void __iomem *base;    /* ATSD register virtual address */
> +	spinlock_t atsd_lock; // to serialize shootdowns
> +	atomic_t irq_available;
> +	struct spa *spa;
> +	void *platform_data;
> +};
> +static struct list_head links_list = LIST_HEAD_INIT(links_list);
> +static DEFINE_MUTEX(links_list_lock);
> 
>   struct pe_data {
>   	struct mm_struct *mm;
> @@ -41,6 +68,8 @@ struct pe_data {
>   	/* opaque pointer to be passed to the above callback */
>   	void *xsl_err_data;
>   	struct rcu_head rcu;
> +	struct ocxl_link *link;
> +	struct mmu_notifier mmu_notifier;
>   };
> 
>   struct spa {
> @@ -69,27 +98,6 @@ struct spa {
>   	} xsl_fault;
>   };
> 
> -/*
> - * A opencapi link can be used be by several PCI functions. We have
> - * one link per device slot.
> - *
> - * A linked list of opencapi links should suffice, as there's a
> - * limited number of opencapi slots on a system and lookup is only
> - * done when the device is probed
> - */
> -struct ocxl_link {
> -	struct list_head list;
> -	struct kref ref;
> -	int domain;
> -	int bus;
> -	int dev;
> -	atomic_t irq_available;
> -	struct spa *spa;
> -	void *platform_data;
> -};
> -static struct list_head links_list = LIST_HEAD_INIT(links_list);
> -static DEFINE_MUTEX(links_list_lock);
> -
>   enum xsl_response {
>   	CONTINUE,
>   	ADDRESS_ERROR,
> @@ -126,6 +134,8 @@ static void ack_irq(struct spa *spa, enum xsl_response r)
>   	}
>   }
> 
> +static const struct mmu_notifier_ops ocxl_mmu_notifier_ops;
> +
>   static void xsl_fault_handler_bh(struct work_struct *fault_work)
>   {
>   	vm_fault_t flt = 0;
> @@ -376,6 +386,7 @@ static void free_spa(struct ocxl_link *link)
> 
>   static int alloc_link(struct pci_dev *dev, int PE_mask, struct ocxl_link **out_link)
>   {
> +	struct pci_controller *hose = pci_bus_to_host(dev->bus);
>   	struct ocxl_link *link;
>   	int rc;
> 
> @@ -403,6 +414,22 @@ static int alloc_link(struct pci_dev *dev, int PE_mask, struct ocxl_link **out_l
>   	if (rc)
>   		goto err_xsl_irq;
> 
> +	/* Since OpenCAPI 5.0, Address Translation Mode requires TLB
> +	 * and SLB Invalidate operations to be initiated using MMIO
> +	 * registers
> +	 */
> +	if (of_property_read_u64_index(hose->dn, "ibm,mmio-atsd",
> +				       0, &link->mmio_atsd)) {
> +		dev_info(&dev->dev, "No available ATSD found\n");
> +	}
> +	if (link->mmio_atsd) {
> +		link->base = ioremap(link->mmio_atsd, 24);
> +		if (!link->base)
> +			dev_warn(&dev->dev, "ioremap failed - mmio_atsd: %#llx\n", link->mmio_atsd);
> +		else
> +			pnv_ocxl_map_lpar(dev, mfspr(SPRN_LPID), 0);
> +	}



To stay coherent with how we've done things like interrupts, the
device tree parsing and ioremap() for the shootdown page should be
done in a platform-specific file (powernv)

Also, could we get a more descriptive name than link->base?


> +
>   	*out_link = link;
>   	return 0;
> 
> @@ -464,12 +491,101 @@ void ocxl_link_release(struct pci_dev *dev, void *link_handle)
>   {
>   	struct ocxl_link *link = (struct ocxl_link *) link_handle;
> 
> +	if (link->base) {
> +		iounmap(link->base);
> +		link->base = NULL;
> +	}


What's allocated in alloc_link(), i.e. the shootdown page, should be
released in release_xsl() and not in ocxl_link_release() (it's too
early in case of several functions).


>   	mutex_lock(&links_list_lock);
>   	kref_put(&link->ref, release_xsl);
>   	mutex_unlock(&links_list_lock);
>   }
>   EXPORT_SYMBOL_GPL(ocxl_link_release);
> 
> +static void tlb_invalidate(struct ocxl_link *link,
> +			   unsigned long pid,
> +			   unsigned long addr)
> +{
> +	unsigned long timeout = jiffies + (HZ * OCXL_ATSD_TIMEOUT);
> +	uint64_t val;
> +	int pend;
> +
> +	if (!link->base)
> +		return;
> +
> +	spin_lock(&link->atsd_lock);


Looks like atsd_lock is not initialized.


> +	if (addr) {
> +		/* load Abbreviated Virtual Address register with
> +		 * the necessary value
> +		 */
> +		val = SETFIELD(XTS_ATSD_AVA_AVA, 0ull, addr >> (63-51));
> +		out_be64(link->base + XTS_ATSD_AVA, val);
> +		eieio();


That eieio() needs a comment.


> +		trace_ocxl_mmu_notifier_mmio_atsd_ava(val, pid);
> +	}
> +
> +	/* Write access initiates a shoot down to initiate the
> +	 * TLB Invalidate command
> +	 */
> +	val = XTS_ATSD_LNCH_R;


All that code should be in a platform-specific file.


> +	if (addr) {
> +		val = SETFIELD(XTS_ATSD_LNCH_RIC, val, 0b00);
> +		val = SETFIELD(XTS_ATSD_LNCH_IS, val, 0b00);
> +	} else {
> +		val = SETFIELD(XTS_ATSD_LNCH_RIC, val, 0b10);
> +		val = SETFIELD(XTS_ATSD_LNCH_IS, val, 0b01);
> +		val |= XTS_ATSD_LNCH_OCAPI_SINGLETON;
> +	}
> +	val |= XTS_ATSD_LNCH_PRS;
> +	val = SETFIELD(XTS_ATSD_LNCH_AP, val, 0b101);
> +	val = SETFIELD(XTS_ATSD_LNCH_PID, val, pid);
> +	out_be64(link->base + XTS_ATSD_LNCH, val);
> +	trace_ocxl_mmu_notifier_mmio_atsd_lnch(val, addr, pid);
> +
> +	/* Poll the ATSD status register to determine when the
> +	* TLB Invalidate has been completed.
> +	*/
> +	val = in_be64(link->base + XTS_ATSD_STAT);
> +	pend = val >> 63;
> +	trace_ocxl_mmu_notifier_mmio_atsd_stat(val, addr, pid);
> +
> +	while (pend) {
> +		if (time_after_eq(jiffies, timeout)) {
> +			pr_err("%s - Timeout while reading XTS MMIO ATSD status register (val=%#llx, pidr=0x%lx)\n",
> +			       __func__, val, pid);
> +			spin_unlock(&link->atsd_lock);
> +			return;
> +		}
> +		cpu_relax();
> +		val = in_be64(link->base + XTS_ATSD_STAT);
> +		pend = val >> 63;
> +	}
> +	spin_unlock(&link->atsd_lock);
> +	trace_ocxl_mmu_notifier_mmio_atsd_stat(val, addr, pid);
> +}
> +
> +static void invalidate_range_end(struct mmu_notifier *mn,
> +				 const struct mmu_notifier_range *range)
> +{
> +	struct pe_data *pe_data = container_of(mn, struct pe_data, mmu_notifier);
> +	struct ocxl_link *link = pe_data->link;
> +	struct mm_struct *mm = mn->mm;
> +	unsigned long addr, pid, page_size = PAGE_SIZE;
> +
> +	pid = mm->context.id;
> +	trace_ocxl_mmu_notifier_range(range->start, range->end, pid);
> +
> +	for (addr = range->start; addr < range->end; addr += page_size)
> +		tlb_invalidate(link, pid, addr);
> +}
> +
> +static const struct mmu_notifier_ops ocxl_mmu_notifier_ops = {
> +	/* invalidate_range_end() is called when all pages in the
> +	 * range have been unmapped and the pages have been freed by
> +	 * the VM
> +	 */
> +	.invalidate_range_end = invalidate_range_end,
> +};
> +


See comments in mmu_notifier.h. Looks like we shouldn't be using 
invalidate_range_end(), it's too late

Did we test abrupt death of the host process? Do we need to also use 
.release()?



>   static u64 calculate_cfg_state(bool kernel)
>   {
>   	u64 state;
> @@ -517,7 +633,7 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>   		goto unlock;
>   	}
> 
> -	pe_data = kmalloc(sizeof(*pe_data), GFP_KERNEL);
> +	pe_data = kzalloc(sizeof(*pe_data), GFP_KERNEL);
>   	if (!pe_data) {
>   		rc = -ENOMEM;
>   		goto unlock;
> @@ -526,9 +642,13 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>   	pe_data->mm = mm;
>   	pe_data->xsl_err_cb = xsl_err_cb;
>   	pe_data->xsl_err_data = xsl_err_data;
> +	pe_data->link = link;
> +	pe_data->mmu_notifier.ops = &ocxl_mmu_notifier_ops;
> 
>   	memset(pe, 0, sizeof(struct ocxl_process_element));
>   	pe->config_state = cpu_to_be64(calculate_cfg_state(pidr == 0));
> +	pe->pasid = cpu_to_be32(pasid << (31 - 19));
> +	pe->bdf = cpu_to_be32(1 << (31 - 15));


why do we hard-code bdf 1?



>   	pe->lpid = cpu_to_be32(mfspr(SPRN_LPID));
>   	pe->pid = cpu_to_be32(pidr);
>   	pe->tid = cpu_to_be32(tidr);
> @@ -540,8 +660,17 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>   	 * by the nest MMU. If we have a kernel context, TLBIs are
>   	 * already global.
>   	 */
> -	if (mm)
> +	if (mm) {
>   		mm_context_add_copro(mm);
> +		if (link->base) {
> +			/* Use MMIO registers for the TLB and SLB
> +			 * Invalidate operations.
> +			 */
> +			trace_init_mmu_notifier(pasid, mm->context.id);
> +			mmu_notifier_register(&pe_data->mmu_notifier, mm);
> +		}
> +	}
> +
>   	/*
>   	 * Barrier is to make sure PE is visible in the SPA before it
>   	 * is used by the device. It also helps with the global TLBI
> @@ -672,6 +801,11 @@ int ocxl_link_remove_pe(void *link_handle, int pasid)
>   		WARN(1, "Couldn't find pe data when removing PE\n");
>   	} else {
>   		if (pe_data->mm) {
> +			if (link->base) {
> +				trace_release_mmu_notifier(pasid, pe_data->mm->context.id);
> +				mmu_notifier_unregister(&pe_data->mmu_notifier, pe_data->mm);
> +				tlb_invalidate(link, pe_data->mm->context.id, 0ull);
> +			}
>   			mm_context_remove_copro(pe_data->mm);
>   			mmdrop(pe_data->mm);
>   		}
> diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
> index 0bad0a123af6..35d8be3cd270 100644
> --- a/drivers/misc/ocxl/ocxl_internal.h
> +++ b/drivers/misc/ocxl/ocxl_internal.h
> @@ -8,6 +8,48 @@
>   #include <linux/list.h>
>   #include <misc/ocxl.h>
> 
> +/* Find left shift from first set bit in mask */
> +#define MASK_TO_LSH(m)		(__builtin_ffsl(m) - 1)
> +
> +/* Set field fname of oval to fval
> + * NOTE: oval isn't modified, the combined result is returned
> + */
> +#define SETFIELD(m, v, val)				\
> +	(((v) & ~(m)) |	((((typeof(v))(val)) << MASK_TO_LSH(m)) & (m)))
> +
> +#define OCXL_ATSD_TIMEOUT		1
> +
> +/* 5.9.3.3 TLB Management Instructions - PowerISA tags workbook */
> +#define XTS_ATSD_LNCH		0x00
> +#define   XTS_ATSD_LNCH_R	PPC_BIT(0)		/* Radix Invalidate */
> +#define   XTS_ATSD_LNCH_RIC	PPC_BITMASK(1,2)	/* Radix Invalidation Control
> +							 * 0b00 Just invalidate TLB.
> +							 * 0b01 Invalidate just Page Walk Cache.
> +							 * 0b10 Invalidate TLB, Page Walk Cache, and any
> +							 * caching of Partition and Process Table Entries.
> +							 */
> +#define   XTS_ATSD_LNCH_LP	PPC_BITMASK(3, 10)	/* Number and Page Size of translations to be invalidated (HPT only ?) */
> +#define   XTS_ATSD_LNCH_IS	PPC_BITMASK(11, 12)	/* Invalidation Criteria
> +							 * 0b00 Invalidate just the target VA.
> +							 * 0b01 Invalidate matching PID.
> +							 */
> +#define   XTS_ATSD_LNCH_PRS	PPC_BIT(13)		/* 0b1: Process Scope, 0b0: Partition Scope */
> +#define   XTS_ATSD_LNCH_B	PPC_BIT(14)		/* Invalidation Flag */
> +#define   XTS_ATSD_LNCH_AP	PPC_BITMASK(15, 17)	/* Actual Page Size to be invalidated
> +							 * 000 4KB
> +							 * 101 64KB
> +							 * 001 2MB
> +							 * 010 1GB
> +							 */
> +#define   XTS_ATSD_LNCH_L	PPC_BIT(18)		/* Defines the large page select (L=0b0 for 4KB pages, L=0b1 for large pages) */
> +#define   XTS_ATSD_LNCH_PID	PPC_BITMASK(19, 38)	/* Process ID */
> +#define   XTS_ATSD_LNCH_F	PPC_BIT(39)		/* NoFlush – Assumed to be 0b0 */
> +#define   XTS_ATSD_LNCH_OCAPI_SLBI	PPC_BIT(40)
> +#define   XTS_ATSD_LNCH_OCAPI_SINGLETON	PPC_BIT(41)
> +#define XTS_ATSD_AVA		0x08
> +#define   XTS_ATSD_AVA_AVA	PPC_BITMASK(0, 51) /* au lieu de 35*/
> +#define XTS_ATSD_STAT		0x10
> +
>   #define MAX_IRQ_PER_LINK	2000
>   #define MAX_IRQ_PER_CONTEXT	MAX_IRQ_PER_LINK
> 
> @@ -84,7 +126,9 @@ struct ocxl_context {
> 
>   struct ocxl_process_element {
>   	__be64 config_state;
> -	__be32 reserved1[11];
> +	__be32 pasid;
> +	__be32 bdf;
> +	__be32 reserved1[9];
>   	__be32 lpid;
>   	__be32 tid;
>   	__be32 pid;
> diff --git a/drivers/misc/ocxl/trace.h b/drivers/misc/ocxl/trace.h
> index 17e21cb2addd..6171069d071a 100644
> --- a/drivers/misc/ocxl/trace.h
> +++ b/drivers/misc/ocxl/trace.h


I haven't looked at this yet. It should probably be in a separate patch.

   Fred


> @@ -8,6 +8,131 @@
> 
>   #include <linux/tracepoint.h>
> 
> +
> +TRACE_EVENT(ocxl_mmu_notifier_range,
> +	TP_PROTO(unsigned long start, unsigned long end, unsigned long pidr),
> +	TP_ARGS(start, end, pidr),
> +
> +	TP_STRUCT__entry(
> +		__field(unsigned long, start)
> +		__field(unsigned long, end)
> +		__field(unsigned long, pidr)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->start = start;
> +		__entry->end = end;
> +		__entry->pidr = pidr;
> +	),
> +
> +	TP_printk("start=0x%lx end=0x%lx pidr=0x%lx",
> +		__entry->start,
> +		__entry->end,
> +		__entry->pidr
> +	)
> +);
> +
> +TRACE_EVENT(ocxl_mmu_notifier_mmio_atsd_ava,
> +	TP_PROTO(u64 val, unsigned long pidr),
> +	TP_ARGS(val, pidr),
> +
> +	TP_STRUCT__entry(
> +		__field(u64, val)
> +		__field(unsigned long, pidr)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->val = val;
> +		__entry->pidr = pidr;
> +	),
> +
> +	TP_printk("ATSD AVA: 0x%llx pidr=0x%lx",
> +		__entry->val, __entry->pidr
> +	)
> +);
> +
> +TRACE_EVENT(ocxl_mmu_notifier_mmio_atsd_lnch,
> +	TP_PROTO(u64 val, unsigned long addr, unsigned long pidr),
> +	TP_ARGS(val, addr, pidr),
> +
> +	TP_STRUCT__entry(
> +		__field(u64, val)
> +		__field(unsigned long, addr)
> +		__field(unsigned long, pidr)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->val = val;
> +		__entry->addr = addr;
> +		__entry->pidr = pidr;
> +	),
> +
> +	TP_printk("ATSD LNCH: 0x%llx addr=0x%lx pidr=0x%lx",
> +		__entry->val, __entry->addr, __entry->pidr
> +	)
> +);
> +
> +TRACE_EVENT(ocxl_mmu_notifier_mmio_atsd_stat,
> +	TP_PROTO(u64 val, unsigned long addr, unsigned long pidr),
> +	TP_ARGS(val, addr, pidr),
> +
> +	TP_STRUCT__entry(
> +		__field(u64, val)
> +		__field(unsigned long, addr)
> +		__field(unsigned long, pidr)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->val = val;
> +		__entry->addr = addr;
> +		__entry->pidr = pidr;
> +	),
> +
> +	TP_printk("ATSD STAT: 0x%llx addr=0x%lx pidr=0x%lx",
> +		__entry->val, __entry->addr, __entry->pidr
> +	)
> +);
> +
> +TRACE_EVENT(init_mmu_notifier,
> +	TP_PROTO(int pasid, unsigned long pidr),
> +	TP_ARGS(pasid, pidr),
> +
> +	TP_STRUCT__entry(
> +		__field(int, pasid)
> +		__field(unsigned long, pidr)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->pasid = pasid;
> +		__entry->pidr = pidr;
> +	),
> +
> +	TP_printk("pasid=%d, pidr=0x%lx",
> +		__entry->pasid,
> +		__entry->pidr
> +	)
> +);
> +
> +TRACE_EVENT(release_mmu_notifier,
> +	TP_PROTO(int pasid, unsigned long pidr),
> +	TP_ARGS(pasid, pidr),
> +
> +	TP_STRUCT__entry(
> +		__field(int, pasid)
> +		__field(unsigned long, pidr)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->pasid = pasid;
> +		__entry->pidr = pidr;
> +	),
> +
> +	TP_printk("pasid=%d, pidr=0x%lx",
> +		__entry->pasid,
> +		__entry->pidr
> +	)
> +);
> +
>   DECLARE_EVENT_CLASS(ocxl_context,
>   	TP_PROTO(pid_t pid, void *spa, int pasid, u32 pidr, u32 tidr),
>   	TP_ARGS(pid, spa, pasid, pidr, tidr),
> 
