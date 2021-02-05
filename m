Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E20753104D5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 07:06:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX4fd11ZKzDvrG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 17:06:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX4ct3qvrzDvbW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 17:04:24 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DX4cd3dFxz9tyVc;
 Fri,  5 Feb 2021 07:04:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SABVU0qc4DPE; Fri,  5 Feb 2021 07:04:17 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DX4cd2bvCz9tyVZ;
 Fri,  5 Feb 2021 07:04:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 475EF8B818;
 Fri,  5 Feb 2021 07:04:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id feQitOVAu0Mv; Fri,  5 Feb 2021 07:04:18 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BDDE98B75F;
 Fri,  5 Feb 2021 07:04:17 +0100 (CET)
Subject: Re: [PATCH v3 28/32] powerpc/64s: interrupt implement exit logic in C
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <20200225173541.1549955-29-npiggin@gmail.com>
 <37c2a8e1-2c4b-2e55-6753-0a804ce00cac@csgroup.eu>
 <1612409077.fadt3kvld9.astroid@bobo.none>
 <65686b53-feb4-2788-88e1-76c3714d3e97@csgroup.eu>
 <1612428699.u023r42mj3.astroid@bobo.none> <87blczpdm3.fsf@mpe.ellerman.id.au>
 <1612491261.by5b8gr97g.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d8e6b971-c783-fb5f-f9f2-24e7d8d0726d@csgroup.eu>
Date: Fri, 5 Feb 2021 07:04:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1612491261.by5b8gr97g.astroid@bobo.none>
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
Cc: Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/02/2021 à 03:16, Nicholas Piggin a écrit :
> Excerpts from Michael Ellerman's message of February 5, 2021 10:22 am:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>>> Excerpts from Christophe Leroy's message of February 4, 2021 6:03 pm:
>>>> Le 04/02/2021 à 04:27, Nicholas Piggin a écrit :
>>>>> Excerpts from Christophe Leroy's message of February 4, 2021 2:25 am:
>>>>>> Le 25/02/2020 à 18:35, Nicholas Piggin a écrit :
>> ...
>>>>>>> +
>>>>>>> +	/*
>>>>>>> +	 * We don't need to restore AMR on the way back to userspace for KUAP.
>>>>>>> +	 * The value of AMR only matters while we're in the kernel.
>>>>>>> +	 */
>>>>>>> +	kuap_restore_amr(regs);
>>>>>>
>>>>>> Is that correct to restore KUAP state here ? Shouldn't we have it at lower level in assembly ?
>>>>>>
>>>>>> Isn't there a risk that someone manages to call interrupt_exit_kernel_prepare() or the end of it in
>>>>>> a way or another, and get the previous KUAP state restored by this way ?
>>>>>
>>>>> I'm not sure if there much more risk if it's here rather than the
>>>>> instruction being in another place in the code.
>>>>>
>>>>> There's a lot of user access around the kernel too if you want to find a
>>>>> gadget to unlock KUAP then I suppose there is a pretty large attack
>>>>> surface.
>>>>
>>>> My understanding is that user access scope is strictly limited, for instance we enforce the
>>>> begin/end of user access to be in the same function, and we refrain from calling any other function
>>>> inside the user access window. x86 even have 'objtool' to enforce it at build time. So in theory
>>>> there is no way to get out of the function while user access is open.
>>>>
>>>> Here with the interrupt exit function it is free beer. You have a place where you re-open user
>>>> access and return with a simple blr. So that's open bar. If someone manages to just call the
>>>> interrupt exit function, then user access remains open
>>>
>>> Hmm okay maybe that's a good point.
>>
>> I don't think it's a very attractive gadget, it's not just a plain blr,
>> it does a full stack frame tear down before the return. And there's no
>> LR reloads anywhere very close.
>>
>> Obviously it depends on what the compiler decides to do, it's possible
>> it could be a usable gadget. But there are other places that are more
>> attractive I think, eg:
>>
>> c00000000061d768:	a6 03 3d 7d 	mtspr   29,r9
>> c00000000061d76c:	2c 01 00 4c 	isync
>> c00000000061d770:	00 00 00 60 	nop
>> c00000000061d774:	30 00 21 38 	addi    r1,r1,48
>> c00000000061d778:	20 00 80 4e 	blr
>>
>>
>> So I don't think we should redesign the code *purely* because we're
>> worried about interrupt_exit_kernel_prepare() being a useful gadget. If
>> we can come up with a way to restructure it that reads well and is
>> maintainable, and also reduces the chance of it being a good gadget then
>> sure.
> 
> Okay. That would be good if we can keep it in C, the pkeys + kuap combo
> is fairly complicated and we might want to something cleverer with it,
> so that would make it even more difficult in asm.
> 

Ok.

For ppc32, I prefer to keep it in assembly for the time being and move everything from ASM to C at 
once after porting syscall and interrupts to C and wrappers.

Hope this is OK for you.

Christophe
