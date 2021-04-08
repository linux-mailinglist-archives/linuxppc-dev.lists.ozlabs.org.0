Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B23357A78
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 04:39:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FG5790VV9z3bqW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 12:39:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z2N4EECU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Z2N4EECU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FG56j0gXZz2yjS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 12:38:36 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1382XWuT116753; Wed, 7 Apr 2021 22:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=GauS1UcugFbFs6YgEq9WXBU2mwVPWAyjwkwUsJH48VM=;
 b=Z2N4EECUlC40Vi++5xbD0WYb2AS4CZYwsh7kROVqomCDX+P13ORJ94ABlKmO75OLAsfb
 FgzAG+YyBTsKi/w66OSECkYrUVk6s1wr151mLiq4vp1VNzXss0hWkeMDPE10mYFzcFdR
 WNnDuZ9HwH3jB9haAQR29NsZ5tnivsVBakPJqcWxPSu04lwVAcB8fRvUgrVAB0tv+aqp
 oHJonEWEJc779FCraKMooBMG/Zh+yiRWVOnFUNesmphCm1B0gSIfPMoItQXUhV22f4kh
 uEj68S6EzZb9ShD/gBJ7FRQoMZoOJ7mswB6//lHUtaUl2d1qhVjFhM+pD+Gnx28bBYUq DA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37rvm53v7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 22:38:29 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1382XThp010697;
 Thu, 8 Apr 2021 02:38:27 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 37rvbw967a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 02:38:27 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1382cOXR63898054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Apr 2021 02:38:25 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D54A64C046;
 Thu,  8 Apr 2021 02:38:24 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E04E24C040;
 Thu,  8 Apr 2021 02:38:23 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.85.181.214])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  8 Apr 2021 02:38:23 +0000 (GMT)
Subject: Re: [PATCH v3 1/2] powerpc/perf: Infrastructure to support checking
 of attr.config*
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20210325115326.143151-1-maddy@linux.ibm.com>
 <87sg42e34x.fsf@mpe.ellerman.id.au>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <01370595-7135-1cb1-5998-76e169617b1b@linux.ibm.com>
Date: Thu, 8 Apr 2021 08:08:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87sg42e34x.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lF0FrRBW9vTDel5kiG00fqblrg-fmxJt
X-Proofpoint-ORIG-GUID: lF0FrRBW9vTDel5kiG00fqblrg-fmxJt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_11:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104080014
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 4/7/21 5:08 PM, Michael Ellerman wrote:
> Madhavan Srinivasan <maddy@linux.ibm.com> writes:
>> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
>> index 6817331e22ff..c6eeb4fdc5fd 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -1958,6 +1958,20 @@ static int power_pmu_event_init(struct perf_event *event)
>>   
>>   		if (ppmu->blacklist_ev && is_event_blacklisted(ev))
>>   			return -EINVAL;
>> +		/*
>> +		 * PMU config registers have fields that are
>> +		 * reserved and specific value to bit field as reserved.
>> +		 * For ex., MMCRA[61:62] is Randome Sampling Mode (SM)
>> +		 * and value of 0b11 to this field is reserved.
>> +		 *
>> +		 * This check is needed only for raw event type,
>> +		 * since tools like fuzzer use raw event type to
>> +		 * provide randomized event code values for test.
>> +		 *
>> +		 */
>> +		if (ppmu->check_attr_config &&
>> +		    ppmu->check_attr_config(event))
>> +			return -EINVAL;
>>   		break;
> It's not obvious from the diff, but you're only doing the check for RAW
> events.
>
> But I think that's wrong, we should always check, even if the event code
> comes from the kernel we should still apply the same checks. Otherwise
> we might inadvertently use an invalid event code for a HARDWARE or CACHE
Reason for not including HARDWARE and CACHE events are thats,
they are straight forward, meaning they dont use sampling or thresholding
features. Currently, checks are mostly in that spaces to check for any 
invalid
values. We could include the check for all types the events.

I will respin the patch with that change

Thanks for review
Maddy


> event.
>
> cheers
