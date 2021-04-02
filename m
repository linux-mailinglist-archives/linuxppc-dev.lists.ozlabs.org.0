Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 831FC3526FC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 09:37:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBX2k3xRmz3by5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 18:37:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tkw29L0j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tkw29L0j; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBX2G373Vz30RJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 18:37:25 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1327XN1L107450; Fri, 2 Apr 2021 03:37:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : content-type : in-reply-to
 : mime-version; s=pp1; bh=onbZ22nfTSYGmsKQ8rSyZup/bBNUjcnVTkRcTfU5g+8=;
 b=tkw29L0jpiOdHHCC3CHSDq4YenUasHuCcfa/KA4zkyPHJVPsvQu1m8bT8PivLuGvLw0G
 3hVSvR1RE4pQsDFHQhQ5bVIwNZB+MtCc8xCtDUMvNGnHZnC6zzkfZ9/ot5kaD275Vp+7
 R3mmL/+U15t1ZklfZsI0h6gYhGtj91mzS2ZVL7oqLk6hnCZC8xEAySBcQE+uHmpv5iaq
 bYZ1ogrsXqXI2v1I3wVWiyZZvpvRO/QxRaKdDuqrAy9kuF0trgY1vZ9v8rer56VV9ujQ
 ue4colid646i/00bmz1a5D7G8BtW9QazT1gMQQCx5fdlcmHIqJ5dZGDEA1IXBK+LEQu8 /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37njja1jmf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Apr 2021 03:37:08 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1327ZA7C114433;
 Fri, 2 Apr 2021 03:37:08 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37njja1jm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Apr 2021 03:37:07 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1327amme013070;
 Fri, 2 Apr 2021 07:37:06 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 37n2909s5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Apr 2021 07:37:06 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1327b5kp9700020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Apr 2021 07:37:06 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0460BE051;
 Fri,  2 Apr 2021 07:37:05 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D40FBE05F;
 Fri,  2 Apr 2021 07:37:05 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.102.0.8])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  2 Apr 2021 07:37:04 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 1E93C2E2F1A; Fri,  2 Apr 2021 13:06:59 +0530 (IST)
Date: Fri, 2 Apr 2021 13:06:59 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: Re: [RFC/PATCH] powerpc/smp: Add SD_SHARE_PKG_RESOURCES flag to MC
 sched-domain
Message-ID: <20210402073659.GA651@in.ibm.com>
References: <1617341874-1205-1-git-send-email-ego@linux.vnet.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617341874-1205-1-git-send-email-ego@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qAHtf1bDgTi0HLFQSuiMyQhv2rJyPJLj
X-Proofpoint-ORIG-GUID: 2FcsF6XoqFr-E553hrSM6GPzAgUFW4Ty
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-02_06:2021-04-01,
 2021-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103310000
 definitions=main-2104020053
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
Cc: Parth Shah <parth@linux.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Rik van Riel <riel@surriel.com>,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

(Missed cc'ing Cc Peter in the original posting)

On Fri, Apr 02, 2021 at 11:07:54AM +0530, Gautham R. Shenoy wrote:
> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> 
> On POWER10 systems, the L2 cache is at the SMT4 small core level. The
> following commits ensure that L2 cache gets correctly discovered and
> the Last-Level-Cache domain (LLC) is set to the SMT sched-domain.
> 
>     790a166 powerpc/smp: Parse ibm,thread-groups with multiple properties
>     1fdc1d6 powerpc/smp: Rename cpu_l1_cache_map as thread_group_l1_cache_map
>     fbd2b67 powerpc/smp: Rename init_thread_group_l1_cache_map() to make
>                          it generic
>     538abe powerpc/smp: Add support detecting thread-groups sharing L2 cache
>     0be4763 powerpc/cacheinfo: Print correct cache-sibling map/list for L2 cache
> 
> However, with the LLC now on the SMT sched-domain, we are seeing some
> regressions in the performance of applications that requires
> single-threaded performance. The reason for this is as follows:
> 
> Prior to the change (we call this P9-sched below), the sched-domain
> hierarchy was:
> 
> 	  SMT (SMT4) --> CACHE (SMT8)[LLC] --> MC (Hemisphere) --> DIE
> 
> where the CACHE sched-domain is defined to be the Last Level Cache (LLC).
> 
> On the upstream kernel, with the aforementioned commmits (P10-sched),
> the sched-domain hierarchy is:
> 
>     	  SMT (SMT4)[LLC] --> MC (Hemisphere) --> DIE
> 
> with the SMT sched-domain as the LLC.
> 
> When the scheduler tries to wakeup a task, it chooses between the
> waker-CPU and the wakee's previous-CPU. Suppose this choice is called
> the "target", then in the target's LLC domain, the scheduler
> 
> a) tries to find an idle core in the LLC. This helps exploit the
>    SMT folding that the wakee task can benefit from. If an idle
>    core is found, the wakee is woken up on it.
> 
> b) Failing to find an idle core, the scheduler tries to find an idle
>    CPU in the LLC. This helps minimise the wakeup latency for the
>    wakee since it gets to run on the CPU immediately.
> 
> c) Failing this, it will wake it up on target CPU.
> 
> Thus, with P9-sched topology, since the CACHE domain comprises of two
> SMT4 cores, there is a decent chance that we get an idle core, failing
> which there is a relatively higher probability of finding an idle CPU
> among the 8 threads in the domain.
> 
> However, in P10-sched topology, since the SMT domain is the LLC and it
> contains only a single SMT4 core, the probability that we find that
> core to be idle is less. Furthermore, since there are only 4 CPUs to
> search for an idle CPU, there is lower probability that we can get an
> idle CPU to wake up the task on.
> 
> Thus applications which require single threaded performance will end
> up getting woken up on potentially busy core, even though there are
> idle cores in the system.
> 
> To remedy this, this patch proposes that the LLC be moved to the MC
> level which is a group of cores in one half of the chip.
> 
>       SMT (SMT4) --> MC (Hemisphere)[LLC] --> DIE
> 
> While there is no cache being shared at this level, this is still the
> level where some amount of cache-snooping takes place and it is
> relatively faster to access the data from the caches of the cores
> within this domain. With this change, we no longer see regressions on
> P10 for applications which require single threaded performance.
> 
> The patch also improves the tail latencies on schbench and the
> usecs/op on "perf bench sched pipe"
> 
> On a 10 core P10 system with 80 CPUs,
> 
> schbench
> ============
> (https://git.kernel.org/pub/scm/linux/kernel/git/mason/schbench.git/)
> 
> Values : Lower the better.
> 99th percentile is the tail latency.
> 
> 
> 99th percentile
> ~~~~~~~~~~~~~~~~~~
> No. messenger
> threads       5.12-rc4    5.12-rc4
>               P10-sched   MC-LLC
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 1             70 us         85 us
> 2             81 us        101 us
> 3             92 us        107 us
> 4             96 us        110 us
> 5            103 us        123 us
> 6           3412 us ---->  122 us
> 7           1490 us        136 us
> 8           6200 us       3572 us
> 
> 
> Hackbench
> ============
> (perf bench sched pipe)
> values: lower the better
> 
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> No. of
> parallel
> instances   5.12-rc4       5.12-rc4
>             P10-sched      MC-LLC 
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 1           24.04 us/op    18.72 us/op 
> 2           24.04 us/op    18.65 us/op 
> 4           24.01 us/op    18.76 us/op 
> 8           24.10 us/op    19.11 us/op 
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/smp.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 5a4d59a..c75dbd4 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -976,6 +976,13 @@ static bool has_coregroup_support(void)
>  	return coregroup_enabled;
>  }
> 
> +static int powerpc_mc_flags(void)
> +{
> +	if(has_coregroup_support())
> +		return SD_SHARE_PKG_RESOURCES;
> +	return 0;
> +}
> +
>  static const struct cpumask *cpu_mc_mask(int cpu)
>  {
>  	return cpu_coregroup_mask(cpu);
> @@ -986,7 +993,7 @@ static const struct cpumask *cpu_mc_mask(int cpu)
>  	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
>  #endif
>  	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
> -	{ cpu_mc_mask, SD_INIT_NAME(MC) },
> +	{ cpu_mc_mask, powerpc_mc_flags, SD_INIT_NAME(MC) },
>  	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
>  	{ NULL, },
>  };
> -- 
> 1.9.4
> 
