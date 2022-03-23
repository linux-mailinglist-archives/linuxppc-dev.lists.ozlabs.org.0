Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CF54E4A04
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 01:19:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNTW42XKvz30HJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 11:19:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=QSBv6mJP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=QSBv6mJP; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNTVP1cF1z2xZk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Mar 2022 11:18:50 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id z16so165439pfh.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 17:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=B1Nqgd96FTfYAbZX9iCe5t5QEuMp6XjHuQOPa2S/hOE=;
 b=QSBv6mJPOi2Rq41IyJ7Z3GtS7ttkynMi0H/o1J9UcgX3Z07XKs+hLRicIAizQEsfLZ
 +1OzYubbCckiu6oHn37KzwOWFbjLHPm73meEEcITYE+c7A7Yq4hoaSQMEXyr4Trizye6
 3n5rxhszGNXJVc34eA3MOtRMSiTc98n3W63pZytQeHHaXzM7z/3MI57bbQ3lAISmRUgN
 /IejeH9aDB8X/gRWHRx3DttsU8AOOAqMOev/+oeH49FlQOJjL5lnQ9l7LbLnorA/UFnY
 7rd1hkIYTU/uTBVYhGncnQKMKFSfG8SVE1OpsXvJm9bbVHsLr9M+ceOFUsCS+Ta6Gkpc
 L3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B1Nqgd96FTfYAbZX9iCe5t5QEuMp6XjHuQOPa2S/hOE=;
 b=4/8whTxa2WV0A7kYH7Bf/DM7xxQ3/X/G9CNxuGm9U4y7yTd6MUhj8lE4RLUr8UwqYQ
 JecuTtlBYZiApAdOdWlWd2jALiwT1g8Xe1cvVzYoBUjuZxPGD4tUM2XcBNk79UjYNFTb
 TnB5xu1FxkBHT3gJQZeUXRzgz4Y2Ywm1Mgo8x42LlaKdsgKAJreiWmS3zHU6FmfUy+XX
 2ZVY7CIb9ad4iNwtzUUGUYQJ5uRBCP6kOKSii8YrzbiBm94J/IKn4anCC6aBiE3Tvh40
 7ZEUsP9LZhlu9RiCKKdOCSPeRDyXvBNEOrOuFhdZnHPaz2E1bPjC63myJAf7GXIWygd5
 rFxw==
X-Gm-Message-State: AOAM530XhnxnxXQf+kfLfdi4x0OHS5Ean/mWfJorSLxzqGvjW/EiHNMx
 2Ga5rdyLidi8BZHa/7n9oIXPCw==
X-Google-Smtp-Source: ABdhPJzw8x8pP3JeMikHoflokVmKB1GI4f+U3l0+Tx/CsylhkiNI4QQ1ntGjXZAkoy5vVcaGLLir/w==
X-Received: by 2002:a05:6a00:1c5e:b0:4f7:e2a5:50f6 with SMTP id
 s30-20020a056a001c5e00b004f7e2a550f6mr31224367pfw.78.1647994726277; 
 Tue, 22 Mar 2022 17:18:46 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 j9-20020a056a00130900b004f73df40914sm23971988pfu.82.2022.03.22.17.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 17:18:45 -0700 (PDT)
Message-ID: <ed991242-6ef2-b346-ffde-a38cb75db0cf@ozlabs.ru>
Date: Wed, 23 Mar 2022 11:18:40 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:99.0) Gecko/20100101
 Thunderbird/99.0
Subject: Re: [PATCH kernel] powerpc/boot: Stop using RELACOUNT
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20220321071026.918262-1-aik@ozlabs.ru>
 <87fsnahh10.fsf@mpe.ellerman.id.au>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <87fsnahh10.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/22/22 13:12, Michael Ellerman wrote:
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>> So far the RELACOUNT tag from the ELF header was containing the exact
>> number of R_PPC_RELATIVE/R_PPC64_RELATIVE relocations. However the LLVM's
>> recent change [1] make it equal-or-less than the actual number which
>> makes it useless.
>>
>> This replaces RELACOUNT in zImage loader with a pair of RELASZ and RELAENT.
>> The vmlinux relocation code is fixed in [2].
> 
> That's committed so you can say:
>    in commit d79976918852 ("powerpc/64: Add UADDR64 relocation support")
> 
>> To make it more future proof, this walks through the entire .rela.dyn
>> section instead of assuming that the section is sorter by a relocation
>> type. Unlike [1], this does not add unaligned UADDR/UADDR64 relocations
>                  ^
>                  that should be 2?

Yes.

> 
>> as in hardly possible to see those in arch-specific zImage.
> 
> I don't quite parse that. Is it true we can never see them in zImage?
> Maybe it's true that we don't see them in practice.

I can force UADDR64 in zImage as I did for d79976918852 but zImage is 
lot smaller and more arch-specific than vmlinux and so far only 
PRINT_INDEX triggered UADDR64 in vmlinux and chances of the same thing 
happening in zImage are small.


> 
>> [1] https://github.com/llvm/llvm-project/commit/da0e5b885b25cf4
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=d799769188529a
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>   arch/powerpc/boot/crt0.S | 43 +++++++++++++++++++++++++---------------
>>   1 file changed, 27 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/powerpc/boot/crt0.S b/arch/powerpc/boot/crt0.S
>> index feadee18e271..6ea3417da3b7 100644
>> --- a/arch/powerpc/boot/crt0.S
>> +++ b/arch/powerpc/boot/crt0.S
>> @@ -8,7 +8,8 @@
>>   #include "ppc_asm.h"
>>   
>>   RELA = 7
>> -RELACOUNT = 0x6ffffff9
>> +RELASZ = 8
>> +RELAENT = 9
>>   
>>   	.data
>>   	/* A procedure descriptor used when booting this as a COFF file.
>> @@ -75,34 +76,38 @@ p_base:	mflr	r10		/* r10 now points to runtime addr of p_base */
>>   	bne	11f
>>   	lwz	r9,4(r12)	/* get RELA pointer in r9 */
>>   	b	12f
>> -11:	addis	r8,r8,(-RELACOUNT)@ha
>> -	cmpwi	r8,RELACOUNT@l
>> +11:	cmpwi	r8,RELASZ
>> +	bne	111f
>> +	lwz	r0,4(r12)       /* get RELASZ value in r0 */
>> +	b	12f
>> +111:	cmpwi	r8,RELAENT
> 
> Can you use named local labels for new labels you introduce?
> 
> This could be .Lcheck_for_relaent: perhaps.

Then I'll need to rename them all/most and add more noise to the patch 
which reduces chances of it being reviewed. But sure, I can rename labels.



>>   	bne	12f
>> -	lwz	r0,4(r12)	/* get RELACOUNT value in r0 */
>> +	lwz     r14,4(r12)      /* get RELAENT value in r14 */
>>   12:	addi	r12,r12,8
>>   	b	9b
>>   
>>   	/* The relocation section contains a list of relocations.
>>   	 * We now do the R_PPC_RELATIVE ones, which point to words
>> -	 * which need to be initialized with addend + offset.
>> -	 * The R_PPC_RELATIVE ones come first and there are RELACOUNT
>> -	 * of them. */
>> +	 * which need to be initialized with addend + offset */
>>   10:	/* skip relocation if we don't have both */
>>   	cmpwi	r0,0
>>   	beq	3f
>>   	cmpwi	r9,0
>>   	beq	3f
>> +	cmpwi	r14,0
>> +	beq	3f
>>   
>>   	add	r9,r9,r11	/* Relocate RELA pointer */
>> +	divd    r0,r0,r14       /* RELASZ / RELAENT */
> 
> This is in the 32-bit portion isn't it. AFAIK 32-bit CPUs don't
> implement divd. I'm not sure why the toolchain allowed it. I would
> expect it to trap if run on real 32-bit hardware.


Uff, my bad, "divw", right?

I am guessing it works as zImage for 64bit BigEndian is still ELF32 
which runs in 64bit CPU and I did not test on real PPC32 as I'm not 
quite sure how and I hoped your farm will do this for me :)



>>   	mtctr	r0
>>   2:	lbz	r0,4+3(r9)	/* ELF32_R_INFO(reloc->r_info) */
>>   	cmpwi	r0,22		/* R_PPC_RELATIVE */
>> -	bne	3f
>> +	bne	22f
>>   	lwz	r12,0(r9)	/* reloc->r_offset */
>>   	lwz	r0,8(r9)	/* reloc->r_addend */
>>   	add	r0,r0,r11
>>   	stwx	r0,r11,r12
>> -	addi	r9,r9,12
>> +22:	add	r9,r9,r14
>>   	bdnz	2b
>>   
>>   	/* Do a cache flush for our text, in case the loader didn't */
> 
> cheers
