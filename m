Return-Path: <linuxppc-dev+bounces-6710-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D15AA4E9D5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 18:50:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6jrH0P7Kz2ydW;
	Wed,  5 Mar 2025 04:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741110607;
	cv=none; b=WzfvrQBEnbp4REyyvTwzEtLUl6/hjwBVeuwpwSY1OY/LWhL9HMUxHNIje9vB2k5e2U5kBVofmZXjHaJOpmuhU78FUC2RKYEKWLarPOYhJcn4jk2o2ul1BFQvaSOyRVTrfBlXPmRg5+UyNbNV62Oe276hJtEEL1/wHRQiG2+4mCUasFjW/tx0meiiMy80r+pfkVCiO0JHoLeaLu3veR6Gqlz6lLfETDJVVYufzyuMQZMtvJ1IZFQvqXttJKgx3nqq8eDByb0nPkcRHvIxohDvnLwnJ8ymedjhAPzGlKL1HzUIMyJNHnT9e0CbBlE/03n2VwEqJSmg+CpQxoYE2UgaBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741110607; c=relaxed/relaxed;
	bh=FmjPxpMcXn/07MtH71bhC228KRWXmxzAb+0hf4MnBEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SSmeK2dJYY55Vwec7zbOYXTRqSC9gXUQ3hoIZl92+RZ3lz2UQSv+EQZhof+GoSMbGZ5tb7pZfwrq7CrX+IRiFrgz+xTkFT3o5LhQ0JYWYrSiKDB8qdcrzf5eoUfD7i50RBIe61nLfL4tVddGsdayZ/JGVSUcJuUf1vwn+vuUUvXvup3ylszU+LqF7w7WoKAryNae/xV+nx77PQPzXj7YoEehrTmTYhzTSJgIwPH1Ru6RrB25gcU7xFo0pwocay0arizJxayx+anUPojDeDQxu6GVuP2wyN+qxbuNTulxJAt4kRkuainSSxhd9AD7jLgtIqX2Gs1f2c/I9fx6K8xFqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6jrG0P6Lz2yMD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 04:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z6j6m6FW5z9st7;
	Tue,  4 Mar 2025 18:17:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F0bJ3kJcU-Nk; Tue,  4 Mar 2025 18:17:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z6j6j6Kg0z9st8;
	Tue,  4 Mar 2025 18:17:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C60298B774;
	Tue,  4 Mar 2025 18:17:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id nxD_0adB2Hhy; Tue,  4 Mar 2025 18:17:33 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 784158B763;
	Tue,  4 Mar 2025 18:17:32 +0100 (CET)
Message-ID: <2d535b7e-3f84-4e51-9db2-288cacf40aad@csgroup.eu>
Date: Tue, 4 Mar 2025 18:17:31 +0100
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
Subject: Re: Build Warnings at arch/powerpc/
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, Danny Tsen <dtsen@linux.ibm.com>
References: <8c4c3fc2-2bd7-4148-af68-2f504d6119e0@linux.ibm.com>
 <47aa8b75-96b6-4e37-bb62-ad758b414076@linux.ibm.com>
 <8ba544e7-cf2a-4807-a056-683115805721@csgroup.eu>
 <bfcce9ce-bc26-4088-8d27-0797fc0d22d3@linux.ibm.com>
 <fe937273-d81a-4f6c-9eba-b96b711b4644@linux.ibm.com>
 <988cb994-d8b1-4688-b926-66507ebe90df@linux.ibm.com>
 <a8336412-7b66-447e-9a90-1a376960cd4c@csgroup.eu>
 <461ad118-a56d-414e-a15e-5ffc10fed4c8@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <461ad118-a56d-414e-a15e-5ffc10fed4c8@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 04/03/2025 à 16:44, Venkat Rao Bagalkote a écrit :
> Hello Christophe,
> 
> 
> On 04/03/25 6:43 pm, Christophe Leroy wrote:
>>
>>
>> Le 04/03/2025 à 14:03, Venkat Rao Bagalkote a écrit :
>>> [Vous ne recevez pas souvent de courriers de venkat88@linux.ibm.com. 
>>> Découvrez pourquoi ceci est important à https:// 
>>> eur01.safelinks.protection.outlook.com/? 
>>> url=https%3A%2F%2Faka.ms%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C3657f07f71b149ba489e08dd5b336e9a%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638766998669498918%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=ZM65b%2F3BuUDy5Iet3kE1%2B%2BXKdjmM86UFsJwBmSHeiv4%3D&reserved=0 LearnAboutSenderIdentification ]
>>>
>>> On 04/03/25 6:08 pm, Madhavan Srinivasan wrote:
>>>>
>>>> On 3/4/25 4:58 PM, Madhavan Srinivasan wrote:
>>>>>
>>>>> On 3/4/25 2:26 PM, Christophe Leroy wrote:
>>>>>>
>>>>>> Le 04/03/2025 à 07:13, Madhavan Srinivasan a écrit :
>>>>>>>
>>>>>>> On 3/4/25 10:42 AM, Venkat Rao Bagalkote wrote:
>>>>>>>> Greetings!!
>>>>>>>>
>>>>>>>>
>>>>>>>> Observing build warnings with linux-next and powerpc repo's. 
>>>>>>>> Issue is currently not seen on mainline yet.
>>>>>>>>
>>>>>>>> PPC Repo: https://eur01.safelinks.protection.outlook.com/? 
>>>>>>>> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpowerpc%2Flinux.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6e17cc771a204b2998b508dd5b1cf2cf%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638766902127463526%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=f0ubC0BiY%2Fw2XLfXcX955JKhJ%2BRkUmTUVO4fV%2F%2F4v2Y%3D&reserved=0 merge branch
>>>>>>>>
>>>>>>>> PPC Kernel Version: 6.14.0-rc4-g1304f486dbf1
>>>>>>>> next Repo: https://eur01.safelinks.protection.outlook.com/? 
>>>>>>>> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-next.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6e17cc771a204b2998b508dd5b1cf2cf%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638766902127477000%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=GSDtRBQ35owCeEpjMMCNiJw3iizdrUPQcHznop2BLeQ%3D&reserved=0 master branch
>>>>>>>>
>>>>>>>> next Kernel Version: 6.14.0-rc5-next-20250303
>>>>>>>>
>>>>>>>>
>>>>>>>> On linux-next kernel issue got introduced b/w next-20250227 and 
>>>>>>>> next-20250303
>>>>>>>>
>>>>>>>>
>>>>>>>> Build Warnings:
>>>>>>>>
>>>>>>>> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: 
>>>>>>>> objtool: .text+0xe84: intra_function_call not a direct call
>>>>>>>> arch/powerpc/crypto/ghashp8-ppc.o: warning: 
>>>>>>>> objtool: .text+0x22c: unannotated intra-function call
>>>>>>>> arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4: 
>>>>>>>> intra_function_call not a direct call
>>>>>>>>
>>>>>>>>
>>>>>>> Can you please specific the compiler and compiler version you 
>>>>>>> found this issue with
>>>>>>>
>>>>>> Can you also tell which defconfig you are using or provide 
>>>>>> your .config
>>>>>>
>>>>>> It might also be helpfull if you can provide a disassembly of the 
>>>>>> three file.o around the warned address.
>>>>> I could recreate the issue with gcc 11.4.1 20231218 with today's 
>>>>> linux-next (but could not recreate with gcc 14 or gcc 11.3.0)
>>>>>
>>>>> (20d5c66e1810 (HEAD -> master, tag: next-20250304, origin/master, 
>>>>> origin/HEAD) Add linux-next specific files for 20250304)
>>>>>
>>>>> warning for one of the switch.S file :
>>>>>
>>>>>    CC      arch/powerpc/kernel/syscalls.o
>>>>>    AS      arch/powerpc/kernel/switch.o
>>>>> arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4: 
>>>>> intra_function_call not a direct call
>>>> I guess this is becos, for bl .+4, we recently added in the 
>>>> arch_decode_instruction (decode.c) to set the type as INSN_OTHER
>>>>
>>>>          case 18: /* b[l][a] */
>>>>                  if (ins == 0x48000005)  /* bl .+4 */
>>>>                          typ = INSN_OTHER;
>>>>
>>>> Which I think is the issue here, changing it to INSN_CALL from 
>>>> INSN_OTHER fixes the warning
>>>>
>>>> diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/ 
>>>> arch/ powerpc/decode.c
>>>> index 26d5050424a9..ffd63a61a585 100644
>>>> --- a/tools/objtool/arch/powerpc/decode.c
>>>> +++ b/tools/objtool/arch/powerpc/decode.c
>>>> @@ -56,7 +56,7 @@ int arch_decode_instruction(struct objtool_file 
>>>> *file, const struct section *sec
>>>>          switch (opcode) {
>>>>          case 18: /* b[l][a] */
>>>>                  if (ins == 0x48000005)  /* bl .+4 */
>>>> -                       typ = INSN_OTHER;
>>>> +                       typ = INSN_CALL;
>>>>                  else if (ins & 1)       /* bl[a] */
>>>>                          typ = INSN_CALL;
>>>>                  else            /* b[a] */
>>>>
>>>>
>>>> Maddy
>>>>
>>> Maddy,
>>>
>>> I changed the code manually and gave it a try. The Proposed fix,
>>> partially fixes the issue. It gets rid of two of the warnings, but below
>>> warning still persists.
>>
>> It fixes the issue for you but will reintroduce the issue with clang.
>>
>> The real fix is to remove the ANNOTATE_INTRA_FUNCTION_CALL in:
>>
>> arch/powerpc/kernel/switch.S:42: ANNOTATE_INTRA_FUNCTION_CALL
>> arch/powerpc/kvm/book3s_hv_rmhandlers.S:1527: 
>> ANNOTATE_INTRA_FUNCTION_CALL
>> arch/powerpc/kvm/book3s_hv_rmhandlers.S:1534: 
>> ANNOTATE_INTRA_FUNCTION_CALL
> 
> 
> Removed ANNOTATE_INTRA_FUNCTION_CALL in above mentioned line, and it 
> fixes couple of warnings. But below warning still persists.
> 
> arch/powerpc/crypto/ghashp8-ppc.o: warning: objtool: .text+0x22c: 
> unannotated intra-function call.
> 
>>
>> Can you give it a try ?
>>
>> For the last one, can you provide an assembly dump ? You get it with 
>> "objtool -dr arch/powerpc/crypto/ghashp8-ppc.o"
> 
> 
> Assembly dump:
> 
> objdump -dr arch/powerpc/crypto/ghashp8-ppc.o
> 
> arch/powerpc/crypto/ghashp8-ppc.o:     file format elf64-powerpcle
> 
> 
> Disassembly of section .text:
> 
> 0000000000000140 <gcm_ghash_p8>:
>   140:    f8 ff 00 3c     lis     r0,-8
...
>   20c:    20 00 80 4e     blr
>   210:    00 00 00 00     .long 0x0
>   214:    00 0c 14 00     .long 0x140c00
>   218:    00 00 04 00     .long 0x40000
>   21c:    00 00 00 00     .long 0x0
>   220:    47 48 41 53     rlwimi. r1,r26,9,1,3
>   224:    48 20 66 6f     xoris   r6,r27,8264
>   228:    72 20 50 6f     xoris   r16,r26,8306
>   22c:    77 65 72 49     bla     1726574 <gcm_ghash_p8+0x1726434>      <==
...

It corresponds to:

_GLOBAL(gcm_ghash_p8)
	lis	0,0xfff8
...
	blr	
.long	0
.byte	0,12,0x14,0,0,0,4,0
.long	0
.size	gcm_ghash_p8,.-gcm_ghash_p8

.byte 
71,72,65,83,72,32,102,111,114,32,80,111,119,101,114,73,83,65,32,50,46,48,55,44,32,67,82,89,80,84,79,71,65,77,83,32,98,121,32,60,97,112,112,114,111,64,111,112,101,110,115,115,108,46,111,114,103,62,0
.align	2
.align	2


This is raw data that is after the function end and that shouldn't be 
taken into account as text by objtool. But ghashp8-ppc.S is generated by 
a perl script and should have been marked as OBJECT_FILES_NON_STANDARD.

For some reason, commit 109303336a0c ("crypto: vmx - Move to 
arch/powerpc/crypto") missed it. So now that 'bla' is understood as a 
call instruction, we hit the problem.

Can you try with following fix:

diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index 9b38f4a7bc15..2f00b22b0823 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -51,3 +51,4 @@ $(obj)/aesp8-ppc.S $(obj)/ghashp8-ppc.S: $(obj)/%.S: 
$(src)/%.pl FORCE
  OBJECT_FILES_NON_STANDARD_aesp10-ppc.o := y
  OBJECT_FILES_NON_STANDARD_ghashp10-ppc.o := y
  OBJECT_FILES_NON_STANDARD_aesp8-ppc.o := y
+OBJECT_FILES_NON_STANDARD_ghashp8-ppc.o := y

Christophe

