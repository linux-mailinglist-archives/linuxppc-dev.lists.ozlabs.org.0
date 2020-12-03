Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFD42CCEA6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 06:29:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmktB1SlyzDqL8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 16:29:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gmBGhOgc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cmkr664C1zDrPQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 16:27:50 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B3531ql112743; Thu, 3 Dec 2020 00:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=OhfKcwxM5ue5lV34QJQhw3t/ick4L4CDayj/uOkinec=;
 b=gmBGhOgc27X9CBKkwqbZ4oipMjGxXHBEnK3FRnNT4uR2rfSjiKluND04rmiicG6FZvaY
 rnbbrCLprhbRih8o4PjtboASJwVbm6Szrui6q/48qkL3++0rj/OYRiSrZCk4FEYFuAje
 4YJhf+r6htc50o2xL3YTL/nhwk15jsCeCqB0zLz5u77htqEoP42Idld3TL9ObjBFC0wk
 F5M+v5G3Bx/ycsU+MhWuWJ1AvGcGptI30d5T4/tUdmdTLLFnDURP0IAr5af8Vbz3LZr8
 jADHuOVMjPE813RvzoQIqF/s86zsmWS4+sXvLYckTPRibeklxWEmxMw5Sgfd7TyglaLQ Ug== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 356p2kmr7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 00:27:43 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B35LBPn029318;
 Thu, 3 Dec 2020 05:27:41 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 353e68ahqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 05:27:41 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B35RdIE9437800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Dec 2020 05:27:39 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3039CA405F;
 Thu,  3 Dec 2020 05:27:39 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 913D7A405B;
 Thu,  3 Dec 2020 05:27:37 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.85.68.189])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  3 Dec 2020 05:27:37 +0000 (GMT)
Subject: Re: [PATCH kernel] powerpc/perf: Stop crashing with generic_compat_pmu
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20200602025612.62707-1-aik@ozlabs.ru>
 <c3852667-210c-48de-7f89-a06250b4df05@linux.ibm.com>
 <848255d6-5c8f-d4c2-a865-e3a7ffce7fdb@ozlabs.ru>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <b7b928ed-f338-cc5d-9045-d783bc85cfec@linux.ibm.com>
Date: Thu, 3 Dec 2020 10:57:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <848255d6-5c8f-d4c2-a865-e3a7ffce7fdb@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_01:2020-11-30,
 2020-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1011
 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030030
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 12/2/20 8:31 AM, Alexey Kardashevskiy wrote:
> Hi Maddy,
>
> I just noticed that I still have "powerpc/perf: Add checks for 
> reserved values" in my pile (pushed here 
> https://github.com/aik/linux/commit/61e1bc3f2e19d450e2e2d39174d422160b21957b 
> ), do we still need it? The lockups I saw were fixed by 
> https://github.com/aik/linux/commit/17899eaf88d689 but it is hardly a 
> replacement. Thanks,

sorry missed this. Will look at this again. Since we will need 
generation specific checks for the reserve field.

Maddy

>
>
> On 04/06/2020 02:34, Madhavan Srinivasan wrote:
>>
>>
>> On 6/2/20 8:26 AM, Alexey Kardashevskiy wrote:
>>> The bhrb_filter_map ("The  Branch History  Rolling  Buffer") 
>>> callback is
>>> only defined in raw CPUs' power_pmu structs. The "architected" CPUs use
>>> generic_compat_pmu which does not have this callback and crashed occur.
>>>
>>> This add a NULL pointer check for bhrb_filter_map() which behaves as if
>>> the callback returned an error.
>>>
>>> This does not add the same check for config_bhrb() as the only caller
>>> checks for cpuhw->bhrb_users which remains zero if bhrb_filter_map==0.
>>
>> Changes looks fine.
>> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>>
>> The commit be80e758d0c2e ('powerpc/perf: Add generic compat mode pmu 
>> driver')
>> which introduced generic_compat_pmu was merged in v5.2.  So we need to
>> CC stable starting from 5.2 :( .  My bad,  sorry.
>>
>> Maddy
>>
>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>> ---
>>>   arch/powerpc/perf/core-book3s.c | 19 ++++++++++++++-----
>>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/arch/powerpc/perf/core-book3s.c 
>>> b/arch/powerpc/perf/core-book3s.c
>>> index 3dcfecf858f3..36870569bf9c 100644
>>> --- a/arch/powerpc/perf/core-book3s.c
>>> +++ b/arch/powerpc/perf/core-book3s.c
>>> @@ -1515,9 +1515,16 @@ static int power_pmu_add(struct perf_event 
>>> *event, int ef_flags)
>>>       ret = 0;
>>>    out:
>>>       if (has_branch_stack(event)) {
>>> -        power_pmu_bhrb_enable(event);
>>> -        cpuhw->bhrb_filter = ppmu->bhrb_filter_map(
>>> -                    event->attr.branch_sample_type);
>>> +        u64 bhrb_filter = -1;
>>> +
>>> +        if (ppmu->bhrb_filter_map)
>>> +            bhrb_filter = ppmu->bhrb_filter_map(
>>> +                event->attr.branch_sample_type);
>>> +
>>> +        if (bhrb_filter != -1) {
>>> +            cpuhw->bhrb_filter = bhrb_filter;
>>> +            power_pmu_bhrb_enable(event); /* Does bhrb_users++ */
>>> +        }
>>>       }
>>>
>>>       perf_pmu_enable(event->pmu);
>>> @@ -1839,7 +1846,6 @@ static int power_pmu_event_init(struct 
>>> perf_event *event)
>>>       int n;
>>>       int err;
>>>       struct cpu_hw_events *cpuhw;
>>> -    u64 bhrb_filter;
>>>
>>>       if (!ppmu)
>>>           return -ENOENT;
>>> @@ -1945,7 +1951,10 @@ static int power_pmu_event_init(struct 
>>> perf_event *event)
>>>       err = power_check_constraints(cpuhw, events, cflags, n + 1);
>>>
>>>       if (has_branch_stack(event)) {
>>> -        bhrb_filter = ppmu->bhrb_filter_map(
>>> +        u64 bhrb_filter = -1;
>>> +
>>> +        if (ppmu->bhrb_filter_map)
>>> +            bhrb_filter = ppmu->bhrb_filter_map(
>>>                       event->attr.branch_sample_type);
>>>
>>>           if (bhrb_filter == -1) {
>>
>
