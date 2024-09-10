Return-Path: <linuxppc-dev+bounces-1215-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F12972D53
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2024 11:21:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2yqb4ztMz2xJy;
	Tue, 10 Sep 2024 19:20:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725960059;
	cv=none; b=Ah6YSBNvuJftUtXKM877gfWf1o1YT9Xg0zg/EO39cSvBpEpNDAvBtRUFNJNa57lmD5xZvww1Vu8IJ6oNl2Qvp4iKNjFZ0rJLYrh752aPbTiJsZlyT4i5N6Xki0uW7yUvdRdHz4qtgNkAj5RGlCnW8ilVTWWVNOYq1u90p59ACeZl6eaSKg82t9/aojS21tSvUYK8+R0UQ98Q4ksUbwDZdqL60BRJfJDcGwGEeLSI+orcIKuEErs4CrAZ1XkT9XEN4gHsmJvEozDTVSZ8Dpc8+bDWfm19rmDoHR9rQfDD07SpgrAe2Gd1hMpvsH2CltykZ7ik9EEjB5bPodeWIXmyIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725960059; c=relaxed/relaxed;
	bh=flamZV6BUHKlkgSmDzgtqsqGN4qMDht8wJAhpdU2U/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VgqdhHuG5pOMvUyPcFAQjipPSuqDTyUW0fx2Uvp70LNDpYGlHxdLE1kMsTLJN56UbAVKwdTnPA5TIZZ+2EqJS+t9sMjA0wb6LpkvOWtQofiKsJNY9sNHk4FUd1hzVYTFk0iBpVISUE+EF0Fqq4gHGlVSV/c/g60zkPYWr+4BuHWsjL/NHxsS3KiO/mz7aIwaE3f1tKPqxztkghk844q+UeVa6c6J6fYzYv3flE+iKlumuseW4qX/kM2927A6+1TjvD9x3eYEuPpO3SQHkrapQ5V9uz1MPN89/ymEWCypgpOQ119YKFzvmd1BqCFzemoF1+ODuqQh0YN8ZCl9+GpFGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2yqb2kVsz2xJV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 19:20:58 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X2yqW1tPjz9sRr;
	Tue, 10 Sep 2024 11:20:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dnho_jJb4vl9; Tue, 10 Sep 2024 11:20:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X2yqM6ht6z9sSf;
	Tue, 10 Sep 2024 11:20:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CEFAC8B773;
	Tue, 10 Sep 2024 11:20:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 94Smq4dlZKGe; Tue, 10 Sep 2024 11:20:47 +0200 (CEST)
Received: from [192.168.232.177] (unknown [192.168.232.177])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 089D78B766;
	Tue, 10 Sep 2024 11:20:44 +0200 (CEST)
Message-ID: <1aca8e4c-1c12-4624-a689-147ff60b75d6@csgroup.eu>
Date: Tue, 10 Sep 2024 11:20:44 +0200
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
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
To: Charlie Jenkins <charlie@rivosinc.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Michal Hocko <mhocko@suse.com>, "Kirill A. Shutemov" <kirill@shutemov.name>,
 Chris Torek <chris.torek@gmail.com>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <87zfol468z.fsf@mail.lhotse> <Zt9HboH/PmPlRPmH@ghost>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <Zt9HboH/PmPlRPmH@ghost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>> diff --git a/include/uapi/linux/personality.h b/include/uapi/linux/personality.h
>>> index 49796b7756af..cd3b8c154d9b 100644
>>> --- a/include/uapi/linux/personality.h
>>> +++ b/include/uapi/linux/personality.h
>>> @@ -22,6 +22,7 @@ enum {
>>>   	WHOLE_SECONDS =		0x2000000,
>>>   	STICKY_TIMEOUTS	=	0x4000000,
>>>   	ADDR_LIMIT_3GB = 	0x8000000,
>>> +	ADDR_LIMIT_47BIT = 	0x10000000,
>>>   };
>>
>> I wonder if ADDR_LIMIT_128T would be clearer?
>>
> 
> I don't follow, what does 128T represent?
> 

128T is 128 Terabytes, that's the maximum size achievable with a 47BIT 
address, that naming would be more consistant with the ADDR_LIMIT_3GB 
just above that means a 3 Gigabytes limit.

Christophe

