Return-Path: <linuxppc-dev+bounces-3246-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 048CD9CDBC4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2024 10:43:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqXBq4qxBz2y8W;
	Fri, 15 Nov 2024 20:43:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731663795;
	cv=none; b=fpNrFt4S8oo8sA+7UDn+yp1egLT2hx810q8w3BC7yPty55Ni8u8zXXF8smt9Z+/tXvuYZSpauXbp3xVlgqoe5/2omVi6wqXUlzgnb9R/K3CrLvDSorqhNXRngX8MyXoUipDTopUd9ZDUkWzaWQdubE4w4X/hDOLpS+Ie7TpPyba32mX9SrC+VyCwceTIkL02tRYoapi6N22PNnoQ2XeqIYYOee9OMsawF5ktwgItPn7Zz/rnvqoTCAMvqPgznHR85TXy0qC2udWKNjbKuaO/H12gQu0hAgxStpfosGeiW51bddkllyIcSQnTdHn7z1avrAq9GaDkWV4K7zTlJoc8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731663795; c=relaxed/relaxed;
	bh=KRtzmlccasa7Hu/4D4OE6W+/y6D5y+JpS1Xr5TH/Puo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8Ac+Ui8hQE2sG6TyxCXphKKuMCvHlWI49NuCSPeeb+qp2M28T6eSFpb97dNzSkOkIp9qV1HRhXw2yZuaVXhMIoIN+woFbLczlx9aO6jrZ+feLC+91Xybm6+yVF/5rGM2DxKFJMj8SnUCzAAA9jfXoxCtT+OQXsYG0IyvbGcSHB1JxEKDLrxiOFHL5vCMwZouq3mEYXk9AzMbpQi/PqadjfU/FJMkE7BtEZ4Uk13dfmkz8cwiWtK+yI76mY4j6hsHBXit0oK0HcRzw5DgQ/3VdZ8jyDEOQGIZrqOVVg6RhUMYsFG44M1Nm9N+2sS1B5kz6iR3H01G9P6dj3U97WhMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=pierre.gondois@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=pierre.gondois@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqXBn65r2z2xy6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 20:43:11 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 034591476;
	Fri, 15 Nov 2024 01:43:09 -0800 (PST)
Received: from [10.34.125.21] (unknown [10.34.125.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 069423F66E;
	Fri, 15 Nov 2024 01:42:33 -0800 (PST)
Message-ID: <427bd639-33c3-47e4-9e83-68c428eb1a7d@arm.com>
Date: Fri, 15 Nov 2024 10:42:31 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
To: Yicong Yang <yangyicong@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org, dietmar.eggemann@arm.com, x86@kernel.org,
 bp@alien8.de, mingo@redhat.com, linux-arm-kernel@lists.infradead.org,
 mpe@ellerman.id.au, peterz@infradead.org, tglx@linutronix.de,
 sudeep.holla@arm.com, catalin.marinas@arm.com, will@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 xuwei5@huawei.com, guohanjun@huawei.com, dave.hansen@linux.intel.com
References: <20241114141127.23232-1-yangyicong@huawei.com>
 <20241114141127.23232-2-yangyicong@huawei.com>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <20241114141127.23232-2-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Yicong,


On 11/14/24 15:11, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Currently if architectures want to support HOTPLUG_SMT they need to
> provide a topology_is_primary_thread() telling the framework which
> thread in the SMT cannot offline. However arm64 doesn't have a
> restriction on which thread in the SMT cannot offline, a simplest
> choice is that just make 1st thread as the "primary" thread. So
> just make this as the default implementation in the framework and
> let architectures like x86 that have special primary thread to
> override this function (which they've already done).
> 
> There's no need to provide a stub function if !CONFIG_SMP or
> !CONFIG_HOTPLUG_SMP. In such case the testing CPU is already
> the 1st CPU in the SMT so it's always the primary thread.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   arch/powerpc/include/asm/topology.h |  1 +
>   arch/x86/include/asm/topology.h     |  2 +-
>   include/linux/topology.h            | 20 ++++++++++++++++++++
>   3 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index 16bacfe8c7a2..da15b5efe807 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -152,6 +152,7 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
>   {
>   	return cpu == cpu_first_thread_sibling(cpu);
>   }
> +#define topology_is_primary_thread topology_is_primary_thread
>   
>   static inline bool topology_smt_thread_allowed(unsigned int cpu)
>   {
> diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
> index 92f3664dd933..d84d9b6d8678 100644
> --- a/arch/x86/include/asm/topology.h
> +++ b/arch/x86/include/asm/topology.h
> @@ -219,11 +219,11 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
>   {
>   	return cpumask_test_cpu(cpu, cpu_primary_thread_mask);
>   }
> +#define topology_is_primary_thread topology_is_primary_thread
>   
>   #else /* CONFIG_SMP */
>   static inline int topology_phys_to_logical_pkg(unsigned int pkg) { return 0; }
>   static inline int topology_max_smt_threads(void) { return 1; }
> -static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
>   static inline unsigned int topology_amd_nodes_per_pkg(void) { return 1; }
>   #endif /* !CONFIG_SMP */
>   
> diff --git a/include/linux/topology.h b/include/linux/topology.h
> index 52f5850730b3..b8e860276518 100644
> --- a/include/linux/topology.h
> +++ b/include/linux/topology.h
> @@ -240,6 +240,26 @@ static inline const struct cpumask *cpu_smt_mask(int cpu)
>   }
>   #endif
>   
> +#ifndef topology_is_primary_thread
> +
> +#define topology_is_primary_thread topology_is_primary_thread
> +
> +static inline bool topology_is_primary_thread(unsigned int cpu)
> +{
> +	/*
> +	 * On SMT hotplug the primary thread of the SMT won't be disabled.
> +	 * Architectures do have a special primary thread (e.g. x86) need
> +	 * to override this function. Otherwise just make the first thread
> +	 * in the SMT as the primary thread.
> +	 *
> +	 * The sibling cpumask of an offline CPU contains always the CPU
> +	 * itself.

As Thomas suggested, would it be possible to check it for other
architectures ?
For instance for loongarch at arch/loongarch/kernel/smp.c,
clear_cpu_sibling_map() seems to completely clear &cpu_sibling_map[cpu]
when a CPU is put offline. This would make topology_sibling_cpumask(cpu)
to be empty and cpu_bootable() return false if the CPU never booted before.

Personal note:
cpu_bootable() is called from an already online CPU:
cpu_bootable (kernel/cpu.c:678)
cpu_up (kernel/cpu.c:1722 kernel/cpu.c:1702)
bringup_nonboot_cpus (kernel/cpu.c:1793 kernel/cpu.c:1901)
smp_init (./include/linux/bitmap.h:445 ./include/linux/nodemask.h:241 ./include/linux/nodemask.h:438 kernel/smp.c:1011)
kernel_init_freeable (init/main.c:1573)
kernel_init (init/main.c:1473)
ret_from_fork (arch/arm64/kernel/entry.S:861)

store_cpu_topology() for arm64 is called from the booting CPU:
store_cpu_topology (drivers/base/arch_topology.c:921)
secondary_start_kernel (arch/arm64/kernel/smp.c:251)
__secondary_switched (arch/arm64/kernel/head.S:418)

> +	 */
> +	return cpu == cpumask_first(topology_sibling_cpumask(cpu));
> +}
> +
> +#endif
> +
>   static inline const struct cpumask *cpu_cpu_mask(int cpu)
>   {
>   	return cpumask_of_node(cpu_to_node(cpu));

