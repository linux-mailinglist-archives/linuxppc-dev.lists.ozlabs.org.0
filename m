Return-Path: <linuxppc-dev+bounces-3029-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8E39C15F8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 06:24:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xl6nS2Mkkz30f5;
	Fri,  8 Nov 2024 16:24:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731043468;
	cv=none; b=We7yswyW+X2CfdnbizuRmR+5AZMAPBNrD80WbCi3CWCo9TuZo9Ll7HXZvFrpLx7wxnqWM0041Ju7H2Yy2rHqFx+h/NFWNmtN3PqLVPDtMR2A+1AjAq0ohHvunJXQSCXlaVl2ygd3vAvcdb894IqLcT/BXR+1fhQTrrRYJGSbSp2NGuZf1hZDBh79y9iVj4sBY2AgXvwIMUNXBYR5+l3maW3uKC5M0TE2skxXfjdNiLR+fY1g3jfQAB8YZ6KvUG2xgE8ewCewd7Rdl/WdTkgNYqh4LAd/ihUgQI6Vys1aL0KDToCp1hXSXAG1lbRRbdlxVle6IpPYoy0GS87nXfsKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731043468; c=relaxed/relaxed;
	bh=Lrfc689hVRG7qwqAAf3pKxoq8aiLg1c4XgyzErloqYs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E50FBjgUXniOIJ7MT/kanQYKSL7UEQzn8KpsrkZq4c4TBcBVcYSpF+paEGpH+I7E5/sny+XrErJKs8J6MN+HS91nnZNQRLF24WCvrD6zXtA+7ptKXqgU9Q3LfJcx49knw85YL5boJO1qaixOxHPKIqpNkSp/8v00f1LoxoEAPifoUV0lh01/ftAzvRo5/a9OH2P9R2j3HIS0J2qSrkqedPQ50zR1f0r4lcMD9US5Osrnckq/cJ7P5AT5uLgCoUIFLViCkrOVNfzoV0FyOJsoWrBlBzG2XT5zUAFFpkDkqAU1ndhN/QYlKTbIyXvCxpGJLUNTZDNhY7uiYNhkF0Edbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p1qgIYcu; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p1qgIYcu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xl6nR2FXWz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 16:24:27 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A85A601003006;
	Fri, 8 Nov 2024 05:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Lrfc68
	9hVRG7qwqAAf3pKxoq8aiLg1c4XgyzErloqYs=; b=p1qgIYcue0Ti6Z/UpunEFR
	maE4ZIxl8bJxUqjQoUmFjZJg249UJjgsn2bwm68ntRFWYMjrwVLTEHlFRo66AUZz
	kcibAl6OdzCKIhMnGfqX66Q4itoROENMEiuzC9DeIc/zwkSMqEL43qWQmRGGyBXA
	2hyRw/HLOXTxmqbb30lZi39VniPra7yFB7W2EWxrpst8aHClRlQNs7YmhSBLhS69
	6D6MTcT3GlmAQGGA/AqJ6v7f6TShRcu/1nc5uISGGt6JGgh+SNa29qMbGsU/gs1o
	kmRknUhQvvgpuuAYDIkqme/O6seihtePX7w2zXb2/l1ZynxKHkZxw4X04VDqzjDA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42sc8q819y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 05:24:18 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A83rhR0024174;
	Fri, 8 Nov 2024 05:24:16 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42nxt06n0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 05:24:16 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A85ODeE53150146
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Nov 2024 05:24:13 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F05C2004B;
	Fri,  8 Nov 2024 05:24:13 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2115820049;
	Fri,  8 Nov 2024 05:24:12 +0000 (GMT)
Received: from [9.43.48.105] (unknown [9.43.48.105])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  8 Nov 2024 05:24:11 +0000 (GMT)
Message-ID: <ec7819d6-3b4c-43a1-9f51-d649a169f9b5@linux.ibm.com>
Date: Fri, 8 Nov 2024 10:54:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] powerpc/fadump: allocate memory for additional
 parameters early
To: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: Hari Bathini <hbathini@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20241107055817.489795-1-sourabhjain@linux.ibm.com>
 <60e7ee58-25fc-4b66-88f9-f6c33164351a@linux.vnet.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <60e7ee58-25fc-4b66-88f9-f6c33164351a@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vO24iHeNSe-QCaKusw5SgdXv7i0VThRs
X-Proofpoint-GUID: vO24iHeNSe-QCaKusw5SgdXv7i0VThRs
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411080043
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Venkat,

Thanks for testing the patch series.

- Sourabh Jain


On 07/11/24 19:25, Venkat Rao Bagalkote wrote:
> Applied the below patch to 6.12.0-rc6-next20241106 and issue is not 
> seen. Results look good to me.
>
> [root@ltcden8-lp5 ~]# uname -r
> 6.12.0-rc6-next-20241106-00002-gf374fbb4ee1a
> [root@ltcden8-lp5 ~]#
>
> Please add below tag.
>
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
>
> On 07/11/24 11:28 am, Sourabh Jain wrote:
>> From: Hari Bathini <hbathini@linux.ibm.com>
>>
>> Memory for passing additional parameters to fadump capture kernel
>> is allocated during subsys_initcall level, using memblock. But
>> as slab is already available by this time, allocation happens via
>> the buddy allocator. This may work for radix MMU but is likely to
>> fail in most cases for hash MMU as hash MMU needs this memory in
>> the first memory block for it to be accessible in real mode in the
>> capture kernel (second boot). So, allocate memory for additional
>> parameters area as soon as MMU mode is obvious.
>>
>> Fixes: 683eab94da75 ("powerpc/fadump: setup additional parameters for 
>> dump capture kernel")
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
>> Closes: 
>> https://lore.kernel.org/lkml/a70e4064-a040-447b-8556-1fd02f19383d@linux.vnet.ibm.com/T/#u
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>
>> Changelog:
>>
>> Since v1: 
>> https://lore.kernel.org/all/20241104083528.99520-1-sourabhjain@linux.ibm.com/
>>    - Drop extern keyword from fadump_setup_param_area function 
>> declaration
>>    - Don't use __va() while resetting param memory area
>>
>> ---
>>   arch/powerpc/include/asm/fadump.h |  2 ++
>>   arch/powerpc/kernel/fadump.c      | 15 ++++++++++-----
>>   arch/powerpc/kernel/prom.c        |  3 +++
>>   3 files changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/fadump.h 
>> b/arch/powerpc/include/asm/fadump.h
>> index ef40c9b6972a..7b3473e05273 100644
>> --- a/arch/powerpc/include/asm/fadump.h
>> +++ b/arch/powerpc/include/asm/fadump.h
>> @@ -19,6 +19,7 @@ extern int is_fadump_active(void);
>>   extern int should_fadump_crash(void);
>>   extern void crash_fadump(struct pt_regs *, const char *);
>>   extern void fadump_cleanup(void);
>> +void fadump_setup_param_area(void);
>>   extern void fadump_append_bootargs(void);
>>
>>   #else    /* CONFIG_FA_DUMP */
>> @@ -26,6 +27,7 @@ static inline int is_fadump_active(void) { return 0; }
>>   static inline int should_fadump_crash(void) { return 0; }
>>   static inline void crash_fadump(struct pt_regs *regs, const char 
>> *str) { }
>>   static inline void fadump_cleanup(void) { }
>> +static inline void fadump_setup_param_area(void) { }
>>   static inline void fadump_append_bootargs(void) { }
>>   #endif /* !CONFIG_FA_DUMP */
>>
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index a612e7513a4f..3a2863307863 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -1586,6 +1586,12 @@ static void __init fadump_init_files(void)
>>           return;
>>       }
>>
>> +    if (fw_dump.param_area) {
>> +        rc = sysfs_create_file(fadump_kobj, 
>> &bootargs_append_attr.attr);
>> +        if (rc)
>> +            pr_err("unable to create bootargs_append sysfs file 
>> (%d)\n", rc);
>> +    }
>> +
>>       debugfs_create_file("fadump_region", 0444, arch_debugfs_dir, NULL,
>>                   &fadump_region_fops);
>>
>> @@ -1740,7 +1746,7 @@ static void __init fadump_process(void)
>>    * Reserve memory to store additional parameters to be passed
>>    * for fadump/capture kernel.
>>    */
>> -static void __init fadump_setup_param_area(void)
>> +void __init fadump_setup_param_area(void)
>>   {
>>       phys_addr_t range_start, range_end;
>>
>> @@ -1748,7 +1754,7 @@ static void __init fadump_setup_param_area(void)
>>           return;
>>
>>       /* This memory can't be used by PFW or bootloader as it is 
>> shared across kernels */
>> -    if (radix_enabled()) {
>> +    if (early_radix_enabled()) {
>>           /*
>>            * Anywhere in the upper half should be good enough as all 
>> memory
>>            * is accessible in real mode.
>> @@ -1776,12 +1782,12 @@ static void __init fadump_setup_param_area(void)
>>                                  COMMAND_LINE_SIZE,
>>                                  range_start,
>>                                  range_end);
>> -    if (!fw_dump.param_area || sysfs_create_file(fadump_kobj, 
>> &bootargs_append_attr.attr)) {
>> +    if (!fw_dump.param_area) {
>>           pr_warn("WARNING: Could not setup area to pass additional 
>> parameters!\n");
>>           return;
>>       }
>>
>> -    memset(phys_to_virt(fw_dump.param_area), 0, COMMAND_LINE_SIZE);
>> +    memset((void *)fw_dump.param_area, 0, COMMAND_LINE_SIZE);
>>   }
>>
>>   /*
>> @@ -1807,7 +1813,6 @@ int __init setup_fadump(void)
>>       }
>>       /* Initialize the kernel dump memory structure and register 
>> with f/w */
>>       else if (fw_dump.reserve_dump_area_size) {
>> -        fadump_setup_param_area();
>>           fw_dump.ops->fadump_init_mem_struct(&fw_dump);
>>           register_fadump();
>>       }
>> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
>> index 0be07ed407c7..47db1b1aef25 100644
>> --- a/arch/powerpc/kernel/prom.c
>> +++ b/arch/powerpc/kernel/prom.c
>> @@ -908,6 +908,9 @@ void __init early_init_devtree(void *params)
>>
>>       mmu_early_init_devtree();
>>
>> +    /* Setup param area for passing additional parameters to fadump 
>> capture kernel. */
>> +    fadump_setup_param_area();
>> +
>>   #ifdef CONFIG_PPC_POWERNV
>>       /* Scan and build the list of machine check recoverable ranges */
>>       of_scan_flat_dt(early_init_dt_scan_recoverable_ranges, NULL);


