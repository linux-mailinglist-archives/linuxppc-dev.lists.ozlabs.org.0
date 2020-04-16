Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7031AB650
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 05:43:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492lRx6V8GzDqsX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 13:43:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492lQ06nLTzDr7m
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 13:41:28 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03G3YwPZ164188
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 23:41:25 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30edn6txeb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 23:41:24 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Thu, 16 Apr 2020 04:40:45 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 Apr 2020 04:40:43 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03G3fJJX49873104
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Apr 2020 03:41:19 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83E60A404D;
 Thu, 16 Apr 2020 03:41:19 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB69EA4040;
 Thu, 16 Apr 2020 03:41:16 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.85.94.100])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Apr 2020 03:41:16 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Thu, 16 Apr 2020 09:11:15 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] papr/scm: Add bad memory ranges to nvdimm bad ranges
In-Reply-To: <20200401074741.1562361-1-santosh@fossix.org>
References: <20200401074741.1562361-1-santosh@fossix.org>
Date: Thu, 16 Apr 2020 09:11:15 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 20041603-0016-0000-0000-0000030559CC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041603-0017-0000-0000-000033695B66
Message-Id: <87y2qw6qsk.fsf@vajain21.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-15_08:2020-04-14,
 2020-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004160017
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
Cc: Oliver <oohall@gmail.com>, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Santosh,

Some review comments below.

Santosh Sivaraj <santosh@fossix.org> writes:

> Subscribe to the MCE notification and add the physical address which
> generated a memory error to nvdimm bad range.
>
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> ---
>
> This patch depends on "powerpc/mce: Add MCE notification chain" [1].
>
> Unlike the previous series[2], the patch adds badblock registration only for
> pseries scm driver. Handling badblocks for baremetal (powernv) PMEM will be done
> later and if possible get the badblock handling as a common code.
>
> [1] https://lore.kernel.org/linuxppc-dev/20200330071219.12284-1-ganeshgr@linux.ibm.com/
> [2] https://lore.kernel.org/linuxppc-dev/20190820023030.18232-1-santosh@fossix.org/
>
> arch/powerpc/platforms/pseries/papr_scm.c | 96 ++++++++++++++++++++++-
>  1 file changed, 95 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 0b4467e378e5..5012cbf4606e 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -12,6 +12,8 @@
>  #include <linux/libnvdimm.h>
>  #include <linux/platform_device.h>
>  #include <linux/delay.h>
> +#include <linux/nd.h>
> +#include <asm/mce.h>
>  
>  #include <asm/plpar_wrappers.h>
>  
> @@ -39,8 +41,12 @@ struct papr_scm_priv {
>  	struct resource res;
>  	struct nd_region *region;
>  	struct nd_interleave_set nd_set;
> +	struct list_head region_list;
>  };
>  
> +LIST_HEAD(papr_nd_regions);
> +DEFINE_MUTEX(papr_ndr_lock);
> +
>  static int drc_pmem_bind(struct papr_scm_priv *p)
>  {
>  	unsigned long ret[PLPAR_HCALL_BUFSIZE];
> @@ -372,6 +378,10 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>  		dev_info(dev, "Region registered with target node %d and online node %d",
>  			 target_nid, online_nid);
>  
> +	mutex_lock(&papr_ndr_lock);
> +	list_add_tail(&p->region_list, &papr_nd_regions);
> +	mutex_unlock(&papr_ndr_lock);
> +
>  	return 0;
>  
>  err:	nvdimm_bus_unregister(p->bus);
> @@ -379,6 +389,68 @@ err:	nvdimm_bus_unregister(p->bus);
>  	return -ENXIO;
>  }
>  
> +void papr_scm_add_badblock(struct nd_region *region, struct nvdimm_bus *bus,
> +			   u64 phys_addr)
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
> +	phys_addr = evt->u.ue_error.physical_address +
> +		(evt->u.ue_error.effective_address & ~PAGE_MASK);
Though it seems that you are trying to get the actual physical address
from the page aligned evt->u.ue_error.physical_address, it would be nice
if you could put a comment as to why you are doing this seemingly wierd
math with real and effective addresses here.
> +
> +	if (!evt->u.ue_error.physical_address_provided ||
> +	    !is_zone_device_page(pfn_to_page(phys_addr >> PAGE_SHIFT)))
> +		return NOTIFY_DONE;
> +
> +	/* mce notifier is called from a process context, so mutex is safe */
> +	mutex_lock(&papr_ndr_lock);
> +	list_for_each_entry(p, &papr_nd_regions, region_list) {
> +		struct resource res = p->res;
> +
> +		if (phys_addr >= res.start && phys_addr <= res.end) {
> +			found = true;
> +			break;
> +		}
> +	}
> +
> +	mutex_unlock(&papr_ndr_lock);
> +
> +	if (!found)
> +		return NOTIFY_DONE;
> +
> +	papr_scm_add_badblock(p->region, p->bus, phys_addr);
I see a possible race between papr_scm_add_badblock() and
papr_scm_remove() as a bad block may be reported just remove a region is
disabled. Would recomment calling papr_scm_bad_block() in context of
papr_ndr_lock.

> +
> +	return NOTIFY_OK;
> +}
> +
> +static struct notifier_block mce_ue_nb = {
> +	.notifier_call = handle_mce_ue
> +};
> +
>  static int papr_scm_probe(struct platform_device *pdev)
>  {
>  	struct device_node *dn = pdev->dev.of_node;
> @@ -476,6 +548,10 @@ static int papr_scm_remove(struct platform_device *pdev)
>  {
>  	struct papr_scm_priv *p = platform_get_drvdata(pdev);
>  
> +	mutex_lock(&papr_ndr_lock);
> +	list_del(&(p->region_list));
> +	mutex_unlock(&papr_ndr_lock);
> +
>  	nvdimm_bus_unregister(p->bus);
>  	drc_pmem_unbind(p);
>  	kfree(p->bus_desc.provider_name);
> @@ -498,7 +574,25 @@ static struct platform_driver papr_scm_driver = {
>  	},
>  };
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
> +	return ret;
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
>  MODULE_DEVICE_TABLE(of, papr_scm_match);
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("IBM Corporation");
> -- 
> 2.25.1
>

-- 
Vaibhav Jain <vaibhav@linux.ibm.com>
Linux Technology Center, IBM India Pvt. Ltd.

