Return-Path: <linuxppc-dev+bounces-10642-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF15B1B074
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 10:50:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bx6Zl61Vkz3bh6;
	Tue,  5 Aug 2025 18:50:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754383839;
	cv=none; b=I/XFHHI8c7QBZHFNTG6g6LednF6vIdLp/LmFc9qgazXpZFmu4iXZ9JUZHQaQ4qF2p+zr9o2bp7ZI6lRS2YJE4ndJPl3gmY6GLAO/VxAyMC1VrsZRb3aK0aBZqoCD7Rnsf+YEbQIYh2wm+jjdQcDm1uaGxYYN90H+wv0lVA19g1cHanxghxb0otFSWIM0eHdJN+kLYnnnsPBEQXQxU73a8V7H9LFNKZWEfOqz5jcuRNl42brr8rgXPYyWXZaaia3gFRxTdEwaw+BK/oFJza5KN0YPzNfQktZMMyTS2KjuZ39Qc653bJMHnUaHmowxNtehut97+xzGvqHtnXj0X7QdcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754383839; c=relaxed/relaxed;
	bh=kMDhKd5Fl+aMetzn4GN41MxMPR5HA5TFjb1LA112Qzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ciE5ULBHZE7DdrVD1nmqJKqRCSmsS0kLnw3vJLpVy7PMX/fuSm0YgUopd06tKxBz7+WdzYTcdM6XUArnm5Q0UZAZ6zr7pGVYPvjLj1LRdY9gZPepj8mSLOCjkq7dcyY3ohS2PO91NS207f0xuZbS/eO36B34LQpkEqOUAUIRjT4/BFnTG4S2b60KJdOzB5/htGAUGPalRfSbXlQ/8FXjfDe0qisHaoRd9pMoAk08lWxeDP+8AYmZaHTNGhjZlno/DCct0KVOCtA36Kh1XfikjU61j6ZSI6JCo7RPves9vG0ouEn5s4oxggZ/4tKhgzgRHYww2fQT/LirOdsOIx/grw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bx6Zj2VwCz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 18:50:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bx3Gj2XBTz9sFT;
	Tue,  5 Aug 2025 08:21:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WDORRCn48EGH; Tue,  5 Aug 2025 08:21:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bx3Gj1jK7z9sD3;
	Tue,  5 Aug 2025 08:21:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 34A6B8B765;
	Tue,  5 Aug 2025 08:21:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id luzBz1uWND4k; Tue,  5 Aug 2025 08:21:33 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C1F0A8B763;
	Tue,  5 Aug 2025 08:21:32 +0200 (CEST)
Message-ID: <f0d771d5-ed70-444c-957a-ad4c16f6c115@csgroup.eu>
Date: Tue, 5 Aug 2025 08:21:32 +0200
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
Subject: Re: [PATCH 3/7] crypto: powerpc/md5 - Remove PowerPC optimized MD5
 code
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <593b6997-9da4-439c-ba82-84e8bb2ed980@csgroup.eu>
 <20250804180923.GA54248@google.com>
 <187412bd-3ae0-4fe8-b526-f96af6bea6dc@csgroup.eu>
 <20250804225901.GC54248@google.com> <20250804230926.GD54248@google.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250804230926.GD54248@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.3 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 05/08/2025 à 01:09, Eric Biggers a écrit :
> On Mon, Aug 04, 2025 at 10:59:01PM +0000, Eric Biggers wrote:
>> On Mon, Aug 04, 2025 at 09:02:27PM +0200, Christophe Leroy wrote:
>>>
>>>
>>> Le 04/08/2025 à 20:09, Eric Biggers a écrit :
>>>> On Mon, Aug 04, 2025 at 07:42:15PM +0200, Christophe Leroy wrote:
>>>>>
>>>>>
>>>>> Le 03/08/2025 à 22:44, Eric Biggers a écrit :
>>>>>> MD5 is insecure, is no longer commonly used, and has never been
>>>>>> optimized for the most common architectures in the kernel.  Only mips,
>>>>>> powerpc, and sparc have optimized MD5 code in the kernel.  Of these,
>>>>>> only the powerpc one is actually testable in QEMU.  The mips one works
>>>>>> only on Cavium Octeon SoCs.
>>>>>>
>>>>>> Taken together, it's clear that it's time to retire these additional MD5
>>>>>> implementations, and focus maintenance on the MD5 generic C code.
>>>>>
>>>>> Sorry, for me it is not that clear. Even if MD5 is depracated we still have
>>>>> several applications that use MD5 for various reasons on our boards.
>>>>>
>>>>> I ran the test on kernel v6.16 with following file:
>>>>>
>>>>> # ls -l avion.au
>>>>> -rw-------    1 root     root      12130159 Jan  1  1970 avion.au
>>>>>
>>>>> With CONFIG_CRYPTO_MD5_PPC:
>>>>>
>>>>> # time md5sum avion.au
>>>>> 6513851d6109d42477b20cd56bf57f28  avion.au
>>>>> real    0m 1.02s
>>>>> user    0m 0.01s
>>>>> sys     0m 1.01s
>>>>>
>>>>> Without CONFIG_CRYPTO_MD5_PPC:
>>>>>
>>>>> # time md5sum avion.au
>>>>> 6513851d6109d42477b20cd56bf57f28  avion.au
>>>>> real    0m 1.35s
>>>>> user    0m 0.01s
>>>>> sys     0m 1.34s
>>>>>
>>>>> I think the difference is big enough to consider keeping optimised MD5 code.
>>>>
>>>> But md5sum doesn't use the kernel's MD5 code.  So it's implausible that
>>>> it has any effect on md5sum.  The difference you saw must be due to an
>>>> unrelated reason like I/O caching, CPU frequency, etc.  Try running your
>>>> test multiple times to eliminate other sources of variation.
>>>
>>> md5sum uses the kernel's MD5 code:
>>>
>>> libkcapi.so.1 => /usr/lib/libkcapi.so.1 (0x6ffa0000)    <==
> 
> Oh, I think you used the obscure implementation of md5sum from
> libkcapi-tools, instead of the normal md5sum.  Why?  Did you check how
> the normal md5sum performs too?  Just doing the calculation in userspace
> is much more efficient.

Calculation in userspace is less efficient on my board:

# time md5sum avion.au
6513851d6109d42477b20cd56bf57f28  avion.au
real    0m 1.87s
user    0m 1.51s
sys     0m 0.35s

Christophe

