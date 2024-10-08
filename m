Return-Path: <linuxppc-dev+bounces-1841-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FBB994A70
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 14:33:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNFmN6n41z2ysv;
	Tue,  8 Oct 2024 23:33:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728390788;
	cv=none; b=bMP4sHQDtzeW9C+h71LxLPx7nslaPWJ7wgIgj8CcUSDbORlI39sskGseqsbwuQnYzi22t9K2x0faSI9NyqNPRWJ/GKzQsD0mbElxurBQEVkmbgTRjQLAE2/nJ9WvMxknIRbqb3gbNpgmxCbCxkZ9aXh1YNapIPdCxIDONXPU3G4MSuQLH/oFsUZLhCq1SS0frzu4wAlSfNtcm/gGYDm9u8z3cz6UQftZJdUo1e+ApD9FmKdxbvviBFKtFuu+MJmwV1xSpVYBIhzMETsdj2oD7gieJTWzIYuH730Di5LkB5PiWowU4j+7NWNFQ/9+SDkkXTQrnoNwmAvJdrQf5/1cng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728390788; c=relaxed/relaxed;
	bh=MIMtZZf010ed6K2yo1o8BYWvlUKCCce1qiRC2BsWhXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWCOE2I4KKFB3gWRPnVgUD4ub4RkNMg0YjSfqWOiTTmZDxbuI38odO7zIdnZ0x/6swqcJvwYuNLxxaMtb6hAJIuuivEEU0kD2PuQR7GweRCehbpGx+JwC8pafLHrAqmg6bhcKUjoj6uuVweuz1aRLKhWfxA9968g0XC1KSkXZi/kM1ka6JZdAh2xWkPjSJWtTEcDfg/AjcRJFqEoXXak9oxvOjnV4xZna84WjpXRSlusS7tLO9cYiv8FZVYCNnVV2Wmf6eD5zSlqGADEtFgsX/QZjqCo1VMx/4iSiJv3hxidqtIEEulGECHTpMWOOaL8hDTgsEMuzCwUsjVYeQaLTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNFmM5gnlz2yst
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 23:33:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XNFmH3sGlz9sPd;
	Tue,  8 Oct 2024 14:33:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tPaTPVTuDyMi; Tue,  8 Oct 2024 14:33:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XNFmH2r3Lz9rvV;
	Tue,  8 Oct 2024 14:33:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 51A358B788;
	Tue,  8 Oct 2024 14:33:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id jo8CPEkqpTpD; Tue,  8 Oct 2024 14:33:03 +0200 (CEST)
Received: from [192.168.233.14] (unknown [192.168.233.14])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E55E58B763;
	Tue,  8 Oct 2024 14:33:02 +0200 (CEST)
Message-ID: <6abb373f-10fc-470e-b52a-05e990ee2961@csgroup.eu>
Date: Tue, 8 Oct 2024 14:33:02 +0200
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
Subject: Re: [RFC PATCH] powerpc/vdso: Should VDSO64 functions be flagged as
 functions like VDSO32 ?
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Peter Bergner <bergner@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <6fa86f3de610ffc180ae0f5dbd511453e7473b36.1726208058.git.christophe.leroy@csgroup.eu>
 <875xqtr8qw.fsf@mail.lhotse>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <875xqtr8qw.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Michael,

Le 18/09/2024 à 04:33, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> On powerpc64 as shown below by readelf, vDSO functions symbols have
>> type NOTYPE.
>>
>> $ powerpc64-linux-gnu-readelf -a arch/powerpc/kernel/vdso/vdso64.so.dbg
>> ELF Header:
>>    Magic:   7f 45 4c 46 02 02 01 00 00 00 00 00 00 00 00 00
>>    Class:                             ELF64
>>    Data:                              2's complement, big endian
>>    Version:                           1 (current)
>>    OS/ABI:                            UNIX - System V
>>    ABI Version:                       0
>>    Type:                              DYN (Shared object file)
>>    Machine:                           PowerPC64
>>    Version:                           0x1
>> ...
>>
>> Symbol table '.dynsym' contains 12 entries:
>>     Num:    Value          Size Type    Bind   Vis      Ndx Name
>> ...
>>       1: 0000000000000524    84 NOTYPE  GLOBAL DEFAULT    8 __[...]@@LINUX_2.6.15
>> ...
>>       4: 0000000000000000     0 OBJECT  GLOBAL DEFAULT  ABS LINUX_2.6.15
>>       5: 00000000000006c0    48 NOTYPE  GLOBAL DEFAULT    8 __[...]@@LINUX_2.6.15
>>
>> Symbol table '.symtab' contains 56 entries:
>>     Num:    Value          Size Type    Bind   Vis      Ndx Name
>> ...
>>      45: 0000000000000000     0 OBJECT  GLOBAL DEFAULT  ABS LINUX_2.6.15
>>      46: 00000000000006c0    48 NOTYPE  GLOBAL DEFAULT    8 __kernel_getcpu
>>      47: 0000000000000524    84 NOTYPE  GLOBAL DEFAULT    8 __kernel_clock_getres
>>
>> To overcome that, commit ba83b3239e65 ("selftests: vDSO: fix vDSO
>> symbols lookup for powerpc64") was proposed to make selftests also
>> look for NOTYPE symbols, but is it the correct fix ?
>>
>> VDSO32 functions are flagged as functions, why not VDSO64 functions ?
>> Is it because VDSO functions are not traditional C functions using
>> the standard API ?
> 
> Yes. There's some explanation in the original commit:
> 
>      Note that the symbols exposed by the vDSO aren't "normal" function symbols, apps
>      can't be expected to link against them directly, the vDSO's are both seen
>      as if they were linked at 0 and the symbols just contain offsets to the
>      various functions.  This is done on purpose to avoid a relocation step
>      (ppc64 functions normally have descriptors with abs addresses in them).
>      When glibc uses those functions, it's expected to use it's own trampolines
>      that know how to reach them.
> 
>  From https://github.com/mpe/linux-fullhistory/commit/5f2dd691b62da9d9cc54b938f8b29c22c93cb805
> 
> The descriptors it's talking about are the OPD function descriptors used
> on ABI v1 (big endian).
> 
>> But it is exactly the same for VDSO32 functions, allthough they are
>> flagged as functions.
>   
> It's not quite the same because of the function descriptors.
> 
> On ppc64/ABIv1 a function pointer for "F" points to an opd, which then
> points to ".F" which has the actual text. It's the ".F" symbol that has
> type "function".
> 
>> So lets flag them as functions and revert the selftest change.
>>
>> What's your opinion on that ?
> 
> I think it's fine on ppc64le, I worry slightly that it risks breaking
> glibc or something else on big endian.
> 
> It is more correct for the text symbol to have type function, even if
> there's no function descriptor for it.
> 
> glibc has a special case already for handling the VDSO symbols which
> creates a fake opd pointing at the kernel symbol. So changing the VDSO
> symbol type to function shouldn't affect that AFAICS.
> 
> I think the only cause of breakage would be if something is explicitly
> looking for NOTYPE symbols, which seems unlikely, but you never know.
> 
> So I think we could attempt to take this change for v6.13, giving it
> lots of time to get some test coverage in next before going to mainline.


Will you take the RFC as is for 6.13 or would you like me to include the 
above explainations and repost as non-RFC ?

Christophe

