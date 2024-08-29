Return-Path: <linuxppc-dev+bounces-751-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D6F964956
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 17:01:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvkxl1vTKz2xps;
	Fri, 30 Aug 2024 01:01:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724943675;
	cv=none; b=A8GnLKX2Cg/DBQ9/h8y+4NYnQ6QEyD7Thi6py2kya129WBulEs6k94L3AdCvPaf37ijB6ibstEFfU6yqMqi87V3l3q28sG6tO8npqWzv2bgggFOudoPfdrR3Bm6kU3QcrVHufGFdGom3TlMsKw5/+qoAE21rZmH7YdzcEFNvtuP/w9LsC1a3NsrtxK8DZtEIQj9wUVinvVjXKmI9m6RHfFLtX6lbMULoebC83rP5Fa7L2V5mbNZoiUco1EJgfV0Ai+cBoJFRAnXcQ28DvBdhFNYIIxAp+Gamwb3TPAf193Zj3+jJaFJFvOmvsbBl3rAQXwZqnhFh6WpBAHKZqrzsqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724943675; c=relaxed/relaxed;
	bh=i7Fu0tHXE2JzuzZenB6cmwoiAor/w3bLMzpoSB6xEq0=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=GhDCUNlPDUBxVvvq4YL8njm/GLjlk5gufnw1M/JkMG8AVvh6RF+1WRd0jqZ6AzJk17yBm/y+nqTVqmME/3TkD1Cxa6euaxWL/War3XRpyj5YdRABCyg8NLNNtp9+cQo78+7i50BdzUiwIDZJIHgnmR5a2b9K1BujECt2BEnzoFTGM9YK3JtxxTCtf8qqggXCSwL+A2x3y6yDeDTOBeoD4R+nqKG8/ZUe9QwIpzo8jzVHMthofxDSUR5IlzQZUlFAClVVnrV0o/k7JNDnDD6a/JlkqtXSC9sbEeghf+zmfZWXiLFOmeoHUGopGm5Xy0SMqFZQ7vfRaK+CXLAkNOvY2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wvkxk6TYCz2xfR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 01:01:14 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WvkxW5xyLz9sTX;
	Thu, 29 Aug 2024 17:01:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CjnhSQGtSteZ; Thu, 29 Aug 2024 17:01:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wvkwf6YQGz9sSX;
	Thu, 29 Aug 2024 17:00:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CF1CB8B794;
	Thu, 29 Aug 2024 17:00:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Ebp-7Axw5H8e; Thu, 29 Aug 2024 17:00:18 +0200 (CEST)
Received: from [192.168.234.40] (unknown [192.168.234.40])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 398B98B764;
	Thu, 29 Aug 2024 17:00:18 +0200 (CEST)
Message-ID: <0085b19d-bb87-45bc-8a74-7464316f86a1@csgroup.eu>
Date: Thu, 29 Aug 2024 17:00:17 +0200
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
Subject: Re: [PATCH] random: vDSO: Redefine PAGE_SIZE and PAGE_MASK
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Arnd Bergmann <arnd@arndb.de>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Linux-Arch <linux-arch@vger.kernel.org>
References: <b8f8fb6d1d10386c74f2d8826b737a74c60b76b2.1724743492.git.christophe.leroy@csgroup.eu>
 <defab86b7fb897c88a05a33b62ccf38467dda884.1724747058.git.christophe.leroy@csgroup.eu>
 <Zs2RCfMgfNu_2vos@zx2c4.com>
 <cb66b582-ba63-4a5a-9df8-b07288f1f66d@app.fastmail.com>
 <0f9255f1-5860-408c-8eaa-ccb4dd3747fa@csgroup.eu>
 <17437f43-9d1f-4263-888e-573a355cb0b5@arm.com>
 <272cb38a-c0e3-4e6e-89ce-b503c75c2c33@csgroup.eu>
 <bab7286c-e27e-450a-8bb6-e5b09063a033@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <bab7286c-e27e-450a-8bb6-e5b09063a033@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Vincenzo,

Le 29/08/2024 à 14:01, Vincenzo Frascino a écrit :
> Hi Christophe,
> 
> On 27/08/2024 18:14, Christophe Leroy wrote:
>>
>>
>> Le 27/08/2024 à 18:05, Vincenzo Frascino a écrit :
>>> Hi Christophe,
>>>
>>> On 27/08/2024 11:49, Christophe Leroy wrote:
>>>
>>> ...
> 
> ...
> 
>>>
>>> Could you please clarify where minmax is needed? I tried to build Jason's master
>>> tree for x86, commenting the header and it seems building fine. I might be
>>> missing something.
>>
>> Without it:
>>
>>    VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
>> In file included from /home/chleroy/linux-powerpc/lib/vdso/getrandom.c:11,
>>                   from <command-line>:
> ...
> 
>>
>>
>>>
>>>> Same for ARRAY_SIZE(->reserved) by the way, easy to do opencode, we also have it
>>>> only once
>>>>
>>>
>>> I have a similar issue to figure out why linux/array_size.h and
>>> uapi/linux/random.h are needed. It seems that I can build the object without
>>> them. Could you please explain?
>>
>> Without linux/array_size.h:
>>
>>    VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
>> In file included from <command-line>:
>> /home/chleroy/linux-powerpc/lib/vdso/getrandom.c: In function
>> '__cvdso_getrandom_data':
>> /home/chleroy/linux-powerpc/lib/vdso/getrandom.c:89:40: error: implicit
> If this is the case, those headers should be defined for the powerpc
> implementation only. The generic implementation should be interpreted as the
> minimum common denominator in between all the architectures for what concerns
> the headers.
> 

Sorry, I disagree. You can't rely on necessary headers being included 
indirectly by other arch specific headers. getrandom.c uses 
ARRAY_SIZE(), it must include the header that defines ARRAY_SIZE().

At the moment, on x86 you get linux/array.h by change through the 
following chain, that the reason why the build doesn't break:

In file included from ./include/linux/kernel.h:16,
                  from ./include/linux/cpumask.h:11,
                  from ./arch/x86/include/asm/cpumask.h:5,
                  from ./arch/x86/include/asm/msr.h:11,
                  from ./arch/x86/include/asm/vdso/gettimeofday.h:19,
                  from ./include/vdso/datapage.h:164,
                  from 
arch/x86/entry/vdso/../../../../lib/vdso/getrandom.c:9,

 From my point of view you can't expect such a chain from each architecture.

Christophe

