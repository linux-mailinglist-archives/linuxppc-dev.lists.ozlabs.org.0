Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A742F622A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 14:41:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGlpH4TYQzDsMm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 00:41:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s4uixGP1; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGlHR2QBdzDsM9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 00:18:10 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id c22so3741586pgg.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 05:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=OQe1y6+03lzqBgnpn/W+Xs9RptDDWun1ck6s3I/vRBI=;
 b=s4uixGP1FoPbB4XhgIIId4a4i3tl79bjaRmAarrROHEuoJVy/S+qHKqBwJYHhb487V
 8tk3bh9WlxwLnjmJCPsmho2btrV3P8kISY5pgRRkxW16qTVH9RH1ZWih9CzeL+nm21uz
 ePJaUTI3ZPOO2HzwzkdLpO6KEh8Sz/BmheFiwWONfT2ntevt2Jv4U4mNqz5oG2qtp/vB
 /P+B1srvZPLFr9j5p8X7h4rvsriWgAH58H5Ss52lp+RpX9lrxL29MZtOAtsSrBFXMLIR
 B2Ut8y5sJqmSFH6mNkdpsxa/9DhBBhScv7uhk/XqUaxvVqCzaLsbo/ZGsXpN592VfmT2
 G65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=OQe1y6+03lzqBgnpn/W+Xs9RptDDWun1ck6s3I/vRBI=;
 b=D1e/v3ENXlgGcwUkufbuWKizPsDbqBddFDRpUEcqJarq+OI0IOFiJrrdGt2D4H8ldl
 GJP7PPoZZIIMAsI05HWJFE9hbMuUkWKwijOQzQi1KTnUmJdjuk6kfw8rzpDfXQEJorMz
 tMAQxVDUmC0akP9vmRJP7VNz2VyjbhpMxXataobvjlsxV2WE/NRUJcSL9MS+IZ3/mKaA
 ZdX2099zt8smiJ35Ss3KMnjTc3kQfiTa6kdJmmTEz+DJ0XQw7UxVDSGJ4xp1gWHZCQwH
 fnMlq5EKkhihnw811X+O8+fSUjYKyYuc2FPv1Ev2OmJXUSJI+aD2Vscm95k6qEgn48Bb
 3PSg==
X-Gm-Message-State: AOAM532v4UAVPbV4O8oqXUh1LQHtwgAD8kvFSMzCJ8yonB7Hkw5kYwMd
 okd1dYvPK8KMBv4HQihi8lrT1IaDGdQ=
X-Google-Smtp-Source: ABdhPJwj+rdKtWiOehA8Ta2iPTzXl4lCOjp2bTmekzcZuVJpLVRSRMHXvumoLNJvCP8zMLdI4hqtjQ==
X-Received: by 2002:a65:5283:: with SMTP id y3mr7527365pgp.174.1610630285181; 
 Thu, 14 Jan 2021 05:18:05 -0800 (PST)
Received: from localhost ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id b1sm5398241pjh.54.2021.01.14.05.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 05:18:04 -0800 (PST)
Date: Thu, 14 Jan 2021 23:17:59 +1000
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
In-Reply-To: <c07a91b3-561e-7197-1498-874281059e20@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1610629691.3ut6cgruc6.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of January 14, 2021 10:25 pm:
>=20
>=20
> Le 14/01/2021 =C3=A0 13:09, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Nicholas Piggin's message of January 14, 2021 1:24 pm:
>>> Excerpts from Christophe Leroy's message of January 14, 2021 12:12 am:
>>>>
>>>>
>>>> Le 13/01/2021 =C3=A0 08:31, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>>> The page fault handling still has some complex logic particularly aro=
und
>>>>> hash table handling, in asm. Implement this in C instead.
>>>>>
>>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>>> ---
>>>>>    arch/powerpc/include/asm/book3s/64/mmu-hash.h |   1 +
>>>>>    arch/powerpc/kernel/exceptions-64s.S          | 131 +++-----------=
----
>>>>>    arch/powerpc/mm/book3s64/hash_utils.c         |  77 ++++++----
>>>>>    arch/powerpc/mm/fault.c                       |  46 ++++--
>>>>>    4 files changed, 107 insertions(+), 148 deletions(-)
>>>>>
>>>>> diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/pow=
erpc/include/asm/book3s/64/mmu-hash.h
>>>>> index 066b1d34c7bc..60a669379aa0 100644
>>>>> --- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
>>>>> +++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
>>>>> @@ -454,6 +454,7 @@ static inline unsigned long hpt_hash(unsigned lon=
g vpn,
>>>>>    #define HPTE_NOHPTE_UPDATE	0x2
>>>>>    #define HPTE_USE_KERNEL_KEY	0x4
>>>>>   =20
>>>>> +int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned l=
ong dsisr);
>>>>>    extern int __hash_page_4K(unsigned long ea, unsigned long access,
>>>>>    			  unsigned long vsid, pte_t *ptep, unsigned long trap,
>>>>>    			  unsigned long flags, int ssize, int subpage_prot);
>>>>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kern=
el/exceptions-64s.S
>>>>> index 6e53f7638737..bcb5e81d2088 100644
>>>>> --- a/arch/powerpc/kernel/exceptions-64s.S
>>>>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>>>>> @@ -1401,14 +1401,15 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
>>>>>     *
>>>>>     * Handling:
>>>>>     * - Hash MMU
>>>>> - *   Go to do_hash_page first to see if the HPT can be filled from a=
n entry in
>>>>> - *   the Linux page table. Hash faults can hit in kernel mode in a f=
airly
>>>>> + *   Go to do_hash_fault, which attempts to fill the HPT from an ent=
ry in the
>>>>> + *   Linux page table. Hash faults can hit in kernel mode in a fairl=
y
>>>>>     *   arbitrary state (e.g., interrupts disabled, locks held) when =
accessing
>>>>>     *   "non-bolted" regions, e.g., vmalloc space. However these shou=
ld always be
>>>>> - *   backed by Linux page tables.
>>>>> + *   backed by Linux page table entries.
>>>>>     *
>>>>> - *   If none is found, do a Linux page fault. Linux page faults can =
happen in
>>>>> - *   kernel mode due to user copy operations of course.
>>>>> + *   If no entry is found the Linux page fault handler is invoked (b=
y
>>>>> + *   do_hash_fault). Linux page faults can happen in kernel mode due=
 to user
>>>>> + *   copy operations of course.
>>>>>     *
>>>>>     *   KVM: The KVM HDSI handler may perform a load with MSR[DR]=3D1=
 in guest
>>>>>     *   MMU context, which may cause a DSI in the host, which must go=
 to the
>>>>> @@ -1439,13 +1440,17 @@ EXC_COMMON_BEGIN(data_access_common)
>>>>>    	GEN_COMMON data_access
>>>>>    	ld	r4,_DAR(r1)
>>>>>    	ld	r5,_DSISR(r1)
>>>>
>>>> We have DSISR here. I think the dispatch between page fault or do_brea=
k() should be done here:
>>>> - It would be more similar to other arches
>>>
>>> Other sub-archs?
>>>
>>>> - Would avoid doing it also in instruction fault
>>>
>>> True but it's hidden under an unlikely branch so won't really help
>>> instruction fault.
>>>
>>>> - Would avoid that -1 return which looks more like a hack.
>>>
>>> I don't really see it as a hack, we return a code to asm caller to
>>> direct whether to restore registers or not, we alrady have this
>>> pattern.
>>>
>>> (I'm hoping all that might be go away one day by conrolling NV
>>> regs from C if we can get good code generation but even if not we
>>> still have it in the interrupt returns).
>>>
>>> That said I will give it a try here. At very least it might be a
>>> better intermediate step.
>>=20
>> Ah yes, this way doesn't work well for later patches because you end
>> e.g., with the do_break call having to call the interrupt handler
>> wrappers again when they actually expect to be in the asm entry state
>> (e.g., irq soft-mask state) when called, and return via interrupt_return
>> after the exit wrapper runs (which 64s uses to implement better context
>> tracking for example).
>>=20
>> That could possibly be hacked up to deal with multiple interrupt
>> wrappers per interrupt, but I'd rather not go backwards.
>>=20
>> That does leave the other sub archs as having this issue, but they don't
>> do so much in their handlers. 32 doesn't have soft-mask or context
>> tracking to deal with for example. We will need to fix this up though
>> and unify things more.
>>=20
>=20
> Not sure I understand what you mean exactly.
>=20
> On the 8xx, do_break() is called by totally different exceptions:
> - Exception 0x1c00 Data breakpoint =3D=3D> do_break()
> - Exception 0x1300 Instruction TLB error =3D=3D> handle_page_fault()
> - Exception 0x1400 Data TLB error =3D=3D> handle_page_fault()
>=20
> On book3s/32, we now (after my patch ie patch 1 in your series ) have eit=
her do_break() or=20
> handle_page_fault() being called from very early in ASM.
>=20
> If you do the same in book3s/64, then there is no issue with interrupt wr=
appers being called twice,=20
> is it ?

bad_page_fault is the problem, it has to go afterwards.

Once we have the changed 64s behaviour of do_page_fault, I don't know if=20
there is any point leaving do_break in asm is there? I guess it is neat=20
to treat it quite separately, I might need to count fast path branches...
I have done the split anyway already, so I will post your way first.

Thanks,
Nick
