Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D53E01136DA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 22:01:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SrrB75K6zDqXN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 08:01:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=longman@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="VXwX9tr9"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Srp60pvgzDqHk
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2019 07:59:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575493192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jwsdQzLOyiy3Sa9kIs51/MzgDwiwocFZTh5jU6lhYh0=;
 b=VXwX9tr9do9P+bCIGfh3ZDC2hXDCU9aLXNPD9BHXCuF5HpzZoAOWjRU4l7C6bsNQBFxrBY
 6kyEHpN7tIYoEZwplhxwLu0E+zTbIUt1O+jllQMpZiAy51ny50x9CG7tJc7uxngWDBmeN2
 F6HUnsRILnihSzz+RrJmLQyyykDQekg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-ngIZdU_aOmeCkbp_L9jwpg-1; Wed, 04 Dec 2019 11:58:19 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 113D4800D5C;
 Wed,  4 Dec 2019 16:58:18 +0000 (UTC)
Received: from llong.remote.csb (ovpn-121-11.rdu2.redhat.com [10.10.121.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04D1A6106D;
 Wed,  4 Dec 2019 16:58:14 +0000 (UTC)
Subject: Re: [PATCH 1/2] powerpc/vcpu: Assume dedicated processors as
 non-preempt
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20191204134459.22470-1-srikar@linux.vnet.ibm.com>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <319b167f-f400-31a2-5c7f-5cb8cd3cbb52@redhat.com>
Date: Wed, 4 Dec 2019 11:58:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20191204134459.22470-1-srikar@linux.vnet.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: ngIZdU_aOmeCkbp_L9jwpg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Parth Shah <parth@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/4/19 8:44 AM, Srikar Dronamraju wrote:
> With commit 247f2f6f3c70 ("sched/core: Don't schedule threads on pre-empted
> vCPUs"), scheduler avoids preempted vCPUs to schedule tasks on wakeup.
> This leads to wrong choice of CPU, which in-turn leads to larger wakeup
> latencies. Eventually, it leads to performance regression in latency
> sensitive benchmarks like soltp, schbench etc.
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

The patch looks good to me.

Just a minor nit. According to the Kconfig file, PPC_SPLPAR depends on
PPC_PSERIES. IOW, when PPC_SPLPAR is defined, PPC_PSERIES must have been
defined. So you can probably drop CONFIG_PPC_PSERIES. The same is true
for patch 2.

Acked-by: Waiman Long <longman@redhat.com>

