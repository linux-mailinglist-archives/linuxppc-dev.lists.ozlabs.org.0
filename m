Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC9D277B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 10:12:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458j016k6pzDqXv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 18:12:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="WYfoZ9wX"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458hyd0HkzzDqXS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 18:10:49 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 458hyX4xfVz9ty20;
 Thu, 23 May 2019 10:10:44 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=WYfoZ9wX; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zj566mV9uPRn; Thu, 23 May 2019 10:10:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 458hyX3nmdz9ty1y;
 Thu, 23 May 2019 10:10:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558599044; bh=htOA7A7o8Wi6zLAJA9t7xk2NyPWEHzRDYWW5icgzEWw=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=WYfoZ9wXEi9c9wELKQjVpGLFo19AD+4x2oUqSwfOByliYQ1YqJnY/cKTd9NGmXq9Z
 34od+gBJaFvTP9w/sXWsoj0bMRsX/mrIXF/80Yl5K8BmAYm71PLd/6lTckK+oKj2u5
 AkU9ezqmXBB1/poEiDFUHNWtHECDO+e2aRLPUyWk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 90F1A8B781;
 Thu, 23 May 2019 10:10:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fX5nDcjC2Yuv; Thu, 23 May 2019 10:10:45 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 395578B77D;
 Thu, 23 May 2019 10:10:45 +0200 (CEST)
Subject: Re: [PATCH v3 14/16] powerpc/32: implement fast entry for syscalls on
 BOOKE
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Paul Mackerras <paulus@ozlabs.org>
References: <cover.1556627571.git.christophe.leroy@c-s.fr>
 <3e254178a157e7eaeef48f983880f71f97d1f296.1556627571.git.christophe.leroy@c-s.fr>
 <20190523061427.GA19655@blackberry>
 <98bf5745-88ae-7f17-fcb9-7d06ba5b9e49@c-s.fr>
Message-ID: <58f0e70f-ed9d-965e-e8d2-cc5d13a4c9eb@c-s.fr>
Date: Thu, 23 May 2019 10:10:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <98bf5745-88ae-7f17-fcb9-7d06ba5b9e49@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/05/2019 à 09:00, Christophe Leroy a écrit :

[...]


> 
>>
>> arch/powerpc/kernel/head_fsl_booke.o: In function `SystemCall':
>> arch/powerpc/kernel/head_fsl_booke.S:416: undefined reference to 
>> `kvmppc_handler_BOOKE_INTERRUPT_SYSCALL_SPRN_SRR1'
>> Makefile:1052: recipe for target 'vmlinux' failed
>>
>>> +.macro SYSCALL_ENTRY trapno intno
>>> +    mfspr    r10, SPRN_SPRG_THREAD
>>> +#ifdef CONFIG_KVM_BOOKE_HV
>>> +BEGIN_FTR_SECTION
>>> +    mtspr    SPRN_SPRG_WSCRATCH0, r10
>>> +    stw    r11, THREAD_NORMSAVE(0)(r10)
>>> +    stw    r13, THREAD_NORMSAVE(2)(r10)
>>> +    mfcr    r13            /* save CR in r13 for now       */
>>> +    mfspr    r11, SPRN_SRR1
>>> +    mtocrf    0x80, r11    /* check MSR[GS] without clobbering reg */
>>> +    bf    3, 1975f
>>> +    b    kvmppc_handler_BOOKE_INTERRUPT_\intno\()_SPRN_SRR1
>>
>> It seems to me that the "_SPRN_SRR1" on the end of this line
>> isn't meant to be there...  However, it still fails to link with that
>> removed.

It looks like I missed the macro expansion.

The called function should be kvmppc_handler_8_0x01B

Seems like kisskb doesn't build any config like this.

Christophe

> 
> This SYSCALL_ENTRY macro is a slimmed version of NORMAL_EXCEPTION_PROLOG()
> 
> In NORMAL_EXCEPTION_PROLOG(), we have:
>      DO_KVM    BOOKE_INTERRUPT_##intno SPRN_SRR1;
> 
> The _SPRN_SRR1 comes from there
> 
> 
> Then in /arch/powerpc/include/asm/kvm_booke_hv_asm.h:
> 
> .macro DO_KVM intno srr1
> #ifdef CONFIG_KVM_BOOKE_HV
> BEGIN_FTR_SECTION
>      mtocrf    0x80, r11    /* check MSR[GS] without clobbering reg */
>      bf    3, 1975f
>      b    kvmppc_handler_\intno\()_\srr1
> 1975:
> END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
> #endif
> .endm
> 
> 
> Christophe
