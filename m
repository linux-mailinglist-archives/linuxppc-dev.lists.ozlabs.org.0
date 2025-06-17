Return-Path: <linuxppc-dev+bounces-9412-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 342C8ADC60E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jun 2025 11:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bM1Yw6GWVz30P3;
	Tue, 17 Jun 2025 19:20:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750152036;
	cv=none; b=T5fUohHDRF1WZRa0UiOolpWNw9zIidfMoVx+S7i2/esBHF7a1dqhBkwZMs1jXFVhDWVGW916ujKm7GgtnM0sS+I8QxOEG5TBSmCeSYwXa2NMpmK/61Pi9qqVJxcaS4BOW3yZifNN6icVavA0kRACzwFyvZnh7dTcau1ouqTR8SXT0Nrqcn5MLnyoWZ+l+LyIhTvPNrjQuY7eMCtecw6diem8AaFN5HDp9If9u5rbTzSx9pc1wcJDvORX3c/QGIaQzfT0gGd8U4h3q/26BzRsIG8TX7XgZX+jhLLcnGWujm0J8aIbceSWzyE0ji7I4rFV0zteokt2WyTg1EtNQgvlUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750152036; c=relaxed/relaxed;
	bh=kJujKAYFrM0VAH8nJExoYBPPKDR0jbVXSS6xsuz0Yl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3ag/vxJNooF3lkG5pUCT6vkX8V+F9MERhu3Wn0YXBQuS8pHV0e7JSFZ99N+B5DgFnCOeruiA3+4nIqWl2LTO6U+BsOtNP4nn68196KEqGQ4ITYb7OfwSiYrFqsxcfkGVxDrTcRDA2tS0u1xhpfwTSotDqlEMavKEPnEutPahsC9jSOtdv3xCJcx14afBZoysCIaTLWnjSZG5ieGHnM52W3oMtC6C4dLqNUNDh/rBRZtVoUgurOjHGJYvQfzL3dgFF8uXRej9WPGBsZVHItIgPPIMnNO1Jci8zaQAvutRURHZ0+abuPqT05XlOEdupD52EQSgGuyhjcTk5GVX3Xiqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bM1Yw1cfwz2yMD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jun 2025 19:20:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bM1Pg14fhz9t0K;
	Tue, 17 Jun 2025 11:13:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ezM8RTf2JjnU; Tue, 17 Jun 2025 11:13:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bM1Pg09FTz9syQ;
	Tue, 17 Jun 2025 11:13:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 007768B77E;
	Tue, 17 Jun 2025 11:13:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Vgg_-T-pTeIY; Tue, 17 Jun 2025 11:13:26 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9CA048B776;
	Tue, 17 Jun 2025 11:13:26 +0200 (CEST)
Message-ID: <cc895e8c-5dd5-4207-bb35-58e6b923b7bc@csgroup.eu>
Date: Tue, 17 Jun 2025 11:13:26 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] vdso: Switch get/put unaligned from packed struct
 to memcpy
To: Eric Biggers <ebiggers@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Yuzhuo Jing <yuzhuo@google.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Arnaldo Carvalho de Melo <acme@redhat.com>, Al Viro
 <viro@zeniv.linux.org.uk>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20250617005800.1410112-1-irogers@google.com>
 <20250617005800.1410112-2-irogers@google.com>
 <c57de5bf-d55c-48c5-9dfa-e2fb844dafe9@csgroup.eu> <20250617063236.GI8289@sol>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250617063236.GI8289@sol>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

+linuxppc list

Le 17/06/2025 à 08:32, Eric Biggers a écrit :
> On Tue, Jun 17, 2025 at 07:22:57AM +0200, Christophe Leroy wrote:
>>
>>
>> Le 17/06/2025 à 02:57, Ian Rogers a écrit :
>>> Type punning is necessary for get/put unaligned but the use of a
>>> packed struct violates strict aliasing rules, requiring
>>> -fno-strict-aliasing to be passed to the C compiler. Switch to using
>>> memcpy so that -fno-strict-aliasing isn't necessary.
>>
>> VDSO build fails with this patch:
>>
>>    VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
>> arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not
>> supported
>> make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79:
>> arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
>>
>> Behind the relocation issue, calling memcpy() for a single 4-bytes word
>> kills performance.
> 
> memcpy() does normally do the right thing for unaligned accesses of 1, 2, 4, or
> 8-byte values.  The snag here seems to be that the VDSO is built with
> -fno-builtin (and -ffreestanding which implies -fno-builtin).  That causes the
> compiler to no longer optimize out the calls to memcpy().  If __builtin_memcpy()
> is used instead of memcpy(), it does work and generates the same code as before.

Yes right, changing memcpy() to __builtin_memcpy() seems to work, the 
exact same code is generated.

Christophe

