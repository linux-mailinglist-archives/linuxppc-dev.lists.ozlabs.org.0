Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FC92F60CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 13:12:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGjqf0pzHzDrhh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 23:12:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VjkwwmKw; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGjmG08rHzDrg1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 23:09:28 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id b5so3081259pjk.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 04:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=h82MZSS6PQqxW4bNIpkbdTCRrU8lkbQ04NcBDm+ft5E=;
 b=VjkwwmKwrhgRFe0iDrPWRU7rkIVmSLpZYCE1OovTb2ALgEiEEyjv9yweJ0IR2k1tvW
 4RpP2Ljc50b9IKCbWCoxRaZu9OXA44DWYRniD+XSTPymAPaYnsh0tczt1T5Q9SNCrnOm
 N3g+yQBhJG63t6GWXcYyQWPcm3b74mtQr6psB1auWAkMj+r21VdM/Z/YTLAg5a9e8pVM
 Zn46mkIZj62S2yifndajVHaS82gTxezp+10LJKiakuZ0LU+yOTI74Pf7Ha4CM2SvW44j
 WImrfljlT2DVh0VUAB3iJcYsd7UpmriAiIeoxQ4X6XhUUXt52qmEnATnw2Yd0R37Ew3J
 E8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=h82MZSS6PQqxW4bNIpkbdTCRrU8lkbQ04NcBDm+ft5E=;
 b=q1heWAWMGprH+jIVSLZ5mUsNB4FTdKknTUVDKXVIIKnbm3raqqK7VVl5REFKt3gJBS
 mlom2OZGnnmSb8Wy4FgpT0KQfY3GjAtz16g1d4Mh2qvwJKZxdqCbZciPEkKfsmnjVa6a
 40P0yxAfe5rF8w6Erjl2/TS0yBO3Ne8ncCGIeWRgiqelETaC9dFw/FDDKpyzeKT76Ert
 xmo9c9SrQBzOetXYFi9ti8Jk67Tj8gYHU8+iQNG/D9sQsg5Sz68o9eH49bapiGIhH//h
 0UWHFDsW08068XqmaVIHcsVhVlg0GR18q+gJAhpaaORZvVFPF72uiWY77rjtaHyWDyy1
 +G2A==
X-Gm-Message-State: AOAM5321p7w+85TxF+HEUSn7IWmS4GafuU5ihWMsXc04ccGB+ahDJX56
 kvziMD1uc9ARIliF7atWw8Q=
X-Google-Smtp-Source: ABdhPJwinPKBqB+DjTjEXoMhsBz3erS4bjN2Apv5wQzFgVvkVVrnJuIPpRBJ8zNsFgfcGIeoVvLsHQ==
X-Received: by 2002:a17:90a:4689:: with SMTP id
 z9mr4735630pjf.87.1610626165012; 
 Thu, 14 Jan 2021 04:09:25 -0800 (PST)
Received: from localhost ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id y69sm5286991pfb.64.2021.01.14.04.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 04:09:24 -0800 (PST)
Date: Thu, 14 Jan 2021 22:09:18 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 02/21] powerpc/64s: move the last of the page fault
 handling logic to C
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210113073215.516986-1-npiggin@gmail.com>
 <20210113073215.516986-3-npiggin@gmail.com>
 <b3f8fffd-ebbe-277d-9c71-cf3a6d8c4475@csgroup.eu>
 <1610592763.5wfbleady7.astroid@bobo.none>
In-Reply-To: <1610592763.5wfbleady7.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1610625340.tqgg2ar1jg.astroid@bobo.none>
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

Excerpts from Nicholas Piggin's message of January 14, 2021 1:24 pm:
> Excerpts from Christophe Leroy's message of January 14, 2021 12:12 am:
>>=20
>>=20
>> Le 13/01/2021 =C3=A0 08:31, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> The page fault handling still has some complex logic particularly aroun=
d
>>> hash table handling, in asm. Implement this in C instead.
>>>=20
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>   arch/powerpc/include/asm/book3s/64/mmu-hash.h |   1 +
>>>   arch/powerpc/kernel/exceptions-64s.S          | 131 +++--------------=
-
>>>   arch/powerpc/mm/book3s64/hash_utils.c         |  77 ++++++----
>>>   arch/powerpc/mm/fault.c                       |  46 ++++--
>>>   4 files changed, 107 insertions(+), 148 deletions(-)
>>>=20
>>> diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/power=
pc/include/asm/book3s/64/mmu-hash.h
>>> index 066b1d34c7bc..60a669379aa0 100644
>>> --- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
>>> +++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
>>> @@ -454,6 +454,7 @@ static inline unsigned long hpt_hash(unsigned long =
vpn,
>>>   #define HPTE_NOHPTE_UPDATE	0x2
>>>   #define HPTE_USE_KERNEL_KEY	0x4
>>>  =20
>>> +int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned lon=
g dsisr);
>>>   extern int __hash_page_4K(unsigned long ea, unsigned long access,
>>>   			  unsigned long vsid, pte_t *ptep, unsigned long trap,
>>>   			  unsigned long flags, int ssize, int subpage_prot);
>>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel=
/exceptions-64s.S
>>> index 6e53f7638737..bcb5e81d2088 100644
>>> --- a/arch/powerpc/kernel/exceptions-64s.S
>>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>>> @@ -1401,14 +1401,15 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
>>>    *
>>>    * Handling:
>>>    * - Hash MMU
>>> - *   Go to do_hash_page first to see if the HPT can be filled from an =
entry in
>>> - *   the Linux page table. Hash faults can hit in kernel mode in a fai=
rly
>>> + *   Go to do_hash_fault, which attempts to fill the HPT from an entry=
 in the
>>> + *   Linux page table. Hash faults can hit in kernel mode in a fairly
>>>    *   arbitrary state (e.g., interrupts disabled, locks held) when acc=
essing
>>>    *   "non-bolted" regions, e.g., vmalloc space. However these should =
always be
>>> - *   backed by Linux page tables.
>>> + *   backed by Linux page table entries.
>>>    *
>>> - *   If none is found, do a Linux page fault. Linux page faults can ha=
ppen in
>>> - *   kernel mode due to user copy operations of course.
>>> + *   If no entry is found the Linux page fault handler is invoked (by
>>> + *   do_hash_fault). Linux page faults can happen in kernel mode due t=
o user
>>> + *   copy operations of course.
>>>    *
>>>    *   KVM: The KVM HDSI handler may perform a load with MSR[DR]=3D1 in=
 guest
>>>    *   MMU context, which may cause a DSI in the host, which must go to=
 the
>>> @@ -1439,13 +1440,17 @@ EXC_COMMON_BEGIN(data_access_common)
>>>   	GEN_COMMON data_access
>>>   	ld	r4,_DAR(r1)
>>>   	ld	r5,_DSISR(r1)
>>=20
>> We have DSISR here. I think the dispatch between page fault or do_break(=
) should be done here:
>> - It would be more similar to other arches
>=20
> Other sub-archs?
>=20
>> - Would avoid doing it also in instruction fault
>=20
> True but it's hidden under an unlikely branch so won't really help=20
> instruction fault.
>=20
>> - Would avoid that -1 return which looks more like a hack.
>=20
> I don't really see it as a hack, we return a code to asm caller to
> direct whether to restore registers or not, we alrady have this
> pattern.
>=20
> (I'm hoping all that might be go away one day by conrolling NV
> regs from C if we can get good code generation but even if not we
> still have it in the interrupt returns).
>=20
> That said I will give it a try here. At very least it might be a
> better intermediate step.

Ah yes, this way doesn't work well for later patches because you end
e.g., with the do_break call having to call the interrupt handler
wrappers again when they actually expect to be in the asm entry state
(e.g., irq soft-mask state) when called, and return via interrupt_return
after the exit wrapper runs (which 64s uses to implement better context
tracking for example).

That could possibly be hacked up to deal with multiple interrupt=20
wrappers per interrupt, but I'd rather not go backwards.

That does leave the other sub archs as having this issue, but they don't=20
do so much in their handlers. 32 doesn't have soft-mask or context=20
tracking to deal with for example. We will need to fix this up though=20
and unify things more.

Thanks,
Nick
