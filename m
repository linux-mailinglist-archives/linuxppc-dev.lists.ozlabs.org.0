Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 807FB7CBBCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 08:58:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GUeyKd8d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8lDg3GDbz3cSg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 17:58:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GUeyKd8d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8lCl6X2Kz2yVv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 17:57:23 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39H6m2CX001157;
	Tue, 17 Oct 2023 06:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Aoq/TfmR+3EqbzYQXP11Q844hFYlhfZRSa5eM2tQUxg=;
 b=GUeyKd8dMRcOoXTUFz8vkvfIix76aFxzOGFz/12BqMQlY2MBBqIYguNcCFtZOOGJWsPO
 US0olhgp8wPfz5P+kRo/MQYAJVytY4RBta93xLrZk/HgbNYAqAkZNqCdzlm2GTN8AuD/
 5BrCZBp2LQKCFwoiKW/wftQ8g0rJz0Wh938o3s88L75jqNVoAl2ytQ5cqeKwrLjyR3dr
 CPe2c42ni5gFxWTFB7I+p9DX6+QX4tC81FtqScN2pzi3wZGJKDgGnx0CtPFsmJ8Ld4C/
 lCIgDqEVoJbHdU1WCBOaI8qAt1g6hCk00WMuZAXKP8A/tUjPZMwDtHdH0zWpLZcuHXK2 ag== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tsnae0dh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 06:57:16 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39H5ZvNR012858;
	Tue, 17 Oct 2023 06:57:06 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tr5py6pbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 06:57:05 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39H6v38w21955174
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Oct 2023 06:57:03 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B95DB20049;
	Tue, 17 Oct 2023 06:57:03 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D6F8820040;
	Tue, 17 Oct 2023 06:57:02 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Oct 2023 06:57:02 +0000 (GMT)
Received: from [9.43.201.62] (unknown [9.43.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8D41A600D6;
	Tue, 17 Oct 2023 17:56:58 +1100 (AEDT)
Message-ID: <6dcfb1dc-ff4b-485d-befc-4928bb1460a4@linux.ibm.com>
Date: Tue, 17 Oct 2023 17:56:55 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add generic data patching functions
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20231016050147.115686-1-bgray@linux.ibm.com>
 <e2fd9e0a-9371-c8a8-39de-6bca99732567@csgroup.eu>
Content-Language: en-US, en-AU
From: Benjamin Gray <bgray@linux.ibm.com>
In-Reply-To: <e2fd9e0a-9371-c8a8-39de-6bca99732567@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kKsbVJvQlc-vYY2ziostIxmekDF11icU
X-Proofpoint-ORIG-GUID: kKsbVJvQlc-vYY2ziostIxmekDF11icU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_13,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310170057
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17/10/23 5:39 pm, Christophe Leroy wrote:
> Le 16/10/2023 à 07:01, Benjamin Gray a écrit :
>> Currently patch_instruction() bases the write length on the value being
>> written. If the value looks like a prefixed instruction it writes 8 bytes,
>> otherwise it writes 4 bytes. This makes it potentially buggy to use for
>> writing arbitrary data, as if you want to write 4 bytes but it decides to
>> write 8 bytes it may clobber the following memory or be unaligned and
>> trigger an oops if it tries to cross a page boundary.
>>
>> To solve this, this series pulls out the size parameter to the 'top' of
>> the text patching logic, and propagates it through the various functions.
>>
>> The two sizes supported are int and long; this allows for patching
>> instructions and pointers on both ppc32 and ppc64. On ppc32 these are the
>> same size, so care is taken to only use the size parameter on static
>> functions, so the compiler can optimise it out entirely. Unfortunately
>> GCC trips over its own feet here and won't optimise in a way that is
>> optimal for strict RWX (mpc85xx_smp_defconfig) and no RWX
>> (pmac32_defconfig).
>>
>> In the first case, patch_memory() is very large and can only be inlined
>> if a single function calls it. While the source only calls it in
>> patch_instruction(), an earlier optimisation pass inlined
>> patch_instruction() into patch_branch(), so now there are 'two' references
>> to patch_memory() and it cannot be inlined into patch_instruction().
>> Instead patch_instruction() becomes a single branch directly to
>> patch_memory().
>>
>> We can fix this by marking patch_instruction() as noinline, but this
>> prevents patch_memory() from being directly inlined into patch_branch()
>> when RWX is disabled and patch_memory() is very small.
>>
>> It may be possible to avoid this by merging together patch_instruction()
>> and patch_memory() on ppc32, but the only way I can think to do this
>> without duplicating the implementation involves using the preprocessor
>> to change if is_dword is a parameter or a local variable, which is gross.
> 
> What about:
> 
> diff --git a/arch/powerpc/include/asm/code-patching.h
> b/arch/powerpc/include/asm/code-patching.h
> index 7c6056bb1706..af89ef450c93 100644
> --- a/arch/powerpc/include/asm/code-patching.h
> +++ b/arch/powerpc/include/asm/code-patching.h
> @@ -72,7 +72,7 @@ static inline int create_branch(ppc_inst_t *instr,
> const u32 *addr,
>    int create_cond_branch(ppc_inst_t *instr, const u32 *addr,
>    		       unsigned long target, int flags);
>    int patch_branch(u32 *addr, unsigned long target, int flags);
> -int patch_instruction(u32 *addr, ppc_inst_t instr);
> +int patch_memory(void *addr, unsigned long val, bool is_dword);
>    int raw_patch_instruction(u32 *addr, ppc_inst_t instr);
> 
>    /*
> @@ -87,24 +87,28 @@ int raw_patch_instruction(u32 *addr, ppc_inst_t instr);
> 
>    #ifdef CONFIG_PPC64
> 
> -int patch_uint(void *addr, unsigned int val);
> -int patch_ulong(void *addr, unsigned long val);
> +int patch_instruction(u32 *addr, ppc_inst_t instr);
> 
>    #define patch_u64 patch_ulong
> 
>    #else
> 
> -static inline int patch_uint(u32 *addr, unsigned int val)
> +static inline int patch_instruction(u32 *addr, ppc_inst_t instr)
>    {
> -	return patch_instruction(addr, ppc_inst(val));
> +	return patch_memory(addr, ppc_inst_val(instr), false);
>    }
> 
> +#endif
> +
>    static inline int patch_ulong(void *addr, unsigned long val)
>    {
> -	return patch_instruction(addr, ppc_inst(val));
> +	return patch_memory(addr, val, true);
>    }
> 
> -#endif
> +static inline int patch_uint(void *addr, unsigned int val)
> +{
> +	return patch_memory(addr, val, false);
> +}
> 
>    #define patch_u32 patch_uint
> 
> diff --git a/arch/powerpc/lib/code-patching.c
> b/arch/powerpc/lib/code-patching.c
> index 60289332412f..77418b2a4aa4 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -355,7 +355,7 @@ static int __do_patch_memory(void *addr, unsigned
> long val, bool is_dword)
>    	return err;
>    }
> 
> -static int patch_memory(void *addr, unsigned long val, bool is_dword)
> +int patch_memory(void *addr, unsigned long val, bool is_dword)
>    {
>    	int err;
>    	unsigned long flags;
> @@ -378,6 +378,7 @@ static int patch_memory(void *addr, unsigned long
> val, bool is_dword)
> 
>    	return err;
>    }
> +NOKPROBE_SYMBOL(patch_memory)
> 
>    #ifdef CONFIG_PPC64
> 
> @@ -390,26 +391,6 @@ int patch_instruction(u32 *addr, ppc_inst_t instr)
>    }
>    NOKPROBE_SYMBOL(patch_instruction)
> 
> -int patch_uint(void *addr, unsigned int val)
> -{
> -	return patch_memory(addr, val, false);
> -}
> -NOKPROBE_SYMBOL(patch_uint)
> -
> -int patch_ulong(void *addr, unsigned long val)
> -{
> -	return patch_memory(addr, val, true);
> -}
> -NOKPROBE_SYMBOL(patch_ulong)
> -
> -#else
> -
> -int patch_instruction(u32 *addr, ppc_inst_t instr)
> -{
> -	return patch_memory(addr, ppc_inst_val(instr), false);
> -}
> -NOKPROBE_SYMBOL(patch_instruction)
> -
>    #endif
> 
>    int patch_branch(u32 *addr, unsigned long target, int flags)
> 

Wouldn't every caller need to initialise the is_dword parameter in that 
case? It can't tell it's unused across a translation unit boundary 
without LTO.

