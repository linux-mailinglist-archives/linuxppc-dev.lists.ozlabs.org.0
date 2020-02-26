Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DC616F6EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 06:14:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S3qm3KtWzDqbF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 16:13:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=FpYzmR5Q; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S3lr3XrqzDqbG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 16:10:32 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48S3lm3jPMz9tyKl;
 Wed, 26 Feb 2020 06:10:28 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=FpYzmR5Q; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id UQj1s__H51dG; Wed, 26 Feb 2020 06:10:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48S3lm2H2nz9ty2Q;
 Wed, 26 Feb 2020 06:10:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582693828; bh=V9G92WeV7I0zyA8d4SzL2Zeetat6pnJ2RUGjU6q3uIg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FpYzmR5QNKHUaBBVDRQjMn4m/pOdgoFNEP5tSJGRbUNRZBjex2jvHKjGm8eDBIFBf
 wnPRdyxZXUFGgKULHnBXKV7iqLyAsW//hePYYh3TciLnTMP9L2FVuHIIo+zvj2DvVw
 1OgN0jnJw11ZcZaByVat8IoCcG26DQ9EYye4GeBs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F26F88B776;
 Wed, 26 Feb 2020 06:10:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id l0A6C3cu4_sn; Wed, 26 Feb 2020 06:10:28 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0EABE8B784;
 Wed, 26 Feb 2020 06:10:28 +0100 (CET)
Subject: Re: [PATCH v3 3/6] powerpc/fsl_booke/64: implement KASLR for
 fsl_booke64
To: Jason Yan <yanaijie@huawei.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, diana.craciun@nxp.com,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 keescook@chromium.org, kernel-hardening@lists.openwall.com, oss@buserror.net
References: <20200206025825.22934-1-yanaijie@huawei.com>
 <20200206025825.22934-4-yanaijie@huawei.com>
 <41b9f1ca-c6fd-291a-2c96-2a0e8a754ec4@c-s.fr>
 <dbe0b316-40a2-7da4-c26b-e59efa555400@huawei.com>
 <d3647cce-ece3-d302-f541-b02b1f2b5e9e@huawei.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <ceeced29-c6b9-60c9-41b0-3cf537bbf62c@c-s.fr>
Date: Wed, 26 Feb 2020 06:10:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d3647cce-ece3-d302-f541-b02b1f2b5e9e@huawei.com>
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
Cc: linux-kernel@vger.kernel.org, zhaohongjiang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/02/2020 à 04:33, Jason Yan a écrit :
> 
> 
> 在 2020/2/26 10:40, Jason Yan 写道:
>>
>>
>> 在 2020/2/20 21:48, Christophe Leroy 写道:
>>>
>>>
>>> Le 06/02/2020 à 03:58, Jason Yan a écrit :
> Hi Christophe,
> 
> When using a standard C if/else, all code compiled for PPC32 and PPC64, 
> but this will bring some build error because not all variables both 
> defined for PPC32 and PPC64.
> 
> [yanaijie@138 linux]$ sh ppc64build.sh
>    CALL    scripts/atomic/check-atomics.sh
>    CALL    scripts/checksyscalls.sh
>    CHK     include/generated/compile.h
>    CC      arch/powerpc/mm/nohash/kaslr_booke.o
> arch/powerpc/mm/nohash/kaslr_booke.c: In function 'kaslr_choose_location':
> arch/powerpc/mm/nohash/kaslr_booke.c:341:30: error: 
> 'CONFIG_LOWMEM_CAM_NUM' undeclared (first use in this function); did you 
> mean 'CONFIG_FLATMEM_MANUAL'?
>     ram = map_mem_in_cams(ram, CONFIG_LOWMEM_CAM_NUM, true);
>                                ^~~~~~~~~~~~~~~~~~~~~
>                                CONFIG_FLATMEM_MANUAL

This one has to remain inside an #ifdef. That's the only one that has to 
remain.

> arch/powerpc/mm/nohash/kaslr_booke.c:341:30: note: each undeclared 
> identifier is reported only once for each function it appears in
> arch/powerpc/mm/nohash/kaslr_booke.c: In function 'kaslr_early_init':
> arch/powerpc/mm/nohash/kaslr_booke.c:404:3: error: 'is_second_reloc' 

In mmu_decl.h, put the declaration outside the #ifdef CONFIG_PPC32

> undeclared (first use in this function); did you mean '__cond_lock'?
>     is_second_reloc = 1;
>     ^~~~~~~~~~~~~~~
>     __cond_lock
> arch/powerpc/mm/nohash/kaslr_booke.c:411:4: error: implicit declaration 
> of function 'create_kaslr_tlb_entry'; did you mean 'reloc_kernel_entry'? 

Same, put the declaration outside of the #ifdef

> [-Werror=implicit-function-declaration]
>      create_kaslr_tlb_entry(1, tlb_virt, tlb_phys);
>      ^~~~~~~~~~~~~~~~~~~~~~
>      reloc_kernel_entry
> cc1: all warnings being treated as errors
> make[3]: *** [scripts/Makefile.build:268: 
> arch/powerpc/mm/nohash/kaslr_booke.o] Error 1
> make[2]: *** [scripts/Makefile.build:505: arch/powerpc/mm/nohash] Error 2
> make[1]: *** [scripts/Makefile.build:505: arch/powerpc/mm] Error 2
> make: *** [Makefile:1681: arch/powerpc] Error 2

See the patch I sent you. It builds ok for me.

Christophe
