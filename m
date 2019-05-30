Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 173E330503
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 00:54:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FNDZ47kBzDqWx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 08:54:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FNB60Rx7zDqZH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2019 08:51:57 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4UMpsUB033697
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 18:51:54 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2stqpj160w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 18:51:46 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <cclaudio@linux.ibm.com>;
 Thu, 30 May 2019 23:51:46 +0100
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 30 May 2019 23:51:43 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4UMphQQ23134650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 May 2019 22:51:43 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02B8ABE051;
 Thu, 30 May 2019 22:51:43 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AADBBE04F;
 Thu, 30 May 2019 22:51:42 +0000 (GMT)
Received: from [9.18.235.79] (unknown [9.18.235.79])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 30 May 2019 22:51:42 +0000 (GMT)
Subject: Re: [RFC PATCH v2 07/10] KVM: PPC: Ultravisor: Restrict LDBAR access
To: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20190518142524.28528-1-cclaudio@linux.ibm.com>
 <20190518142524.28528-8-cclaudio@linux.ibm.com>
 <600cdf4c-7195-ab32-5fe4-13b71845d222@linux.vnet.ibm.com>
From: Claudio Carvalho <cclaudio@linux.ibm.com>
Date: Thu, 30 May 2019 19:51:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <600cdf4c-7195-ab32-5fe4-13b71845d222@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19053022-0012-0000-0000-0000173DBDA1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011187; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01210943; UDB=6.00636252; IPR=6.00991977; 
 MB=3.00027124; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-30 22:51:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19053022-0013-0000-0000-000057782535
Message-Id: <f288a815-9dd2-5ab3-07c1-63c9d02f1aa6@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-30_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905300160
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 5/21/19 2:24 AM, Madhavan Srinivasan wrote:
>
> On 18/05/19 7:55 PM, Claudio Carvalho wrote:
>> From: Ram Pai <linuxram@us.ibm.com> When the ultravisor firmware is
>> available, it takes control over the LDBAR register. In this case,
>> thread-imc updates and save/restore operations on the LDBAR register are
>> handled by ultravisor.
> we should remove the core and thread imc nodes in the skiboot
> if the ultravisor is enabled. We dont need imc-pmu.c file changes, imc-pmu.c
> inits only if we have the corresponding nodes. I will post a skiboot patch.

Hi Maddy,

Thanks for the feedback and for taking care of the change needed in skiboot.

Right, if the core and thread imc devtree nodes were not created by
skiboot, then we don't need imc-pmu changes. As a sanity check, should we
have something like the following to make sure that the imc-pmu code will
not be executed even in the situation where ultravisor is enabled, but for
some reason skiboot did not remove those devtree nodes (e.g. your skiboot
patch was not applied)?

-------------------------

--- a/arch/powerpc/platforms/powernv/opal-imc.c
+++ b/arch/powerpc/platforms/powernv/opal-imc.c
@@ -258,6 +258,15 @@ static int opal_imc_counters_probe(struct
platform_device *pdev)
        bool core_imc_reg = false, thread_imc_reg = false;
        u32 type;
 
+       /*
+        * When ultravisor is enabled, it is responsible for thread-imc
+        * updates
+        */
+       if (firmware_has_feature(FW_FEATURE_ULTRAVISOR)) {
+               pr_info("IMC Ultravisor enabled\n");
+               return -EACCES;
+       }
+
        /*
         * Check whether this is kdump kernel. If yes, force the engines to
         * stop and return.

----------------------------

Claudio


> Maddy
>
>> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
>> [Restrict LDBAR access in assembly code and some in C, update the commit
>>   message]
>> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
>> ---
>>   arch/powerpc/kvm/book3s_hv.c                 |  4 +-
>>   arch/powerpc/kvm/book3s_hv_rmhandlers.S      |  2 +
>>   arch/powerpc/perf/imc-pmu.c                  | 64 ++++++++++++--------
>>   arch/powerpc/platforms/powernv/idle.c        |  6 +-
>>   arch/powerpc/platforms/powernv/subcore-asm.S |  4 ++
>>   5 files changed, 52 insertions(+), 28 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 0fab0a201027..81f35f955d16 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -75,6 +75,7 @@
>>   #include <asm/xics.h>
>>   #include <asm/xive.h>
>>   #include <asm/hw_breakpoint.h>
>> +#include <asm/firmware.h>
>>
>>   #include "book3s.h"
>>
>> @@ -3117,7 +3118,8 @@ static noinline void kvmppc_run_core(struct
>> kvmppc_vcore *vc)
>>               subcore_size = MAX_SMT_THREADS / split;
>>               split_info.rpr = mfspr(SPRN_RPR);
>>               split_info.pmmar = mfspr(SPRN_PMMAR);
>> -            split_info.ldbar = mfspr(SPRN_LDBAR);
>> +            if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
>> +                split_info.ldbar = mfspr(SPRN_LDBAR);
>>               split_info.subcore_size = subcore_size;
>>           } else {
>>               split_info.subcore_size = 1;
>> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> index dd014308f065..938cfa5dceed 100644
>> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> @@ -375,8 +375,10 @@ BEGIN_FTR_SECTION
>>       mtspr    SPRN_RPR, r0
>>       ld    r0, KVM_SPLIT_PMMAR(r6)
>>       mtspr    SPRN_PMMAR, r0
>> +BEGIN_FW_FTR_SECTION_NESTED(70)
>>       ld    r0, KVM_SPLIT_LDBAR(r6)
>>       mtspr    SPRN_LDBAR, r0
>> +END_FW_FTR_SECTION_NESTED(FW_FEATURE_ULTRAVISOR, 0, 70)
>>       isync
>>   FTR_SECTION_ELSE
>>       /* On P9 we use the split_info for coordinating LPCR changes */
>> diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
>> index 31fa753e2eb2..39c84de74da9 100644
>> --- a/arch/powerpc/perf/imc-pmu.c
>> +++ b/arch/powerpc/perf/imc-pmu.c
>> @@ -17,6 +17,7 @@
>>   #include <asm/cputhreads.h>
>>   #include <asm/smp.h>
>>   #include <linux/string.h>
>> +#include <asm/firmware.h>
>>
>>   /* Nest IMC data structures and variables */
>>
>> @@ -816,6 +817,17 @@ static int core_imc_event_init(struct perf_event
>> *event)
>>       return 0;
>>   }
>>
>> +static void thread_imc_ldbar_disable(void *dummy)
>> +{
>> +    /*
>> +     * By Zeroing LDBAR, we disable thread-imc updates. When the
>> ultravisor
>> +     * firmware is available, it is responsible for handling thread-imc
>> +     * updates, though
>> +     */
>> +    if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
>> +        mtspr(SPRN_LDBAR, 0);
>> +}
>> +
>>   /*
>>    * Allocates a page of memory for each of the online cpus, and load
>>    * LDBAR with 0.
>> @@ -856,7 +868,7 @@ static int thread_imc_mem_alloc(int cpu_id, int size)
>>           per_cpu(thread_imc_mem, cpu_id) = local_mem;
>>       }
>>
>> -    mtspr(SPRN_LDBAR, 0);
>> +    thread_imc_ldbar_disable(NULL);
>>       return 0;
>>   }
>>
>> @@ -867,7 +879,7 @@ static int ppc_thread_imc_cpu_online(unsigned int cpu)
>>
>>   static int ppc_thread_imc_cpu_offline(unsigned int cpu)
>>   {
>> -    mtspr(SPRN_LDBAR, 0);
>> +    thread_imc_ldbar_disable(NULL);
>>       return 0;
>>   }
>>
>> @@ -1010,7 +1022,6 @@ static int thread_imc_event_add(struct perf_event
>> *event, int flags)
>>   {
>>       int core_id;
>>       struct imc_pmu_ref *ref;
>> -    u64 ldbar_value, *local_mem = per_cpu(thread_imc_mem,
>> smp_processor_id());
>>
>>       if (flags & PERF_EF_START)
>>           imc_event_start(event, flags);
>> @@ -1019,8 +1030,14 @@ static int thread_imc_event_add(struct perf_event
>> *event, int flags)
>>           return -EINVAL;
>>
>>       core_id = smp_processor_id() / threads_per_core;
>> -    ldbar_value = ((u64)local_mem & THREAD_IMC_LDBAR_MASK) |
>> THREAD_IMC_ENABLE;
>> -    mtspr(SPRN_LDBAR, ldbar_value);
>> +    if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR)) {
>> +        u64 ldbar_value, *local_mem;
>> +
>> +        local_mem = per_cpu(thread_imc_mem, smp_processor_id());
>> +        ldbar_value = ((u64)local_mem & THREAD_IMC_LDBAR_MASK) |
>> +                THREAD_IMC_ENABLE;
>> +        mtspr(SPRN_LDBAR, ldbar_value);
>> +    }
>>
>>       /*
>>        * imc pmus are enabled only when it is used.
>> @@ -1053,7 +1070,7 @@ static void thread_imc_event_del(struct perf_event
>> *event, int flags)
>>       int core_id;
>>       struct imc_pmu_ref *ref;
>>
>> -    mtspr(SPRN_LDBAR, 0);
>> +    thread_imc_ldbar_disable(NULL);
>>
>>       core_id = smp_processor_id() / threads_per_core;
>>       ref = &core_imc_refc[core_id];
>> @@ -1109,7 +1126,7 @@ static int trace_imc_mem_alloc(int cpu_id, int size)
>>       trace_imc_refc[core_id].id = core_id;
>>       mutex_init(&trace_imc_refc[core_id].lock);
>>
>> -    mtspr(SPRN_LDBAR, 0);
>> +    thread_imc_ldbar_disable(NULL);
>>       return 0;
>>   }
>>
>> @@ -1120,7 +1137,7 @@ static int ppc_trace_imc_cpu_online(unsigned int cpu)
>>
>>   static int ppc_trace_imc_cpu_offline(unsigned int cpu)
>>   {
>> -    mtspr(SPRN_LDBAR, 0);
>> +    thread_imc_ldbar_disable(NULL);
>>       return 0;
>>   }
>>
>> @@ -1207,11 +1224,6 @@ static int trace_imc_event_add(struct perf_event
>> *event, int flags)
>>   {
>>       int core_id = smp_processor_id() / threads_per_core;
>>       struct imc_pmu_ref *ref = NULL;
>> -    u64 local_mem, ldbar_value;
>> -
>> -    /* Set trace-imc bit in ldbar and load ldbar with per-thread memory
>> address */
>> -    local_mem = get_trace_imc_event_base_addr();
>> -    ldbar_value = ((u64)local_mem & THREAD_IMC_LDBAR_MASK) |
>> TRACE_IMC_ENABLE;
>>
>>       if (core_imc_refc)
>>           ref = &core_imc_refc[core_id];
>> @@ -1222,14 +1234,25 @@ static int trace_imc_event_add(struct perf_event
>> *event, int flags)
>>           if (!ref)
>>               return -EINVAL;
>>       }
>> -    mtspr(SPRN_LDBAR, ldbar_value);
>> +    if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR)) {
>> +        u64 local_mem, ldbar_value;
>> +
>> +        /*
>> +         * Set trace-imc bit in ldbar and load ldbar with per-thread
>> +         * memory address
>> +         */
>> +        local_mem = get_trace_imc_event_base_addr();
>> +        ldbar_value = ((u64)local_mem & THREAD_IMC_LDBAR_MASK) |
>> +                TRACE_IMC_ENABLE;
>> +        mtspr(SPRN_LDBAR, ldbar_value);
>> +    }
>>       mutex_lock(&ref->lock);
>>       if (ref->refc == 0) {
>>           if (opal_imc_counters_start(OPAL_IMC_COUNTERS_TRACE,
>>                   get_hard_smp_processor_id(smp_processor_id()))) {
>>               mutex_unlock(&ref->lock);
>>               pr_err("trace-imc: Unable to start the counters for core
>> %d\n", core_id);
>> -            mtspr(SPRN_LDBAR, 0);
>> +            thread_imc_ldbar_disable(NULL);
>>               return -EINVAL;
>>           }
>>       }
>> @@ -1270,7 +1293,7 @@ static void trace_imc_event_del(struct perf_event
>> *event, int flags)
>>           if (!ref)
>>               return;
>>       }
>> -    mtspr(SPRN_LDBAR, 0);
>> +    thread_imc_ldbar_disable(NULL);
>>       mutex_lock(&ref->lock);
>>       ref->refc--;
>>       if (ref->refc == 0) {
>> @@ -1413,15 +1436,6 @@ static void cleanup_all_core_imc_memory(void)
>>       kfree(core_imc_refc);
>>   }
>>
>> -static void thread_imc_ldbar_disable(void *dummy)
>> -{
>> -    /*
>> -     * By Zeroing LDBAR, we disable thread-imc
>> -     * updates.
>> -     */
>> -    mtspr(SPRN_LDBAR, 0);
>> -}
>> -
>>   void thread_imc_disable(void)
>>   {
>>       on_each_cpu(thread_imc_ldbar_disable, NULL, 1);
>> diff --git a/arch/powerpc/platforms/powernv/idle.c
>> b/arch/powerpc/platforms/powernv/idle.c
>> index c9133f7908ca..fd62435e3267 100644
>> --- a/arch/powerpc/platforms/powernv/idle.c
>> +++ b/arch/powerpc/platforms/powernv/idle.c
>> @@ -679,7 +679,8 @@ static unsigned long power9_idle_stop(unsigned long
>> psscr, bool mmu_on)
>>           sprs.ptcr    = mfspr(SPRN_PTCR);
>>           sprs.rpr    = mfspr(SPRN_RPR);
>>           sprs.tscr    = mfspr(SPRN_TSCR);
>> -        sprs.ldbar    = mfspr(SPRN_LDBAR);
>> +        if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
>> +            sprs.ldbar    = mfspr(SPRN_LDBAR);
>>
>>           sprs_saved = true;
>>
>> @@ -762,7 +763,8 @@ static unsigned long power9_idle_stop(unsigned long
>> psscr, bool mmu_on)
>>       mtspr(SPRN_PTCR,    sprs.ptcr);
>>       mtspr(SPRN_RPR,        sprs.rpr);
>>       mtspr(SPRN_TSCR,    sprs.tscr);
>> -    mtspr(SPRN_LDBAR,    sprs.ldbar);
>> +    if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
>> +        mtspr(SPRN_LDBAR,    sprs.ldbar);
>>
>>       if (pls >= pnv_first_tb_loss_level) {
>>           /* TB loss */
>> diff --git a/arch/powerpc/platforms/powernv/subcore-asm.S
>> b/arch/powerpc/platforms/powernv/subcore-asm.S
>> index 39bb24aa8f34..e4383fa5e150 100644
>> --- a/arch/powerpc/platforms/powernv/subcore-asm.S
>> +++ b/arch/powerpc/platforms/powernv/subcore-asm.S
>> @@ -44,7 +44,9 @@ _GLOBAL(split_core_secondary_loop)
>>
>>   real_mode:
>>       /* Grab values from unsplit SPRs */
>> +BEGIN_FW_FTR_SECTION
>>       mfspr    r6,  SPRN_LDBAR
>> +END_FW_FTR_SECTION_IFCLR(FW_FEATURE_ULTRAVISOR)
>>       mfspr    r7,  SPRN_PMMAR
>>       mfspr    r8,  SPRN_PMCR
>>       mfspr    r9,  SPRN_RPR
>> @@ -77,7 +79,9 @@ real_mode:
>>       mtspr    SPRN_HDEC, r4
>>
>>       /* Restore SPR values now we are split */
>> +BEGIN_FW_FTR_SECTION
>>       mtspr    SPRN_LDBAR, r6
>> +END_FW_FTR_SECTION_IFCLR(FW_FEATURE_ULTRAVISOR)
>>       mtspr    SPRN_PMMAR, r7
>>       mtspr    SPRN_PMCR, r8
>>       mtspr    SPRN_RPR, r9
>

