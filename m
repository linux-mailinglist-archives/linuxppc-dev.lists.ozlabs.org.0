Return-Path: <linuxppc-dev+bounces-10625-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAA3B1AB0C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 00:50:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwsGS3Nclz2y06;
	Tue,  5 Aug 2025 08:50:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754347840;
	cv=none; b=S0Jox1AxSJNKkJmVm8nVBG1l5D8waqvVoKtFuhLVy0rkebZ4ivmKsJ5Y+cs6hiXBVcYz6r4zbvs8D/CMtLdSgFt6mflgPaPSV1NF4ZuIWC/8JV+2AwTbkaE8foqybCmVn3/H+6m1IcbzoUaAme2u+1JjC4K/H7OtUYbA9BtDa/MU2ESpRV3pT7xBWM3EholJ7ygPAXJJXDAdu54SRHwv7/oRSTolqbdqbsa7ACrkwDngTOIKliZl2qmrcg0ENIwwgGfMNrOXvvbXZDhsmKDaKQOGPWAmLthkZZV2Jrn+zR5v6oig/N8XM8PoXKoM32iaE3ifVAEz7E7pWv3m54yDXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754347840; c=relaxed/relaxed;
	bh=Tt964GcbDZm1EIllb6PTgoX8tjiCQZMvcYN22tpyJ7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQDFD+eFQGVq5cT9bVi6J4sikuG6XmP20nIO6lyNBobWczNcKMcBaR/RVdPrE4fpqCCPwxux2oy/G20l82CqQ8+G3pSD8k2tXIcPSi14LjDg/yWdND1hisWUxv2KUqHm9PTgJmx4XnnQaxJ9UhrVtEftqkcGEgB4Dx48tyF2BMLTuD8EEHdwNKcepbvH51Dx+0iPzwGMtRsJLvSPEnMs1fbb22hCcacYRdxjj8RloAY8eC6D4oGMBiLjGGHL1ei3kmliRYy9CJU1zwdCSJ82EK643hj3Gj3QQfv0sZ+Hh3llDJxl702mb3HrEl5+MxiFAHlgczsBLHG1Vmcj/Ph3bQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwsGR2C00z2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 08:50:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bwmCH6vkyz9vF1;
	Mon,  4 Aug 2025 21:02:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzPhUKf9CYtV; Mon,  4 Aug 2025 21:02:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bwmCF5SFSz9vDl;
	Mon,  4 Aug 2025 21:02:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 695098B765;
	Mon,  4 Aug 2025 21:02:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id KC5YIf5SR_OU; Mon,  4 Aug 2025 21:02:28 +0200 (CEST)
Received: from [192.168.202.221] (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B770B8B763;
	Mon,  4 Aug 2025 21:02:27 +0200 (CEST)
Message-ID: <187412bd-3ae0-4fe8-b526-f96af6bea6dc@csgroup.eu>
Date: Mon, 4 Aug 2025 21:02:27 +0200
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250804180923.GA54248@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.3 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 04/08/2025 à 20:09, Eric Biggers a écrit :
> On Mon, Aug 04, 2025 at 07:42:15PM +0200, Christophe Leroy wrote:
>>
>>
>> Le 03/08/2025 à 22:44, Eric Biggers a écrit :
>>> MD5 is insecure, is no longer commonly used, and has never been
>>> optimized for the most common architectures in the kernel.  Only mips,
>>> powerpc, and sparc have optimized MD5 code in the kernel.  Of these,
>>> only the powerpc one is actually testable in QEMU.  The mips one works
>>> only on Cavium Octeon SoCs.
>>>
>>> Taken together, it's clear that it's time to retire these additional MD5
>>> implementations, and focus maintenance on the MD5 generic C code.
>>
>> Sorry, for me it is not that clear. Even if MD5 is depracated we still have
>> several applications that use MD5 for various reasons on our boards.
>>
>> I ran the test on kernel v6.16 with following file:
>>
>> # ls -l avion.au
>> -rw-------    1 root     root      12130159 Jan  1  1970 avion.au
>>
>> With CONFIG_CRYPTO_MD5_PPC:
>>
>> # time md5sum avion.au
>> 6513851d6109d42477b20cd56bf57f28  avion.au
>> real    0m 1.02s
>> user    0m 0.01s
>> sys     0m 1.01s
>>
>> Without CONFIG_CRYPTO_MD5_PPC:
>>
>> # time md5sum avion.au
>> 6513851d6109d42477b20cd56bf57f28  avion.au
>> real    0m 1.35s
>> user    0m 0.01s
>> sys     0m 1.34s
>>
>> I think the difference is big enough to consider keeping optimised MD5 code.
> 
> But md5sum doesn't use the kernel's MD5 code.  So it's implausible that
> it has any effect on md5sum.  The difference you saw must be due to an
> unrelated reason like I/O caching, CPU frequency, etc.  Try running your
> test multiple times to eliminate other sources of variation.

md5sum uses the kernel's MD5 code:

# ldd `which md5sum`
         linux-vdso32.so.1 (0x77b90000)
         libkcapi.so.1 => /usr/lib/libkcapi.so.1 (0x6ffa0000)    <==
         libcrypt.so.1 => /lib/libcrypt.so.1 (0x6ff50000)
         libc.so.6 => /lib/libc.so.6 (0x6fd10000)
         /lib/ld.so.1 => //lib/ld.so.1 (0x77ba0000)

Previous test was on an mpc8xx.

I now did the test on mpc832x and the difference is even bigger:

With CONFIG_CRYPTO_MD5_PPC:

# time md5sum avion.au
6513851d6109d42477b20cd56bf57f28  avion.au
real    0m 0.41s
user    0m 0.00s
sys     0m 0.34s

Without CONFIG_CRYPTO_MD5_PPC:

# time md5sum avion.au
6513851d6109d42477b20cd56bf57f28  avion.au
real    0m 0.58s
user    0m 0.00s
sys     0m 0.47s

Christophe

