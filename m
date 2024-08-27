Return-Path: <linuxppc-dev+bounces-623-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E48961A11
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 00:39:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtjCL3dMkz2xtN;
	Wed, 28 Aug 2024 08:39:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724773291;
	cv=none; b=Prfeep58U1fsDU2LG+Ne4bi1cT33lmAoa5pDKxp7FUbgpAYh00E1n5CAtdGk9OO/HrWDL8+BfflY+ynrixeg4BZM5W5Isq2+1rU3lsOt0KMkDRzxTDPrstOEv1oLgxbJFzG8mduT2O4RU7g/AUNAHsKxOCNhRWY4bL9azvzwCSQnNZhYt41f8+c6EGtWyWslOVGMcVKByCkGF1yO2hgXFxjxuozgi16F/4ZZkc3l6GWJAs4urQFeUZ55Q5MVN6UY09Ap6FmdEO/CBbFjxFrCVqopCQGq/B/iwMwMgposC/+yq7wVNlKlUZ9SqM6s5d7q8kRmMm7/tQtyMnmUW+Y/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724773291; c=relaxed/relaxed;
	bh=1IRJgYcRKC7M8qAJVr9HlBXHBfkmklV4uNdlPn4gP5Y=;
	h=Received:Received:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=cvd84Q8M3VIqk17DP2RQlcnXyKWMCs2cESNeIXRp9/Up9ty5/Vg22QryWXZlCa49FgZQ/xlA+xEBL1JEwoF/g+wyP/kjdXK1JQ8iddDUABirX8yDqHvfpxrMcEW/5CNSEddxbRhoKJ7ZSHbdoiXohvl7+eISCZDpXowKSDDz3C+zvFzTRcZIeGNFTA9iF7vlgLoXgvBrtWHLehSXMaB7uysZjy4hfphD1dFc6EGznA2qM8h5rXa/5n9370aOBSFRxuMXm1ftFGkEq7RiGMnIhGngy/WSK82Xtwpj1g+nwU8uZsbHQzbj/11ELHivnVaDow23Vwxf7a/r8gzZKC6Z3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=pierre.gondois@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=pierre.gondois@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtWx70VYZz2xX4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 01:41:30 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4C2811FB;
	Tue, 27 Aug 2024 08:41:25 -0700 (PDT)
Received: from [10.34.129.45] (e126645.nice.arm.com [10.34.129.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E41763F762;
	Tue, 27 Aug 2024 08:40:54 -0700 (PDT)
Message-ID: <a998c723-7451-439a-9c88-7c8b5c1b890b@arm.com>
Date: Tue, 27 Aug 2024 17:40:54 +0200
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
From: Pierre Gondois <pierre.gondois@arm.com>
Subject: Re: [PATCH v5 3/4] arm64: topology: Support SMT control on ACPI based
 system
To: Yicong Yang <yangyicong@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org, bp@alien8.de, dave.hansen@linux.intel.com,
 mingo@redhat.com, linux-arm-kernel@lists.infradead.org, mpe@ellerman.id.au,
 peterz@infradead.org, tglx@linutronix.de, sudeep.holla@arm.com,
 will@kernel.org, catalin.marinas@arm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 xuwei5@huawei.com, guohanjun@huawei.com
References: <20240806085320.63514-1-yangyicong@huawei.com>
 <20240806085320.63514-4-yangyicong@huawei.com>
Content-Language: en-US
In-Reply-To: <20240806085320.63514-4-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Yicong,
IIUC we are looking for the maximum number of threads a CPU can have
in the platform. But is is actually possible to have a platform with
CPUs not having the same number of threads ?

For instance kernel/cpu.c::cpu_smt_num_threads_valid() will check
that the number of threads is either 1 or cpu_smt_max_threads (as
CONFIG_SMT_NUM_THREADS_DYNAMIC is not enabled for arm64). However
a (hypothetical) platform with:
- CPU0: 2 threads
- CPU1: 4 threads
should not be able to set the number of threads to 2, as
1 < 2 < cpu_smt_max_threads (cf. cpu_smt_num_threads_valid()).

So if there is an assumption that all the CPUs have the same number of
threads, it should be sufficient to count the number of threads for one
CPU right ?

In the other (unlikely) case (i.e. CPUs can have various number of threads),
I think we should either:
- use your method and check that all the CPUs have the same number of threads
- get the number of threads for one CPU and check that all the CPUs are
    identical using the ACPI_PPTT_ACPI_IDENTICAL tag
- have a per-cpu cpu_smt_max_threads value ?

Same comment for the DT patch. If there is an assumption that all CPUs have
the same number of threads, then update_smt_num_threads() could only be called
once I suppose,

Regards,
Pierre


On 8/6/24 10:53, Yicong Yang wrote:
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
>   arch/arm64/kernel/topology.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 1a2c72f3e7f8..f72e1e55b05e 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -15,8 +15,10 @@
>   #include <linux/arch_topology.h>
>   #include <linux/cacheinfo.h>
>   #include <linux/cpufreq.h>
> +#include <linux/cpu_smt.h>
>   #include <linux/init.h>
>   #include <linux/percpu.h>
> +#include <linux/xarray.h>
>   
>   #include <asm/cpu.h>
>   #include <asm/cputype.h>
> @@ -43,11 +45,16 @@ static bool __init acpi_cpu_is_threaded(int cpu)
>    */
>   int __init parse_acpi_topology(void)
>   {
> +	int thread_num, max_smt_thread_num = 1;
> +	struct xarray core_threads;
>   	int cpu, topology_id;
> +	void *entry;
>   
>   	if (acpi_disabled)
>   		return 0;
>   
> +	xa_init(&core_threads);
> +
>   	for_each_possible_cpu(cpu) {
>   		topology_id = find_acpi_cpu_topology(cpu, 0);
>   		if (topology_id < 0)
> @@ -57,6 +64,20 @@ int __init parse_acpi_topology(void)
>   			cpu_topology[cpu].thread_id = topology_id;
>   			topology_id = find_acpi_cpu_topology(cpu, 1);
>   			cpu_topology[cpu].core_id   = topology_id;
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
>   		} else {
>   			cpu_topology[cpu].thread_id  = -1;
>   			cpu_topology[cpu].core_id    = topology_id;
> @@ -67,6 +88,9 @@ int __init parse_acpi_topology(void)
>   		cpu_topology[cpu].package_id = topology_id;
>   	}
>   
> +	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> +
> +	xa_destroy(&core_threads);
>   	return 0;
>   }
>   #endif

