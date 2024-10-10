Return-Path: <linuxppc-dev+bounces-1961-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6A899813E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 11:00:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPNy267lKz3bnx;
	Thu, 10 Oct 2024 20:00:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728550826;
	cv=none; b=lOP4cx8wArEFj887tlTsN9iezGHMrJz02JJbQG7ngitcSwspwC2pQrdtgtE3owsEEhPKXLWo/DMg5RI/0inJJKBTUFxUHgYecXNnWGlH1qQbCnE4Ddt+j5bwGxMFYfkXxOyvOmtyIS2c11gbIsO3X71NKGKL3LnY3w2c/Um1sJcCUsH+Yob+lpBJ5XfiVOoQvYax+uunj+xSeunRQxKuFIY1YcZuXyS29TVSo8ntIVCp1B16byjz3BDBwm0qI1lwYBs9M6fabC2IG9fZThabey6dMVbnFPcss93uzGpN/FeXInNC/d/apKZr5g5J94bTW3WEHu/7uv7hNE8Cr5jXlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728550826; c=relaxed/relaxed;
	bh=V9jgWagtgrACbr0ZjEm72b0X0zqvBbiQ+xJe+wGu8b0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=km4lQplcr6cWquQ5OczcDF+2W37inB1SFUlgg/YPT4LX2PE8+Ky3KVy2roxvkSQsoDWkj1ytFooAzg+gnHIOPqUbNwXMMohrWjS3iGUnjFx/OxYvxskoOVRUCuf/kHUtO0ijssfoj1EuWg4ISLnBXp2kVzkLGLnnjvdZtN9fCIl+W8AslL7qNRtBtghVl8EPa2FsjdJAKie+II3AcN1sMRHlEFaADbmL3wG76cZLGC6CjjJUIbbaHgEmnJAHag6Awm3GXyBdHbxx4m1kurIWgvoWPbHqp+koQEBdb3kwXD8aZ4H+8Ft0jhpPqRBnFYdALYh4rQ9l2yXIyhEJ0x+wuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPNy14zyvz3bnr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 20:00:24 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XPNxx4D8Pz9sPd;
	Thu, 10 Oct 2024 11:00:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PVlEZLE3DrkG; Thu, 10 Oct 2024 11:00:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XPNxr4lZMz9sS8;
	Thu, 10 Oct 2024 11:00:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 92CE18B79F;
	Thu, 10 Oct 2024 11:00:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id DDueIiD9HNs4; Thu, 10 Oct 2024 11:00:16 +0200 (CEST)
Received: from [192.168.232.17] (unknown [192.168.232.17])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D984B8B79E;
	Thu, 10 Oct 2024 11:00:15 +0200 (CEST)
Message-ID: <0a3d0813-e44f-45be-8b9a-957c75aa26cb@csgroup.eu>
Date: Thu, 10 Oct 2024 11:00:15 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] powerpc/vdso: Implement __arch_get_vdso_rng_data()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Jason@zx2c4.com
References: <0557d3ec898c1d0ea2fc59fa8757618e524c5d94.1727858295.git.christophe.leroy@csgroup.eu>
 <a1a9bd0df508f1b5c04684b7366940577dfc6262.1727858295.git.christophe.leroy@csgroup.eu>
 <20241010101449-007991a0-f7c7-4f76-a6cc-413c474b9219@linutronix.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241010101449-007991a0-f7c7-4f76-a6cc-413c474b9219@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Thomas,

Le 10/10/2024 à 10:20, Thomas Weißschuh a écrit :
> On Wed, Oct 02, 2024 at 10:39:29AM +0200, Christophe Leroy wrote:
>> VDSO time functions do not call any other function, so they don't
>> need to save/restore LR. However, retrieving the address of VDSO data
>> page requires using LR hence saving then restoring it, which can be
>> heavy on some CPUs. On the other hand, VDSO functions on powerpc are
>> not standard functions and require a wrapper function to call C VDSO
>> functions. And that wrapper has to save and restore LR in order to
>> call the C VDSO function, so retrieving VDSO data page address in that
>> wrapper doesn't require additional save/restore of LR.
>>
>> For random VDSO functions it is a bit different. Because the function
>> calls __arch_chacha20_blocks_nostack(), it saves and restores LR.
>> Retrieving VDSO data page address can then be done there without
>> additional save/restore of LR.
>>
>> So lets implement __arch_get_vdso_rng_data() and simplify the wrapper.
>>
>> It starts paving the way for the day powerpc will implement a more
>> standard ABI for VDSO functions.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/include/asm/vdso/getrandom.h | 15 +++++++++++++--
>>   arch/powerpc/kernel/asm-offsets.c         |  1 -
>>   arch/powerpc/kernel/vdso/getrandom.S      |  1 -
>>   arch/powerpc/kernel/vdso/vgetrandom.c     |  4 ++--
>>   4 files changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/vdso/getrandom.h b/arch/powerpc/include/asm/vdso/getrandom.h
>> index 501d6bb14e8a..4302e7c67aa5 100644
>> --- a/arch/powerpc/include/asm/vdso/getrandom.h
>> +++ b/arch/powerpc/include/asm/vdso/getrandom.h
>> @@ -7,6 +7,8 @@
>>   
>>   #ifndef __ASSEMBLY__
>>   
>> +#include <asm/vdso_datapage.h>
>> +
>>   static __always_inline int do_syscall_3(const unsigned long _r0, const unsigned long _r3,
>>   					const unsigned long _r4, const unsigned long _r5)
>>   {
>> @@ -43,11 +45,20 @@ static __always_inline ssize_t getrandom_syscall(void *buffer, size_t len, unsig
>>   
>>   static __always_inline struct vdso_rng_data *__arch_get_vdso_rng_data(void)
>>   {
>> -	return NULL;
>> +	struct vdso_arch_data *data;
>> +
>> +	asm(
>> +		"	bcl	20, 31, .+4\n"
>> +		"0:	mflr	%0\n"
>> +		"	addis	%0, %0, (_vdso_datapage - 0b)@ha\n"
>> +		"	addi	%0, %0, (_vdso_datapage - 0b)@l\n"
>> +	: "=r" (data) :: "lr");
>> +
>> +	return &data->rng_data;
>>   }
> 
> Did you also try something like this:
> 
> extern struct vdso_arch_data _vdso_datapage __attribute__((visibility("hidden")));
> 
> static __always_inline struct vdso_rng_data *__arch_get_vdso_rng_data(void)
> {
>         return &_vdso_datapage.rng_data;
> }
> 
> Not knowing much about ppc asm the resulting assembly looks simpler.
> And it would be more in line with what other archs are doing.

Did you build it ?

I get :

   VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
   VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not 
supported
make[2]: *** [arch/powerpc/kernel/vdso/Makefile:75: 
arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1

Current solution gives:

   24:	42 9f 00 05 	bcl     20,4*cr7+so,28 <__c_kernel_getrandom+0x28>
   28:	7e a8 02 a6 	mflr    r21
   2c:	3e b5 00 00 	addis   r21,r21,0
			2e: R_PPC_REL16_HA	_vdso_datapage+0x6
   30:	3a b5 00 00 	addi    r21,r21,0
			32: R_PPC_REL16_LO	_vdso_datapage+0xa


Your solution gives:

   60:	3e e0 00 00 	lis     r23,0
			62: R_PPC_ADDR16_HA	_vdso_datapage
   64:	3a f7 00 00 	addi    r23,r23,0
			66: R_PPC_ADDR16_LO	_vdso_datapage


So yes your solution looks simpler, but relies on absolute addresses set 
up through dynamic relocation which is not possible because different 
processes map the same VDSO datapage at different addresses.

Christophe

