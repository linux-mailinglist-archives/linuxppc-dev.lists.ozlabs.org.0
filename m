Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C231DB367
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 14:34:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rsd73GVnzDqhH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 22:34:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RsYk4LlszDqMp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 22:31:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49RsYk3Y9Mz8sxk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 22:31:22 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49RsYk2lZ2z9sTT; Wed, 20 May 2020 22:31:22 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49RsYg2WkVz9sTC
 for <linuxppc-dev@ozlabs.org>; Wed, 20 May 2020 22:31:10 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49RsYN5p89z9ty43;
 Wed, 20 May 2020 14:31:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id CXfrQ3zOfc6E; Wed, 20 May 2020 14:31:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49RsYN4wrZz9ty41;
 Wed, 20 May 2020 14:31:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FD8A8B7BF;
 Wed, 20 May 2020 14:31:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8DGvalozOhNz; Wed, 20 May 2020 14:31:06 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 45E648B7B9;
 Wed, 20 May 2020 14:31:05 +0200 (CEST)
Subject: Re: [PATCH] powerpc: Add ppc_inst_next()
To: Jordan Niethe <jniethe5@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20200520114446.956215-1-mpe@ellerman.id.au>
 <CACzsE9p2c2ZLny86eOEtbyoiYtSNp0kmw9KE7GdfdxhqhWwLOQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <bdbb4ce9-d4e9-d297-fba8-9a3edc3399fc@csgroup.eu>
Date: Wed, 20 May 2020 14:30:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CACzsE9p2c2ZLny86eOEtbyoiYtSNp0kmw9KE7GdfdxhqhWwLOQ@mail.gmail.com>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 20/05/2020 à 14:21, Jordan Niethe a écrit :
> On Wed, May 20, 2020 at 9:44 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> In a few places we want to calculate the address of the next
>> instruction. Previously that was simple, we just added 4 bytes, or if
>> using a u32 * we incremented that pointer by 1.
>>
>> But prefixed instructions make it more complicated, we need to advance
>> by either 4 or 8 bytes depending on the actual instruction. We also
>> can't do pointer arithmetic using struct ppc_inst, because it is
>> always 8 bytes in size on 64-bit, even though we might only need to
>> advance by 4 bytes.
>>
>> So add a ppc_inst_next() helper which calculates the location of the
>> next instruction, if the given instruction was located at the given
>> address. Note the instruction doesn't need to actually be at the
>> address in memory.
>>
>> Convert several locations to use it.
>>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>   arch/powerpc/include/asm/inst.h   |  9 +++++++++
>>   arch/powerpc/kernel/uprobes.c     |  2 +-
>>   arch/powerpc/lib/feature-fixups.c | 10 +++++-----
>>   arch/powerpc/xmon/xmon.c          |  2 +-
>>   4 files changed, 16 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
>> index d82e0c99cfa1..7d5ee1309b92 100644
>> --- a/arch/powerpc/include/asm/inst.h
>> +++ b/arch/powerpc/include/asm/inst.h
>> @@ -100,6 +100,15 @@ static inline int ppc_inst_len(struct ppc_inst x)
>>          return ppc_inst_prefixed(x) ? 8 : 4;
>>   }
>>
>> +/*
>> + * Return the address of the next instruction, if the instruction @value was
>> + * located at @location.
>> + */
>> +static inline struct ppc_inst *ppc_inst_next(void *location, struct ppc_inst value)
>> +{
>> +       return location + ppc_inst_len(value);
>> +}
> I think this is a good idea. I tried something similar in the initial
> post for an instruction type. I had:
> +#define PPC_INST_NEXT(ptr) ((ptr) += PPC_INST_LEN(DEREF_PPC_INST_PTR((ptr))))
> but how you've got it is much more clear/usable.

Yes I agree

> I wonder why not
> +static inline struct ppc_inst *ppc_inst_next(void *location)
> +{
> +       return location + ppc_inst_len(ppc_inst_read((struct ppc_inst
> *)location);
> +}

Because as Michael explains, the instruction to be skipped might not yet 
be at the pointed memory location (for instance in insert_bpts() )

> 
>> +
>>   int probe_user_read_inst(struct ppc_inst *inst,
>>                           struct ppc_inst __user *nip);
>>
>> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
>> index 83e883e1a42d..683ba76919a7 100644
>> --- a/arch/powerpc/kernel/uprobes.c
>> +++ b/arch/powerpc/kernel/uprobes.c
>> @@ -112,7 +112,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
>>           * support doesn't exist and have to fix-up the next instruction
>>           * to be executed.
>>           */
>> -       regs->nip = utask->vaddr + ppc_inst_len(ppc_inst_read(&auprobe->insn));
>> +       regs->nip = (unsigned long)ppc_inst_next((void *)utask->vaddr, auprobe->insn);
>>
>>          user_disable_single_step(current);
>>          return 0;
>> diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
>> index 80f320c2e189..0ad01eebf112 100644
>> --- a/arch/powerpc/lib/feature-fixups.c
>> +++ b/arch/powerpc/lib/feature-fixups.c
>> @@ -84,13 +84,13 @@ static int patch_feature_section(unsigned long value, struct fixup_entry *fcur)
>>          src = alt_start;
>>          dest = start;
>>
>> -       for (; src < alt_end; src = (void *)src + ppc_inst_len(ppc_inst_read(src)),
>> -            (dest = (void *)dest + ppc_inst_len(ppc_inst_read(dest)))) {
>> +       for (; src < alt_end; src = ppc_inst_next(src, *src),
>> +                             dest = ppc_inst_next(dest, *dest)) {
> The reason to maybe use ppc_inst_read() in the helper instead of just
> *dest would be we don't always need to read 8 bytes.

And reading 8 bytes might trigger a page fault if we are reading the 
very last non prefixed instruction of the last page.

>>                  if (patch_alt_instruction(src, dest, alt_start, alt_end))
>>                          return 1;
>>          }
>>
>> -       for (; dest < end; dest = (void *)dest + ppc_inst_len(ppc_inst(PPC_INST_NOP)))
>> +       for (; dest < end; dest = ppc_inst_next(dest, ppc_inst(PPC_INST_NOP)))
> But then you wouldn't be able to do this as easily I guess.
>>                  raw_patch_instruction(dest, ppc_inst(PPC_INST_NOP));
>>
>>          return 0;
>> @@ -405,8 +405,8 @@ static void do_final_fixups(void)
>>          while (src < end) {
>>                  inst = ppc_inst_read(src);
>>                  raw_patch_instruction(dest, inst);
>> -               src = (void *)src + ppc_inst_len(inst);
>> -               dest = (void *)dest + ppc_inst_len(inst);
>> +               src = ppc_inst_next(src, *src);
>> +               dest = ppc_inst_next(dest, *dest);
>>          }
>>   #endif
>>   }
>> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
>> index fb135f2cd6b0..aa123f56b7d4 100644
>> --- a/arch/powerpc/xmon/xmon.c
>> +++ b/arch/powerpc/xmon/xmon.c
>> @@ -939,7 +939,7 @@ static void insert_bpts(void)
>>                  }
>>
>>                  patch_instruction(bp->instr, instr);
>> -               patch_instruction((void *)bp->instr + ppc_inst_len(instr),
>> +               patch_instruction(ppc_inst_next(bp->instr, instr),
>>                                    ppc_inst(bpinstr));
>>                  if (bp->enabled & BP_CIABR)
>>                          continue;
>> --
>> 2.25.1
>>

Christophe
