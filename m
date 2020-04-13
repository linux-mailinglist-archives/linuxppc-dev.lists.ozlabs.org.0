Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC671A6823
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 16:28:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4919w10vwrzDqFm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 00:28:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4919qt4g8wzDqDN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 00:24:58 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03DEGOqT083553
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 10:24:55 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30b9hudmhs-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 10:24:55 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <mahesh@linux.ibm.com>;
 Mon, 13 Apr 2020 15:24:21 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 13 Apr 2020 15:24:19 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03DEOo4L41812124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Apr 2020 14:24:50 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54C8B11C04C;
 Mon, 13 Apr 2020 14:24:50 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27B7D11C05C;
 Mon, 13 Apr 2020 14:24:49 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.53.79])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 13 Apr 2020 14:24:48 +0000 (GMT)
Date: Mon, 13 Apr 2020 19:54:46 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Santosh Sivaraj <santosh@fossix.org>
Subject: Re: [PATCH] papr/scm: Add bad memory ranges to nvdimm bad ranges
References: <20200401074741.1562361-1-santosh@fossix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401074741.1562361-1-santosh@fossix.org>
X-TM-AS-GCONF: 00
x-cbid: 20041314-4275-0000-0000-000003BF1866
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041314-4276-0000-0000-000038D4870D
Message-Id: <20200413142446.abccjt223vrhfgot@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-13_06:2020-04-13,
 2020-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004130102
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
Reply-To: mahesh@linux.ibm.com
Cc: Oliver <oohall@gmail.com>, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-04-01 13:17:41 Wed, Santosh Sivaraj wrote:
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
[...]
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

Do you really need this check ?

> +
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
> +	mutex_unlock(&papr_ndr_lock);
> +
> +	if (!found)
> +		return NOTIFY_DONE;
> +
> +	papr_scm_add_badblock(p->region, p->bus, phys_addr);
> +
> +	return NOTIFY_OK;
> +}
> +
> +static struct notifier_block mce_ue_nb = {
> +	.notifier_call = handle_mce_ue
> +};
> +
[...]
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

Rest Looks good to me.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.

> +
>  MODULE_DEVICE_TABLE(of, papr_scm_match);
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("IBM Corporation");
> -- 
> 2.25.1
> 

-- 
Mahesh J Salgaonkar

