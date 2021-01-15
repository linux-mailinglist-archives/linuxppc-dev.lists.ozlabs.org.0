Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD092F6F70
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 01:27:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH27F2DCKzDsYC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 11:27:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fikWkZlw; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DH2551ClJzDsTf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 11:25:13 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id n10so4876670pgl.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 16:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=T/xjZ68VqfI+nGThZ2AlJXpxklV8xWdEyI31RvH0U38=;
 b=fikWkZlwpnHSGXhuSRghI9mn13Y5xYdp4mEkCPLwHNnk/g+iFzcKssX22++EHubaRT
 mNEi/bTBlIBCwOai32QBG7Ov6sU00MgnM5wK7YkVw+VryjA/ElGLWuLM34coDZRhlxq/
 y/If/ThEG5nCq7rAiw2K8f8qGBb0fNED/9PGS9SKpSTbj/eIzDpzaUQYSzXU41TvKuiI
 UKtw8T6IiDmlWzLBft882uJTREhdjXl4trYRi5VfEuex+6/AEtSbSefPOYtl7rNH5ddo
 W45m0W2fg36dxOTsX9XFZMd2cPkmQ0Icrob6icnR8w0M+Xr6k0EYqL3CTHd9jO77Bp7Z
 4/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=T/xjZ68VqfI+nGThZ2AlJXpxklV8xWdEyI31RvH0U38=;
 b=izt11H0S4/XyoNMPKIWmIaVDSYElk03vro8R7Tngb1f4W2pIenSifKyqowOJZHPvGS
 F3AxoUF6qAA7GO5Z/rK6u8yjZkba5ScywKnD3j4/rZaTeYNcUqvB35dPsQTqko1YyWGM
 n6CdskQ+ALyJqHWluK1WrMYRSFobfgyz8M1Qpuwy0brbtZTpt5/JcbDLhU5F5cGlT1DU
 A8gCQeHpoWNTc6rozRDA3IAtu/7ImSOGmBX4EEt4sQD/JHAdRYXl7ohLR+pEGXbZvegV
 CkSJ3C7nKpl9FV7FE1PZSwFQY61ARIprI2oy/1SJE3E2izMijoh/VZ98ovAFPn5cXa/z
 IojQ==
X-Gm-Message-State: AOAM533MwS3MR5mVJTTG8oVzk+mO6APkW1TRJykww5ScebvHY9G/Zx4g
 H0K0hHyJGnzYPocxXeVs0kDa0snzq+A=
X-Google-Smtp-Source: ABdhPJwDxCGtUuh8icpLB1jO3KTwN/bbGIIuJZsinxl/ZPz5BwVdQcTjLGjO0mLt3Hyee2wu5VPUpQ==
X-Received: by 2002:a62:7858:0:b029:19d:c011:1cfe with SMTP id
 t85-20020a6278580000b029019dc0111cfemr9777867pfc.47.1610670310073; 
 Thu, 14 Jan 2021 16:25:10 -0800 (PST)
Received: from localhost ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id q206sm6175939pfc.161.2021.01.14.16.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 16:25:09 -0800 (PST)
Date: Fri, 15 Jan 2021 10:25:03 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 02/21] powerpc/64s: move the last of the page fault
 handling logic to C
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210113073215.516986-1-npiggin@gmail.com>
 <20210113073215.516986-3-npiggin@gmail.com>
 <b3f8fffd-ebbe-277d-9c71-cf3a6d8c4475@csgroup.eu>
 <1610592763.5wfbleady7.astroid@bobo.none>
 <1610625340.tqgg2ar1jg.astroid@bobo.none>
 <c07a91b3-561e-7197-1498-874281059e20@csgroup.eu>
 <1610629691.3ut6cgruc6.astroid@bobo.none>
 <afa9875c-e8ed-de3e-d395-435be86bd958@csgroup.eu>
In-Reply-To: <afa9875c-e8ed-de3e-d395-435be86bd958@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1610669980.jgo71amlnt.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of January 14, 2021 11:28 pm:
>=20
>=20
> Le 14/01/2021 =C3=A0 14:17, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of January 14, 2021 10:25 pm:
>>>
>>>
>>> Le 14/01/2021 =C3=A0 13:09, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>> Excerpts from Nicholas Piggin's message of January 14, 2021 1:24 pm:
>>>>> Excerpts from Christophe Leroy's message of January 14, 2021 12:12 am=
:
>>>>>>
>>>>>>
>>>>>> Le 13/01/2021 =C3=A0 08:31, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>>>>> The page fault handling still has some complex logic particularly a=
round
>>>>>>> hash table handling, in asm. Implement this in C instead.
>>>>>>>
>>>>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>>>>> ---
>>>>>>>     arch/powerpc/include/asm/book3s/64/mmu-hash.h |   1 +
>>>>>>>     arch/powerpc/kernel/exceptions-64s.S          | 131 +++--------=
-------
>>>>>>>     arch/powerpc/mm/book3s64/hash_utils.c         |  77 ++++++----
>>>>>>>     arch/powerpc/mm/fault.c                       |  46 ++++--
>>>>>>>     4 files changed, 107 insertions(+), 148 deletions(-)
>>>>>>>
>>>>>>> diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/p=
owerpc/include/asm/book3s/64/mmu-hash.h
>>>>>>> index 066b1d34c7bc..60a669379aa0 100644
>>>>>>> --- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
>>>>>>> +++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
>>>>>>> @@ -454,6 +454,7 @@ static inline unsigned long hpt_hash(unsigned l=
ong vpn,
>>>>>>>     #define HPTE_NOHPTE_UPDATE	0x2
>>>>>>>     #define HPTE_USE_KERNEL_KEY	0x4
>>>>>>>    =20
>>>>>>> +int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned=
 long dsisr);
>>>>>>>     extern int __hash_page_4K(unsigned long ea, unsigned long acces=
s,
>>>>>>>     			  unsigned long vsid, pte_t *ptep, unsigned long trap,
>>>>>>>     			  unsigned long flags, int ssize, int subpage_prot);
>>>>>>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/ke=
rnel/exceptions-64s.S
>>>>>>> index 6e53f7638737..bcb5e81d2088 100644
>>>>>>> --- a/arch/powerpc/kernel/exceptions-64s.S
>>>>>>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>>>>>>> @@ -1401,14 +1401,15 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
>>>>>>>      *
>>>>>>>      * Handling:
>>>>>>>      * - Hash MMU
>>>>>>> - *   Go to do_hash_page first to see if the HPT can be filled from=
 an entry in
>>>>>>> - *   the Linux page table. Hash faults can hit in kernel mode in a=
 fairly
>>>>>>> + *   Go to do_hash_fault, which attempts to fill the HPT from an e=
ntry in the
>>>>>>> + *   Linux page table. Hash faults can hit in kernel mode in a fai=
rly
>>>>>>>      *   arbitrary state (e.g., interrupts disabled, locks held) wh=
en accessing
>>>>>>>      *   "non-bolted" regions, e.g., vmalloc space. However these s=
hould always be
>>>>>>> - *   backed by Linux page tables.
>>>>>>> + *   backed by Linux page table entries.
>>>>>>>      *
>>>>>>> - *   If none is found, do a Linux page fault. Linux page faults ca=
n happen in
>>>>>>> - *   kernel mode due to user copy operations of course.
>>>>>>> + *   If no entry is found the Linux page fault handler is invoked =
(by
>>>>>>> + *   do_hash_fault). Linux page faults can happen in kernel mode d=
ue to user
>>>>>>> + *   copy operations of course.
>>>>>>>      *
>>>>>>>      *   KVM: The KVM HDSI handler may perform a load with MSR[DR]=
=3D1 in guest
>>>>>>>      *   MMU context, which may cause a DSI in the host, which must=
 go to the
>>>>>>> @@ -1439,13 +1440,17 @@ EXC_COMMON_BEGIN(data_access_common)
>>>>>>>     	GEN_COMMON data_access
>>>>>>>     	ld	r4,_DAR(r1)
>>>>>>>     	ld	r5,_DSISR(r1)
>>>>>>
>>>>>> We have DSISR here. I think the dispatch between page fault or do_br=
eak() should be done here:
>>>>>> - It would be more similar to other arches
>>>>>
>>>>> Other sub-archs?
>>>>>
>>>>>> - Would avoid doing it also in instruction fault
>>>>>
>>>>> True but it's hidden under an unlikely branch so won't really help
>>>>> instruction fault.
>>>>>
>>>>>> - Would avoid that -1 return which looks more like a hack.
>>>>>
>>>>> I don't really see it as a hack, we return a code to asm caller to
>>>>> direct whether to restore registers or not, we alrady have this
>>>>> pattern.
>>>>>
>>>>> (I'm hoping all that might be go away one day by conrolling NV
>>>>> regs from C if we can get good code generation but even if not we
>>>>> still have it in the interrupt returns).
>>>>>
>>>>> That said I will give it a try here. At very least it might be a
>>>>> better intermediate step.
>>>>
>>>> Ah yes, this way doesn't work well for later patches because you end
>>>> e.g., with the do_break call having to call the interrupt handler
>>>> wrappers again when they actually expect to be in the asm entry state
>>>> (e.g., irq soft-mask state) when called, and return via interrupt_retu=
rn
>>>> after the exit wrapper runs (which 64s uses to implement better contex=
t
>>>> tracking for example).
>>>>
>>>> That could possibly be hacked up to deal with multiple interrupt
>>>> wrappers per interrupt, but I'd rather not go backwards.
>>>>
>>>> That does leave the other sub archs as having this issue, but they don=
't
>>>> do so much in their handlers. 32 doesn't have soft-mask or context
>>>> tracking to deal with for example. We will need to fix this up though
>>>> and unify things more.
>>>>
>>>
>>> Not sure I understand what you mean exactly.
>>>
>>> On the 8xx, do_break() is called by totally different exceptions:
>>> - Exception 0x1c00 Data breakpoint =3D=3D> do_break()
>>> - Exception 0x1300 Instruction TLB error =3D=3D> handle_page_fault()
>>> - Exception 0x1400 Data TLB error =3D=3D> handle_page_fault()
>>>
>>> On book3s/32, we now (after my patch ie patch 1 in your series ) have e=
ither do_break() or
>>> handle_page_fault() being called from very early in ASM.
>>>
>>> If you do the same in book3s/64, then there is no issue with interrupt =
wrappers being called twice,
>>> is it ?
>>=20
>> bad_page_fault is the problem, it has to go afterwards.
>>=20
>> Once we have the changed 64s behaviour of do_page_fault, I don't know if
>> there is any point leaving do_break in asm is there? I guess it is neat
>> to treat it quite separately, I might need to count fast path branches..=
.
>> I have done the split anyway already, so I will post your way first.
>>=20
>=20
> As far as I understand, not taken unlikely branches are costless (at leas=
t on book3s/32), so you=20
> would only suffer the cost of the logical 'and.' on the value of DSISR th=
at you already have in a=20
> register. Should be in the noise.
>=20
> bad_page_fault() is not in the fast path anymore since we now handle the =
exception fixup at the end=20
> of do_page_fault(). So I think it shouldn't be a concern to call the wrap=
per again for bad_page_fault()

It's not performance but correctness. For example we can have interrupts=20
enabled again at this time, which the interrupt wrapper does not expect.
Or the context tracking code in the entry wrapper would break if it's
called again before interrupt_return.

I think it's not too ugly to put bad_page_fault in C and having do_break=20
in asm still avoids a lot of your complaints.

Thanks,
Nick
