Return-Path: <linuxppc-dev+bounces-4352-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9777E9F8D84
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2024 08:59:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YF0F51n90z30Vf;
	Fri, 20 Dec 2024 18:59:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.32
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734681577;
	cv=none; b=PQDFTmSRc3wNf7a163Y1h56+xcUIZEISR4b6fZPEvJkwifVGgVXix10grHrYI13P5L1EVQlcGBoCyEDsgscVbB/Bw8cDWWv4Fo5iroY9Eu+R2LaGOjZzopIlTbXl9hJbVaV2MVL1JysbHxR1RySF6jO5q3ygf0g7OfVV/y4HMmdmiO74TmRNlt7WNLcx6+O/8702oCQFdzPw9DRdig65cB6cbv0KyFbYMuHJilx1ZZB/9aW+EFTIsMw0i4IDyJuoE4tCWjvslcXUta4IOar7Zu8J9s6x6qLzDGbPcpkKcgzl/fmPFRo8p5GiZrQcWgl4aiNOTqz+Xc1WHKZ36OMkhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734681577; c=relaxed/relaxed;
	bh=zy8imzueMQw99ZQ7lwqk6XBywRy7MiuJd+4SAPvvk+U=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ZuJYxRWZ7V6px8UwAJY8Pzq5e9e4PSTbxZyZfjmoNoLKs5hpqBZD0Zy/m2NB8ExmIpBkmx4u1OjfzFFyu7EC0IsMyOI7HLwb5dXBllvunUkIJu7FGV3jk069Za43jWrXM16171UnMMznFa/sGJ/8R1LzASLTsn94aOpENUAR6MsqbLU6h8BWA33GAc8O8ZYxzifmVydaVDhyWTFSQQFfZTIxqQ9xhSQRK1wV8pBuz+AYB3PnODXJSRhF2WBCNgFxrDRfuHA8Z2rmpSHyCyZq6jlFMS/gxBNQuaw2zuV85bk2zwFuddGz3ReWacLoXFumsyGOGPkcJSxNm5XufI0iug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YF0F34Yf8z2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2024 18:59:35 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4YF0FJ0B79z20lsc;
	Fri, 20 Dec 2024 15:59:48 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 2D7171401E0;
	Fri, 20 Dec 2024 15:59:29 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 20 Dec 2024 15:59:28 +0800
CC: <yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>
Subject: Re: [PATCH v10 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
To: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>
References: <20241220075313.51502-1-yangyicong@huawei.com>
 <20241220075313.51502-2-yangyicong@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <a5690fee-3019-f26c-8bad-1d95e388e877@huawei.com>
Date: Fri, 20 Dec 2024 15:59:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
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
In-Reply-To: <20241220075313.51502-2-yangyicong@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-4.9 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024/12/20 15:53, Yicong Yang wrote:
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
> As questioned in v9 [1] whether this works on architectures not using
> CONFIG_GENERIC_ARCH_TOPOLOGY, hacked on LoongArch VM and this also works.
> Architectures should use this on their own situation.
> [1] https://lore.kernel.org/linux-arm-kernel/427bd639-33c3-47e4-9e83-68c428eb1a7d@arm.com/
> 
> [root@localhost smt]# uname -m
> loongarch64
> [root@localhost smt]# pwd
> /sys/devices/system/cpu/smt
> [root@localhost smt]# cat ../possible 
> 0-3
> [root@localhost smt]# cat ../online 
> 0-3
> [root@localhost smt]# cat control 
> on
> [root@localhost smt]# echo off > control 
> [root@localhost smt]# cat control 
> off
> [root@localhost smt]# cat ../online 
> 0,2
> [root@localhost smt]# echo on > control 
> [root@localhost smt]# cat control 
> on
> [root@localhost smt]# cat ../online 
> 0-3

Tested with below code using the topology_is_primary_thread() introduced
in this patch. Tested on an ACPI-based QEMU VM emulating SMT2.

Subject: [PATCH] LoongArch: Support HOTPLUG_SMT on ACPI-based system

Support HOTPLUG_SMT on ACPI-based system using generic
topology_is_primary_thread().

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/loongarch/Kconfig       |  1 +
 arch/loongarch/kernel/acpi.c | 26 ++++++++++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index dae3a9104ca6..bed1b0640b97 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -172,6 +172,7 @@ config LOONGARCH
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_TIF_NOHZ
 	select HAVE_VIRT_CPU_ACCOUNTING_GEN if !SMP
+	select HOTPLUG_SMT if HOTPLUG_CPU
 	select IRQ_FORCED_THREADING
 	select IRQ_LOONGARCH_CPU
 	select LOCK_MM_AND_FIND_VMA
diff --git a/arch/loongarch/kernel/acpi.c b/arch/loongarch/kernel/acpi.c
index 382a09a7152c..e642b0de57e7 100644
--- a/arch/loongarch/kernel/acpi.c
+++ b/arch/loongarch/kernel/acpi.c
@@ -15,9 +15,11 @@
 #include <linux/memblock.h>
 #include <linux/of_fdt.h>
 #include <linux/serial_core.h>
+#include <linux/xarray.h>
 #include <asm/io.h>
 #include <asm/numa.h>
 #include <asm/loongson.h>
+#include <linux/cpu_smt.h>

 int acpi_disabled;
 EXPORT_SYMBOL(acpi_disabled);
@@ -175,8 +177,12 @@ int pptt_enabled;

 int __init parse_acpi_topology(void)
 {
+	int thread_num, max_smt_thread_num = 1;
+	struct xarray core_threads;
 	int cpu, topology_id;
+	void *entry;

+	xa_init(&core_threads);
 	for_each_possible_cpu(cpu) {
 		topology_id = find_acpi_cpu_topology(cpu, 0);
 		if (topology_id < 0) {
@@ -184,19 +190,35 @@ int __init parse_acpi_topology(void)
 			return -ENOENT;
 		}

-		if (acpi_pptt_cpu_is_thread(cpu) <= 0)
+		if (acpi_pptt_cpu_is_thread(cpu) <= 0) {
 			cpu_data[cpu].core = topology_id;
-		else {
+		} else {
 			topology_id = find_acpi_cpu_topology(cpu, 1);
 			if (topology_id < 0)
 				return -ENOENT;

 			cpu_data[cpu].core = topology_id;
+
+			entry = xa_load(&core_threads, topology_id);
+			if (!entry) {
+				xa_store(&core_threads, topology_id,
+					 xa_mk_value(1), GFP_KERNEL);
+			} else {
+				thread_num = xa_to_value(entry);
+				thread_num++;
+				xa_store(&core_threads, topology_id,
+					 xa_mk_value(thread_num), GFP_KERNEL);
+
+				if (thread_num > max_smt_thread_num)
+					max_smt_thread_num = thread_num;
+			}
 		}
 	}

 	pptt_enabled = 1;

+	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
+	xa_destroy(&core_threads);
 	return 0;
 }

-- 
2.24.0

> 
>  arch/powerpc/include/asm/topology.h |  1 +
>  arch/x86/include/asm/topology.h     |  2 +-
>  include/linux/topology.h            | 22 ++++++++++++++++++++++
>  3 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index 16bacfe8c7a2..da15b5efe807 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -152,6 +152,7 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
>  {
>  	return cpu == cpu_first_thread_sibling(cpu);
>  }
> +#define topology_is_primary_thread topology_is_primary_thread
>  
>  static inline bool topology_smt_thread_allowed(unsigned int cpu)
>  {
> diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
> index fd41103ad342..faa0d6334ea4 100644
> --- a/arch/x86/include/asm/topology.h
> +++ b/arch/x86/include/asm/topology.h
> @@ -228,11 +228,11 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
>  {
>  	return cpumask_test_cpu(cpu, cpu_primary_thread_mask);
>  }
> +#define topology_is_primary_thread topology_is_primary_thread
>  
>  #else /* CONFIG_SMP */
>  static inline int topology_phys_to_logical_pkg(unsigned int pkg) { return 0; }
>  static inline int topology_max_smt_threads(void) { return 1; }
> -static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
>  static inline unsigned int topology_amd_nodes_per_pkg(void) { return 1; }
>  #endif /* !CONFIG_SMP */
>  
> diff --git a/include/linux/topology.h b/include/linux/topology.h
> index 52f5850730b3..b3aba443c4eb 100644
> --- a/include/linux/topology.h
> +++ b/include/linux/topology.h
> @@ -240,6 +240,28 @@ static inline const struct cpumask *cpu_smt_mask(int cpu)
>  }
>  #endif
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
> +	 * itself for architectures using CONFIG_GENERIC_ARCH_TOPOLOGY.
> +	 * Other architectures should use this depend on their own
> +	 * situation.
> +	 */
> +	return cpu == cpumask_first(topology_sibling_cpumask(cpu));
> +}
> +
> +#endif
> +
>  static inline const struct cpumask *cpu_cpu_mask(int cpu)
>  {
>  	return cpumask_of_node(cpu_to_node(cpu));
> 

