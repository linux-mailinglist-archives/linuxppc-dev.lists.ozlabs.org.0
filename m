Return-Path: <linuxppc-dev+bounces-5538-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB52FA1AF16
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2025 04:34:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YfNjP20cRz2yVD;
	Fri, 24 Jan 2025 14:34:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737689689;
	cv=none; b=JB11FgHAson69c47rNpBYoNbhSvXG53DB7Y92Wqadod0qauAzVXaBKjTCPZeyOLtx1hKhoNAPghtsJx0Qj+0ATkT+vtm1I4a2UFITcVZ7I8T5rP1UXyChKpmdSTLuDdi+4WprDtK7rQpZ9iCLsvyEty//qKidA3w/OsU45BVmpb94HGhGBykdxzpiWk+10BOz6wkATZtBcsp8CAnIhD4WulK20kDYqUdJhpJgj3fQv19gLal6MMJEaEz46Wf7NrmpwaVDYLC3EvxF9eiaISTMhJdjFwXvETuFAppFsnhLpo35iygd2wtZQ6IAmK2lsoStfDI2bzUI+c5AQq/mnXsig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737689689; c=relaxed/relaxed;
	bh=xot9VPVZvKKm3w/AZ32Tc/ApQiApX2kPs9xJ4vwR4w0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fjKbUrQPE0pu3W6iTInHpBUoDCF3ME5k6zbxSskZFX6eV91gtK018OETaoJX1wec/9hzVZQVkOhyxI6foj9uZNi1k6KQCFJyn5qxC8T0bKCSy96z6FoFIVOkMFIB0mJgk8bMnf7LMJ/GyLkfYbqC2Ll4/jOsN25xQ5R7pGnS9FmzA1RvqpS2lhnbgmx98LysNwG2VS2YUYIrJp9sOQOHm4hm7vKPvEmdMa7Asdyei0wkq2mxIylhzyFemYG2oG0CIh8VSL7ztWBkI5vvNdCbZ3M/6/lJSxhKutPCsL6MSE6+vnta1lPk0ednf3NMV7NzyvXeDBvCrzPaSD+Wz+WSuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Df+wUUin; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Df+wUUin;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YfNjM6n4Sz2yQL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 14:34:47 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NMwZGx006103;
	Fri, 24 Jan 2025 03:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=xot9VP
	VZvKKm3w/AZ32Tc/ApQiApX2kPs9xJ4vwR4w0=; b=Df+wUUin7OmKr80/YAsX+K
	bmqOkq12VAaarjyZbOUhqFJr22+0GlnWYwLcC8uqI6WGSFh9yPGB2ts2miZMj+A4
	H12ekLwBKOvkoDm1SOTZx6SWE19+BQe+p9HxFEC2wvNNZ9iDPCTWUYHMQ2qeMVVI
	mtOcoEr7OfV7LogxTOyA/Ts91saWybvfY+aO6iDEuPFDUduJ89w4cEDxHbjNZdz1
	MKt+x8GmKEIw8S0rmrWXywKEI8GE4Fo0Al12ChmC4Ux6ZSWixMLpmqje5V+HnvZ6
	QZCdgxbbO0ypfgyj4GzQaeRDrqup2f+stks3nS9C5J4z6ljDDVntrSNOBM6QHxzg
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44br1yk7ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 03:34:37 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50O063sN021074;
	Fri, 24 Jan 2025 03:34:36 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 448sb1rgry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 03:34:36 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50O3YXMA56885656
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jan 2025 03:34:33 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C36220043;
	Fri, 24 Jan 2025 03:34:33 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9855E20040;
	Fri, 24 Jan 2025 03:34:31 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Jan 2025 03:34:31 +0000 (GMT)
Message-ID: <66c70906-0ee8-4f15-82d9-411fc0d665ee@linux.ibm.com>
Date: Fri, 24 Jan 2025 09:04:30 +0530
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
Subject: Re: [PATCH 2/2] powerpc/fadump: fix additional param memory
 reservation for HASH MMU
To: mahesh@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, Avnish Chouhan <avnish@linux.ibm.com>,
        Brian King <brking@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20250120173501.1147236-1-sourabhjain@linux.ibm.com>
 <20250120173501.1147236-3-sourabhjain@linux.ibm.com>
 <aewk4qyhv55jti7ctlaghckfbnd4j2ddtko5md7esa4o3mgxrk@bsjxghkfehwd>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <aewk4qyhv55jti7ctlaghckfbnd4j2ddtko5md7esa4o3mgxrk@bsjxghkfehwd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -HSG-bNALQpQjMRW1ShPrvdqsnIibXew
X-Proofpoint-ORIG-GUID: -HSG-bNALQpQjMRW1ShPrvdqsnIibXew
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_01,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0 mlxlogscore=749
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240023
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Mahesh,


On 23/01/25 12:28, Mahesh J Salgaonkar wrote:
> On 2025-01-20 23:05:00 Mon, Sourabh Jain wrote:
>> Commit 683eab94da75bc ("powerpc/fadump: setup additional parameters for
>> dump capture kernel") introduced the additional parameter feature in
>> fadump for HASH MMU with the understanding that GRUB does not use the
>> memory area between 640MB and 768MB for its operation.
>>
>> However, the patch ("powerpc: increase MIN RMA size for CAS
>> negotiation") changes the MIN RMA size to 768MB, allowing GRUB to use
>> memory up to 768MB. This makes the fadump reservation for the additional
>> parameter feature for HASH MMU unreliable.
> I see. Please include above patch in single patch series, with this
> change as first patch.

Thanks for the suggestion. I posted v3 with both patches combined:
https://lore.kernel.org/all/20250123114254.200527-1-sourabhjain@linux.ibm.com/


>
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
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/fadump.c | 21 +++++++++++----------
>>   1 file changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index 4b371c738213..5831f3ec8561 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -33,6 +33,7 @@
>>   #include <asm/fadump-internal.h>
>>   #include <asm/setup.h>
>>   #include <asm/interrupt.h>
>> +#include <asm/prom.h>
>>   
>>   /*
>>    * The CPU who acquired the lock to trigger the fadump crash should
>> @@ -1764,19 +1765,19 @@ void __init fadump_setup_param_area(void)
>>   		range_end = memblock_end_of_DRAM();
>>   	} else {
>>   		/*
>> -		 * Passing additional parameters is supported for hash MMU only
>> -		 * if the first memory block size is 768MB or higher.
>> +		 * Memory range for passing additional parameters for HASH MMU
>> +		 * must meet the following conditions:
>> +		 * 1. The first memory block size must be higher than the
>> +		 *    minimum RMA (MIN_RMA) size. Bootloader can use memory
>> +		 *    up to RMA size. So it should be avoided.
>> +		 * 2. The range should be between MIN_RMA and RMA size (ppc64_rma_size)
>> +		 * 3. It must not overlap with the fadump reserved area.
>>   		 */
>> -		if (ppc64_rma_size < 0x30000000)
>> +		if (ppc64_rma_size < MIN_RMA*1024*1024)
>>   			return;
>>   
>> -		/*
>> -		 * 640 MB to 768 MB is not used by PFW/bootloader. So, try reserving
>> -		 * memory for passing additional parameters in this range to avoid
>> -		 * being stomped on by PFW/bootloader.
>> -		 */
>> -		range_start = 0x2A000000;
>> -		range_end = range_start + 0x4000000;
>> +		range_start = MIN_RMA * 1024 * 1024;
>> +		range_end = min(ppc64_rma_size, fw_dump.boot_mem_top);
> Please update fadump documentation which makes this restriction clear.

The v3 patch series has a patch that update fadump documentation:
https://lore.kernel.org/all/20250123114254.200527-5-sourabhjain@linux.ibm.com/

>
> Rest looks good to me.
>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks for the review and suggestion.

- Sourabh Jain


