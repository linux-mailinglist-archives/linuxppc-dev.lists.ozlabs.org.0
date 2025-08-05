Return-Path: <linuxppc-dev+bounces-10651-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21370B1B63C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 16:20:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxFvY1J4lz2ypV;
	Wed,  6 Aug 2025 00:20:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754403641;
	cv=none; b=QfxhAs1MdCvhQxk4BxEdITcVFGIDPmFhn047w0PAM9RTIOtMui6ZuyVZwLWRB9OD/Dbvudajdvy5wKk/7OcoyTXEJzxNZEimbITgeSDOAaNG7ktoMw52ApmbHT29NaC3Cx4CUOnv3E4F86PEGyVt4LTc0QAm6vjny7rBRdZr3DJvtqTXazSwwbSC1czy4zyt55XF2hInH0JM/PC0jHpFtLHbEuS+TKVp1WI8ARhCgDg1QQdUf8cN0Gp0OYuSv5Mc6uuYVFlAifwVOnFo0T23TuShyr+YTu5KsMS35RXwEFdhqvlaC4k7DfnENxui5bKlJ/ldduW8dTjmYsre+50oLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754403641; c=relaxed/relaxed;
	bh=+LOABVwRcHxLpkRHFDD4VD+p62IElOoTs8/K7p2jH7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eeThXIiQovF+98A6gfvf71wNqGXI0gGMf7s5cXl9hQ+a9aHR51KX5Hb2lEgJRKfUh0TilqfEKiYOWTmr9I/1mZxBoeuyRD0RVuZHPhln007fV+WYMZYNW6AChvrBBhmPeQf2xzLn6A9JjmhKlr1noPepmwxcPHMNERfbzwT8rUUk3hs9D7YhVzOI7cmc47St3TCwQPK6As1sy0qWBY46UBDvRgbWDlUAXhQZ1V431RjVoDBgc1VpprMp508XiZO/tHT3K1lnU0UnRpdiQyG42rAfu7AEGb5Wo/kbvmIrY+NgSnFp+KuZPQ4xXfBc3NH/V3FgQk8ErXiWL9UoT8D73g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxFvX18D5z2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 00:20:39 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bx3PH42tYz9sRp;
	Tue,  5 Aug 2025 08:27:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MOt6ej6e3T4G; Tue,  5 Aug 2025 08:27:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bx3PH34F3z9sHR;
	Tue,  5 Aug 2025 08:27:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 62F0C8B765;
	Tue,  5 Aug 2025 08:27:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id yZAG-jS96Z85; Tue,  5 Aug 2025 08:27:15 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F07C08B763;
	Tue,  5 Aug 2025 08:27:14 +0200 (CEST)
Message-ID: <c4191597-341d-4fd7-bc3d-13daf7666c41@csgroup.eu>
Date: Tue, 5 Aug 2025 08:27:14 +0200
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
 <20250804225901.GC54248@google.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250804225901.GC54248@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.3 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 05/08/2025 à 00:59, Eric Biggers a écrit :
> On Mon, Aug 04, 2025 at 09:02:27PM +0200, Christophe Leroy wrote:
>>
>>
>> Le 04/08/2025 à 20:09, Eric Biggers a écrit :
>>> On Mon, Aug 04, 2025 at 07:42:15PM +0200, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 03/08/2025 à 22:44, Eric Biggers a écrit :
>>>>> MD5 is insecure, is no longer commonly used, and has never been
>>>>> optimized for the most common architectures in the kernel.  Only mips,
>>>>> powerpc, and sparc have optimized MD5 code in the kernel.  Of these,
>>>>> only the powerpc one is actually testable in QEMU.  The mips one works
>>>>> only on Cavium Octeon SoCs.
>>>>>
>>>>> Taken together, it's clear that it's time to retire these additional MD5
>>>>> implementations, and focus maintenance on the MD5 generic C code.
>>>>
>>>> Sorry, for me it is not that clear. Even if MD5 is depracated we still have
>>>> several applications that use MD5 for various reasons on our boards.
>>>>
>>>> I ran the test on kernel v6.16 with following file:
>>>>
>>>> # ls -l avion.au
>>>> -rw-------    1 root     root      12130159 Jan  1  1970 avion.au
>>>>
>>>> With CONFIG_CRYPTO_MD5_PPC:
>>>>
>>>> # time md5sum avion.au
>>>> 6513851d6109d42477b20cd56bf57f28  avion.au
>>>> real    0m 1.02s
>>>> user    0m 0.01s
>>>> sys     0m 1.01s
>>>>
>>>> Without CONFIG_CRYPTO_MD5_PPC:
>>>>
>>>> # time md5sum avion.au
>>>> 6513851d6109d42477b20cd56bf57f28  avion.au
>>>> real    0m 1.35s
>>>> user    0m 0.01s
>>>> sys     0m 1.34s
>>>>
>>>> I think the difference is big enough to consider keeping optimised MD5 code.
>>>
>>> But md5sum doesn't use the kernel's MD5 code.  So it's implausible that
>>> it has any effect on md5sum.  The difference you saw must be due to an
>>> unrelated reason like I/O caching, CPU frequency, etc.  Try running your
>>> test multiple times to eliminate other sources of variation.
>>
>> md5sum uses the kernel's MD5 code:
> 
> What?  That's crazy.  Userspace MD5 code would be faster and more
> reliable.  No need to make syscalls, transfer data to and from the
> kernel, have an external dependency, etc.  Is this the coreutils md5sum?
> We need to get this reported and fixed.


Content of files is already buffered inside the kernel. likcapi doesn't 
tranfer data, it uses splice().

As far as I know, coreutil is not able to use the TALITOS Security 
engine we have on the mpc885 and mpc8321 microcontroleurs. We primarily 
use libkcapi for that.

In order to keep things consistant, we use the same userspace on boards 
which don't have a security engine, ie the mpc866, we rely on the kernel 
providing an optimised software implementation fallback.

Christophe

