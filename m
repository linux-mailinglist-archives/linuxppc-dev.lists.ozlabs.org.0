Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 501F5219AA7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 10:19:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2Tbs3nyXzDrCG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 18:19:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2TZ0094wzDqHY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 18:17:42 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4B2TYr5L0cz9v1KR;
 Thu,  9 Jul 2020 10:17:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id pH_6Ih8nU8Sz; Thu,  9 Jul 2020 10:17:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4B2TYr3zPTz9v1KP;
 Thu,  9 Jul 2020 10:17:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E11198B80D;
 Thu,  9 Jul 2020 10:17:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VsGWOnsmyT3K; Thu,  9 Jul 2020 10:17:37 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F0F1D8B809;
 Thu,  9 Jul 2020 10:17:36 +0200 (CEST)
Subject: Re: [PATCH RESEND 2/2] papr/scm: Add bad memory ranges to nvdimm bad
 ranges
To: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20200709075635.643740-1-santosh@fossix.org>
 <20200709075635.643740-2-santosh@fossix.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d8fe2b1b-7779-ffee-e26b-858eb7cd3633@csgroup.eu>
Date: Thu, 9 Jul 2020 10:17:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200709075635.643740-2-santosh@fossix.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/07/2020 à 09:56, Santosh Sivaraj a écrit :
> Subscribe to the MCE notification and add the physical address which
> generated a memory error to nvdimm bad range.
> 
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> ---
>   arch/powerpc/platforms/pseries/papr_scm.c | 98 ++++++++++++++++++++++-
>   1 file changed, 97 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 9c569078a09fd..5ebb1c797795d 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -13,9 +13,11 @@
>   #include <linux/platform_device.h>
>   #include <linux/delay.h>
>   #include <linux/seq_buf.h>
> +#include <linux/nd.h>
>   
>   #include <asm/plpar_wrappers.h>
>   #include <asm/papr_pdsm.h>
> +#include <asm/mce.h>
>   
>   #define BIND_ANY_ADDR (~0ul)
>   
> @@ -80,6 +82,7 @@ struct papr_scm_priv {
>   	struct resource res;
>   	struct nd_region *region;
>   	struct nd_interleave_set nd_set;
> +	struct list_head region_list;
>   
>   	/* Protect dimm health data from concurrent read/writes */
>   	struct mutex health_mutex;
> @@ -91,6 +94,9 @@ struct papr_scm_priv {
>   	u64 health_bitmap;
>   };
>   
> +LIST_HEAD(papr_nd_regions);
> +DEFINE_MUTEX(papr_ndr_lock);
> +
>   static int drc_pmem_bind(struct papr_scm_priv *p)
>   {
>   	unsigned long ret[PLPAR_HCALL_BUFSIZE];
> @@ -759,6 +765,10 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>   		dev_info(dev, "Region registered with target node %d and online node %d",
>   			 target_nid, online_nid);
>   
> +	mutex_lock(&papr_ndr_lock);
> +	list_add_tail(&p->region_list, &papr_nd_regions);
> +	mutex_unlock(&papr_ndr_lock);
> +
>   	return 0;
>   
>   err:	nvdimm_bus_unregister(p->bus);
> @@ -766,6 +776,70 @@ err:	nvdimm_bus_unregister(p->bus);
>   	return -ENXIO;
>   }
>   
> +static void papr_scm_add_badblock(struct nd_region *region,
> +				  struct nvdimm_bus *bus, u64 phys_addr)
> +{
> +	u64 aligned_addr = ALIGN_DOWN(phys_addr, L1_CACHE_BYTES);
> +
> +	if (nvdimm_bus_add_badrange(bus, aligned_addr, L1_CACHE_BYTES)) {
> +		pr_err("Bad block registration for 0x%llx failed\n", phys_addr);
> +		return;
> +	}
> +
> +	pr_debug("Add memory range (0x%llx - 0x%llx) as bad range\n",
> +		 aligned_addr, aligned_addr + L1_CACHE_BYTES);
> +
> +	nvdimm_region_notify(region, NVDIMM_REVALIDATE_POISON);
> +}
> +
> +static int handle_mce_ue(struct notifier_block *nb, unsigned long val,
> +			 void *data)
> +{
> +	struct machine_check_event *evt = data;
> +	struct papr_scm_priv *p;
> +	u64 phys_addr;
> +	bool found = false;
> +
> +	if (evt->error_type != MCE_ERROR_TYPE_UE)
> +		return NOTIFY_DONE;
> +
> +	if (list_empty(&papr_nd_regions))
> +		return NOTIFY_DONE;
> +
> +	/*
> +	 * The physical address obtained here is PAGE_SIZE aligned, so get the
> +	 * exact address from the effective address
> +	 */
> +	phys_addr = evt->u.ue_error.physical_address +
> +		(evt->u.ue_error.effective_address & ~PAGE_MASK);

Not properly aligned

> +
> +	if (!evt->u.ue_error.physical_address_provided ||
> +	    !is_zone_device_page(pfn_to_page(phys_addr >> PAGE_SHIFT)))
> +		return NOTIFY_DONE;
> +
> +	/* mce notifier is called from a process context, so mutex is safe */
> +	mutex_lock(&papr_ndr_lock);
> +	list_for_each_entry(p, &papr_nd_regions, region_list) {
> +		struct resource res = p->res;

Is this local struct really worth it ? Why not use p->res below directly ?

> +
> +		if (phys_addr >= res.start && phys_addr <= res.end) {
> +			found = true;
> +			break;
> +		}
> +	}
> +
> +	if (found)
> +		papr_scm_add_badblock(p->region, p->bus, phys_addr);
> +
> +	mutex_unlock(&papr_ndr_lock);
> +
> +	return found ? NOTIFY_OK : NOTIFY_DONE;
> +}
> +
> +static struct notifier_block mce_ue_nb = {
> +	.notifier_call = handle_mce_ue
> +};
> +
>   static int papr_scm_probe(struct platform_device *pdev)
>   {
>   	struct device_node *dn = pdev->dev.of_node;
> @@ -866,6 +940,10 @@ static int papr_scm_remove(struct platform_device *pdev)
>   {
>   	struct papr_scm_priv *p = platform_get_drvdata(pdev);
>   
> +	mutex_lock(&papr_ndr_lock);
> +	list_del(&(p->region_list));
> +	mutex_unlock(&papr_ndr_lock);
> +
>   	nvdimm_bus_unregister(p->bus);
>   	drc_pmem_unbind(p);
>   	kfree(p->bus_desc.provider_name);
> @@ -888,7 +966,25 @@ static struct platform_driver papr_scm_driver = {
>   	},
>   };
>   
> -module_platform_driver(papr_scm_driver);
> +static int __init papr_scm_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_driver_register(&papr_scm_driver);
> +	if (!ret)
> +		mce_register_notifier(&mce_ue_nb);
> +
> +return ret;

Not properly aligned.

> +}
> +module_init(papr_scm_init);
> +
> +static void __exit papr_scm_exit(void)
> +{
> +	mce_unregister_notifier(&mce_ue_nb);
> +	platform_driver_unregister(&papr_scm_driver);
> +}
> +module_exit(papr_scm_exit);
> +
>   MODULE_DEVICE_TABLE(of, papr_scm_match);
>   MODULE_LICENSE("GPL");
>   MODULE_AUTHOR("IBM Corporation");
> 

Christophe
