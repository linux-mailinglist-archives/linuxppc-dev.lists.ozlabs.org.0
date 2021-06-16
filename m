Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B9F3A92B1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 08:34:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4b4v446Pz3cXj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 16:34:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IZzRXtYy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IZzRXtYy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4b4R2py2z2xfk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 16:33:58 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15G65XpW092115; Wed, 16 Jun 2021 02:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ajVip0vQkdHhNzhjP590OZcCAUY5z1V68tkVrJlc1QI=;
 b=IZzRXtYyYLH9wu+5dNiJAoT4VOvkpjzSAH5Qb53lYqP84xsf6xMghOXduFfeovUwgp8Z
 337EVn6w7NrJurwzDpai7ybR/alTRNrpS2zCf4XYkzPCN6mD6LLQ0n0Cc6WlPFw9eTLQ
 KzvqUK7KhNCdPeQ4RN/neZN/wwQHqqfvp4WtaeMAIFNHBprIc04W7EyQ+wAGL9wWQ1U8
 KDt6JaPjVKt3DpSPKELRU/Pgt5ZUAtW8wcRUp2m5YkNUeFv9Q5KXnDvY0WmWajglpI9N
 kvFqMhgHNeb7cGt5+4QPyqyldXb+Hq9pu+VxBe0gOrkbHjizMXjNAY0+Tuw2y42xp4Mi wg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 397bn58rc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 02:33:50 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15G6Waps010402;
 Wed, 16 Jun 2021 06:33:48 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 394mj911wt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 06:33:48 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15G6Xk4b28246418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 06:33:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 079C142045;
 Wed, 16 Jun 2021 06:33:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34E9F42042;
 Wed, 16 Jun 2021 06:33:45 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.85.68.172])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Jun 2021 06:33:44 +0000 (GMT)
Subject: Re: Oops (NULL pointer) with 'perf record' of selftest 'null_syscall'
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>
References: <c141a18c-b18d-b775-1848-527c35a1c433@csgroup.eu>
 <3388922c-0224-e4aa-f7b7-4fea43e060f9@linux.ibm.com>
 <6102EF12-AFB2-48B1-B707-D3F5471EADDB@linux.vnet.ibm.com>
 <bc2dac10-9e60-e4b7-c376-5ed00f6e227c@csgroup.eu>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <f271b0de-20ce-76e2-9c95-921783f111b4@linux.ibm.com>
Date: Wed, 16 Jun 2021 12:03:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <bc2dac10-9e60-e4b7-c376-5ed00f6e227c@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: h3nK61V8y_93MSeRGlaC9GuDyJzTwbQQ
X-Proofpoint-ORIG-GUID: h3nK61V8y_93MSeRGlaC9GuDyJzTwbQQ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_09:2021-06-15,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 mlxscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106160037
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 6/16/21 11:56 AM, Christophe Leroy wrote:
>
>
> Le 16/06/2021 à 05:40, Athira Rajeev a écrit :
>>
>>
>>> On 16-Jun-2021, at 8:53 AM, Madhavan Srinivasan 
>>> <maddy@linux.ibm.com> wrote:
>>>
>>>
>>> On 6/15/21 8:35 PM, Christophe Leroy wrote:
>>>> For your information, I'm getting the following Oops. Detected with 
>>>> 5.13-rc6, it also oopses on 5.12 and 5.11.
>>>> Runs ok on 5.10. I'm starting bisecting now.
>>>
>>>
>>> Thanks for reporting, got the issue. What has happened in this case 
>>> is that, pmu device is not registered
>>> and trying to access the instruction point which will land in 
>>> perf_instruction_pointer(). And recently I have added
>>> a workaround patch for power10 DD1 which has caused this breakage. 
>>> My bad. We are working on a fix patch
>>> for the same and will post it out. Sorry again.
>>>
>>
>> Hi Christophe,
>>
>> Can you please try with below patch in your environment and test if 
>> it works for you.
>>
>>  From 55d3afc9369dfbe28a7152c8e9f856c11c7fe43d Mon Sep 17 00:00:00 2001
>> From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> Date: Tue, 15 Jun 2021 22:28:11 -0400
>> Subject: [PATCH] powerpc/perf: Fix crash with 
>> 'perf_instruction_pointer' when
>>   pmu is not set
>>
>> On systems without any specific PMU driver support registered, running
>> perf record causes oops:
>>
>> [   38.841073] NIP [c00000000013af54] 
>> perf_instruction_pointer+0x24/0x100
>> [   38.841079] LR [c0000000003c7358] perf_prepare_sample+0x4e8/0x820
>> [   38.841085] --- interrupt: 300
>> [   38.841088] [c00000001cf03440] [c0000000003c6ef8] 
>> perf_prepare_sample+0x88/0x820 (unreliable)
>> [   38.841096] [c00000001cf034a0] [c0000000003c76d0] 
>> perf_event_output_forward+0x40/0xc0
>> [   38.841104] [c00000001cf03520] [c0000000003b45e8] 
>> __perf_event_overflow+0x88/0x1b0
>> [   38.841112] [c00000001cf03570] [c0000000003b480c] 
>> perf_swevent_hrtimer+0xfc/0x1a0
>> [   38.841119] [c00000001cf03740] [c0000000002399cc] 
>> __hrtimer_run_queues+0x17c/0x380
>> [   38.841127] [c00000001cf037c0] [c00000000023a5f8] 
>> hrtimer_interrupt+0x128/0x2f0
>> [   38.841135] [c00000001cf03870] [c00000000002962c] 
>> timer_interrupt+0x13c/0x370
>> [   38.841143i] [c00000001cf038d0] [c000000000009ba4] 
>> decrementer_common_virt+0x1a4/0x1b0
>> [   38.841151] --- interrupt: 900 at copypage_power7+0xd4/0x1c0
>>
>> During perf record session, perf_instruction_pointer() is called to
>> capture the sample ip. This function in core-book3s accesses 
>> ppmu->flags.
>> If a platform specific PMU driver is not registered, ppmu is set to NULL
>> and accessing its members results in a crash. Fix this crash by checking
>> if ppmu is set.
>>
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>
> Fixes: 2ca13a4cc56c ("powerpc/perf: Use regs->nip when SIAR is zero")
> Cc: stable@vger.kernel.org
> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Thanks, but just wonder what is the system config and processor version 
in which you got this fail.
Reason, we do have generic-pmu which should kick-in in absence of a 
platform specific driver.

Maddy
>
>> ---
>>   arch/powerpc/perf/core-book3s.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/perf/core-book3s.c 
>> b/arch/powerpc/perf/core-book3s.c
>> index 16d4d1b6a1ff..816756588cb7 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -2254,7 +2254,7 @@ unsigned long perf_instruction_pointer(struct 
>> pt_regs *regs)
>>       bool use_siar = regs_use_siar(regs);
>>       unsigned long siar = mfspr(SPRN_SIAR);
>>   -    if (ppmu->flags & PPMU_P10_DD1) {
>> +    if (ppmu && ppmu->flags & PPMU_P10_DD1) {
>>           if (siar)
>>               return siar;
>>           else
>>
