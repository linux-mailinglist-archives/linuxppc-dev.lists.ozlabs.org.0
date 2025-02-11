Return-Path: <linuxppc-dev+bounces-6071-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8CCA30253
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 04:49:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsS9w49zmz2yVG;
	Tue, 11 Feb 2025 14:49:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739245764;
	cv=none; b=hXxksbi6TF+3TdN7jvkrfVO87o7xikVvCVzUF2g1qej/I/Oh67Eky0F5oapyVWitrSbFE9gnzhDtSsipvfQW/R3X9ckDYJLZX4sAhgyvljWHPIZ5LOvnAcz+igLfrBibaw5BfP6YxSydRUJZ4AsysQu96V8EOTjyQZe7MegZiuO0Leo/WawRGu+qkMpf1xyNnFJxYs5axcTEis1/TuE6O/HMaIMf879KZmNuEQ8lW+3RMFPWfD4ExJ2CWfmvIgWnMMZDgAFIlSUw0y0tML8Z7iIOa4hWNvnV3k8qCFqrcl5+iCj9Az9705b8r8k+0/DpwwkG5VkU2yzkTH8gtwGR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739245764; c=relaxed/relaxed;
	bh=zLWpaBLfJS5k8J2Zi+G6VVNekdqxPPRC+FwqG/p+pvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=enC8a+6QWY0hnQRQUwBhRlA6FuCPA5dpYbo3WHKlR2fOvk1NWuwTdh/PiZg8/2NTtNJSlR39uOuSUZkT/h8JeRqiPzLiwRkuTd7HFhnA7fa+VHyY49sjO2/fOKUqGOIvDE5Lofqjv+pACYoXpq6WUETa7xO1tfQQsBKjHkeTDIrJBDJBD1huNEo22/DOPre6NWd+WA51MGGzWr7eytPzYXGWDqx0quahHNCnu2o2HpRs2igvgctdTYAO/2nx72wuVctb6mMuY6H1GsmF38gBPE+FcSmCE6WAr8SPE/rgMNfil0YroJCpYaAUKJjPgywSsktgWTkvLe8FYAZ04APbiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AfPE5EXH; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AfPE5EXH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsS9v12G2z2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 14:49:22 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B1fLbG002171;
	Tue, 11 Feb 2025 03:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=zLWpaB
	LfJS5k8J2Zi+G6VVNekdqxPPRC+FwqG/p+pvE=; b=AfPE5EXHBSoxK7bbGm+TLT
	HuQd3jlMxVQHXxryGW6ExBvTK3NV1Q47+h5ISNu4mEv7wYcUSAuDfR5Kzu/MTBDl
	VXQ5cYzm4Ym1GW/daHCB204/+JiPWJjYABj67sB5b6yAdmK8D+PL7hFdO5SXa4ae
	teNfwf4/ivBNs1S2MucEJfRtOp5JEO7JdnJC8J0XT11cbhfzs0ZKGdq6vOneR6Tz
	HYfvdige/MbLVq0xvdAX522XfzldubbVCZSo6L4SOUCOLF7FIpJNMLJLcX3kWos3
	yQ/SAgwbvw8ahd45BJSXROnvi1RDWD/KgrKNcI8CeJ7Kg9TzSSOKNZPRve8f7iMw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44qvma0f3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 03:49:10 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51ANGOnd028221;
	Tue, 11 Feb 2025 03:49:09 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44phyy9mf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 03:49:09 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51B3n5kc15663494
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 03:49:05 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FB7620043;
	Tue, 11 Feb 2025 03:49:05 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16F0A20040;
	Tue, 11 Feb 2025 03:49:03 +0000 (GMT)
Received: from [9.43.68.90] (unknown [9.43.68.90])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Feb 2025 03:49:02 +0000 (GMT)
Message-ID: <4d148a97-dbf6-4f92-a88a-d2073bb3cfa6@linux.ibm.com>
Date: Tue, 11 Feb 2025 09:19:01 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] powerpc/fadump: fix additional param memory
 reservation for HASH MMU
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Avnish Chouhan <avnish@linux.ibm.com>, Brian King <brking@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>
References: <20250123114254.200527-1-sourabhjain@linux.ibm.com>
 <20250123114254.200527-3-sourabhjain@linux.ibm.com>
 <2f75f8f7-0dda-4f31-8e4b-bf6d7dec4818@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <2f75f8f7-0dda-4f31-8e4b-bf6d7dec4818@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9dTwgygOgoicWNgPCGdr8cfi7F-MmFk8
X-Proofpoint-ORIG-GUID: 9dTwgygOgoicWNgPCGdr8cfi7F-MmFk8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_01,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 mlxlogscore=811 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110019
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org




On 10/02/25 12:48, Hari Bathini wrote:
> Hi Sourabh,
>
> On 23/01/25 5:12 pm, Sourabh Jain wrote:
>> Commit 683eab94da75bc ("powerpc/fadump: setup additional parameters for
>> dump capture kernel") introduced the additional parameter feature in
>> fadump for HASH MMU with the understanding that GRUB does not use the
>> memory area between 640MB and 768MB for its operation.
>>
>> However, the third patch in this series ("powerpc: increase MIN RMA
>> size for CAS negotiation") changes the MIN RMA size to 768MB, allowing
>> GRUB to use memory up to 768MB. This makes the fadump reservation for
>> the additional parameter feature for HASH MMU unreliable.
>>
>> To address this, adjust the memory range for the additional parameter in
>> fadump for HASH MMU. This will ensure that GRUB does not overwrite the
>> memory reserved for fadump's additional parameter in HASH MMU.
>>
>> The new policy for the memory range for the additional parameter in HASH
>> MMU is that the first memory block must be larger than the MIN_RMA size,
>> as the bootloader can use memory up to the MIN_RMA size. The range
>> should be between MIN_RMA and the RMA size (ppc64_rma_size), and it must
>> not overlap with the fadump reserved area.
>>
>> Cc: Avnish Chouhan <avnish@linux.ibm.com>
>> Cc: Brian King <brking@linux.ibm.com>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/fadump.c | 21 +++++++++++----------
>>   1 file changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index 4b371c738213..26e3d151e048 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -33,6 +33,7 @@
>>   #include <asm/fadump-internal.h>
>>   #include <asm/setup.h>
>>   #include <asm/interrupt.h>
>> +#include <asm/prom.h>
>>     /*
>>    * The CPU who acquired the lock to trigger the fadump crash should
>> @@ -1764,19 +1765,19 @@ void __init fadump_setup_param_area(void)
>>           range_end = memblock_end_of_DRAM();
>>       } else {
>>           /*
>> -         * Passing additional parameters is supported for hash MMU only
>> -         * if the first memory block size is 768MB or higher.
>> +         * Memory range for passing additional parameters for HASH MMU
>> +         * must meet the following conditions:
>> +         * 1. The first memory block size must be higher than the
>> +         *    minimum RMA (MIN_RMA) size. Bootloader can use memory
>
>> +         *    upto RMA size. So it should be avoided.
>
> I believe you mean "upto MIN_RMA size." here?

Yeah it should MIN_RMA.

>
> Rest looks good.
>
> Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>

Thanks for the review.

- Sourabh Jain

