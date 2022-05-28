Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07552536CD4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 14:21:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9LQ76bwSz3bs2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 22:21:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kqdN3e2/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9LPV4Vx6z2xRm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 22:21:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kqdN3e2/;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4L9LPQ2zZlz4xZ0;
	Sat, 28 May 2022 22:21:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1653740476;
	bh=lBeVRIYEnBpfoa1y+dfWc2rNHDYGOWp54VP9xu/zsIc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kqdN3e2/bjmY0NgH8hlqCZXlQKLXstvIp/Ecl2cJzEWCE8IrnvoulltgeTj0TLBfH
	 DNhpYzOFJ3xIzJQyEjkqEzjnD059iaSweauuPRuK2kG8upubtvXPhnpxqgvFwpFnBa
	 AxUmgW2L8Tpr0tHdNDImNEW+09IBNCws/4ob7cY424GLxEPEQB0/mfGFInXiVoiLWr
	 ZNTeeJStO5Ca1UlqO7wPv4GlgV53YcjFdT2DGvNLbELWzgpGXr5mxVX+jFJ72LZou5
	 tq5kFSkAp6rWyOEtTVDP3s/g8pJcWwKg/ZBlSoQgOpP2y5QcnPzhEEH1IoiVzbWbT3
	 gDMQfJGgqDCzQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: xiujianfeng <xiujianfeng@huawei.com>, benh@kernel.crashing.org,
 paulus@samba.org, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 tglx@linutronix.de, mark.rutland@arm.com
Subject: Re: [PATCH -next, v2] powerpc: add support for syscall stack
 randomization
In-Reply-To: <e7b0d68b-914d-7283-827c-101988923929@huawei.com>
References: <20220516073225.112875-1-xiujianfeng@huawei.com>
 <e7b0d68b-914d-7283-827c-101988923929@huawei.com>
Date: Sat, 28 May 2022 22:21:13 +1000
Message-ID: <87sfotlufa.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

xiujianfeng <xiujianfeng@huawei.com> writes:
> friendly ping....

I will consider this for v5.20 once the merge window has closed (after
v5.19-rc1 is release).

cheers

> =E5=9C=A8 2022/5/16 15:32, Xiu Jianfeng =E5=86=99=E9=81=93:
>> Add support for adding a random offset to the stack while handling
>> syscalls. This patch uses mftb() instead of get_random_int() for better
>> performance.
>>
>> In order to avoid unconditional stack canaries on syscall entry (due to
>> the use of alloca()), also disable stack protector to avoid triggering
>> needless checks and slowing down the entry path. As there is no general
>> way to control stack protector coverage with a function attribute, this
>> must be disabled at the compilation unit level.
>>
>> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
>>
>> ---
>> Changes in v2:
>>    -move choose choose_random_kstack_offset() to the end of system_call_=
exception
>>    -allow full 6 (10) bits of entropy
>>    -disable stack-protector for interrupt.c
>> ---
>>   arch/powerpc/Kconfig            |  1 +
>>   arch/powerpc/kernel/Makefile    |  7 +++++++
>>   arch/powerpc/kernel/interrupt.c | 19 ++++++++++++++++++-
>>   3 files changed, 26 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 98309eeae09c..2f0019a0054e 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -192,6 +192,7 @@ config PPC
>>   	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <=3D 14
>>   	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <=3D 14
>>   	select HAVE_ARCH_KFENCE			if PPC_BOOK3S_32 || PPC_8xx || 40x
>> +	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
>>   	select HAVE_ARCH_KGDB
>>   	select HAVE_ARCH_MMAP_RND_BITS
>>   	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
>> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
>> index 4ddd161aef32..5c5e85b8229b 100644
>> --- a/arch/powerpc/kernel/Makefile
>> +++ b/arch/powerpc/kernel/Makefile
>> @@ -40,6 +40,13 @@ CFLAGS_cputable.o +=3D -DDISABLE_BRANCH_PROFILING
>>   CFLAGS_btext.o +=3D -DDISABLE_BRANCH_PROFILING
>>   endif
>>=20=20=20
>> +#ifdef CONFIG_RANDOMIZE_KSTACK_OFFSET
>> +# Remove stack protector to avoid triggering unneeded stack canary
>> +# checks due to randomize_kstack_offset.
>> +CFLAGS_REMOVE_interrupt.o =3D -fstack-protector -fstack-protector-strong
>> +CFLAGS_interrupt.o +=3D -fno-stack-protector
>> +#endif
>> +
>>   obj-y				:=3D cputable.o syscalls.o \
>>   				   irq.o align.o signal_$(BITS).o pmc.o vdso.o \
>>   				   process.o systbl.o idle.o \
>> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/inter=
rupt.c
>> index 784ea3289c84..d7cdcb6fc336 100644
>> --- a/arch/powerpc/kernel/interrupt.c
>> +++ b/arch/powerpc/kernel/interrupt.c
>> @@ -4,6 +4,7 @@
>>   #include <linux/err.h>
>>   #include <linux/compat.h>
>>   #include <linux/sched/debug.h> /* for show_regs */
>> +#include <linux/randomize_kstack.h>
>>=20=20=20
>>   #include <asm/kup.h>
>>   #include <asm/cputime.h>
>> @@ -78,10 +79,12 @@ notrace long system_call_exception(long r3, long r4,=
 long r5,
>>   				   long r6, long r7, long r8,
>>   				   unsigned long r0, struct pt_regs *regs)
>>   {
>> +	long ret;
>>   	syscall_fn f;
>>=20=20=20
>>   	kuap_lock();
>>=20=20=20
>> +	add_random_kstack_offset();
>>   	regs->orig_gpr3 =3D r3;
>>=20=20=20
>>   	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>> @@ -229,7 +232,21 @@ notrace long system_call_exception(long r3, long r4=
, long r5,
>>   		f =3D (void *)sys_call_table[r0];
>>   	}
>>=20=20=20
>> -	return f(r3, r4, r5, r6, r7, r8);
>> +	ret =3D f(r3, r4, r5, r6, r7, r8);
>> +	/*
>> +	 * Ultimately, this value will get limited by KSTACK_OFFSET_MAX(),
>> +	 * so the maximum stack offset is 1k bytes(10 bits).
>> +	 *
>> +	 * The actual entropy will be further reduced by the compiler when
>> +	 * applying stack alignment constraints: the powerpc architecture
>> +	 * may have two kinds of stack alignment(16-bytes and 8-bytes).
>> +	 *
>> +	 * So the resulting 6 or 7 bits of entropy is seen in SP[9:4] or SP[9:=
3].
>> +	 *
>> +	 */
>> +	choose_random_kstack_offset(mftb());
>> +
>> +	return ret;
>>   }
>>=20=20=20
>>   static notrace void booke_load_dbcr0(void)
