Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B999D127561
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 06:42:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fHgn5GMRzDqwF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 16:42:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="dHozW+Yk"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fHdh0BNwzDqnG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2019 16:40:22 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47fHdY0tnYz9tykw;
 Fri, 20 Dec 2019 06:40:17 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=dHozW+Yk; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sZmpJsd6kgbs; Fri, 20 Dec 2019 06:40:17 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47fHdX6nfPz9tykv;
 Fri, 20 Dec 2019 06:40:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1576820416; bh=8SugJoEhPEIECSLQJy27tVB+lo/op3pM7Fng02vuC1A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dHozW+YkePlP5wqAiuuUJSwWhGBzN8LKtH17Syt9RDitFBt30AftCe2Oh5oOQ5xHX
 mvFVUL666gAZc9tpcFslB15da+gs6Zdh6TWgqyPnjKgjf5bMCdc1rLbperHiR1D7za
 PmvOEeqGQs4xo2lgg11uKbeEvXo98cWaQAn+6g8U=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A9A928B7B5;
 Fri, 20 Dec 2019 06:40:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xAgyL1GSRdmJ; Fri, 20 Dec 2019 06:40:17 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1E89E8B764;
 Fri, 20 Dec 2019 06:40:17 +0100 (CET)
Subject: Re: [PATCH 05/18] powerpc sstep: Prepare to support prefixed
 instructions
To: Jordan Niethe <jniethe5@gmail.com>, Daniel Axtens <dja@axtens.net>
References: <20191126052141.28009-1-jniethe5@gmail.com>
 <20191126052141.28009-6-jniethe5@gmail.com>
 <87sglit4ig.fsf@dja-thinkpad.axtens.net>
 <CACzsE9qkjUPhFoV3tdVWdmVRPyXdGZUka3bu8DB6T51HH2opUw@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <ea6c5331-2c9a-3504-40af-0ad6a0f93d7f@c-s.fr>
Date: Fri, 20 Dec 2019 06:40:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CACzsE9qkjUPhFoV3tdVWdmVRPyXdGZUka3bu8DB6T51HH2opUw@mail.gmail.com>
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
Cc: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 20/12/2019 à 06:11, Jordan Niethe a écrit :
> On Wed, Dec 18, 2019 at 7:35 PM Daniel Axtens <dja@axtens.net> wrote:
>>
>> Jordan Niethe <jniethe5@gmail.com> writes:
>>
>>> Currently all instructions are a single word long. A future ISA version
>>> will include prefixed instructions which have a double word length. The
>>> functions used for analysing and emulating instructions need to be
>>> modified so that they can handle these new instruction types.
>>>
>>> A prefixed instruction is a word prefix followed by a word suffix. All
>>> prefixes uniquely have the primary op-code 1. Suffixes may be valid word
>>> instructions or instructions that only exist as suffixes.
>>>
>>> In handling prefixed instructions it will be convenient to treat the
>>> suffix and prefix as separate words. To facilitate this modify
>>> analyse_instr() and emulate_step() to take a take a suffix as a
>>> parameter. For word instructions it does not matter what is passed in
>>> here - it will be ignored.
>>>
>>> We also define a new flag, PREFIXED, to be used in instruction_op:type.
>>> This flag will indicate when emulating an analysed instruction if the
>>> NIP should be advanced by word length or double word length.
>>>
>>> The callers of analyse_instr() and emulate_step() will need their own
>>> changes to be able to support prefixed instructions. For now modify them
>>> to pass in 0 as a suffix.
>>>
>>> Note that at this point no prefixed instructions are emulated or
>>> analysed - this is just making it possible to do so.
>>>
>>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>>> ---
>>>   arch/powerpc/include/asm/ppc-opcode.h |  3 +++
>>>   arch/powerpc/include/asm/sstep.h      |  8 +++++--
>>>   arch/powerpc/include/asm/uaccess.h    | 30 +++++++++++++++++++++++++++
>>>   arch/powerpc/kernel/align.c           |  2 +-
>>>   arch/powerpc/kernel/hw_breakpoint.c   |  4 ++--
>>>   arch/powerpc/kernel/kprobes.c         |  2 +-
>>>   arch/powerpc/kernel/mce_power.c       |  2 +-
>>>   arch/powerpc/kernel/optprobes.c       |  2 +-
>>>   arch/powerpc/kernel/uprobes.c         |  2 +-
>>>   arch/powerpc/kvm/emulate_loadstore.c  |  2 +-
>>>   arch/powerpc/lib/sstep.c              | 12 ++++++-----
>>>   arch/powerpc/lib/test_emulate_step.c  | 30 +++++++++++++--------------
>>>   arch/powerpc/xmon/xmon.c              |  4 ++--
>>>   13 files changed, 71 insertions(+), 32 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
>>> index c1df75edde44..a1dfa4bdd22f 100644
>>> --- a/arch/powerpc/include/asm/ppc-opcode.h
>>> +++ b/arch/powerpc/include/asm/ppc-opcode.h
>>> @@ -377,6 +377,9 @@
>>>   #define PPC_INST_VCMPEQUD            0x100000c7
>>>   #define PPC_INST_VCMPEQUB            0x10000006
>>>
>>> +/* macro to check if a word is a prefix */
>>> +#define IS_PREFIX(x) (((x) >> 26) == 1)
>>> +
>>>   /* macros to insert fields into opcodes */
>>>   #define ___PPC_RA(a) (((a) & 0x1f) << 16)
>>>   #define ___PPC_RB(b) (((b) & 0x1f) << 11)
>>> diff --git a/arch/powerpc/include/asm/sstep.h b/arch/powerpc/include/asm/sstep.h
>>> index 769f055509c9..6d4cb602e231 100644
>>> --- a/arch/powerpc/include/asm/sstep.h
>>> +++ b/arch/powerpc/include/asm/sstep.h
>>> @@ -89,6 +89,9 @@ enum instruction_type {
>>>   #define VSX_LDLEFT   4       /* load VSX register from left */
>>>   #define VSX_CHECK_VEC        8       /* check MSR_VEC not MSR_VSX for reg >= 32 */
>>>
>>> +/* Prefixed flag, ORed in with type */
>>> +#define PREFIXED     0x800
>>> +
>>>   /* Size field in type word */
>>>   #define SIZE(n)              ((n) << 12)
>>>   #define GETSIZE(w)   ((w) >> 12)
>>> @@ -132,7 +135,7 @@ union vsx_reg {
>>>    * otherwise.
>>>    */
>>>   extern int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>>> -                      unsigned int instr);
>>> +                      unsigned int instr, unsigned int sufx);
>>>
>>>   /*
>>>    * Emulate an instruction that can be executed just by updating
>>> @@ -149,7 +152,8 @@ void emulate_update_regs(struct pt_regs *reg, struct instruction_op *op);
>>>    * 0 if it could not be emulated, or -1 for an instruction that
>>>    * should not be emulated (rfid, mtmsrd clearing MSR_RI, etc.).
>>>    */
>>> -extern int emulate_step(struct pt_regs *regs, unsigned int instr);
>>> +extern int emulate_step(struct pt_regs *regs, unsigned int instr,
>>> +                     unsigned int sufx);
>>>
>>>   /*
>>>    * Emulate a load or store instruction by reading/writing the
>>> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
>>> index 15002b51ff18..bc585399e0c7 100644
>>> --- a/arch/powerpc/include/asm/uaccess.h
>>> +++ b/arch/powerpc/include/asm/uaccess.h
>>> @@ -423,4 +423,34 @@ extern long __copy_from_user_flushcache(void *dst, const void __user *src,
>>>   extern void memcpy_page_flushcache(char *to, struct page *page, size_t offset,
>>>                           size_t len);
>>>
>>> +/*
>>> + * When reading an instruction iff it is a prefix, the suffix needs to be also
>>> + * loaded.
>>> + */
>>> +#define __get_user_instr(x, y, ptr)                  \
>>> +({                                                   \
>>> +     long __gui_ret = 0;                             \
>>> +     y = 0;                                          \
>>> +     __gui_ret = __get_user(x, ptr);                 \
>>> +     if (!__gui_ret) {                               \
>>> +             if (IS_PREFIX(x))                       \
>>> +                     __gui_ret = __get_user(y, ptr + 1);     \
>>> +     }                                               \
>>> +                                                     \
>>> +     __gui_ret;                                      \
>>> +})
>>> +
>>> +#define __get_user_instr_inatomic(x, y, ptr)         \
>>> +({                                                   \
>>> +     long __gui_ret = 0;                             \
>>> +     y = 0;                                          \
>>> +     __gui_ret = __get_user_inatomic(x, ptr);        \
>>> +     if (!__gui_ret) {                               \
>>> +             if (IS_PREFIX(x))                       \
>>> +                     __gui_ret = __get_user_inatomic(y, ptr + 1);    \
>>> +     }                                               \
>>> +                                                     \
>>> +     __gui_ret;                                      \
>>> +})
>>> +
>>>   #endif       /* _ARCH_POWERPC_UACCESS_H */
>>> diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
>>> index 92045ed64976..245e79792a01 100644
>>> --- a/arch/powerpc/kernel/align.c
>>> +++ b/arch/powerpc/kernel/align.c
>>> @@ -334,7 +334,7 @@ int fix_alignment(struct pt_regs *regs)
>>>        if ((instr & 0xfc0006fe) == (PPC_INST_COPY & 0xfc0006fe))
>>>                return -EIO;
>>>
>>> -     r = analyse_instr(&op, regs, instr);
>>> +     r = analyse_instr(&op, regs, instr, 0);
>>>        if (r < 0)
>>>                return -EINVAL;
>>>
>>> diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
>>> index 58ce3d37c2a3..f4530961998c 100644
>>> --- a/arch/powerpc/kernel/hw_breakpoint.c
>>> +++ b/arch/powerpc/kernel/hw_breakpoint.c
>>> @@ -248,7 +248,7 @@ static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
>>>        if (__get_user_inatomic(instr, (unsigned int *)regs->nip))
>>>                goto fail;
>>>
>>> -     ret = analyse_instr(&op, regs, instr);
>>> +     ret = analyse_instr(&op, regs, instr, 0);
>>>        type = GETTYPE(op.type);
>>>        size = GETSIZE(op.type);
>>>
>>> @@ -272,7 +272,7 @@ static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
>>>                return false;
>>>        }
>>>
>>> -     if (!emulate_step(regs, instr))
>>> +     if (!emulate_step(regs, instr, 0))
>>>                goto fail;
>>>
>>>        return true;
>>> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
>>> index 2d27ec4feee4..7303fe3856cc 100644
>>> --- a/arch/powerpc/kernel/kprobes.c
>>> +++ b/arch/powerpc/kernel/kprobes.c
>>> @@ -219,7 +219,7 @@ static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
>>>        unsigned int insn = *p->ainsn.insn;
>>>
>>>        /* regs->nip is also adjusted if emulate_step returns 1 */
>>> -     ret = emulate_step(regs, insn);
>>> +     ret = emulate_step(regs, insn, 0);
>>>        if (ret > 0) {
>>>                /*
>>>                 * Once this instruction has been boosted
>>> diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
>>> index 1cbf7f1a4e3d..d862bb549158 100644
>>> --- a/arch/powerpc/kernel/mce_power.c
>>> +++ b/arch/powerpc/kernel/mce_power.c
>>> @@ -374,7 +374,7 @@ static int mce_find_instr_ea_and_phys(struct pt_regs *regs, uint64_t *addr,
>>>        if (pfn != ULONG_MAX) {
>>>                instr_addr = (pfn << PAGE_SHIFT) + (regs->nip & ~PAGE_MASK);
>>>                instr = *(unsigned int *)(instr_addr);
>>> -             if (!analyse_instr(&op, &tmp, instr)) {
>>> +             if (!analyse_instr(&op, &tmp, instr, 0)) {
>>>                        pfn = addr_to_pfn(regs, op.ea);
>>>                        *addr = op.ea;
>>>                        *phys_addr = (pfn << PAGE_SHIFT);
>>> diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
>>> index 024f7aad1952..82dc8a589c87 100644
>>> --- a/arch/powerpc/kernel/optprobes.c
>>> +++ b/arch/powerpc/kernel/optprobes.c
>>> @@ -100,7 +100,7 @@ static unsigned long can_optimize(struct kprobe *p)
>>>         * and that can be emulated.
>>>         */
>>>        if (!is_conditional_branch(*p->ainsn.insn) &&
>>> -                     analyse_instr(&op, &regs, *p->ainsn.insn) == 1) {
>>> +                     analyse_instr(&op, &regs, *p->ainsn.insn, 0) == 1) {
>>>                emulate_update_regs(&regs, &op);
>>>                nip = regs.nip;
>>>        }
>>> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
>>> index 1cfef0e5fec5..ab1077dc6148 100644
>>> --- a/arch/powerpc/kernel/uprobes.c
>>> +++ b/arch/powerpc/kernel/uprobes.c
>>> @@ -173,7 +173,7 @@ bool arch_uprobe_skip_sstep(struct arch_uprobe *auprobe, struct pt_regs *regs)
>>>         * emulate_step() returns 1 if the insn was successfully emulated.
>>>         * For all other cases, we need to single-step in hardware.
>>>         */
>>> -     ret = emulate_step(regs, auprobe->insn);
>>> +     ret = emulate_step(regs, auprobe->insn, 0);
>>>        if (ret > 0)
>>>                return true;
>>>
>>> diff --git a/arch/powerpc/kvm/emulate_loadstore.c b/arch/powerpc/kvm/emulate_loadstore.c
>>> index 2e496eb86e94..fcab1f31b48d 100644
>>> --- a/arch/powerpc/kvm/emulate_loadstore.c
>>> +++ b/arch/powerpc/kvm/emulate_loadstore.c
>>> @@ -100,7 +100,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
>>>
>>>        emulated = EMULATE_FAIL;
>>>        vcpu->arch.regs.msr = vcpu->arch.shared->msr;
>>> -     if (analyse_instr(&op, &vcpu->arch.regs, inst) == 0) {
>>> +     if (analyse_instr(&op, &vcpu->arch.regs, inst, 0) == 0) {
>>>                int type = op.type & INSTR_TYPE_MASK;
>>>                int size = GETSIZE(op.type);
>>>
>>> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
>>> index c077acb983a1..ade3f5eba2e5 100644
>>> --- a/arch/powerpc/lib/sstep.c
>>> +++ b/arch/powerpc/lib/sstep.c
>>> @@ -1163,7 +1163,7 @@ static nokprobe_inline int trap_compare(long v1, long v2)
>>>    * otherwise.
>>>    */
>>>   int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>>> -               unsigned int instr)
>>> +               unsigned int instr, unsigned int sufx)
>>
>> I know we really like shortenings in arch/powerpc, but I think we can
>> afford the two extra characters to spell 'suffix' in full :)
>>
> 'suffix' was what I used initially but somewhere along the line
> I found it looked unbalanced to see the abbreviation inst{r,} in the same
> context as the unabbreviated 'suffix'. Happy to change it if it is clearer.
> 

I guess 'instruction' is pretty long, while 'suffix' is half the length. 
In addition, 'instr' is rather common while 'suffix' is quite new.
So I agree it would be clearer to keep 'suffix'.

Christophe
