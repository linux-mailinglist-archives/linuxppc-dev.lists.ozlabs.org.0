Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8FA3EA55E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 15:21:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlnQb5WVxz3cPN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 23:21:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E/MgQvy9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=E/MgQvy9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlnPG49qWz308y
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 23:20:33 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17CD4qvT116663; Thu, 12 Aug 2021 09:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+NLRzFF3XeN1A+9E2OkCISkvtZz5GOpfsquSBeIvd3Q=;
 b=E/MgQvy9UyjkB2cQyKiEk2QIXoATeel8i4qbGz0p2J2xhjBfsZW4HCNwHIBgJQYM2Awy
 cL04x90aaLQfzsKt48Bjj3YLM1LamxMgfbiwa36RmtikWZ4GTDGJmyLmOGm9QF+x13Qp
 qU0vFYH+/e4WcSEmNRD2TNOpQJlLqIyg3Sb+3v7FtziP3g8LGV3xq8w2q6jUa0stU8pW
 McOrDmJAWo5WoO5tX9suZ7yS0ArIGz9bfLn9UoJR/qtwOp5G9gFcif8QKSb9imSj7Nmf
 C2AgaEqtd7CtLMajWIeLvlI1Z6HCiI3GfhBH0pdnw0wYEdohDofl26KhLu+QhwgkykzB Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3acstnsxcs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Aug 2021 09:20:20 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17CD4vAr117326;
 Thu, 12 Aug 2021 09:20:20 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3acstnsxbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Aug 2021 09:20:20 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17CDBrTG023323;
 Thu, 12 Aug 2021 13:20:18 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3acn769qjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Aug 2021 13:20:18 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17CDH1tC15860120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Aug 2021 13:17:01 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49C334C082;
 Thu, 12 Aug 2021 13:20:13 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E1C94C046;
 Thu, 12 Aug 2021 13:20:12 +0000 (GMT)
Received: from [9.199.50.186] (unknown [9.199.50.186])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 12 Aug 2021 13:20:12 +0000 (GMT)
Subject: Re: [RFC PATCH] powerpc/book3s64/radix: Upgrade va tlbie to PID tlbie
 if we cross PMD_SIZE
To: Michael Ellerman <mpe@ellerman.id.au>,
 Puvichakravarthy Ramachandran <puvichakravarthy@in.ibm.com>
References: <OFAE67F802.E3873360-ON00258729.0020407B-65258729.002BAB12@ibm.com>
 <87fsven7yv.fsf@mpe.ellerman.id.au>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <c157f9c9-d340-24f7-1aa0-40bbd4e1386e@linux.ibm.com>
Date: Thu, 12 Aug 2021 18:50:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87fsven7yv.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uDAL2LDYDGQh_v5MwTP_Ob9G5nvl1Tye
X-Proofpoint-ORIG-GUID: qFQaOtFRzt5acmfv4ohIsRIKAq5k__o2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-12_04:2021-08-12,
 2021-08-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 impostorscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108120085
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/12/21 6:19 PM, Michael Ellerman wrote:
> "Puvichakravarthy Ramachandran" <puvichakravarthy@in.ibm.com> writes:
>>> With shared mapping, even though we are unmapping a large range, the kernel
>>> will force a TLB flush with ptl lock held to avoid the race mentioned in
>>> commit 1cf35d47712d ("mm: split 'tlb_flush_mmu()' into tlb flushing and memory freeing parts")
>>> This results in the kernel issuing a high number of TLB flushes even for a large
>>> range. This can be improved by making sure the kernel switch to pid based flush if the
>>> kernel is unmapping a 2M range.
>>>
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>>   arch/powerpc/mm/book3s64/radix_tlb.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c > b/arch/powerpc/mm/book3s64/radix_tlb.c
>>> index aefc100d79a7..21d0f098e43b 100644
>>> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
>>> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
>>> @@ -1106,7 +1106,7 @@ EXPORT_SYMBOL(radix__flush_tlb_kernel_range);
>>>    * invalidating a full PID, so it has a far lower threshold to change > from
>>>    * individual page flushes to full-pid flushes.
>>>    */
>>> -static unsigned long tlb_single_page_flush_ceiling __read_mostly = 33;
>>> +static unsigned long tlb_single_page_flush_ceiling __read_mostly = 32;
>>>   static unsigned long tlb_local_single_page_flush_ceiling __read_mostly > = POWER9_TLB_SETS_RADIX * 2;
>>>
>>>   static inline void __radix__flush_tlb_range(struct mm_struct *mm,
>>> @@ -1133,7 +1133,7 @@ static inline void __radix__flush_tlb_range(struct > mm_struct *mm,
>>>        if (fullmm)
>>>                flush_pid = true;
>>>        else if (type == FLUSH_TYPE_GLOBAL)
>>> -             flush_pid = nr_pages > tlb_single_page_flush_ceiling;
>>> +             flush_pid = nr_pages >= tlb_single_page_flush_ceiling;
>>>        else
>>>                flush_pid = nr_pages > tlb_local_single_page_flush_ceiling;
>>
>> Additional details on the test environment. This was tested on a 2 Node/8
>> socket Power10 system.
>> The LPAR had 105 cores and the LPAR spanned across all the sockets.
>>
>> # perf stat -I 1000 -a -e cycles,instructions -e
>> "{cpu/config=0x030008,name=PM_EXEC_STALL/}" -e
>> "{cpu/config=0x02E01C,name=PM_EXEC_STALL_TLBIE/}" ./tlbie -i 10 -c 1  -t 1
>>   Rate of work: = 176
>> #           time             counts unit events
>>       1.029206442         4198594519      cycles
>>       1.029206442         2458254252      instructions              # 0.59 insn per cycle
>>       1.029206442         3004031488      PM_EXEC_STALL
>>       1.029206442         1798186036      PM_EXEC_STALL_TLBIE
>>   Rate of work: = 181
>>       2.054288539         4183883450      cycles
>>       2.054288539         2472178171      instructions              # 0.59 insn per cycle
>>       2.054288539         3014609313      PM_EXEC_STALL
>>       2.054288539         1797851642      PM_EXEC_STALL_TLBIE
>>   Rate of work: = 180
>>       3.078306883         4171250717      cycles
>>       3.078306883         2468341094      instructions              # 0.59 insn per cycle
>>       3.078306883         2993036205      PM_EXEC_STALL
>>       3.078306883         1798181890      PM_EXEC_STALL_TLBIE
>> .
>> .
>>
>> # cat /sys/kernel/debug/powerpc/tlb_single_page_flush_ceiling
>> 34
>>
>> # echo 32 > /sys/kernel/debug/powerpc/tlb_single_page_flush_ceiling
>>
>> # perf stat -I 1000 -a -e cycles,instructions -e
>> "{cpu/config=0x030008,name=PM_EXEC_STALL/}" -e
>> "{cpu/config=0x02E01C,name=PM_EXEC_STALL_TLBIE/}" ./tlbie -i 10 -c 1  -t 1
>>   Rate of work: = 313
>> #           time             counts unit events
>>       1.030310506         4206071143      cycles
>>       1.030310506         4314716958      instructions              # 1.03 insn per cycle
>>       1.030310506         2157762167      PM_EXEC_STALL
>>       1.030310506          110825573      PM_EXEC_STALL_TLBIE
>>   Rate of work: = 322
>>       2.056034068         4331745630      cycles
>>       2.056034068         4531658304      instructions              # 1.05 insn per cycle
>>       2.056034068         2288971361      PM_EXEC_STALL
>>       2.056034068          111267927      PM_EXEC_STALL_TLBIE
>>   Rate of work: = 321
>>       3.081216434         4327050349      cycles
>>       3.081216434         4379679508      instructions              # 1.01 insn per cycle
>>       3.081216434         2252602550      PM_EXEC_STALL
>>       3.081216434          110974887      PM_EXEC_STALL_TLBIE
> 
> 
> What is the tlbie test actually doing?
> 
> Does it do anything to measure the cost of refilling after the full mm flush?
> 


That is essentially

for ()
{
   shmat()
   fillshm()
   shmdt()

}

for a 256MB range. So it is not really a fair benchmark because it 
doesn't take into account the impact of throwing away the full pid 
translation. But even then the TLBIE stalls is an important data point?

-aneesh


