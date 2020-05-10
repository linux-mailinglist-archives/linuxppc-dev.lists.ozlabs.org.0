Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8831C1CCB53
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 15:20:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Kl6Y0FPWzDqwh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 23:20:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Kl4J02c1zDqkJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 May 2020 23:18:07 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04AD1vIA025580; Sun, 10 May 2020 09:18:01 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30ws0kj1rw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 10 May 2020 09:18:01 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04ADE4ot049614;
 Sun, 10 May 2020 09:18:00 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30ws0kj1rd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 10 May 2020 09:18:00 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04ADFIp0017928;
 Sun, 10 May 2020 13:17:59 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 30wm55jgbm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 10 May 2020 13:17:58 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04ADHu2I35782796
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 10 May 2020 13:17:56 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 059D9A4057;
 Sun, 10 May 2020 13:17:56 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BA14A404D;
 Sun, 10 May 2020 13:17:53 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.199.51.177])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sun, 10 May 2020 13:17:53 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Sun, 10 May 2020 18:47:52 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] papr/scm: Add bad memory ranges to nvdimm bad ranges
In-Reply-To: <20200416082455.2645740-1-santosh@fossix.org>
References: <20200416082455.2645740-1-santosh@fossix.org>
Date: Sun, 10 May 2020 18:47:52 +0530
Message-ID: <87pnbc6i9r.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-10_04:2020-05-08,
 2020-05-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 suspectscore=1 lowpriorityscore=0 phishscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2005100116
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Oliver <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Santosh,

Thanks for the updated patch. Minor review comment below:

Santosh Sivaraj <santosh@fossix.org> writes:

> Subscribe to the MCE notification and add the physical address which
> generated a memory error to nvdimm bad range.
>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 98 ++++++++++++++++++++++-
>  1 file changed, 97 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index f35592423380..e23fd1399d5b 100644
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
> @@ -356,6 +362,10 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
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
> @@ -363,6 +373,70 @@ err:	nvdimm_bus_unregister(p->bus);
>  	return -ENXIO;
>  }
>  
> +void papr_scm_add_badblock(struct nd_region *region, struct nvdimm_bus *bus,
> +			   u64 phys_addr)
> +{
Should mark this function as 'static'

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
>  static int papr_scm_probe(struct platform_device *pdev)
>  {
>  	struct device_node *dn = pdev->dev.of_node;
> @@ -460,6 +534,10 @@ static int papr_scm_remove(struct platform_device *pdev)
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
> @@ -482,7 +560,25 @@ static struct platform_driver papr_scm_driver = {
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
> 2.25.2

~ Vaibhav
