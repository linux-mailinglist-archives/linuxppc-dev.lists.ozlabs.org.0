Return-Path: <linuxppc-dev+bounces-6423-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D84A421D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 14:50:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1hv63DZwz3057;
	Tue, 25 Feb 2025 00:50:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740405010;
	cv=none; b=KF+NsOFZ6nMjfCroAri6BbI258wPplXBj/d023I/UY8mCJfb6vY9ecdN/RbLlm+RITTh5rhau7ILhuoXfehVIQuKMpzT5HNorN9ItDL5hi+u6POU2pLAViJ67t+pM+T/lOeMNwQEtYsPHoJYVIsYAQUBiykuWIinWQXwVrcN0zHDrAcdGPn7hy7RSShzwmVRrtxjGHLq8Y540imeZucChSJCfXHr1oCckV6XoVOK4QWm1psmYWXz9X+b7pVm7Csu/2PBOHSy9F7hTkrFKilLLSZYckFtjbUlKUawD1fiLRbQqhNKpGXK5B5PBbGGuPFOKzdqBF+6mpYEncO/DPAu+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740405010; c=relaxed/relaxed;
	bh=mkUojayzpSNR2fWWyQu+4+EMVQxfuayXZ2muUc8nSok=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=d6koh3P/gmTqHILBMSqOPv8Kh8S7q0+5Rwovp/Z0fsX2tj7srNvixrzqLOF4eo64I1/HzGC9FxZcQuuyHvVF/n40W9ZPFsG6OXqG4NJDxkLEbts4yYm+dvsc2k4WefN7bOi/yU22eOQV2S4SSulsQXKDMj36Z4Kg70JQP9RwZ8kjxNL4zFl1fhyrYAGWpj/fo73HgNrJLbExu4biOM8ZJj2qsfsepK7eDMfyDKgDCTKTx5nMCYWZLxs6yMwzg4Mw4WF/nzE8JPJQqCPzY1fdGE10+H4+T22BpuEws4V/VB5S4fIjiEbJDmbAXncIYd9MRMb8KGU2EMcr98opnL3Ibg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1hv54D0Vz3050
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 00:50:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z1hCR2KX7z9sVs;
	Mon, 24 Feb 2025 14:19:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id elqyD67td6jR; Mon, 24 Feb 2025 14:19:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z1hCR1Gpgz9sVq;
	Mon, 24 Feb 2025 14:19:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 18CEC8B77C;
	Mon, 24 Feb 2025 14:19:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id PKWx441hCHAv; Mon, 24 Feb 2025 14:19:14 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CBC498B765;
	Mon, 24 Feb 2025 14:19:14 +0100 (CET)
Message-ID: <8f4ec6d4-2646-4a87-b3a1-edfaecff2a01@csgroup.eu>
Date: Mon, 24 Feb 2025 14:19:14 +0100
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
Subject: Re: [RFC PATCH] objtool: Skip unannotated intra-function call warning
 for bl+mflr pattern
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, jpoimboe@kernel.org,
 peterz@infradead.org, npiggin@gmail.com, maddy@linux.ibm.com,
 Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 llvm@lists.linux.dev
References: <20250219162014.10334-1-sv@linux.ibm.com>
 <3223ec0e-c445-4bbf-ae72-276688e40908@csgroup.eu>
 <d5ada017-1ba2-4a89-8a58-4555f09f9d97@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <d5ada017-1ba2-4a89-8a58-4555f09f9d97@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 24/02/2025 à 11:33, Christophe Leroy a écrit :
> 
> 
> Le 24/02/2025 à 08:15, Christophe Leroy a écrit :
>>
>>
>> Le 19/02/2025 à 17:20, Sathvika Vasireddy a écrit :
>>> Architectures like PowerPC use a pattern where the compiler generates a
>>> branch-and-link (bl) instruction that targets the very next instruction,
>>> followed by loading the link register (mflr) later. This pattern appears
>>> in the code like:
>>>
>>>   bl .+4
>>>   li r5,0
>>>   mflr r30
>>
>> What compiler do you use ? Is it a very old version of GCC ?
> 
> Oh, I see that this is a report on a projet version of clang ? compiler: 
> clang version 21.0.0git
> 
> Then I guess the bug needs to be fixed in Clang, not in the kernel.

Well, this problem already exists on clang 18 it seems:

00000004 <btext_map>:
    4:   7c 08 02 a6     mflr    r0
    8:   94 21 ff e0     stwu    r1,-32(r1)
    c:   93 c1 00 18     stw     r30,24(r1)
   10:   90 01 00 24     stw     r0,36(r1)
   14:   93 a1 00 14     stw     r29,20(r1)
   18:   48 00 00 05     bl      1c <btext_map+0x18>
   1c:   38 a0 00 00     li      r5,0
   20:   7f c8 02 a6     mflr    r30

While GCC generates:

00000418 <btext_map>:
  418:   94 21 ff e0     stwu    r1,-32(r1)
  41c:   7c 08 02 a6     mflr    r0
  420:   42 9f 00 05     bcl     20,4*cr7+so,424 <btext_map+0xc>
  424:   39 20 00 00     li      r9,0
  428:   93 c1 00 18     stw     r30,24(r1)
  42c:   7f c8 02 a6     mflr    r30

So lets make the kernel tolerate it allthough it should be fixed on 
clang at the end.

I can't find any related issue in the clang issues database 
(https://github.com/llvm/llvm-project/issues), should we open one ?

Christophe

> 
>>
>> That sequence is not correct and should never be used by modern 
>> compilers. It should be bcl 20,31,+4 instead.
>>
>> All such hand writen sequences have been removed from kernel assembly, 
>> see commit c974809a26a1 ("powerpc/vdso: Avoid link stack corruption in 
>> __get_datapage()") for details
>>
>>
>>>
>>> Objtool currently warns about this as an "unannotated intra-function
>>> call" because find_call_destination() fails to find any symbol at the
>>> target offset. Add a check to skip the warning when a branch targets
>>> the immediate next instruction in the same function.
>>
>> I think this should be done in arch_decode_instruction(), just set 
>> insn-  >type to INSN_OTHER when you see bl .+4
>>
>> Something like:
>>
>> diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/ 
>> powerpc/decode.c
>> index 53b55690f320..ca264c97ee8d 100644
>> --- a/tools/objtool/arch/powerpc/decode.c
>> +++ b/tools/objtool/arch/powerpc/decode.c
>> @@ -55,7 +55,9 @@ int arch_decode_instruction(struct objtool_file 
>> *file, const struct section *sec
>>
>>       switch (opcode) {
>>       case 18: /* b[l][a] */
>> -        if ((ins & 3) == 1) /* bl */
>> +        if (ins == 0x48000005)    /* bl .+4 */
>> +            typ = INSN_OTHER;
>> +        else if ((ins & 3) == 1) /* bl */
>>               typ = INSN_CALL;
>>
>>           imm = ins & 0x3fffffc;
>>
>>
>>
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202502180818.XnFdv8I8- 
>>> lkp@intel.com/
>>> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
>>> ---
>>>   tools/objtool/check.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
>>> index 753dbc4f8198..3f7cf2c917b5 100644
>>> --- a/tools/objtool/check.c
>>> +++ b/tools/objtool/check.c
>>> @@ -1613,6 +1613,7 @@ static struct symbol 
>>> *find_call_destination(struct section *sec, unsigned long o
>>>    */
>>>   static int add_call_destinations(struct objtool_file *file)
>>>   {
>>> +       struct instruction *next_insn;
>>>          struct instruction *insn;
>>>          unsigned long dest_off;
>>>          struct symbol *dest;
>>> @@ -1625,6 +1626,11 @@ static int add_call_destinations(struct 
>>> objtool_file *file)
>>>                  reloc = insn_reloc(file, insn);
>>>                  if (!reloc) {
>>>                          dest_off = arch_jump_destination(insn);
>>> +
>>> +                       next_insn = next_insn_same_func(file, insn);
>>> +                       if (next_insn && dest_off == next_insn->offset)
>>> +                               continue;
>>> +
>>>                          dest = find_call_destination(insn->sec, 
>>> dest_off);
>>>
>>>                          add_call_dest(file, insn, dest, false);
>>> -- 
>>> 2.39.3
>>>
>>
> 


