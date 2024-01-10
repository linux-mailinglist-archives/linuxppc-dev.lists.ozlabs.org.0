Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB2F8292E2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 04:55:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pWydVyLK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8v8x22n9z3bn7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 14:55:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pWydVyLK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8v8274Bzz30Np
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jan 2024 14:54:58 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40A3okpQ001962;
	Wed, 10 Jan 2024 03:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pUVAfEd8UZ3Kgup8PAC9DYXLhqDnscMMx6ZISfm/AQk=;
 b=pWydVyLKGGPmxZhuha3gk3Prcbyg3OH+amTdw7dUElYRWTNxAXGqjmA5xE/BWRHzhBxQ
 zDISFDYoMP7DfpLar24xEydEFX2MQLnFO9vLtNZ1ZZjEQy0UjPUBiO533SeTJjtDCItJ
 lw0THHlZLb9PMOAbWAPTOKs05YF9MA/z1KOVo+wDPrNPQMzAHtlTPEyORGOSeWa+Os9T
 cFv3jbcWB6O0lyl9LmT1gMDA5/T3Jsa9gtKXpV/RMzhtG/G8EqRaoOl+oqFWdAnRnTqt
 dAYrWlwm5P4vmmCHHAqp5hRQh/iIK8Ts8cyq85vNl7meihD+vKwZE8bt8ofPvJpBQ9tP SQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vher165ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 03:54:42 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40A3pPpm003780;
	Wed, 10 Jan 2024 03:54:42 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vher165g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 03:54:42 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40A1AjOq022793;
	Wed, 10 Jan 2024 03:54:41 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vfhjyk3m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 03:54:41 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40A3sdW728836314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jan 2024 03:54:39 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5229920043;
	Wed, 10 Jan 2024 03:54:39 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87BE720040;
	Wed, 10 Jan 2024 03:54:38 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 Jan 2024 03:54:38 +0000 (GMT)
Received: from [10.61.2.106] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id F126560218;
	Wed, 10 Jan 2024 14:54:33 +1100 (AEDT)
Message-ID: <74ad4d5f-7bf7-484c-9386-07945f0c6c5d@linux.ibm.com>
Date: Wed, 10 Jan 2024 14:54:06 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] powerpc: Define KMSAN metadata address ranges for
 vmalloc and ioremap
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "glider@google.com" <glider@google.com>,
        "elver@google.com"
 <elver@google.com>,
        "dvyukov@google.com" <dvyukov@google.com>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "npiggin@gmail.com" <npiggin@gmail.com>
References: <20231214055539.9420-1-nicholas@linux.ibm.com>
 <20231214055539.9420-11-nicholas@linux.ibm.com>
 <d24c430a-bde5-4432-8550-57de33cb203c@csgroup.eu>
Content-Language: en-US
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
In-Reply-To: <d24c430a-bde5-4432-8550-57de33cb203c@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hNZCu3MwXqikP36POMF8gOd8dje9b0A4
X-Proofpoint-ORIG-GUID: aw9dGrggdNPFi0nAkY_dW39AreN6AI7l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-09_13,2024-01-09_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011 spamscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401100029
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "iii@linux.ibm.com" <iii@linux.ibm.com>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 14/12/2023 8:17 pm, Christophe Leroy wrote:
> 
> 
> Le 14/12/2023 à 06:55, Nicholas Miehlbradt a écrit :
>> Splits the vmalloc region into four. The first quarter is the new
>> vmalloc region, the second is used to store shadow metadata and the
>> third is used to store origin metadata. The fourth quarter is unused.
>>
>> Do the same for the ioremap region.
>>
>> Module data is stored in the vmalloc region so alias the modules
>> metadata addresses to the respective vmalloc metadata addresses. Define
>> MODULES_VADDR and MODULES_END to the start and end of the vmalloc
>> region.
>>
>> Since MODULES_VADDR was previously only defined on ppc32 targets checks
>> for if this macro is defined need to be updated to include
>> defined(CONFIG_PPC32).
> 
> Why ?
> 
> In your case MODULES_VADDR is above PAGE_OFFSET so there should be no
> difference.
> 
> Christophe
> 
On 64 bit builds the BUILD_BUG always triggers since MODULES_VADDR 
expands to __vmalloc_start which is defined in a different translation 
unit. I can restrict the #ifdef CONFIG_PPC32 to just around the 
BUILD_BUG since as you pointed out there is no difference otherwise.
>>
>> Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
>> ---
>>    arch/powerpc/include/asm/book3s/64/pgtable.h | 42 ++++++++++++++++++++
>>    arch/powerpc/kernel/module.c                 |  2 +-
>>    2 files changed, 43 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> index cb77eddca54b..b3a02b8d96e3 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -249,7 +249,38 @@ enum pgtable_index {
>>    extern unsigned long __vmalloc_start;
>>    extern unsigned long __vmalloc_end;
>>    #define VMALLOC_START	__vmalloc_start
>> +
>> +#ifndef CONFIG_KMSAN
>>    #define VMALLOC_END	__vmalloc_end
>> +#else
>> +/*
>> + * In KMSAN builds vmalloc area is four times smaller, and the remaining 3/4
>> + * are used to keep the metadata for virtual pages. The memory formerly
>> + * belonging to vmalloc area is now laid out as follows:
>> + *
>> + * 1st quarter: VMALLOC_START to VMALLOC_END - new vmalloc area
>> + * 2nd quarter: KMSAN_VMALLOC_SHADOW_START to
>> + *              KMSAN_VMALLOC_SHADOW_START+VMALLOC_LEN - vmalloc area shadow
>> + * 3rd quarter: KMSAN_VMALLOC_ORIGIN_START to
>> + *              KMSAN_VMALLOC_ORIGIN_START+VMALLOC_LEN - vmalloc area origins
>> + * 4th quarter: unused
>> + */
>> +#define VMALLOC_LEN ((__vmalloc_end - __vmalloc_start) >> 2)
>> +#define VMALLOC_END (VMALLOC_START + VMALLOC_LEN)
>> +
>> +#define KMSAN_VMALLOC_SHADOW_START VMALLOC_END
>> +#define KMSAN_VMALLOC_ORIGIN_START (VMALLOC_END + VMALLOC_LEN)
>> +
>> +/*
>> + * Module metadata is stored in the corresponding vmalloc metadata regions
>> + */
>> +#define KMSAN_MODULES_SHADOW_START	KMSAN_VMALLOC_SHADOW_START
>> +#define KMSAN_MODULES_ORIGIN_START	KMSAN_VMALLOC_ORIGIN_START
>> +#endif /* CONFIG_KMSAN */
>> +
>> +#define MODULES_VADDR VMALLOC_START
>> +#define MODULES_END VMALLOC_END
>> +#define MODULES_LEN		(MODULES_END - MODULES_VADDR)
>>    
>>    static inline unsigned int ioremap_max_order(void)
>>    {
>> @@ -264,7 +295,18 @@ extern unsigned long __kernel_io_start;
>>    extern unsigned long __kernel_io_end;
>>    #define KERN_VIRT_START __kernel_virt_start
>>    #define KERN_IO_START  __kernel_io_start
>> +#ifndef CONFIG_KMSAN
>>    #define KERN_IO_END __kernel_io_end
>> +#else
>> +/*
>> + * In KMSAN builds IO space is 4 times smaller, the remaining space is used to
>> + * store metadata. See comment for vmalloc regions above.
>> + */
>> +#define KERN_IO_LEN             ((__kernel_io_end - __kernel_io_start) >> 2)
>> +#define KERN_IO_END             (KERN_IO_START + KERN_IO_LEN)
>> +#define KERN_IO_SHADOW_START    KERN_IO_END
>> +#define KERN_IO_ORIGIN_START    (KERN_IO_SHADOW_START + KERN_IO_LEN)
>> +#endif /* !CONFIG_KMSAN */
>>    
>>    extern struct page *vmemmap;
>>    extern unsigned long pci_io_base;
>> diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
>> index f6d6ae0a1692..5043b959ad4d 100644
>> --- a/arch/powerpc/kernel/module.c
>> +++ b/arch/powerpc/kernel/module.c
>> @@ -107,7 +107,7 @@ __module_alloc(unsigned long size, unsigned long start, unsigned long end, bool
>>    
>>    void *module_alloc(unsigned long size)
>>    {
>> -#ifdef MODULES_VADDR
>> +#if defined(MODULES_VADDR) && defined(CONFIG_PPC32)
>>    	unsigned long limit = (unsigned long)_etext - SZ_32M;
>>    	void *ptr = NULL;
>>    
