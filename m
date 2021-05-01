Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 556CF370642
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 09:50:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FXLyF2jZHz30HD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 17:50:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
X-Greylist: delayed 1106 seconds by postgrey-1.36 at boromir;
 Sat, 01 May 2021 17:50:24 AEST
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FXLxr2NVPz2y08
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 17:50:21 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FXLXP5GqRz9sRr;
 Sat,  1 May 2021 09:31:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9846q1DQgH85; Sat,  1 May 2021 09:31:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FXLXP49fWz9sRq;
 Sat,  1 May 2021 09:31:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C91938B76F;
 Sat,  1 May 2021 09:31:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0LOx1gJ0iR8h; Sat,  1 May 2021 09:31:48 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F8F68B763;
 Sat,  1 May 2021 09:31:47 +0200 (CEST)
Subject: Re: [PATCH 1/3] lib: early_string: allow early usage of some string
 functions
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Daniel Walker <danielwa@cisco.com>, linuxppc-dev@lists.ozlabs.org,
 x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>
References: <20210430042217.1198052-1-danielwa@cisco.com>
 <dc26a67e-dba0-1b8c-3718-3c75415c61f1@csgroup.eu>
 <1929b3a8-f882-c930-4b99-10c6a8f127c7@csgroup.eu>
Message-ID: <e355ecc9-574a-dbcb-7864-5aa4974e1971@csgroup.eu>
Date: Sat, 1 May 2021 09:31:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1929b3a8-f882-c930-4b99-10c6a8f127c7@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/04/2021 à 10:50, Christophe Leroy a écrit :
> 
> 
> Le 30/04/2021 à 10:47, Christophe Leroy a écrit :
>>
>>
>> Le 30/04/2021 à 06:22, Daniel Walker a écrit :
>>> This systems allows some string functions to be moved into
>>> lib/early_string.c and they will be prepended with "early_" and compiled
>>> without debugging like KASAN.
>>>
>>> This is already done on x86 for,
>>> "AMD Secure Memory Encryption (SME) support"
>>>
>>> and on powerpc prom_init.c , and EFI's libstub.
>>>
>>> The AMD memory feature disabled KASAN for all string functions, and
>>> prom_init.c and efi libstub implement their own versions of the
>>> functions.
>>>
>>> This implementation allows sharing of the string functions without
>>> removing the debugging features for the whole system.
>>
>> This looks good. I prefer that rather than the way you proposed to do it two years ago.
>>
>> Only one problem, see below.
>>
>>> +size_t strlcat(char *dest, const char *src, size_t count)
>>> +{
>>> +    size_t dsize = strlen(dest);
>>> +    size_t len = strlen(src);
>>> +    size_t res = dsize + len;
>>> +
>>> +    /* This would be a bug */
>>> +    BUG_ON(dsize >= count);
>>
>> powerpc is not ready to handle BUG_ON() in when in prom_init.
>>
>> Can you do:
>>
>> #ifndef __EARLY_STRING_ENABLED
>>      BUG_ON(dsize >= count);
>> #endif
> 
> In fact, should be like in prom_init today:
> 
> #ifdef __EARLY_STRING_ENABLED
>      if (dsize >= count)
>          return count;
> #else
>      BUG_ON(dsize >= count);
> #endif

Thinking about it once more, this BUG_ON() is overkill and should be avoided, see 
https://www.kernel.org/doc/html/latest/process/deprecated.html

Therefore, something like the following would make it:

	if (dsize >= count) {
		WARN_ON(!__is_defined(__EARLY_STRING_ENABLED));

		return count;
	}

> 
>>
>>
>>> +
>>> +    dest += dsize;
>>> +    count -= dsize;
>>> +    if (len >= count)
>>> +        len = count-1;
>>> +    memcpy(dest, src, len);
>>> +    dest[len] = 0;
>>> +    return res;
>>> +}
>>> +EXPORT_SYMBOL(strlcat);
>>> +#endif
>>> +
