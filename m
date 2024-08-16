Return-Path: <linuxppc-dev+bounces-145-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B33889553E1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2024 01:44:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlz984Sq8z2ytd;
	Sat, 17 Aug 2024 09:44:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dietmar.eggemann@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlmn12HVGz2xXV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2024 01:56:05 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4609B143D;
	Fri, 16 Aug 2024 08:56:00 -0700 (PDT)
Received: from [192.168.181.244] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 218603F58B;
	Fri, 16 Aug 2024 08:55:29 -0700 (PDT)
Message-ID: <ec8c46f2-d819-43d7-a866-d272169178d3@arm.com>
Date: Fri, 16 Aug 2024 17:55:29 +0200
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
Subject: Re: [PATCH v5 3/4] arm64: topology: Support SMT control on ACPI based
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
 <20240806085320.63514-4-yangyicong@huawei.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <20240806085320.63514-4-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/08/2024 10:53, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> For ACPI we'll build the topology from PPTT and we cannot directly
> get the SMT number of each core. Instead using a temporary xarray
> to record the SMT number of each core when building the topology
> and we can know the largest SMT number in the system. Then we can
> enable the support of SMT control.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  arch/arm64/kernel/topology.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 1a2c72f3e7f8..f72e1e55b05e 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -15,8 +15,10 @@
>  #include <linux/arch_topology.h>
>  #include <linux/cacheinfo.h>
>  #include <linux/cpufreq.h>
> +#include <linux/cpu_smt.h>
>  #include <linux/init.h>
>  #include <linux/percpu.h>
> +#include <linux/xarray.h>
>  
>  #include <asm/cpu.h>
>  #include <asm/cputype.h>
> @@ -43,11 +45,16 @@ static bool __init acpi_cpu_is_threaded(int cpu)
>   */
>  int __init parse_acpi_topology(void)
>  {
> +	int thread_num, max_smt_thread_num = 1;
> +	struct xarray core_threads;
>  	int cpu, topology_id;
> +	void *entry;
>  
>  	if (acpi_disabled)
>  		return 0;
>  
> +	xa_init(&core_threads);
> +
>  	for_each_possible_cpu(cpu) {
>  		topology_id = find_acpi_cpu_topology(cpu, 0);
>  		if (topology_id < 0)
> @@ -57,6 +64,20 @@ int __init parse_acpi_topology(void)
>  			cpu_topology[cpu].thread_id = topology_id;
>  			topology_id = find_acpi_cpu_topology(cpu, 1);
>  			cpu_topology[cpu].core_id   = topology_id;
> +
> +			entry = xa_load(&core_threads, topology_id);
> +			if (!entry) {
> +				xa_store(&core_threads, topology_id,
> +					 xa_mk_value(1), GFP_KERNEL);
> +			} else {
> +				thread_num = xa_to_value(entry);
> +				thread_num++;
> +				xa_store(&core_threads, topology_id,
> +					 xa_mk_value(thread_num), GFP_KERNEL);
> +
> +				if (thread_num > max_smt_thread_num)
> +					max_smt_thread_num = thread_num;
> +			}

So the xarray contains one element for each core_id with the information
how often the core_id occurs? I assume you have to iterate over all
possible CPUs since you don't know which logical CPUs belong to the same
core_id.

>  		} else {
>  			cpu_topology[cpu].thread_id  = -1;
>  			cpu_topology[cpu].core_id    = topology_id;
> @@ -67,6 +88,9 @@ int __init parse_acpi_topology(void)
>  		cpu_topology[cpu].package_id = topology_id;
>  	}
>  
> +	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> +
> +	xa_destroy(&core_threads);
>  	return 0;
>  }
>  #endif

Tested on ThunderX2:

$ cat /proc/schedstat | head -6 | tail -4 | awk '{ print $1, $2 }'
cpu0 0
domain0 00000000,00000000,00000000,00000000,00000001,00000001,00000001,00000001
                                                   ^        ^        ^        ^
domain1 00000000,00000000,00000000,00000000,ffffffff,ffffffff,ffffffff,ffffffff
domain2 ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff

detecting 'max_smt_thread_num = 4' correctly.

