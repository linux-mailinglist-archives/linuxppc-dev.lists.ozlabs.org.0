Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 863768292F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 05:10:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fiEa4OsP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8vTs0dllz30gr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 15:10:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fiEa4OsP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8vSz0PXtz2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jan 2024 15:09:38 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40A1qbdo008950;
	Wed, 10 Jan 2024 04:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=PN/94FNaJE5gXuuzukilNXUTnIvClfuno9VY3Eps0R8=;
 b=fiEa4OsPs7mzzWN6LJLSNGojGvo1Jd61aFcftfiU+A741rz2mJCMWN5i+R9ZmYn09Lou
 jjQDU7U7Znd7KAxCH98MDn8BKpxYTm6LgF5RiV0oc4cz/Q4mwhRgJlqOsNDqg772rEEB
 X7tdTzLGZAvpQDzb7yTw/ihX/R7j/8Zx3eXAKoq2QvCgimc1MmZT79QS9G5Bp+Q1WAJP
 uA+ygcomKtkhSW5tZ0LUcMK/e5mgjltgU86MsbFTZRb4/LdlAdmGF3HzUNrMNDX1gQ+Z
 I1T3W2ER0szME8cBpJ35Q7zKJmoaTbFsPpzE6mfVbkdsToVyGIFTCPel3MRBFvRUxM++ Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vhhxytac6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 04:09:24 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40A41KHw022734;
	Wed, 10 Jan 2024 04:09:23 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vhhxytabj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 04:09:23 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40A3AoRI000893;
	Wed, 10 Jan 2024 04:09:22 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vfkdkansb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 04:09:22 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40A49KhL24707790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jan 2024 04:09:20 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA8B420043;
	Wed, 10 Jan 2024 04:09:20 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C835E20040;
	Wed, 10 Jan 2024 04:09:19 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 Jan 2024 04:09:19 +0000 (GMT)
Received: from [10.61.2.106] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 845DE60218;
	Wed, 10 Jan 2024 15:09:17 +1100 (AEDT)
Message-ID: <55c57f88-9975-4510-b6bc-7e78462e0a62@linux.ibm.com>
Date: Wed, 10 Jan 2024 15:09:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] powerpc/string: Add KMSAN support
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "glider@google.com" <glider@google.com>,
        "elver@google.com"
 <elver@google.com>,
        "dvyukov@google.com" <dvyukov@google.com>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "npiggin@gmail.com" <npiggin@gmail.com>
References: <20231214055539.9420-1-nicholas@linux.ibm.com>
 <20231214055539.9420-13-nicholas@linux.ibm.com>
 <2f35548a-bdbd-4c37-8f60-cebeb381a7af@csgroup.eu>
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
In-Reply-To: <2f35548a-bdbd-4c37-8f60-cebeb381a7af@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Z0gqHeXQBF-DTvYR8mq_KFNHfNuG0Tvm
X-Proofpoint-ORIG-GUID: 7207fUxSVPuK1YLYSW2F-TQqKjaebXMm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-09_13,2024-01-09_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401100031
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



On 14/12/2023 8:25 pm, Christophe Leroy wrote:
> 
> 
> Le 14/12/2023 à 06:55, Nicholas Miehlbradt a écrit :
>> KMSAN expects functions __mem{set,cpy,move} so add aliases pointing to
>> the respective functions.
>>
>> Disable use of architecture specific memset{16,32,64} to ensure that
>> metadata is correctly updated and strn{cpy,cmp} and mem{chr,cmp} which
>> are implemented in assembly and therefore cannot be instrumented to
>> propagate/check metadata.
>>
>> Alias calls to mem{set,cpy,move} to __msan_mem{set,cpy,move} in
>> instrumented code to correctly propagate metadata.
>>
>> Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
>> ---
>>    arch/powerpc/include/asm/kmsan.h               |  7 +++++++
>>    arch/powerpc/include/asm/string.h              | 18 ++++++++++++++++--
>>    arch/powerpc/lib/Makefile                      |  2 ++
>>    arch/powerpc/lib/mem_64.S                      |  5 ++++-
>>    arch/powerpc/lib/memcpy_64.S                   |  2 ++
>>    .../selftests/powerpc/copyloops/asm/kmsan.h    |  0
>>    .../selftests/powerpc/copyloops/linux/export.h |  1 +
>>    7 files changed, 32 insertions(+), 3 deletions(-)
>>    create mode 100644 tools/testing/selftests/powerpc/copyloops/asm/kmsan.h
>>
>> diff --git a/arch/powerpc/include/asm/kmsan.h b/arch/powerpc/include/asm/kmsan.h
>> index bc84f6ff2ee9..fc59dc24e170 100644
>> --- a/arch/powerpc/include/asm/kmsan.h
>> +++ b/arch/powerpc/include/asm/kmsan.h
>> @@ -7,6 +7,13 @@
>>    #ifndef _ASM_POWERPC_KMSAN_H
>>    #define _ASM_POWERPC_KMSAN_H
>>    
>> +#ifdef CONFIG_KMSAN
>> +#define EXPORT_SYMBOL_KMSAN(fn) SYM_FUNC_ALIAS(__##fn, fn) \
>> +				EXPORT_SYMBOL(__##fn)
>> +#else
>> +#define EXPORT_SYMBOL_KMSAN(fn)
>> +#endif
>> +
>>    #ifndef __ASSEMBLY__
>>    #ifndef MODULE
>>    
>> diff --git a/arch/powerpc/include/asm/string.h b/arch/powerpc/include/asm/string.h
>> index 60ba22770f51..412626ce619b 100644
>> --- a/arch/powerpc/include/asm/string.h
>> +++ b/arch/powerpc/include/asm/string.h
>> @@ -4,7 +4,7 @@
>>    
>>    #ifdef __KERNEL__
>>    
>> -#ifndef CONFIG_KASAN
>> +#if !defined(CONFIG_KASAN) && !defined(CONFIG_KMSAN)
>>    #define __HAVE_ARCH_STRNCPY
>>    #define __HAVE_ARCH_STRNCMP
>>    #define __HAVE_ARCH_MEMCHR
>> @@ -56,8 +56,22 @@ void *__memmove(void *to, const void *from, __kernel_size_t n);
>>    #endif /* CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX */
>>    #endif /* CONFIG_KASAN */
>>    
>> +#ifdef CONFIG_KMSAN
>> +
>> +void *__memset(void *s, int c, __kernel_size_t count);
>> +void *__memcpy(void *to, const void *from, __kernel_size_t n);
>> +void *__memmove(void *to, const void *from, __kernel_size_t n);
>> +
> 
> The same is done for KASAN, can't you reuse it ?
> 
I tried this but I believe it makes the file more disorganised and 
difficult to edit since there ends up being a set of definitions for 
each intersection of features e.g. the definitions needed for both KASAN 
and KMSAN, just KASAN, just KMSAN, etc.

This way it's clearer what each sanitizer needs and changing definitions 
for one one sanitizer won't require refactors affecting other sanitizers.

>> +#ifdef __SANITIZE_MEMORY__
>> +#include <linux/kmsan_string.h>
>> +#define memset __msan_memset
>> +#define memcpy __msan_memcpy
>> +#define memmove __msan_memmove
>> +#endif
> 
> Will that work as you wish ?
> What about the calls to memset() or memcpy() emited directly by GCC ?
> 
These are handled by the compiler instrumentation which replaces these 
with calls to the instrumented equivalent.

>> +#endif /* CONFIG_KMSAN */
>> +
>>    #ifdef CONFIG_PPC64
>> -#ifndef CONFIG_KASAN
>> +#if !defined(CONFIG_KASAN) && !defined(CONFIG_KMSAN)
>>    #define __HAVE_ARCH_MEMSET32
>>    #define __HAVE_ARCH_MEMSET64
>>    
>> diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
>> index 51ad0397c17a..fc3ea3eebbd6 100644
>> --- a/arch/powerpc/lib/Makefile
>> +++ b/arch/powerpc/lib/Makefile
>> @@ -32,9 +32,11 @@ obj-y += code-patching.o feature-fixups.o pmem.o
>>    obj-$(CONFIG_CODE_PATCHING_SELFTEST) += test-code-patching.o
>>    
>>    ifndef CONFIG_KASAN
>> +ifndef CONFIG_KMSAN
>>    obj-y	+=	string.o memcmp_$(BITS).o
>>    obj-$(CONFIG_PPC32)	+= strlen_32.o
>>    endif
>> +endif
>>    
>>    obj-$(CONFIG_PPC32)	+= div64.o copy_32.o crtsavres.o
>>    
>> diff --git a/arch/powerpc/lib/mem_64.S b/arch/powerpc/lib/mem_64.S
>> index 6fd06cd20faa..a55f2fac49b3 100644
>> --- a/arch/powerpc/lib/mem_64.S
>> +++ b/arch/powerpc/lib/mem_64.S
>> @@ -9,8 +9,9 @@
>>    #include <asm/errno.h>
>>    #include <asm/ppc_asm.h>
>>    #include <asm/kasan.h>
>> +#include <asm/kmsan.h>
>>    
>> -#ifndef CONFIG_KASAN
>> +#if !defined(CONFIG_KASAN) && !defined(CONFIG_KMSAN)
>>    _GLOBAL(__memset16)
>>    	rlwimi	r4,r4,16,0,15
>>    	/* fall through */
>> @@ -96,6 +97,7 @@ _GLOBAL_KASAN(memset)
>>    	blr
>>    EXPORT_SYMBOL(memset)
>>    EXPORT_SYMBOL_KASAN(memset)
>> +EXPORT_SYMBOL_KMSAN(memset)
>>    
>>    _GLOBAL_TOC_KASAN(memmove)
>>    	cmplw	0,r3,r4
>> @@ -140,3 +142,4 @@ _GLOBAL(backwards_memcpy)
>>    	b	1b
>>    EXPORT_SYMBOL(memmove)
>>    EXPORT_SYMBOL_KASAN(memmove)
>> +EXPORT_SYMBOL_KMSAN(memmove)
>> diff --git a/arch/powerpc/lib/memcpy_64.S b/arch/powerpc/lib/memcpy_64.S
>> index b5a67e20143f..1657861618cc 100644
>> --- a/arch/powerpc/lib/memcpy_64.S
>> +++ b/arch/powerpc/lib/memcpy_64.S
>> @@ -8,6 +8,7 @@
>>    #include <asm/asm-compat.h>
>>    #include <asm/feature-fixups.h>
>>    #include <asm/kasan.h>
>> +#include <asm/kmsan.h>
>>    
>>    #ifndef SELFTEST_CASE
>>    /* For big-endian, 0 == most CPUs, 1 == POWER6, 2 == Cell */
>> @@ -228,3 +229,4 @@ END_FTR_SECTION_IFCLR(CPU_FTR_UNALIGNED_LD_STD)
>>    #endif
>>    EXPORT_SYMBOL(memcpy)
>>    EXPORT_SYMBOL_KASAN(memcpy)
>> +EXPORT_SYMBOL_KMSAN(memcpy)
>> diff --git a/tools/testing/selftests/powerpc/copyloops/asm/kmsan.h b/tools/testing/selftests/powerpc/copyloops/asm/kmsan.h
>> new file mode 100644
>> index 000000000000..e69de29bb2d1
>> diff --git a/tools/testing/selftests/powerpc/copyloops/linux/export.h b/tools/testing/selftests/powerpc/copyloops/linux/export.h
>> index e6b80d5fbd14..6379624bbf9b 100644
>> --- a/tools/testing/selftests/powerpc/copyloops/linux/export.h
>> +++ b/tools/testing/selftests/powerpc/copyloops/linux/export.h
>> @@ -2,3 +2,4 @@
>>    #define EXPORT_SYMBOL(x)
>>    #define EXPORT_SYMBOL_GPL(x)
>>    #define EXPORT_SYMBOL_KASAN(x)
>> +#define EXPORT_SYMBOL_KMSAN(x)
