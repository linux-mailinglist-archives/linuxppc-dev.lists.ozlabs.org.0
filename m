Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 485F1798197
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 07:50:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iOmRqZPa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhlZG1VtZz3cCg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 15:50:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iOmRqZPa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhlYL3FTvz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 15:49:26 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3885ic1m019136;
	Fri, 8 Sep 2023 05:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/NVCbDXvMHcTSIZzv2xh7SpnbsqeoOC2Cf/Z+wr0Ins=;
 b=iOmRqZPamB/fIUeMs0ZmzmzFkMBoQuwvNwuKYMLur8heR12jrHvLltDXM6vUr3vcyXNg
 0agqj5jY0Uz5t5eJolD4f0/9qJptOqZNPJ3I6dd3JHGrmlNkIIjfKxEyiVcucGrq9rcK
 5rrDqDL4clzHGQlmmr3VS5ZUICTyNDR0x2YZlUL92Fv5uXLLISk0Pqux127v8WcYZiiQ
 129lZ+347tY2DbkYQ4d10misVcbwejDFxbm5+XvycWCcOzhRCVXkrTApAyE/WKGAx9Cu
 rM3qtJ64KYeWzFqnh3kPH6rIC8UPCcyHXgkuXA63LlBvcqvCXnrCswB4hyuvmYpLyx2B zA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sywdh8fcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 05:49:15 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3885jdU2023624;
	Fri, 8 Sep 2023 05:49:15 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sywdh8fcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 05:49:15 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38844ke1021478;
	Fri, 8 Sep 2023 05:49:14 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svfs01p7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 05:49:14 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3885nBPB8258228
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Sep 2023 05:49:11 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8906520040;
	Fri,  8 Sep 2023 05:49:11 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3EFF20043;
	Fri,  8 Sep 2023 05:49:09 +0000 (GMT)
Received: from [9.43.5.59] (unknown [9.43.5.59])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  8 Sep 2023 05:49:09 +0000 (GMT)
Message-ID: <d6efeaef-2226-5ade-11bc-20038457d2ab@linux.ibm.com>
Date: Fri, 8 Sep 2023 11:19:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] powerpc/fadump: make is_fadump_active() visible
 for exporting vmcore
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20230905183604.568996-1-hbathini@linux.ibm.com>
 <ZPliwJ6b9oNDtAHC@MiWiFi-R3L-srv>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <ZPliwJ6b9oNDtAHC@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GjYGaxyP1NU0gkvaQmCYA0z4aXCm9sy-
X-Proofpoint-ORIG-GUID: HywezhvQKwIbpsfIlmCSI0IALXLvJsdF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_03,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309080049
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Kexec-ml <kexec@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Dave Young <dyoung@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks, Baoquan.

On 07/09/23 11:12 am, Baoquan He wrote:
> On 09/06/23 at 12:06am, Hari Bathini wrote:
>> Include asm/fadump.h in asm/kexec.h to make it visible while exporting
>> vmcore. Also, update is_fadump_active() to return boolean instead of
>> integer for better readability. The change will be used in the next
>> patch to ensure vmcore is exported when fadump is active.
>>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> 
> Thanks, Hari. The whole series looks good to me.
> 
> Acked-by: Baoquan He <bhe@redhat.com>
> 
> Since it's a power specific change, should be picked into powerpc tree?

Michael, would you mind taking the series via powerpc tree..

Thanks
Hari

>> ---
>>
>> Changes in v2:
>> * New patch based on Baoquan's suggestion to use is_fadump_active()
>>    instead of introducing new function is_crashdump_kernel().
>>
>>
>>   arch/powerpc/include/asm/fadump.h | 4 ++--
>>   arch/powerpc/include/asm/kexec.h  | 8 ++++++--
>>   arch/powerpc/kernel/fadump.c      | 4 ++--
>>   3 files changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm/fadump.h
>> index 526a6a647312..27b74a7e2162 100644
>> --- a/arch/powerpc/include/asm/fadump.h
>> +++ b/arch/powerpc/include/asm/fadump.h
>> @@ -15,13 +15,13 @@ extern int crashing_cpu;
>>   
>>   extern int is_fadump_memory_area(u64 addr, ulong size);
>>   extern int setup_fadump(void);
>> -extern int is_fadump_active(void);
>> +extern bool is_fadump_active(void);
>>   extern int should_fadump_crash(void);
>>   extern void crash_fadump(struct pt_regs *, const char *);
>>   extern void fadump_cleanup(void);
>>   
>>   #else	/* CONFIG_FA_DUMP */
>> -static inline int is_fadump_active(void) { return 0; }
>> +static inline bool is_fadump_active(void) { return false; }
>>   static inline int should_fadump_crash(void) { return 0; }
>>   static inline void crash_fadump(struct pt_regs *regs, const char *str) { }
>>   static inline void fadump_cleanup(void) { }
>> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
>> index a1ddba01e7d1..b760ef459234 100644
>> --- a/arch/powerpc/include/asm/kexec.h
>> +++ b/arch/powerpc/include/asm/kexec.h
>> @@ -51,6 +51,7 @@
>>   
>>   #ifndef __ASSEMBLY__
>>   #include <asm/reg.h>
>> +#include <asm/fadump.h>
>>   
>>   typedef void (*crash_shutdown_t)(void);
>>   
>> @@ -99,10 +100,13 @@ void relocate_new_kernel(unsigned long indirection_page, unsigned long reboot_co
>>   
>>   void kexec_copy_flush(struct kimage *image);
>>   
>> -#if defined(CONFIG_CRASH_DUMP) && defined(CONFIG_PPC_RTAS)
>> +#if defined(CONFIG_CRASH_DUMP)
>> +#define is_fadump_active		is_fadump_active
>> +#if defined(CONFIG_PPC_RTAS)
>>   void crash_free_reserved_phys_range(unsigned long begin, unsigned long end);
>>   #define crash_free_reserved_phys_range crash_free_reserved_phys_range
>> -#endif
>> +#endif /* CONFIG_PPC_RTAS */
>> +#endif /* CONFIG_CRASH_DUMP */
>>   
>>   #ifdef CONFIG_KEXEC_FILE
>>   extern const struct kexec_file_ops kexec_elf64_ops;
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index 3ff2da7b120b..5682a65e8326 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -187,9 +187,9 @@ int should_fadump_crash(void)
>>   	return 1;
>>   }
>>   
>> -int is_fadump_active(void)
>> +bool is_fadump_active(void)
>>   {
>> -	return fw_dump.dump_active;
>> +	return !!fw_dump.dump_active;
>>   }
>>   
>>   /*
>> -- 
>> 2.41.0
>>
> 
