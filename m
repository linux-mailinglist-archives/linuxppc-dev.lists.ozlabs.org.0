Return-Path: <linuxppc-dev+bounces-745-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBC3964514
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 14:46:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvgym692wz2ysf;
	Thu, 29 Aug 2024 22:46:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724935616;
	cv=none; b=WOOw6I4rpAft6R9NMWzgF9eNDWht0Y7lILwxkbWkx0QA49aYV6E9gGQTRElOltNaOF7clGXKrBN3gmgvOQGY+LZXEA7yrY6qdVS3UwBFPDgZYy/jSi01qSufyZgruKGtEwxkk4EjeceN0OPe/6gVGueT9PxTiRu/vongAo6uFWqp1Xe/VVvMdJu2r2IOdIukynrt5rdhaSlXoNvxy+eH69wsDV3VtPf4faVCE4OyCPXsGsB5rMxp+pYhDGogYz7vAXphZRsBIENUaeo280Vx7zM03BRCoD9NtioTlxbA1f3EZRct6uFOPhloubvpyp/X7VRRz4YZSDeTlKF6owM/1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724935616; c=relaxed/relaxed;
	bh=3jkdgluFO+Z67H/ub1WPkjOEROtpsVkJuavRf2JwTwQ=;
	h=Received:Received:Content-Type:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To; b=jvgVnVJviK6xYcDj/vETmRoS0Cz8hdITS0/UosjBD7Tynj5mlaBUBAjrkuCkfnRAZqjFI51bRLHSMr35xZihTICY9XwRUIE93q0h0BEPxKgGq9xxPnPZkqUFB31QlLR9tPazf70/TUuO+qy3zhVOdYE/9fOp34U+ucKfteCvp8DB2mszznvVCzAsNfE5Yt0NadFAwion7FX/XTyGdttUVaT9W9uB9K3o3ZG4zdVYkyCCrIya85kiQdJHSeTWCsRnm6+BxUdREX0yrbXPXqspWOXi+/S0ImbSY4tOYMBPnmrZb3NuLAWYK/3zqwue+ZN+fPgER7/3Dq7vK1U5YlRT2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=pierre.gondois@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=pierre.gondois@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvgym3CQWz2yNB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 22:46:55 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52795DA7;
	Thu, 29 Aug 2024 05:46:51 -0700 (PDT)
Received: from [10.34.111.171] (e126645.nice.Arm.com [10.34.111.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62CD33F762;
	Thu, 29 Aug 2024 05:46:20 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------OlcT09OcROCozw2vbYxirgsk"
Message-ID: <3947cb79-3199-4cd6-b784-51a245084581@arm.com>
Date: Thu, 29 Aug 2024 14:46:09 +0200
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
To: Yicong Yang <yangyicong@huawei.com>
Cc: yangyicong@hisilicon.com, linuxppc-dev@lists.ozlabs.org, bp@alien8.de,
 dave.hansen@linux.intel.com, mingo@redhat.com,
 linux-arm-kernel@lists.infradead.org, mpe@ellerman.id.au,
 peterz@infradead.org, tglx@linutronix.de, sudeep.holla@arm.com,
 will@kernel.org, catalin.marinas@arm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, xuwei5@huawei.com,
 guohanjun@huawei.com
References: <20240806085320.63514-1-yangyicong@huawei.com>
 <20240806085320.63514-4-yangyicong@huawei.com>
 <a998c723-7451-439a-9c88-7c8b5c1b890b@arm.com>
 <00e6110a-462a-c117-0292-e88b57d27a05@huawei.com>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <00e6110a-462a-c117-0292-e88b57d27a05@huawei.com>

This is a multi-part message in MIME format.
--------------OlcT09OcROCozw2vbYxirgsk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Yicong,

On 8/29/24 09:40, Yicong Yang wrote:
> Hi Pierre,
> 
> On 2024/8/27 23:40, Pierre Gondois wrote:
>> Hello Yicong,
>> IIUC we are looking for the maximum number of threads a CPU can have
>> in the platform. But is is actually possible to have a platform with
>> CPUs not having the same number of threads ?
>>
> 
> I was thinking of the heterogenous platforms, for example part of the
> cores have SMT and others don't (I don't have any though, but there
> should be some such platforms for arm64).
> 
>> For instance kernel/cpu.c::cpu_smt_num_threads_valid() will check
>> that the number of threads is either 1 or cpu_smt_max_threads (as
>> CONFIG_SMT_NUM_THREADS_DYNAMIC is not enabled for arm64). However
>> a (hypothetical) platform with:
>> - CPU0: 2 threads
>> - CPU1: 4 threads
>> should not be able to set the number of threads to 2, as
>> 1 < 2 < cpu_smt_max_threads (cf. cpu_smt_num_threads_valid()).
>>
> 
> It's a bit more complex. If we enable/disable the SMT using on/off control
> then we won't have this problem. We'll online all the CPUs on enabling and
> offline CPUs which is not primary thread and don't care about the thread
> number of each core.
> 
> Control using thread number is introduced by CONFIG_SMT_NUM_THREADS_DYNAMIC
> and only enabled on powerpc. I think this interface is not enough to handle
> the hypothetical we assumed, since it assumes the homogenous platform that
> all the CPUs have the same thread number. But this should be fine for
> the platforms with SMT(with same thread number) and non-SMT cores, since it do
> indicates the real thread number of the SMT cores.
> 
>> So if there is an assumption that all the CPUs have the same number of
>> threads, it should be sufficient to count the number of threads for one
>> CPU right ?
>>
> 
> Naturally and conveniently I may think use of the threads number of CPU0 (boot
> cpu) in such a solution. But this will be wrong if CPU0 is non-SMT on a heterogenous
> platform :(
> 
>> In the other (unlikely) case (i.e. CPUs can have various number of threads),
>> I think we should either:
>> - use your method and check that all the CPUs have the same number of threads
>> - get the number of threads for one CPU and check that all the CPUs are
>>     identical using the ACPI_PPTT_ACPI_IDENTICAL tag
> 
> I think this won't be simpler since we still need to iterate all the CPUs to see
> if they have the same hetero_id (checked how we're using this ACPI tag in
> arm_acpi_register_pmu_device()). We could already know if they're identical by
> comparing the thread number and do the update if necessary.
> 
>> - have a per-cpu cpu_smt_max_threads value ?
> 
> This should be unnecessary in currently stage if there's no platforms
> with several kind cores have different thread number like in your assumption
> and enable CONFIG_SMT_NUM_THREADS_DYNAMIC on such platforms. Otherwise using
> a global cpu_smt_max_threads to enable the SMT control should be enough.
> Does it make sense?

Yes, I agree with all the things you said:
- the current smt/control interface cannot handle asymmetric SMT platforms
- I am not aware if such platform exist so far

I think it would still be good to check all the CPUs have the same number of
threads. I tried to enable the SMT_NUM_THREADS_DYNAMIC Kconfig with the
patch attached (and to check CPUs have the same number of threads). Feel free
to take what you like/ignore what is inside the attached patch, or let me know
if I should submit a part in a separate patchset,

----------------------------

     [RFC] arm64: topology: Enable CONFIG_SMT_NUM_THREADS_DYNAMIC
     
     - On arm64 ACPI systems, change the thread_id assignment to have
       increasing values starting from 0. This is already the case for DT
       based systems. Doing so allows to uniformly identify the n-th
       thread of a given CPU.
     - Check that all CPUs have the same number of threads (for DT/ACPI)
     - Enable CONFIG_SMT_NUM_THREADS_DYNAMIC
     
     On a Tx2, with 256 CPUs, threads siblings being 0,32,64,96
     for socket0 and 128 + (0,32,64,96) for socket1:
     $ cd /sys/devices/system/cpu/smt/
     $ cat ../online
     0-255
     $ echo 2 > control
     $ cat ../online
     0-63,128-191
     $ echo 3 > control
     $ cat ../online
     0-95,128-223
     $ echo on > control
     $ cat ../online
     0-255

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index bd3bc2f5e0ec..1d8521483065 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -239,6 +239,7 @@ config ARM64
         select HAVE_GENERIC_VDSO
         select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
         select HOTPLUG_SMT if (SMP && HOTPLUG_CPU)
+       select SMT_NUM_THREADS_DYNAMIC if HOTPLUG_SMT
         select IRQ_DOMAIN
         select IRQ_FORCED_THREADING
         select KASAN_VMALLOC if KASAN
diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
index 0f6ef432fb84..7dd211f81687 100644
--- a/arch/arm64/include/asm/topology.h
+++ b/arch/arm64/include/asm/topology.h
@@ -39,6 +39,14 @@ void update_freq_counters_refs(void);
  #define arch_scale_hw_pressure topology_get_hw_pressure
  #define arch_update_hw_pressure        topology_update_hw_pressure
  
+#ifdef CONFIG_SMT_NUM_THREADS_DYNAMIC
+#include <linux/cpu_smt.h>
+static inline bool topology_smt_thread_allowed(unsigned int cpu)
+{
+       return topology_thread_id(cpu) < cpu_smt_num_threads;
+}
+#endif
+
  #include <asm-generic/topology.h>
  
  #endif /* _ASM_ARM_TOPOLOGY_H */
diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index f72e1e55b05e..a83babe19972 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -47,7 +47,9 @@ int __init parse_acpi_topology(void)
  {
         int thread_num, max_smt_thread_num = 1;
         struct xarray core_threads;
+       bool have_thread = false;
         int cpu, topology_id;
+       unsigned long i;
         void *entry;
  
         if (acpi_disabled)
@@ -61,6 +63,8 @@ int __init parse_acpi_topology(void)
                         return topology_id;
  
                 if (acpi_cpu_is_threaded(cpu)) {
+                       have_thread = true;
+
                         cpu_topology[cpu].thread_id = topology_id;
                         topology_id = find_acpi_cpu_topology(cpu, 1);
                         cpu_topology[cpu].core_id   = topology_id;
@@ -69,9 +73,10 @@ int __init parse_acpi_topology(void)
                         if (!entry) {
                                 xa_store(&core_threads, topology_id,
                                          xa_mk_value(1), GFP_KERNEL);
+                               cpu_topology[cpu].thread_id = 0;
                         } else {
                                 thread_num = xa_to_value(entry);
-                               thread_num++;
+                               cpu_topology[cpu].thread_id = thread_num++;
                                 xa_store(&core_threads, topology_id,
                                          xa_mk_value(thread_num), GFP_KERNEL);
  
@@ -86,8 +91,17 @@ int __init parse_acpi_topology(void)
                 cpu_topology[cpu].cluster_id = topology_id;
                 topology_id = find_acpi_cpu_topology_package(cpu);
                 cpu_topology[cpu].package_id = topology_id;
+
+               pr_debug("CPU%u: package=0x%x cluster=0x%x core=0x%x thread=0x%x\n",
+                       cpu, cpu_topology[cpu].package_id, cpu_topology[cpu].cluster_id,
+                       cpu_topology[cpu].core_id, cpu_topology[cpu].thread_id);
         }
  
+       if (have_thread)
+               xa_for_each(&core_threads, i, entry)
+                       if (xa_to_value(entry) != max_smt_thread_num)
+                               pr_warn("Heterogeneous SMT topology not handled");
+
         cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
  
         xa_destroy(&core_threads);
diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 95513abd664f..20d7f5b72ddd 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -532,13 +532,15 @@ static int __init get_cpu_for_node(struct device_node *node)
         return cpu;
  }
  
-static void __init update_smt_num_threads(unsigned int num_threads)
+static void __init update_smt_num_threads(int num_threads)
  {
-       static unsigned int max_smt_thread_num = 1;
+       static int max_smt_thread_num = -1;
  
-       if (num_threads > max_smt_thread_num) {
+       if (max_smt_thread_num < 0) {
                 max_smt_thread_num = num_threads;
                 cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
+       } else if (num_threads != max_smt_thread_num) {
+               pr_warn("Heterogeneous SMT topology not handled");
         }
  }
  
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index b721f360d759..afdfdc64a0a1 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -87,6 +87,7 @@ extern struct cpu_topology cpu_topology[NR_CPUS];
  #define topology_physical_package_id(cpu)      (cpu_topology[cpu].package_id)
  #define topology_cluster_id(cpu)       (cpu_topology[cpu].cluster_id)
  #define topology_core_id(cpu)          (cpu_topology[cpu].core_id)
+#define topology_thread_id(cpu)                (cpu_topology[cpu].thread_id)
  #define topology_core_cpumask(cpu)     (&cpu_topology[cpu].core_sibling)
  #define topology_sibling_cpumask(cpu)  (&cpu_topology[cpu].thread_sibling)
  #define topology_cluster_cpumask(cpu)  (&cpu_topology[cpu].cluster_sibling)

----------------------------


Regards,
Pierre

> 
> Thanks,
> Yicong
> 
>>
>> Same comment for the DT patch. If there is an assumption that all CPUs have
>> the same number of threads, then update_smt_num_threads() could only be called
>> once I suppose,
>>
>> Regards,
>> Pierre
>>
>>
>> On 8/6/24 10:53, Yicong Yang wrote:
>>> From: Yicong Yang <yangyicong@hisilicon.com>
>>>
>>> For ACPI we'll build the topology from PPTT and we cannot directly
>>> get the SMT number of each core. Instead using a temporary xarray
>>> to record the SMT number of each core when building the topology
>>> and we can know the largest SMT number in the system. Then we can
>>> enable the support of SMT control.
>>>
>>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>>> ---
>>>    arch/arm64/kernel/topology.c | 24 ++++++++++++++++++++++++
>>>    1 file changed, 24 insertions(+)
>>>
>>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>>> index 1a2c72f3e7f8..f72e1e55b05e 100644
>>> --- a/arch/arm64/kernel/topology.c
>>> +++ b/arch/arm64/kernel/topology.c
>>> @@ -15,8 +15,10 @@
>>>    #include <linux/arch_topology.h>
>>>    #include <linux/cacheinfo.h>
>>>    #include <linux/cpufreq.h>
>>> +#include <linux/cpu_smt.h>
>>>    #include <linux/init.h>
>>>    #include <linux/percpu.h>
>>> +#include <linux/xarray.h>
>>>      #include <asm/cpu.h>
>>>    #include <asm/cputype.h>
>>> @@ -43,11 +45,16 @@ static bool __init acpi_cpu_is_threaded(int cpu)
>>>     */
>>>    int __init parse_acpi_topology(void)
>>>    {
>>> +    int thread_num, max_smt_thread_num = 1;
>>> +    struct xarray core_threads;
>>>        int cpu, topology_id;
>>> +    void *entry;
>>>          if (acpi_disabled)
>>>            return 0;
>>>    +    xa_init(&core_threads);
>>> +
>>>        for_each_possible_cpu(cpu) {
>>>            topology_id = find_acpi_cpu_topology(cpu, 0);
>>>            if (topology_id < 0)
>>> @@ -57,6 +64,20 @@ int __init parse_acpi_topology(void)
>>>                cpu_topology[cpu].thread_id = topology_id;
>>>                topology_id = find_acpi_cpu_topology(cpu, 1);
>>>                cpu_topology[cpu].core_id   = topology_id;
>>> +
>>> +            entry = xa_load(&core_threads, topology_id);
>>> +            if (!entry) {
>>> +                xa_store(&core_threads, topology_id,
>>> +                     xa_mk_value(1), GFP_KERNEL);
>>> +            } else {
>>> +                thread_num = xa_to_value(entry);
>>> +                thread_num++;
>>> +                xa_store(&core_threads, topology_id,
>>> +                     xa_mk_value(thread_num), GFP_KERNEL);
>>> +
>>> +                if (thread_num > max_smt_thread_num)
>>> +                    max_smt_thread_num = thread_num;
>>> +            }
>>>            } else {
>>>                cpu_topology[cpu].thread_id  = -1;
>>>                cpu_topology[cpu].core_id    = topology_id;
>>> @@ -67,6 +88,9 @@ int __init parse_acpi_topology(void)
>>>            cpu_topology[cpu].package_id = topology_id;
>>>        }
>>>    +    cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
>>> +
>>> +    xa_destroy(&core_threads);
>>>        return 0;
>>>    }
>>>    #endif
>>
>> .
--------------OlcT09OcROCozw2vbYxirgsk
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-RFC-arm64-topology-Enable-CONFIG_SMT_NUM_THREADS_DYN.patch"
Content-Disposition: attachment;
 filename*0="0001-RFC-arm64-topology-Enable-CONFIG_SMT_NUM_THREADS_DYN.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA2MDQ3ZTc3MDBlYjQ3YTAxZjdkZGI3OTQ2NzdhNzI1MTNmZDJmZjJmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBQaWVycmUgR29uZG9pcyA8cGllcnJlLmdvbmRvaXNA
YXJtLmNvbT4KRGF0ZTogVGh1LCAyOSBBdWcgMjAyNCAxMToxOTowOCArMDIwMApTdWJqZWN0
OiBbUEFUQ0hdIFtSRkNdIGFybTY0OiB0b3BvbG9neTogRW5hYmxlIENPTkZJR19TTVRfTlVN
X1RIUkVBRFNfRFlOQU1JQwoKLSBPbiBhcm02NCBBQ1BJIHN5c3RlbXMsIGNoYW5nZSB0aGUg
dGhyZWFkX2lkIGFzc2lnbm1lbnQgdG8gaGF2ZQogIGluY3JlYXNpbmcgdmFsdWVzIHN0YXJ0
aW5nIGZyb20gMC4gVGhpcyBpcyBhbHJlYWR5IHRoZSBjYXNlIGZvciBEVAogIGJhc2VkIHN5
c3RlbXMuIERvaW5nIHNvIGFsbG93cyB0byB1bmlmb3JtbHkgaWRlbnRpZnkgdGhlIG4tdGgK
ICB0aHJlYWQgb2YgYSBnaXZlbiBDUFUuCi0gQ2hlY2sgdGhhdCBhbGwgQ1BVcyBoYXZlIHRo
ZSBzYW1lIG51bWJlciBvZiB0aHJlYWRzIChmb3IgRFQvQUNQSSkKLSBFbmFibGUgQ09ORklH
X1NNVF9OVU1fVEhSRUFEU19EWU5BTUlDCgpPbiBhIFR4Miwgd2l0aCAyNTYgQ1BVcywgdGhy
ZWFkcyBzaWJsaW5ncyBiZWluZyAwLDMyLDY0LDk2CmZvciBzb2NrZXQwIGFuZCAxMjggKyAo
MCwzMiw2NCw5NikgZm9yIHNvY2tldDE6CiQgY2QgL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
c210LwokIGNhdCAuLi9vbmxpbmUKMC0yNTUKJCBlY2hvIDIgPiBjb250cm9sCiQgY2F0IC4u
L29ubGluZQowLTYzLDEyOC0xOTEKJCBlY2hvIDMgPiBjb250cm9sCiQgY2F0IC4uL29ubGlu
ZQowLTk1LDEyOC0yMjMKJCBlY2hvIG9uID4gY29udHJvbAokIGNhdCAuLi9vbmxpbmUKMC0y
NTUKLS0tCiBhcmNoL2FybTY0L0tjb25maWcgICAgICAgICAgICAgICAgfCAgMSArCiBhcmNo
L2FybTY0L2luY2x1ZGUvYXNtL3RvcG9sb2d5LmggfCAgOCArKysrKysrKwogYXJjaC9hcm02
NC9rZXJuZWwvdG9wb2xvZ3kuYyAgICAgIHwgMTYgKysrKysrKysrKysrKysrLQogZHJpdmVy
cy9iYXNlL2FyY2hfdG9wb2xvZ3kuYyAgICAgIHwgIDggKysrKystLS0KIGluY2x1ZGUvbGlu
dXgvYXJjaF90b3BvbG9neS5oICAgICB8ICAxICsKIDUgZmlsZXMgY2hhbmdlZCwgMzAgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L0tj
b25maWcgYi9hcmNoL2FybTY0L0tjb25maWcKaW5kZXggYmQzYmMyZjVlMGVjLi4xZDg1MjE0
ODMwNjUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvS2NvbmZpZworKysgYi9hcmNoL2FybTY0
L0tjb25maWcKQEAgLTIzOSw2ICsyMzksNyBAQCBjb25maWcgQVJNNjQKIAlzZWxlY3QgSEFW
RV9HRU5FUklDX1ZEU08KIAlzZWxlY3QgSE9UUExVR19DT1JFX1NZTkNfREVBRCBpZiBIT1RQ
TFVHX0NQVQogCXNlbGVjdCBIT1RQTFVHX1NNVCBpZiAoU01QICYmIEhPVFBMVUdfQ1BVKQor
CXNlbGVjdCBTTVRfTlVNX1RIUkVBRFNfRFlOQU1JQyBpZiBIT1RQTFVHX1NNVAogCXNlbGVj
dCBJUlFfRE9NQUlOCiAJc2VsZWN0IElSUV9GT1JDRURfVEhSRUFESU5HCiAJc2VsZWN0IEtB
U0FOX1ZNQUxMT0MgaWYgS0FTQU4KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9h
c20vdG9wb2xvZ3kuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdG9wb2xvZ3kuaAppbmRl
eCAwZjZlZjQzMmZiODQuLjdkZDIxMWY4MTY4NyAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9p
bmNsdWRlL2FzbS90b3BvbG9neS5oCisrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdG9w
b2xvZ3kuaApAQCAtMzksNiArMzksMTQgQEAgdm9pZCB1cGRhdGVfZnJlcV9jb3VudGVyc19y
ZWZzKHZvaWQpOwogI2RlZmluZSBhcmNoX3NjYWxlX2h3X3ByZXNzdXJlIHRvcG9sb2d5X2dl
dF9od19wcmVzc3VyZQogI2RlZmluZSBhcmNoX3VwZGF0ZV9od19wcmVzc3VyZQl0b3BvbG9n
eV91cGRhdGVfaHdfcHJlc3N1cmUKIAorI2lmZGVmIENPTkZJR19TTVRfTlVNX1RIUkVBRFNf
RFlOQU1JQworI2luY2x1ZGUgPGxpbnV4L2NwdV9zbXQuaD4KK3N0YXRpYyBpbmxpbmUgYm9v
bCB0b3BvbG9neV9zbXRfdGhyZWFkX2FsbG93ZWQodW5zaWduZWQgaW50IGNwdSkKK3sKKwly
ZXR1cm4gdG9wb2xvZ3lfdGhyZWFkX2lkKGNwdSkgPCBjcHVfc210X251bV90aHJlYWRzOwor
fQorI2VuZGlmCisKICNpbmNsdWRlIDxhc20tZ2VuZXJpYy90b3BvbG9neS5oPgogCiAjZW5k
aWYgLyogX0FTTV9BUk1fVE9QT0xPR1lfSCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9r
ZXJuZWwvdG9wb2xvZ3kuYyBiL2FyY2gvYXJtNjQva2VybmVsL3RvcG9sb2d5LmMKaW5kZXgg
ZjcyZTFlNTViMDVlLi5hODNiYWJlMTk5NzIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQva2Vy
bmVsL3RvcG9sb2d5LmMKKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvdG9wb2xvZ3kuYwpAQCAt
NDcsNyArNDcsOSBAQCBpbnQgX19pbml0IHBhcnNlX2FjcGlfdG9wb2xvZ3kodm9pZCkKIHsK
IAlpbnQgdGhyZWFkX251bSwgbWF4X3NtdF90aHJlYWRfbnVtID0gMTsKIAlzdHJ1Y3QgeGFy
cmF5IGNvcmVfdGhyZWFkczsKKwlib29sIGhhdmVfdGhyZWFkID0gZmFsc2U7CiAJaW50IGNw
dSwgdG9wb2xvZ3lfaWQ7CisJdW5zaWduZWQgbG9uZyBpOwogCXZvaWQgKmVudHJ5OwogCiAJ
aWYgKGFjcGlfZGlzYWJsZWQpCkBAIC02MSw2ICs2Myw4IEBAIGludCBfX2luaXQgcGFyc2Vf
YWNwaV90b3BvbG9neSh2b2lkKQogCQkJcmV0dXJuIHRvcG9sb2d5X2lkOwogCiAJCWlmIChh
Y3BpX2NwdV9pc190aHJlYWRlZChjcHUpKSB7CisJCQloYXZlX3RocmVhZCA9IHRydWU7CisK
IAkJCWNwdV90b3BvbG9neVtjcHVdLnRocmVhZF9pZCA9IHRvcG9sb2d5X2lkOwogCQkJdG9w
b2xvZ3lfaWQgPSBmaW5kX2FjcGlfY3B1X3RvcG9sb2d5KGNwdSwgMSk7CiAJCQljcHVfdG9w
b2xvZ3lbY3B1XS5jb3JlX2lkICAgPSB0b3BvbG9neV9pZDsKQEAgLTY5LDkgKzczLDEwIEBA
IGludCBfX2luaXQgcGFyc2VfYWNwaV90b3BvbG9neSh2b2lkKQogCQkJaWYgKCFlbnRyeSkg
ewogCQkJCXhhX3N0b3JlKCZjb3JlX3RocmVhZHMsIHRvcG9sb2d5X2lkLAogCQkJCQkgeGFf
bWtfdmFsdWUoMSksIEdGUF9LRVJORUwpOworCQkJCWNwdV90b3BvbG9neVtjcHVdLnRocmVh
ZF9pZCA9IDA7CiAJCQl9IGVsc2UgewogCQkJCXRocmVhZF9udW0gPSB4YV90b192YWx1ZShl
bnRyeSk7Ci0JCQkJdGhyZWFkX251bSsrOworCQkJCWNwdV90b3BvbG9neVtjcHVdLnRocmVh
ZF9pZCA9IHRocmVhZF9udW0rKzsKIAkJCQl4YV9zdG9yZSgmY29yZV90aHJlYWRzLCB0b3Bv
bG9neV9pZCwKIAkJCQkJIHhhX21rX3ZhbHVlKHRocmVhZF9udW0pLCBHRlBfS0VSTkVMKTsK
IApAQCAtODYsOCArOTEsMTcgQEAgaW50IF9faW5pdCBwYXJzZV9hY3BpX3RvcG9sb2d5KHZv
aWQpCiAJCWNwdV90b3BvbG9neVtjcHVdLmNsdXN0ZXJfaWQgPSB0b3BvbG9neV9pZDsKIAkJ
dG9wb2xvZ3lfaWQgPSBmaW5kX2FjcGlfY3B1X3RvcG9sb2d5X3BhY2thZ2UoY3B1KTsKIAkJ
Y3B1X3RvcG9sb2d5W2NwdV0ucGFja2FnZV9pZCA9IHRvcG9sb2d5X2lkOworCisJCXByX2Rl
YnVnKCJDUFUldTogcGFja2FnZT0weCV4IGNsdXN0ZXI9MHgleCBjb3JlPTB4JXggdGhyZWFk
PTB4JXhcbiIsCisJCQljcHUsIGNwdV90b3BvbG9neVtjcHVdLnBhY2thZ2VfaWQsIGNwdV90
b3BvbG9neVtjcHVdLmNsdXN0ZXJfaWQsCisJCQljcHVfdG9wb2xvZ3lbY3B1XS5jb3JlX2lk
LCBjcHVfdG9wb2xvZ3lbY3B1XS50aHJlYWRfaWQpOwogCX0KIAorCWlmIChoYXZlX3RocmVh
ZCkKKwkJeGFfZm9yX2VhY2goJmNvcmVfdGhyZWFkcywgaSwgZW50cnkpCisJCQlpZiAoeGFf
dG9fdmFsdWUoZW50cnkpICE9IG1heF9zbXRfdGhyZWFkX251bSkKKwkJCQlwcl93YXJuKCJI
ZXRlcm9nZW5lb3VzIFNNVCB0b3BvbG9neSBub3QgaGFuZGxlZCIpOworCiAJY3B1X3NtdF9z
ZXRfbnVtX3RocmVhZHMobWF4X3NtdF90aHJlYWRfbnVtLCBtYXhfc210X3RocmVhZF9udW0p
OwogCiAJeGFfZGVzdHJveSgmY29yZV90aHJlYWRzKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
YmFzZS9hcmNoX3RvcG9sb2d5LmMgYi9kcml2ZXJzL2Jhc2UvYXJjaF90b3BvbG9neS5jCmlu
ZGV4IDk1NTEzYWJkNjY0Zi4uMjBkN2Y1YjcyZGRkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jh
c2UvYXJjaF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvYmFzZS9hcmNoX3RvcG9sb2d5LmMK
QEAgLTUzMiwxMyArNTMyLDE1IEBAIHN0YXRpYyBpbnQgX19pbml0IGdldF9jcHVfZm9yX25v
ZGUoc3RydWN0IGRldmljZV9ub2RlICpub2RlKQogCXJldHVybiBjcHU7CiB9CiAKLXN0YXRp
YyB2b2lkIF9faW5pdCB1cGRhdGVfc210X251bV90aHJlYWRzKHVuc2lnbmVkIGludCBudW1f
dGhyZWFkcykKK3N0YXRpYyB2b2lkIF9faW5pdCB1cGRhdGVfc210X251bV90aHJlYWRzKGlu
dCBudW1fdGhyZWFkcykKIHsKLQlzdGF0aWMgdW5zaWduZWQgaW50IG1heF9zbXRfdGhyZWFk
X251bSA9IDE7CisJc3RhdGljIGludCBtYXhfc210X3RocmVhZF9udW0gPSAtMTsKIAotCWlm
IChudW1fdGhyZWFkcyA+IG1heF9zbXRfdGhyZWFkX251bSkgeworCWlmIChtYXhfc210X3Ro
cmVhZF9udW0gPCAwKSB7CiAJCW1heF9zbXRfdGhyZWFkX251bSA9IG51bV90aHJlYWRzOwog
CQljcHVfc210X3NldF9udW1fdGhyZWFkcyhtYXhfc210X3RocmVhZF9udW0sIG1heF9zbXRf
dGhyZWFkX251bSk7CisJfSBlbHNlIGlmIChudW1fdGhyZWFkcyAhPSBtYXhfc210X3RocmVh
ZF9udW0pIHsKKwkJcHJfd2FybigiSGV0ZXJvZ2VuZW91cyBTTVQgdG9wb2xvZ3kgbm90IGhh
bmRsZWQiKTsKIAl9CiB9CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvYXJjaF90b3Bv
bG9neS5oIGIvaW5jbHVkZS9saW51eC9hcmNoX3RvcG9sb2d5LmgKaW5kZXggYjcyMWYzNjBk
NzU5Li5hZmRmZGM2NGEwYTEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvYXJjaF90b3Bv
bG9neS5oCisrKyBiL2luY2x1ZGUvbGludXgvYXJjaF90b3BvbG9neS5oCkBAIC04Nyw2ICs4
Nyw3IEBAIGV4dGVybiBzdHJ1Y3QgY3B1X3RvcG9sb2d5IGNwdV90b3BvbG9neVtOUl9DUFVT
XTsKICNkZWZpbmUgdG9wb2xvZ3lfcGh5c2ljYWxfcGFja2FnZV9pZChjcHUpCShjcHVfdG9w
b2xvZ3lbY3B1XS5wYWNrYWdlX2lkKQogI2RlZmluZSB0b3BvbG9neV9jbHVzdGVyX2lkKGNw
dSkJKGNwdV90b3BvbG9neVtjcHVdLmNsdXN0ZXJfaWQpCiAjZGVmaW5lIHRvcG9sb2d5X2Nv
cmVfaWQoY3B1KQkJKGNwdV90b3BvbG9neVtjcHVdLmNvcmVfaWQpCisjZGVmaW5lIHRvcG9s
b2d5X3RocmVhZF9pZChjcHUpCQkoY3B1X3RvcG9sb2d5W2NwdV0udGhyZWFkX2lkKQogI2Rl
ZmluZSB0b3BvbG9neV9jb3JlX2NwdW1hc2soY3B1KQkoJmNwdV90b3BvbG9neVtjcHVdLmNv
cmVfc2libGluZykKICNkZWZpbmUgdG9wb2xvZ3lfc2libGluZ19jcHVtYXNrKGNwdSkJKCZj
cHVfdG9wb2xvZ3lbY3B1XS50aHJlYWRfc2libGluZykKICNkZWZpbmUgdG9wb2xvZ3lfY2x1
c3Rlcl9jcHVtYXNrKGNwdSkJKCZjcHVfdG9wb2xvZ3lbY3B1XS5jbHVzdGVyX3NpYmxpbmcp
Ci0tIAoyLjI1LjEKCg==

--------------OlcT09OcROCozw2vbYxirgsk--

