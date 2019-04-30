Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C23F0A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 08:43:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tX6t5TSRzDqRX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 16:43:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=maddy@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tX5G4XJKzDqKy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 16:42:26 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3U6bPiV144691
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 02:42:23 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2s6dqef08y-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 02:42:23 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <maddy@linux.vnet.ibm.com>;
 Tue, 30 Apr 2019 07:42:21 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 30 Apr 2019 07:42:20 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3U6gJkO46202994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 06:42:19 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 503D2A4053
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 06:42:19 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD0F6A4040
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 06:42:18 +0000 (GMT)
Received: from [9.126.30.94] (unknown [9.126.30.94])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 06:42:18 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] powerpc/perf: Add generic compat mode pmu driver
To: linuxppc-dev@lists.ozlabs.org
References: <1556506368-29329-1-git-send-email-maddy@linux.vnet.ibm.com>
 <1556506368-29329-2-git-send-email-maddy@linux.vnet.ibm.com>
 <639fe9ec-365e-10dd-551e-44eb4bffd352@c-s.fr>
From: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Date: Tue, 30 Apr 2019 12:12:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <639fe9ec-365e-10dd-551e-44eb4bffd352@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19043006-0016-0000-0000-00000276BD99
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19043006-0017-0000-0000-000032D346A4
Message-Id: <e907f4bf-7bb3-13ae-5865-7803520a0b92@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904300045
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


On 29/04/19 11:12 AM, Christophe Leroy wrote:
>
>
> Le 29/04/2019 à 04:52, Madhavan Srinivasan a écrit :
>> Most of the power processor generation performance monitoring
>> unit (PMU) driver code is bundled in the kernel and one of those
>> is enabled/registered based on the oprofile_cpu_type check at
>> the boot.
>>
>> But things get little tricky incase of "compat" mode boot.
>> IBM POWER System Server based processors has a compactibility
>> mode feature, which simpily put is, Nth generation processor
>> (lets say POWER8) will act and appear in a mode consistent
>> with an earlier generation (N-1) processor (that is POWER7).
>> And in this "compat" mode boot, kernel modify the
>> "oprofile_cpu_type" to be Nth generation (POWER8). If Nth
>> generation pmu driver is bundled (POWER8), it gets registered.
>>
>> Key dependency here is to have distro support for latest
>> processor performance monitoring support. Patch here adds
>> a generic "compat-mode" performance monitoring driver to
>> be register in absence of powernv platform specific pmu driver.
>>
>> Driver supports "cycles", "instruction" and "branch-miss" events.
>> "0x100F0" used as event code for "cycles", "0x00002"
>> used as event code for "instruction" events and "0x400F6"
>> used as event code for "branch miss". These are architected events
>> as part of ISA. New file called "generic-compat-pmu.c" is
>> created to contain the driver specific code. And base raw event
>> code format modeled on PPMU_ARCH_207S.
>>
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
>> ---
>> Changelog v1:
>> - Updated architected event opcodes
>> - included branch miss with architected event opcode
>>
>>   arch/powerpc/perf/Makefile             |   3 +-
>>   arch/powerpc/perf/core-book3s.c        |   2 +-
>>   arch/powerpc/perf/generic-compat-pmu.c | 245 
>> +++++++++++++++++++++++++++++++++
>>   arch/powerpc/perf/internal.h           |   1 +
>>   4 files changed, 249 insertions(+), 2 deletions(-)
>>   create mode 100644 arch/powerpc/perf/generic-compat-pmu.c
>>
>> diff --git a/arch/powerpc/perf/Makefile b/arch/powerpc/perf/Makefile
>> index ab26df5bacb9..c155dcbb8691 100644
>> --- a/arch/powerpc/perf/Makefile
>> +++ b/arch/powerpc/perf/Makefile
>> @@ -5,7 +5,8 @@ obj-$(CONFIG_PERF_EVENTS)    += callchain.o perf_regs.o
>>   obj-$(CONFIG_PPC_PERF_CTRS)    += core-book3s.o bhrb.o
>>   obj64-$(CONFIG_PPC_PERF_CTRS)    += ppc970-pmu.o power5-pmu.o \
>>                      power5+-pmu.o power6-pmu.o power7-pmu.o \
>> -                   isa207-common.o power8-pmu.o power9-pmu.o
>> +                   isa207-common.o power8-pmu.o power9-pmu.o \
>> +                   generic-compat-pmu.o
>
> Isn't that name a bit long ? What about compat-pmu instead ?

yeah I guess. Will fix it.

>
>>   obj32-$(CONFIG_PPC_PERF_CTRS)    += mpc7450-pmu.o
>>     obj-$(CONFIG_PPC_POWERNV)    += imc-pmu.o
>> diff --git a/arch/powerpc/perf/core-book3s.c 
>> b/arch/powerpc/perf/core-book3s.c
>> index a96f9420139c..a66fb9c01c9e 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -2318,7 +2318,7 @@ static int __init init_ppc64_pmu(void)
>>       else if (!init_ppc970_pmu())
>>           return 0;
>>       else
>> -        return -ENODEV;
>> +        return init_generic_compat_pmu();
>>   }
>>   early_initcall(init_ppc64_pmu);
>>   #endif
>> diff --git a/arch/powerpc/perf/generic-compat-pmu.c 
>> b/arch/powerpc/perf/generic-compat-pmu.c
>> new file mode 100644
>> index 000000000000..9c2d4bbc5c87
>> --- /dev/null
>> +++ b/arch/powerpc/perf/generic-compat-pmu.c
>> @@ -0,0 +1,245 @@
>> +/*
>> + * Performance counter support.
>> + *
>> + * Copyright 2019 Madhavan Srinivasan, IBM Corporation.
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * as published by the Free Software Foundation; either version
>> + * 2 of the License, or later version.
>
> Shouldn't we use the new licence format for new files ? ie:
>
> // SPDX-License-Identifier: GPL-2.0+

My bad. Thanks for pointing out.
Will fix and re-spin.

Thanks for review
Maddy


>
>> + */
>> +
>> +#define pr_fmt(fmt)    "generic-compat-pmu: " fmt
>> +
>> +#include "isa207-common.h"
>> +
>> +/*
>> + * Raw event encoding:
>> + *
>> + *        60        56        52        48        44 40        
>> 36        32
>> + * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - 
>> - - | - - - - |
>> + *
>> + *        28        24        20        16        12 8         
>> 4         0
>> + * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - 
>> - - | - - - - |
>> + *                                 [ pmc ]   [unit ]   [ ] m   [    
>> pmcxsel    ]
>> + *                                                     |     |
>> + *                                                     |     *- mark
>> + *                                                     |
>> + *                                                     |
>> + *                                                     *- combine
>> + *
>> + * Below uses IBM bit numbering.
>> + *
>> + * MMCR1[x:y] = unit    (PMCxUNIT)
>> + * MMCR1[24]   = pmc1combine[0]
>> + * MMCR1[25]   = pmc1combine[1]
>> + * MMCR1[26]   = pmc2combine[0]
>> + * MMCR1[27]   = pmc2combine[1]
>> + * MMCR1[28]   = pmc3combine[0]
>> + * MMCR1[29]   = pmc3combine[1]
>> + * MMCR1[30]   = pmc4combine[0]
>> + * MMCR1[31]   = pmc4combine[1]
>> + *
>> + */
>> +
>> +/*
>> + * Some power9 event codes.
>> + */
>> +#define EVENT(_name, _code)    _name = _code,
>> +
>> +enum {
>> +EVENT(PM_CYC,                    0x100F0)
>> +EVENT(PM_INST_CMPL,                0x00002)
>> +EVENT(PM_BR_MPRED_CMPL,                0x400F6)
>> +};
>> +
>> +#undef EVENT
>> +
>> +GENERIC_EVENT_ATTR(cpu-cycles,            PM_CYC);
>> +GENERIC_EVENT_ATTR(instructions,        PM_INST_CMPL);
>> +GENERIC_EVENT_ATTR(branch-misses, PM_BR_MPRED_CMPL);
>> +
>> +static struct attribute *generic_compat_events_attr[] = {
>> +    GENERIC_EVENT_PTR(PM_CYC),
>> +    GENERIC_EVENT_PTR(PM_INST_CMPL),
>> +    GENERIC_EVENT_PTR(PM_BR_MPRED_CMPL),
>> +    NULL
>> +};
>> +
>> +static struct attribute_group generic_compat_pmu_events_group = {
>> +    .name = "events",
>> +    .attrs = generic_compat_events_attr,
>> +};
>> +
>> +PMU_FORMAT_ATTR(event,        "config:0-19");
>> +PMU_FORMAT_ATTR(pmcxsel,    "config:0-7");
>> +PMU_FORMAT_ATTR(mark,        "config:8");
>> +PMU_FORMAT_ATTR(combine,    "config:10-11");
>> +PMU_FORMAT_ATTR(unit,        "config:12-15");
>> +PMU_FORMAT_ATTR(pmc,        "config:16-19");
>> +
>> +static struct attribute *generic_compat_pmu_format_attr[] = {
>> +    &format_attr_event.attr,
>> +    &format_attr_pmcxsel.attr,
>> +    &format_attr_mark.attr,
>> +    &format_attr_combine.attr,
>> +    &format_attr_unit.attr,
>> +    &format_attr_pmc.attr,
>> +    NULL,
>> +};
>> +
>> +static struct attribute_group generic_compat_pmu_format_group = {
>> +    .name = "format",
>> +    .attrs = generic_compat_pmu_format_attr,
>> +};
>> +
>> +static const struct attribute_group 
>> *generic_compat_pmu_attr_groups[] = {
>> +    &generic_compat_pmu_format_group,
>> +    &generic_compat_pmu_events_group,
>> +    NULL,
>> +};
>> +
>> +static int compat_generic_events[] = {
>> +    [PERF_COUNT_HW_CPU_CYCLES] =            PM_CYC,
>> +    [PERF_COUNT_HW_INSTRUCTIONS] =            PM_INST_CMPL,
>> +    [PERF_COUNT_HW_BRANCH_MISSES] = PM_BR_MPRED_CMPL,
>> +};
>> +
>> +#define C(x)    PERF_COUNT_HW_CACHE_##x
>> +
>> +/*
>> + * Table of generalized cache-related events.
>> + * 0 means not supported, -1 means nonsensical, other values
>> + * are event codes.
>> + */
>> +static int 
>> generic_compat_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
>> +    [ C(L1D) ] = {
>> +        [ C(OP_READ) ] = {
>> +            [ C(RESULT_ACCESS) ] = 0,
>> +            [ C(RESULT_MISS)   ] = 0,
>> +        },
>> +        [ C(OP_WRITE) ] = {
>> +            [ C(RESULT_ACCESS) ] = 0,
>> +            [ C(RESULT_MISS)   ] = 0,
>> +        },
>> +        [ C(OP_PREFETCH) ] = {
>> +            [ C(RESULT_ACCESS) ] = 0,
>> +            [ C(RESULT_MISS)   ] = 0,
>> +        },
>> +    },
>> +    [ C(L1I) ] = {
>> +        [ C(OP_READ) ] = {
>> +            [ C(RESULT_ACCESS) ] = 0,
>> +            [ C(RESULT_MISS)   ] = 0,
>> +        },
>> +        [ C(OP_WRITE) ] = {
>> +            [ C(RESULT_ACCESS) ] = 0,
>> +            [ C(RESULT_MISS)   ] = -1,
>> +        },
>> +        [ C(OP_PREFETCH) ] = {
>> +            [ C(RESULT_ACCESS) ] = 0,
>> +            [ C(RESULT_MISS)   ] = 0,
>> +        },
>> +    },
>> +    [ C(LL) ] = {
>> +        [ C(OP_READ) ] = {
>> +            [ C(RESULT_ACCESS) ] = 0,
>> +            [ C(RESULT_MISS)   ] = 0,
>> +        },
>> +        [ C(OP_WRITE) ] = {
>> +            [ C(RESULT_ACCESS) ] = 0,
>> +            [ C(RESULT_MISS)   ] = 0,
>> +        },
>> +        [ C(OP_PREFETCH) ] = {
>> +            [ C(RESULT_ACCESS) ] = 0,
>> +            [ C(RESULT_MISS)   ] = 0,
>> +        },
>> +    },
>> +    [ C(DTLB) ] = {
>> +        [ C(OP_READ) ] = {
>> +            [ C(RESULT_ACCESS) ] = 0,
>> +            [ C(RESULT_MISS)   ] = 0,
>> +        },
>> +        [ C(OP_WRITE) ] = {
>> +            [ C(RESULT_ACCESS) ] = -1,
>> +            [ C(RESULT_MISS)   ] = -1,
>> +        },
>> +        [ C(OP_PREFETCH) ] = {
>> +            [ C(RESULT_ACCESS) ] = -1,
>> +            [ C(RESULT_MISS)   ] = -1,
>> +        },
>> +    },
>> +    [ C(ITLB) ] = {
>> +        [ C(OP_READ) ] = {
>> +            [ C(RESULT_ACCESS) ] = 0,
>> +            [ C(RESULT_MISS)   ] = 0,
>> +        },
>> +        [ C(OP_WRITE) ] = {
>> +            [ C(RESULT_ACCESS) ] = -1,
>> +            [ C(RESULT_MISS)   ] = -1,
>> +        },
>> +        [ C(OP_PREFETCH) ] = {
>> +            [ C(RESULT_ACCESS) ] = -1,
>> +            [ C(RESULT_MISS)   ] = -1,
>> +        },
>> +    },
>> +    [ C(BPU) ] = {
>> +        [ C(OP_READ) ] = {
>> +            [ C(RESULT_ACCESS) ] = 0,
>> +            [ C(RESULT_MISS)   ] = 0,
>> +        },
>> +        [ C(OP_WRITE) ] = {
>> +            [ C(RESULT_ACCESS) ] = -1,
>> +            [ C(RESULT_MISS)   ] = -1,
>> +        },
>> +        [ C(OP_PREFETCH) ] = {
>> +            [ C(RESULT_ACCESS) ] = -1,
>> +            [ C(RESULT_MISS)   ] = -1,
>> +        },
>> +    },
>> +    [ C(NODE) ] = {
>> +        [ C(OP_READ) ] = {
>> +            [ C(RESULT_ACCESS) ] = -1,
>> +            [ C(RESULT_MISS)   ] = -1,
>> +        },
>> +        [ C(OP_WRITE) ] = {
>> +            [ C(RESULT_ACCESS) ] = -1,
>> +            [ C(RESULT_MISS)   ] = -1,
>> +        },
>> +        [ C(OP_PREFETCH) ] = {
>> +            [ C(RESULT_ACCESS) ] = -1,
>> +            [ C(RESULT_MISS)   ] = -1,
>> +        },
>> +    },
>> +};
>> +
>> +#undef C
>> +
>> +static struct power_pmu generic_compat_pmu = {
>> +    .name            = "GENERIC_COMPAT",
>> +    .n_counter        = MAX_PMU_COUNTERS,
>> +    .add_fields        = ISA207_ADD_FIELDS,
>> +    .test_adder        = ISA207_TEST_ADDER,
>> +    .compute_mmcr        = isa207_compute_mmcr,
>> +    .get_constraint        = isa207_get_constraint,
>> +    .disable_pmc        = isa207_disable_pmc,
>> +    .flags            = PPMU_HAS_SIER | PPMU_ARCH_207S,
>> +    .n_generic        = ARRAY_SIZE(compat_generic_events),
>> +    .generic_events        = compat_generic_events,
>> +    .cache_events        = &generic_compat_cache_events,
>> +    .attr_groups        = generic_compat_pmu_attr_groups,
>> +};
>> +
>> +int init_generic_compat_pmu(void)
>> +{
>> +    int rc = 0;
>> +
>> +    rc = register_power_pmu(&generic_compat_pmu);
>> +    if (rc)
>> +        return rc;
>> +
>> +    /* Tell userspace that EBB is supported */
>> +    cur_cpu_spec->cpu_user_features2 |= PPC_FEATURE2_EBB;
>> +
>> +    return 0;
>> +}
>> diff --git a/arch/powerpc/perf/internal.h b/arch/powerpc/perf/internal.h
>> index e54d524d4283..185a40d1adff 100644
>> --- a/arch/powerpc/perf/internal.h
>> +++ b/arch/powerpc/perf/internal.h
>> @@ -14,3 +14,4 @@ extern int init_power6_pmu(void);
>>   extern int init_power7_pmu(void);
>>   extern int init_power8_pmu(void);
>>   extern int init_power9_pmu(void);
>> +extern int init_generic_compat_pmu(void);
>
> Don't use 'extern' keyword.
>
> Christophe
>

