Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4382D10C5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 13:44:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqNL305F7zDqW6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:44:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IRncG1HJ; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqNG15sPnzDqTp
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Dec 2020 23:40:56 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7CZM2b115232; Mon, 7 Dec 2020 07:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=d54fkdPqazc9AMydW+sI9sY06ma7UCYEN/sACwtOrJc=;
 b=IRncG1HJea4z6Lj482+DXNh3qQaI2CyTJ/KMiR69xP4ZKNqc7tt0MzcOcB2zzammvE6b
 rZP+WcDn5E07wy2qdqn4yKAqRW0xZuEt/7UymVCfx4nMfeOpHpqtNJ9fef1ql5xQKJ4b
 R8puaSkMuldHpwXcyN/WKlmtzDau0v4L3A8px6u+mwJ9trAZEhR3Hh4WC0xKhuVUbvX+
 Dp2RXi1JMKqQWlZnlHBe/emEQQ1HEDkF/J8l4yevfJSTqxyz4GxY4LfzkpFPlMmGTv+x
 kHgzryhfrYqeMnL2lzc/+a+1Cjc9Xd0MzH7OKR8dSofA4DXojnMJarjuSKPxYY4pgHiP +w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359m0js647-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Dec 2020 07:40:46 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B7CZxW3117389;
 Mon, 7 Dec 2020 07:40:45 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359m0js63n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Dec 2020 07:40:45 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7CRPnM015402;
 Mon, 7 Dec 2020 12:40:44 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3581u8knna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Dec 2020 12:40:43 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0B7Cef0F50659824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 12:40:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92982AE056;
 Mon,  7 Dec 2020 12:40:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4879AE045;
 Mon,  7 Dec 2020 12:40:39 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  7 Dec 2020 12:40:39 +0000 (GMT)
Date: Mon, 7 Dec 2020 18:10:39 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/3] powerpc/smp: Add support detecting thread-groups
 sharing L2 cache
Message-ID: <20201207124039.GI528281@linux.vnet.ibm.com>
References: <1607057327-29822-1-git-send-email-ego@linux.vnet.ibm.com>
 <1607057327-29822-3-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1607057327-29822-3-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_10:2020-12-04,
 2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=1 malwarescore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070078
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Gautham R. Shenoy <ego@linux.vnet.ibm.com> [2020-12-04 10:18:46]:

> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> 
> On POWER systems, groups of threads within a core sharing the L2-cache
> can be indicated by the "ibm,thread-groups" property array with the
> identifier "2".
> 
> This patch adds support for detecting this, and when present, populate
> the populating the cpu_l2_cache_mask of every CPU to the core-siblings
> which share L2 with the CPU as specified in the by the
> "ibm,thread-groups" property array.
> 
> On a platform with the following "ibm,thread-group" configuration
> 		 00000001 00000002 00000004 00000000
> 		 00000002 00000004 00000006 00000001
> 		 00000003 00000005 00000007 00000002
> 		 00000002 00000004 00000000 00000002
> 		 00000004 00000006 00000001 00000003
> 		 00000005 00000007
> 
> Without this patch, the sched-domain hierarchy for CPUs 0,1 would be
> 	CPU0 attaching sched-domain(s):
> 	domain-0: span=0,2,4,6 level=SMT
> 	domain-1: span=0-7 level=CACHE
> 	domain-2: span=0-15,24-39,48-55 level=MC
> 	domain-3: span=0-55 level=DIE
> 
> 	CPU1 attaching sched-domain(s):
> 	domain-0: span=1,3,5,7 level=SMT
> 	domain-1: span=0-7 level=CACHE
> 	domain-2: span=0-15,24-39,48-55 level=MC
> 	domain-3: span=0-55 level=DIE
> 
> The CACHE domain at 0-7 is incorrect since the ibm,thread-groups
> sub-array
> [00000002 00000002 00000004
>  00000000 00000002 00000004 00000006
>  00000001 00000003 00000005 00000007]
> indicates that L2 (Property "2") is shared only between the threads of a single
> group. There are "2" groups of threads where each group contains "4"
> threads each. The groups being {0,2,4,6} and {1,3,5,7}.
> 
> With this patch, the sched-domain hierarchy for CPUs 0,1 would be
>      	CPU0 attaching sched-domain(s):
> 	domain-0: span=0,2,4,6 level=SMT
> 	domain-1: span=0-15,24-39,48-55 level=MC
> 	domain-2: span=0-55 level=DIE
> 
> 	CPU1 attaching sched-domain(s):
> 	domain-0: span=1,3,5,7 level=SMT
> 	domain-1: span=0-15,24-39,48-55 level=MC
> 	domain-2: span=0-55 level=DIE
> 
> The CACHE domain with span=0,2,4,6 for CPU 0 (span=1,3,5,7 for CPU 1
> resp.) gets degenerated into the SMT domain. Furthermore, the
> last-level-cache domain gets correctly set to the SMT sched-domain.
> 
> Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/smp.c | 66 +++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 58 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 6a242a3..a116d2d 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -76,6 +76,7 @@
>  struct task_struct *secondary_current;
>  bool has_big_cores;
>  bool coregroup_enabled;
> +bool thread_group_shares_l2;

Either keep this as static in this patch or add its declaration

> 
>  DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
>  DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
> @@ -99,6 +100,7 @@ enum {
> 
>  #define MAX_THREAD_LIST_SIZE	8
>  #define THREAD_GROUP_SHARE_L1   1
> +#define THREAD_GROUP_SHARE_L2   2
>  struct thread_groups {
>  	unsigned int property;
>  	unsigned int nr_groups;
> @@ -107,7 +109,7 @@ struct thread_groups {
>  };
> 
>  /* Maximum number of properties that groups of threads within a core can share */
> -#define MAX_THREAD_GROUP_PROPERTIES 1
> +#define MAX_THREAD_GROUP_PROPERTIES 2
> 
>  struct thread_groups_list {
>  	unsigned int nr_properties;
> @@ -121,6 +123,13 @@ struct thread_groups_list {
>   */
>  DEFINE_PER_CPU(cpumask_var_t, cpu_l1_cache_map);
> 
> +/*
> + * On some big-cores system, thread_group_l2_cache_map for each CPU
> + * corresponds to the set its siblings within the core that share the
> + * L2-cache.
> + */
> +DEFINE_PER_CPU(cpumask_var_t, thread_group_l2_cache_map);
> +

NIT:
We are trying to confuse ourselves with the names.
For L1 we have cpu_l2_cache_map to store the tasks from the thread group.
but cpu_smallcore_map for keeping track of tasks.

For L2 we have thread_group_l2_cache_map to store the tasks from the thread
group.  but cpu_l2_cache_map for keeping track of tasks.

I think we should do some renaming to keep the names consistent.
I would say probably say move the current cpu_l2_cache_map to
cpu_llc_cache_map and move the new aka  thread_group_l2_cache_map as
cpu_l2_cache_map to be somewhat consistent.

>  /* SMP operations for this machine */
>  struct smp_ops_t *smp_ops;
> 
> @@ -840,7 +851,8 @@ static int init_cpu_cache_map(int cpu, unsigned int cache_property)
>  	if (!dn)
>  		return -ENODATA;
> 
> -	if (!(cache_property == THREAD_GROUP_SHARE_L1))
> +	if (!(cache_property == THREAD_GROUP_SHARE_L1 ||
> +	      cache_property == THREAD_GROUP_SHARE_L2))
>  		return -EINVAL;
> 
>  	if (!cpu_tgl->nr_properties) {
> @@ -867,7 +879,10 @@ static int init_cpu_cache_map(int cpu, unsigned int cache_property)
>  		goto out;
>  	}
> 
> -	mask = &per_cpu(cpu_l1_cache_map, cpu);
> +	if (cache_property == THREAD_GROUP_SHARE_L1)
> +		mask = &per_cpu(cpu_l1_cache_map, cpu);
> +	else if (cache_property == THREAD_GROUP_SHARE_L2)
> +		mask = &per_cpu(thread_group_l2_cache_map, cpu);
> 
>  	zalloc_cpumask_var_node(mask, GFP_KERNEL, cpu_to_node(cpu));
> 
> @@ -973,6 +988,16 @@ static int init_big_cores(void)
>  	}
> 
>  	has_big_cores = true;
> +
> +	for_each_possible_cpu(cpu) {
> +		int err = init_cpu_cache_map(cpu, THREAD_GROUP_SHARE_L2);
> +
> +		if (err)
> +			return err;
> +	}
> +
> +	thread_group_shares_l2 = true;

Why do we need a separate loop. Why cant we merge this in the above loop
itself? 

> +	pr_info("Thread-groups in a core share L2-cache\n");

Can this be moved to a pr_debug? Does it help any regular user/admins to
know if thread-groups shared l2 cache. Infact it may confuse users on what
thread groups are and which thread groups dont share cache.
I would prefer some other name than thread_group_shares_l2 but dont know any
better alternatives and may be my choices are even worse.

>  	return 0;
>  }
> 
> @@ -1287,6 +1312,31 @@ static bool update_mask_by_l2(int cpu, cpumask_var_t *mask)
>  	if (has_big_cores)
>  		submask_fn = cpu_smallcore_mask;
> 
> +

NIT: extra blank line?

> +	/*
> +	 * If the threads in a thread-group share L2 cache, then then
> +	 * the L2-mask can be obtained from thread_group_l2_cache_map.
> +	 */
> +	if (thread_group_shares_l2) {
> +		/* Siblings that share L1 is a subset of siblings that share L2.*/
> +		or_cpumasks_related(cpu, cpu, submask_fn, cpu_l2_cache_mask);
> +		if (*mask) {
> +			cpumask_andnot(*mask,
> +				       per_cpu(thread_group_l2_cache_map, cpu),
> +				       cpu_l2_cache_mask(cpu));
> +		} else {
> +			mask = &per_cpu(thread_group_l2_cache_map, cpu);
> +		}
> +
> +		for_each_cpu(i, *mask) {
> +			if (!cpu_online(i))
> +				continue;
> +			set_cpus_related(i, cpu, cpu_l2_cache_mask);
> +		}
> +
> +		return true;
> +	}
> +

Ah this can be simplified to:
if (thread_group_shares_l2) {
	cpumask_set_cpu(cpu, cpu_l2_cache_mask(cpu));

	for_each_cpu(i, per_cpu(thread_group_l2_cache_map, cpu)) {
		if (cpu_online(i))
			set_cpus_related(i, cpu, cpu_l2_cache_mask);
	}
}

No?

>  	l2_cache = cpu_to_l2cache(cpu);
>  	if (!l2_cache || !*mask) {
>  		/* Assume only core siblings share cache with this CPU */

-- 
Thanks and Regards
Srikar Dronamraju
