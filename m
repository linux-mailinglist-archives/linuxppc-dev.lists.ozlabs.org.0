Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF8F4F95C0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 14:28:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZcx365DPz3bpj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 22:28:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UdAcjE4c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UdAcjE4c; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZcwL3DbFz2xvS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 22:28:02 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 238CIqi2020806; 
 Fri, 8 Apr 2022 12:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=HU+8+zh9GUF93NeGHHtWuqd7tZIaGNgNVe0X/9nToYc=;
 b=UdAcjE4cIXBxmZz5ArcUuTEExs8f0VESYqFw3nJ/QzEo1zHaexHsb/7AihUG+Njh1T89
 0J9HgDxTfYMkcwfMYQY8PuIO8J8I+LfUm+ns6IWJ6O9C9YcfWIHMYAj13DdM/0ccn1Xy
 XRVi2HLqGT0Qw4GS10fBDn246cCNIq09JDNE5IzMotgM+y9WLfhr+59ZV8T3Vx8KjKn8
 U8Im/MwlFVcLzzlppkMPSofk9GVEkawaYav4JPgPF4fp3Xes0YvdTp3eS0b7QOn1ylZW
 EcrELozeCuLUyYcb3xSsNMDg7wEjqgfXQVYaSxoUBmMx/j2gyHKK15wS2jwKqyBdhuyY LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3faeqq7d6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 12:27:54 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 238Bks2M034821;
 Fri, 8 Apr 2022 12:27:53 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3faeqq7d65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 12:27:53 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 238CDZ8t003675;
 Fri, 8 Apr 2022 12:27:51 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3f6e493req-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 12:27:51 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 238CRuDo46989570
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Apr 2022 12:27:56 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D043BAE051;
 Fri,  8 Apr 2022 12:27:48 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD28EAE045;
 Fri,  8 Apr 2022 12:27:46 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.40.195.195])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  8 Apr 2022 12:27:46 +0000 (GMT)
Date: Fri, 8 Apr 2022 17:57:46 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/4] tools/perf: Fix perf bench futex to correct usage
 of affinity for machines with #CPUs > 1K
Message-ID: <20220408122746.GF568950@linux.vnet.ibm.com>
References: <20220406175113.87881-1-atrajeev@linux.vnet.ibm.com>
 <20220406175113.87881-2-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20220406175113.87881-2-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5hrw8F5CNYz9fR6rIWH7nJ3V0hdhlQCp
X-Proofpoint-ORIG-GUID: oM7ZKeYnD71NvGL7PjesL8HrBrBKKXES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_04,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
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

* Athira Rajeev <atrajeev@linux.vnet.ibm.com> [2022-04-06 23:21:10]:

> perf bench futex testcase fails on systems with CPU's
> more than 1K.
> 
> Testcase: perf bench futex all
> Failure snippet:
> <<>>Running futex/hash benchmark...
> 
> perf: pthread_create: No such file or directory
> <<>>
> 
> All the futex benchmarks ( ie hash, lock-api, requeue, wake,
> wake-parallel ), pthread_create is invoked in respective bench_futex_*
> function. Though the logs shows direct failure from pthread_create,
> strace logs showed that actual failure is from  "sched_setaffinity"
> returning EINVAL (invalid argument). This happens because the default
> mask size in glibc is 1024. To overcome this 1024 CPUs mask size
> limitation of cpu_set_t, change the mask size using the CPU_*_S macros.
> 
> Patch addresses this by fixing all the futex benchmarks to use
> CPU_ALLOC to allocate cpumask, CPU_ALLOC_SIZE for size, and
> CPU_SET_S to set the mask.
> 
> Tested-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>

Looks good to me
Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>


> ---
>  tools/perf/bench/futex-hash.c          | 26 +++++++++++++++++++-------
>  tools/perf/bench/futex-lock-pi.c       | 21 ++++++++++++++++-----
>  tools/perf/bench/futex-requeue.c       | 21 ++++++++++++++++-----
>  tools/perf/bench/futex-wake-parallel.c | 21 ++++++++++++++++-----
>  tools/perf/bench/futex-wake.c          | 22 ++++++++++++++++------
>  5 files changed, 83 insertions(+), 28 deletions(-)
> 
> diff --git a/tools/perf/bench/futex-hash.c b/tools/perf/bench/futex-hash.c
> index 9627b6ab8670..dfce64e551e2 100644
> --- a/tools/perf/bench/futex-hash.c
> +++ b/tools/perf/bench/futex-hash.c
> @@ -122,12 +122,14 @@ static void print_summary(void)
>  int bench_futex_hash(int argc, const char **argv)
>  {
>  	int ret = 0;
> -	cpu_set_t cpuset;
> +	cpu_set_t *cpuset;
>  	struct sigaction act;
>  	unsigned int i;
>  	pthread_attr_t thread_attr;
>  	struct worker *worker = NULL;
>  	struct perf_cpu_map *cpu;
> +	int nrcpus;
> +	size_t size;
> 
>  	argc = parse_options(argc, argv, options, bench_futex_hash_usage, 0);
>  	if (argc) {
> @@ -170,25 +172,35 @@ int bench_futex_hash(int argc, const char **argv)
>  	threads_starting = params.nthreads;
>  	pthread_attr_init(&thread_attr);
>  	gettimeofday(&bench__start, NULL);
> +
> +	nrcpus = perf_cpu_map__nr(cpu);
> +	cpuset = CPU_ALLOC(nrcpus);
> +	BUG_ON(!cpuset);
> +	size = CPU_ALLOC_SIZE(nrcpus);
> +
>  	for (i = 0; i < params.nthreads; i++) {
>  		worker[i].tid = i;
>  		worker[i].futex = calloc(params.nfutexes, sizeof(*worker[i].futex));
>  		if (!worker[i].futex)
>  			goto errmem;
> 
> -		CPU_ZERO(&cpuset);
> -		CPU_SET(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, &cpuset);
> +		CPU_ZERO_S(size, cpuset);
> 
> -		ret = pthread_attr_setaffinity_np(&thread_attr, sizeof(cpu_set_t), &cpuset);
> -		if (ret)
> +		CPU_SET_S(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, size, cpuset);
> +		ret = pthread_attr_setaffinity_np(&thread_attr, size, cpuset);
> +		if (ret) {
> +			CPU_FREE(cpuset);
>  			err(EXIT_FAILURE, "pthread_attr_setaffinity_np");
> -
> +		}
>  		ret = pthread_create(&worker[i].thread, &thread_attr, workerfn,
>  				     (void *)(struct worker *) &worker[i]);
> -		if (ret)
> +		if (ret) {
> +			CPU_FREE(cpuset);
>  			err(EXIT_FAILURE, "pthread_create");
> +		}
> 
>  	}
> +	CPU_FREE(cpuset);
>  	pthread_attr_destroy(&thread_attr);
> 
>  	pthread_mutex_lock(&thread_lock);
> diff --git a/tools/perf/bench/futex-lock-pi.c b/tools/perf/bench/futex-lock-pi.c
> index a512a320df74..61c3bb80d4cf 100644
> --- a/tools/perf/bench/futex-lock-pi.c
> +++ b/tools/perf/bench/futex-lock-pi.c
> @@ -120,11 +120,17 @@ static void *workerfn(void *arg)
>  static void create_threads(struct worker *w, pthread_attr_t thread_attr,
>  			   struct perf_cpu_map *cpu)
>  {
> -	cpu_set_t cpuset;
> +	cpu_set_t *cpuset;
>  	unsigned int i;
> +	int nrcpus =  perf_cpu_map__nr(cpu);
> +	size_t size;
> 
>  	threads_starting = params.nthreads;
> 
> +	cpuset = CPU_ALLOC(nrcpus);
> +	BUG_ON(!cpuset);
> +	size = CPU_ALLOC_SIZE(nrcpus);
> +
>  	for (i = 0; i < params.nthreads; i++) {
>  		worker[i].tid = i;
> 
> @@ -135,15 +141,20 @@ static void create_threads(struct worker *w, pthread_attr_t thread_attr,
>  		} else
>  			worker[i].futex = &global_futex;
> 
> -		CPU_ZERO(&cpuset);
> -		CPU_SET(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, &cpuset);
> +		CPU_ZERO_S(size, cpuset);
> +		CPU_SET_S(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, size, cpuset);
> 
> -		if (pthread_attr_setaffinity_np(&thread_attr, sizeof(cpu_set_t), &cpuset))
> +		if (pthread_attr_setaffinity_np(&thread_attr, size, cpuset)) {
> +			CPU_FREE(cpuset);
>  			err(EXIT_FAILURE, "pthread_attr_setaffinity_np");
> +		}
> 
> -		if (pthread_create(&w[i].thread, &thread_attr, workerfn, &worker[i]))
> +		if (pthread_create(&w[i].thread, &thread_attr, workerfn, &worker[i])) {
> +			CPU_FREE(cpuset);
>  			err(EXIT_FAILURE, "pthread_create");
> +		}
>  	}
> +	CPU_FREE(cpuset);
>  }
> 
>  int bench_futex_lock_pi(int argc, const char **argv)
> diff --git a/tools/perf/bench/futex-requeue.c b/tools/perf/bench/futex-requeue.c
> index aca47ce8b1e7..2cb013f7ffe5 100644
> --- a/tools/perf/bench/futex-requeue.c
> +++ b/tools/perf/bench/futex-requeue.c
> @@ -123,22 +123,33 @@ static void *workerfn(void *arg __maybe_unused)
>  static void block_threads(pthread_t *w,
>  			  pthread_attr_t thread_attr, struct perf_cpu_map *cpu)
>  {
> -	cpu_set_t cpuset;
> +	cpu_set_t *cpuset;
>  	unsigned int i;
> +	int nrcpus = perf_cpu_map__nr(cpu);
> +	size_t size;
> 
>  	threads_starting = params.nthreads;
> 
> +	cpuset = CPU_ALLOC(nrcpus);
> +	BUG_ON(!cpuset);
> +	size = CPU_ALLOC_SIZE(nrcpus);
> +
>  	/* create and block all threads */
>  	for (i = 0; i < params.nthreads; i++) {
> -		CPU_ZERO(&cpuset);
> -		CPU_SET(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, &cpuset);
> +		CPU_ZERO_S(size, cpuset);
> +		CPU_SET_S(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, size, cpuset);
> 
> -		if (pthread_attr_setaffinity_np(&thread_attr, sizeof(cpu_set_t), &cpuset))
> +		if (pthread_attr_setaffinity_np(&thread_attr, size, cpuset)) {
> +			CPU_FREE(cpuset);
>  			err(EXIT_FAILURE, "pthread_attr_setaffinity_np");
> +		}
> 
> -		if (pthread_create(&w[i], &thread_attr, workerfn, NULL))
> +		if (pthread_create(&w[i], &thread_attr, workerfn, NULL)) {
> +			CPU_FREE(cpuset);
>  			err(EXIT_FAILURE, "pthread_create");
> +		}
>  	}
> +	CPU_FREE(cpuset);
>  }
> 
>  static void toggle_done(int sig __maybe_unused,
> diff --git a/tools/perf/bench/futex-wake-parallel.c b/tools/perf/bench/futex-wake-parallel.c
> index 888ee6037945..efa5070a5eb3 100644
> --- a/tools/perf/bench/futex-wake-parallel.c
> +++ b/tools/perf/bench/futex-wake-parallel.c
> @@ -144,22 +144,33 @@ static void *blocked_workerfn(void *arg __maybe_unused)
>  static void block_threads(pthread_t *w, pthread_attr_t thread_attr,
>  			  struct perf_cpu_map *cpu)
>  {
> -	cpu_set_t cpuset;
> +	cpu_set_t *cpuset;
>  	unsigned int i;
> +	int nrcpus = perf_cpu_map__nr(cpu);
> +	size_t size;
> 
>  	threads_starting = params.nthreads;
> 
> +	cpuset = CPU_ALLOC(nrcpus);
> +	BUG_ON(!cpuset);
> +	size = CPU_ALLOC_SIZE(nrcpus);
> +
>  	/* create and block all threads */
>  	for (i = 0; i < params.nthreads; i++) {
> -		CPU_ZERO(&cpuset);
> -		CPU_SET(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, &cpuset);
> +		CPU_ZERO_S(size, cpuset);
> +		CPU_SET_S(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, size, cpuset);
> 
> -		if (pthread_attr_setaffinity_np(&thread_attr, sizeof(cpu_set_t), &cpuset))
> +		if (pthread_attr_setaffinity_np(&thread_attr, size, cpuset)) {
> +			CPU_FREE(cpuset);
>  			err(EXIT_FAILURE, "pthread_attr_setaffinity_np");
> +		}
> 
> -		if (pthread_create(&w[i], &thread_attr, blocked_workerfn, NULL))
> +		if (pthread_create(&w[i], &thread_attr, blocked_workerfn, NULL)) {
> +			CPU_FREE(cpuset);
>  			err(EXIT_FAILURE, "pthread_create");
> +		}
>  	}
> +	CPU_FREE(cpuset);
>  }
> 
>  static void print_run(struct thread_data *waking_worker, unsigned int run_num)
> diff --git a/tools/perf/bench/futex-wake.c b/tools/perf/bench/futex-wake.c
> index aa82db51c0ab..3a10f54900c1 100644
> --- a/tools/perf/bench/futex-wake.c
> +++ b/tools/perf/bench/futex-wake.c
> @@ -97,22 +97,32 @@ static void print_summary(void)
>  static void block_threads(pthread_t *w,
>  			  pthread_attr_t thread_attr, struct perf_cpu_map *cpu)
>  {
> -	cpu_set_t cpuset;
> +	cpu_set_t *cpuset;
>  	unsigned int i;
> -
> +	size_t size;
> +	int nrcpus = perf_cpu_map__nr(cpu);
>  	threads_starting = params.nthreads;
> 
> +	cpuset = CPU_ALLOC(nrcpus);
> +	BUG_ON(!cpuset);
> +	size = CPU_ALLOC_SIZE(nrcpus);
> +
>  	/* create and block all threads */
>  	for (i = 0; i < params.nthreads; i++) {
> -		CPU_ZERO(&cpuset);
> -		CPU_SET(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, &cpuset);
> +		CPU_ZERO_S(size, cpuset);
> +		CPU_SET_S(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, size, cpuset);
> 
> -		if (pthread_attr_setaffinity_np(&thread_attr, sizeof(cpu_set_t), &cpuset))
> +		if (pthread_attr_setaffinity_np(&thread_attr, size, cpuset)) {
> +			CPU_FREE(cpuset);
>  			err(EXIT_FAILURE, "pthread_attr_setaffinity_np");
> +		}
> 
> -		if (pthread_create(&w[i], &thread_attr, workerfn, NULL))
> +		if (pthread_create(&w[i], &thread_attr, workerfn, NULL)) {
> +			CPU_FREE(cpuset);
>  			err(EXIT_FAILURE, "pthread_create");
> +		}
>  	}
> +	CPU_FREE(cpuset);
>  }
> 
>  static void toggle_done(int sig __maybe_unused,
> -- 
> 2.35.1
> 
