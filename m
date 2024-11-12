Return-Path: <linuxppc-dev+bounces-3106-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 864859C52D5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 11:11:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnhzC1BcHz2xg8;
	Tue, 12 Nov 2024 21:11:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731406311;
	cv=none; b=bTf8p6eQD/lSgpv7T8+E52Xh3bUPrzb6gmJ5wNoHgOS2wrHbFixxKIKBvUTaPa+i/GvdXgWLnAHevKfrtze2vO/l5pMYeio/i9ZUzeBjuzFI1BpzH0tXKFu2SzSSuZ3BbMmJUC7QzSUqBonNe/EBjgtIH4UIQ9La7pFk3djXUUOIWUJ3VrGgg9BcdXPDAxtuMLTgcieTd0E8A8f5Im9AHf10ESvHi9Lbh1E79bGnOnAt+t7NpuV0IY4UtjCa6ZUUjqTif++3aeb8YNU0Ctf10HZdrGo4D439FKPD6KOJMNY9PhR7oq11ir5auq7pSE72UnSorHVpEC+OSvGbrVRD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731406311; c=relaxed/relaxed;
	bh=zKzlLQNr7v+OknzMbxr0+U26EVRBvKwwEXVUNgu1Ykw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dXQ4vcIwM2rg2hOhJFdO+Xv49QkSnevksBNab49NRlBm7C7OKA2SVgSgdgZtrq4xSpIqiUaNF3hmmK0DbmEpw4Wf3uNveoSj3UIk+dIjW1weJ5GkJiMQiE4WruOSii31ehT4d3aEWMJdkKg/v9TsJmI/Sbwl/DgG/EfazqV+CrIMGljtPyVIjF7JL3VMKukCSXcqidlOdSzw7FR+9HhCaesJMp9FHNUSCx1yvt3KdMDSIUOAQ245PrlZKZmypv0ukkijlvbbSpaI3Z3+oEAIDdk7l93vCxfAHNWSTKcxo/yDl3Y2Mo1ZO8yisEds002CDz6j814Fhxs4lY44ThUhtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WQxEUcB0; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WQxEUcB0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xnhz90SCfz2xfb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 21:11:48 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC9AKTD003344;
	Tue, 12 Nov 2024 10:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=zKzlLQ
	Nr7v+OknzMbxr0+U26EVRBvKwwEXVUNgu1Ykw=; b=WQxEUcB03XAP/2DJPnDA0Z
	9D7/XkhLJoY4pQUH+PaZy0H4OhwCwMP4UUROeued+PlVaPIvpow1xlkC1UDNR5IQ
	3qCLTuaSKN6ShXFfsP8ByypmHaeXGtWLv67N4OXHQJoCHy/ogffbkGzvBbkVROey
	hwv/Rq221QA0IZFlQCbnzsWuuDdcH8Jtqu3KHZOcI8Ij+GSbPUO7Yy4kuQP3OKTw
	Nr7Pi4vIE4ZzYmdGvwvc+174YErAMde4AxVrmxFXFvorbNeVfd/vuChFqYS4G0OC
	0tF5fq7pY3EsYVSRjl6+8Wf7N4GZE2V6iUX8SXYpc/v5x7JJzq91urDeDCHRuXaQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42v45607hv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 10:11:38 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4ACA6lp7001156;
	Tue, 12 Nov 2024 10:11:37 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42v45607ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 10:11:37 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC7UU8T006616;
	Tue, 12 Nov 2024 10:11:36 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 42tm9jbwnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 10:11:36 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4ACABXbP22086330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Nov 2024 10:11:33 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 515562004B;
	Tue, 12 Nov 2024 10:11:33 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65EAA2004D;
	Tue, 12 Nov 2024 10:11:31 +0000 (GMT)
Received: from [9.43.111.219] (unknown [9.43.111.219])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Nov 2024 10:11:31 +0000 (GMT)
Message-ID: <364706f8-4cb5-4787-98fd-9279936ebdc7@linux.ibm.com>
Date: Tue, 12 Nov 2024 15:41:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] powerpc/fadump: allocate memory for additional
 parameters early
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: Hari Bathini <hbathini@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20241107055817.489795-1-sourabhjain@linux.ibm.com>
 <87y11plyrp.fsf@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87y11plyrp.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mN_WM_n7bOydvPAX3to3yhKVKDD1HJgU
X-Proofpoint-ORIG-GUID: UMJnR_UsTSapuoaVbppfi8uDmgE1ZI-T
Content-Transfer-Encoding: 7bit
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120082
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Ritesh

On 12/11/24 12:33, Ritesh Harjani (IBM) wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>
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
> But looks like this was only caught due to the WARN_ON_ONCE emitted from
> mm/memblock.c which detected accidental use of memblock APIs when slab is
> available. That begs a question on why didn't we see the issue on Hash?

We do see the issues with the hash as mentioned in the commit message.

> Are we not using the "param_area_supported" feature that often is it?

Yes, because it is a relatively new feature, and the userspace changes 
required to
make use of this feature using kdump service are not part of the distro yet.


>
>> Fixes: 683eab94da75 ("powerpc/fadump: setup additional parameters for dump capture kernel")
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
>> Closes: https://lore.kernel.org/lkml/a70e4064-a040-447b-8556-1fd02f19383d@linux.vnet.ibm.com/T/#u
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>
>> Changelog:
>>
>> Since v1: https://lore.kernel.org/all/20241104083528.99520-1-sourabhjain@linux.ibm.com/
>>    - Drop extern keyword from fadump_setup_param_area function declaration
>>    - Don't use __va() while resetting param memory area
>>
>> ---
>>   arch/powerpc/include/asm/fadump.h |  2 ++
>>   arch/powerpc/kernel/fadump.c      | 15 ++++++++++-----
>>   arch/powerpc/kernel/prom.c        |  3 +++
>>   3 files changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm/fadump.h
>> index ef40c9b6972a..7b3473e05273 100644
>> --- a/arch/powerpc/include/asm/fadump.h
>> +++ b/arch/powerpc/include/asm/fadump.h
>> @@ -19,6 +19,7 @@ extern int is_fadump_active(void);
>>   extern int should_fadump_crash(void);
>>   extern void crash_fadump(struct pt_regs *, const char *);
>>   extern void fadump_cleanup(void);
>> +void fadump_setup_param_area(void);
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
>> index a612e7513a4f..3a2863307863 100644
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
>> +	memset((void *)fw_dump.param_area, 0, COMMAND_LINE_SIZE);
>>   }
>>   
>>   /*
>> @@ -1807,7 +1813,6 @@ int __init setup_fadump(void)
>>   	}
>>   	/* Initialize the kernel dump memory structure and register with f/w */
>>   	else if (fw_dump.reserve_dump_area_size) {
>> -		fadump_setup_param_area();
>>   		fw_dump.ops->fadump_init_mem_struct(&fw_dump);
>>   		register_fadump();
>>   	}
>> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
>> index 0be07ed407c7..47db1b1aef25 100644
>> --- a/arch/powerpc/kernel/prom.c
>> +++ b/arch/powerpc/kernel/prom.c
>> @@ -908,6 +908,9 @@ void __init early_init_devtree(void *params)
>>   
>>   	mmu_early_init_devtree();
>>   
>> +	/* Setup param area for passing additional parameters to fadump capture kernel. */
>> +	fadump_setup_param_area();
>> +
> Maybe we should add a comment here saying this needs to be done after
> mmu_early_init_devtree() because for pseries LPARs we need to be able to
> reliably use early_radix_enabled() helper within fadump_setup_param_area().

Sure, I will update the comment to indicate that the
fadump_setup_param_area() function must be called once the MMU is finalized.

>
> Either ways the patch looks good to me. So please feel free to add -
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Thanks for the review Ritesh.

- Sourabh Jain

