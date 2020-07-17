Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D80B223308
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 07:46:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7Kr01rY2zDrJV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 15:46:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7Knw3dfJzDrGC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 15:44:52 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06H5a8cQ145320; Fri, 17 Jul 2020 01:44:47 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32a45c6p48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 01:44:46 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06H5dpkC004549;
 Fri, 17 Jul 2020 05:44:46 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 32752a22n2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 05:44:46 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06H5ifm02359992
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 05:44:41 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31CB0136053;
 Fri, 17 Jul 2020 05:44:43 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55330136051;
 Fri, 17 Jul 2020 05:44:42 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.61.65])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jul 2020 05:44:42 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id AF99C2E3026; Fri, 17 Jul 2020 11:14:36 +0530 (IST)
Date: Fri, 17 Jul 2020 11:14:36 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 02/11] powerpc/smp: Merge Power9 topology with Power
 topology
Message-ID: <20200717054436.GB25851@in.ibm.com>
References: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
 <20200714043624.5648-3-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714043624.5648-3-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_03:2020-07-16,
 2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007170038
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
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>, Anton Blanchard <anton@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Piggin <npiggin@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Srikar,

On Tue, Jul 14, 2020 at 10:06:15AM +0530, Srikar Dronamraju wrote:
> A new sched_domain_topology_level was added just for Power9. However the
> same can be achieved by merging powerpc_topology with power9_topology
> and makes the code more simpler especially when adding a new sched
> domain.
> 
> Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> Cc: Michael Ellerman <michaele@au1.ibm.com>
> Cc: Nick Piggin <npiggin@au1.ibm.com>
> Cc: Oliver OHalloran <oliveroh@au1.ibm.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Michael Neuling <mikey@linux.ibm.com>
> Cc: Anton Blanchard <anton@au1.ibm.com>
> Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/smp.c | 33 ++++++++++-----------------------
>  1 file changed, 10 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 680c0edcc59d..069ea4b21c6d 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1315,7 +1315,7 @@ int setup_profiling_timer(unsigned int multiplier)
>  }
> 
>  #ifdef CONFIG_SCHED_SMT
> -/* cpumask of CPUs with asymetric SMT dependancy */
> +/* cpumask of CPUs with asymmetric SMT dependency */
>  static int powerpc_smt_flags(void)
>  {
>  	int flags = SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
> @@ -1328,14 +1328,6 @@ static int powerpc_smt_flags(void)
>  }
>  #endif
> 
> -static struct sched_domain_topology_level powerpc_topology[] = {
> -#ifdef CONFIG_SCHED_SMT
> -	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
> -#endif
> -	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
> -	{ NULL, },
> -};
> -
>  /*
>   * P9 has a slightly odd architecture where pairs of cores share an L2 cache.
>   * This topology makes it *much* cheaper to migrate tasks between adjacent cores
> @@ -1353,7 +1345,13 @@ static int powerpc_shared_cache_flags(void)
>   */
>  static const struct cpumask *shared_cache_mask(int cpu)
>  {
> -	return cpu_l2_cache_mask(cpu);
> +	if (shared_caches)
> +		return cpu_l2_cache_mask(cpu);
> +
> +	if (has_big_cores)
> +		return cpu_smallcore_mask(cpu);
> +
> +	return cpu_smt_mask(cpu);
>  }
> 
>  #ifdef CONFIG_SCHED_SMT
> @@ -1363,7 +1361,7 @@ static const struct cpumask *smallcore_smt_mask(int cpu)
>  }
>  #endif
> 
> -static struct sched_domain_topology_level power9_topology[] = {
> +static struct sched_domain_topology_level powerpc_topology[] = {


>  #ifdef CONFIG_SCHED_SMT
>  	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
>  #endif
> @@ -1388,21 +1386,10 @@ void __init smp_cpus_done(unsigned int max_cpus)
>  #ifdef CONFIG_SCHED_SMT
>  	if (has_big_cores) {
>  		pr_info("Big cores detected but using small core scheduling\n");
I> -		power9_topology[0].mask = smallcore_smt_mask;
>  		powerpc_topology[0].mask = smallcore_smt_mask;
>  	}
>  #endif
> -	/*
> -	 * If any CPU detects that it's sharing a cache with another CPU then
> -	 * use the deeper topology that is aware of this sharing.
> -	 */
> -	if (shared_caches) {
> -		pr_info("Using shared cache scheduler topology\n");
> -		set_sched_topology(power9_topology);
> -	} else {
> -		pr_info("Using standard scheduler topology\n");
> -		set_sched_topology(powerpc_topology);


Ok, so we will go with the three level topology by default (SMT,
CACHE, DIE) and will rely on the sched-domain creation code to
degenerate CACHE domain in case SMT and CACHE have the same set of
CPUs (POWER8 for eg).

From a cleanup perspective this is better, since we won't have to
worry about defining multiple topology structures, but from a
performance point of view, wouldn't we now pay an extra penalty of
degenerating the CACHE domains on POWER8 kind of systems, each time
when a CPU comes online ?

Do we know how bad it is ? If the degeneration takes a few extra
microseconds, that should be ok I suppose.

--
Thanks and Regards
gautham.
