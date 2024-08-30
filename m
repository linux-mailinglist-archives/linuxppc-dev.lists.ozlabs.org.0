Return-Path: <linuxppc-dev+bounces-831-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B53B79667EC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 19:23:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwQ3K6ctTz30Dw;
	Sat, 31 Aug 2024 03:23:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725038605;
	cv=none; b=W4OeqSUZ45nspPYKujJwaEpqguXUBwQ+taaLdWyWH0xRlWOawYp069AbnJOZvRI1nE+32fCTNcGTXmXdlBq6LUkqiciXzGCo/pw0yIraGvq8pXDb7ykTV62QHgkR3o84WqXW0iNDlM/n65+5E5+NSVoGdhP7k9jamblDrX8Svv6YcRg/ZjxEkkGbYZzf4TarAN+JHZlma7VKHgC7IFUEvTvLFFXfJy9KUCsduJ2YuX2zBcELuhH55oxHAQXQSgpKSb/EhBkYCwCFI8nOTL8i7LpW3EHhW5AghIMyuGJ3LjtGAfTrytYgDAW+RjCEz6e3+vlYbMuzRlUAzNeoZsYPDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725038605; c=relaxed/relaxed;
	bh=MqG8mWruplulneERL/vN6oKiLL3eBhJAny93MEBOh4c=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=R+5eo8cMSfkFYuMwwbjLcHGcKIlWuXk7qTmJN2bE15jguSdHZkYd9HYIZMP8rZ99UJ4O7B3xsccX+2+YfTt5MU82WtufPzybfmrwS3aSGg7VmJOJNEjAOpx7z8+3duH1HUpln00evyx2ztt8IB1iYNtqOljO2OSoxsPSydUSZot87rGoscxWbhOPobXONVTcgT4QsmD8nOtGt8Z9S/t8iNu/qK0GXtM5PpNfMoInvxViyHGv7AQ9Ux+CymTF1GH7BXkmETLwgKDt4/SV9LvH4Mwa4/NSjJq0ISFFpK1k96v7Nq9Ee4zFwCpWJu/juCJiEW64/NAeNtut+Pk+5nZEkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwQ3K4BFNz30Ds
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2024 03:23:23 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WwQ3D1gMBz9sS8;
	Fri, 30 Aug 2024 19:23:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g-0ANya1nR0i; Fri, 30 Aug 2024 19:23:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WwQ3D0Xpmz9sS7;
	Fri, 30 Aug 2024 19:23:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F13B68B794;
	Fri, 30 Aug 2024 19:23:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 7ABmumGq8hAw; Fri, 30 Aug 2024 19:23:19 +0200 (CEST)
Received: from [192.168.234.133] (unknown [192.168.234.133])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 125AE8B764;
	Fri, 30 Aug 2024 19:23:19 +0200 (CEST)
Message-ID: <b33384e2-088d-4116-81d5-ae895a761c19@csgroup.eu>
Date: Fri, 30 Aug 2024 19:23:18 +0200
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
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
 <84682299-8cbe-4b66-9c26-17786e73af55@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <84682299-8cbe-4b66-9c26-17786e73af55@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 30/08/2024 à 18:42, Christophe Leroy a écrit :
> 
> 
> Le 30/08/2024 à 18:14, Jason A. Donenfeld a écrit :
>> On Fri, Aug 30, 2024 at 05:57:08PM +0200, Christophe Leroy wrote:
>>> + *    r5: 8-byte counter input/output (saved on stack)
>>> + *
>>> + *    r14-r15: counter
>>> + */
>>> +SYM_FUNC_START(__arch_chacha20_blocks_nostack)
>>> +    stwu    r1, -96(r1)
>>> +    stw    r5, 20(r1)
>>> +    stmw    r14, 24(r1)
>>> +    li    r31, 4
>>> +    LWZX_LE    r14, 0, r5
>>> +    LWZX_LE    r15, r31, r5
>>
>> Why swap endian on the counter?
> 
> Unlike the keys, the counter is passed to the function as an u8*, not as 
> a u64*, so I thought it was raw data in little endian order, same as 
> when using Sodium. Is it wrong ?

Hum ..... I looked again and it seems it is already a u32 *. Looks like 
I mis-read the 8-byte comment. Or I did it right in the begining then I 
swapped it at the same time as I swapped the keys after my first test 
when the selftest was using Sodium. I can't remember. I'll fix it.

Christophe

