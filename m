Return-Path: <linuxppc-dev+bounces-830-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C24A0966725
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 18:43:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwP8h34wPz30Gh;
	Sat, 31 Aug 2024 02:43:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725036180;
	cv=none; b=DjYKJTWYfEjc2zjQz+mHypsGMMxRyLsH8st46y0sl5qKsmSvzx1fYOjPpAH9WUDu5Yz9asd+u2VvvgNIypacFuWJAG96YIqaYeloWODY8GP4M3ci4T9+OaGfHg9KvFFRtIFWCJTTqQ7DVqk0FNjUATxQ1nzq0Yy8M6gMhsLkdE72wTYQ7oEHCZUwkf7iyEOHtJZZYWiZ6kZOVyqnB6rYHT8p5l77EZlhpk2pNalq6YEdEYWfCht/Wz9OviZEfrvN92iH+M48H0gQmqcMdDLYBApQm3oFYm0fSxoX5FiBSabtDOGVrJsBTfXA5dBQ/bZm23zoglVqPXVHVrzx8L8YQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725036180; c=relaxed/relaxed;
	bh=DUek8Uem+47R1tW+fCnWb29ggJEbB3q9+dDSyzytSTU=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=cfEJjM/mo1YYqsXWedll8ETZ5fBCaw8+K5rYRIcePkX155InWi+GjAWyVD552N+ia5m9q3/2E1NvxJE/S0081nXCpleWdyTpqkxHQHUbiMXbJFvKcNgkBBRZFqQtvHd1T/PeVzZ0kMBWP0DyWh5zqSbimLJ5hEi4Ok78JMQ+jHGrRlGM7IhegpFjHlYj/gFl23I/ikYsufwRi5qbT0oisb6vPm2//IN1MA3LHDI24T5PLDrKwbcwqyhVwnPwAXrAgDTWHOVTklYJ5hzQNn5Bh059OsnaPBWN6fnMvBII83+a3SAlEFF4sxjWXqyXPl7zx4wmDhITxV7Slv13cWkR7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwP8h0mYwz30FR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2024 02:42:59 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WwP8c465gz9sS8;
	Fri, 30 Aug 2024 18:42:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6brwcfcnvqln; Fri, 30 Aug 2024 18:42:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WwP8c3CYvz9sS7;
	Fri, 30 Aug 2024 18:42:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 59C838B794;
	Fri, 30 Aug 2024 18:42:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id spbTDoYI002a; Fri, 30 Aug 2024 18:42:56 +0200 (CEST)
Received: from [192.168.234.133] (unknown [192.168.234.133])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 74A238B764;
	Fri, 30 Aug 2024 18:42:55 +0200 (CEST)
Message-ID: <84682299-8cbe-4b66-9c26-17786e73af55@csgroup.eu>
Date: Fri, 30 Aug 2024 18:42:55 +0200
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
Subject: Re: [PATCH v3 4/5] powerpc/vdso: Wire up getrandom() vDSO
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
References: <cover.1725031952.git.christophe.leroy@csgroup.eu>
 <e7e4c6d36cf98229850c333f113bcea909564501.1725031952.git.christophe.leroy@csgroup.eu>
 <ZtHv9R8b7qwWKR2b@zx2c4.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ZtHv9R8b7qwWKR2b@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 30/08/2024 à 18:14, Jason A. Donenfeld a écrit :
> On Fri, Aug 30, 2024 at 05:57:08PM +0200, Christophe Leroy wrote:
>> + *	r5: 8-byte counter input/output (saved on stack)
>> + *
>> + *	r14-r15: counter
>> + */
>> +SYM_FUNC_START(__arch_chacha20_blocks_nostack)
>> +	stwu	r1, -96(r1)
>> +	stw	r5, 20(r1)
>> +	stmw	r14, 24(r1)
>> +	li	r31, 4
>> +	LWZX_LE	r14, 0, r5
>> +	LWZX_LE	r15, r31, r5
> 
> Why swap endian on the counter?

Unlike the keys, the counter is passed to the function as an u8*, not as 
a u64*, so I thought it was raw data in little endian order, same as 
when using Sodium. Is it wrong ?

Christophe

