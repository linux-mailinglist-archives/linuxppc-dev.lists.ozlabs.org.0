Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E8451C556
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 18:48:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvKQR4HBxz3cC6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 02:48:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvKPy5MmKz3bpB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 02:48:04 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KvKPp01sFz9sSn;
 Thu,  5 May 2022 18:47:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cyhOmyycsWZl; Thu,  5 May 2022 18:47:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KvKPn66Xmz9sSk;
 Thu,  5 May 2022 18:47:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C1D138B78C;
 Thu,  5 May 2022 18:47:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZjXLIez351Rx; Thu,  5 May 2022 18:47:57 +0200 (CEST)
Received: from [192.168.202.58] (unknown [192.168.202.58])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F35A98B763;
 Thu,  5 May 2022 18:47:56 +0200 (CEST)
Message-ID: <c10a1d91-bf3e-a0d9-dd2b-05174eae6750@csgroup.eu>
Date: Thu, 5 May 2022 18:47:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 13/22] powerpc/ftrace: Use PPC_RAW_xxx() macros instead
 of opencoding.
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, Steven Rostedt <rostedt@goodmis.org>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
 <bf3b854ca8f6f5abd29a7b2d9f74a7724fe35e33.1648131740.git.christophe.leroy@csgroup.eu>
 <1650267275.b63dsc56ds.naveen@linux.ibm.com>
 <4d338e24-7801-d17c-04a4-9afd2d7f9fd8@csgroup.eu>
In-Reply-To: <4d338e24-7801-d17c-04a4-9afd2d7f9fd8@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/05/2022 à 14:39, Christophe Leroy a écrit :
> 
> 
> Le 18/04/2022 à 09:38, Naveen N. Rao a écrit :
>> Christophe Leroy wrote:
>>> PPC_RAW_xxx() macros are self explanatory and less error prone
>>> than open coding.
>>>
>>> Use them in ftrace.c
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>>   arch/powerpc/include/asm/ppc-opcode.h |  3 +++
>>>   arch/powerpc/kernel/trace/ftrace.c    | 32 +++++++++------------------
>>>   2 files changed, 14 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/ppc-opcode.h
>>> b/arch/powerpc/include/asm/ppc-opcode.h
>>> index 82f1f0041c6f..281754aca0a3 100644
>>> --- a/arch/powerpc/include/asm/ppc-opcode.h
>>> +++ b/arch/powerpc/include/asm/ppc-opcode.h
>>> @@ -294,6 +294,8 @@
>>>   #define PPC_INST_BL            0x48000001
>>>   #define PPC_INST_BRANCH_COND        0x40800000
>>>
>>> +#define PPC_INST_OFFSET24_MASK        0x03fffffc
>>
>> This corresponds to the LI field, per the ISA. See section 8.1.2/1.7:
>> 'Instruction Fields'. Would it be better to name it PPC_INST_LI_MASK?
> 
> Isn't there a risk of confusing with the 'li' instruction ? Like we
> could have PPC_INST_LI just like we have PPC_INST_ADD ?

I called it PPC_LI() and PPC_LI_MASK, similar to PPC_LO, PPC_HI etc ...

> 
> 
> 
>>
>>> +
>>>   /* Prefixes */
>>>   #define PPC_INST_LFS            0xc0000000
>>>   #define PPC_INST_STFS            0xd0000000
>>> @@ -572,6 +574,7 @@
>>>   #define PPC_RAW_EIEIO()            (0x7c0006ac)
>>>
>>>   #define PPC_RAW_BRANCH(addr)        (PPC_INST_BRANCH | ((addr) &
>>> 0x03fffffc))
>>> +#define PPC_RAW_BL(offset)        (0x48000001 | ((offset) &
>>> PPC_INST_OFFSET24_MASK))
>>>
>>>   /* Deal with instructions that older assemblers aren't aware of */
>>>   #define    PPC_BCCTR_FLUSH        stringify_in_c(.long
>>> PPC_INST_BCCTR_FLUSH)
>>> diff --git a/arch/powerpc/kernel/trace/ftrace.c
>>> b/arch/powerpc/kernel/trace/ftrace.c
>>> index fdc0412c1d8a..afb1d12838c9 100644
>>> --- a/arch/powerpc/kernel/trace/ftrace.c
>>> +++ b/arch/powerpc/kernel/trace/ftrace.c
>>> @@ -90,19 +90,19 @@ static int test_24bit_addr(unsigned long ip,
>>> unsigned long addr)
>>>
>>>   static int is_bl_op(ppc_inst_t op)
>>>   {
>>> -    return (ppc_inst_val(op) & 0xfc000003) == 0x48000001;
>>> +    return (ppc_inst_val(op) & ~PPC_INST_OFFSET24_MASK) ==
>>> PPC_RAW_BL(0);
>>>   }
>>>
>>>   static int is_b_op(ppc_inst_t op)
>>>   {
>>> -    return (ppc_inst_val(op) & 0xfc000003) == 0x48000000;
>>> +    return (ppc_inst_val(op) & ~PPC_INST_OFFSET24_MASK) ==
>>> PPC_RAW_BRANCH(0);
>>>   }
>>>
>>>   static unsigned long find_bl_target(unsigned long ip, ppc_inst_t op)
>>>   {
>>>       int offset;
>>>
>>> -    offset = (ppc_inst_val(op) & 0x03fffffc);
>>> +    offset = (ppc_inst_val(op) & PPC_INST_OFFSET24_MASK);
>>>       /* make it signed */
>>>       if (offset & 0x02000000)
>>>           offset |= 0xfe000000;
>>> @@ -182,7 +182,7 @@ __ftrace_make_nop(struct module *mod,
>>>        * Use a b +8 to jump over the load.
>>>        */
>>>
>>> -    pop = ppc_inst(PPC_INST_BRANCH | 8);    /* b +8 */
>>> +    pop = ppc_inst(PPC_RAW_BRANCH(8));    /* b +8 */
>>>
>>>       /*
>>>        * Check what is in the next instruction. We can see ld
>>> r2,40(r1), but
>>> @@ -394,17 +394,8 @@ int ftrace_make_nop(struct module *mod,
>>>   static int
>>>   expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
>>>   {
>>> -    /*
>>> -     * We expect to see:
>>> -     *
>>> -     * b +8
>>> -     * ld r2,XX(r1)
>>> -     *
>>> -     * The load offset is different depending on the ABI. For simplicity
>>> -     * just mask it out when doing the compare.
>>> -     */
>>> -    if (!ppc_inst_equal(op0, ppc_inst(0x48000008)) ||
>>> -        (ppc_inst_val(op1) & 0xffff0000) != 0xe8410000)
>>> +    if (!ppc_inst_equal(op0, ppc_inst(PPC_RAW_BRANCH(8))) ||
>>> +        !ppc_inst_equal(op1, ppc_inst(PPC_INST_LD_TOC)))
>>
>> It would be good to move PPC_INST_LD_TOC to ppc-opcode.h
> 
> It's not really just an instruction, it's closely linked to the ABI, so
> does it really belong to ppc-opcode.h ? Maybe it could be better to have
> it in ppc_asm.h instead, which already contains ABI related definitions ?
> 
> If we move it into ppc-opcode.h, then we also have to move
> R2_STACK_OFFSET. Or should we use STK_GOT defined in ppc_asm.h and drop
> R2_STACK_OFFSET ?

Looked at it in more details, looks like STK_GOT is an assembly only 
symbol, and ppc_asm.h is dedicated to ASM allthough it has recently 
leaked a bit into C.

So I propose to leave it as is and do the change in a followup patch.


> 
>>
>>>           return 0;
>>>       return 1;
>>>   }
>>> @@ -412,7 +403,6 @@ expected_nop_sequence(void *ip, ppc_inst_t op0,
>>> ppc_inst_t op1)
>>>   static int
>>>   expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
>>>   {
>>> -    /* look for patched "NOP" on ppc64 with -mprofile-kernel or ppc32 */
>>>       if (!ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP())))
>>>           return 0;
>>>       return 1;
>>> @@ -738,11 +728,11 @@ int __init ftrace_dyn_arch_init(void)
>>>       int i;
>>>       unsigned int *tramp[] = { ftrace_tramp_text, ftrace_tramp_init };
>>>       u32 stub_insns[] = {
>>> -        0xe98d0000 | PACATOC,    /* ld      r12,PACATOC(r13)    */
>>> -        0x3d8c0000,        /* addis   r12,r12,<high>    */
>>> -        0x398c0000,        /* addi    r12,r12,<low>    */
>>> -        0x7d8903a6,        /* mtctr   r12            */
>>> -        0x4e800420,        /* bctr                */
>>> +        PPC_RAW_LD(_R12, _R13, PACATOC),
>>> +        PPC_RAW_ADDIS(_R12, _R12, 0),
>>> +        PPC_RAW_ADDIS(_R12, _R12, 0),
>>
>> This should be PPC_RAW_ADDI.
>>
> 
> Oops.
> 
> Christophe
