Return-Path: <linuxppc-dev+bounces-10406-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31888B123C5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jul 2025 20:30:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bpbyF3Blvz30Yb;
	Sat, 26 Jul 2025 04:29:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753468197;
	cv=none; b=WEnMheJkrkgwjX3cUc5FimEFKmF/11ZdyvrG3dJmPjamZF/lxARR0RPJYSspjguDmZ072Eov1G52Yle8JLTZHY0+U/2igMxGz9FyKVh/mhpAXQ62l+rWv3EmAmGsmlfDooyV6PgbYkq+SdGWhRt6xBF6pFc9TSnF2sMHsMgXnT9GzjCaW45RmvHMKamIqN9c+CKw2SqLrExnrWL0w2rqb5EVU+pw9keB5HBpMYSeNL1Yi5p9Ytmu2eGXWbL8qc1yHQuh3giHDPqpmXviBQc0zY5IgmhTtq7EunJIRqPo/0gu2B4hFXRuprpDpnLkhxsqvUkXpJb6VhF8TGfIwCsrzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753468197; c=relaxed/relaxed;
	bh=gwHqhNTrsKC7iDkKMerSwZnTlYFq0WR3tYd0atWHduQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bwSyOoCQnWzishj+UviTYVX4NGgJxLq1HrtvJrb0hp8Dh89vtgXxX/D3tsh8wLqAupf7sZ6i+v5/RBdSJCTAcoOZ86QkZfwJiLqgNQHCzuAZ9Fi/Oxgw/TgkHOx4JJZsS/qfv14EvQTieEtbSJakeTX99S0/OQfjUk8OeytT/03LIIMDRZmWBHEgKlOWXHQXr/R66/LygR55V3eNkZKO5EhDdzOXRekqERxLN/EbbwyaXmZ7wuWt1ojlw6Bvf6zOK81G6vqLMBesB0uppDDubcPIpry5Pa3VYE0lq+ys6u6a369lEqYuK9zQ5RMwIyTLQn+KRy1qOn27ttHeTrEWoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WN4IeqK5; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WN4IeqK5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bpbyD2mFTz30Wn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jul 2025 04:29:55 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PC6YRm024282;
	Fri, 25 Jul 2025 18:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=gwHqhN
	TrsKC7iDkKMerSwZnTlYFq0WR3tYd0atWHduQ=; b=WN4IeqK5U776N14XxABujA
	bjkb6BaV9U5K9y8aKdcDFUNIitOgqquSoaz7Fq9mSBU9zfI0mR2g3+mXBD20hJfl
	lnOkZXltjQ1CaY9rSjq+yXzoj2rWbAfusXg3mTmAjp1/PNf+Jgfl1baUnzswM8V4
	wbZpbZR37ZMEwpScDZh/isrkUPjphFvdLrCM3C4yn6C04dFWF/zBNTU1NV+JszUD
	sEiHOOxxcFc78YHGAmYixOjdMzj9NtmzRHDL7znwCpnYFvrHF0ctIybpwE2sXTDj
	e7aua9rU0wQ0CC9eKLZD327WIwoSNPLsAXi+gwLVfL4kCPgyYKgvG5GiY3+RFi4g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 483wchvjcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Jul 2025 18:29:33 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 56PITWMM005867;
	Fri, 25 Jul 2025 18:29:32 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 483wchvjcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Jul 2025 18:29:32 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56PGRHBG014302;
	Fri, 25 Jul 2025 18:29:31 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 480pppjrub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Jul 2025 18:29:31 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56PITUxF10748428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Jul 2025 18:29:30 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 348AB58054;
	Fri, 25 Jul 2025 18:29:30 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45ACC5804E;
	Fri, 25 Jul 2025 18:29:28 +0000 (GMT)
Received: from [9.61.131.29] (unknown [9.61.131.29])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Jul 2025 18:29:28 +0000 (GMT)
Message-ID: <683380bb-ef1b-44ab-b7df-83c23dd76ff7@linux.ibm.com>
Date: Fri, 25 Jul 2025 14:29:27 -0400
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
Subject: Re: [PATCH v2] integrity: Extract secure boot enquiry function out of
 IMA
To: GONG Ruiqi <gongruiqi1@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>,
        Roberto Sassu <roberto.sassu@huawei.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Eric Snowberg <eric.snowberg@oracle.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, "Lee, Chun-Yi" <jlee@suse.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-integrity@vger.kernel.org,
        keyrings@vger.kernel.org, Lu Jialin <lujialin4@huawei.com>
References: <20250628063251.321370-1-gongruiqi1@huawei.com>
 <eb91dcf034db28e457a4482faa397dd7632f00fd.camel@linux.ibm.com>
 <4c59f417-86cc-4dec-ae45-8fcf8c7eb16a@huawei.com>
 <e8aa7f94-3e52-488d-a858-564d3d1edd4b@linux.ibm.com>
 <362b3e8a-0949-42d1-a1d0-90bd12d86b09@huawei.com>
Content-Language: en-US
From: Nayna Jain <nayna@linux.ibm.com>
In-Reply-To: <362b3e8a-0949-42d1-a1d0-90bd12d86b09@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDE1NiBTYWx0ZWRfX4KxyCFL3+SdL
 67Rt3tFuxDe4L+z9znmO5L6MT+8UFdj+VGyS6VYDdQvlssI0LW+Zv4XZ4Z1nEqyyejHkBQPLgDP
 nfEzUzLPb2ts/mxBmIJVmBKcs5bSE+fgKItXRzOgfUEcT6TNn15SOhKvmDvfRXd3v+IA18cUZLJ
 B4M3EOH4yP3n1VLTKPqkylnSyOilq9mncMpkspyMn9qHbLGmbrFwulb91YYx+28RekdCg5wLQSV
 bUxyF4uMskc375/JP2lpU5o/yd5alQnj8vFSmIWMsNT/Ya8QBzYwkx5pAZ0ZTLEL2cI+xF7eUod
 KqYQ30UZoUULTd67YiJicD763xXd5OCDw/IdOmHo2leynUx+rpAvRFweZGBHl11wqmCGoV+98Rw
 Ro7BVRedADGohswUg8LdXKofYwbH+ltGygJzb0USpxCW21dilx1huWAKc4r17zQ9gNaKdMDG
X-Proofpoint-GUID: tB-KkiZit6gq5ufEk7aIRLwGi9-y1m0n
X-Proofpoint-ORIG-GUID: cuKHRALnOoG-7pdT_3yVH_LnIYMUjbOi
X-Authority-Analysis: v=2.4 cv=G+ccE8k5 c=1 sm=1 tr=0 ts=6883cd0d cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=__7AbSSk1QWdYEejdFoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250156
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 7/17/25 8:29 AM, GONG Ruiqi wrote:
> On 7/8/2025 4:35 AM, Nayna Jain wrote:
>> On 7/2/25 10:07 PM, GONG Ruiqi wrote:
>>> ...
>>>
>>> "We encountered a boot failure issue in an in-house testing, where the
>>> kernel refused to load its modules since it couldn't verify their
>>> signature. The root cause turned out to be the early return of
>>> load_uefi_certs(), where arch_ima_get_secureboot() returned false
>>> unconditionally due to CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT=n, even
>>> though the secure boot was enabled.
>> Thanks for sharing additional details.
>>
>>  From x86 Kconfig:
>>
>> /For config x86:
>>
>>      imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
>> /
>> And IMA_SECURE_AND_OR_TRUSTED_BOOT is dependent on IMA_ARCH_POLICY .
>>
>> And from Linux Kernel Kbuild documentation( https://docs.kernel.org/
>> kbuild/kconfig-language.html) :
>>
>> /weak reverse dependencies: “imply” <symbol> [“if” <expr>]
>>
>> This is similar to “select” as it enforces a lower limit on another
>> symbol except that the “implied” symbol’s value may still be set to n
>> from a direct dependency or with a visible prompt.
>>
>> /Following the example from the documentation, if  it is EFI enabled and
>> IMA_ARCH_POLICY is set to y then this config should be default enabled.
>>
>> If it is EFI enabled and IMA_ARCH_POLICY is set to N, then the setting
>> for IMA_SECURE_AND_OR_TRUSTED_BOOT should be prompted during the build.
>> The default setting for prompt is N. So, the person doing the build
>> should actually select Y to enable IMA_ARCH_POLICY.
>>
>> Wondering what is the scenario for you? Unless you have IMA_ARCH_POLICY
>> set to N, this config should have been ideally enabled. If you have
>> explicitly set it to N, am curious any specific reason for that.
> Hi Nayna. Sorry for the late reply. Super busy these days...
>
> Yes, IMA_ARCH_POLICY was not set. The testing was conducted on
> openEuler[1], a Linux distro mainly for arm64 & x86, and the kernel was
> compiled based on its own openeuler_defconfig[2], which set
> IMA_ARCH_POLICY to N.

Thanks Ruiqi for the response.

It seems the main cause of the problem was that IMA_ARCH_POLICY config 
wasn't enabled; and it sounds like you don't need IMA arch policies but 
you do need the arch specific function to get the secure boot status.

In that case, removing IMA_SECURE_AND_OR_TRUSTED_BOOT config dependency 
on IMA_ARCH_POLICY config and updating the corresponding help is all 
that is needed.

The help text can be updated to:
This option is selected by architectures to detect systems with secure 
and/or trusted boot enabled, in order to load the appropriate IMA 
runtime policies and keys.

Thanks & Regards,

     - Nayna


