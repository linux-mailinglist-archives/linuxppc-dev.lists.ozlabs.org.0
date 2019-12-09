Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2219E1171E2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 17:34:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Wpg41xMxzDqDh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 03:34:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="fFy+fplZ"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Wpcj14XzzDqLl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 03:32:02 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47WpcV39Zjz9vBLq;
 Mon,  9 Dec 2019 17:31:54 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=fFy+fplZ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id wbUnB0KWOiKW; Mon,  9 Dec 2019 17:31:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47WpcV1xNhz9vBLn;
 Mon,  9 Dec 2019 17:31:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1575909114; bh=UeUEXvRzGddwO+I8K0XVbjOG3FupFvil7RLIITbwaOk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fFy+fplZ4m6F0xd58x2I01loE5VRYUIVcJs4rjYEagvEnFY4T+P66JCXlcVi0kuzq
 VloyeT5Cmvy7S64bM6+cBvLruYVWAG880PCt0EaX7YhXIq2STWDIF159gMGxmIN+6B
 y/FZHWXB+Bo7GZNoT84NuzkIsoTraDZvAzHSKuKI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 844718B7F7;
 Mon,  9 Dec 2019 17:31:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YT_9-G5xvc4R; Mon,  9 Dec 2019 17:31:59 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D2F508B7F3;
 Mon,  9 Dec 2019 17:31:58 +0100 (CET)
Subject: Re: [PATCH] powerpc: Fix __clear_user() with KUAP enabled
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20191209105946.13474-1-ajd@linux.ibm.com>
 <3349b5d5-c277-a868-8a27-ef168aae7daa@c-s.fr>
 <6ff56858-87f2-1ca2-64f7-044b0c730dfc@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <6d23750c-b961-e262-04a4-ac9e4205741e@c-s.fr>
Date: Mon, 9 Dec 2019 17:31:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <6ff56858-87f2-1ca2-64f7-044b0c730dfc@linux.ibm.com>
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
Cc: syzbot+f25ecf4b2982d8c7a640@syzkaller-ppc64.appspotmail.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/12/2019 à 14:26, Andrew Donnellan a écrit :
> On 9/12/19 10:50 pm, Christophe Leroy wrote:
>>> -extern unsigned long __clear_user(void __user *addr, unsigned long 
>>> size);
>>> +extern unsigned long clear_user_asm(void __user *addr, unsigned long 
>>> size);
>>>   static inline unsigned long clear_user(void __user *addr, unsigned 
>>> long size)
>>>   {
>>> @@ -409,12 +409,17 @@ static inline unsigned long clear_user(void 
>>> __user *addr, unsigned long size)
>>>       might_fault();
>>>       if (likely(access_ok(addr, size))) {
>>>           allow_write_to_user(addr, size);
>>> -        ret = __clear_user(addr, size);
>>> +        ret = clear_user_asm(addr, size);
>>>           prevent_write_to_user(addr, size);
>>>       }
>>
>> What about changing the above by the following ?
>>
>>         if (likely(access_ok(addr, size)))        ret = 
>> __clear_user(addr, size);
>>
>>>       return ret;
>>>   }
>>> +static inline unsigned long __clear_user(void __user *addr, unsigned 
>>> long size)
>>> +{
>>> +        return clear_user(addr, size);
>>> +}
>>> +
>>
>> Then
>>
>> static inline unsigned long __clear_user(void __user *addr, unsigned 
>> long size)
>> {
>>      allow_write_to_user(addr, size);
>>      ret = clear_user_asm(addr, size);
>>      prevent_write_to_user(addr, size);
>>
>>      return ret;
>> }
> 
> This is exactly the patch I initially wrote, I ran it past mpe privately 
> and he suggested aliasing clear_user() -> __clear_user() instead, as 
> there's not much point keeping a separate path around for a single user 
> for a basically non-existent performance gain.
> 

But other arches do call __clear_user() from clear_user() and do the 
access unlock / lock in __clear_user() (at least arm and x86/64).

I think it would be better to do the same way as other arches, 
especially as __clear_user() can be called from anywhere in the kernel, 
so I'd expect it to behave the same on all arches.

I don't see it as the separate path, to me it looks more like code 
refactoring. And it follows the same logic as many other functions in 
the kernel: __the_said_function() is the light version of 
the_said_function().

Christophe
