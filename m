Return-Path: <linuxppc-dev+bounces-9238-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CF2AD2DD9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 08:20:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGdvW70RWz2yVV;
	Tue, 10 Jun 2025 16:20:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749536439;
	cv=none; b=GYf4vtBbJ+UzbyKBqoWQC7vQMMRck0urcUL5gC7FECUIbIEMB9fQtcBCleoY4EeyNf+3U27VrzOTn//0VmorMx4r94Kr4S//5uddsiEkDLB5UXMTaU/mQj0xVWORjN5ZUhhzx9RNzLvwv/rZe8lsP/xMrPB3UhSm8ZrEQyouFoF77lDBP/eME0eNER2Lpt03kaoap/b7reRN9pBpCFNriMBeOlctfAdzavupUSKWLnYSuW44FuUE4fJTLvmd1lVwjqHR1Q3k7DDWfW8GLUjmG7OQi4ewN1/WJ2WUBcKjd5SVQBtog/bXNpMA7RAhOPMQtBPvbuUs26SfnCPw/vHwzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749536439; c=relaxed/relaxed;
	bh=kuncKuluM0rw/oEuR/P6LqC1x8+rRROPzVuy7MboFM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YuIFg/Avo1tPkR/fXJBsh9i4FeXfWC7Npxk/37Mx+ZaDdGD76ZyRL4lzx1Tc5bileFL+FP9mZ8wcV3MZhRR3XsZJ0SJxP4/yu88g9iK9ACR66pXxIsWSyxV/WvrQfkrwL9oZuCsTEx8PEcBn8krQVrC3ZEBsFjlKiBFTEr5YbXjlOqn5WJCtj9cBisU0xLtikGl+0VSgEgOJBBq40WAC+rZJWELXX8hSpBxyp1x6pmuMTB5kZsR1kIJrAD9F/c0ReOT3gpOwK89SFRFL95SGF+2aNPcvI9gyRIBesxFO5Q+SbAmMyYEcYVx1A8B7VUrxCtIStZq1tE1Lzcki/S+tdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGdvW2DV0z2xd3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 16:20:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bGdWg0XP7z9sVS;
	Tue, 10 Jun 2025 08:03:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rnIOCq5v7DqQ; Tue, 10 Jun 2025 08:03:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bGdWf5CPLz9sTD;
	Tue, 10 Jun 2025 08:03:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ACA9E8B764;
	Tue, 10 Jun 2025 08:03:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 7h7BDLB4LqL8; Tue, 10 Jun 2025 08:03:26 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 549968B763;
	Tue, 10 Jun 2025 08:03:26 +0200 (CEST)
Message-ID: <8dceee14-6008-48d0-a3c8-30ae777660a1@csgroup.eu>
Date: Tue, 10 Jun 2025 08:03:26 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/vdso: Fix build of VDSO32 with pcrel
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <1fa3453f07d42a50a70114da9905bf7b73304fca.1747073669.git.christophe.leroy@csgroup.eu>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <1fa3453f07d42a50a70114da9905bf7b73304fca.1747073669.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Maddy,

ping ?

Christophe

Le 12/05/2025 à 20:14, Christophe Leroy a écrit :
> Building vdso32 on power10 with pcrel leads to following errors:
> 
> 	  VDSO32A arch/powerpc/kernel/vdso/gettimeofday-32.o
> 	arch/powerpc/kernel/vdso/gettimeofday.S: Assembler messages:
> 	arch/powerpc/kernel/vdso/gettimeofday.S:40: Error: syntax error; found `@', expected `,'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:71:  Info: macro invoked from here
> 	arch/powerpc/kernel/vdso/gettimeofday.S:40: Error: junk at end of line: `@notoc'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:71:  Info: macro invoked from here
> 	 ...
> 	make[2]: *** [arch/powerpc/kernel/vdso/Makefile:85: arch/powerpc/kernel/vdso/gettimeofday-32.o] Error 1
> 	make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
> 
> Once the above is fixed, the following happens:
> 
> 	  VDSO32C arch/powerpc/kernel/vdso/vgettimeofday-32.o
> 	cc1: error: '-mpcrel' requires '-mcmodel=medium'
> 	make[2]: *** [arch/powerpc/kernel/vdso/Makefile:89: arch/powerpc/kernel/vdso/vgettimeofday-32.o] Error 1
> 	make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
> 	make: *** [Makefile:251: __sub-make] Error 2
> 
> Make sure pcrel version of CFUNC() macro is used only for powerpc64
> builds and remove -mpcrel for powerpc32 builds.
> 
> Fixes: 7e3a68be42e1 ("powerpc/64: vmlinux support building with PCREL addresing")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>   arch/powerpc/include/asm/ppc_asm.h | 2 +-
>   arch/powerpc/kernel/vdso/Makefile  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
> index 02897f4b0dbf..b891910fce8a 100644
> --- a/arch/powerpc/include/asm/ppc_asm.h
> +++ b/arch/powerpc/include/asm/ppc_asm.h
> @@ -183,7 +183,7 @@
>   /*
>    * Used to name C functions called from asm
>    */
> -#ifdef CONFIG_PPC_KERNEL_PCREL
> +#if defined(__powerpc64__) && defined(CONFIG_PPC_KERNEL_PCREL)
>   #define CFUNC(name) name@notoc
>   #else
>   #define CFUNC(name) name
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> index e8824f933326..8834dfe9d727 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -53,7 +53,7 @@ ldflags-$(CONFIG_LD_ORPHAN_WARN) += -Wl,--orphan-handling=$(CONFIG_LD_ORPHAN_WAR
>   ldflags-y += $(filter-out $(CC_AUTO_VAR_INIT_ZERO_ENABLER) $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
>   
>   CC32FLAGS := -m32
> -CC32FLAGSREMOVE := -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc
> +CC32FLAGSREMOVE := -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc -mpcrel
>   ifdef CONFIG_CC_IS_CLANG
>   # This flag is supported by clang for 64-bit but not 32-bit so it will cause
>   # an unused command line flag warning for this file.


