Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 570A222BEC4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 09:15:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCgT36KQTzDqy9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 17:15:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCgNW4H3hzDsZ0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 17:11:23 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06O73j6K126520; Fri, 24 Jul 2020 03:11:14 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32fb8y6k2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 03:11:14 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06O74wo3130104;
 Fri, 24 Jul 2020 03:11:13 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32fb8y6k24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 03:11:13 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06O7AJPm032602;
 Fri, 24 Jul 2020 07:11:13 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 32brqa77ca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 07:11:13 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06O7BCdF19661128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jul 2020 07:11:12 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46120AE062;
 Fri, 24 Jul 2020 07:11:12 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91C6FAE05C;
 Fri, 24 Jul 2020 07:11:11 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.93.226])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 24 Jul 2020 07:11:11 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 1815A2E340E; Fri, 24 Jul 2020 12:41:08 +0530 (IST)
Date: Fri, 24 Jul 2020 12:41:08 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 05/10] powerpc/smp: Dont assume l2-cache to be
 superset of sibling
Message-ID: <20200724071108.GD21415@in.ibm.com>
References: <20200723085116.4731-1-srikar@linux.vnet.ibm.com>
 <20200723085116.4731-6-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723085116.4731-6-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_01:2020-07-24,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007240052
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
Reply-To: ego@linux.vnet.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Jordan Niethe <jniethe5@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Thu, Jul 23, 2020 at 02:21:11PM +0530, Srikar Dronamraju wrote:
> Current code assumes that cpumask of cpus sharing a l2-cache mask will
> always be a superset of cpu_sibling_mask.
> 
> Lets stop that assumption. cpu_l2_cache_mask is a superset of
> cpu_sibling_mask if and only if shared_caches is set.
> 
> Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> Cc: LKML <linux-kernel@vger.kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Anton Blanchard <anton@ozlabs.org>
> Cc: Oliver O'Halloran <oohall@gmail.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Michael Neuling <mikey@neuling.org>
> Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Jordan Niethe <jniethe5@gmail.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

> ---
> Changelog v1 -> v2:
> 	Set cpumask after verifying l2-cache. (Gautham)
> 
>  arch/powerpc/kernel/smp.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index da27f6909be1..d997c7411664 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1194,6 +1194,7 @@ static bool update_mask_by_l2(int cpu, struct cpumask *(*mask_fn)(int))
>  	if (!l2_cache)
>  		return false;
> 
> +	cpumask_set_cpu(cpu, mask_fn(cpu));
>  	for_each_cpu(i, cpu_online_mask) {
>  		/*
>  		 * when updating the marks the current CPU has not been marked
> @@ -1276,29 +1277,30 @@ static void add_cpu_to_masks(int cpu)
>  	 * add it to it's own thread sibling mask.
>  	 */
>  	cpumask_set_cpu(cpu, cpu_sibling_mask(cpu));
> +	cpumask_set_cpu(cpu, cpu_core_mask(cpu));
> 
>  	for (i = first_thread; i < first_thread + threads_per_core; i++)
>  		if (cpu_online(i))
>  			set_cpus_related(i, cpu, cpu_sibling_mask);
> 
>  	add_cpu_to_smallcore_masks(cpu);
> -	/*
> -	 * Copy the thread sibling mask into the cache sibling mask
> -	 * and mark any CPUs that share an L2 with this CPU.
> -	 */
> -	for_each_cpu(i, cpu_sibling_mask(cpu))
> -		set_cpus_related(cpu, i, cpu_l2_cache_mask);
>  	update_mask_by_l2(cpu, cpu_l2_cache_mask);
> 
> -	/*
> -	 * Copy the cache sibling mask into core sibling mask and mark
> -	 * any CPUs on the same chip as this CPU.
> -	 */
> -	for_each_cpu(i, cpu_l2_cache_mask(cpu))
> -		set_cpus_related(cpu, i, cpu_core_mask);
> +	if (pkg_id == -1) {
> +		struct cpumask *(*mask)(int) = cpu_sibling_mask;
> +
> +		/*
> +		 * Copy the sibling mask into core sibling mask and
> +		 * mark any CPUs on the same chip as this CPU.
> +		 */
> +		if (shared_caches)
> +			mask = cpu_l2_cache_mask;
> +
> +		for_each_cpu(i, mask(cpu))
> +			set_cpus_related(cpu, i, cpu_core_mask);
> 
> -	if (pkg_id == -1)
>  		return;
> +	}
> 
>  	for_each_cpu(i, cpu_online_mask)
>  		if (get_physical_package_id(i) == pkg_id)
> -- 
> 2.18.2
> 
