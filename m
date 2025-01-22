Return-Path: <linuxppc-dev+bounces-5484-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3096A198C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2025 19:50:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdY6T0gN2z2yjb;
	Thu, 23 Jan 2025 05:50:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737571809;
	cv=none; b=ZxhSgQLOONDI2Ou7aR1J2SZwzDIwHvpGDFjEtEDjopA24DvZfw+c/GcPvjudYMO9JgkK70VbIUh1jupY8BNHVAXYID6C+Hk8w4x+DxDi3jIwOuHjMursl4pwMCyFgyIOeo7KUpvE8CF2pEmfe4iTdMXNhwwCrAdOq17yKvN2kepTyJDWmO5xQP+BlxTOaMa94vbwjJz/LD8tkIPaH0XFpYf0aGXdcI/JqhAy57bAC7AR0pNUl7nyi5MWrCPnDd+McAopMijHBIEUy5Y2L/lmRFhmPfNASqCzWkOyUmxEpB5CbShgK/fhQmXwrNFu2+asFrnxtklwFmqreXLA1naLIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737571809; c=relaxed/relaxed;
	bh=LN/KjvgNM9UDaYvGL/kD9+KdvO0FK2Qr6j5jfboXUS4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LGJ033oyXlCK97UlDnZZ9C3w1gDdcMHYVScX4BCkQrW+Z3Dh+1w6l7F/QpO5AOfvQT/sOb+yjmlLQeDeJ1ca+9iGijafwThTXxzK+fWcP6JaIxAo/VJkLYWOzjpqILvAQimIhXUyqZfV0iD46WDZQXfJADGqBL02d/Rj2TcyGcs/ecm9pUXvNQk7yzCSGJf+TwrmZkV9QXbSqyrow3rIkpCVaGES9LSftr0eWcND6fFbGYROHcOY+whT719Wx1l7w26/ygHWeyZKpq/+yK4Ql9ik+yNvAoQU2/VeJ/VZB56nidnJlDEtYFNNRRgYhy5+CyL3Kwie055nT5sR80ASdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdY6Q5FJ1z2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 05:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YdXW95lmCz9sPd;
	Wed, 22 Jan 2025 19:23:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uda0rZH_uMMJ; Wed, 22 Jan 2025 19:23:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YdXW94f35z9rvV;
	Wed, 22 Jan 2025 19:23:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C3048B775;
	Wed, 22 Jan 2025 19:23:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id hWR4dql6iXIn; Wed, 22 Jan 2025 19:23:01 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 34C298B763;
	Wed, 22 Jan 2025 19:23:01 +0100 (CET)
Message-ID: <8acd6ef8-adf0-4694-a3e5-72ec3cf09bf1@csgroup.eu>
Date: Wed, 22 Jan 2025 19:23:00 +0100
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Erhard Furtner <erhard_f@mailbox.org>,
 Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
 Balbir Singh <bsingharora@gmail.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 torvalds@linux-foundation.org, kasan-dev <kasan-dev@googlegroups.com>
References: <20250112135832.57c92322@yea>
 <af04e91f-0f44-457e-9550-d1d49789158e@linux.ibm.com>
 <20250121220027.64b79bab@yea>
 <f06de018-34ae-4662-8a35-1c55dff1024a@csgroup.eu>
 <20250122002159.43b367f0@yea>
 <ca7568ef-5032-4a80-9350-a9648b87f0b5@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <ca7568ef-5032-4a80-9350-a9648b87f0b5@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 22/01/2025 à 16:32, Christophe Leroy a écrit :
> 
> 
> Le 22/01/2025 à 00:21, Erhard Furtner a écrit :
>> On Tue, 21 Jan 2025 23:07:25 +0100
>> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>>
>>>> Meanwhile I bisected the bug. Offending commit is:
>>>>
>>>>    # git bisect good
>>>> 32913f348229c9f72dda45fc2c08c6d9dfcd3d6d is the first bad commit
>>>> commit 32913f348229c9f72dda45fc2c08c6d9dfcd3d6d
>>>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>>>> Date:   Mon Dec 9 10:00:25 2024 -0800
>>>>
>>>>       futex: fix user access on powerpc
>>>>       The powerpc user access code is special, and unlike other 
>>>> architectures
>>>>       distinguishes between user access for reading and writing.
>>>>       And commit 43a43faf5376 ("futex: improve user space accesses") 
>>>> messed
>>>>       that up.  It went undetected elsewhere, but caused ppc32 to 
>>>> fail early
>>>>       during boot, because the user access had been started with
>>>>       user_read_access_begin(), but then finished off with just a plain
>>>>       "user_access_end()".
>>>>       Note that the address-masking user access helpers don't even 
>>>> have that
>>>>       read-vs-write distinction, so if powerpc ever wants to do address
>>>>       masking tricks, we'll have to do some extra work for it.
>>>>       [ Make sure to also do it for the EFAULT case, as pointed out by
>>>>         Christophe Leroy ]
>>>>       Reported-by: Andreas Schwab <schwab@linux-m68k.org>
>>>>       Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>>       Link: https://eur01.safelinks.protection.outlook.com/? 
>>>> url=https%3A%2F%2Flore.kernel.org%2Fall%2F87bjxl6b0i.fsf%40igel.home%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cb4c1dc7184f54a410a0e08dd3a7270b6%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638730985407902881%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=E5Yp9jopCPE1NFuBM8rs%2B1jXZ%2FXAaKvBGpcEP%2BaMyz0%3D&reserved=0
>>>>       Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
>>>>
>>>>    kernel/futex/futex.h | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>>
>>>> Indeed, reverting 32913f348229c9f72dda45fc2c08c6d9dfcd3d6d on top of 
>>>> v6.13 makes the KASAN hit disappear.
>>>
>>> That looks terribly odd.
>>>
>>> On G4, user_read_access_begin() and user_read_access_end() are no-op
>>> because book3s/32 can only protect user access by kernel against write.
>>> Read is always granted.
>>>
>>> So the bug must be an indirect side effect of what user_access_end()
>>> does. user_access_end() does a sync. Would the lack of sync (once
>>> replaced user_access_end() by user_read_access_end() ) lead to some odd
>>> re-ordering ? Or another possibility is that user_access_end() is called
>>> on some kernel address (I see in the description of commit 43a43faf5376
>>> ("futex: improve user space accesses") that the replaced __get_user()
>>> was expected to work on kernel adresses) ? Calling user_access_begin()
>>> and user_access_end() is unexpected and there is no guard so it could
>>> lead to strange segment settings which hides a KASAN hit. But once the
>>> fix the issue the KASAN resurfaces ? Could this be the problem ?
>>>
>>> Do you have a way to reproduce the bug on QEMU ? It would enable me to
>>> investigate it further.
>>
>> Attached v6.13 .config plays nicely with qemu ttyS0 (forgot to disable 
>> SERIAL_8250 and set SERIAL_PMACZILOG + SERIAL_PMACZILOG_CONSOLE 
>> instead as I prefer the PCI Serial card in my G4).
>>
>> The KASAN hit also shows up on qemu 8.2.7 via via:
>> qemu-system-ppc -machine mac99,via=pmu -cpu 7450 -m 2G -nographic - 
>> append console=ttyS0 -kernel vmlinux-6.13.0-PMacG4 -hda Debian-VM_g4.img
>>
> 
> I was able to reproduce it with v6.13 with QEMU when loading test_bpf 
> module.
> 
> On my side, the problem doesn't disappear when reverting of commit 
> 32913f348229 ("futex: fix user access on powerpc")
> 
> I bisected it to commit e4137f08816b ("mm, kasan, kmsan: instrument 
> copy_from/to_kernel_nofault"), which makes a lot more sense to me.
> 
> It might be a problem in the way patch_instruction() is implemented on 
> powerpc, to be investigated.

I think the problem is commit 37bc3e5fd764 ("powerpc/lib/code-patching: 
Use alternate map for patch_instruction()")

Can you try the change below:

diff --git a/arch/powerpc/lib/code-patching.c 
b/arch/powerpc/lib/code-patching.c
index af97fbb3c257..8a378fc19074 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -108,7 +108,7 @@ static int text_area_cpu_up(unsigned int cpu)
  	unsigned long addr;
  	int err;

-	area = get_vm_area(PAGE_SIZE, VM_ALLOC);
+	area = get_vm_area(PAGE_SIZE, 0);
  	if (!area) {
  		WARN_ONCE(1, "Failed to create text area for cpu %d\n",
  			cpu);


