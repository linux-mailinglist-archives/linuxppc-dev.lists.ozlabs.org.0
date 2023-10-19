Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0197CFED7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 17:58:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b0X8dNd/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBC6d1P5Vz3vYC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 02:58:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b0X8dNd/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBC5n145gz3cNt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 02:57:16 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JFsmn2008383;
	Thu, 19 Oct 2023 15:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=D9JV0J9YLtbpvM1Bryhy/UTf6mfOpcUpp8XQTtpt8c0=;
 b=b0X8dNd/fYMJZDu3trv/our7b9Whv+Os3O3JP0z1rm6/BWCKQoK2/kYeXRX7c8GCNqqc
 DGiuvL6FPaj0Y5uqCo3uByliR9ErgHinBrjw1YbdGCU8gHBd/g0ZqryRphJyUZR5G8U6
 RZJO15fA6liYVRMr+jAdhP/lqISVT+e+WTJyUetvOGHvWlkTwxF41RDJ4uTJ772/btya
 MFVcoVEJRqrgxQQhpY1v1lyglvVciOzoielCgk21nw1P/90+xfGI4oLRcQ3+eJ1Uxk+F
 ggHmizDCdHb46X97Y2xtsYMvYjSQ2he2A4fW8u7x21R1hR15JbFfkKs7+bfLSlZ2n8/W 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tu7gv04y9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 15:57:04 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39JFsqD2008819;
	Thu, 19 Oct 2023 15:57:03 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tu7gv04xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 15:57:03 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39JExVXc031142;
	Thu, 19 Oct 2023 15:57:02 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr7hk1f5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 15:57:02 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39JFv2Tv24576758
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Oct 2023 15:57:02 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A11C58055;
	Thu, 19 Oct 2023 15:57:02 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8795E58043;
	Thu, 19 Oct 2023 15:56:58 +0000 (GMT)
Received: from [9.171.84.137] (unknown [9.171.84.137])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Oct 2023 15:56:58 +0000 (GMT)
Message-ID: <45a14ebb-91e7-489d-ad5d-6d39a48bc1f5@linux.vnet.ibm.com>
Date: Thu, 19 Oct 2023 21:26:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] powerpc/smp: Enable Asym packing for cores on
 shared processor
Content-Language: en-US
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
References: <20231018163751.2423181-1-srikar@linux.vnet.ibm.com>
 <20231018163751.2423181-3-srikar@linux.vnet.ibm.com>
From: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
In-Reply-To: <20231018163751.2423181-3-srikar@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -gQcv_yCJE3G2YihojiZrXuZFqwuGsVL
X-Proofpoint-ORIG-GUID: m52CIvECt0XNHIYaU802OfGZhxy9C-iH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_15,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 clxscore=1011 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190134
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
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/18/23 10:07 PM, Srikar Dronamraju wrote:
> If there are shared processor LPARs, underlying Hypervisor can have more
> virtual cores to handle than actual physical cores.
> 
> Starting with Power 9, a core has 2 nearly independent thread groups.
> On a shared processors LPARs, it helps to pack threads to lesser number
> of cores so that the overall system performance and utilization
> improves. PowerVM schedules at a core level. Hence packing to fewer
> cores helps.
> 
> For example: Lets says there are two 8-core Shared LPARs that are
> actually sharing a 8 Core shared physical pool, each running 8 threads
> each. Then Consolidating 8 threads to 4 cores on each LPAR would help
> them to perform better. This is because each of the LPAR will get
> 100% time to run applications and there will no switching required by
> the Hypervisor.
> 
> To achieve this, enable SD_ASYM_PACKING flag at CACHE, MC and DIE level.

This would have a conflict with tip/master. 
DIE has been renamed to PKG and Both changelog and code below should 
change DIE to PKG. 

> 
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
> Changelog:
> v1->v2: Using static key instead of a variable.
> 
>  arch/powerpc/kernel/smp.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 37c41297c9ce..498c2d51fc20 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1009,9 +1009,20 @@ static int powerpc_smt_flags(void)
>   */
>  static int powerpc_shared_cache_flags(void)
>  {
> +	if (static_branch_unlikely(&powerpc_asym_packing))
> +		return SD_SHARE_PKG_RESOURCES | SD_ASYM_PACKING;
> +
>  	return SD_SHARE_PKG_RESOURCES;
>  }
> 
> +static int powerpc_shared_proc_flags(void)
> +{
> +	if (static_branch_unlikely(&powerpc_asym_packing))
> +		return SD_ASYM_PACKING;
> +
> +	return 0;
> +}
> +
>  /*
>   * We can't just pass cpu_l2_cache_mask() directly because
>   * returns a non-const pointer and the compiler barfs on that.
> @@ -1048,8 +1059,8 @@ static struct sched_domain_topology_level powerpc_topology[] = {
>  	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
>  #endif
>  	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
> -	{ cpu_mc_mask, SD_INIT_NAME(MC) },
> -	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
> +	{ cpu_mc_mask, powerpc_shared_proc_flags, SD_INIT_NAME(MC) },
> +	{ cpu_cpu_mask, powerpc_shared_proc_flags, SD_INIT_NAME(DIE) },
>  	{ NULL, },
>  };
> 
> @@ -1687,6 +1698,8 @@ static void __init fixup_topology(void)
>  	if (cpu_has_feature(CPU_FTR_ASYM_SMT)) {
>  		pr_info_once("Enabling Asymmetric SMT scheduling\n");
>  		static_branch_enable(&powerpc_asym_packing);
> +	} else if (is_shared_processor() && has_big_cores) {
> +		static_branch_enable(&powerpc_asym_packing);
>  	}
> 
>  #ifdef CONFIG_SCHED_SMT
