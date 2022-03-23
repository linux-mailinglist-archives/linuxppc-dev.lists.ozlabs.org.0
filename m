Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 008404E4C7B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 07:04:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNd9Z6KzHz30N6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 17:04:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lwzYZVuc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNd8x52Hlz2xTd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Mar 2022 17:04:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=lwzYZVuc; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KNd8x1jyZz4xQv;
 Wed, 23 Mar 2022 17:04:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1648015457;
 bh=NnEwIO/jrbepexETq7CIbLQ7BwslKn3XboDGD+LWxJ0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=lwzYZVucrGtHsGJeTAEX3pSUvIIamTxDhSDX4g59UqxSedzFtQ0Jo/LuskotlBzCi
 YDf7A8ZMKoVUBOzU4zdHkraqPVCUpGcjtfPjF/gDotFXEYXS4VDwX0HLXnV/ALgUAu
 H9HM4NeZzGmxeZAJfw2+JfxNIZJler1C3mMgi+zof1pDCwD7X1buNxjcqBHwHqiFvh
 +csLG8O7MvPYxBoNOYoe4KxZQ8nPEU64s2z6ypxAfVc9OygliatKX04kFBnl0tfd6W
 9v8xMfWQ2+gy939NYiHaWPcM67nlSUvtVhImfs4rxl3Fan4EYIVGYk1PMswasrlY08
 YN0xRIDVhcrxg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel] powerpc/boot: Stop using RELACOUNT
In-Reply-To: <ed991242-6ef2-b346-ffde-a38cb75db0cf@ozlabs.ru>
References: <20220321071026.918262-1-aik@ozlabs.ru>
 <87fsnahh10.fsf@mpe.ellerman.id.au>
 <ed991242-6ef2-b346-ffde-a38cb75db0cf@ozlabs.ru>
Date: Wed, 23 Mar 2022 17:04:10 +1100
Message-ID: <87a6dhgq79.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> On 3/22/22 13:12, Michael Ellerman wrote:
>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>>> So far the RELACOUNT tag from the ELF header was containing the exact
>>> number of R_PPC_RELATIVE/R_PPC64_RELATIVE relocations. However the LLVM's
>>> recent change [1] make it equal-or-less than the actual number which
>>> makes it useless.
>>>
>>> This replaces RELACOUNT in zImage loader with a pair of RELASZ and RELAENT.
>>> The vmlinux relocation code is fixed in [2].
>> 
>> That's committed so you can say:
>>    in commit d79976918852 ("powerpc/64: Add UADDR64 relocation support")
>> 
>>> To make it more future proof, this walks through the entire .rela.dyn
>>> section instead of assuming that the section is sorter by a relocation
>>> type. Unlike [1], this does not add unaligned UADDR/UADDR64 relocations
>>                  ^
>>                  that should be 2?
>
> Yes.
>
>> 
>>> as in hardly possible to see those in arch-specific zImage.
>> 
>> I don't quite parse that. Is it true we can never see them in zImage?
>> Maybe it's true that we don't see them in practice.
>
> I can force UADDR64 in zImage as I did for d79976918852 but zImage is 
> lot smaller and more arch-specific than vmlinux and so far only 
> PRINT_INDEX triggered UADDR64 in vmlinux and chances of the same thing 
> happening in zImage are small.

OK. Just update the change log to say something like that. ie. they're
not impossible, but not seen in practice.

>>> @@ -75,34 +76,38 @@ p_base:	mflr	r10		/* r10 now points to runtime addr of p_base */
>>>   	bne	11f
>>>   	lwz	r9,4(r12)	/* get RELA pointer in r9 */
>>>   	b	12f
>>> -11:	addis	r8,r8,(-RELACOUNT)@ha
>>> -	cmpwi	r8,RELACOUNT@l
>>> +11:	cmpwi	r8,RELASZ
>>> +	bne	111f
>>> +	lwz	r0,4(r12)       /* get RELASZ value in r0 */
>>> +	b	12f
>>> +111:	cmpwi	r8,RELAENT
>> 
>> Can you use named local labels for new labels you introduce?
>> 
>> This could be .Lcheck_for_relaent: perhaps.
>
> Then I'll need to rename them all/most and add more noise to the patch 
> which reduces chances of it being reviewed. But sure, I can rename labels.

I said for new labels you introduce :) We can do a follow-up to rename
existing labels if we want to.

>>>   	bne	12f
>>> -	lwz	r0,4(r12)	/* get RELACOUNT value in r0 */
>>> +	lwz     r14,4(r12)      /* get RELAENT value in r14 */
>>>   12:	addi	r12,r12,8
>>>   	b	9b
>>>   
>>>   	/* The relocation section contains a list of relocations.
>>>   	 * We now do the R_PPC_RELATIVE ones, which point to words
>>> -	 * which need to be initialized with addend + offset.
>>> -	 * The R_PPC_RELATIVE ones come first and there are RELACOUNT
>>> -	 * of them. */
>>> +	 * which need to be initialized with addend + offset */
>>>   10:	/* skip relocation if we don't have both */
>>>   	cmpwi	r0,0
>>>   	beq	3f
>>>   	cmpwi	r9,0
>>>   	beq	3f
>>> +	cmpwi	r14,0
>>> +	beq	3f
>>>   
>>>   	add	r9,r9,r11	/* Relocate RELA pointer */
>>> +	divd    r0,r0,r14       /* RELASZ / RELAENT */
>> 
>> This is in the 32-bit portion isn't it. AFAIK 32-bit CPUs don't
>> implement divd. I'm not sure why the toolchain allowed it. I would
>> expect it to trap if run on real 32-bit hardware.
>
>
> Uff, my bad, "divw", right?

AFAIK yes.

> I am guessing it works as zImage for 64bit BigEndian is still ELF32 
> which runs in 64bit CPU and I did not test on real PPC32 as I'm not 
> quite sure how and I hoped your farm will do this for me :)

Yeah I was hoping they would catch it too. I build pmac32 which should
build a 32-bit zImage, but I build it with a 64-bit compiler using -m32,
so maybe that's why it's accepted. Or maybe we're passing the wrong
options to the assembler.

I don't have any tests of actually booting a 32-bit zImage, my automated
tests all use the vmlinux.

cheers
