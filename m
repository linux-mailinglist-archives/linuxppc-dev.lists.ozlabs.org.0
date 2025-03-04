Return-Path: <linuxppc-dev+bounces-6687-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64974A4DFA8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 14:50:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6cWL6Hmdz3bm7;
	Wed,  5 Mar 2025 00:50:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741096206;
	cv=none; b=eV7u8t1cjcpnuB6sy3HXm5LvReHXwQ8yzmKFp5a1E4+KxAuZWKYAjLuJdTMMJF5c5T8/0JCvl88iVbN/GWW3mdz2Fuoe1sl2pWwkMQ9V4SMnjtnqGOq52rOvQOGerMHoeSdygOk7L30vyztKkjKEyiN3tQ3IG1rWxv3rUYhdHTfdyQSeXh6jAlATajPC1M7nndKJtkk6akbdhOnlQiA15Wzp7MjRjY0eOSk2dhnWTG3/nm95gW6DzdPZnGsivQkhNE1RkHCfHyx+V8RUSbnKw6DckMW80tF8++u27xmbmxOalqFOaeY6uOQowxGwWOUc0hFLqQy3aSUg9CJBT/OqcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741096206; c=relaxed/relaxed;
	bh=7Gl5fsHD8F9rci1vAnSiIjcux58pHd7tin4dj8VYgTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FEsbLEQbcoI6sH7oMeetlrkt1kWRgCzDWNDQa6hOgvJC3WpUA3BePjCUFNMKPCJSs4lUzIDVmFWLM0hBjD/A0U0WkoAGswcsZmlxlx8r8skFDGQl841rQzt0XdrAIZeIfZKJbLJo/MbGoQa/d+eSECfqttmlu3CP60KSiZ5JPELaEk//AM6/Ov0KJpMIYpiFlwbN5uGGnUnRrgXZkVRwE4w2x0hKvdYK5sZk9AS6zkdu5dQm0I3FECl+etI1CznWNh+S+Yhi4YCGYOKO6dQl4sctTFqLYvN4Dq/zgXNy2+IZkl4k3VhZu1Z3xpKyG8JIO3RIiziSE+neIl37VEyfIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6cWL0G9Rz3bm3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 00:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z6bhm0yR2z9stP;
	Tue,  4 Mar 2025 14:13:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YcyFsAqofisI; Tue,  4 Mar 2025 14:13:12 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z6bhl0DH6z9stN;
	Tue,  4 Mar 2025 14:13:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E8E568B773;
	Tue,  4 Mar 2025 14:13:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ZqHAXFnBttdT; Tue,  4 Mar 2025 14:13:10 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7DAE08B763;
	Tue,  4 Mar 2025 14:13:10 +0100 (CET)
Message-ID: <a8336412-7b66-447e-9a90-1a376960cd4c@csgroup.eu>
Date: Tue, 4 Mar 2025 14:13:09 +0100
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
 Michael Ellerman <mpe@ellerman.id.au>
References: <8c4c3fc2-2bd7-4148-af68-2f504d6119e0@linux.ibm.com>
 <47aa8b75-96b6-4e37-bb62-ad758b414076@linux.ibm.com>
 <8ba544e7-cf2a-4807-a056-683115805721@csgroup.eu>
 <bfcce9ce-bc26-4088-8d27-0797fc0d22d3@linux.ibm.com>
 <fe937273-d81a-4f6c-9eba-b96b711b4644@linux.ibm.com>
 <988cb994-d8b1-4688-b926-66507ebe90df@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <988cb994-d8b1-4688-b926-66507ebe90df@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 04/03/2025 à 14:03, Venkat Rao Bagalkote a écrit :
> [Vous ne recevez pas souvent de courriers de venkat88@linux.ibm.com. 
> Découvrez pourquoi ceci est important à https://aka.ms/ 
> LearnAboutSenderIdentification ]
> 
> On 04/03/25 6:08 pm, Madhavan Srinivasan wrote:
>>
>> On 3/4/25 4:58 PM, Madhavan Srinivasan wrote:
>>>
>>> On 3/4/25 2:26 PM, Christophe Leroy wrote:
>>>>
>>>> Le 04/03/2025 à 07:13, Madhavan Srinivasan a écrit :
>>>>>
>>>>> On 3/4/25 10:42 AM, Venkat Rao Bagalkote wrote:
>>>>>> Greetings!!
>>>>>>
>>>>>>
>>>>>> Observing build warnings with linux-next and powerpc repo's. Issue 
>>>>>> is currently not seen on mainline yet.
>>>>>>
>>>>>> PPC Repo: https://eur01.safelinks.protection.outlook.com/? 
>>>>>> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpowerpc%2Flinux.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6e17cc771a204b2998b508dd5b1cf2cf%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638766902127463526%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=f0ubC0BiY%2Fw2XLfXcX955JKhJ%2BRkUmTUVO4fV%2F%2F4v2Y%3D&reserved=0 merge branch
>>>>>>
>>>>>> PPC Kernel Version: 6.14.0-rc4-g1304f486dbf1
>>>>>> next Repo: https://eur01.safelinks.protection.outlook.com/? 
>>>>>> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-next.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6e17cc771a204b2998b508dd5b1cf2cf%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638766902127477000%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=GSDtRBQ35owCeEpjMMCNiJw3iizdrUPQcHznop2BLeQ%3D&reserved=0 master branch
>>>>>>
>>>>>> next Kernel Version: 6.14.0-rc5-next-20250303
>>>>>>
>>>>>>
>>>>>> On linux-next kernel issue got introduced b/w next-20250227 and 
>>>>>> next-20250303
>>>>>>
>>>>>>
>>>>>> Build Warnings:
>>>>>>
>>>>>> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: 
>>>>>> objtool: .text+0xe84: intra_function_call not a direct call
>>>>>> arch/powerpc/crypto/ghashp8-ppc.o: warning: objtool: .text+0x22c: 
>>>>>> unannotated intra-function call
>>>>>> arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4: 
>>>>>> intra_function_call not a direct call
>>>>>>
>>>>>>
>>>>> Can you please specific the compiler and compiler version you found 
>>>>> this issue with
>>>>>
>>>> Can you also tell which defconfig you are using or provide your .config
>>>>
>>>> It might also be helpfull if you can provide a disassembly of the 
>>>> three file.o around the warned address.
>>> I could recreate the issue with gcc 11.4.1 20231218 with today's 
>>> linux-next (but could not recreate with gcc 14 or gcc 11.3.0)
>>>
>>> (20d5c66e1810 (HEAD -> master, tag: next-20250304, origin/master, 
>>> origin/HEAD) Add linux-next specific files for 20250304)
>>>
>>> warning for one of the switch.S file :
>>>
>>>    CC      arch/powerpc/kernel/syscalls.o
>>>    AS      arch/powerpc/kernel/switch.o
>>> arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4: 
>>> intra_function_call not a direct call
>> I guess this is becos, for bl .+4, we recently added in the 
>> arch_decode_instruction (decode.c) to set the type as INSN_OTHER
>>
>>          case 18: /* b[l][a] */
>>                  if (ins == 0x48000005)  /* bl .+4 */
>>                          typ = INSN_OTHER;
>>
>> Which I think is the issue here, changing it to INSN_CALL from 
>> INSN_OTHER fixes the warning
>>
>> diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/ 
>> powerpc/decode.c
>> index 26d5050424a9..ffd63a61a585 100644
>> --- a/tools/objtool/arch/powerpc/decode.c
>> +++ b/tools/objtool/arch/powerpc/decode.c
>> @@ -56,7 +56,7 @@ int arch_decode_instruction(struct objtool_file 
>> *file, const struct section *sec
>>          switch (opcode) {
>>          case 18: /* b[l][a] */
>>                  if (ins == 0x48000005)  /* bl .+4 */
>> -                       typ = INSN_OTHER;
>> +                       typ = INSN_CALL;
>>                  else if (ins & 1)       /* bl[a] */
>>                          typ = INSN_CALL;
>>                  else            /* b[a] */
>>
>>
>> Maddy
>>
> Maddy,
> 
> I changed the code manually and gave it a try. The Proposed fix,
> partially fixes the issue. It gets rid of two of the warnings, but below
> warning still persists.

It fixes the issue for you but will reintroduce the issue with clang.

The real fix is to remove the ANNOTATE_INTRA_FUNCTION_CALL in:

arch/powerpc/kernel/switch.S:42:        ANNOTATE_INTRA_FUNCTION_CALL
arch/powerpc/kvm/book3s_hv_rmhandlers.S:1527:   ANNOTATE_INTRA_FUNCTION_CALL
arch/powerpc/kvm/book3s_hv_rmhandlers.S:1534:   ANNOTATE_INTRA_FUNCTION_CALL

Can you give it a try ?

For the last one, can you provide an assembly dump ? You get it with 
"objtool -dr arch/powerpc/crypto/ghashp8-ppc.o"

Also can you tell which defconfig you use or provide your .config if not 
standard one ?

Christophe


> 
> arch/powerpc/crypto/ghashp8-ppc.o: warning: objtool: .text+0x22c:
> unannotated intra-function call
> 
>>>    CC      arch/powerpc/kernel/irq.o
>>>    CC      arch/powerpc/kernel/align.o
>>>    CC      arch/powerpc/kernel/signal_64.o
>>>
>>> Objdump of switch.o:
>>> arch/powerpc/kernel/switch.o:     file format elf64-powerpcle
>>>
>>> Disassembly of section .text:
>>>
>>> 0000000000000000 <flush_branch_caches>:
>>>         0:   a6 02 28 7d     mflr    r9
>>>         4:   05 00 00 48     bl      8 <flush_branch_caches+0x8>
>>>         8:   05 00 00 48     bl      c <flush_branch_caches+0xc>
>>>         c:   05 00 00 48     bl      10 <flush_branch_caches+0x10>
>>>        10:   05 00 00 48     bl      14 <flush_branch_caches+0x14>
>>>        14:   05 00 00 48     bl      18 <flush_branch_caches+0x18>
>>>        18:   05 00 00 48     bl      1c <flush_branch_caches+0x1c>
>>>        1c:   05 00 00 48     bl      20 <flush_branch_caches+0x20>
>>>        20:   05 00 00 48     bl      24 <flush_branch_caches+0x24>
>>>        24:   05 00 00 48     bl      28 <flush_branch_caches+0x28>
>>>        28:   05 00 00 48     bl      2c <flush_branch_caches+0x2c>
>>>
>>>
>>> arch/powerpc/kernel/switch.S failing src section:
>>>
>>> .balign 32
>>> .global flush_branch_caches
>>> flush_branch_caches:
>>>          /* Save LR into r9 */
>>>          mflr    r9
>>>
>>>          // Flush the link stack
>>>          .rept 64
>>>          ANNOTATE_INTRA_FUNCTION_CALL
>>>          bl      .+4
>>>          .endr
>>>          b       1f
>>>          nops    6
>>>
>>> Maddy
>>>
>>>
>>>> Christophe
>>>
>>
> Regards,
> 
> Venkat.
> 


