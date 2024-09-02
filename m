Return-Path: <linuxppc-dev+bounces-874-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 627FC968873
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 15:07:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wy8DH26WVz2xYq;
	Mon,  2 Sep 2024 23:07:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725282431;
	cv=none; b=TokT0wglSnBSMWE7ApqJZeRgadjJ8M70m0nxN8bI1VLZRBsprttgEmf+VmFekL96lAheH8nrzxyuhw/OLvUkCar+J3Ty26IQU3p0s6bXb16KNi5JoQiQI/OhsAm7rEzy1DN1YEGqJH5ODL7439uRqS5SGPdfZHISZhd30ULcMJs18rlSVaksu99Pt3zVSiXI3Hsc2anXTSNqp3F6CIgRK5t8GBV8EhW8+m6EP8XZF3ScUEc/ylSQe8sihz20IYWDNePMmgQPT6IvtLX4vttWAZtvkjEk7VYIEjj8NSHHrh7bm6wFis3lVYXDXmnMa/JFuMnLEsHNCtX28xmOMNaZMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725282431; c=relaxed/relaxed;
	bh=+tQOD9NWAYHoXwqb+CUO3TF73BxJoIY/zOUUL+NmKks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UfKfz0A35Ouq97dm84st62pCPm1vmvwrQ15xQbQRywZmm1sodEm0dgxiLxO79Tw33X+gYEEwRNE0ppOxZSMWuoZbPC3IOUj4x/6PAVMyFT5ZarlOAGibK7rH4EeBa8p76doJENJG9KKmq3u00+W76I7sQpB6ccmoUXUZW4UPoXIKQlr4Ak7zT69BGKpdkC1UoQtBreuOO6orbKFtbcAL5Zlwz8q1fqSwhpXrHg6JD8t7rqsIMHsk57Xd9kTYEfmyjeDk+Gu/iIdm24oGHb03gPtwd2olRAhKO6LAJO2M/+6LeVQVX3JpGuk+q0qu4ss/7qI0xlm9BagU6xIX8wo0AQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wy8DG6sVdz2xWT
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 23:07:09 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wy8DB1TB0z9sSN;
	Mon,  2 Sep 2024 15:07:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pEK_keS0MYWc; Mon,  2 Sep 2024 15:07:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wy8DB0STbz9sS7;
	Mon,  2 Sep 2024 15:07:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F114A8B76C;
	Mon,  2 Sep 2024 15:07:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id unc9YceQJHKx; Mon,  2 Sep 2024 15:07:05 +0200 (CEST)
Received: from [192.168.234.167] (unknown [192.168.234.167])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F2E7F8B763;
	Mon,  2 Sep 2024 15:07:04 +0200 (CEST)
Message-ID: <23dcd8ab-592f-4e74-b7a7-99df3ffb9a3a@csgroup.eu>
Date: Mon, 2 Sep 2024 15:07:04 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] powerpc/vdso: Wire up getrandom() vDSO
 implementation on PPC32
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 Xi Ruoyao <xry111@xry111.site>
References: <cover.1725278148.git.christophe.leroy@csgroup.eu>
 <ec4d2919836a9f3a7791c2540ee79067396d701b.1725278148.git.christophe.leroy@csgroup.eu>
 <ZtWw6Wuudqj4IYWL@zx2c4.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ZtWw6Wuudqj4IYWL@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 02/09/2024 à 14:34, Jason A. Donenfeld a écrit :
> On Mon, Sep 02, 2024 at 02:04:41PM +0200, Christophe Leroy wrote:
>> This first patch adds support for PPC32. As selftests cannot easily
>> be generated only for PPC32, and because the following patch brings
>> support for PPC64 anyway, this patch opts out all code in
>> __arch_chacha20_blocks_nostack() so that vdso_test_chacha will not
>> fail to compile and will not crash on PPC64/PPC64LE, allthough the
>> selftest itself will fail. This patch also adds a dummy
>> __kernel_getrandom() function that returns ENOSYS on PPC64 so that
>> vdso_test_getrandom returns KSFT_SKIP instead of KSFT_FAIL.
> 
> Why not just wire up the selftests in the next patch like you did for
> v3? This seems like extra stuff for no huge reason?

In v3 selftests were already wired up in v3, and there was the following 
build failure:

$ make  ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-
   CC       vdso_test_gettimeofday
   CC       vdso_test_getcpu
   CC       vdso_test_abi
   CC       vdso_test_clock_getres
   CC       vdso_test_correctness
   CC       vdso_test_getrandom
   CC       vdso_test_chacha
/home/chleroy/linux-powerpc/tools/testing/selftests/../../../tools/arch/powerpc/vdso/vgetrandom-chacha.S: 
Assembler messages:
/home/chleroy/linux-powerpc/tools/testing/selftests/../../../tools/arch/powerpc/vdso/vgetrandom-chacha.S:84: 
Error: `stmw' invalid when little-endian
/home/chleroy/linux-powerpc/tools/testing/selftests/../../../tools/arch/powerpc/vdso/vgetrandom-chacha.S:198: 
Error: `lmw' invalid when little-endian
make: *** [../lib.mk:222: 
/home/chleroy/linux-powerpc/tools/testing/selftests/vDSO/vdso_test_chacha] 
Error 1

So I did this change to get a clean PPC32 implementation before going 
into PPC64. I thought it was easier to go in two steps for reviews, 
bisectability, etc .... for just a very little extra stuff.

> 
>>   arch/powerpc/Kconfig                         |   1 +
>>   arch/powerpc/include/asm/vdso/getrandom.h    |  54 +++++
>>   arch/powerpc/include/asm/vdso/vsyscall.h     |   6 +
>>   arch/powerpc/include/asm/vdso_datapage.h     |   2 +
>>   arch/powerpc/kernel/asm-offsets.c            |   1 +
>>   arch/powerpc/kernel/vdso/Makefile            |  13 +-
>>   arch/powerpc/kernel/vdso/getrandom.S         |  58 ++++++
>>   arch/powerpc/kernel/vdso/vdso32.lds.S        |   1 +
>>   arch/powerpc/kernel/vdso/vdso64.lds.S        |   1 +
>>   arch/powerpc/kernel/vdso/vgetrandom-chacha.S | 207 +++++++++++++++++++
>>   arch/powerpc/kernel/vdso/vgetrandom.c        |  16 ++
>>   tools/testing/selftests/vDSO/Makefile        |   2 +-
>>   12 files changed, 359 insertions(+), 3 deletions(-)
>>   create mode 100644 arch/powerpc/include/asm/vdso/getrandom.h
>>   create mode 100644 arch/powerpc/kernel/vdso/getrandom.S
>>   create mode 100644 arch/powerpc/kernel/vdso/vgetrandom-chacha.S
>>   create mode 100644 arch/powerpc/kernel/vdso/vgetrandom.c
> 
> I think you might have forgotten to add the symlink in this commit (or
> the next one, per my comment above, if you agree with it).

???? That's odd. All CI tests on github went ok !!! Looks like the CI 
tests for selftests are broken. Argh ! And of course on my computer the 
link was there so I didn't notice.

> 
>> +/*
>> + * Very basic 32 bits implementation of ChaCha20. Produces a given positive number
>> + * of blocks of output with a nonce of 0, taking an input key and 8-byte
>> + * counter. Importantly does not spill to the stack. Its arguments are:
>> + *
>> + *	r3: output bytes
>> + *	r4: 32-byte key input
>> + *	r5: 8-byte counter input/output (saved on stack)
>> + *	r6: number of 64-byte blocks to write to output
>> + *
>> + *	r0: counter of blocks (initialised with r6)
>> + *	r4: Value '4' after key has been read.
>> + *	r5-r12: key
>> + *	r14-r15: counter
>> + *	r16-r31: state
>> + */
>> +SYM_FUNC_START(__arch_chacha20_blocks_nostack)
>> +#ifdef __powerpc64__
>> +	blr
>> +#else
>> +	stwu	r1, -96(r1)
>> +	stw	r5, 20(r1)
>> +	stmw	r14, 24(r1)
>> +
>> +	lwz	r14, 0(r5)
>> +	lwz	r15, 4(r5)
>> +	mr	r0, r6
>> +	subi	r3, r3, 4
>> +
>> +	lwz	r5, 0(r4)
>> +	lwz	r6, 4(r4)
>> +	lwz	r7, 8(r4)
>> +	lwz	r8, 12(r4)
>> +	lwz	r9, 16(r4)
>> +	lwz	r10, 20(r4)
>> +	lwz	r11, 24(r4)
>> +	lwz	r12, 28(r4)
> 
> If you don't want to do this, don't worry about it, but while I'm
> commenting on things, I think it's worth noting that x86, loongarch, and
> arm64 implementations all use the preprocessor or macros to give names
> to these registers -- state1,2,3,...copy1,2,3 and so forth. Might be
> worth doing the same if you think there's an easy and obvious way of
> doing it. If not -- or if that kind of work abhors you -- don't worry
> about it, as I'm confident enough that this code works fine. But it
> might be "nice to have". Up to you.

I'll have a look.

> 
>> +
>> +	li	r4, 4
>> +.Lblock:
>> +	li	r31, 10
>> +
> 
> Maybe a comment here, "expand 32-byte k" or similar.

ok

> 
>> +	lis	r16, 0x6170
>> +	lis	r17, 0x3320
>> +	lis	r18, 0x7962
>> +	lis	r19, 0x6b20
>> +	addi	r16, r16, 0x7865
>> +	addi	r17, r17, 0x646e
>> +	addi	r18, r18, 0x2d32
>> +	addi	r19, r19, 0x6574
>> +
>> +	mtctr	r31
>> +
>> +
>> +	subic.	r0, r0, 1	/* subi. can't use r0 as source */
> 
> Never seen the period suffix. Just looked this up. Neat.

Not sure what your comment is. Are you talking about the dot suffix 
after subic ?

That dot means I want CR register to be updated by the instruction. It 
is equivalent to doing a comparision of the result with 0. It is used by 
the bne (branch if not equal) a few lines later.

