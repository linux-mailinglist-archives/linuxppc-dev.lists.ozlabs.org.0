Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DA813C683
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 15:49:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yVZw645vzDqRP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 01:49:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=v0ZdT0Jh; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yVXj06HszDqHP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 01:47:15 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47yVXY1sjBz9tylP;
 Wed, 15 Jan 2020 15:47:09 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=v0ZdT0Jh; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 1yEnk5s5C33f; Wed, 15 Jan 2020 15:47:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47yVXY0mmhz9tylH;
 Wed, 15 Jan 2020 15:47:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579099629; bh=GvjzXQnIL+hCqDUkI7JAeG4AEubHEzQxfXAYFm1+LnE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=v0ZdT0JhTBUed9+RMH8/zgRWmVMtklpKF4OyD4fUhEXwH0bgTT7veCONXVm+nrzp0
 OcRyq7vswits+6oi5xj+KxaIPN6CqvBJdySyxX2DpkqRfwvxMwmINAXHKUrtY9rDoF
 Ov5rL9rqArrPIuAwM0/8yTdbKGn9JuCm+oKttX5s=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6E61F8B774;
 Wed, 15 Jan 2020 15:47:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BnOhqHOrMIva; Wed, 15 Jan 2020 15:47:10 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 15D4B8B805;
 Wed, 15 Jan 2020 15:47:10 +0100 (CET)
Subject: Re: [PATCH 1/2] kasan: stop tests being eliminated as dead code with
 FORTIFY_SOURCE
To: Dmitry Vyukov <dvyukov@google.com>, Daniel Axtens <dja@axtens.net>
References: <20200115063710.15796-1-dja@axtens.net>
 <20200115063710.15796-2-dja@axtens.net>
 <CACT4Y+bAuaeHOcTHqp-=ckOb58fRajpGYk4khNzpS7_OyBDQYQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <917cc571-a25c-3d3e-547c-c537149834d6@c-s.fr>
Date: Wed, 15 Jan 2020 15:47:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CACT4Y+bAuaeHOcTHqp-=ckOb58fRajpGYk4khNzpS7_OyBDQYQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, linux-xtensa@linux-xtensa.org,
 the arch/x86 maintainers <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>,
 Daniel Micay <danielmicay@gmail.com>, Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/01/2020 à 15:43, Dmitry Vyukov a écrit :
> On Wed, Jan 15, 2020 at 7:37 AM Daniel Axtens <dja@axtens.net> wrote:
>>
>> 3 KASAN self-tests fail on a kernel with both KASAN and FORTIFY_SOURCE:
>> memchr, memcmp and strlen.
>>
>> When FORTIFY_SOURCE is on, a number of functions are replaced with
>> fortified versions, which attempt to check the sizes of the operands.
>> However, these functions often directly invoke __builtin_foo() once they
>> have performed the fortify check. The compiler can detect that the results
>> of these functions are not used, and knows that they have no other side
>> effects, and so can eliminate them as dead code.
>>
>> Why are only memchr, memcmp and strlen affected?
>> ================================================
>>
>> Of string and string-like functions, kasan_test tests:
>>
>>   * strchr  ->  not affected, no fortified version
>>   * strrchr ->  likewise
>>   * strcmp  ->  likewise
>>   * strncmp ->  likewise
>>
>>   * strnlen ->  not affected, the fortify source implementation calls the
>>                 underlying strnlen implementation which is instrumented, not
>>                 a builtin
>>
>>   * strlen  ->  affected, the fortify souce implementation calls a __builtin
>>                 version which the compiler can determine is dead.
>>
>>   * memchr  ->  likewise
>>   * memcmp  ->  likewise
>>
>>   * memset ->   not affected, the compiler knows that memset writes to its
>>                 first argument and therefore is not dead.
>>
>> Why does this not affect the functions normally?
>> ================================================
>>
>> In string.h, these functions are not marked as __pure, so the compiler
>> cannot know that they do not have side effects. If relevant functions are
>> marked as __pure in string.h, we see the following warnings and the
>> functions are elided:
>>
>> lib/test_kasan.c: In function ‘kasan_memchr’:
>> lib/test_kasan.c:606:2: warning: statement with no effect [-Wunused-value]
>>    memchr(ptr, '1', size + 1);
>>    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/test_kasan.c: In function ‘kasan_memcmp’:
>> lib/test_kasan.c:622:2: warning: statement with no effect [-Wunused-value]
>>    memcmp(ptr, arr, size+1);
>>    ^~~~~~~~~~~~~~~~~~~~~~~~
>> lib/test_kasan.c: In function ‘kasan_strings’:
>> lib/test_kasan.c:645:2: warning: statement with no effect [-Wunused-value]
>>    strchr(ptr, '1');
>>    ^~~~~~~~~~~~~~~~
>> ...
>>
>> This annotation would make sense to add and could be added at any point, so
>> the behaviour of test_kasan.c should change.
>>
>> The fix
>> =======
>>
>> Make all the functions that are pure write their results to a global,
>> which makes them live. The strlen and memchr tests now pass.
>>
>> The memcmp test still fails to trigger, which is addressed in the next
>> patch.
>>
>> Cc: Daniel Micay <danielmicay@gmail.com>
>> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
>> Cc: Alexander Potapenko <glider@google.com>
>> Cc: Dmitry Vyukov <dvyukov@google.com>
>> Fixes: 0c96350a2d2f ("lib/test_kasan.c: add tests for several string/memory API functions")
>> Signed-off-by: Daniel Axtens <dja@axtens.net>
>> ---
>>   lib/test_kasan.c | 30 +++++++++++++++++++-----------
>>   1 file changed, 19 insertions(+), 11 deletions(-)
>>
>> diff --git a/lib/test_kasan.c b/lib/test_kasan.c
>> index 328d33beae36..58a8cef0d7a2 100644
>> --- a/lib/test_kasan.c
>> +++ b/lib/test_kasan.c
>> @@ -23,6 +23,14 @@
>>
>>   #include <asm/page.h>
>>
>> +/*
>> + * We assign some test results to these globals to make sure the tests
>> + * are not eliminated as dead code.
>> + */
>> +
>> +int int_result;
>> +void *ptr_result;
> 
> These are globals, but are not static and don't have kasan_ prefix.
> But I guess this does not matter for modules?
> Otherwise:
> 
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> 

I think if you make them static, GCC will see they aren't used and will 
eliminate everything still ?

Christophe
