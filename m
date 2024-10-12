Return-Path: <linuxppc-dev+bounces-2145-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B9899B27A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 11:19:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQdHK0dwkz2yLg;
	Sat, 12 Oct 2024 20:19:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728724781;
	cv=none; b=mAPnLBZdKEJwl/O69g1M3DS9QQjHF/3lVOX/t5I3jxlaVm5Y6Mc8kNX+ezo0KFpORwJ9Jr/+YL1RVmK2bCy8BrIZkO4NDYicv+RAtQfAprgiPDQBtSfd74JC0Pv+MfuzW3tfSu7w5YNTy9O83ekBbT5qoT42ZRXQcJecmuyJ/7Msa/29spmR1bouuQPwdbJvedb2MR0ipEYIrLtZXSLt01tJXX2aXKWp1lSOh8znvQnMbY5a0yUTpOcIJfODrrmKQjWZGvzNQpbAH+SSjg+gvD+eSSUXer4JMU+G7FY4CHO1rRfmoHIcT5LEPysHaa0WdloOYi8dPhgmeP6u6jS2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728724781; c=relaxed/relaxed;
	bh=UVIpjP6kWIy7SGdk7H/WQfiX41UeM9GJsr/U4w6IFGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HdlxWWEpS7bC0QAZt/k36s0JXp8hGJJvcwqNwd9i4/SQL5Gq3h13vCAzxRkh9lzJsX4NMrL3wO1eQnvYvX3k7Bi9UgFmDWMFghPBEPzu0D2jgtEca25HmIJisYFRAKj2hti6uw34q1ahah46LzaxGOxiN8+EoQevsModUPqWc8Q2wScJT1J29nxYf3bbkJKaFK/MO5wxqFwYZY3t/rHnPJa57ILpmr3SUqz0jbGu6GVmnKyoN53d6vtmGanlb8UBVWHy8z1gDrFtLy0mPCVwO8Ak6MRlClLltkg9tHgWTPQ0isaacv6VqZgeA780HGeRKLSUJb9Lcfg6Y8X+36TGzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQdHH4fSWz2yHj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 20:19:37 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XQdHB2Lbcz9sPd;
	Sat, 12 Oct 2024 11:19:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4HiqErU0OKkU; Sat, 12 Oct 2024 11:19:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XQdHB0ydxz9rvV;
	Sat, 12 Oct 2024 11:19:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0EE8C8B765;
	Sat, 12 Oct 2024 11:19:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id K4h0ycrJatFU; Sat, 12 Oct 2024 11:19:33 +0200 (CEST)
Received: from [192.168.232.206] (unknown [192.168.232.206])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 93ED98B764;
	Sat, 12 Oct 2024 11:19:33 +0200 (CEST)
Message-ID: <777cca2b-a650-4622-9f96-684c2530794b@csgroup.eu>
Date: Sat, 12 Oct 2024 11:19:32 +0200
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
To: Michael Ellerman <mpe@ellerman.id.au>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Jason@zx2c4.com
References: <0557d3ec898c1d0ea2fc59fa8757618e524c5d94.1727858295.git.christophe.leroy@csgroup.eu>
 <a1a9bd0df508f1b5c04684b7366940577dfc6262.1727858295.git.christophe.leroy@csgroup.eu>
 <20241010101449-007991a0-f7c7-4f76-a6cc-413c474b9219@linutronix.de>
 <0a3d0813-e44f-45be-8b9a-957c75aa26cb@csgroup.eu>
 <20241010110927-9688b27e-6048-48ac-a908-5b80ba8da63e@linutronix.de>
 <7c8231ad-683e-4df6-a63f-26985d46316f@csgroup.eu>
 <87r08m6evr.fsf@mail.lhotse>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <87r08m6evr.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 11/10/2024 à 13:46, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 10/10/2024 à 11:12, Thomas Weißschuh a écrit :
>>>
>>> I'll try to see why this doesn't work for ppc32.
>>
>> PC-rel instructions only exist on very very recent powerpc CPUs (power10 ?)
>   
> Yeah power10 or later.
> 
>> On PPC64, ELF ABI v2 requires caller to put called function address in
>> r12 and it looks like GCC uses that:
>>
>> 0000000000000000 <__c_kernel_getrandom>:
>>      0:	3c 4c 00 00 	addis   r2,r12,0
>> 			2: R_PPC64_REL16_HA	.TOC.+0x2
>>      4:	38 42 00 00 	addi    r2,r2,0
>> 			6: R_PPC64_REL16_LO	.TOC.+0x6
>> ...
>>     64:	3d 22 00 00 	addis   r9,r2,0
>> 			66: R_PPC64_TOC16_HA	_vdso_datapage+0x100
>>     68:	89 29 00 00 	lbz     r9,0(r9)
>> 			6a: R_PPC64_TOC16_LO	_vdso_datapage+0x100
> 
> Setting up r12 is only required for calls to the global entry point
> (offset 0), local calls can be made to offset 8 and use/don't require
> r12 to be set. That's because local calls should already have the
> correct toc pointer in r2.
> 
> But that's not true in VDSO code. >
>> Which after final link results in:
>>
>> 0000000000001060 <__c_kernel_getrandom>:
>>       1060:	3c 4c 00 01 	addis   r2,r12,1
>>       1064:	38 42 8e a0 	addi    r2,r2,-29024
>> ...
>>       10c4:	3d 22 ff fc 	addis   r9,r2,-4
>>       10c8:	89 29 62 00 	lbz     r9,25088(r9)
> 
> The call to __c_kernel_getrandom skips over the r2 setup because it's a
> local call, even though we haven't setup r2 correctly:

Yes indeed I forgot that. So even if the final check doesn't complain, 
it won't work at the end.

Don't know if we could find a way to detect that and fail the build.

> 
> 0000000000000758 <__kernel_getrandom>:
>       758:       91 ff 21 f8     stdu    r1,-112(r1)
>       75c:       a6 02 08 7c     mflr    r0
>       760:       91 ff 21 f8     stdu    r1,-112(r1)
>       764:       80 00 01 f8     std     r0,128(r1)
>       768:       88 00 41 f8     std     r2,136(r1)
>       76c:       05 00 9f 42     bcl     20,4*cr7+so,770 <__kernel_getrandom+0x18>
>       770:       a6 02 08 7d     mflr    r8
>       774:       fe ff 08 3d     addis   r8,r8,-2
>       778:       90 f8 08 39     addi    r8,r8,-1904
>       77c:       fc 00 68 81     lwz     r11,252(r8)
>       780:       ff 7f 6b 6d     xoris   r11,r11,32767
>       784:       ff ff 6b 69     xori    r11,r11,65535
>       788:       34 00 6b 7d     cntlzw  r11,r11
>       78c:       de 5b 6b 55     rlwinm  r11,r11,11,15,15
>       790:       14 5a 08 7d     add     r8,r8,r11
>       794:       d8 02 08 39     addi    r8,r8,728
>       798:       41 09 00 48     bl      10d8 <__c_kernel_getrandom+0x8>
> 
> We could setup r2, but that would only help 64-bit.
> 
> This also makes me notice that we have a mixture of ELF ABI v1 and v2
> code in the VDSO, depending on whether the kernel is building itself ABI
> v1 or v2:
> 
>    arch/powerpc/kernel/vdso/cacheflush-64.o:        ELF 64-bit LSB relocatable, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version 1 (SYSV), not stripped
>    arch/powerpc/kernel/vdso/datapage-64.o:          ELF 64-bit LSB relocatable, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version 1 (SYSV), not stripped
>    arch/powerpc/kernel/vdso/getcpu-64.o:            ELF 64-bit LSB relocatable, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version 1 (SYSV), not stripped
>    arch/powerpc/kernel/vdso/getrandom-64.o:         ELF 64-bit LSB relocatable, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version 1 (SYSV), not stripped
>    arch/powerpc/kernel/vdso/gettimeofday-64.o:      ELF 64-bit LSB relocatable, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version 1 (SYSV), not stripped
>    arch/powerpc/kernel/vdso/note-64.o:              ELF 64-bit LSB relocatable, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version 1 (SYSV), not stripped
>    arch/powerpc/kernel/vdso/sigtramp64-64.o:        ELF 64-bit LSB relocatable, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version 1 (SYSV), not stripped
>    arch/powerpc/kernel/vdso/vgetrandom-64.o:        ELF 64-bit LSB relocatable, 64-bit PowerPC or cisco 7500, OpenPOWER ELF V2 ABI, version 1 (SYSV), not stripped
>    arch/powerpc/kernel/vdso/vgetrandom-chacha-64.o: ELF 64-bit LSB relocatable, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version 1 (SYSV), not stripped
>    arch/powerpc/kernel/vdso/vgettimeofday-64.o:     ELF 64-bit LSB relocatable, 64-bit PowerPC or cisco 7500, OpenPOWER ELF V2 ABI, version 1 (SYSV), not stripped
> 
> All the asm files are ABI v1 because they historically were, and don't
> say otherwise. The C code comes out as ABI v1 or v2 depending on what
> we're building the kernel as. Which is a bit fishy.

That's not related to VDSO it seems. There is the same thing in 
arch/powerpc/lib for instance:

$ file arch/powerpc/lib/*.o
arch/powerpc/lib/checksum_64.o:         ELF 64-bit MSB relocatable, 
64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version 1 
(SYSV), not stripped
arch/powerpc/lib/checksum_wrappers.o:   ELF 64-bit MSB relocatable, 
64-bit PowerPC or cisco 7500, OpenPOWER ELF V2 ABI, version 1 (SYSV), 
not stripped
arch/powerpc/lib/code-patching.o:       ELF 64-bit MSB relocatable, 
64-bit PowerPC or cisco 7500, OpenPOWER ELF V2 ABI, version 1 (SYSV), 
not stripped
arch/powerpc/lib/copy_mc_64.o:          ELF 64-bit MSB relocatable, 
64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version 1 
(SYSV), not stripped
arch/powerpc/lib/copypage_64.o:         ELF 64-bit MSB relocatable, 
64-bit PowerPC or cisco 7500, OpenPOWER ELF V2 ABI, version 1 (SYSV), 
not stripped
...

Seems like all .c files result in a ELF V2 while some of .S files are V1 
et some are V2. That's odd because the build arguments seems to be the same:

# AS      arch/powerpc/lib/checksum_64.o
   powerpc64-linux-gcc -Wp,-MMD,arch/powerpc/lib/.checksum_64.o.d 
-nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated 
-I./include -I./arch/powerpc/include/uapi 
-I./arch/powerpc/include/generated/uapi -I./include/uapi 
-I./include/generated/uapi -include ./include/linux/compiler-version.h 
-include ./include/linux/kconfig.h -D__KERNEL__ -I ./arch/powerpc 
-DHAVE_AS_ATHIGH=1 -D__ASSEMBLY__ -fno-PIE -m64 -mcpu=power8 -mabi=elfv2 
-mlittle-endian -Wa,--fatal-warnings 
-DKBUILD_MODFILE='"arch/powerpc/lib/checksum_64"' 
-DKBUILD_MODNAME='"checksum_64"' -D__KBUILD_MODNAME=kmod_checksum_64 -c 
-o arch/powerpc/lib/checksum_64.o arch/powerpc/lib/checksum_64.S  ; 
./tools/objtool/objtool --mcount   arch/powerpc/lib/checksum_64.o

# AS      arch/powerpc/lib/copypage_64.o
   powerpc64-linux-gcc -Wp,-MMD,arch/powerpc/lib/.copypage_64.o.d 
-nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated 
-I./include -I./arch/powerpc/include/uapi 
-I./arch/powerpc/include/generated/uapi -I./include/uapi 
-I./include/generated/uapi -include ./include/linux/compiler-version.h 
-include ./include/linux/kconfig.h -D__KERNEL__ -I ./arch/powerpc 
-DHAVE_AS_ATHIGH=1 -D__ASSEMBLY__ -fno-PIE -m64 -mcpu=power8 -mabi=elfv2 
-mlittle-endian -Wa,--fatal-warnings 
-DKBUILD_MODFILE='"arch/powerpc/lib/copypage_64"' 
-DKBUILD_MODNAME='"copypage_64"' -D__KBUILD_MODNAME=kmod_copypage_64 -c 
-o arch/powerpc/lib/copypage_64.o arch/powerpc/lib/copypage_64.S  ; 
./tools/objtool/objtool --mcount   arch/powerpc/lib/copypage_64.o


