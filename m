Return-Path: <linuxppc-dev+bounces-14472-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EA6C831EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Nov 2025 03:40:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFn3M6Qtpz2yFJ;
	Tue, 25 Nov 2025 13:39:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764038399;
	cv=none; b=KFG8thA0QJPxb40SPjGNCpheX3FycSJojwguorSncQDem3vJxbJ4cXuiYwwcLbbiLolVklm1bdcB6681wsFty8TGuk2SOEZEPawjg7CDk6BdYz0EVnd4lHiKq0MmlE0Xu6oDJhI5RQVT5gBKDTWyV9C3XeZeewZ/kUYN6+jx+gbXBaZqLLIwFA3o21sFN3CneRzi2yBU2xtZ9959d7IHV1AYqBTlz83FuRh7tOzFoVnwqTzeTNq92YEDxIg6BvNWZkp+Y2zzDlE/mGW8OM4MS1felOesOJYMDGERJpFk+GpvbEfjIbf4Xizh4kZr4p+3M2zenAxvEbknbYPCc9lIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764038399; c=relaxed/relaxed;
	bh=hRwRnLBiMvuCASnWQh5FrHQu6hCthbJIwrIb24sLPC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CmPbOffgDksudnoWIDxYnElKhlEPMmR2NzeYhHBtK2mLeNp9dTjIZxosMppU3jiWuhs2W2ul+BQSodtREdsrRoSm5DQ7BfOwiyDWAQO84p0V1qrb8aTOl2gY43xm1r/Q+jNus3dye6d//xdP0TJ0HIjJCYv5iMMJ3Jt4Exv3MZ0PWr63jPBDsey9NL4blsF3l1D0QR1oK+WW/0P9cOLYQI5v8/0Uh7rjUoxny7dUDo5SXi8ujEx/M59RGRISNBUn3zIMrN4jR/9yT2+IxjNZzWgGQ0mDP7WrANBXpW5w4BSspH0gkSJJYllrbw+FE+Dliu3muaarVwjmwU0SgqprrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l9ha/cf+; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l9ha/cf+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFn3L2zgNz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 13:39:57 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AOIHjqD014137;
	Tue, 25 Nov 2025 02:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hRwRnL
	BiMvuCASnWQh5FrHQu6hCthbJIwrIb24sLPC0=; b=l9ha/cf+NJoOYbJ8aeUR35
	qIWaioJE6e8ZURa/917MEAudgRkQ9Oc6QzqEOaq1szkauP9fhS0CxaqKMYvAtPrS
	0WQl7i2m2XvlVCEailuabx7c3QmciBfMG+VLOKXk9wibYaG3jPpe4udexbeyuuJ/
	ig36mIZ2qDuZDbZrfUOy+jFxpvZDauk2Yzt5yl/9sgOxewyGuDTFUd0ed210NOg4
	YP/SHPdZ8aCUT+cFne3n8knDVQaUobMb4UcajjaeqyRER5lFAEopBGn0miUaA6Gy
	0c5QsOYU8glOA7zHIuBJd2j+me5/tWwfDgOfb+RP8tBbUQyqW+8HCNQZpBwkducA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak3kjtjxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 02:39:32 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AP2Z9SJ030822;
	Tue, 25 Nov 2025 02:39:31 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak3kjtjxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 02:39:31 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AP2FOpm013916;
	Tue, 25 Nov 2025 02:39:30 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4akrgn14px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 02:39:30 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AP2dQhu40108454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Nov 2025 02:39:26 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B4D6020043;
	Tue, 25 Nov 2025 02:39:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94A292004B;
	Tue, 25 Nov 2025 02:39:22 +0000 (GMT)
Received: from [9.124.217.104] (unknown [9.124.217.104])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 25 Nov 2025 02:39:22 +0000 (GMT)
Message-ID: <4b83b443-baa8-4218-8412-ddfb0dda8ac3@linux.ibm.com>
Date: Tue, 25 Nov 2025 08:09:21 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/17] Paravirt CPUs and push task for less vCPU
 preemption
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, pbonzini@redhat.com,
        seanjc@google.com, kprateek.nayak@amd.com, vschneid@redhat.com,
        iii@linux.ibm.com, huschle@linux.ibm.com, rostedt@goodmis.org,
        dietmar.eggemann@arm.com, christophe.leroy@csgroup.eu
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
 <2025112454-phonics-crept-5b98@gregkh>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <2025112454-phonics-crept-5b98@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _OI4FmMzkjF7P2b2qYgCBFAGElSmEHk4
X-Authority-Analysis: v=2.4 cv=frbRpV4f c=1 sm=1 tr=0 ts=692516e4 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=XCq7C3c8YjQnFldJpZgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 4obkmoNcBS-oLQDJjfbYTHBmRtbfmw-e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAwOCBTYWx0ZWRfX+mF5qhi0YDzZ
 epJG1m2NY8Kd/9uHazA54AIcktRWhLoA4NmMeOHlb+MfjydGor7I4layItuKDJvtM+N2fhkjHBs
 shWveGEZ6zf/smdDWpVPuF8p+iszAWAMqDTJF4MM5rjwvmQNecoVHumI4ozLWkNzAkujKfgPiPE
 rE6+dtvz49u7+89i4urj3wZaoFBRO7EJJRBTCDJYNKIGwZ/0ZgF4ogERcUK9UX+zMOEXcCMI1Z2
 1TaQ07VPNhN9JuvCI2g6HTzb4Ht/sdBwE1dKgAZ6cWYUPS6vc9ueyMuShDe68BVzWofBISFRTwX
 Rc/CX36LZol58fyTqludQK4+DT50pfUKpFACpTPUimjpj71VeUOmfvqJk42QQ9Hp5PJzai24kH0
 R/uRTqaCG1ZlwOF+fjha5RIzQpMgKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511220008
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Greg.

On 11/24/25 10:35 PM, Greg KH wrote:
> On Wed, Nov 19, 2025 at 06:14:32PM +0530, Shrikanth Hegde wrote:
>> Detailed problem statement and some of the implementation choices were
>> discussed earlier[1].
>>
>> [1]: https://lore.kernel.org/all/20250910174210.1969750-1-sshegde@linux.ibm.com/
>>
>> This is likely the version which would be used for LPC2025 discussion on
>> this topic. Feel free to provide your suggestion and hoping for a solution
>> that works for different architectures and it's use cases.
>>
>> All the existing alternatives such as cpu hotplug, creating isolated
>> partitions etc break the user affinity. Since number of CPUs to use change
>> depending on the steal time, it is not driven by User. Hence it would be
>> wrong to break the affinity. This series allows if the task is pinned
>> only paravirt CPUs, it will continue running there.
>>
>> Changes compared v3[1]:
> 
> There is no "v" for this series :(
> 

I thought about adding v1.

I made it as PATCH from RFC PATCH since functionally it should
be complete now with arch bits. Since it is v1, I remember usually 
people send out without adding v1. after v1 had tags such as v2.

I will keep v2 for the next series.


