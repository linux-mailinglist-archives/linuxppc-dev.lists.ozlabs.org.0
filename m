Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5931E04CA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 04:42:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49VhG73V6ZzDqRt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 12:42:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49VhDR0shWzDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 May 2020 12:41:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=U8H0joqi; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49VhDR0Hcfz9sSx; Mon, 25 May 2020 12:41:11 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49VhDQ2FZ2z9sSg;
 Mon, 25 May 2020 12:41:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590374470;
 bh=BaAn0B79Jy2TgLkZloOHn9VKVUvtuOeA2Ys3X8cindQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=U8H0joqiZ5vc9xvbtJtWIHKnkIKkxCjE8HB+GsNkb/6egoQQ+HShtohJQrpV74Z+F
 0R2j9MYi9nPLCFLiihBm9ZpoUOYDZg02bopc5/E6KwcnAOUpmdCgnwyvQ/sj/ZUI2C
 WbSwqwp+/ByS383sVtFgZDKtBNGrdwJ/TDP+8I3vsb+7aq8L+u9eQMpDAlq2bBQOjU
 fD7W1xr69r7a3QY1EnYkMp5Bzy89sBrrwto3UfAP32HrhrXcYcRI+b4RH+5h49WjwG
 5xi38LKxztbDkN0fBQ52/7hesGD7Jch/RIMtywgGUMKANNSilU+PHVpXY0PvpPx2sU
 +UC+E8eb9D+JQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v2] powerpc: Add ppc_inst_next()
In-Reply-To: <1590278278.q0bfj10pkn.astroid@bobo.none>
References: <20200522133318.1681406-1-mpe@ellerman.id.au>
 <1590277817.8ax5p94lur.astroid@bobo.none>
 <1590278278.q0bfj10pkn.astroid@bobo.none>
Date: Mon, 25 May 2020 12:41:30 +1000
Message-ID: <87k110g2hx.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: christophe.leroy@c-s.fr, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Nicholas Piggin's message of May 24, 2020 9:56 am:
>> Excerpts from Michael Ellerman's message of May 22, 2020 11:33 pm:
>>> In a few places we want to calculate the address of the next
>>> instruction. Previously that was simple, we just added 4 bytes, or if
>>> using a u32 * we incremented that pointer by 1.
>>> 
>>> But prefixed instructions make it more complicated, we need to advance
>>> by either 4 or 8 bytes depending on the actual instruction. We also
>>> can't do pointer arithmetic using struct ppc_inst, because it is
>>> always 8 bytes in size on 64-bit, even though we might only need to
>>> advance by 4 bytes.
>>> 
>>> So add a ppc_inst_next() helper which calculates the location of the
>>> next instruction, if the given instruction was located at the given
>>> address. Note the instruction doesn't need to actually be at the
>>> address in memory.
>>> 
>>> Although it would seem natural for the value to be passed by value,
>>> that makes it too easy to write a loop that will read off the end of a
>>> page, eg:
>>> 
>>> 	for (; src < end; src = ppc_inst_next(src, *src),
>>> 			  dest = ppc_inst_next(dest, *dest))
>>> 
>>> As noticed by Christophe and Jordan, if end is the exact end of a
>>> page, and the next page is not mapped, this will fault, because *dest
>>> will read 8 bytes, 4 bytes into the next page.
>>> 
>>> So value is passed by reference, so the helper can be careful to use
>>> ppc_inst_read() on it.
>>> 
>>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>> ---
>>>  arch/powerpc/include/asm/inst.h   | 13 +++++++++++++
>>>  arch/powerpc/kernel/uprobes.c     |  2 +-
>>>  arch/powerpc/lib/feature-fixups.c | 15 ++++++++-------
>>>  arch/powerpc/xmon/xmon.c          |  2 +-
>>>  4 files changed, 23 insertions(+), 9 deletions(-)
>>> 
>>> v2: Pass the value as a pointer and use ppc_inst_read() on it.
>>> 
>>> diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
>>> index d82e0c99cfa1..5b756ba77ed2 100644
>>> --- a/arch/powerpc/include/asm/inst.h
>>> +++ b/arch/powerpc/include/asm/inst.h
>>> @@ -100,6 +100,19 @@ static inline int ppc_inst_len(struct ppc_inst x)
>>>  	return ppc_inst_prefixed(x) ? 8 : 4;
>>>  }
>>>  
>>> +/*
>>> + * Return the address of the next instruction, if the instruction @value was
>>> + * located at @location.
>>> + */
>>> +static inline struct ppc_inst *ppc_inst_next(void *location, struct ppc_inst *value)
>>> +{
>>> +	struct ppc_inst tmp;
>>> +
>>> +	tmp = ppc_inst_read(value);
>>> +
>>> +	return location + ppc_inst_len(tmp);
>>> +}
>>> +
>>>  int probe_user_read_inst(struct ppc_inst *inst,
>>>  			 struct ppc_inst __user *nip);
>>>  
>>> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
>>> index 83e883e1a42d..d200e7df7167 100644
>>> --- a/arch/powerpc/kernel/uprobes.c
>>> +++ b/arch/powerpc/kernel/uprobes.c
>>> @@ -112,7 +112,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
>>>  	 * support doesn't exist and have to fix-up the next instruction
>>>  	 * to be executed.
>>>  	 */
>>> -	regs->nip = utask->vaddr + ppc_inst_len(ppc_inst_read(&auprobe->insn));
>>> +	regs->nip = (unsigned long)ppc_inst_next((void *)utask->vaddr, &auprobe->insn);
>>>  
>>>  	user_disable_single_step(current);
>>>  	return 0;
>> 
>> AFAIKS except for here, there is no need for the void *location arg.
>> 
>> I would prefer to drop that and keep this unchanged (it's a slightly 
>> special case anyway).
>
> Ooops, I didn't read the last thread. I don't think insert_bpts needs it 
> though, only this case. Anyway it's a minor nitpick so if it's already 
> been considered, fine.

There's a few places that don't need it, eg:

+       nop = ppc_inst(PPC_INST_NOP);
+       for (; dest < end; dest = ppc_inst_next(dest, &nop))
+               raw_patch_instruction(dest, nop);


But I prefer the way that reads, it's clear we're incrementing by the
length of a nop, even though we could read the nop from dest because we
just patched it.

If we ever did execute-only kernel text, it would help to have the
location and value separate too, because then reading from the text
would require a helper, but reading from data/stack would not.

So I'll go with this version.

cheers
