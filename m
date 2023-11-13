Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5D17EA075
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 16:47:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nJlGre5L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STYhz33y6z3cZn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 02:47:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nJlGre5L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STYh50Tsbz3cS3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 02:46:44 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ADFWRUU017595;
	Mon, 13 Nov 2023 15:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=82d2tkJRzvyN1W8c+q1bSslcSZAmNykZ8joWe1ejB/Y=;
 b=nJlGre5LF5dagzJQiUdJmpBOh0j32MlL9+8ZesIuSlTeQwmdTRTZP8sjEpm6tLocKCjz
 q3yMxe26aHhGJ7CiVSp0vKkjBX7MoFLeFkPEeOg8XCVOGPHQfLI+7+wiUl0S+Wd8CJY0
 3vmyPyhwON/DU4YYGsfxe2sXYFhFafMQxB7rwYEFHNR8nBoMx6wEfGsJCTSg4QSmUpyH
 QTA1tbppYi60Ci2f9xymw6TA57t8Y3xWEDigL0eVekrFweVMHBEJbpMrBK4GNoiMX7gV
 laRaE4R0i1yp7MkzgM/ar4ESe8Xn6DlgRzPfrtJ1oCOxVIo7farxk5oqxnctlYluxZA+ sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ubphdgbf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 15:46:34 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3ADFg63M018164;
	Mon, 13 Nov 2023 15:46:33 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ubphdgbe6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 15:46:33 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3ADE46i9023612;
	Mon, 13 Nov 2023 15:46:32 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uamay20v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 15:46:32 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3ADFkU2p14680626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Nov 2023 15:46:30 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32C052004B;
	Mon, 13 Nov 2023 15:46:30 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30AF020040;
	Mon, 13 Nov 2023 15:46:29 +0000 (GMT)
Received: from [9.43.73.221] (unknown [9.43.73.221])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Nov 2023 15:46:28 +0000 (GMT)
Message-ID: <4faeb598-87b1-4aca-90cb-3890f95ae7b6@linux.ibm.com>
Date: Mon, 13 Nov 2023 21:16:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] powerpc/book3s/hash: Drop _PAGE_PRIVILEGED from
 PAGE_NONE
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
        mpe@ellerman.id.au, christophe.leroy@csgroup.eu
References: <20231102132327.294050-1-aneesh.kumar@linux.ibm.com>
 <CWXLU5UP91CT.1AP3JHL6TR6UT@wheely>
 <02b602c0-2b40-4cf9-b0ca-4bc12ac267cd@linux.ibm.com>
 <CWXNRTMZNWQG.1SU5NB1QVDLO1@wheely>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <CWXNRTMZNWQG.1SU5NB1QVDLO1@wheely>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Wi3kZU4EC35coKf-S0myeYCIOh0oRC8Y
X-Proofpoint-ORIG-GUID: 5D-QKTgZhs3Zen8KSbh9_GJs7twKl-h9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-13_06,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=857
 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311130128
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/13/23 5:17 PM, Nicholas Piggin wrote:
> On Mon Nov 13, 2023 at 8:45 PM AEST, Aneesh Kumar K V wrote:

....

>>>> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
>>>> index ad2afa08e62e..b2eda22195f0 100644
>>>> --- a/arch/powerpc/mm/book3s64/hash_utils.c
>>>> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
>>>> @@ -310,9 +310,26 @@ unsigned long htab_convert_pte_flags(unsigned long pteflags, unsigned long flags
>>>>  			else
>>>>  				rflags |= 0x3;
>>>>  		}
>>>> +		WARN_ON(!(pteflags & _PAGE_RWX));
>>>>  	} else {
>>>>  		if (pteflags & _PAGE_RWX)
>>>>  			rflags |= 0x2;
>>>> +		else {
>>>> +			/*
>>>> +			 * PAGE_NONE will get mapped to 0b110 (slb key 1 no access)
>>>> +			 * We picked 0b110 instead of 0b000 so that slb key 0 will
>>>> +			 * get only read only access for the same rflags.
>>>> +			 */
>>>> +			if (mmu_has_feature(MMU_FTR_KERNEL_RO))
>>>> +				rflags |= (HPTE_R_PP0 | 0x2);
>>>> +			/*
>>>> +			 * rflags = HPTE_R_N
>>>> +			 * Without KERNEL_RO feature this will result in slb
>>>> +			 * key 0 with read/write. But ISA only supports that.
>>>> +			 * There is no key 1 no-access and key 0 read-only
>>>> +			 * pp bit support.
>>>> +			 */
>>>> +		}
>>>>  		if (!((pteflags & _PAGE_WRITE) && (pteflags & _PAGE_DIRTY)))
>>>>  			rflags |= 0x1;
>>>>  	}
>>>
>>
>> V2 is also dropping the above change, because we will never have hash table entries inserted. 
>>
>> This is added to commit message.
>>
>>     Hash fault handling code did get some WARN_ON added because those
>>     functions are not expected to get called with _PAGE_READ cleared.
>>     commit 18061c17c8ec ("powerpc/mm: Update PROTFAULT handling in the page fault path")
>>     explains the details.
> 
> Should it be a WARN_ON_ONCE? Any useful way to recover from it? Could
> the added WARN come with some comments from that commit that explain
> it?
> 

This should never happen unless someone messed up check_pte_access(). The WARN_ON() is a way
to remind me not to add no access ppp mapping in the htab_convert_pte_flags() as I did above.
Initially I was planning to add only a comment, but then in the rare case of we getting it wrong
it is nice to do a console log.

-aneesh

