Return-Path: <linuxppc-dev+bounces-11813-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E80B46989
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 08:50:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJkPW0W8Hz2yT1;
	Sat,  6 Sep 2025 16:50:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757141438;
	cv=none; b=GtITzKKFn2YCKd5x/fDJbDCY/RpJygPT1p/LsT5PPOMuEn4Z/XQcH2C/SjGdDXPwDjvquFRJpOe7INUYWvmRkIex29/DMZ6E2fExZgEod4/AgiM8x8Sj6AuiUj2RJeMd4tDSKcZSZiSm6MLMqO0qTy/vQJbJy1EuuZPXvWohzIaG7IaMzYoCN0eOuoUsIgBeDzQhh9wAx4EbzaIL1MrDXcL4AhZuMcIGiDihqFEQHQ3G81Y8IM+ESWubqgw7azHaDP0v95uL7/DQWCKyN4Levb3gfR4E3LuMMB8Z+JX8xnT7BR8vK+541Dwt2nqbBUwMwMznAPVLYVjf5o2ABWCglw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757141438; c=relaxed/relaxed;
	bh=dpBGWw+mJPLnFD6HSROqWmI5f9BubfnO3nxg14iJW3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kmjVaZpGbhHTGAiOEADM0VZ/wQj+8r0vVXjIFQfbhToUYDg7MtyRAfH1/e4Gg/iXrobz1g7g1jTamqOw5z9faMyhKLK8Udnwd4Hebtg/QS0lYx2ZEpAYojkgrdcIWT2w2OGqplvPruT7cI/G8co5sYtDKMJFTD8vhKxxbYpKxllszOyKcd8t2cR6Gp82yfgMaDnyTY2VUcK5fOxoPp/EmtRsAd+Dst5bB5LL42M6TNgyQzdXppdLLTx8WEbkouZUHzauuHy9xgOqZ0C33INxp4CyAiedNZ08abkEXVPCjDyLjFpHIHmyyxyMtFCa4/jcsXPyCO0y4qaXRsSgeCwZVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJkPV1Gpbz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Sep 2025 16:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cJkCj5Mvkz9sS7;
	Sat,  6 Sep 2025 08:42:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ofr8zKUh7ixS; Sat,  6 Sep 2025 08:42:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cJkCj4F9Kz9sRy;
	Sat,  6 Sep 2025 08:42:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 769E58B776;
	Sat,  6 Sep 2025 08:42:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id O04ntYOWCf3E; Sat,  6 Sep 2025 08:42:09 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BDEE08B773;
	Sat,  6 Sep 2025 08:42:08 +0200 (CEST)
Message-ID: <1b4cc6d5-5f5b-4b39-8fdf-ac02c94cd5e2@csgroup.eu>
Date: Sat, 6 Sep 2025 08:42:07 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] powerpc: Panic on jump label code patching failure
To: "Ritesh Harjani (IBM)" <riteshh@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com
Cc: npiggin@gmail.com, rostedt@goodmis.org, ardb@kernel.org,
 Erhard Furtner <erhard_f@mailbox.org>
References: <20250905061135.1451362-1-ajd@linux.ibm.com>
 <87qzwki6fv.fsf@ritesh.list@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <87qzwki6fv.fsf@ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 06/09/2025 à 05:52, Ritesh Harjani a écrit :
> [Vous ne recevez pas souvent de courriers de riteshh@linux.ibm.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Andrew Donnellan <ajd@linux.ibm.com> writes:
> 
>> If patch_branch() or patch_instruction() fails while updating a jump
>> label, we presently fail silently, leading to unpredictable behaviour
>> later on.
>>
>> Change arch_jump_label_transform() to panic on a code patching failure,
>> matching the existing behaviour of arch_static_call_transform().
>>
>> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
>> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
>>
>> ---
>>
>> Ran into this while debugging an issue that Erhard reported to me about my
>> PAGE_TABLE_CHECK series on a G4, where updating a static key failed
>> silently, but only for one call site, leading to an incorrect reference
>> count later on. This looks to be due to the issue fixed in [0]. A loud
>> failure would have saved us all considerable debugging time.
>>
>> Should I change the return type of arch_jump_label_transform() and handle
>> this in an arch-independent way? Are there other users of code patching
>> in powerpc that ought to be hardened?
>>
>> Or is this excessive?
>>
>> [0] https://patchwork.ozlabs.org/project/linuxppc-dev/patch/4b5e6eb281d7b1ea77619bee17095f905a125168.1757003584.git.christophe.leroy@csgroup.eu/
>> ---
>>   arch/powerpc/kernel/jump_label.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/jump_label.c b/arch/powerpc/kernel/jump_label.c
>> index 2659e1ac8604..80d41ed7ac50 100644
>> --- a/arch/powerpc/kernel/jump_label.c
>> +++ b/arch/powerpc/kernel/jump_label.c
>> @@ -12,9 +12,14 @@ void arch_jump_label_transform(struct jump_entry *entry,
>>                               enum jump_label_type type)
>>   {
>>        u32 *addr = (u32 *)jump_entry_code(entry);
>> +     int err;
>>
>>        if (type == JUMP_LABEL_JMP)
>> -             patch_branch(addr, jump_entry_target(entry), 0);
>> +             err = patch_branch(addr, jump_entry_target(entry), 0);
>>        else
>> -             patch_instruction(addr, ppc_inst(PPC_RAW_NOP()));
>> +             err = patch_instruction(addr, ppc_inst(PPC_RAW_NOP()));
>> +
>> +     if (err)
>> +             panic("%s: patching failed, err %d, type %d, addr %pS, target %pS\n",
>> +                   __func__, err, type, addr, (void *)jump_entry_target(entry));
>>   }
> 
> arch_jump_label_transform() is mainly getting called from
> __jump_level_update() and it's used for enabling or updating static keys / branch.
> 
> But static keys can also be used by drivers / module subsystem whose
> initialization happens late. Although I understand that if the above
> fails, it might fail much before, from the arch setup code itself, but
> panic() still feels like a big hammer.

But not being able to patch the kernel as required means that you get a 
kernel behaving differently from what is expected.

Imagine a kernel running on a board that is controlling a saw. There is 
a patch_instruction() to activate the safety feature which detects when 
your hands are too close to the blade. Do you want the kernel to 
continue running seamlessly when that patch_instruction() fails ? I'm 
sure you don't !

> 
> Would pr_err() print with WARN_ON_ONCE(1) would suffice in case of an
> err?

No, that's not enough, you can't rely on a kernel that will no behave as 
expected.

> 
> Also you said you ran into a problem at just one call site where above
> was silently failing. With the above change are you able to hit the
> panic() now? Because from what I see in patch_instruction(), it mainly
> will boil down to calling __patch_mem() which always returns 0.

As far as I can see, __patch_mem() returns -EPERM when 
__put_kernel_nofault() fails:

static int __patch_mem(void *exec_addr, unsigned long val, void 
*patch_addr, bool is_dword)
{
	if (!IS_ENABLED(CONFIG_PPC64) || likely(!is_dword)) {
		/* For big endian correctness: plain address would use the wrong half */
		u32 val32 = val;

		__put_kernel_nofault(patch_addr, &val32, u32, failed);
	} else {
		__put_kernel_nofault(patch_addr, &val, u64, failed);
	}

	asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_addr),
							    "r" (exec_addr));

	return 0;

failed:
	mb();  /* sync */
	return -EPERM;
}


> Although there are other places where there can be an error returned,
> so I was wondering if that is what you were hitting or something else?

Andrew was hitting the -EPERM because the memory area was read-only.

Christophe

