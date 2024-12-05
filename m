Return-Path: <linuxppc-dev+bounces-3824-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F399E58D9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 15:49:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3y2K00Jhz2yDp;
	Fri,  6 Dec 2024 01:48:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733410136;
	cv=none; b=AwJ5u5Pd97TIzzOgaptAj+R/jsy7+sfVTQwTftwB+o0a/YgUwK77bqnWOECzWpl8GUoK8jXO2w745CG93s6zp6rCYT7RM8QH3x6GFj9upEW55fNKLUJMmV45i41qVugOV1xaC9R1si5OOFe25miVw4IopBVkqgRFgK+FtDjyy5uE01sCVIAvr9Z5jP45HlRdEc8aUj6DbOFUJKfzVZqoZhGScsxrnEgdM1t56I5QZiBy25Fdsg1ifu16wyb7cT/yOdHTHPNlviWSMR1NHppgfbWRIroaDJSXo0GV6sIng6TOrek5oHp/YJT9SURxuM7zEJgxjrUZcRb35xB6WW9ocw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733410136; c=relaxed/relaxed;
	bh=msSW/XnJUyMrSC+OBhNgfdmUZjqQ3iW2zMsbZkiwUyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l68gYy5FcesqVhdzKB7Vg8zJ7mSLTL/gpE8SF7X8TGbUR7mxbdPAEMyes6RVbckiYaPlpFG9E5odluIPjc7JbJ2yv66ZzYiq2U2rtQzNVxbYS2MYBSR/rakg3kjVlhYPexTIizLE6LM0csIojukyCi+JMbMfSJ6y+9jNYFslQJUEDLdKhG/4KCyYnx3NFWcjjAihSCD7Mi4BcSTasUql4K4fd/XT7vvk7WbnMdfUm7jWkNqGUD1SQQ2GyrD+rpSGonk/mQespoeny6yCCHFN15uy4ilBALAPwH+85BPV6s+4L3m0QLf4aqGFABIwWkVRUC3gJUDaHfbg+3ZHGEvj2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qCXl/kdn; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qCXl/kdn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3y2H4Y15z2xnc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2024 01:48:55 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5554iX014551;
	Thu, 5 Dec 2024 14:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=msSW/X
	nJUyMrSC+OBhNgfdmUZjqQ3iW2zMsbZkiwUyY=; b=qCXl/kdnT/bYJgyyLOZEDj
	N6RPpgS4qlkaFYdUlkxBureUo1OLs+ehA+BXRZd9vIeJ3pXLwAzUmQo9u3l8xoN/
	+++vNUc5N9Ffz25L0kltUeC+16z/CMCDNLyuSxvgIe6TAnTdh8ufNKKvf5cTxLbf
	4MXEBe0tjFK/N4QIYVGETNDfYiJ9ZGIqbLjsF03GxggnqcBGKJcpjQ0OuItS90kn
	8XKecmNGwqEBimo3JqSepgDq7WYY2TgBSRO1CWM/ulZhmlvYcWm4HphxNJCMyOqr
	wkboxSUMUp4Jp1KjFAvjmvtO1xvGZmFhuQDXfH3zzk/GpNg2CwQ4NZzYA6FF/9Mw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 437tbxww33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 14:48:42 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B5Emg3O016124;
	Thu, 5 Dec 2024 14:48:42 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 437tbxww2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 14:48:42 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5C6lJI005273;
	Thu, 5 Dec 2024 14:48:41 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 438fr1taau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 14:48:41 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B5EmdTO32833804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2024 14:48:39 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CFFBB20040;
	Thu,  5 Dec 2024 14:48:39 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFAC120043;
	Thu,  5 Dec 2024 14:48:33 +0000 (GMT)
Received: from [9.39.27.31] (unknown [9.39.27.31])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Dec 2024 14:48:32 +0000 (GMT)
Message-ID: <543d376c-85a7-4628-a38e-52bc117258a5@linux.ibm.com>
Date: Thu, 5 Dec 2024 20:18:28 +0530
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
Subject: Re: [RFC PATCH 0/2] sched/fair: introduce new scheduler group type
 group_parked
To: Tobias Huschle <huschle@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20241204112149.25872-1-huschle@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20241204112149.25872-1-huschle@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZG0OQFbJ6RTCPqqlVwM6XydZ6_HYbCJ0
X-Proofpoint-GUID: bKbILWRgrvc6pJIxTQjr7e7AJtrQ9Z7v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050105
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 12/4/24 16:51, Tobias Huschle wrote:
> Adding a new scheduler group type which allows to remove all tasks
> from certain CPUs through load balancing can help in scenarios where
> such CPUs are currently unfavorable to use, for example in a
> virtualized environment.
> 
> Functionally, this works as intended. The question would be, if this
> could be considered to be added and would be worth going forward
> with. If so, which areas would need additional attention?
> Some cases are referenced below.
> 
> The underlying concept and the approach of adding a new scheduler
> group type were presented in the Sched MC of the 2024 LPC.
> A short summary:

Thanks for working on this. Yes, we had two possible implementable version.
1. Using new group type. (this RFC)
2. Using group_misfit and use very low CPU capacity set using thermal framework.
Those tricky issues were discussed at plumbers.

I agree using new group type simplifies from implementation perspective.
So for the idea of using this,
Acked-by: Shrikanth Hegde <sshegde@linux.ibm.com>

> 
> Some architectures (e.g. s390) provide virtualization on a firmware
> level. This implies, that Linux kernels running on such architectures
> run on virtualized CPUs.
> 
> Like in other virtualized environments, the CPUs are most likely shared
> with other guests on the hardware level. This implies, that Linux
> kernels running in such an environment may encounter 'steal time'. In
> other words, instead of being able to use all available time on a
> physical CPU, some of said available time is 'stolen' by other guests.
> 
> This can cause side effects if a guest is interrupted at an unfavorable
> point in time or if the guest is waiting for one of its other virtual
> CPUs to perform certain actions while those are suspended in favour of
> another guest.
> 
> Architectures, like arch/s390, address this issue by providing an
> alternative classification for the CPUs seen by the Linux kernel.
> 
> The following example is arch/s390 specific:
> In the default mode (horizontal CPU polarization), all CPUs are treated
> equally and can be subject to steal time equally.
> In the alternate mode (vertical CPU polarization), the underlying
> firmware hypervisor assigns the CPUs, visible to the guest, different
> types, depending on how many CPUs the guest is entitled to use. Said
> entitlement is configured by assigning weights to all active guests.
> The three CPU types are:
>      - vertical high   : On these CPUs, the guest has always highest
>                          priority over other guests. This means
>                          especially that if the guest executes tasks on
>                          these CPUs, it will encounter no steal time.
>      - vertical medium : These CPUs are meant to cover fractions of
>                          entitlement.
>      - vertical low    : These CPUs will have no priority when being
>                          scheduled. This implies especially, that while
>                          all other guests are using their full
>                          entitlement, these CPUs might not be ran for a
>                          significant amount of time.
> 
> As a consequence, using vertical lows while the underlying hypervisor
> experiences a high load, driven by all defined guests, is to be avoided.
> 
> In order to consequently move tasks off of vertical lows, introduce a
> new type of scheduler groups: group_parked.
> Parked implies, that processes should be evacuated as fast as possible
> from these CPUs. This implies that other CPUs should start pulling tasks
> immediately, while the parked CPUs should refuse to pull any tasks
> themselves.
> Adding a group type beyond group_overloaded achieves the expected
> behavior. By making its selection architecture dependent, it has
> no effect on architectures which will not make use of that group type.
> 
> This approach works very well for many kinds of workloads. Tasks are
> getting migrated back and forth in line with changing the parked
> state of the involved CPUs.

Likely there could more use-cases. It is basically supposed to be a lightweight
mechanism to remove tasks out of CPUs instead of offline. Right?

> 
> There are a couple of issues and corner cases which need further
> considerations:
> - no_hz:        While the scheduler tick can and should still be disabled
>                  on idle CPUs, it should not be disabled on parked CPUs
>                  which run only one task, as that task will not be
task running on Parked CPUs itself is concern right? unless it is pinned.

>                  scheduled away in time. Side effects and completeness
>                  need to be further investigated. One option might be to
>                  allow dynamic changes to tick_nohz_full_mask. It is also
>                  possible to handle this in exclusively fair.c, but that
>                  seems not to be the best environment to do so.
> - pinned tasks: If a task is pinned to CPUs which are all parked, it will
>                  get moved to other CPUs. Like during CPU hotplug, the
>                  information about the tasks initial CPU mask gets lost.

Could be a warning instead saying to user or fail?

> - rt & dl:      Realtime and deadline scheduling require some additional
>                  attention.

Ideal would be not run RT and DL there. But in these virtualized environment there is likely a number of CPUS
such a number of Vertical High which is always available (in PowerPC we call these as entitled CPUs) and use those
for RT or DL calculations of admission control?

> - ext:          Probably affected as well. Needs some conceptional
>                  thoughts first.
> - idle vs parked: It could be considered whether an idle parked CPU
>                  would contribute to the count of idle CPUs. It is
>                  usually preferable to utilize idle CPUs, but parked CPUs
>                  should not be used. So a scheduler group with many idle,
>                  but parked, CPUs, should not be the target for additional
>                  workload. At this point, some more thought needs to be
>                  spent to evaluate if it would be ok to not set the idle
>                  flag on parked CPUs.

I think idle_cpus shouldn't include parked CPUs.

> - optimization: It is probably possible to cut some corners. In order to
>                  avoid tampering with scheduler statistics too much, the
>                  actions based on the parkedness on the CPU are not always
>                  taken on the earliest possible occasion yet.
> - raciness:     Right now, there are no synchronization efforts. It needs
>                  to be considered whether those might be necessary or if
>                  it is alright that the parked-state of a CPU might change
>                  during load-balancing.

Next load balancing will take care of this instead right? Similar to CPU capacity can
change on its own even during load balancing. next load balancer takes care.

> 
> Patches apply to tip:sched/core
> 
> The s390 patch serves as a simplified implementation example.
> 
> Tobias Huschle (2):
>    sched/fair: introduce new scheduler group type group_parked
>    s390/topology: Add initial implementation for selection of parked CPUs
> 
>   arch/s390/include/asm/topology.h |   3 +
>   arch/s390/kernel/topology.c      |   5 ++
>   include/linux/sched/topology.h   |  20 +++++
>   kernel/sched/core.c              |  10 ++-
>   kernel/sched/fair.c              | 122 +++++++++++++++++++++++++------
>   5 files changed, 135 insertions(+), 25 deletions(-)
> 

tl;dr; debug patch and some testing results with mpstats logs.


So I gave it a try with using a debugfs based hint to say which CPUs are parked.
It is a hack to try it out. patch is below so one could try something similar is their archs
and see if it help if they have a use case.

Notes:
1. Arch shouldn't set cpu_parked for all CPUs at boot. It causes panic.
2. Workload gets unpacked to all CPUs when changing from 40 CPUs to 80 CPUs, but
    doesn't get packed when changing the from 80 to 40 CPUs.

===================================debug patch ======================================

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 16bacfe8c7a2..ae7571f86773 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -140,6 +140,9 @@ static inline int cpu_to_coregroup_id(int cpu)
  #define topology_core_cpumask(cpu)     (per_cpu(cpu_core_map, cpu))
  #define topology_core_id(cpu)          (cpu_to_core_id(cpu))
  
+#define arch_cpu_parked cpu_parked
+int cpu_parked(int cpu);
+
  #endif
  #endif
  
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5ac7084eebc0..6715ea78388c 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -64,6 +64,7 @@
  #include <asm/systemcfg.h>
  
  #include <trace/events/ipi.h>
+#include <linux/debugfs.h>
  
  #ifdef DEBUG
  #include <asm/udbg.h>
@@ -77,6 +78,8 @@
  static DEFINE_PER_CPU(int, cpu_state) = { 0 };
  #endif
  
+static int vp_manual_hint = NR_CPUS;
+
  struct task_struct *secondary_current;
  bool has_big_cores __ro_after_init;
  bool coregroup_enabled __ro_after_init;
@@ -1727,6 +1730,7 @@ static void __init build_sched_topology(void)
         BUG_ON(i >= ARRAY_SIZE(powerpc_topology) - 1);
  
         set_sched_topology(powerpc_topology);
+       vp_manual_hint = num_present_cpus();
  }
  
  void __init smp_cpus_done(unsigned int max_cpus)
@@ -1807,4 +1811,43 @@ void __noreturn arch_cpu_idle_dead(void)
         start_secondary_resume();
  }
  
+int cpu_parked(int cpu) {
+       if (cpu  >= vp_manual_hint)
+               return true;
+
+       return false;
+}
+
+static int pv_vp_manual_hint_set(void *data, u64 val)
+{
+       if (val == 0 || vp_manual_hint > num_present_cpus())
+               vp_manual_hint = num_present_cpus();
+
+       if (val != vp_manual_hint) {
+               vp_manual_hint = val;
+       }
+       return 0;
+}
+
+static int pv_vp_manual_hint_get(void *data, u64 *val)
+{
+       *val = vp_manual_hint;
+       return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_vp_manual_hint, pv_vp_manual_hint_get, pv_vp_manual_hint_set, "%llu\n");
+
+
+static __init int paravirt_debugfs_init(void)
+{
+       if (is_shared_processor()) {
+               debugfs_create_file("vp_manual_hint", 0600, arch_debugfs_dir, NULL, &fops_pv_vp_manual_hint);
+       }
+
+       return 0;
+}
+
+device_initcall(paravirt_debugfs_init)

========================================= test logs 80 CPUs system ================================================

set the hint as 40 and run 80 stress-ng.
Average:      37   82.89    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00   17.11
Average:      38   82.81    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00   17.19
Average:      39   82.98    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00   17.02
Average:      40    0.00    0.00    0.00    0.00    0.00    2.42    0.08    0.00    0.00   97.50
Average:      41    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
Average:      42    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00

Set the hint as 20 and run 80 stress-ng
Average:      18   93.54    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    6.46
Average:      19   93.54    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    6.46
Average:      20    0.00    0.00    0.00    0.00    0.00    1.14    0.00    0.00    0.00   98.86
Average:      21    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00


Set the hint as 40 initially and set to 80 midway.
Average:      38   94.52    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    5.48
Average:      39   94.53    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    5.47
Average:      40   42.03    0.00    0.00    0.00    0.00    1.31    0.08    0.00    0.00   56.59
Average:      41   43.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00   57.00

Set the hint as 80 initially and set to 40 midway -- *not working*
Average:      38   95.27    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    4.73
Average:      39   95.27    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    4.73
Average:      40   95.24    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    4.76
Average:      41   95.25    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    4.75

