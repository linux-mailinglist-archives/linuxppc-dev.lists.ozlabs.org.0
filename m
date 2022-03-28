Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9174E943B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 13:25:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRr3J2yDtz3c2q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 22:25:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PUmcGQJw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PUmcGQJw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRr2f00lcz2xBK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 22:24:57 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22S8q9MM019240; 
 Mon, 28 Mar 2022 11:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=I5dFES/eWSZnGXe3JZkKj+4IbIArY7yWHLMSomc3d7o=;
 b=PUmcGQJwKQShK8CRbBzYWwflCbDoVrM2QaXvzw8w0Y8ICs/dujRYPwe7ExHvKPVIEmIF
 IIdSmV/zaYXYbQ4oNMcPSzCcM+kd+ckFX4yr9xyORwxaxfwdPCz9xf1p+hEnpi7hFFyC
 Qmf4U3J+Q0r5Z/pX+2thgNUxvjDGJZqkMXDVE+8i/zCCXvWYKvcuYdRcKLRo4QdvnKea
 fxkYVtvDYc5OKrBpFcehBOmHUTim4COI840xTA7RMFdVUnAVzic7+SuwMEYkTqNGCIev
 zw5uYUCvXmeMkPNbjzgN5lLI37rQJ+tPaGjBoe0wMcZq8NzKuUqRO4IwbFehoLqGpz7r Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f37j9wjj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 11:23:54 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22SAmLng032631;
 Mon, 28 Mar 2022 11:23:53 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f37j9wjhh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 11:23:53 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22SB7fYG005171;
 Mon, 28 Mar 2022 11:23:50 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3f1tf8u7y5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 11:23:50 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22SBNmYA32964980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Mar 2022 11:23:48 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C4474C040;
 Mon, 28 Mar 2022 11:23:48 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AB054C046;
 Mon, 28 Mar 2022 11:23:45 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.40.195.195])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 28 Mar 2022 11:23:45 +0000 (GMT)
Date: Mon, 28 Mar 2022 16:53:44 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Qing Wang <wangqing@vivo.com>
Subject: Re: [PATCH] sched: topology: add input parameter for
 sched_domain_flags_f()
Message-ID: <20220328112344.GA557306@linux.vnet.ibm.com>
References: <1648461219-4333-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1648461219-4333-1-git-send-email-wangqing@vivo.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AwB0kzleKPyBqCHr9vUXxqYLBXV0KV3X
X-Proofpoint-GUID: hinLlWNsO13sFPgm-QS03HRYBoYTbVnp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_04,2022-03-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 phishscore=0 mlxscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203280063
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
Cc: Juri Lelli <juri.lelli@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, Ben Segall <bsegall@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Mel Gorman <mgorman@suse.de>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Qing Wang <wangqing@vivo.com> [2022-03-28 02:53:37]:

> From: Wang Qing <wangqing@vivo.com>
> 
> sched_domain_flags_f() are statically set now, but actually, we can get a
> lot of necessary information based on the cpu_map. e.g. we can know whether
> its cache is shared.
> 
> Allows custom extension without affecting current.
> 

can you elaborate on how passing a cpumask pointer will help us to know if
cache is shared or not? With this patch, we are just passing the cpumask,
but dont seem to be using it in any of the cases. 

or did I miss anything?

> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  arch/powerpc/kernel/smp.c      |  4 ++--
>  arch/x86/kernel/smpboot.c      |  8 ++++----
>  include/linux/sched/topology.h | 10 +++++-----
>  kernel/sched/topology.c        |  2 +-
>  4 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index de0f6f0..e503d23
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1000,7 +1000,7 @@ static bool shared_caches;
>  
>  #ifdef CONFIG_SCHED_SMT
>  /* cpumask of CPUs with asymmetric SMT dependency */
> -static int powerpc_smt_flags(void)
> +static int powerpc_smt_flags(const struct cpumask *cpu_map)
>  {
>  	int flags = SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
>  
> @@ -1018,7 +1018,7 @@ static int powerpc_smt_flags(void)
>   * since the migrated task remains cache hot. We want to take advantage of this
>   * at the scheduler level so an extra topology level is required.
>   */
> -static int powerpc_shared_cache_flags(void)
> +static int powerpc_shared_cache_flags(const struct cpumask *cpu_map)
>  {
>  	return SD_SHARE_PKG_RESOURCES;
>  }
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index 2ef1477..c005a8e
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -535,25 +535,25 @@ static bool match_llc(struct cpuinfo_x86 *c, struct cpuinfo_x86 *o)
>  
>  
>  #if defined(CONFIG_SCHED_SMT) || defined(CONFIG_SCHED_CLUSTER) || defined(CONFIG_SCHED_MC)
> -static inline int x86_sched_itmt_flags(void)
> +static inline int x86_sched_itmt_flags(const struct cpumask *cpu_map)
>  {
>  	return sysctl_sched_itmt_enabled ? SD_ASYM_PACKING : 0;
>  }
>  
>  #ifdef CONFIG_SCHED_MC
> -static int x86_core_flags(void)
> +static int x86_core_flags(const struct cpumask *cpu_map)
>  {
>  	return cpu_core_flags() | x86_sched_itmt_flags();
>  }
>  #endif
>  #ifdef CONFIG_SCHED_SMT
> -static int x86_smt_flags(void)
> +static int x86_smt_flags(const struct cpumask *cpu_map)
>  {
>  	return cpu_smt_flags() | x86_sched_itmt_flags();
>  }
>  #endif
>  #ifdef CONFIG_SCHED_CLUSTER
> -static int x86_cluster_flags(void)
> +static int x86_cluster_flags(const struct cpumask *cpu_map)
>  {
>  	return cpu_cluster_flags() | x86_sched_itmt_flags();
>  }
> diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
> index 56cffe4..6aa985a
> --- a/include/linux/sched/topology.h
> +++ b/include/linux/sched/topology.h
> @@ -36,28 +36,28 @@ extern const struct sd_flag_debug sd_flag_debug[];
>  #endif
>  
>  #ifdef CONFIG_SCHED_SMT
> -static inline int cpu_smt_flags(void)
> +static inline int cpu_smt_flags(const struct cpumask *cpu_map)
>  {
>  	return SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
>  }
>  #endif
>  
>  #ifdef CONFIG_SCHED_CLUSTER
> -static inline int cpu_cluster_flags(void)
> +static inline int cpu_cluster_flags(const struct cpumask *cpu_map)
>  {
>  	return SD_SHARE_PKG_RESOURCES;
>  }
>  #endif
>  
>  #ifdef CONFIG_SCHED_MC
> -static inline int cpu_core_flags(void)
> +static inline int cpu_core_flags(const struct cpumask *cpu_map)
>  {
>  	return SD_SHARE_PKG_RESOURCES;
>  }
>  #endif
>  
>  #ifdef CONFIG_NUMA
> -static inline int cpu_numa_flags(void)
> +static inline int cpu_numa_flags(const struct cpumask *cpu_map)
>  {
>  	return SD_NUMA;
>  }
> @@ -180,7 +180,7 @@ void free_sched_domains(cpumask_var_t doms[], unsigned int ndoms);
>  bool cpus_share_cache(int this_cpu, int that_cpu);
>  
>  typedef const struct cpumask *(*sched_domain_mask_f)(int cpu);
> -typedef int (*sched_domain_flags_f)(void);
> +typedef int (*sched_domain_flags_f)(const struct cpumask *cpu_map);
>  
>  #define SDTL_OVERLAP	0x01
>  
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 05b6c2a..34dfec4
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -1556,7 +1556,7 @@ sd_init(struct sched_domain_topology_level *tl,
>  	sd_weight = cpumask_weight(tl->mask(cpu));
>  
>  	if (tl->sd_flags)
> -		sd_flags = (*tl->sd_flags)();
> +		sd_flags = (*tl->sd_flags)(tl->mask(cpu));
>  	if (WARN_ONCE(sd_flags & ~TOPOLOGY_SD_FLAGS,
>  			"wrong sd_flags in topology description\n"))
>  		sd_flags &= TOPOLOGY_SD_FLAGS;
> -- 
> 2.7.4
> 
> 
