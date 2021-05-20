Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A28D238B054
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 15:47:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm9zd4p6bz3bsg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 23:47:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm9zG4rlTz2yXR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 23:47:34 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fm9z66Tqqz9skP;
 Thu, 20 May 2021 15:47:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ozqqUpZeOOu; Thu, 20 May 2021 15:47:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fm9z65YZDz9skN;
 Thu, 20 May 2021 15:47:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9EE318B808;
 Thu, 20 May 2021 15:47:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id K2nJQd2ClYP4; Thu, 20 May 2021 15:47:30 +0200 (CEST)
Received: from [172.25.230.105] (po15451.idsi0.si.c-s.fr [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 74AFE8B767;
 Thu, 20 May 2021 15:47:30 +0200 (CEST)
Subject: Re: [PATCH] powerpc/kprobes: Pass ppc_inst as a pointer to
 emulate_step() on ppc32
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20210520072909.2901326-1-naveen.n.rao@linux.vnet.ibm.com>
 <8a0cfd88-a98d-711c-b80b-916a99ada2c8@csgroup.eu>
 <1621507675.1o3860b85w.naveen@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <cb7d49dc-3980-2d2b-ee4e-480b89a04b0a@csgroup.eu>
Date: Thu, 20 May 2021 14:55:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1621507675.1o3860b85w.naveen@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 20/05/2021 à 12:54, Naveen N. Rao a écrit :
> Christophe Leroy wrote:
>>
>>
>> Le 20/05/2021 à 09:29, Naveen N. Rao a écrit :
>>> Trying to use a kprobe on ppc32 results in the below splat:
>>>      BUG: Unable to handle kernel data access on read at 0x7c0802a6
>>>      Faulting instruction address: 0xc002e9f0
>>>      Oops: Kernel access of bad area, sig: 11 [#1]
>>>      BE PAGE_SIZE=4K PowerPC 44x Platform
>>>      Modules linked in:
>>>      CPU: 0 PID: 89 Comm: sh Not tainted 5.13.0-rc1-01824-g3a81c0495fdb #7
>>>      NIP:  c002e9f0 LR: c0011858 CTR: 00008a47
>>>      REGS: c292fd50 TRAP: 0300   Not tainted  (5.13.0-rc1-01824-g3a81c0495fdb)
>>>      MSR:  00009000 <EE,ME>  CR: 24002002  XER: 20000000
>>>      DEAR: 7c0802a6 ESR: 00000000
>>>      <snip>
>>>      NIP [c002e9f0] emulate_step+0x28/0x324
>>>      LR [c0011858] optinsn_slot+0x128/0x10000
>>>      Call Trace:
>>>       opt_pre_handler+0x7c/0xb4 (unreliable)
>>>       optinsn_slot+0x128/0x10000
>>>       ret_from_syscall+0x0/0x28
>>
>> I remember running some kprobe tests before submitting the patch, how did I miss that ?
>> Is there anything special to do to activate the use of optprobes and/or to hit this bug ?
> 
> Yeah, I was surprised when I hit this. One of the requirements we have for optprobes on powerpc is 
> that the instruction should be a compute instruction (no load/store -- emulate_update_regs() should 
> be enough) with the exception of conditional branches. It's possible that you ended up probing an 
> instruction that couldn't be optimized.
> 
> An easy way to confirm if a probe has been optimized is to look at kprobes/list in debugfs, and to 
> watch out for [OPTIMIZED] flag there.
> 
>>> diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
>>> index cdf87086fa33a0..2bc53fa48a1b33 100644
>>> --- a/arch/powerpc/kernel/optprobes.c
>>> +++ b/arch/powerpc/kernel/optprobes.c
>>> @@ -281,8 +281,12 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe 
>>> *p)
>>>       /*
>>>        * 3. load instruction to be emulated into relevant register, and
>>>        */
>>> -    temp = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
>>> -    patch_imm_load_insns(ppc_inst_as_ulong(temp), 4, buff + TMPL_INSN_IDX);
>>> +    if (IS_ENABLED(CONFIG_PPC64)) {
>>> +        temp = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
>>> +        patch_imm_load_insns(ppc_inst_as_ulong(temp), 4, buff + TMPL_INSN_IDX);
>>> +    } else {
>>> +        patch_imm_load_insns((unsigned long)p->ainsn.insn, 4, buff + TMPL_INSN_IDX);
>>> +    }
>>
>> It means commit https://github.com/linuxppc/linux/commit/693557ebf407a85ea400a0b501bb97687d8f4856 
>> was not necessary and may be reverted.
> 
> Indeed, I will send a revert for it.
> 

I'm not completely sure it is worth reverting, on an other hand it is pointless anyway to have 
something to convert to a u64 something that cannot be more than 32 bits on a PPC32, so now that we 
have ppc_inst_as_ulong() it is as good I think.

Christophe
