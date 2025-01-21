Return-Path: <linuxppc-dev+bounces-5471-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F38EA187B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 23:20:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yd1qC0gNSz30WX;
	Wed, 22 Jan 2025 09:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737498007;
	cv=none; b=ZQfYr3TdR5jTcmNoYmkQ9RFpSk2Erfti+kbE6NRj19ezaPaYzwjfN7aBMCZpthJse9oVliH2HYVth/tETbXLl/+7SWctTw0TwIYw9aCjK10el5SHRNt4L2C1+b6KkS4/4NjUyAKio4M2D7HzM4j2KP8hjZOo8zYZW+9Xs3T2XnTiuVb9GMrVGp1XSoLiAKwb3AVu1aB292HtAWvVxTq0XnZRfPQp2gLq9Y1rQapKfGZebRXOir1WKNSYc2vFomb6I2KVVWic4k7p4GBIuAKCivVBzcrpOOniiUylVV4c9l8bO2/99GIWkrG4hwsQbbmBb0Xq7qPVRKaM2DEpVxcFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737498007; c=relaxed/relaxed;
	bh=iD/GX8oe6b+0mETjf+UkjI2NIiV/ZLeNv6M5jb8OCX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=guritC+1VGO3Jpbb5UDKOrQvsDYjcBca4W0wQPTcxBHyldXg4hZYGIB7i4aoA7qzMo6OQRYOp0x5zpRYiAko/R16YldbcXgpcR56ktECNdxf9DizL+2+HSNw8IeKJWj8Ze08kGFtgVRuaLLYQlUe8KSMiOe6mS8MNbcv+FEyG6elpSs/wfo5N4ZV/T4KTFU0cy23cfgLW41mDHuK19qVmDyFPTKLVQR3YlyTkipJcSOVbMNePgHtDkgFkvL+67+s/IEJJJQVCRccauQ0jD/0f6v2vOb0KtaptSbxy5OxSPluh3CoWZSTRYQu+wZWV6JW9Wg6Z+HeipGJVlrEm3pDtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yd1qB2VFjz30MZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 09:20:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Yd1Xb1Vpwz9sPd;
	Tue, 21 Jan 2025 23:07:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9zA_vfdTSclJ; Tue, 21 Jan 2025 23:07:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Yd1Xb0K7xz9rvV;
	Tue, 21 Jan 2025 23:07:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ED16E8B775;
	Tue, 21 Jan 2025 23:07:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id BZ4lnNoNgtYh; Tue, 21 Jan 2025 23:07:26 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 307508B763;
	Tue, 21 Jan 2025 23:07:26 +0100 (CET)
Message-ID: <f06de018-34ae-4662-8a35-1c55dff1024a@csgroup.eu>
Date: Tue, 21 Jan 2025 23:07:25 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG: KASAN: vmalloc-out-of-bounds in
 copy_to_kernel_nofault+0xd8/0x1c8 (v6.13-rc6, PowerMac G4)
To: Erhard Furtner <erhard_f@mailbox.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, torvalds@linux-foundation.org
References: <20250112135832.57c92322@yea>
 <af04e91f-0f44-457e-9550-d1d49789158e@linux.ibm.com>
 <20250121220027.64b79bab@yea>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250121220027.64b79bab@yea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 21/01/2025 à 22:00, Erhard Furtner a écrit :
> On Sun, 19 Jan 2025 22:06:42 +0530
> Madhavan Srinivasan <maddy@linux.ibm.com> wrote:
> 
>> On 1/12/25 6:28 PM, Erhard Furtner wrote:
>>> Greetings!
>>>
>>> I am getting this at bootup on my PowerMac G4 with a KASAN-enabled kernel 6.13-rc6:
>>
>> Sorry for the delayed response,
>>
>> Are you seeing this only in this kernel or this is the recent
>> kernel you tried to boot?
> 
> Meanwhile I bisected the bug. Offending commit is:
> 
>   # git bisect good
> 32913f348229c9f72dda45fc2c08c6d9dfcd3d6d is the first bad commit
> commit 32913f348229c9f72dda45fc2c08c6d9dfcd3d6d
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Mon Dec 9 10:00:25 2024 -0800
> 
>      futex: fix user access on powerpc
>      
>      The powerpc user access code is special, and unlike other architectures
>      distinguishes between user access for reading and writing.
>      
>      And commit 43a43faf5376 ("futex: improve user space accesses") messed
>      that up.  It went undetected elsewhere, but caused ppc32 to fail early
>      during boot, because the user access had been started with
>      user_read_access_begin(), but then finished off with just a plain
>      "user_access_end()".
>      
>      Note that the address-masking user access helpers don't even have that
>      read-vs-write distinction, so if powerpc ever wants to do address
>      masking tricks, we'll have to do some extra work for it.
>      
>      [ Make sure to also do it for the EFAULT case, as pointed out by
>        Christophe Leroy ]
>      
>      Reported-by: Andreas Schwab <schwab@linux-m68k.org>
>      Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>      Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F87bjxl6b0i.fsf%40igel.home%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cd75d39f3c9b04d5a3aef08dd3a5ea6e9%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638730900391403538%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=unzkFDX%2BfA1H%2F%2BIvbuBqFRH9ZJVN6vuJJkOegIDtHlw%3D&reserved=0
>      Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> 
>   kernel/futex/futex.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> 
> Indeed, reverting 32913f348229c9f72dda45fc2c08c6d9dfcd3d6d on top of v6.13 makes the KASAN hit disappear.

That looks terribly odd.

On G4, user_read_access_begin() and user_read_access_end() are no-op 
because book3s/32 can only protect user access by kernel against write. 
Read is always granted.

So the bug must be an indirect side effect of what user_access_end() 
does. user_access_end() does a sync. Would the lack of sync (once 
replaced user_access_end() by user_read_access_end() ) lead to some odd 
re-ordering ? Or another possibility is that user_access_end() is called 
on some kernel address (I see in the description of commit 43a43faf5376 
("futex: improve user space accesses") that the replaced __get_user() 
was expected to work on kernel adresses) ? Calling user_access_begin() 
and user_access_end() is unexpected and there is no guard so it could 
lead to strange segment settings which hides a KASAN hit. But once the 
fix the issue the KASAN resurfaces ? Could this be the problem ?

Do you have a way to reproduce the bug on QEMU ? It would enable me to 
investigate it further.

Christophe

