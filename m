Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B095B2F58E2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 04:27:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGV9S20HPzDrft
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 14:27:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XFrkEKm5; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGV714Bf6zDrSg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 14:24:59 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id y8so2214573plp.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 19:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=AUmTdV5pBWiPVDsWDJCsfQoW0ALxJls0h5m5KRuxFjo=;
 b=XFrkEKm5Ot8IxrVawFW90oYCEp1UCJueeAO+m3cmRFsTzpoPsZSBGp6v3epqWrv1sn
 SmgVtbQxF52XFttO4qucmOTyrBPBBub6W5jl4f+19Nl3un9WKxnnLZfI48qoICwyAfGL
 9Ikw300GgW2YtVUrvBPJtr2UfvRHZkRyrHQEj0dKtwYNhMxu/ks+M/VWeNYhPOtPHBTG
 TJUlXie3tGqdh/ZDFXEYCY6wN0SdHgZLjOtgVghtqYyJwkg9966s2MWZSTHf5XagaJBN
 Iwh6fgHLJt44F4i66+4XjBTxHdLHyC+b3wr+VhfxTCp/I3cx4zbQgHzrm1tAN8WWqZv7
 AvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=AUmTdV5pBWiPVDsWDJCsfQoW0ALxJls0h5m5KRuxFjo=;
 b=PRd7EdiDTy9ncUO0wsgp6zMZ9inBSIazKvGVlHbYI8bUtAujuBLCfONyIvw0JnxsiS
 yfR05LFs0s+NwdigCCmXGgiSSmzIyZSskOo1gwPRqdNyD3n7HmuWNXuDCHkJ99IFiyMR
 JMXTv+cKT6Cfjr8sLly85bABcR7efjcaWGK8zmr2p8yorrayzX32CpwEk8yhK2pIq85W
 FCoyI5JmiiBkNrRm82JGx11nGppA6xqfdmEHhxaHFh+tUQm4QeHghCdQO7dLMZuL9Lh9
 Af/B4PDdZrN0Gwod8Fc+6Mj7oxXHySb8DgD1ou+FfZzCMoBrgfrXGuzaU1B5UP22Ve4K
 whiw==
X-Gm-Message-State: AOAM5307TJvJNfHAYI5qEWuZwG8oml3WGADOtSGojECR0GkwxnxPtun1
 WRmorNTLt4DYe82h6b60TwSkN9ZpQgQxUA==
X-Google-Smtp-Source: ABdhPJy7bO4cAQA6qpxTqwa0fIHU5Y2067qBy2ey7r1qiys4MRQtUuz2mxOQfEBwJsl27DK6wHI6rw==
X-Received: by 2002:a17:902:f688:b029:da:a817:1753 with SMTP id
 l8-20020a170902f688b02900daa8171753mr5445931plg.76.1610594696221; 
 Wed, 13 Jan 2021 19:24:56 -0800 (PST)
Received: from localhost ([1.132.231.127])
 by smtp.gmail.com with ESMTPSA id f67sm3902367pfg.159.2021.01.13.19.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 19:24:55 -0800 (PST)
Date: Thu, 14 Jan 2021 13:24:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 02/21] powerpc/64s: move the last of the page fault
 handling logic to C
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210113073215.516986-1-npiggin@gmail.com>
 <20210113073215.516986-3-npiggin@gmail.com>
 <b3f8fffd-ebbe-277d-9c71-cf3a6d8c4475@csgroup.eu>
In-Reply-To: <b3f8fffd-ebbe-277d-9c71-cf3a6d8c4475@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1610592763.5wfbleady7.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of January 14, 2021 12:12 am:
>=20
>=20
> Le 13/01/2021 =C3=A0 08:31, Nicholas Piggin a =C3=A9crit=C2=A0:
>> The page fault handling still has some complex logic particularly around
>> hash table handling, in asm. Implement this in C instead.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/book3s/64/mmu-hash.h |   1 +
>>   arch/powerpc/kernel/exceptions-64s.S          | 131 +++---------------
>>   arch/powerpc/mm/book3s64/hash_utils.c         |  77 ++++++----
>>   arch/powerpc/mm/fault.c                       |  46 ++++--
>>   4 files changed, 107 insertions(+), 148 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerp=
c/include/asm/book3s/64/mmu-hash.h
>> index 066b1d34c7bc..60a669379aa0 100644
>> --- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
>> +++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
>> @@ -454,6 +454,7 @@ static inline unsigned long hpt_hash(unsigned long v=
pn,
>>   #define HPTE_NOHPTE_UPDATE	0x2
>>   #define HPTE_USE_KERNEL_KEY	0x4
>>  =20
>> +int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned long=
 dsisr);
>>   extern int __hash_page_4K(unsigned long ea, unsigned long access,
>>   			  unsigned long vsid, pte_t *ptep, unsigned long trap,
>>   			  unsigned long flags, int ssize, int subpage_prot);
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/=
exceptions-64s.S
>> index 6e53f7638737..bcb5e81d2088 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -1401,14 +1401,15 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
>>    *
>>    * Handling:
>>    * - Hash MMU
>> - *   Go to do_hash_page first to see if the HPT can be filled from an e=
ntry in
>> - *   the Linux page table. Hash faults can hit in kernel mode in a fair=
ly
>> + *   Go to do_hash_fault, which attempts to fill the HPT from an entry =
in the
>> + *   Linux page table. Hash faults can hit in kernel mode in a fairly
>>    *   arbitrary state (e.g., interrupts disabled, locks held) when acce=
ssing
>>    *   "non-bolted" regions, e.g., vmalloc space. However these should a=
lways be
>> - *   backed by Linux page tables.
>> + *   backed by Linux page table entries.
>>    *
>> - *   If none is found, do a Linux page fault. Linux page faults can hap=
pen in
>> - *   kernel mode due to user copy operations of course.
>> + *   If no entry is found the Linux page fault handler is invoked (by
>> + *   do_hash_fault). Linux page faults can happen in kernel mode due to=
 user
>> + *   copy operations of course.
>>    *
>>    *   KVM: The KVM HDSI handler may perform a load with MSR[DR]=3D1 in =
guest
>>    *   MMU context, which may cause a DSI in the host, which must go to =
the
>> @@ -1439,13 +1440,17 @@ EXC_COMMON_BEGIN(data_access_common)
>>   	GEN_COMMON data_access
>>   	ld	r4,_DAR(r1)
>>   	ld	r5,_DSISR(r1)
>=20
> We have DSISR here. I think the dispatch between page fault or do_break()=
 should be done here:
> - It would be more similar to other arches

Other sub-archs?

> - Would avoid doing it also in instruction fault

True but it's hidden under an unlikely branch so won't really help=20
instruction fault.

> - Would avoid that -1 return which looks more like a hack.

I don't really see it as a hack, we return a code to asm caller to
direct whether to restore registers or not, we alrady have this
pattern.

(I'm hoping all that might be go away one day by conrolling NV
regs from C if we can get good code generation but even if not we
still have it in the interrupt returns).

That said I will give it a try here. At very least it might be a
better intermediate step.

[snip]

>> +#ifdef CONFIG_PPC_BOOK3S_64
>=20
> Seems like you are re-implementing handle_page_fault() inside do_page_fau=
lt(). Wouldn't it be=20
> possible to keep do_page_fault() as is for the moment and implement a C v=
ersion of handle_page_fault() ?

The test goes in a better place (existing unlikely branch) if we do it=20
in do_page_fault.

> Or just keep it in assembly ? It is not that big, keeping it in assembly =
would keep things more=20
> common with PPC32, and would still allow to save NV GPRS only when needed=
.

I think it's better to go the other way and move more of the other archs=20
to C (in general that is, but for this patch as I said I will try the DABR
test in asm).

Thanks,
Nick
