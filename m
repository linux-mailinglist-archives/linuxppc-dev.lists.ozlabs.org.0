Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4C23EE884
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 10:30:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpkkT5Mhyz3cHQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 18:30:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vs8WgmE+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Vs8WgmE+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gpkjk5Bl9z2yNl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 18:30:01 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17H82bov099616; Tue, 17 Aug 2021 04:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=kAdgIk6seugDotwoK1ciqHj7rSU/UsS84ePWF5N8LMQ=;
 b=Vs8WgmE+rGd0jnVOyinCvIIHr3W+PzoTYWuXNV1M0fDwIxPNauDR6nD+nWgFaasob+Qo
 s0SIcdSlYuemRMkyVgqB9Eq4ovrGg6sRR6z3whePJ2gE3cFdqiecBEEa83NW6e3c8kw/
 RkJfJH/TWITo+5n5KsJWZ65+EHt2oG+dVg/zude4p2+fnxQWd9GwFR5zFp8nEmwKyQv9
 M5Qp7vHBsm2CwfIeJdKMqILFgLZjzbNSG/ID5jD0njySIbIWi5vQxz5EGfMAv5/piL7p
 XvPNY34OklyquaIQFtZJ05CsMop9vCBPlkKW7cFJIvn1gVpbJ/uR7jQos/alzdXe0VrT tg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aeucth98k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Aug 2021 04:29:48 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17H8QsVQ026745;
 Tue, 17 Aug 2021 08:29:48 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 3ae5fc5ht0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Aug 2021 08:29:48 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17H8TkUk51184026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Aug 2021 08:29:46 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93E1478067;
 Tue, 17 Aug 2021 08:29:46 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81E5E7805F;
 Tue, 17 Aug 2021 08:29:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.39.237])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 17 Aug 2021 08:29:40 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] powerpc/perf: Return regs->nip as instruction
 pointer value when SIAR is 0
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210813082450.429320-1-kjain@linux.ibm.com>
 <20210813082450.429320-2-kjain@linux.ibm.com>
 <c6110aa1-90e2-77aa-1ab5-355975037227@csgroup.eu>
 <871r6wmc16.fsf@mpe.ellerman.id.au>
 <0068dbc4-fa4b-ce98-9e89-3f02f939720d@linux.ibm.com>
 <3a34c79d-b800-1a11-7a4b-1fb3babb9df1@csgroup.eu>
 <a6217bc6-e69d-0f8a-5e85-1d776175caf7@linux.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <124b4a19-c78d-228f-76d4-c99a6ffd46e4@linux.ibm.com>
Date: Tue, 17 Aug 2021 13:59:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <a6217bc6-e69d-0f8a-5e85-1d776175caf7@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VYHS2oZkWawn389mv4ZG0MiVPbfk184t
X-Proofpoint-GUID: VYHS2oZkWawn389mv4ZG0MiVPbfk184t
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-17_02:2021-08-16,
 2021-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108170052
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
Cc: atrajeev@linux.vnet.ibm.com,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/17/21 11:07 AM, Madhavan Srinivasan wrote:
> 
> On 8/16/21 12:26 PM, Christophe Leroy wrote:
>>
>>
>> Le 16/08/2021 à 08:44, kajoljain a écrit :
>>>
>>>
>>> On 8/14/21 6:14 PM, Michael Ellerman wrote:
>>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>>> Le 13/08/2021 à 10:24, Kajol Jain a écrit :
>>>>>> Incase of random sampling, there can be scenarios where SIAR is not
>>>>>> latching sample address and results in 0 value. Since current code
>>>>>> directly returning the siar value, we could see multiple instruction
>>>>>> pointer values as 0 in perf report.
>>>>
>>>> Can you please give more detail on that? What scenarios? On what CPUs?
>>>>
>>>
>>> Hi Michael,
>>>      Sure I will update these details in my next patch-set.
>>>
>>>>>> Patch resolves this issue by adding a ternary condition to return
>>>>>> regs->nip incase SIAR is 0.
>>>>>
>>>>> Your description seems rather similar to
>>>>> https://github.com/linuxppc/linux/commit/2ca13a4cc56c920a6c9fc8ee45d02bccacd7f46c
>>>>>
>>>>> Does it mean that the problem occurs on more than the power10 DD1 ?
>>>>>
>>>>> In that case, can the solution be common instead of doing something for power10 DD1 and something
>>>>> for others ?
>>>>
>>>> Agreed.
>>>>
>>>> This change would seem to make that P10 DD1 logic superfluous.
>>>>
>>>> Also we already have a fallback to regs->nip in the else case of the if,
>>>> so we should just use that rather than adding a ternary condition.
>>>>
>>>> eg.
>>>>
>>>>     if (use_siar && siar_valid(regs) && siar)
>>>>         return siar + perf_ip_adjust(regs);
>>>>     else if (use_siar)
>>>>         return 0;        // no valid instruction pointer
>>>>     else
>>>>         return regs->nip;
>>>>
>>>>
>>>> I'm also not sure why we have that return 0 case, I can't think of why
>>>> we'd ever want to do that rather than using nip. So maybe we should do
>>>> another patch to drop that case.
>>>
>>> Yeah make sense. I will remove return 0 case in my next version.
>>>
>>
>> This was added by commit https://github.com/linuxppc/linux/commit/e6878835ac4794f25385522d29c634b7bbb7cca9
>>
>> Are we sure it was an error to add it and it can be removed ?
> 
> pc having 0 is wrong (kernel does not execute at 0x0 or userspace).
> yeah we should drop it.

Hi Madhavan,
    Sure I will add another patch to drop return 0 condition.

Thanks,
Kajol jain
> 
> Maddy
>>
>> Christophe
