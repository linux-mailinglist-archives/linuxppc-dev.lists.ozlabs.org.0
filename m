Return-Path: <linuxppc-dev+bounces-4885-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B3FA06C72
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 04:43:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YT9cP75Hyz3064;
	Thu,  9 Jan 2025 14:43:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736394213;
	cv=none; b=fjdw7zEA70ztaIjEwbw4Sen+yeWSlHoEf9jJ9b7LL5NrFtyg21/L07mnfn+2hp6Isk8eTxM8+HpaON8WnswDRbfGSF4sKD+bzX4sYvbc863MvXcACMt34kLP+z+g6BXeA1Su9AUEziczNx4u3k513Bjr7JBX3sHdsIDz6b1HbSQ1TJ9mrVicev4KZUmezMyF8sE80efjZCgEO2ZNL9IMKE5gTJ1s4hlpbNiyAogvxvDRI6vcQ7Wu7oF+4z4+wLmHLYwd8CF99DRBCrzUg+5BvluCaOGZq3WTyAEoHcps0Ogz6nQ6zepTZVJXzmwLYIXBa2R1hjnV2+VICBredAPkTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736394213; c=relaxed/relaxed;
	bh=BKGNRek6tyT4tnRvV4cOEDAaOqBuVYRtuGJgnAhlKA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iGX0Tbl2Y7AtwXyiCJtz5k1eu+h6KTPLq3N0mRf68Rsu4kgI+HZrTu3ttqvWR3YL8P33FDkRC+A5S3kdSkeoqs4gSpuXYIgZUBVOomzw4OJwLvpxJICE83Q0lIp0xZrpx8xGfMquvSJRGhh8zGl2GVRce8ozLir7bvW0hmwiOV9hu8e1JlhIhp5TGm+ocI9wEURtlrk9j6Q4QUxte9biMZx4ENfvvBD6HLqNM7+TTkeV72I8prxLoO9RjnvWARre6iJ3dqIr6HH0L9/AKRMAJV8g5r3W7PIY3LOnanks4kHl7hZCP+nHowb6+n5PaeCNnZ5r4E3ZNwD4qdIZ+avRuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YM2Qsqu1; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YM2Qsqu1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YT9cN5SJGz305v
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 14:43:31 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508ICI0Z023325;
	Thu, 9 Jan 2025 03:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=BKGNRe
	k6tyT4tnRvV4cOEDAaOqBuVYRtuGJgnAhlKA4=; b=YM2Qsqu15mcqg8JGf6JvB9
	DOOGH3c9bCJxjdGi0hJ64vp3Iey1xdU9Ti7PB2DwI2YbT4dL89F49lWspCzko1Np
	KKxp2VNMFvD3fMihRa1O7dO2xbdnDkrEI6xjTtW085Mc7akmaScehLW9V4sLHGdf
	Ex0ExbH0Qx6yPpB8/u0ZahrB3um1bxstuTpCta+/K5MV3MQVZyiYy8yC79RmPM7f
	IUH/9IfOLFIafW2Kiryv/SWmNYpl0pFx3NRASe20GBIgUVi0ivG0HkiD5CTEsS6S
	VlJQtTDNrUviBhYyTrr40ZpGVQjhJtvSBiCmtxZPFYNPWW+yQxbYjeWu9jOAnZxA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441nj3cn7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 03:43:18 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 509108PZ016144;
	Thu, 9 Jan 2025 03:43:17 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygtm3409-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 03:43:17 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5093hESO29688448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 03:43:14 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C0C920049;
	Thu,  9 Jan 2025 03:43:14 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46AE820040;
	Thu,  9 Jan 2025 03:43:11 +0000 (GMT)
Received: from [9.43.18.121] (unknown [9.43.18.121])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jan 2025 03:43:11 +0000 (GMT)
Message-ID: <e52cdf5a-dde2-4008-bee4-38080182bf58@linux.ibm.com>
Date: Thu, 9 Jan 2025 09:13:10 +0530
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
Subject: Re: [PATCH RESEND v1 4/5] powerpc/crash: use generic crashkernel
 reservation
To: mahesh@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
        Baoquan he <bhe@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250108101458.406806-1-sourabhjain@linux.ibm.com>
 <20250108101458.406806-5-sourabhjain@linux.ibm.com>
 <dgn3qq2q35rjem3lm33k646tl7ucxghwnvttplr4fdk35aftfx@2tzxh6ku5m3d>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <dgn3qq2q35rjem3lm33k646tl7ucxghwnvttplr4fdk35aftfx@2tzxh6ku5m3d>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XJ32GDhjHOFhoL-XeQpnyUTdjyLqFNJT
X-Proofpoint-GUID: XJ32GDhjHOFhoL-XeQpnyUTdjyLqFNJT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090026
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Mahesh,

On 08/01/25 22:35, Mahesh J Salgaonkar wrote:
> On 2025-01-08 15:44:57 Wed, Sourabh Jain wrote:
>> Commit 0ab97169aa05 ("crash_core: add generic function to do
>> reservation") added a generic function to reserve crashkernel memory.
>> So let's use the same function on powerpc and remove the
>> architecture-specific code that essentially does the same thing.
>>
>> The generic crashkernel reservation also provides a way to split the
>> crashkernel reservation into high and low memory reservations, which can
>> be enabled for powerpc in the future.
>>
>> Along with moving to the generic crashkernel reservation, the code
>> related to finding the base address for the crashkernel has been
>> separated into its own function name get_crash_base() for better
>> readability and maintainability.
>>
>> To prevent crashkernel memory from being added to iomem_resource, the Mahesh.
>> function arch_add_crash_res_to_iomem() has been introduced. For further
>> details on why this should not be done for the PowerPC architecture,
>> please refer to the previous commit titled "crash: let arch decide crash
>> memory export to iomem_resource.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Baoquan he <bhe@redhat.com>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> CC: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: kexec@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   arch/powerpc/Kconfig                     |  3 +
>>   arch/powerpc/include/asm/crash_reserve.h | 18 +++++
>>   arch/powerpc/include/asm/kexec.h         |  4 +-
>>   arch/powerpc/kernel/prom.c               |  2 +-
>>   arch/powerpc/kexec/core.c                | 90 ++++++++++--------------
>>   5 files changed, 63 insertions(+), 54 deletions(-)
>>   create mode 100644 arch/powerpc/include/asm/crash_reserve.h
> [...]
>> @@ -113,9 +113,9 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt, struct crash_mem
>>   
>>   #ifdef CONFIG_CRASH_RESERVE
>>   int __init overlaps_crashkernel(unsigned long start, unsigned long size);
>> -extern void reserve_crashkernel(void);
>> +extern void arch_reserve_crashkernel(void); Mahesh. Mahesh
> Do we really need to rename this ? it is still called from powepc arch
> and not from the common code.

You are right, we don’t. However, all architectures (x86, RISC-V, 
LoongArch, ARM64) that use the
generic crash kernel reservation have named their architecture-specific 
function `arch_reserve_crashkernel()`.
So, I did the same for PowerPC, and this helps sometimes.

Maybe I should justify the name change in the commit to avoid confusion.

Please let me know your opinion.

>
>>   #else
>> -static inline void reserve_crashkernel(void) {}
>> +static inline void arch_reserve_crashkernel(void) {}
>>   static inline int overlaps_crashkernel(unsigned long start, unsigned long size) { return 0; }
>>   #endif
>>   
>> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
>> index e0059842a1c6..9ed9dde7d231 100644
>> --- a/arch/powerpc/kernel/prom.c
>> +++ b/arch/powerpc/kernel/prom.c
>> @@ -860,7 +860,7 @@ void __init early_init_devtree(void *params)
>>   	 */
>>   	if (fadump_reserve_mem() == 0)
>>   #endif
>> -		reserve_crashkernel();
>> +		arch_reserve_crashkernel();
>>   	early_reserve_mem();
>>   
>>   	if (memory_limit > memblock_phys_mem_size())
> Rest looks good to me.
>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thank you for reviewing this.

- Sourabh Jain

