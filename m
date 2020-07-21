Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A662279E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 09:53:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9rSD6MSdzDqbx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 17:53:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9rQK437xzDqX1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 17:51:37 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06L72le6146267; Tue, 21 Jul 2020 03:51:26 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32dn0xu58e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 03:51:26 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06L73TAS148956;
 Tue, 21 Jul 2020 03:51:25 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32dn0xu57h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 03:51:25 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06L7okta007505;
 Tue, 21 Jul 2020 07:51:23 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 32brq83m0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 07:51:23 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06L7pK5058392634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 07:51:20 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6009E4C04A;
 Tue, 21 Jul 2020 07:51:20 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E39D14C046;
 Tue, 21 Jul 2020 07:51:16 +0000 (GMT)
Received: from [9.199.47.202] (unknown [9.199.47.202])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jul 2020 07:51:16 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v4 05/10] powerpc/dt_cpu_ftrs: Add feature for 2nd DAWR
To: Jordan Niethe <jniethe5@gmail.com>
References: <20200717040958.70561-1-ravi.bangoria@linux.ibm.com>
 <20200717040958.70561-6-ravi.bangoria@linux.ibm.com>
 <CACzsE9oE+OMnWEXvbZZbq35YzpSzCbBHWEJcjtCgkcq-YrABng@mail.gmail.com>
Message-ID: <c34b1a66-2db6-c97a-1782-0d473c758502@linux.ibm.com>
Date: Tue, 21 Jul 2020 13:21:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACzsE9oE+OMnWEXvbZZbq35YzpSzCbBHWEJcjtCgkcq-YrABng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_02:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007210048
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, apopple@linux.ibm.com,
 mikey@neuling.org, miltonm@us.ibm.com, peterz@infradead.org, oleg@redhat.com,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, jolsa@kernel.org, fweisbec@gmail.com,
 pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/17/20 11:14 AM, Jordan Niethe wrote:
> On Fri, Jul 17, 2020 at 2:10 PM Ravi Bangoria
> <ravi.bangoria@linux.ibm.com> wrote:
>>
>> Add new device-tree feature for 2nd DAWR. If this feature is present,
>> 2nd DAWR is supported, otherwise not.
>>
>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/cputable.h | 7 +++++--
>>   arch/powerpc/kernel/dt_cpu_ftrs.c   | 7 +++++++
>>   2 files changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
>> index e506d429b1af..3445c86e1f6f 100644
>> --- a/arch/powerpc/include/asm/cputable.h
>> +++ b/arch/powerpc/include/asm/cputable.h
>> @@ -214,6 +214,7 @@ static inline void cpu_feature_keys_init(void) { }
>>   #define CPU_FTR_P9_TLBIE_ERAT_BUG      LONG_ASM_CONST(0x0001000000000000)
>>   #define CPU_FTR_P9_RADIX_PREFETCH_BUG  LONG_ASM_CONST(0x0002000000000000)
>>   #define CPU_FTR_ARCH_31                        LONG_ASM_CONST(0x0004000000000000)
>> +#define CPU_FTR_DAWR1                  LONG_ASM_CONST(0x0008000000000000)
>>
>>   #ifndef __ASSEMBLY__
>>
>> @@ -497,14 +498,16 @@ static inline void cpu_feature_keys_init(void) { }
>>   #define CPU_FTRS_POSSIBLE      \
>>              (CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | CPU_FTRS_POWER8 | \
>>               CPU_FTR_ALTIVEC_COMP | CPU_FTR_VSX_COMP | CPU_FTRS_POWER9 | \
>> -            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
>> +            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10 | \
>> +            CPU_FTR_DAWR1)
>>   #else
>>   #define CPU_FTRS_POSSIBLE      \
>>              (CPU_FTRS_PPC970 | CPU_FTRS_POWER5 | \
>>               CPU_FTRS_POWER6 | CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | \
>>               CPU_FTRS_POWER8 | CPU_FTRS_CELL | CPU_FTRS_PA6T | \
>>               CPU_FTR_VSX_COMP | CPU_FTR_ALTIVEC_COMP | CPU_FTRS_POWER9 | \
>> -            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
>> +            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10 | \
>> +            CPU_FTR_DAWR1)
> Instead of putting CPU_FTR_DAWR1 into CPU_FTRS_POSSIBLE should it go
> into CPU_FTRS_POWER10?
> Then it will be picked up by CPU_FTRS_POSSIBLE.

I remember a discussion about this with Mikey and we decided to do it
this way. Obviously, the purpose is to make CPU_FTR_DAWR1 independent of
CPU_FTRS_POWER10 because DAWR1 is an optional feature in p10. I fear
including CPU_FTR_DAWR1 in CPU_FTRS_POWER10 can make it forcefully enabled
even when device-tree property is not present or pa-feature bit it not set,
because we do:

       {       /* 3.1-compliant processor, i.e. Power10 "architected" mode */
               .pvr_mask               = 0xffffffff,
               .pvr_value              = 0x0f000006,
               .cpu_name               = "POWER10 (architected)",
               .cpu_features           = CPU_FTRS_POWER10,

>>   #endif /* CONFIG_CPU_LITTLE_ENDIAN */
>>   #endif
>>   #else
>> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
>> index ac650c233cd9..c78cd3596ec4 100644
>> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
>> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
>> @@ -574,6 +574,12 @@ static int __init feat_enable_mma(struct dt_cpu_feature *f)
>>          return 1;
>>   }
>>
>> +static int __init feat_enable_debug_facilities_v31(struct dt_cpu_feature *f)
>> +{
>> +       cur_cpu_spec->cpu_features |= CPU_FTR_DAWR1;
>> +       return 1;
>> +}
>> +
>>   struct dt_cpu_feature_match {
>>          const char *name;
>>          int (*enable)(struct dt_cpu_feature *f);
>> @@ -649,6 +655,7 @@ static struct dt_cpu_feature_match __initdata
>>          {"wait-v3", feat_enable, 0},
>>          {"prefix-instructions", feat_enable, 0},
>>          {"matrix-multiply-assist", feat_enable_mma, 0},
>> +       {"debug-facilities-v31", feat_enable_debug_facilities_v31, 0},
> Since all feat_enable_debug_facilities_v31() does is set
> CPU_FTR_DAWR1, if you just have:
> {"debug-facilities-v31", feat_enable, CPU_FTR_DAWR1},
> I think cpufeatures_process_feature() should set it in for you at this point:
>              if (m->enable(f)) {
>                  cur_cpu_spec->cpu_features |= m->cpu_ftr_bit_mask;
>                  break;
>              }

Yes, that seems a better option.

Thanks,
Ravi
