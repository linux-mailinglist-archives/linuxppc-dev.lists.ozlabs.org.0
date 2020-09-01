Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD73A258B4C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 11:18:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BghMZ5Km6zDqX8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 19:18:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mL06LNAf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BghFd3DMYzDqTY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 19:13:41 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08192lXH006295; Tue, 1 Sep 2020 05:13:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TFYS83nJEN2K1slMIZ0aMGs2NsDKMA/bRY3q+KHMVdA=;
 b=mL06LNAftrBCFfoMMwhf7BhxxdWrVP9lxm1Y+y/aOYKrXoGgmPnlv0mkbsdQpSzMqn49
 ihfCW8+UidgMQ1m3czIUm7jFZstjLkogDbL5W6U06KUp2hZnfJjLOTnd2U8HECsQlYzr
 LuLO+XVNViL/wIhdJz0zSLIb2nHSC+tRWtH/premWTpzSnA8NctETzur1e1b9e14Us3g
 5Jg+AcMWuixZFGqT+EYYex/Us3Y3JNmxKMOrhMgsdfWgfeioLcHf4z/yW5zssHBw6ler
 NbwJL0pR0sBqah3c0kLMqyjevC34n5Idb9smu7IRrA5fwy9JonRuAAZHbCa7ZoAmEWe+ og== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 339k2a8tbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 05:13:23 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0819BmBD021235;
 Tue, 1 Sep 2020 09:13:21 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 337en89xym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 09:13:21 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0819Bl7l25625078
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Sep 2020 09:11:47 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDF2D11C052;
 Tue,  1 Sep 2020 09:13:18 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D150E11C069;
 Tue,  1 Sep 2020 09:13:17 +0000 (GMT)
Received: from [9.85.87.174] (unknown [9.85.87.174])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Sep 2020 09:13:17 +0000 (GMT)
Subject: Re: [PATCH] powerpc/mm: Remove DEBUG_VM_PGTABLE support on ppc64
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20200901080245.67950-1-aneesh.kumar@linux.ibm.com>
 <4519baaa-cb95-6ebb-200f-4520badb56f6@csgroup.eu>
 <39467f79-d213-772d-9ed1-93afedc2fc7a@linux.ibm.com>
 <6661a001-0a00-17b6-cb34-0f3510ca1fec@csgroup.eu>
 <49fbd2b4-31af-826d-c884-32b7cc1c6e8d@csgroup.eu>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <6a630ab1-f094-d747-e3aa-29d23efc7e47@linux.ibm.com>
Date: Tue, 1 Sep 2020 14:43:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <49fbd2b4-31af-826d-c884-32b7cc1c6e8d@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-01_04:2020-09-01,
 2020-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009010080
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
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/1/20 2:40 PM, Christophe Leroy wrote:
> 
> 
> Le 01/09/2020 à 10:15, Christophe Leroy a écrit :
>>
>>
>> Le 01/09/2020 à 10:12, Aneesh Kumar K.V a écrit :
>>> On 9/1/20 1:40 PM, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 01/09/2020 à 10:02, Aneesh Kumar K.V a écrit :
>>>>> The test is broken w.r.t page table update rules and results in kernel
>>>>> crash as below. Disable the support untill we get the tests updated.
>>>>>
>>>>>
>>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>>
>>>> Any Fixes: tag ?
>>>>
>>>>> ---
>>>>>   arch/powerpc/Kconfig | 1 -
>>>>>   1 file changed, 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>>>> index 65bed1fdeaad..787e829b6f25 100644
>>>>> --- a/arch/powerpc/Kconfig
>>>>> +++ b/arch/powerpc/Kconfig
>>>>> @@ -116,7 +116,6 @@ config PPC
>>>>>       #
>>>>>       select ARCH_32BIT_OFF_T if PPC32
>>>>>       select ARCH_HAS_DEBUG_VIRTUAL
>>>>> -    select ARCH_HAS_DEBUG_VM_PGTABLE
>>>>
>>>>
>>>> You say you remove support for ppc64 but you are removing it for 
>>>> both PPC64 and PPC32. Should you replace the line by:
>>>
>>> Does it work on PPC32 with DEBUG_VM enabled? I was expecting it will 
>>> be broken there too.
>>
>> I was wondering. I have just started a build to test that on my 8xx. 
>> I'll tell you before noon (Paris).
>>
> 
> There are warnings but it boots OK. So up to you, but if you deactivate 
> it for both PPC32 and PPC64, say so in the subject like.
> 

I will update the subject line to indicate powerpc instead of ppc64

-aneesh
