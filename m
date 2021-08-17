Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DAC3EF0AD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 19:14:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpyM65HBYz3cVr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 03:14:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpyLc0rtDz2yNS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 03:14:11 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GpyLR5nTkz9sVK;
 Tue, 17 Aug 2021 19:14:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 16p3qr0AX8bv; Tue, 17 Aug 2021 19:14:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GpyLR4f0zz9sVD;
 Tue, 17 Aug 2021 19:14:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 741298B7CA;
 Tue, 17 Aug 2021 19:14:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ufPKm8rMTY65; Tue, 17 Aug 2021 19:14:07 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E82708B7A9;
 Tue, 17 Aug 2021 19:14:06 +0200 (CEST)
Subject: Re: [PATCH] powerpc/32s: Fix random crashes by adding isync() after
 locking/unlocking KUEP
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <1d28441dd80845e6428d693c0724cb6457247466.1629211378.git.christophe.leroy@csgroup.eu>
 <20210817162239.GF1583@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <0426a0d3-bdc6-1a34-1018-71b34282a6c6@csgroup.eu>
Date: Tue, 17 Aug 2021 19:13:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210817162239.GF1583@gate.crashing.org>
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
Cc: userm57@yahoo.com, fthain@linux-m68k.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/08/2021 à 18:22, Segher Boessenkool a écrit :
> On Tue, Aug 17, 2021 at 02:43:15PM +0000, Christophe Leroy wrote:
>> Commit b5efec00b671 ("powerpc/32s: Move KUEP locking/unlocking in C")
>> removed the 'isync' instruction after adding/removing NX bit in user
>> segments. The reasoning behind this change was that when setting the
>> NX bit we don't mind it taking effect with delay as the kernel never
>> executes text from userspace, and when clearing the NX bit this is
>> to return to userspace and then the 'rfi' should synchronise the
>> context.
>>
>> However, it looks like on book3s/32 having a hash page table, at least
>> on the G3 processor, we get an unexpected fault from userspace, then
>> this is followed by something wrong in the verification of MSR_PR
>> at end of another interrupt.
>>
>> This is fixed by adding back the removed isync() following update
>> of NX bit in user segment registers. Only do it for cores with an
>> hash table, as 603 cores don't exhibit that problem and the two isync
>> increase ./null_syscall selftest by 6 cycles on an MPC 832x.
>>
>> First problem: unexpected PROTFAULT
>>
>> 	[   62.896426] WARNING: CPU: 0 PID: 1660 at arch/powerpc/mm/fault.c:354 do_page_fault+0x6c/0x5b0
>> 	[   62.918111] Modules linked in:
>> 	[   62.923350] CPU: 0 PID: 1660 Comm: Xorg Not tainted 5.13.0-pmac-00028-gb3c15b60339a #40
>> 	[   62.943476] NIP:  c001b5c8 LR: c001b6f8 CTR: 00000000
>> 	[   62.954714] REGS: e2d09e40 TRAP: 0700   Not tainted  (5.13.0-pmac-00028-gb3c15b60339a)
> 
> That is not a protection fault.  What causes this?

That's the WARN_ON(error_code & DSISR_PROTFAULT) at

https://elixir.bootlin.com/linux/v5.13/source/arch/powerpc/mm/fault.c#L354


> 
> A CSI (like isync) is required both before and after mtsr.  It may work
> on some cores without -- what part of that is luck, if there is anything
> that guarantees it, is anyone's guess :-/

kuep_lock() is called when entering interrupts, it means we recently got an 'rfi' to re-enable MMU.
kuep_unlock() is called when exit interrupts, it means we are soon going to call 'rfi' to go back to 
user.

In between, nobody is going to exec any userspace code, so who minds that the 'mtsr' changing user 
segments is not completely finished ?

> 
>> @@ -28,6 +30,8 @@ static inline void kuep_lock(void)
>>   		return;
>>   
>>   	update_user_segments(mfsr(0) | SR_NX);
>> +	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
>> +		isync();	/* Context sync required after mtsr() */
>>   }
> 
> This needs a comment why you are not doing this for systems without
> hardware page table walk, at the least?

Ok, will add a comment tomorrow.

Christophe
