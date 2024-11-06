Return-Path: <linuxppc-dev+bounces-2908-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CA09BE9F7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 13:39:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xk4X131Tyz301w;
	Wed,  6 Nov 2024 23:39:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730896753;
	cv=none; b=l7/F/Oa+c6z1XZtV1rrPyUV/nJcwuulxGzlEAhCwIX0ZtcOBhaV+3mgDD+e9Cz8c37ElMFrL/wTj6kn/Z3/aP1h8hEscPcY9+TJFAiAgcgblWEiG1Z1/BvZPur7BFE4Vdj3pqc+s8fBCigBiME9ulLpwLk44PFkCSvYhGgPLN6ODBi0A6+ge5v0M8xZk1/sCfFhCtSsUY3+0Bg1/fITLUZDFruXplHTzhkR0/6D6dEgtw2HcyxtoCbJbwfu3oeSt5EnfrhlfN1f2r0HGpqrwmIh3eKkMsl1fexwpla0s8LpkcLbZ3/iZQtTrZZTABpNGT31BgsVuscwUURocvnBxWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730896753; c=relaxed/relaxed;
	bh=kSKc5F1wiMC+x6GXGdZodLW6w++FntVUA0vp+ofVii0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LBbkBqp53+FzGUWHq4RZuoblh+LrI59E+ZwJF7kIgnFwvUqm/Qvm5aDxTPftYpt1Y/O7ccozFfTd4J2sKqPUjoKR5XLoNV7FX4+0lLOTNvLslYgkkRUbQbcS1fA0BgBwh+E2D7gFy+o+0BZVO+2WrPwY9vb22coizq2lD5qC4eQ3+08hBBFIZLQoyrmzBl+MHNGJWZm3XTsSH1p2H3Rr5fXxYrMSqxBcDuE5/ofGTx26E/x1bGYXs1CQC65dQhR0J3wV77Be1As+hnD4erjNd4udX/UrgxpZU5r/ciFiQASquVRywdReqAg6ED7+U8rKspHqZl7BOF/8yjYr6oBwfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SfrUnrKG; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SfrUnrKG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk4X01jRVz30Ns
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 23:39:11 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6AA4Ag000620;
	Wed, 6 Nov 2024 12:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kSKc5F
	1wiMC+x6GXGdZodLW6w++FntVUA0vp+ofVii0=; b=SfrUnrKG4od5pq7vIvhwpK
	D1G279dNgDylnEG+7L1qbo0rp43jQ2afd7nbFhHcgpeGaLdGyBbD/4lhpxWe9ebo
	gCKgib1IqDn1b5qVNUl/z2TLZyQBKPI+bNdn0LhIp6byx7q3HtIIyaBKvTe0jZud
	C6v1ztZ8ko6Z29hWD0SwVnkQsR8I9PplpLoQpn3Q3eSBlJhYV063sRkChVMix9Vu
	9hcLZscSV5h7a1ktfW2SjJqbWygWjYKIh8OJTBPeGDitxuiDyqe69XJnwj3NYtKy
	xH4axxp3hbyyDDlmd2bAWJ5aMJwEcesSmY0vmcgtZpTTn6hqbkwfrbCJWLY016NQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42r6fb0rbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 12:39:01 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6BhKRn008470;
	Wed, 6 Nov 2024 12:39:01 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42nywktywh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 12:39:00 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A6CcuqP18940210
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 Nov 2024 12:38:56 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B4DA82004E;
	Wed,  6 Nov 2024 12:38:56 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1600220043;
	Wed,  6 Nov 2024 12:38:55 +0000 (GMT)
Received: from [9.43.92.161] (unknown [9.43.92.161])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  6 Nov 2024 12:38:54 +0000 (GMT)
Message-ID: <2bfb38b4-66a3-4413-b866-acf6f07d10f7@linux.ibm.com>
Date: Wed, 6 Nov 2024 18:08:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] powerpc/fadump: allocate memory for additional
 parameters early
To: Michael Ellerman <mpe@ellerman.id.au>,
        Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>
References: <20241104083528.99520-1-sourabhjain@linux.ibm.com>
 <874j4m9juf.fsf@mpe.ellerman.id.au>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <874j4m9juf.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GyM07ARnBoZskZcVnMgJmYyOUp7bc8C6
X-Proofpoint-ORIG-GUID: GyM07ARnBoZskZcVnMgJmYyOUp7bc8C6
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411060103
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Michael and Hari,

On 05/11/24 13:46, Michael Ellerman wrote:
> Hi Sourabh,
>
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>> From: Hari Bathini <hbathini@linux.ibm.com>
>>
>> Memory for passing additional parameters to fadump capture kernel
>> is allocated during subsys_initcall level, using memblock. But
>> as slab is already available by this time, allocation happens via
>> the buddy allocator. This may work for radix MMU but is likely to
> Does it even work for radix? If the memory has been given out the buddy
> allocator then it could be overwritten at any moment. Or vice-versa,
> fadump might overwrite memory used for something else.
>> fail in most cases for hash MMU as hash MMU needs this memory in
>> the first memory block for it to be accesible in real mode in the
>> capture kernel (second boot). So, allocate memory for additional
>> parameters area as soon as MMU mode is obvious.
>>
>> Fixes: 683eab94da75 ("powerpc/fadump: setup additional parameters for dump capture kernel")
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
>> Closes: https://lore.kernel.org/lkml/a70e4064-a040-447b-8556-1fd02f19383d@linux.vnet.ibm.com/T/#u
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/fadump.h |  2 ++
>>   arch/powerpc/kernel/fadump.c      | 15 ++++++++++-----
>>   arch/powerpc/kernel/prom.c        |  3 +++
>>   3 files changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm/fadump.h
>> index ef40c9b6972a..978102c5129e 100644
>> --- a/arch/powerpc/include/asm/fadump.h
>> +++ b/arch/powerpc/include/asm/fadump.h
>> @@ -19,6 +19,7 @@ extern int is_fadump_active(void);
>>   extern int should_fadump_crash(void);
>>   extern void crash_fadump(struct pt_regs *, const char *);
>>   extern void fadump_cleanup(void);
>> +extern void fadump_setup_param_area(void);
>   
> You can drop extern on new declarations.

Sure I will update the function declaration.

>
>>   extern void fadump_append_bootargs(void);
>>   
>>   #else	/* CONFIG_FA_DUMP */
>> @@ -26,6 +27,7 @@ static inline int is_fadump_active(void) { return 0; }
>>   static inline int should_fadump_crash(void) { return 0; }
>>   static inline void crash_fadump(struct pt_regs *regs, const char *str) { }
>>   static inline void fadump_cleanup(void) { }
>> +static inline void fadump_setup_param_area(void) { }
>>   static inline void fadump_append_bootargs(void) { }
>>   #endif /* !CONFIG_FA_DUMP */
>>   
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index a612e7513a4f..4a3f80f42118 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -1586,6 +1586,12 @@ static void __init fadump_init_files(void)
>>   		return;
>>   	}
>>   
>> +	if (fw_dump.param_area) {
>> +		rc = sysfs_create_file(fadump_kobj, &bootargs_append_attr.attr);
>> +		if (rc)
>> +			pr_err("unable to create bootargs_append sysfs file (%d)\n", rc);
>> +	}
>> +
>>   	debugfs_create_file("fadump_region", 0444, arch_debugfs_dir, NULL,
>>   			    &fadump_region_fops);
>>   
>> @@ -1740,7 +1746,7 @@ static void __init fadump_process(void)
>>    * Reserve memory to store additional parameters to be passed
>>    * for fadump/capture kernel.
>>    */
>> -static void __init fadump_setup_param_area(void)
>> +void __init fadump_setup_param_area(void)
>>   {
>>   	phys_addr_t range_start, range_end;
>>   
>> @@ -1748,7 +1754,7 @@ static void __init fadump_setup_param_area(void)
>>   		return;
>>   
>>   	/* This memory can't be used by PFW or bootloader as it is shared across kernels */
>> -	if (radix_enabled()) {
>> +	if (early_radix_enabled()) {
>>   		/*
>>   		 * Anywhere in the upper half should be good enough as all memory
>>   		 * is accessible in real mode.
>> @@ -1776,12 +1782,12 @@ static void __init fadump_setup_param_area(void)
>>   						       COMMAND_LINE_SIZE,
>>   						       range_start,
>>   						       range_end);
>> -	if (!fw_dump.param_area || sysfs_create_file(fadump_kobj, &bootargs_append_attr.attr)) {
>> +	if (!fw_dump.param_area) {
>>   		pr_warn("WARNING: Could not setup area to pass additional parameters!\n");
>>   		return;
>>   	}
>>   
>> -	memset(phys_to_virt(fw_dump.param_area), 0, COMMAND_LINE_SIZE);
>> +	memset(__va(fw_dump.param_area), 0, COMMAND_LINE_SIZE);
>   
> This will now be running with the MMU off, so I think it would be
> clearer to not use __va() here. Using __va() will work, but only because
> the CPU ignores the top bits of the address in real mode.

For my understanding, at what point during kernel boot the MMU is
turned on, and how can we check if it's on or off ?

>
> There are cases where it's correct to use __va() in real mode, ie. when
> you're storing a pointer for later use in virtual mode, but this is not
> one of those cases AFAICS.


Do we have any other way to reset the reserved memory that early in the 
boot?

Or should we move the memory reset for the parameter area to
fadump_setup()->fadump_init_files()  ??

@@ -1587,6 +1587,7 @@ static void __init fadump_init_files(void)
         }

         if (fw_dump.param_area) {
+              memset(__va(fw_dump.param_area), 0, COMMAND_LINE_SIZE);
                 rc = sysfs_create_file(fadump_kobj, 
&bootargs_append_attr.attr);
                 if (rc)
                         pr_err("unable to create bootargs_append sysfs 
file (%d)\n", rc);
@@ -1787,7 +1788,6 @@ void __init fadump_setup_param_area(void)
                 return;
         }

-       memset(__va(fw_dump.param_area), 0, COMMAND_LINE_SIZE);
  }


Thanks for the review Michael.

- Sourabh Jain

