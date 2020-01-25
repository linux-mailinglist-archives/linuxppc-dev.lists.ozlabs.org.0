Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E311495F0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2020 14:31:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 484cNs4QDBzDqCR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jan 2020 00:31:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 484cJk5DBqzDqTX
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jan 2020 00:28:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=fBmBza3p; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 484cJj1cFFz9sP6;
 Sun, 26 Jan 2020 00:28:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579958885;
 bh=hrN2cDvQml3IWViJQOWK0NfFHm1QM+DSycnJ6yh5o6Y=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fBmBza3pY8IaqQVQIQIr1Goqw77sYg4IV8ExncGYSuzAr1Jic6QrQA8DuNBGNSXpB
 fWZL96GDOtZXsC1dk2UZ76lURFiub+FFmIgPzlyI3disq2/i6gt6kGGik6bhpTJeQH
 +51Ahks4PUegxHmwZ5rsfmfCEfsQ68xPZwK62rD6hCs6hdh5sgUW9FVYoefH6vM1Yt
 EOftKAyiYji9KgchHK7X5neeoIwsjoIB7rpLQFHXpEUyiO5EUKD1y3nx5H3UPqv3Ma
 HKqDFmkON+DPvdAuIwRrH/iY1h1CxWup6TIbsvfwWZbq9ZOE9yBkZKKQg4xbis3i2u
 WymMNmxiRQT2g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/32: Add missing context synchronisation with
 CONFIG_VMAP_STACK
In-Reply-To: <20200125140052.Horde.0-n2_EcIdGahTxfDVj913w1@messagerie.si.c-s.fr>
References: <872477f7c7552d3bb7baf0b302398fcd42c5fcfd.1579885334.git.christophe.leroy@c-s.fr>
 <87r1znhgvi.fsf@mpe.ellerman.id.au>
 <20200125140052.Horde.0-n2_EcIdGahTxfDVj913w1@messagerie.si.c-s.fr>
Date: Sun, 26 Jan 2020 00:28:04 +1100
Message-ID: <87o8urhdi3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Michael Ellerman <mpe@ellerman.id.au> a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
...
>>> diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_3=
2.h
>>> index 73a035b40dbf..a6a5fbbf8504 100644
>>> --- a/arch/powerpc/kernel/head_32.h
>>> +++ b/arch/powerpc/kernel/head_32.h
>>> @@ -43,6 +43,7 @@
>>>  	.ifeq	\for_rtas
>>>  	li	r11, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
>>>  	mtmsr	r11
>>> +	isync
>>
>> Actually this one leads to:
>>
>>   /home/michael/linux/arch/powerpc/kernel/head_8xx.S: Assembler messages:
>>   /home/michael/linux/arch/powerpc/kernel/head_8xx.S:151: Error:=20=20
>> attempt to move .org backwards
>>   make[3]: *** [/home/michael/linux/scripts/Makefile.build:348:=20=20
>> arch/powerpc/kernel/head_8xx.o] Error 1
>>
>> For mpc885_ads_defconfig.
>>
>> That's the alignment exception overflowing into the program check
>> handler:
>>
>> /* Alignment exception */
>> 	. =3D 0x600
>> Alignment:
>> 	EXCEPTION_PROLOG handle_dar_dsisr=3D1
>> 	save_dar_dsisr_on_stack r4, r5, r11
>> 	li	r6, RPN_PATTERN
>> 	mtspr	SPRN_DAR, r6	/* Tag DAR, to be used in DTLB Error */
>> 	addi	r3,r1,STACK_FRAME_OVERHEAD
>> 	EXC_XFER_STD(0x600, alignment_exception)
>>
>> /* Program check exception */
>> 	EXCEPTION(0x700, ProgramCheck, program_check_exception, EXC_XFER_STD)
>>
>>
>> Can't see an obvious/easy way to fix it.
>
> Argh !
>
> I think the easiest is to move the EXC_XFER_STD(0x600,=20=20
> alignment_exception) somewhere else and branch to it. There is some=20=20
> space at .0xa00

That works, or builds at least. I'm not setup to boot test it.

Does this look OK?

cheers


From 40e7d671aa27cf4411188f978b2cd06b30a9cb6c Mon Sep 17 00:00:00 2001
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 26 Jan 2020 00:20:16 +1100
Subject: [PATCH] powerpc/8xx: Move tail of alignment exception out of line

When we enable VMAP_STACK there will not be enough room for the
alignment handler at 0x600 in head_8xx.S. For now move the tail of the
alignment handler out of line, and branch to it.

Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/head_8xx.S | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 477933b36bde..9922306ae512 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -145,7 +145,7 @@ _ENTRY(_start);
 	li	r6, RPN_PATTERN
 	mtspr	SPRN_DAR, r6	/* Tag DAR, to be used in DTLB Error */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	EXC_XFER_STD(0x600, alignment_exception)
+	b	.Lalignment_exception_ool
=20
 /* Program check exception */
 	EXCEPTION(0x700, ProgramCheck, program_check_exception, EXC_XFER_STD)
@@ -153,6 +153,11 @@ _ENTRY(_start);
 /* Decrementer */
 	EXCEPTION(0x900, Decrementer, timer_interrupt, EXC_XFER_LITE)
=20
+	/* With VMAP_STACK there's not enough room for this at 0x600 */
+	. =3D 0xa00
+.Lalignment_exception_ool:
+	EXC_XFER_STD(0x600, alignment_exception)
+
 /* System call */
 	. =3D 0xc00
 SystemCall:
--=20
2.21.1



