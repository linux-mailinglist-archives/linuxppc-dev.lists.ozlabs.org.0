Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7272545D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 15:23:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bck2P4XymzDqjX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 23:23:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bcjy00WcgzDqhK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 23:19:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=cU+Wi1s+; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bcjxx0CGvz9sRK;
 Thu, 27 Aug 2020 23:19:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1598534389;
 bh=xJkwUWknbzmvsAZO+hKud6INNMkQTVd5r0gjIOmuo3c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=cU+Wi1s+D3zjNNRT1PERbDZZMoiGyzfLvx/edgAPk1WSZyC7ZBQyRo9lMYvLupYMJ
 oj91TUjDQwT2MVk3785bixwN+Xw63MeRi1SiNyQacw3wEeJiTrl5w2cHkBMzhV+QS1
 tyhq0tToa+5rrBwdNW8+CzKil8OMjsMt9NJIQphMeB8qXz5uDn3fSDPwjq0TVyfC5X
 MVTsYqYZvEaZvpz2fEY25bGbyopmsTf3J8E/OF3AF0RgJp1uRHP556HmrxYpo8sK3Y
 OTkOvCyEUU01FzA48TLmBMolK6a9O+CGdDRdGxJ2LlKVVya023TjhgVCpCNiRLHOZG
 rGrGVJo7JlbWw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v1 4/9] powerpc/vdso: Remove unnecessary ifdefs in
 vdso_pagelist initialization
In-Reply-To: <04a968f6-88c0-0603-43aa-202196a68df2@csgroup.eu>
References: <df48ed76cf8a756a7f97ed42a1a39d0a404014bc.1598363608.git.christophe.leroy@csgroup.eu>
 <834f362626e18bc36226f46ed4113c461a3ad032.1598363608.git.christophe.leroy@csgroup.eu>
 <87ft89h2st.fsf@mpe.ellerman.id.au>
 <04a968f6-88c0-0603-43aa-202196a68df2@csgroup.eu>
Date: Thu, 27 Aug 2020 23:19:44 +1000
Message-ID: <87d03c2plb.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> On 08/26/2020 02:58 PM, Michael Ellerman wrote:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
>>> index daef14a284a3..bbb69832fd46 100644
>>> --- a/arch/powerpc/kernel/vdso.c
>>> +++ b/arch/powerpc/kernel/vdso.c
>>> @@ -718,16 +710,14 @@ static int __init vdso_init(void)
>> ...
>>>   
>>> -
>>> -#ifdef CONFIG_VDSO32
>>>   	vdso32_kbase = &vdso32_start;
>>>   
>>>   	/*
>>> @@ -735,8 +725,6 @@ static int __init vdso_init(void)
>>>   	 */
>>>   	vdso32_pages = (&vdso32_end - &vdso32_start) >> PAGE_SHIFT;
>>>   	DBG("vdso32_kbase: %p, 0x%x pages\n", vdso32_kbase, vdso32_pages);
>>> -#endif
>> 
>> This didn't build for ppc64le:
>> 
>>    /opt/cross/gcc-8.20_binutils-2.32/powerpc64-unknown-linux-gnu/bin/powerpc64-unknown-linux-gnu-ld: arch/powerpc/kernel/vdso.o:(.toc+0x0): undefined reference to `vdso32_end'
>>    /opt/cross/gcc-8.20_binutils-2.32/powerpc64-unknown-linux-gnu/bin/powerpc64-unknown-linux-gnu-ld: arch/powerpc/kernel/vdso.o:(.toc+0x8): undefined reference to `vdso32_start'
>>    make[1]: *** [/scratch/michael/build/maint/Makefile:1166: vmlinux] Error 1
>>    make: *** [Makefile:185: __sub-make] Error 2
>> 
>> So I just put that ifdef back.
>> 
>
> The problem is because is_32bit() can still return true even when 
> CONFIG_VDSO32 is not set.

Hmm, you're right. My config had CONFIG_COMPAT enabled.

But that seems like a bug, if someone enables COMPAT on ppc64le they are
almost certainly going to want VDSO32 as well.

So I think I'll do a lead up patch as below.

cheers

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index d4fd109f177e..cf2da1e401ef 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -501,13 +501,12 @@ endmenu
 
 config VDSO32
 	def_bool y
-	depends on PPC32 || CPU_BIG_ENDIAN
+	depends on PPC32 || COMPAT
 	help
 	  This symbol controls whether we build the 32-bit VDSO. We obviously
 	  want to do that if we're building a 32-bit kernel. If we're building
-	  a 64-bit kernel then we only want a 32-bit VDSO if we're building for
-	  big endian. That is because the only little endian configuration we
-	  support is ppc64le which is 64-bit only.
+	  a 64-bit kernel then we only want a 32-bit VDSO if we're also enabling
+	  COMPAT.
 
 choice
 	prompt "Endianness selection"

