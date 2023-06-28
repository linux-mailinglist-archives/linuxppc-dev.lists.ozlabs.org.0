Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1C27409C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 09:41:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HaKup5DU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrYS12vbSz30fj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 17:41:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HaKup5DU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrYR94FG3z2xvh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 17:40:53 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C5E8B611E7;
	Wed, 28 Jun 2023 07:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9123C433C0;
	Wed, 28 Jun 2023 07:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687938051;
	bh=cNlBH+vTHMW9+MKT8fk5fenH0vroUgMI3tbT/CXW30w=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=HaKup5DUqr+74L37ktpPBFVzwdgPVkj2TeJmV+LMSUXDN/v1lMdqRnAJdeOmzsSVh
	 On9fwJegIlVG0Dy77QfndrG12GGoR+/ezIKwXd6+7otDQ1Li9AYias8Z+suaXv+RxP
	 z+2fj+kVqSVJGC7ebxVOOVC8is9ZZ9Ol1MVL7VDlC+fJFqTu4iLTFAGDEKHoCqk/Fc
	 IrEypOvH+B2uo/Qwbk4n91mmDFjYGsf/+h28J5bAFtqNrOM1SU3gETB/1Zl80M08td
	 LVKXPCTZc9LeV0RJC4JNSP+M6e/46gEp9lzaq9oGQLjivN6hXMPdcPtPaalHnXTe6U
	 I2C9OMxIQU2QQ==
Date: Wed, 28 Jun 2023 13:02:23 +0530
From: Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH 07/17] powerpc/ftrace: Consolidate ftrace support into
 fewer files
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <cover.1687166935.git.naveen@kernel.org>
	<b900c9a8bba9d6c3c295e0f99886acf3e5bf6f7b.1687166935.git.naveen@kernel.org>
	<057806e4-5bf3-9b0f-8019-a8114245c4c6@csgroup.eu>
In-Reply-To: <057806e4-5bf3-9b0f-8019-a8114245c4c6@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/0.16.0 (https://github.com/astroidmail/astroid)
Message-Id: <1687937094.stfrhadixq.naveen@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

Christophe Leroy wrote:
>=20
>=20
> Le 19/06/2023 =C3=A0 11:47, Naveen N Rao a =C3=A9crit=C2=A0:
>> ftrace_low.S has just the _mcount stub and return_to_handler(). Merge
>> this back into ftrace_mprofile.S and ftrace_64_pg.S to keep all ftrace
>> code together, and to allow those to evolve independently.
>>=20
>> ftrace_mprofile.S is also not an entirely accurate name since this also
>> holds ppc32 code. This will be all the more incorrect once support for
>> -fpatchable-function-entry is added. Rename files here to more
>> accurately describe the code:
>> - ftrace_mprofile.S is renamed to ftrace_entry.S
>> - ftrace_pg.c is renamed to ftrace_64_pg.c
>> - ftrace_64_pg.S is rename to ftrace_64_pg_entry.S
>=20
> The stats from git do not match., it says {ftrace_low.S =3D>=20
> ftrace_64_pg_entry.S

I suppose that's git diff view. You can see from the patch below that=20
the header of ftrace_64_pg_entry.S carries the line 'Split from=20
ftrace_64.S'. In reality, this is still ftrace_low.S being merged into=20
ftrace_64_pg.S.

>=20
>>=20
>> Signed-off-by: Naveen N Rao <naveen@kernel.org>
>=20
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thanks for the review.

- Naveen

>=20
>> ---
>>   arch/powerpc/kernel/trace/Makefile            | 17 +++--
>>   arch/powerpc/kernel/trace/ftrace_64_pg.S      | 67 -------------------
>>   .../trace/{ftrace_pg.c =3D> ftrace_64_pg.c}     |  0
>>   .../{ftrace_low.S =3D> ftrace_64_pg_entry.S}    | 58 +++++++++++++++-
>>   .../{ftrace_mprofile.S =3D> ftrace_entry.S}     | 65 +++++++++++++++++=
+
>>   5 files changed, 130 insertions(+), 77 deletions(-)
>>   delete mode 100644 arch/powerpc/kernel/trace/ftrace_64_pg.S
>>   rename arch/powerpc/kernel/trace/{ftrace_pg.c =3D> ftrace_64_pg.c} (10=
0%)
>>   rename arch/powerpc/kernel/trace/{ftrace_low.S =3D> ftrace_64_pg_entry=
.S} (55%)
>>   rename arch/powerpc/kernel/trace/{ftrace_mprofile.S =3D> ftrace_entry.=
S} (83%)
>>=20
>> diff --git a/arch/powerpc/kernel/trace/Makefile b/arch/powerpc/kernel/tr=
ace/Makefile
>> index 342a2d1ae86cd0..125f4ca588b98a 100644
>> --- a/arch/powerpc/kernel/trace/Makefile
>> +++ b/arch/powerpc/kernel/trace/Makefile
>> @@ -6,16 +6,15 @@
>>   ifdef CONFIG_FUNCTION_TRACER
>>   # do not trace tracer code
>>   CFLAGS_REMOVE_ftrace.o =3D $(CC_FLAGS_FTRACE)
>> -CFLAGS_REMOVE_ftrace_pg.o =3D $(CC_FLAGS_FTRACE)
>> +CFLAGS_REMOVE_ftrace_64_pg.o =3D $(CC_FLAGS_FTRACE)
>>   endif
>>  =20
>> -obj32-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_mprofile.o ftrace.o
>> +obj32-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace.o ftrace_entry.o
>>   ifdef CONFIG_MPROFILE_KERNEL
>> -obj64-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_mprofile.o ftrace.o
>> +obj64-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace.o ftrace_entry.o
>>   else
>> -obj64-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_64_pg.o ftrace_pg.o
>> +obj64-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_64_pg.o ftrace_64_pg_entry=
.o
>>   endif
>> -obj-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_low.o
>>   obj-$(CONFIG_TRACING)			+=3D trace_clock.o
>>  =20
>>   obj-$(CONFIG_PPC64)			+=3D $(obj64-y)
>> @@ -26,7 +25,7 @@ GCOV_PROFILE_ftrace.o :=3D n
>>   KCOV_INSTRUMENT_ftrace.o :=3D n
>>   KCSAN_SANITIZE_ftrace.o :=3D n
>>   UBSAN_SANITIZE_ftrace.o :=3D n
>> -GCOV_PROFILE_ftrace_pg.o :=3D n
>> -KCOV_INSTRUMENT_ftrace_pg.o :=3D n
>> -KCSAN_SANITIZE_ftrace_pg.o :=3D n
>> -UBSAN_SANITIZE_ftrace_pg.o :=3D n
>> +GCOV_PROFILE_ftrace_64_pg.o :=3D n
>> +KCOV_INSTRUMENT_ftrace_64_pg.o :=3D n
>> +KCSAN_SANITIZE_ftrace_64_pg.o :=3D n
>> +UBSAN_SANITIZE_ftrace_64_pg.o :=3D n
>> diff --git a/arch/powerpc/kernel/trace/ftrace_64_pg.S b/arch/powerpc/ker=
nel/trace/ftrace_64_pg.S
>> deleted file mode 100644
>> index 6708e24db0aba8..00000000000000
>> --- a/arch/powerpc/kernel/trace/ftrace_64_pg.S
>> +++ /dev/null
>> @@ -1,67 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0-or-later */
>> -/*
>> - * Split from ftrace_64.S
>> - */
>> -
>> -#include <linux/magic.h>
>> -#include <asm/ppc_asm.h>
>> -#include <asm/asm-offsets.h>
>> -#include <asm/ftrace.h>
>> -#include <asm/ppc-opcode.h>
>> -#include <asm/export.h>
>> -
>> -_GLOBAL_TOC(ftrace_caller)
>> -	lbz	r3, PACA_FTRACE_ENABLED(r13)
>> -	cmpdi	r3, 0
>> -	beqlr
>> -
>> -	/* Taken from output of objdump from lib64/glibc */
>> -	mflr	r3
>> -	ld	r11, 0(r1)
>> -	stdu	r1, -112(r1)
>> -	std	r3, 128(r1)
>> -	ld	r4, 16(r11)
>> -	subi	r3, r3, MCOUNT_INSN_SIZE
>> -.globl ftrace_call
>> -ftrace_call:
>> -	bl	ftrace_stub
>> -	nop
>> -#ifdef CONFIG_FUNCTION_GRAPH_TRACER
>> -.globl ftrace_graph_call
>> -ftrace_graph_call:
>> -	b	ftrace_graph_stub
>> -_GLOBAL(ftrace_graph_stub)
>> -#endif
>> -	ld	r0, 128(r1)
>> -	mtlr	r0
>> -	addi	r1, r1, 112
>> -
>> -_GLOBAL(ftrace_stub)
>> -	blr
>> -
>> -#ifdef CONFIG_FUNCTION_GRAPH_TRACER
>> -_GLOBAL(ftrace_graph_caller)
>> -	addi	r5, r1, 112
>> -	/* load r4 with local address */
>> -	ld	r4, 128(r1)
>> -	subi	r4, r4, MCOUNT_INSN_SIZE
>> -
>> -	/* Grab the LR out of the caller stack frame */
>> -	ld	r11, 112(r1)
>> -	ld	r3, 16(r11)
>> -
>> -	bl	prepare_ftrace_return
>> -	nop
>> -
>> -	/*
>> -	 * prepare_ftrace_return gives us the address we divert to.
>> -	 * Change the LR in the callers stack frame to this.
>> -	 */
>> -	ld	r11, 112(r1)
>> -	std	r3, 16(r11)
>> -
>> -	ld	r0, 128(r1)
>> -	mtlr	r0
>> -	addi	r1, r1, 112
>> -	blr
>> -#endif /* CONFIG_FUNCTION_GRAPH_TRACER */
>> diff --git a/arch/powerpc/kernel/trace/ftrace_pg.c b/arch/powerpc/kernel=
/trace/ftrace_64_pg.c
>> similarity index 100%
>> rename from arch/powerpc/kernel/trace/ftrace_pg.c
>> rename to arch/powerpc/kernel/trace/ftrace_64_pg.c
>> diff --git a/arch/powerpc/kernel/trace/ftrace_low.S b/arch/powerpc/kerne=
l/trace/ftrace_64_pg_entry.S
>> similarity index 55%
>> rename from arch/powerpc/kernel/trace/ftrace_low.S
>> rename to arch/powerpc/kernel/trace/ftrace_64_pg_entry.S
>> index 2fc7dd0a5ae968..81dbaf70b1513a 100644
>> --- a/arch/powerpc/kernel/trace/ftrace_low.S
>> +++ b/arch/powerpc/kernel/trace/ftrace_64_pg_entry.S
>> @@ -1,6 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-or-later */
>>   /*
>> - * Split from entry_64.S
>> + * Split from ftrace_64.S
>>    */
>>  =20
>>   #include <linux/magic.h>
>> @@ -10,6 +10,62 @@
>>   #include <asm/ppc-opcode.h>
>>   #include <asm/export.h>
>>  =20
>> +_GLOBAL_TOC(ftrace_caller)
>> +	lbz	r3, PACA_FTRACE_ENABLED(r13)
>> +	cmpdi	r3, 0
>> +	beqlr
>> +
>> +	/* Taken from output of objdump from lib64/glibc */
>> +	mflr	r3
>> +	ld	r11, 0(r1)
>> +	stdu	r1, -112(r1)
>> +	std	r3, 128(r1)
>> +	ld	r4, 16(r11)
>> +	subi	r3, r3, MCOUNT_INSN_SIZE
>> +.globl ftrace_call
>> +ftrace_call:
>> +	bl	ftrace_stub
>> +	nop
>> +#ifdef CONFIG_FUNCTION_GRAPH_TRACER
>> +.globl ftrace_graph_call
>> +ftrace_graph_call:
>> +	b	ftrace_graph_stub
>> +_GLOBAL(ftrace_graph_stub)
>> +#endif
>> +	ld	r0, 128(r1)
>> +	mtlr	r0
>> +	addi	r1, r1, 112
>> +
>> +_GLOBAL(ftrace_stub)
>> +	blr
>> +
>> +#ifdef CONFIG_FUNCTION_GRAPH_TRACER
>> +_GLOBAL(ftrace_graph_caller)
>> +	addi	r5, r1, 112
>> +	/* load r4 with local address */
>> +	ld	r4, 128(r1)
>> +	subi	r4, r4, MCOUNT_INSN_SIZE
>> +
>> +	/* Grab the LR out of the caller stack frame */
>> +	ld	r11, 112(r1)
>> +	ld	r3, 16(r11)
>> +
>> +	bl	prepare_ftrace_return
>> +	nop
>> +
>> +	/*
>> +	 * prepare_ftrace_return gives us the address we divert to.
>> +	 * Change the LR in the callers stack frame to this.
>> +	 */
>> +	ld	r11, 112(r1)
>> +	std	r3, 16(r11)
>> +
>> +	ld	r0, 128(r1)
>> +	mtlr	r0
>> +	addi	r1, r1, 112
>> +	blr
>> +#endif /* CONFIG_FUNCTION_GRAPH_TRACER */
>> +
>>   .pushsection ".tramp.ftrace.text","aw",@progbits;
>>   .globl ftrace_tramp_text
>>   ftrace_tramp_text:
>> diff --git a/arch/powerpc/kernel/trace/ftrace_mprofile.S b/arch/powerpc/=
kernel/trace/ftrace_entry.S
>> similarity index 83%
>> rename from arch/powerpc/kernel/trace/ftrace_mprofile.S
>> rename to arch/powerpc/kernel/trace/ftrace_entry.S
>> index ffb1db38684998..e8339706e735b1 100644
>> --- a/arch/powerpc/kernel/trace/ftrace_mprofile.S
>> +++ b/arch/powerpc/kernel/trace/ftrace_entry.S
>> @@ -249,3 +249,68 @@ livepatch_handler:
>>   	/* Return to original caller of live patched function */
>>   	blr
>>   #endif /* CONFIG_LIVEPATCH */
>> +
>> +_GLOBAL(mcount)
>> +_GLOBAL(_mcount)
>> +EXPORT_SYMBOL(_mcount)
>> +	mflr	r12
>> +	mtctr	r12
>> +	mtlr	r0
>> +	bctr
>> +
>> +#ifdef CONFIG_FUNCTION_GRAPH_TRACER
>> +_GLOBAL(return_to_handler)
>> +	/* need to save return values */
>> +#ifdef CONFIG_PPC64
>> +	std	r4,  -32(r1)
>> +	std	r3,  -24(r1)
>> +	/* save TOC */
>> +	std	r2,  -16(r1)
>> +	std	r31, -8(r1)
>> +	mr	r31, r1
>> +	stdu	r1, -112(r1)
>> +
>> +	/*
>> +	 * We might be called from a module.
>> +	 * Switch to our TOC to run inside the core kernel.
>> +	 */
>> +	LOAD_PACA_TOC()
>> +#else
>> +	stwu	r1, -16(r1)
>> +	stw	r3, 8(r1)
>> +	stw	r4, 12(r1)
>> +#endif
>> +
>> +	bl	ftrace_return_to_handler
>> +	nop
>> +
>> +	/* return value has real return address */
>> +	mtlr	r3
>> +
>> +#ifdef CONFIG_PPC64
>> +	ld	r1, 0(r1)
>> +	ld	r4,  -32(r1)
>> +	ld	r3,  -24(r1)
>> +	ld	r2,  -16(r1)
>> +	ld	r31, -8(r1)
>> +#else
>> +	lwz	r3, 8(r1)
>> +	lwz	r4, 12(r1)
>> +	addi	r1, r1, 16
>> +#endif
>> +
>> +	/* Jump back to real return address */
>> +	blr
>> +#endif /* CONFIG_FUNCTION_GRAPH_TRACER */
>> +
>> +.pushsection ".tramp.ftrace.text","aw",@progbits;
>> +.globl ftrace_tramp_text
>> +ftrace_tramp_text:
>> +	.space 32
>> +.popsection
>> +
>> +.pushsection ".tramp.ftrace.init","aw",@progbits;
>> +.globl ftrace_tramp_init
>> +ftrace_tramp_init:
>> +	.space 32
>> +.popsection
>=20
