Return-Path: <linuxppc-dev+bounces-6685-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ECBA4DF0F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 14:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6brl0P15z3blk;
	Wed,  5 Mar 2025 00:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741094406;
	cv=none; b=KIvc0smV4lcMwUkxX+0FqPRbk0/Ati/lwhDyoBLp/2wQVMoi4NiF024ZmqTTZc7aEsGSkrbgzPOsfDpzukLRU9+oyhusKzgCTIbU8CAZAMP+kQRLaJFnwZQXnZEDMN0tFTDGh4vpDvedN6JeeVNuDkwRK2FGAJZuPY3AQ2AFGMnuc2dmQbGqhQ1cSDPuvAhtVQw9GiPROqntLFJLd7daOeUoJcspbm43AnxbFAFwEmWFnpa5gbDq6O+1wQLSwD0WF0t0WWckcMM8looHZ1I1gQoVHqYSmdCCqKoI1/TLX2GYj3Fs2JsakJFOGMnK/9SmvJR/bLNbKPErnYU1jb5WiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741094406; c=relaxed/relaxed;
	bh=ezUqWvkUCesuOZH0a95Xi5IvxyQ31lkN4crWM5UItnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cb3UI+jg7Hyt5FakNNIxfysMWneKwPQT5z6xkrhNfntHqmV6Yvv/lcqrs5bRoBUTpQ0ia1QPDwG6i04oQ/CRbLW4e9PVklLz0OITfl5vOsuutTzb1MB0nUX/lZgAqQaMC6mOGilUje/q5uihLofQI4HGsXMKzDSCkSk0Iw/z/csMRri/aYu/9nsd70suA9QmY17/dEHZR4YJhQrQTiK7FSQ6/BxpZMSMkHR2gDvenegZGWjS9st/W+Yx1S9GDVRH6Ip5upN2r5NtcSwFZD2Kx//FUS55oiuuRYtNbFHjQwO6spb2F6tMPzS9W0sreeqPNDoethd+/TQ2uc2aivzC6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6brj6WRvz3bkT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 00:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z6bYB4Jp9z9ssM;
	Tue,  4 Mar 2025 14:06:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bALd6RdimFkt; Tue,  4 Mar 2025 14:06:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z6bYB3FN1z9ssL;
	Tue,  4 Mar 2025 14:06:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5AC468B773;
	Tue,  4 Mar 2025 14:06:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id QXxqVrulQ7mE; Tue,  4 Mar 2025 14:06:38 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E49218B763;
	Tue,  4 Mar 2025 14:06:37 +0100 (CET)
Message-ID: <c4fe2f76-e6b8-4445-84b0-8509235e1fef@csgroup.eu>
Date: Tue, 4 Mar 2025 14:06:35 +0100
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
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <8c4c3fc2-2bd7-4148-af68-2f504d6119e0@linux.ibm.com>
 <47aa8b75-96b6-4e37-bb62-ad758b414076@linux.ibm.com>
 <8ba544e7-cf2a-4807-a056-683115805721@csgroup.eu>
 <bfcce9ce-bc26-4088-8d27-0797fc0d22d3@linux.ibm.com>
 <fe937273-d81a-4f6c-9eba-b96b711b4644@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <fe937273-d81a-4f6c-9eba-b96b711b4644@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 04/03/2025 à 13:38, Madhavan Srinivasan a écrit :
> 
> 
> On 3/4/25 4:58 PM, Madhavan Srinivasan wrote:
>>
>>
>> On 3/4/25 2:26 PM, Christophe Leroy wrote:
>>>
>>>
>>> Le 04/03/2025 à 07:13, Madhavan Srinivasan a écrit :
>>>>
>>>>
>>>> On 3/4/25 10:42 AM, Venkat Rao Bagalkote wrote:
>>>>> Greetings!!
>>>>>
>>>>>
>>>>> Observing build warnings with linux-next and powerpc repo's. Issue is currently not seen on mainline yet.
>>>>>
>>>>> PPC Repo: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpowerpc%2Flinux.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C48de41657f8341b927e708dd5b198b84%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638766887458137690%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=P9JQJ7joMFHGDws1H0iaxpj6blYAqsh4ATzrmB1A8Yc%3D&reserved=0 merge branch
>>>>>
>>>>> PPC Kernel Version: 6.14.0-rc4-g1304f486dbf1
>>>>> next Repo: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-next.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C48de41657f8341b927e708dd5b198b84%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638766887458152652%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=ZVQdCx62Z3ekoXOrWoE6SdHv4RvgjDFSE9CHPPJ%2FiyI%3D&reserved=0 master branch
>>>>>
>>>>> next Kernel Version: 6.14.0-rc5-next-20250303
>>>>>
>>>>>
>>>>> On linux-next kernel issue got introduced b/w next-20250227 and next-20250303
>>>>>
>>>>>
>>>>> Build Warnings:
>>>>>
>>>>> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xe84: intra_function_call not a direct call
>>>>> arch/powerpc/crypto/ghashp8-ppc.o: warning: objtool: .text+0x22c: unannotated intra-function call
>>>>> arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4: intra_function_call not a direct call
>>>>>
>>>>>
>>>>
>>>> Can you please specific the compiler and compiler version you found this issue with
>>>>
>>>
>>> Can you also tell which defconfig you are using or provide your .config
>>>
>>> It might also be helpfull if you can provide a disassembly of the three file.o around the warned address.
>>
>> I could recreate the issue with gcc 11.4.1 20231218 with today's linux-next (but could not recreate with gcc 14 or gcc 11.3.0)
>>
>> (20d5c66e1810 (HEAD -> master, tag: next-20250304, origin/master, origin/HEAD) Add linux-next specific files for 20250304)
>>
>> warning for one of the switch.S file :
>>
>>    CC      arch/powerpc/kernel/syscalls.o
>>    AS      arch/powerpc/kernel/switch.o
>> arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4: intra_function_call not a direct call
> 
> I guess this is becos, for bl .+4, we recently added in the arch_decode_instruction (decode.c) to set the type as INSN_OTHER
> 
>          case 18: /* b[l][a] */
>                  if (ins == 0x48000005)  /* bl .+4 */
>                          typ = INSN_OTHER;
> 
> Which I think is the issue here, changing it to INSN_CALL from INSN_OTHER fixes the warning

Yes indeed I ended up with the same conclusion. However if you change it 
back to INSN_CALL you just bring back the issue with clang using bl .+4 
for relocatable code.

The warning is from here:

static int __annotate_ifc(struct objtool_file *file, int type, struct 
instruction *insn)
{
	unsigned long dest_off;

	if (type != ANNOTYPE_INTRA_FUNCTION_CALL)
		return 0;

	if (insn->type != INSN_CALL) {
		WARN_INSN(insn, "intra_function_call not a direct call");
		return -1;
	}


Now that arch_decode_instruction() does not consider bl .+4 an INSN_CALL 
anymore, we have to remove the ANNOTATE_INTRA_FUNCTION_CALL annotations 
here:

arch/powerpc/kernel/switch.S:42:        ANNOTATE_INTRA_FUNCTION_CALL
arch/powerpc/kvm/book3s_hv_rmhandlers.S:1527:   ANNOTATE_INTRA_FUNCTION_CALL
arch/powerpc/kvm/book3s_hv_rmhandlers.S:1534:   ANNOTATE_INTRA_FUNCTION_CALL

The one in arch/powerpc/kexec/relocate_32.S is not a problem at the 
moment but it looks buggy and that "bl 1f" should be replaced by a 
branch to the "bcl 20,31,$+4"

I will try to cook a couple patches for all that.

The last one from the report is:

arch/powerpc/crypto/ghashp8-ppc.o: warning: objtool: .text+0x22c: 
unannotated intra-function call

That one is different, we need to reproduce it to understand what it is.

Christophe


> 
> diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
> index 26d5050424a9..ffd63a61a585 100644
> --- a/tools/objtool/arch/powerpc/decode.c
> +++ b/tools/objtool/arch/powerpc/decode.c
> @@ -56,7 +56,7 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
>          switch (opcode) {
>          case 18: /* b[l][a] */
>                  if (ins == 0x48000005)  /* bl .+4 */
> -                       typ = INSN_OTHER;
> +                       typ = INSN_CALL;
>                  else if (ins & 1)       /* bl[a] */
>                          typ = INSN_CALL;
>                  else            /* b[a] */
> 
> 
> Maddy
> 
>>    CC      arch/powerpc/kernel/irq.o
>>    CC      arch/powerpc/kernel/align.o
>>    CC      arch/powerpc/kernel/signal_64.o
>>
>> Objdump of switch.o:
>> arch/powerpc/kernel/switch.o:     file format elf64-powerpcle
>>
>> Disassembly of section .text:
>>
>> 0000000000000000 <flush_branch_caches>:
>>         0:	a6 02 28 7d 	mflr    r9
>>         4:	05 00 00 48 	bl      8 <flush_branch_caches+0x8>
>>         8:	05 00 00 48 	bl      c <flush_branch_caches+0xc>
>>         c:	05 00 00 48 	bl      10 <flush_branch_caches+0x10>
>>        10:	05 00 00 48 	bl      14 <flush_branch_caches+0x14>
>>        14:	05 00 00 48 	bl      18 <flush_branch_caches+0x18>
>>        18:	05 00 00 48 	bl      1c <flush_branch_caches+0x1c>
>>        1c:	05 00 00 48 	bl      20 <flush_branch_caches+0x20>
>>        20:	05 00 00 48 	bl      24 <flush_branch_caches+0x24>
>>        24:	05 00 00 48 	bl      28 <flush_branch_caches+0x28>
>>        28:	05 00 00 48 	bl      2c <flush_branch_caches+0x2c>
>>
>>
>> arch/powerpc/kernel/switch.S failing src section:
>>
>> .balign 32
>> .global flush_branch_caches
>> flush_branch_caches:
>>          /* Save LR into r9 */
>>          mflr    r9
>>
>>          // Flush the link stack
>>          .rept 64
>>          ANNOTATE_INTRA_FUNCTION_CALL
>>          bl      .+4
>>          .endr
>>          b       1f
>>          nops    6
>>
>> Maddy
>>
>>
>>>
>>> Christophe
>>
>>
> 


