Return-Path: <linuxppc-dev+bounces-3114-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA43E9C5552
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 12:04:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xnk8M3rGKz2yT0;
	Tue, 12 Nov 2024 22:04:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731409491;
	cv=none; b=O6yTqk7ksGQs/yLck56BrI5P064SG8/vF7ArZbYdDTvOHlOmQ4smj5AHZc5tPeaqaJjtN9Hq4GGzdP0PhdpT7VWMVUIFLnIqU7RA2pgtdk0VBEZ2qUHjz+vb321YcJdSFhiMYme3zCFe7ZS0bnJbXOsfqVzTHyXJ36QpbSVdOk7J76z2Hw9lc7ZqY71o/BRMZ7OGeYOiroqr6t2N3bT12OjfzaFgxIIkcWaqVedOGDnykTwD/yGS5ltmgrDCjT08UVvGOEuKHFrPAamUvmmye6PfxllVoBw+arnTtFjMAgjfShPKy4usHrapy+EwdbzFW0EtY3eEeCvAk6raI9whuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731409491; c=relaxed/relaxed;
	bh=4rZUozDViK93X5bNTyuCtpnrFwp+p50YTiTl+cmuUD0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fg7XS8i9zitNfKSNXtzi7YRttAnkfr6h8mHPCJg1qY5Cp3JsnHBbcEIZUtk7m6gsNv4xG2ULBXGz+FAblW4/H214KIRy7E18Mm5hCXzW1ZpoG7nqrKCRfc0Psj+h+hzM/NHy7Lr0gawE58D/QisPm2BKCYfsom2fgIEPoXFtpljwX+rpdSgjghi3TEqlb09QH1afCeUuW7vHpLqhM3AgGo5AC9p+l41NdvD1YiL9MiRGNX5h2iqHVbNl83rnnXLf5ZNLgioV6uLPbUmb8Xi1K9R9ntPJ8T08f0hYEab6KUEjByep4J3+6S0GHQTKFpSMcMiKfO9W3UPRQOOcxoeS3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rR0Fly7l; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rR0Fly7l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xnk8K5sHmz2yRP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 22:04:49 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC7eSXp024343;
	Tue, 12 Nov 2024 11:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=4rZUoz
	DViK93X5bNTyuCtpnrFwp+p50YTiTl+cmuUD0=; b=rR0Fly7lFkS5Bg5KeeUlyC
	fNKQLK2E9f7qjFZ3ppwpmUMVGBRvCD6MFaaTmiSMJQIggADfngSOEZzEN8eLkG6t
	qpQDaiZgwGnzTGi8idzNIg2zRsIIeSrK4JN1BIfKE+f0YtrPhDwfCyW2GNF/Kfpv
	Lwmx6o9DVmybjVdBSI+34KY22uHb2visi7PsWcDDLoKB+7sKh05LsoIT1UHqw3Q9
	+iuSqhgI/CGhYUNYZvorOC4SUM071P0nC/EWYfDBuQpKBDn23bcr9YyV7TvOFQl0
	86JDQoPGrrrgTo+EXVLJtqEHBFvvCs2S1xqhIF0NQS64o/clWzhk7ESI5NKsJ7LA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42v2tx8q3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 11:04:39 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4ACB4cof010013;
	Tue, 12 Nov 2024 11:04:38 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42v2tx8q3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 11:04:38 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC5AA3Y017511;
	Tue, 12 Nov 2024 11:04:38 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42tk2mv3c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 11:04:38 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4ACB4Yo350266490
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Nov 2024 11:04:34 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3217520040;
	Tue, 12 Nov 2024 11:04:34 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 777E520043;
	Tue, 12 Nov 2024 11:04:32 +0000 (GMT)
Received: from [9.43.111.219] (unknown [9.43.111.219])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Nov 2024 11:04:32 +0000 (GMT)
Message-ID: <b2047c3b-ec84-456f-8f95-734bcb9a0cd1@linux.ibm.com>
Date: Tue, 12 Nov 2024 16:34:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] fadump: reserve param area if below boot_mem_top
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Hari Bathini <hbathini@linux.ibm.com>
References: <20241107055817.489795-1-sourabhjain@linux.ibm.com>
 <20241107055817.489795-2-sourabhjain@linux.ibm.com>
 <87zfm5m0p5.fsf@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87zfm5m0p5.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GUZsTg4kD1uLQVZ4qIlL8h_w8e1Mu17Z
X-Proofpoint-ORIG-GUID: 6_MZ7mMtYYMC6_-JndPun1l2KTlHrsKT
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
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
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120090
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Ritesh,


On 12/11/24 11:51, Ritesh Harjani (IBM) wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>
>> The param area is a memory region where the kernel places additional
>> command-line arguments for fadump kernel. Currently, the param memory
>> area is reserved in fadump kernel if it is above boot_mem_top. However,
>> it should be reserved if it is below boot_mem_top because the fadump
>> kernel already reserves memory from boot_mem_top to the end of DRAM.
> did you mean s/reserves/preserves ?

Yeah, preserves is better.

>
>> Currently, there is no impact from not reserving param memory if it is
>> below boot_mem_top, as it is not used after the early boot phase of the
>> fadump kernel. However, if this changes in the future, it could lead to
>> issues in the fadump kernel.
> This will only affect Hash and not radix correct? Because for radix your
> param_area is somewhere within [memblock_end_of_DRAM() / 2, memblock_end_of_DRAM()]
> which is anyway above boot_mem_top so it is anyway preserved as is...

Yes.

>
> ... On second thoughts since param_area during normal kernel boot anyway
> comes from memblock now. And irrespective of where it falls (above or below
> boot_mem_top), we anyway append the bootargs to that. So we don't really
> preserve the original contents :) right?

Sorry I didn't get it. We append strings from param_area to 
boot_command_line
not the other way.


> So why not just always call for
> memblock_reserve() on param_area during capture kernel run?
>
> Thoughts?

Yes, there is no harm in calling memblock_reserve regardless of whether 
param_area
is below or above boot_mem_top. However, calling it when param_area is 
higher than
boot_mem_top is redundant, as we know fadump preserves memory from 
boot_mem_top
to the end of DRAM during early boot.

According to the memblock documentation, when reserving memory regions, 
the new
regions can overlap with existing ones, but I don't see any advantage in 
calling memblock_reserve
for param_area if it falls above boot_mem_top.

Regardless, I don’t have a strong opinion. If you think we should call 
memblock_reserve regardless
of where param_area is placed, I can do that. Please let me know your 
opinion.

Sourabh Jain



>
>> Fixes: 3416c9daa6b1 ("powerpc/fadump: pass additional parameters when fadump is active")
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Acked-by: Hari Bathini <hbathini@linux.ibm.com>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>
>> Changelog:
>>
>> Since v1: https://lore.kernel.org/all/20241104083528.99520-1-sourabhjain@linux.ibm.com/
>>    - Include Fixes and Acked-by tag in the commit message
>>    - No functional changes
>>
>> ---
>>   arch/powerpc/kernel/fadump.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index 3a2863307863..3f3674060164 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -143,7 +143,7 @@ void __init fadump_append_bootargs(void)
>>   	if (!fw_dump.dump_active || !fw_dump.param_area_supported || !fw_dump.param_area)
>>   		return;
>>   
>> -	if (fw_dump.param_area >= fw_dump.boot_mem_top) {
>> +	if (fw_dump.param_area < fw_dump.boot_mem_top) {
>>   		if (memblock_reserve(fw_dump.param_area, COMMAND_LINE_SIZE)) {
>>   			pr_warn("WARNING: Can't use additional parameters area!\n");
>>   			fw_dump.param_area = 0;
>> -- 
>> 2.46.2


