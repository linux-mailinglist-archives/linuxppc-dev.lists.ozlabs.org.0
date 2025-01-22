Return-Path: <linuxppc-dev+bounces-5483-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1FBA195C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2025 16:50:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdT6l0DvTz2y8W;
	Thu, 23 Jan 2025 02:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737561006;
	cv=none; b=fi6xElSSgHX+OKv6ieHeHiwx7XGbEujfLw4LV9KYcB/gr0WTSkYm0lulrVJZEK1igJnYIsbVizyzyaehvYDzWCCoMQyNulSahl0CbRvBXjqJ+4t4GHYkU9RCMCc6oOK9dvw5MWDTCxHJjdfdSGjiKSNOkv3inHKk/rYDjASFhEq9ny3GNaruxWflLXUli0BYYVFwiGnbEsq8DdKkaQ1APLVPWLGCHYiZWtruSQ7AKx/K7VClyPW9VzoNy1WRJK8sa78cxsz1R8nGGzlZXai8jffmpP8eJM2lM7QsiAFl5UjyIVmMzQLxzn+rWKpcy9oAVDXBizk+vN7zrTV6uz7fuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737561006; c=relaxed/relaxed;
	bh=ddmu6H7W9SOftXDbUNQZENGkRNuW40ddMfkkirojTWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxHY1c14IzpzGAVvRDibZWv8eryleSWGBAktXpxsVzzjbNeIY8MRzeNlZvV3FM5BPymrWezBcr0PiHy9QxsbvNth1Kbo6iCR+2ymvAGp7vFkYL66LbNTfJOE/lXvV2CupenbJdoncWW+D3dIhNIP2Sq2FVztxoBoENvMqfl9ZaeMfHdF8iKFdUSrGsppELW80xudzZgwLjvL59J/bX3RZrEknH/4o4LaujGNDKFS9PmvwPljtgIXUgOcmFEmYyhNBnX3s+9PMHKtXQCt0W02oGLaOoaveZKydXR1r8H7pSjTwfKRF+xbIOcJzgv83NcY7tmfxWoy1GGXHTj6nHUNGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdT6k0jrKz2xGC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 02:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YdSk76fSLz9sSX;
	Wed, 22 Jan 2025 16:32:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y0ziEzDSpIL0; Wed, 22 Jan 2025 16:32:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YdSk75dfWz9sRr;
	Wed, 22 Jan 2025 16:32:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B0ECD8B778;
	Wed, 22 Jan 2025 16:32:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0ud7eRkH3-ok; Wed, 22 Jan 2025 16:32:15 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 39FB98B763;
	Wed, 22 Jan 2025 16:32:15 +0100 (CET)
Message-ID: <ca7568ef-5032-4a80-9350-a9648b87f0b5@csgroup.eu>
Date: Wed, 22 Jan 2025 16:32:14 +0100
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
 Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 torvalds@linux-foundation.org, kasan-dev <kasan-dev@googlegroups.com>
References: <20250112135832.57c92322@yea>
 <af04e91f-0f44-457e-9550-d1d49789158e@linux.ibm.com>
 <20250121220027.64b79bab@yea>
 <f06de018-34ae-4662-8a35-1c55dff1024a@csgroup.eu>
 <20250122002159.43b367f0@yea>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250122002159.43b367f0@yea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 22/01/2025 à 00:21, Erhard Furtner a écrit :
> On Tue, 21 Jan 2025 23:07:25 +0100
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
>>> Meanwhile I bisected the bug. Offending commit is:
>>>
>>>    # git bisect good
>>> 32913f348229c9f72dda45fc2c08c6d9dfcd3d6d is the first bad commit
>>> commit 32913f348229c9f72dda45fc2c08c6d9dfcd3d6d
>>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>>> Date:   Mon Dec 9 10:00:25 2024 -0800
>>>
>>>       futex: fix user access on powerpc
>>>       
>>>       The powerpc user access code is special, and unlike other architectures
>>>       distinguishes between user access for reading and writing.
>>>       
>>>       And commit 43a43faf5376 ("futex: improve user space accesses") messed
>>>       that up.  It went undetected elsewhere, but caused ppc32 to fail early
>>>       during boot, because the user access had been started with
>>>       user_read_access_begin(), but then finished off with just a plain
>>>       "user_access_end()".
>>>       
>>>       Note that the address-masking user access helpers don't even have that
>>>       read-vs-write distinction, so if powerpc ever wants to do address
>>>       masking tricks, we'll have to do some extra work for it.
>>>       
>>>       [ Make sure to also do it for the EFAULT case, as pointed out by
>>>         Christophe Leroy ]
>>>       
>>>       Reported-by: Andreas Schwab <schwab@linux-m68k.org>
>>>       Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>       Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F87bjxl6b0i.fsf%40igel.home%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cb4c1dc7184f54a410a0e08dd3a7270b6%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638730985407902881%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=E5Yp9jopCPE1NFuBM8rs%2B1jXZ%2FXAaKvBGpcEP%2BaMyz0%3D&reserved=0
>>>       Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
>>>
>>>    kernel/futex/futex.h | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>>
>>> Indeed, reverting 32913f348229c9f72dda45fc2c08c6d9dfcd3d6d on top of v6.13 makes the KASAN hit disappear.
>>
>> That looks terribly odd.
>>
>> On G4, user_read_access_begin() and user_read_access_end() are no-op
>> because book3s/32 can only protect user access by kernel against write.
>> Read is always granted.
>>
>> So the bug must be an indirect side effect of what user_access_end()
>> does. user_access_end() does a sync. Would the lack of sync (once
>> replaced user_access_end() by user_read_access_end() ) lead to some odd
>> re-ordering ? Or another possibility is that user_access_end() is called
>> on some kernel address (I see in the description of commit 43a43faf5376
>> ("futex: improve user space accesses") that the replaced __get_user()
>> was expected to work on kernel adresses) ? Calling user_access_begin()
>> and user_access_end() is unexpected and there is no guard so it could
>> lead to strange segment settings which hides a KASAN hit. But once the
>> fix the issue the KASAN resurfaces ? Could this be the problem ?
>>
>> Do you have a way to reproduce the bug on QEMU ? It would enable me to
>> investigate it further.
> 
> Attached v6.13 .config plays nicely with qemu ttyS0 (forgot to disable SERIAL_8250 and set SERIAL_PMACZILOG + SERIAL_PMACZILOG_CONSOLE instead as I prefer the PCI Serial card in my G4).
> 
> The KASAN hit also shows up on qemu 8.2.7 via via:
> qemu-system-ppc -machine mac99,via=pmu -cpu 7450 -m 2G -nographic -append console=ttyS0 -kernel vmlinux-6.13.0-PMacG4 -hda Debian-VM_g4.img
> 

I was able to reproduce it with v6.13 with QEMU when loading test_bpf 
module.

On my side, the problem doesn't disappear when reverting of commit 
32913f348229 ("futex: fix user access on powerpc")

I bisected it to commit e4137f08816b ("mm, kasan, kmsan: instrument 
copy_from/to_kernel_nofault"), which makes a lot more sense to me.

It might be a problem in the way patch_instruction() is implemented on 
powerpc, to be investigated.

Christophe

