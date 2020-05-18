Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 271581D6F12
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 04:41:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QNZD44zlzDqYC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 12:41:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QNXS29FPzDqWb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 12:40:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Aw15Y3pd; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49QNXR3BMpz9sTC;
 Mon, 18 May 2020 12:40:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589769607;
 bh=tX8P4N3jZ/O95o5UCuuc1aYwWkwZCK7910X4/lTF3+Q=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=Aw15Y3pdlClGDKBzhDxvD+gD+lsAhiJa1fx7hQCDFBCxvy+8my3UVbZNUyV0oXMKL
 WvHWhvNRzdEUslrWNmNvE8fOUILp05A9a5lITJqKQu5pgmsCwrvtYKQ3LKfB4YOx7A
 JYkugBxJfF+WyirfcOvcVJZIGxjqvn10KlXo9x/nu0at4BycGM4MHdTqwqHbaxcjTL
 /u6OJrNVWDpaLbBSZQed+1np5czJg13+QWaRs1hhjq/tsjP2EpYbjfxcPrsyUPkCbd
 yEZSkoauCMY4sM/yhYiGHxXAYe+kDT0+teH8klil7t1SyXiI6Pbb2uBRymfA2VUlgE
 R27jUwovytWiQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/64s: Fix early_init_mmu section mismatch
In-Reply-To: <0f2e656a-fcc4-588c-707d-f05bd8d889df@xenosoft.de>
References: <20200429070247.1678172-1-npiggin@gmail.com>
 <0f2e656a-fcc4-588c-707d-f05bd8d889df@xenosoft.de>
Date: Mon, 18 May 2020 12:40:24 +1000
Message-ID: <87mu669d9j.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christian Zigotzky <chzigotzky@xenosoft.de> writes:
> Hi All,
>
> This patch wasn't included in the PowerPC fixes 5.7-4. Please add it.

It's not an important bug. I'll take the patch for v5.8

cheers

> On 29 April 2020 at 09:02 am, Nicholas Piggin wrote:
>> Christian reports:
>>
>>    MODPOST vmlinux.o
>>    WARNING: modpost: vmlinux.o(.text.unlikely+0x1a0): Section mismatch in
>>    reference from the function .early_init_mmu() to the function
>>    .init.text:.radix__early_init_mmu()
>>    The function .early_init_mmu() references
>>    the function __init .radix__early_init_mmu().
>>    This is often because .early_init_mmu lacks a __init
>>    annotation or the annotation of .radix__early_init_mmu is wrong.
>>
>>    WARNING: modpost: vmlinux.o(.text.unlikely+0x1ac): Section mismatch in
>>    reference from the function .early_init_mmu() to the function
>>    .init.text:.hash__early_init_mmu()
>>    The function .early_init_mmu() references
>>    the function __init .hash__early_init_mmu().
>>    This is often because .early_init_mmu lacks a __init
>>    annotation or the annotation of .hash__early_init_mmu is wrong.
>>
>> The compiler is uninlining early_init_mmu and not putting it in an init
>> section because there is no annotation. Add it.
>>
>> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
>> Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/book3s/64/mmu.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
>> index bb3deb76c951..3ffe5f967483 100644
>> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
>> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
>> @@ -208,7 +208,7 @@ void hash__early_init_devtree(void);
>>   void radix__early_init_devtree(void);
>>   extern void hash__early_init_mmu(void);
>>   extern void radix__early_init_mmu(void);
>> -static inline void early_init_mmu(void)
>> +static inline void __init early_init_mmu(void)
>>   {
>>   	if (radix_enabled())
>>   		return radix__early_init_mmu();
