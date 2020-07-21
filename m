Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF9D2281E0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 16:19:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB12J4xRwzDqf5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 00:19:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB0zW3Sw4zDqVl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 00:17:27 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06LEABH9056421; Tue, 21 Jul 2020 10:17:06 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1vurbve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 10:17:06 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06LEBM8G062937;
 Tue, 21 Jul 2020 10:17:05 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1vurbuf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 10:17:05 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06LEBfiP001077;
 Tue, 21 Jul 2020 14:17:03 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 32brbh3wq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 14:17:03 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06LEH0im9830718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 14:17:00 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F4AB4C063;
 Tue, 21 Jul 2020 14:17:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6B6F4C050;
 Tue, 21 Jul 2020 14:16:56 +0000 (GMT)
Received: from [9.199.35.129] (unknown [9.199.35.129])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jul 2020 14:16:56 +0000 (GMT)
Subject: Re: [PATCH v4 05/10] powerpc/dt_cpu_ftrs: Add feature for 2nd DAWR
To: Michael Ellerman <mpe@ellerman.id.au>, Jordan Niethe <jniethe5@gmail.com>
References: <20200717040958.70561-1-ravi.bangoria@linux.ibm.com>
 <20200717040958.70561-6-ravi.bangoria@linux.ibm.com>
 <CACzsE9oE+OMnWEXvbZZbq35YzpSzCbBHWEJcjtCgkcq-YrABng@mail.gmail.com>
 <c34b1a66-2db6-c97a-1782-0d473c758502@linux.ibm.com>
 <87mu3trtri.fsf@mpe.ellerman.id.au>
 <62daa2d1-4e11-dcc1-cb1d-805ee4a156e0@linux.ibm.com>
 <87d04prmgc.fsf@mpe.ellerman.id.au>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <a6654419-2438-7f8a-9094-c3decb53c54f@linux.ibm.com>
Date: Tue, 21 Jul 2020 19:46:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87d04prmgc.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_08:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007210098
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
 mikey@neuling.org, miltonm@us.ibm.com, peterz@infradead.org,
 fweisbec@gmail.com, oleg@redhat.com, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 jolsa@kernel.org, pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/21/20 7:37 PM, Michael Ellerman wrote:
> Ravi Bangoria <ravi.bangoria@linux.ibm.com> writes:
>> On 7/21/20 4:59 PM, Michael Ellerman wrote:
>>> Ravi Bangoria <ravi.bangoria@linux.ibm.com> writes:
>>>> On 7/17/20 11:14 AM, Jordan Niethe wrote:
>>>>> On Fri, Jul 17, 2020 at 2:10 PM Ravi Bangoria
>>>>> <ravi.bangoria@linux.ibm.com> wrote:
>>>>>>
>>>>>> Add new device-tree feature for 2nd DAWR. If this feature is present,
>>>>>> 2nd DAWR is supported, otherwise not.
>>>>>>
>>>>>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>>>>>> ---
>>>>>>     arch/powerpc/include/asm/cputable.h | 7 +++++--
>>>>>>     arch/powerpc/kernel/dt_cpu_ftrs.c   | 7 +++++++
>>>>>>     2 files changed, 12 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
>>>>>> index e506d429b1af..3445c86e1f6f 100644
>>>>>> --- a/arch/powerpc/include/asm/cputable.h
>>>>>> +++ b/arch/powerpc/include/asm/cputable.h
>>>>>> @@ -214,6 +214,7 @@ static inline void cpu_feature_keys_init(void) { }
>>>>>>     #define CPU_FTR_P9_TLBIE_ERAT_BUG      LONG_ASM_CONST(0x0001000000000000)
>>>>>>     #define CPU_FTR_P9_RADIX_PREFETCH_BUG  LONG_ASM_CONST(0x0002000000000000)
>>>>>>     #define CPU_FTR_ARCH_31                        LONG_ASM_CONST(0x0004000000000000)
>>>>>> +#define CPU_FTR_DAWR1                  LONG_ASM_CONST(0x0008000000000000)
>>>>>>
>>>>>>     #ifndef __ASSEMBLY__
>>>>>>
>>>>>> @@ -497,14 +498,16 @@ static inline void cpu_feature_keys_init(void) { }
>>>>>>     #define CPU_FTRS_POSSIBLE      \
>>>>>>                (CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | CPU_FTRS_POWER8 | \
>>>>>>                 CPU_FTR_ALTIVEC_COMP | CPU_FTR_VSX_COMP | CPU_FTRS_POWER9 | \
>>>>>> -            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
>>>>>> +            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10 | \
>>>>>> +            CPU_FTR_DAWR1)
>>>>>>     #else
>>>>>>     #define CPU_FTRS_POSSIBLE      \
>>>>>>                (CPU_FTRS_PPC970 | CPU_FTRS_POWER5 | \
>>>>>>                 CPU_FTRS_POWER6 | CPU_FTRS_POWER7 | CPU_FTRS_POWER8E | \
>>>>>>                 CPU_FTRS_POWER8 | CPU_FTRS_CELL | CPU_FTRS_PA6T | \
>>>>>>                 CPU_FTR_VSX_COMP | CPU_FTR_ALTIVEC_COMP | CPU_FTRS_POWER9 | \
>>>>>> -            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10)
>>>>>> +            CPU_FTRS_POWER9_DD2_1 | CPU_FTRS_POWER9_DD2_2 | CPU_FTRS_POWER10 | \
>>>>>> +            CPU_FTR_DAWR1)
>>>
>>>>> Instead of putting CPU_FTR_DAWR1 into CPU_FTRS_POSSIBLE should it go
>>>>> into CPU_FTRS_POWER10?
>>>>> Then it will be picked up by CPU_FTRS_POSSIBLE.
>>>>
>>>> I remember a discussion about this with Mikey and we decided to do it
>>>> this way. Obviously, the purpose is to make CPU_FTR_DAWR1 independent of
>>>> CPU_FTRS_POWER10 because DAWR1 is an optional feature in p10. I fear
>>>> including CPU_FTR_DAWR1 in CPU_FTRS_POWER10 can make it forcefully enabled
>>>> even when device-tree property is not present or pa-feature bit it not set,
>>>> because we do:
>>>>
>>>>          {       /* 3.1-compliant processor, i.e. Power10 "architected" mode */
>>>>                  .pvr_mask               = 0xffffffff,
>>>>                  .pvr_value              = 0x0f000006,
>>>>                  .cpu_name               = "POWER10 (architected)",
>>>>                  .cpu_features           = CPU_FTRS_POWER10,
>>>
>>> The pa-features logic will turn it off if the feature bit is not set.
>>>
>>> So you should be able to put it in CPU_FTRS_POWER10.
>>>
>>> See for example CPU_FTR_NOEXECUTE.
>>
>> Ah ok. scan_features() clears the feature if the bit is not set in
>> pa-features. So it should work find for powervm. I'll verify the same
>> thing happens in case of baremetal where we use cpu-features not
>> pa-features. If it works in baremetal as well, will put it in
>> CPU_FTRS_POWER10.
> 
> When we use DT CPU features we don't use CPU_FTRS_POWER10 at all.
> 
> We construct a cpu_spec from scratch with just the base set of features:
> 
> static struct cpu_spec __initdata base_cpu_spec = {
> 	.cpu_name		= NULL,
> 	.cpu_features		= CPU_FTRS_DT_CPU_BASE,
> 
> 
> And then individual features are enabled via the device tree flags.

Ah good. I was under a wrong impression that we use cpu_specs[] for all
the cases. Thanks mpe for explaining in detail :)

Ravi
