Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DF32E04C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 04:34:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0MQ519NnzDqRD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 14:34:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pUE5U08n; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0MNM4Qh4zDqJS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Dec 2020 14:32:30 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id s15so2296926plr.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 19:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=8vqbaDZbwbU6Rp2+AgeK5d+wdScFayW52JC408LLf10=;
 b=pUE5U08nS+ksHfxEsZJH75Vh8DRzEYRWDg8L43vUwITnWvnkE4KE3PggpVyaXESK1D
 hdZNG8Kz8AIUYxlPaWmB3FTIh+80F82SsjepxhBcm9Xil9MgW9UoioRA5Oh18QJ8rQWf
 i6NdkkpRo4tD70uxs1JW8d0r7mqJLQJYL4E53u5RHYj0yBED1jNAd9nAoNTZHhq1oQaJ
 Zuj/dNtQ+rI2npnfLMkaVaJSSc0x4T5iHjzXSJ5oqF1VYMc/drJ/KDC0vvPv94eqDkrl
 Dv4lb/KK/bYMvtZtvQz94H99TT739uFoAlyiveihFJUZxE858HEtpKnYJGXqGeY6u+AK
 CqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=8vqbaDZbwbU6Rp2+AgeK5d+wdScFayW52JC408LLf10=;
 b=ICebEgy0kXHuu4eReUSzfbnuNiwQEjewgodIWFxo5JPsD0R9/XvTnI2R96OcLgwdsO
 ukFhZ0q10gyKe20bxRAG7+XVCQFeBiNWcwSkwlO68ufo1WPuAhOlIKRpFcr8TkY3LXSG
 yjWt5Fnxg++RirhfrKtfSSY4lT3M53/Pv+vHV55peHQe2ra+o/BJ0bJOY/lJ8hmlycy6
 wgDxMl57f/oZR1zDCnrvQiDcAAGOGpvIvxeCUnT+5bBQDyB0dH2VVhYU8sT40WoahDCT
 jaacKLkf/mAw/uR3qNX43nsBbzwInYPKkV19oc2UIMLx82FgnnAVB22JSsAj6bavgg11
 Wzjg==
X-Gm-Message-State: AOAM5308gCLcKFLxpWYjgKGgGBwxpf8U/IQ9alc0fsdLIWHYzhUvEWdQ
 JfuR59ZUH6hpHKjjxB42Hoz9Ic6hw9c=
X-Google-Smtp-Source: ABdhPJz9k5YPUl3BE2Sr3ZEHBCHYc4AZgM0r3E8OsDvaJWZuP9B6BFkK0/2GvIAiTMKkyyz/z0Q5gw==
X-Received: by 2002:a17:902:a983:b029:dc:2564:91f2 with SMTP id
 bh3-20020a170902a983b02900dc256491f2mr18631969plb.46.1608607946883; 
 Mon, 21 Dec 2020 19:32:26 -0800 (PST)
Received: from localhost (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id 4sm101617pjn.14.2020.12.21.19.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 19:32:26 -0800 (PST)
Date: Tue, 22 Dec 2020 13:32:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 1/5] powerpc/64s: update_mmu_cache inline the radix
 test
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20201219234813.830747-1-npiggin@gmail.com>
 <20201219234813.830747-2-npiggin@gmail.com>
 <7190cf34-af03-ca35-d2b5-aa152d300ec0@csgroup.eu>
In-Reply-To: <7190cf34-af03-ca35-d2b5-aa152d300ec0@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1608607730.vfxvu9s0rr.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of December 20, 2020 9:37 pm:
>=20
>=20
> Le 20/12/2020 =C3=A0 00:48, Nicholas Piggin a =C3=A9crit=C2=A0:
>> This allows the function to be entirely noped if hash support is
>> compiled out (not possible yet).
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/book3s/pgtable.h | 11 ++++++++++-
>>   arch/powerpc/mm/book3s32/mmu.c            |  4 ++--
>>   arch/powerpc/mm/book3s64/hash_utils.c     |  7 ++-----
>>   3 files changed, 14 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/book3s/pgtable.h b/arch/powerpc/in=
clude/asm/book3s/pgtable.h
>> index 0e1263455d73..914e9fc7b069 100644
>> --- a/arch/powerpc/include/asm/book3s/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/pgtable.h
>> @@ -35,7 +35,16 @@ extern pgprot_t phys_mem_access_prot(struct file *fil=
e, unsigned long pfn,
>>    * corresponding HPTE into the hash table ahead of time, instead of
>>    * waiting for the inevitable extra hash-table miss exception.
>>    */
>> -void update_mmu_cache(struct vm_area_struct *vma, unsigned long address=
, pte_t *ptep);
>> +void hash__update_mmu_cache(struct vm_area_struct *vma, unsigned long a=
ddress, pte_t *ptep);
>> +
>> +static inline void update_mmu_cache(struct vm_area_struct *vma, unsigne=
d long address, pte_t *ptep)
>> +{
>> +#ifdef CONFIG_PPC64
>=20
> You shouldn't need that ifdef. radix_enabled() is always defined.

True, thanks.

>> +	if (radix_enabled())
>> +		return;
>> +#endif
>> +	hash__update_mmu_cache(vma, address, ptep);
>> +}
>>  =20
>>   #endif /* __ASSEMBLY__ */
>>   #endif
>> diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/m=
mu.c
>> index 859e5bd603ac..c5a570ca37ff 100644
>> --- a/arch/powerpc/mm/book3s32/mmu.c
>> +++ b/arch/powerpc/mm/book3s32/mmu.c
>> @@ -325,8 +325,8 @@ static void hash_preload(struct mm_struct *mm, unsig=
ned long ea)
>>    *
>>    * This must always be called with the pte lock held.
>>    */
>> -void update_mmu_cache(struct vm_area_struct *vma, unsigned long address=
,
>> -		      pte_t *ptep)
>> +void hash__update_mmu_cache(struct vm_area_struct *vma, unsigned long a=
ddress,
>> +			    pte_t *ptep)
>=20
> Now the limit is 100 chars per line. This should fit on a single line I t=
hink.

I never quite know what to do here. The Linux limit is 100 but 80 is=20
still preferred AFAIK (e.g., don't make lots of lines beyond 80), but=20
80-100 can be used in some cases when splitting the line doesn't improve=20
readability on 80 colums.

This does (slightly) improve readability.

Thanks,
Nick

>=20
>>   {
>>   	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE))
>>   		return;
>> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/boo=
k3s64/hash_utils.c
>> index 73b06adb6eeb..d52a3dee7cf2 100644
>> --- a/arch/powerpc/mm/book3s64/hash_utils.c
>> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
>> @@ -1667,8 +1667,8 @@ static void hash_preload(struct mm_struct *mm, pte=
_t *ptep, unsigned long ea,
>>    *
>>    * This must always be called with the pte lock held.
>>    */
>> -void update_mmu_cache(struct vm_area_struct *vma, unsigned long address=
,
>> -		      pte_t *ptep)
>> +void hash__update_mmu_cache(struct vm_area_struct *vma, unsigned long a=
ddress,
>> +			    pte_t *ptep)
>=20
> Now the limit is 100 chars per line. This should fit on a single line I t=
hink.
>=20
>>   {
>>   	/*
>>   	 * We don't need to worry about _PAGE_PRESENT here because we are
>> @@ -1677,9 +1677,6 @@ void update_mmu_cache(struct vm_area_struct *vma, =
unsigned long address,
>>   	unsigned long trap;
>>   	bool is_exec;
>>  =20
>> -	if (radix_enabled())
>> -		return;
>> -
>>   	/* We only want HPTEs for linux PTEs that have _PAGE_ACCESSED set */
>>   	if (!pte_young(*ptep) || address >=3D TASK_SIZE)
>>   		return;
>>=20
>=20
