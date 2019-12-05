Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF648113B08
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 06:09:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47T3gP3KfzzDqGQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 16:09:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47T3dL0j62zDqXL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2019 16:08:05 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB557FlL035728; Thu, 5 Dec 2019 00:07:59 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wpsayuexx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Dec 2019 00:07:59 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xB557pAU037864;
 Thu, 5 Dec 2019 00:07:58 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wpsayuexc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Dec 2019 00:07:58 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB556qvB029753;
 Thu, 5 Dec 2019 05:07:57 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 2wkg27epb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Dec 2019 05:07:57 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB557u5065798650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Dec 2019 05:07:56 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 313E57805C;
 Thu,  5 Dec 2019 05:07:56 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1E467805E;
 Thu,  5 Dec 2019 05:07:55 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.31.190])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 Dec 2019 05:07:55 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 29FDA2E2F81; Thu,  5 Dec 2019 10:37:54 +0530 (IST)
Date: Thu, 5 Dec 2019 10:37:54 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/vcpu: Assume dedicated processors as
 non-preempt
Message-ID: <20191205050754.GA32581@in.ibm.com>
References: <20191204134459.22470-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191204134459.22470-1-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-04_04:2019-12-04,2019-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912050038
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Parth Shah <parth@linux.ibm.com>,
 Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>, Waiman Long <longman@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Srikar,

On Wed, Dec 04, 2019 at 07:14:58PM +0530, Srikar Dronamraju wrote:
> With commit 247f2f6f3c70 ("sched/core: Don't schedule threads on pre-empted
> vCPUs"), scheduler avoids preempted vCPUs to schedule tasks on wakeup.
> This leads to wrong choice of CPU, which in-turn leads to larger wakeup
> latencies. Eventually, it leads to performance regression in latency
> sensitive benchmarks like soltp, schbench etc.

The regression in the latency sensitive benchmarks is due to
preferring potentially busy vCPUs over vCPUs in the CEDE state.


> 
> On Powerpc, vcpu_is_preempted only looks at yield_count. If the
> yield_count is odd, the vCPU is assumed to be preempted. However
> yield_count is increased whenever LPAR enters CEDE state. So any CPU
> that has entered CEDE state is assumed to be preempted.
> 
> Even if vCPU of dedicated LPAR is preempted/donated, it should have
> right of first-use since they are suppose to own the vCPU.
> 
> On a Power9 System with 32 cores
>  # lscpu
> Architecture:        ppc64le
> Byte Order:          Little Endian
> CPU(s):              128
> On-line CPU(s) list: 0-127
> Thread(s) per core:  8
> Core(s) per socket:  1
> Socket(s):           16
> NUMA node(s):        2
> Model:               2.2 (pvr 004e 0202)
> Model name:          POWER9 (architected), altivec supported
> Hypervisor vendor:   pHyp
> Virtualization type: para
> L1d cache:           32K
> L1i cache:           32K
> L2 cache:            512K
> L3 cache:            10240K
> NUMA node0 CPU(s):   0-63
> NUMA node1 CPU(s):   64-127
> 
> 
>   # perf stat -a -r 5 ./schbench
> v5.4				                v5.4 + patch
> Latency percentiles (usec)                      Latency percentiles (usec)
> 	49.0000th: 47                           	50.0000th: 33
> 	74.0000th: 64                           	75.0000th: 44
> 	89.0000th: 76                           	90.0000th: 50
> 	94.0000th: 83                           	95.0000th: 53
> 	*98.0000th: 103                         	*99.0000th: 57
> 	98.5000th: 2124                         	99.5000th: 59
> 	98.9000th: 7976                         	99.9000th: 83
> 	min=-1, max=10519                       	min=0, max=117
> Latency percentiles (usec)                      Latency percentiles (usec)
> 	49.0000th: 45                           	50.0000th: 34
> 	74.0000th: 61                           	75.0000th: 45
> 	89.0000th: 70                           	90.0000th: 52
> 	94.0000th: 77                           	95.0000th: 56
> 	*98.0000th: 504                         	*99.0000th: 62
> 	98.5000th: 4012                         	99.5000th: 64
> 	98.9000th: 8168                         	99.9000th: 79
> 	min=-1, max=14500                       	min=0, max=123
> Latency percentiles (usec)                      Latency percentiles (usec)
> 	49.0000th: 48                           	50.0000th: 35
> 	74.0000th: 65                           	75.0000th: 47
> 	89.0000th: 76                           	90.0000th: 55
> 	94.0000th: 82                           	95.0000th: 59
> 	*98.0000th: 1098                        	*99.0000th: 67
> 	98.5000th: 3988                         	99.5000th: 71
> 	98.9000th: 9360                         	99.9000th: 98
> 	min=-1, max=19283                       	min=0, max=137
> Latency percentiles (usec)                      Latency percentiles (usec)
> 	49.0000th: 46                           	50.0000th: 35
> 	74.0000th: 63                           	75.0000th: 46
> 	89.0000th: 73                           	90.0000th: 53
> 	94.0000th: 78                           	95.0000th: 57
> 	*98.0000th: 113                         	*99.0000th: 63
> 	98.5000th: 2316                         	99.5000th: 65
> 	98.9000th: 7704                         	99.9000th: 83
> 	min=-1, max=17976                       	min=0, max=139
> Latency percentiles (usec)                      Latency percentiles (usec)
> 	49.0000th: 46                           	50.0000th: 34
> 	74.0000th: 62                           	75.0000th: 46
> 	89.0000th: 73                           	90.0000th: 53
> 	94.0000th: 79                           	95.0000th: 57
> 	*98.0000th: 97                          	*99.0000th: 64
> 	98.5000th: 1398                         	99.5000th: 70
> 	98.9000th: 8136                         	99.9000th: 100
> 	min=-1, max=10008                       	min=0, max=142
> 
> Performance counter stats for 'system wide' (4 runs):
> 
> context-switches       42,604 ( +-  0.87% )       45,397 ( +-  0.25% )
> cpu-migrations          0,195 ( +-  2.70% )          230 ( +-  7.23% )
> page-faults            16,783 ( +- 14.87% )       16,781 ( +-  9.77% )
> 
> Waiman Long suggested using static_keys.

This needs to be Cc'ed to the stable kernel 4.18+

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

> 
> Reported-by: Parth Shah <parth@linux.ibm.com>
> Reported-by: Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
> Cc: Parth Shah <parth@linux.ibm.com>
> Cc: Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Waiman Long <longman@redhat.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/spinlock.h | 5 +++--
>  arch/powerpc/mm/numa.c              | 4 ++++
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
> index e9a960e28f3c..866f6ca0427a 100644
> --- a/arch/powerpc/include/asm/spinlock.h
> +++ b/arch/powerpc/include/asm/spinlock.h
> @@ -35,11 +35,12 @@
>  #define LOCK_TOKEN	1
>  #endif
> 
> -#ifdef CONFIG_PPC_PSERIES
> +#if defined(CONFIG_PPC_PSERIES) && defined(CONFIG_PPC_SPLPAR)
> +DECLARE_STATIC_KEY_FALSE(shared_processor);
>  #define vcpu_is_preempted vcpu_is_preempted
>  static inline bool vcpu_is_preempted(int cpu)
>  {
> -	if (!firmware_has_feature(FW_FEATURE_SPLPAR))
> +	if (!static_branch_unlikely(&shared_processor))
>  		return false;
>  	return !!(be32_to_cpu(lppaca_of(cpu).yield_count) & 1);
>  }
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 50d68d21ddcc..ffb971f3a63c 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -1568,9 +1568,13 @@ int prrn_is_enabled(void)
>  	return prrn_enabled;
>  }
> 
> +DEFINE_STATIC_KEY_FALSE(shared_processor);
> +EXPORT_SYMBOL_GPL(shared_processor);
> +
>  void __init shared_proc_topology_init(void)
>  {
>  	if (lppaca_shared_proc(get_lppaca())) {
> +		static_branch_enable(&shared_processor);
>  		bitmap_fill(cpumask_bits(&cpu_associativity_changes_mask),
>  			    nr_cpumask_bits);
>  		numa_update_cpu_topology(false);
> -- 
> 2.18.1
> 
