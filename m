Return-Path: <linuxppc-dev+bounces-875-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F18696888E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 15:12:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wy8Lr44PRz2xs1;
	Mon,  2 Sep 2024 23:12:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725282772;
	cv=none; b=Ybz8n64An8mVZEoBkH3qgZufB+o/wSwkwPav/hBMLvgfSG5DBCky/ZAK06CMa4y2CfJHl9AOiSZUQwrttG+PMTHFKTFDu9oj81D4KSI7xqJQcY/SO/edaYN4+RJ/8Cv7M1gKBGIskwMWRBcpSl+WAKL70NkeU7htpq9ocew7Dm5i8T2GoATsFbLFD9eTUgnn5ZnwdTdoS1MmHKBvMlxpX2MromL4BvPUSUa3Ac6GfJHQOZ0xhKUCsxrZ73oKIrjwn3bX/yqxhpdkroYdpOXh/ct3uL0Sp7oqWi5DDz1NwrhufAanag96ubm337ZtrnDnrElJAXC3TzjlXGYwqDIukw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725282772; c=relaxed/relaxed;
	bh=3dH5m8owdpYqyrBi6DYG1Fu4i3YljG8M/3k/nCuaU84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DOPFaK/WFRiUQb2kuxznuT31Y6rHyblbH8AQO7xQood4cVh42iCtJLgI161pdjKUWvzWszb0VQlnRsN7o8ro7sdbTSQJrG6LYm9kuUa/DfheuBhtyam8FepKtb3uZTBCZtlLIDMNF9IvrN7STeEcb8bSIlAe1waMIg/2ja5i1uwgjrhm4UgzRKWh6a2DRcyxxmNaiW33YR0JvUfmY3iZ0AfK1npE5LDagGllgtdxBALBVVzcjHkIKmBUXtfaRemnTeH84C+2HdpWOIsrZwR2UBZDnd9rL4uN87G6R61/+lN9zspu06vH22pfW1ydtti9JZMQglQunhgr7wPwswnatg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wy8Lr1k7Vz2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 23:12:51 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wy8Lm6QHHz9sSN;
	Mon,  2 Sep 2024 15:12:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bOAmrEYbu_oc; Mon,  2 Sep 2024 15:12:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wy8Lm5Z1Xz9sS7;
	Mon,  2 Sep 2024 15:12:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AD68B8B76C;
	Mon,  2 Sep 2024 15:12:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id bvD0TdiWVJyj; Mon,  2 Sep 2024 15:12:48 +0200 (CEST)
Received: from [192.168.234.167] (unknown [192.168.234.167])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B29AB8B763;
	Mon,  2 Sep 2024 15:12:47 +0200 (CEST)
Message-ID: <bdf1a515-b3d0-471d-89ee-989ae0d63202@csgroup.eu>
Date: Mon, 2 Sep 2024 15:12:47 +0200
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
Subject: Re: [PATCH v4 5/5] powerpc/vdso: Wire up getrandom() vDSO
 implementation on PPC64
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
 <27de70dcc356e56754a03a2887a97597f5e840a4.1725278148.git.christophe.leroy@csgroup.eu>
 <ZtWyeuCfzZ66fVsg@zx2c4.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ZtWyeuCfzZ66fVsg@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 02/09/2024 à 14:41, Jason A. Donenfeld a écrit :
> On Mon, Sep 02, 2024 at 02:04:42PM +0200, Christophe Leroy wrote:
>>   SYM_FUNC_START(__arch_chacha20_blocks_nostack)
>>   #ifdef __powerpc64__
>> -	blr
>> +	std	r5, -216(r1)
>> +
>> +	std	r14, -144(r1)
>> +	std	r15, -136(r1)
>> +	std	r16, -128(r1)
>> +	std	r17, -120(r1)
>> +	std	r18, -112(r1)
>> +	std	r19, -104(r1)
>> +	std	r20, -96(r1)
>> +	std	r21, -88(r1)
>> +	std	r22, -80(r1)
>> +	std	r23, -72(r1)
>> +	std	r24, -64(r1)
>> +	std	r25, -56(r1)
>> +	std	r26, -48(r1)
>> +	std	r27, -40(r1)
>> +	std	r28, -32(r1)
>> +	std	r29, -24(r1)
>> +	std	r30, -16(r1)
>> +	std	r31, -8(r1)
>>   #else
>>   	stwu	r1, -96(r1)
>>   	stw	r5, 20(r1)
>> +#ifdef __BIG_ENDIAN__
>>   	stmw	r14, 24(r1)
>> +#else
>> +	stw	r14, 24(r1)
>> +	stw	r15, 28(r1)
>> +	stw	r16, 32(r1)
>> +	stw	r17, 36(r1)
>> +	stw	r18, 40(r1)
>> +	stw	r19, 44(r1)
>> +	stw	r20, 48(r1)
>> +	stw	r21, 52(r1)
>> +	stw	r22, 56(r1)
>> +	stw	r23, 60(r1)
>> +	stw	r24, 64(r1)
>> +	stw	r25, 68(r1)
>> +	stw	r26, 72(r1)
>> +	stw	r27, 76(r1)
>> +	stw	r28, 80(r1)
>> +	stw	r29, 84(r1)
>> +	stw	r30, 88(r1)
>> +	stw	r31, 92(r1)
>> +#endif
>> +#endif
> 
> This confuses me. Why are you adding code to the !__powerpc64__ branch
> in this commit? (Also, why does stmw not work on LE?)

That's for the VDSO32 ie running 32 bits binaries on a 64 bits kernel.

"Programming Environments Manual for 32-Bit Implementations of the 
PowerPC™ Architecture" say: In some implementations operating with 
little-endian byte order, execution of an lmw or stmw instruction
causes the system alignment error handler to be invoked

And GCC doesn't like it either:

tools/arch/powerpc/vdso/vgetrandom-chacha.S:84: Error: `stmw' invalid 
when little-endian

