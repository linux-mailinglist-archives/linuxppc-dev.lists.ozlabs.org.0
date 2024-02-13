Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A509F852715
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 02:52:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RVrdUSZz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYkq84MdNz3cGg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 12:52:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RVrdUSZz;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYkpR0THfz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 12:51:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1707789117;
	bh=E1BS1ELmNmnMjflg0puHJ0k70n02SlX60XY4TO/9ZAw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RVrdUSZz/ExUd2RHnWJZCVAx8mH4mWmm4GsKbWtGFzb6/99p/ptpP25Ug2AQC53tf
	 9GF9r2nEujJfJiuoB83JQ3zzFhiDeLYsEW64d/AywP+2C4qhVsNp/yOCTtAeKPH7An
	 Qg1YjNSSxCMqyfiSwEy2xc9bR9MuXlgPgSD9xtf7tDP6vdoPcNiQqJbwafSpbWY+hS
	 jnmSKWzpeT/23JfR7zqMQC14Wfh15YxUSuZsYL17tmjhIB7OkFudM+7qMS6VcXMUjP
	 Xx42ZLYohC344Nsj16P2Lf6gjehGH++ZTcnpf4PHZ6KYChv7mO6/hllmcTY315CNvk
	 bT2mK3EkVUCbw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TYkpP2NGRz4wcl;
	Tue, 13 Feb 2024 12:51:57 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao
 <naveen@kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/ftrace: Ignore ftrace locations in exit text
 sections
In-Reply-To: <669b8cbe-3fd4-44fb-be8d-f21def9f728e@csgroup.eu>
References: <20240209075931.666935-1-naveen@kernel.org>
 <669b8cbe-3fd4-44fb-be8d-f21def9f728e@csgroup.eu>
Date: Tue, 13 Feb 2024 12:51:56 +1100
Message-ID: <87ttmd6shv.fsf@mail.lhotse>
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 09/02/2024 =C3=A0 08:59, Naveen N Rao a =C3=A9crit=C2=A0:
>> Michael reported that we are seeing ftrace bug on bootup when KASAN is
>> enabled, and if we are using -fpatchable-function-entry:
>>=20
...
>> diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/=
asm/sections.h
>> index ea26665f82cf..d389dcecdb0b 100644
>> --- a/arch/powerpc/include/asm/sections.h
>> +++ b/arch/powerpc/include/asm/sections.h
>> @@ -14,6 +14,7 @@ typedef struct func_desc func_desc_t;
>>=20=20=20
>>   extern char __head_end[];
>>   extern char __srwx_boundary[];
>> +extern char _sexittext[], _eexittext[];
>
> Should we try to at least use the same symbols as others, or best try to=
=20
> move this into include/asm-generic/sections.h, just like inittext ?
>
> $ git grep exittext
> arch/arm64/include/asm/sections.h:extern char __exittext_begin[],=20
> __exittext_end[];
> arch/arm64/kernel/patching.c:           addr >=3D (unsigned=20
> long)__exittext_begin &&
> arch/arm64/kernel/patching.c:           addr < (unsigned=20
> long)__exittext_end;
> arch/arm64/kernel/vmlinux.lds.S:        __exittext_begin =3D .;
> arch/arm64/kernel/vmlinux.lds.S:        __exittext_end =3D .;
> arch/riscv/include/asm/sections.h:extern char __exittext_begin[],=20
> __exittext_end[];
> arch/riscv/kernel/patch.c:static inline bool=20
> is_kernel_exittext(uintptr_t addr)
> arch/riscv/kernel/patch.c:              addr >=3D=20
> (uintptr_t)__exittext_begin &&
> arch/riscv/kernel/patch.c:              addr < (uintptr_t)__exittext_end;
> arch/riscv/kernel/patch.c:      if (core_kernel_text(uintaddr) ||=20
> is_kernel_exittext(uintaddr))
> arch/riscv/kernel/vmlinux-xip.lds.S:    __exittext_begin =3D .;
> arch/riscv/kernel/vmlinux-xip.lds.S:    __exittext_end =3D .;
> arch/riscv/kernel/vmlinux.lds.S:        __exittext_begin =3D .;
> arch/riscv/kernel/vmlinux.lds.S:        __exittext_end =3D .;

I'll change it to use __exittext_begin/end.

>> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/tr=
ace/ftrace.c
>> index 82010629cf88..b5efd8d7bc01 100644
>> --- a/arch/powerpc/kernel/trace/ftrace.c
>> +++ b/arch/powerpc/kernel/trace/ftrace.c
>> @@ -27,10 +27,22 @@
>>   #include <asm/ftrace.h>
>>   #include <asm/syscall.h>
>>   #include <asm/inst.h>
>> +#include <asm/sections.h>
>>=20=20=20
>>   #define	NUM_FTRACE_TRAMPS	2
>>   static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
>>=20=20=20
>> +unsigned long ftrace_call_adjust(unsigned long addr)
>> +{
>> +	if (addr >=3D (unsigned long)_sexittext && addr < (unsigned long)_eexi=
ttext)
>> +		return 0;
>
> Then arm64 has a function called is_exit_text() and riscv has=20
> is_kernel_exittext(). Can we refactor ?

I'd like to get the fix in and backported, so I'll take it as-is but
with the section names changed to match the other arches.

We can do further refactoring on top.

cheers
