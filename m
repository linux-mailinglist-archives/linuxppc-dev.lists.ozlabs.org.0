Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1C74467CA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 18:24:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hm6nT1B91z3c8m
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 04:24:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hm6mz0Dytz2xtW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Nov 2021 04:24:00 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Hm6mp3JY9z9sSb;
 Fri,  5 Nov 2021 18:23:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hbpmo9jN3v01; Fri,  5 Nov 2021 18:23:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Hm6mp2FcNz9sSV;
 Fri,  5 Nov 2021 18:23:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 338768B786;
 Fri,  5 Nov 2021 18:23:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id c50ensR6JB-3; Fri,  5 Nov 2021 18:23:54 +0100 (CET)
Received: from [192.168.233.150] (unknown [192.168.233.150])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C5F58B763;
 Fri,  5 Nov 2021 18:23:53 +0100 (CET)
Message-ID: <459684e7-73bf-fbfb-c666-cc16299d858b@csgroup.eu>
Date: Fri, 5 Nov 2021 18:23:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 2/4] mm: Make generic arch_is_kernel_initmem_freed() do
 what it says
Content-Language: fr-FR
To: Andrew Morton <akpm@linux-foundation.org>, Daniel Axtens <dja@axtens.net>
References: <9ecfdee7dd4d741d172cb93ff1d87f1c58127c9a.1633001016.git.christophe.leroy@csgroup.eu>
 <1d40783e676e07858be97d881f449ee7ea8adfb1.1633001016.git.christophe.leroy@csgroup.eu>
 <87ilyhmd26.fsf@linkitivity.dja.id.au>
 <20211104144442.7130ae4a104fca70623a2d1a@linux-foundation.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20211104144442.7130ae4a104fca70623a2d1a@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Kefeng Wang <wangkefeng.wang@huawei.com>, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/11/2021 à 22:44, Andrew Morton a écrit :
> On Fri, 01 Oct 2021 17:14:41 +1000 Daniel Axtens <dja@axtens.net> wrote:
> 
>>>   #ifdef __KERNEL__
>>> +/*
>>> + * Check if an address is part of freed initmem. After initmem is freed,
>>> + * memory can be allocated from it, and such allocations would then have
>>> + * addresses within the range [_stext, _end].
>>> + */
>>> +#ifndef arch_is_kernel_initmem_freed
>>> +static int arch_is_kernel_initmem_freed(unsigned long addr)
>>> +{
>>> +	if (system_state < SYSTEM_FREEING_INITMEM)
>>> +		return 0;
>>> +
>>> +	return init_section_contains((void *)addr, 1);
>>
>> Is init_section_contains sufficient here?
>>
>> include/asm-generic/sections.h says:
>>   * [__init_begin, __init_end]: contains .init.* sections, but .init.text.*
>>   *                   may be out of this range on some architectures.
>>   * [_sinittext, _einittext]: contains .init.text.* sections
>>
>> init_section_contains only checks __init_*:
>> static inline bool init_section_contains(void *virt, size_t size)
>> {
>> 	return memory_contains(__init_begin, __init_end, virt, size);
>> }
>>
>> Do we need to check against _sinittext and _einittext?
>>
>> Your proposed generic code will work for powerpc and s390 because those
>> archs only test against __init_* anyway. I don't know if any platform
>> actually does place .init.text outside of __init_begin=>__init_end, but
>> the comment seems to suggest that they could.
>>
> 
> Christophe?
> 

Sorry for answering late.

I've been thorugh free_initmem() in each architecture. The only sections 
involved in the freeing actions are [__init_begin, __init_end], so I 
think checking against __init_being, __init_end is enough.

If some architecture has init text outside of this section, then it is 
not freed hence not necessary to check.

Christophe
