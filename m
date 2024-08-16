Return-Path: <linuxppc-dev+bounces-144-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B2E9553E0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2024 01:44:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlz8y5Lqzz2ysv;
	Sat, 17 Aug 2024 09:44:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dietmar.eggemann@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlmmr0trzz2xXV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2024 01:55:55 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF51913D5;
	Fri, 16 Aug 2024 08:55:50 -0700 (PDT)
Received: from [192.168.181.244] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACE5A3F58B;
	Fri, 16 Aug 2024 08:55:20 -0700 (PDT)
Message-ID: <a7636c4b-f449-4018-a890-08412e3ec779@arm.com>
Date: Fri, 16 Aug 2024 17:55:18 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Subject: Re: [PATCH v5 2/4] arch_topology: Support SMT control for OF based
 system
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, sudeep.holla@arm.com, tglx@linutronix.de,
 peterz@infradead.org, mpe@ellerman.id.au,
 linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org,
 jonathan.cameron@huawei.com, prime.zeng@hisilicon.com, linuxarm@huawei.com,
 yangyicong@hisilicon.com, xuwei5@huawei.com, guohanjun@huawei.com
References: <20240806085320.63514-1-yangyicong@huawei.com>
 <20240806085320.63514-3-yangyicong@huawei.com>
Content-Language: en-US
In-Reply-To: <20240806085320.63514-3-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/08/2024 10:53, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> On building the topology from the devicetree, we've already
> gotten the SMT thread number of each core. Update the largest
> SMT thread number to enable the SMT control.

Do we have SMT Device Tree (DT) systems out there? But you right that DT
at least supports SMT.

> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/base/arch_topology.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 75fcb75d5515..95513abd664f 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -11,6 +11,7 @@
>  #include <linux/cleanup.h>
>  #include <linux/cpu.h>
>  #include <linux/cpufreq.h>
> +#include <linux/cpu_smt.h>
>  #include <linux/device.h>
>  #include <linux/of.h>
>  #include <linux/slab.h>
> @@ -531,6 +532,16 @@ static int __init get_cpu_for_node(struct device_node *node)
>  	return cpu;
>  }
>  
> +static void __init update_smt_num_threads(unsigned int num_threads)
> +{
> +	static unsigned int max_smt_thread_num = 1;
> +
> +	if (num_threads > max_smt_thread_num) {
> +		max_smt_thread_num = num_threads;
> +		cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> +	}

This could theoretically (unlikely though) call
cpu_smt_set_num_threads() multiple times (on heterogeneous systems with
different numbers of SMT threads).
> +}
> +
>  static int __init parse_core(struct device_node *core, int package_id,
>  			     int cluster_id, int core_id)
>  {
> @@ -561,6 +572,8 @@ static int __init parse_core(struct device_node *core, int package_id,
>  		i++;
>  	} while (1);
>  
> +	update_smt_num_threads(i);
> +
>  	cpu = get_cpu_for_node(core);
>  	if (cpu >= 0) {
>  		if (!leaf) {

Why not simply do this:

-->8--

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 75fcb75d5515..806537419715 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -30,6 +30,7 @@ static struct cpumask scale_freq_counters_mask;
 static bool scale_freq_invariant;
 DEFINE_PER_CPU(unsigned long, capacity_freq_ref) = 1;
 EXPORT_PER_CPU_SYMBOL_GPL(capacity_freq_ref);
+static unsigned int max_smt_thread_num = 1;
 
 static bool supports_scale_freq_counters(const struct cpumask *cpus)
 {
@@ -577,6 +578,9 @@ static int __init parse_core(struct device_node *core, int package_id,
 		return -EINVAL;
 	}
 
+	if (max_smt_thread_num < i)
+		max_smt_thread_num = i;
+
 	return 0;
 }
 
@@ -673,6 +677,9 @@ static int __init parse_socket(struct device_node *socket)
 	if (!has_socket)
 		ret = parse_cluster(socket, 0, -1, 0);
 
+	if (max_smt_thread_num > 1)
+		cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
+
 	return ret;
 }


