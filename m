Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4765253E20
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 08:49:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcYHj1R4tzDqcS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 16:49:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcYFs5fllzDqZ2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 16:47:59 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BcYFl3bpzz9vD3v;
 Thu, 27 Aug 2020 08:47:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id oApkwu2Z5dlT; Thu, 27 Aug 2020 08:47:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BcYFl1t8Lz9vD3t;
 Thu, 27 Aug 2020 08:47:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0DD3D8B85C;
 Thu, 27 Aug 2020 08:47:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id kPtxLO6nQspm; Thu, 27 Aug 2020 08:47:55 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A1A1C8B85A;
 Thu, 27 Aug 2020 08:47:55 +0200 (CEST)
Subject: Re: [PATCH v1 4/9] powerpc/vdso: Remove unnecessary ifdefs in
 vdso_pagelist initialization
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <df48ed76cf8a756a7f97ed42a1a39d0a404014bc.1598363608.git.christophe.leroy@csgroup.eu>
 <834f362626e18bc36226f46ed4113c461a3ad032.1598363608.git.christophe.leroy@csgroup.eu>
 <87ft89h2st.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <04a968f6-88c0-0603-43aa-202196a68df2@csgroup.eu>
Date: Thu, 27 Aug 2020 06:47:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87ft89h2st.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 08/26/2020 02:58 PM, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
>> index daef14a284a3..bbb69832fd46 100644
>> --- a/arch/powerpc/kernel/vdso.c
>> +++ b/arch/powerpc/kernel/vdso.c
>> @@ -718,16 +710,14 @@ static int __init vdso_init(void)
> ...
>>   
>> -
>> -#ifdef CONFIG_VDSO32
>>   	vdso32_kbase = &vdso32_start;
>>   
>>   	/*
>> @@ -735,8 +725,6 @@ static int __init vdso_init(void)
>>   	 */
>>   	vdso32_pages = (&vdso32_end - &vdso32_start) >> PAGE_SHIFT;
>>   	DBG("vdso32_kbase: %p, 0x%x pages\n", vdso32_kbase, vdso32_pages);
>> -#endif
> 
> This didn't build for ppc64le:
> 
>    /opt/cross/gcc-8.20_binutils-2.32/powerpc64-unknown-linux-gnu/bin/powerpc64-unknown-linux-gnu-ld: arch/powerpc/kernel/vdso.o:(.toc+0x0): undefined reference to `vdso32_end'
>    /opt/cross/gcc-8.20_binutils-2.32/powerpc64-unknown-linux-gnu/bin/powerpc64-unknown-linux-gnu-ld: arch/powerpc/kernel/vdso.o:(.toc+0x8): undefined reference to `vdso32_start'
>    make[1]: *** [/scratch/michael/build/maint/Makefile:1166: vmlinux] Error 1
>    make: *** [Makefile:185: __sub-make] Error 2
> 
> So I just put that ifdef back.
> 

The problem is because is_32bit() can still return true even when 
CONFIG_VDSO32 is not set.

The change below fixes the problem:

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index bbb69832fd46..38abff60cbe2 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -132,11 +132,7 @@ int arch_setup_additional_pages(struct linux_binprm 
*bprm, int uses_interp)
  	if (!vdso_ready)
  		return 0;

-	if (is_32bit_task()) {
-		vdso_pagelist = vdso32_pagelist;
-		vdso_pages = vdso32_pages;
-		vdso_base = VDSO32_MBASE;
-	} else {
+	if (!is_32bit_task()) {
  		vdso_pagelist = vdso64_pagelist;
  		vdso_pages = vdso64_pages;
  		/*
@@ -145,6 +141,12 @@ int arch_setup_additional_pages(struct linux_binprm 
*bprm, int uses_interp)
  		 * and most likely share a SLB entry.
  		 */
  		vdso_base = 0;
+	} else if (IS_ENABLED(CONFIG_VDSO32)) {
+		vdso_pagelist = vdso32_pagelist;
+		vdso_pages = vdso32_pages;
+		vdso_base = VDSO32_MBASE;
+	} else {
+		vdso_pages = 0;
  	}

  	current->mm->context.vdso_base = 0;

With this change all vdso32 static objects (functions and vars) go away 
as expected.

We get a simple conflict with the following patch.

Do you prefer an updated series or a follow up patch, or you take the 
above change yourself ?

Christophe
