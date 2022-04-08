Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CF14F95CC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 14:29:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZcy903L6z3byS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 22:29:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JeQ0wfcP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JeQ0wfcP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZcxQ65sxz2xVY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 22:28:58 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 238C5dlh011335; 
 Fri, 8 Apr 2022 12:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=dJ4beaFBj69hR6/xMuS7HEMqPjkxsdKD2Fy234LyYS8=;
 b=JeQ0wfcPD349R6HwWtTdNc9u/RqNzD1wcuh7wQq/O/+ZRXYkqkOfFykoxW0djKhsKT72
 ccWdwyTT/BeDFgPi3IHr7/gNt5O2Og0SywVfNZS3dq6ytIo8VRcPbali2DE7MnVqsdZj
 jhyjn6D+Fa4S2i3JCkkbtncUCT5Qr8pkyTovG9ew/UJCRmq1Vr0BWo85y8HbRGcHztot
 Omv8XIwPGPB0uX267vBp4AjgSnVe2dUwLF8U9w3Oet7Lesg4lritAsb4Grxg1k+7kFOx
 hrn4L1V0hi1na4URCq6ihe+zwxadhihYn2wYoJ4Hja6+x3gBeAlpOjHw+aEEeH9BMzgZ Og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3faewhyen7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 12:28:51 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 238C4rqM012381;
 Fri, 8 Apr 2022 12:28:51 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3faewhyemc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 12:28:51 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 238CDCg9021288;
 Fri, 8 Apr 2022 12:28:48 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3f6drhur53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 12:28:48 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 238CSjo031523300
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Apr 2022 12:28:45 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98FD44C04A;
 Fri,  8 Apr 2022 12:28:45 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C956D4C040;
 Fri,  8 Apr 2022 12:28:43 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.40.195.195])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  8 Apr 2022 12:28:43 +0000 (GMT)
Date: Fri, 8 Apr 2022 17:58:43 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 3/4] tools/perf: Fix perf numa bench to fix usage of
 affinity for machines with #CPUs > 1K
Message-ID: <20220408122843.GG568950@linux.vnet.ibm.com>
References: <20220406175113.87881-1-atrajeev@linux.vnet.ibm.com>
 <20220406175113.87881-4-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20220406175113.87881-4-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _ibXQBYgrYKyfjg5p_lAh_xtppsCcFzW
X-Proofpoint-GUID: uzpDh3wRuwTmoQRKYQ_nh379siq8HWRl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_04,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204080062
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-kernel@vger.kernel.org, acme@kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Athira Rajeev <atrajeev@linux.vnet.ibm.com> [2022-04-06 23:21:12]:

> perf bench numa testcase fails on systems with CPU's
> more than 1K.
> 
> Testcase: perf bench numa mem -p 1 -t 3 -P 512 -s 100 -zZ0qcm --thp  1
> Snippet of code:
> <<>>
> perf: bench/numa.c:302: bind_to_node: Assertion `!(ret)' failed.
> Aborted (core dumped)
> <<>>
> 
> bind_to_node function uses "sched_getaffinity" to save the original
> cpumask and this call is returning EINVAL ((invalid argument).
> This happens because the default mask size in glibc is 1024.
> To overcome this 1024 CPUs mask size limitation of cpu_set_t,
> change the mask size using the CPU_*_S macros ie, use CPU_ALLOC to
> allocate cpumask, CPU_ALLOC_SIZE for size. Apart from fixing this
> for "orig_mask", apply same logic to "mask" as well which is used to
> setaffinity so that mask size is large enough to represent number
> of possible CPU's in the system.
> 
> sched_getaffinity is used in one more place in perf numa bench. It
> is in "bind_to_cpu" function. Apply the same logic there also. Though
> currently no failure is reported from there, it is ideal to change
> getaffinity to work with such system configurations having CPU's more
> than default mask size supported by glibc.
> 
> Also fix "sched_setaffinity" to use mask size which is large enough
> to represent number of possible CPU's in the system.
> 
> Fixed all places where "bind_cpumask" which is part of "struct
> thread_data" is used such that bind_cpumask works in all configuration.
> 
> Tested-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>

Looks good to me.

Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

> ---
>  tools/perf/bench/numa.c | 97 ++++++++++++++++++++++++++++++-----------
>  1 file changed, 71 insertions(+), 26 deletions(-)
> 
> diff --git a/tools/perf/bench/numa.c b/tools/perf/bench/numa.c
> index f2640179ada9..29e41e32bd88 100644
> --- a/tools/perf/bench/numa.c
> +++ b/tools/perf/bench/numa.c
> @@ -54,7 +54,7 @@
> 
>  struct thread_data {
>  	int			curr_cpu;
> -	cpu_set_t		bind_cpumask;
> +	cpu_set_t		*bind_cpumask;
>  	int			bind_node;
>  	u8			*process_data;
>  	int			process_nr;
> @@ -266,46 +266,71 @@ static bool node_has_cpus(int node)
>  	return ret;
>  }
> 
> -static cpu_set_t bind_to_cpu(int target_cpu)
> +static cpu_set_t *bind_to_cpu(int target_cpu)
>  {
> -	cpu_set_t orig_mask, mask;
> +	int nrcpus = numa_num_possible_cpus();
> +	cpu_set_t *orig_mask, *mask;
> +	size_t size;
>  	int ret;
> 
> -	ret = sched_getaffinity(0, sizeof(orig_mask), &orig_mask);
> -	BUG_ON(ret);
> +	orig_mask = CPU_ALLOC(nrcpus);
> +	BUG_ON(!orig_mask);
> +	size = CPU_ALLOC_SIZE(nrcpus);
> +	CPU_ZERO_S(size, orig_mask);
> +
> +	ret = sched_getaffinity(0, size, orig_mask);
> +	if (ret) {
> +		CPU_FREE(orig_mask);
> +		BUG_ON(ret);
> +	}
> 
> -	CPU_ZERO(&mask);
> +	mask = CPU_ALLOC(nrcpus);
> +	BUG_ON(!mask);
> +	CPU_ZERO_S(size, mask);
> 
>  	if (target_cpu == -1) {
>  		int cpu;
> 
>  		for (cpu = 0; cpu < g->p.nr_cpus; cpu++)
> -			CPU_SET(cpu, &mask);
> +			CPU_SET_S(cpu, size, mask);
>  	} else {
>  		BUG_ON(target_cpu < 0 || target_cpu >= g->p.nr_cpus);
> -		CPU_SET(target_cpu, &mask);
> +		CPU_SET_S(target_cpu, size, mask);
>  	}
> 
> -	ret = sched_setaffinity(0, sizeof(mask), &mask);
> +	ret = sched_setaffinity(0, size, mask);
> +	CPU_FREE(mask);
>  	BUG_ON(ret);
> 
>  	return orig_mask;
>  }
> 
> -static cpu_set_t bind_to_node(int target_node)
> +static cpu_set_t *bind_to_node(int target_node)
>  {
> -	cpu_set_t orig_mask, mask;
> +	int nrcpus = numa_num_possible_cpus();
> +	cpu_set_t *orig_mask, *mask;
> +	size_t size;
>  	int cpu;
>  	int ret;
> 
> -	ret = sched_getaffinity(0, sizeof(orig_mask), &orig_mask);
> -	BUG_ON(ret);
> +	orig_mask = CPU_ALLOC(nrcpus);
> +	BUG_ON(!orig_mask);
> +	size = CPU_ALLOC_SIZE(nrcpus);
> +	CPU_ZERO_S(size, orig_mask);
> +
> +	ret = sched_getaffinity(0, size, orig_mask);
> +	if (ret) {
> +		CPU_FREE(orig_mask);
> +		BUG_ON(ret);
> +	}
> 
> -	CPU_ZERO(&mask);
> +	mask = CPU_ALLOC(nrcpus);
> +	BUG_ON(!mask);
> +	CPU_ZERO_S(size, mask);
> 
>  	if (target_node == NUMA_NO_NODE) {
>  		for (cpu = 0; cpu < g->p.nr_cpus; cpu++)
> -			CPU_SET(cpu, &mask);
> +			CPU_SET_S(cpu, size, mask);
>  	} else {
>  		struct bitmask *cpumask = numa_allocate_cpumask();
> 
> @@ -313,24 +338,29 @@ static cpu_set_t bind_to_node(int target_node)
>  		if (!numa_node_to_cpus(target_node, cpumask)) {
>  			for (cpu = 0; cpu < (int)cpumask->size; cpu++) {
>  				if (numa_bitmask_isbitset(cpumask, cpu))
> -					CPU_SET(cpu, &mask);
> +					CPU_SET_S(cpu, size, mask);
>  			}
>  		}
>  		numa_free_cpumask(cpumask);
>  	}
> 
> -	ret = sched_setaffinity(0, sizeof(mask), &mask);
> +	ret = sched_setaffinity(0, size, mask);
> +	CPU_FREE(mask);
>  	BUG_ON(ret);
> 
>  	return orig_mask;
>  }
> 
> -static void bind_to_cpumask(cpu_set_t mask)
> +static void bind_to_cpumask(cpu_set_t *mask)
>  {
>  	int ret;
> +	size_t size = CPU_ALLOC_SIZE(numa_num_possible_cpus());
> 
> -	ret = sched_setaffinity(0, sizeof(mask), &mask);
> -	BUG_ON(ret);
> +	ret = sched_setaffinity(0, size, mask);
> +	if (ret) {
> +		CPU_FREE(mask);
> +		BUG_ON(ret);
> +	}
>  }
> 
>  static void mempol_restore(void)
> @@ -376,7 +406,7 @@ do {							\
>  static u8 *alloc_data(ssize_t bytes0, int map_flags,
>  		      int init_zero, int init_cpu0, int thp, int init_random)
>  {
> -	cpu_set_t orig_mask;
> +	cpu_set_t *orig_mask;
>  	ssize_t bytes;
>  	u8 *buf;
>  	int ret;
> @@ -434,6 +464,7 @@ static u8 *alloc_data(ssize_t bytes0, int map_flags,
>  	/* Restore affinity: */
>  	if (init_cpu0) {
>  		bind_to_cpumask(orig_mask);
> +		CPU_FREE(orig_mask);
>  		mempol_restore();
>  	}
> 
> @@ -589,6 +620,7 @@ static int parse_setup_cpu_list(void)
>  		BUG_ON(bind_cpu_0 > bind_cpu_1);
> 
>  		for (bind_cpu = bind_cpu_0; bind_cpu <= bind_cpu_1; bind_cpu += step) {
> +			size_t size = CPU_ALLOC_SIZE(g->p.nr_cpus);
>  			int i;
> 
>  			for (i = 0; i < mul; i++) {
> @@ -608,10 +640,12 @@ static int parse_setup_cpu_list(void)
>  					tprintf("%2d", bind_cpu);
>  				}
> 
> -				CPU_ZERO(&td->bind_cpumask);
> +				td->bind_cpumask = CPU_ALLOC(g->p.nr_cpus);
> +				BUG_ON(!td->bind_cpumask);
> +				CPU_ZERO_S(size, td->bind_cpumask);
>  				for (cpu = bind_cpu; cpu < bind_cpu+bind_len; cpu++) {
>  					BUG_ON(cpu < 0 || cpu >= g->p.nr_cpus);
> -					CPU_SET(cpu, &td->bind_cpumask);
> +					CPU_SET_S(cpu, size, td->bind_cpumask);
>  				}
>  				t++;
>  			}
> @@ -1241,7 +1275,7 @@ static void *worker_thread(void *__tdata)
>  		 * by migrating to CPU#0:
>  		 */
>  		if (first_task && g->p.perturb_secs && (int)(stop.tv_sec - last_perturbance) >= g->p.perturb_secs) {
> -			cpu_set_t orig_mask;
> +			cpu_set_t *orig_mask;
>  			int target_cpu;
>  			int this_cpu;
> 
> @@ -1265,6 +1299,7 @@ static void *worker_thread(void *__tdata)
>  				printf(" (injecting perturbalance, moved to CPU#%d)\n", target_cpu);
> 
>  			bind_to_cpumask(orig_mask);
> +			CPU_FREE(orig_mask);
>  		}
> 
>  		if (details >= 3) {
> @@ -1398,21 +1433,31 @@ static void init_thread_data(void)
> 
>  	for (t = 0; t < g->p.nr_tasks; t++) {
>  		struct thread_data *td = g->threads + t;
> +		size_t cpuset_size = CPU_ALLOC_SIZE(g->p.nr_cpus);
>  		int cpu;
> 
>  		/* Allow all nodes by default: */
>  		td->bind_node = NUMA_NO_NODE;
> 
>  		/* Allow all CPUs by default: */
> -		CPU_ZERO(&td->bind_cpumask);
> +		td->bind_cpumask = CPU_ALLOC(g->p.nr_cpus);
> +		BUG_ON(!td->bind_cpumask);
> +		CPU_ZERO_S(cpuset_size, td->bind_cpumask);
>  		for (cpu = 0; cpu < g->p.nr_cpus; cpu++)
> -			CPU_SET(cpu, &td->bind_cpumask);
> +			CPU_SET_S(cpu, cpuset_size, td->bind_cpumask);
>  	}
>  }
> 
>  static void deinit_thread_data(void)
>  {
>  	ssize_t size = sizeof(*g->threads)*g->p.nr_tasks;
> +	int t;
> +
> +	/* Free the bind_cpumask allocated for thread_data */
> +	for (t = 0; t < g->p.nr_tasks; t++) {
> +		struct thread_data *td = g->threads + t;
> +		CPU_FREE(td->bind_cpumask);
> +	}
> 
>  	free_data(g->threads, size);
>  }
> -- 
> 2.35.1
> 
