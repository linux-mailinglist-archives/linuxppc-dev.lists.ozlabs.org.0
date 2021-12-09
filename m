Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D797346E429
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 09:26:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8nF25BDKz3c5Z
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 19:26:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WdqIWBGM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WdqIWBGM; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8nDJ1ffkz3036
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 19:25:49 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id l64so4423792pgl.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Dec 2021 00:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=hezi+LYEK14rdX52FPQBYzWeVOPciP32w044K+3FLy0=;
 b=WdqIWBGMDDJfu/GePwIa5oYVelpjMP3xW2dZ5uS7+AVaBB4I6lGcwdK3KrJvPI4qSS
 gymcF5ny8GVjQIhaa5mQzHeJ25jjVQuRkdc2Cw3w/aemEWK3xj/dOmaBsAPkPlEZeJy0
 DHJVaVMUTDDmfj3nyRjKc7UdJm2c61EXwGtcbQBf1BKXBnlFf8CgQY7Noervky6PJFu6
 b1+akP6GtYvzLE/5za/jW1wH8JlIBJyni6G7lvIfViGci86utQP6ajiohwn0krAvO32Y
 FqYnVAmWtnEd6hrAtm/WI1ndceasfE3FpeTshMB8c5xuUlxgy5bNC1XntJdIeb3O4TDt
 sUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=hezi+LYEK14rdX52FPQBYzWeVOPciP32w044K+3FLy0=;
 b=pZ95a1dhEQswR9GBAAvjV4bC3dctJV3EqTqYl67Bluuq45FGTuKqmi/xTbtfKeX6Mh
 C7HH9z6cksJIjAYSz+5xoiy6UXJ7qyFmG0R2zevBYKduFBxPDFlL1zIMc4ZJuEOThu5K
 GMCYXocRzA9rL3CyQiNtSJ/yHFcExVryS6a0Hi1gxtJvDUpV5OK28NkPdVJFBUGFxohk
 95dUQ0awCn+HlAi6RkNWVvBFuDwDKT9rvqJo90LRuDu2RFA0lkSaG6dnfFoT4qTJfdEG
 vFQQ/0RtUPM7Ken7nU6IHcJrjsSQ6hit+iaZ0l3dgXFIe3/2Fp359FESUoHQ6fGo3djC
 QQeQ==
X-Gm-Message-State: AOAM5311Job64PwdgUJHvSdXkAxRvU8tJcNCydnVtcZrN1CT2Xy1TJql
 EK8jWMtXFTRB/+Uo8UsctY8=
X-Google-Smtp-Source: ABdhPJy8Y8nHnr3oKcfg4HamF44E3GPmZJ2lxua6bdXF0quSHAKCScNyJLmTlum68C8ox2fVft9wKA==
X-Received: by 2002:a63:de4f:: with SMTP id y15mr27021793pgi.495.1639038344761; 
 Thu, 09 Dec 2021 00:25:44 -0800 (PST)
Received: from localhost (203-219-139-206.static.tpgi.com.au.
 [203.219.139.206])
 by smtp.gmail.com with ESMTPSA id y25sm4809927pgk.47.2021.12.09.00.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 00:25:44 -0800 (PST)
Date: Thu, 09 Dec 2021 18:25:38 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 15/18] powerpc/64s: Always define arch unmapped area
 calls
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20211201144153.2456614-1-npiggin@gmail.com>
 <20211201144153.2456614-16-npiggin@gmail.com>
 <bbe64ca3-5439-4b79-6bda-a3464febdc53@csgroup.eu>
In-Reply-To: <bbe64ca3-5439-4b79-6bda-a3464febdc53@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1639038294.oxbnieugst.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of December 8, 2021 7:38 pm:
>=20
>=20
> Le 01/12/2021 =C3=A0 15:41, Nicholas Piggin a =C3=A9crit=C2=A0:
>> To avoid any functional changes to radix paths when building with hash
>> MMU support disabled (and CONFIG_PPC_MM_SLICES=3Dn), always define the
>> arch get_unmapped_area calls on 64s platforms.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/book3s/64/hash.h |  4 ---
>>   arch/powerpc/include/asm/book3s/64/mmu.h  |  6 ++++
>>   arch/powerpc/mm/hugetlbpage.c             | 16 ++++++---
>>   arch/powerpc/mm/mmap.c                    | 40 +++++++++++++++++++----
>>   arch/powerpc/mm/slice.c                   | 20 ------------
>>   5 files changed, 51 insertions(+), 35 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/in=
clude/asm/book3s/64/hash.h
>> index 674fe0e890dc..a7a0572f3846 100644
>> --- a/arch/powerpc/include/asm/book3s/64/hash.h
>> +++ b/arch/powerpc/include/asm/book3s/64/hash.h
>> @@ -99,10 +99,6 @@
>>    * Defines the address of the vmemap area, in its own region on
>>    * hash table CPUs.
>>    */
>> -#ifdef CONFIG_PPC_MM_SLICES
>> -#define HAVE_ARCH_UNMAPPED_AREA
>> -#define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
>> -#endif /* CONFIG_PPC_MM_SLICES */
>>  =20
>>   /* PTEIDX nibble */
>>   #define _PTEIDX_SECONDARY	0x8
>> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/inc=
lude/asm/book3s/64/mmu.h
>> index c02f42d1031e..015d7d972d16 100644
>> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
>> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
>> @@ -4,6 +4,12 @@
>>  =20
>>   #include <asm/page.h>
>>  =20
>> +#ifdef CONFIG_HUGETLB_PAGE
>> +#define HAVE_ARCH_HUGETLB_UNMAPPED_AREA
>> +#endif
>> +#define HAVE_ARCH_UNMAPPED_AREA
>> +#define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
>> +
>>   #ifndef __ASSEMBLY__
>>   /*
>>    * Page size definition
>> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage=
.c
>> index 82d8b368ca6d..ddead41e2194 100644
>> --- a/arch/powerpc/mm/hugetlbpage.c
>> +++ b/arch/powerpc/mm/hugetlbpage.c
>> @@ -542,20 +542,26 @@ struct page *follow_huge_pd(struct vm_area_struct =
*vma,
>>   	return page;
>>   }
>>  =20
>> -#ifdef CONFIG_PPC_MM_SLICES
>> +#ifdef HAVE_ARCH_HUGETLB_UNMAPPED_AREA
>> +static inline int file_to_psize(struct file *file)
>> +{
>> +	struct hstate *hstate =3D hstate_file(file);
>> +	return shift_to_mmu_psize(huge_page_shift(hstate));
>> +}
>> +
>>   unsigned long hugetlb_get_unmapped_area(struct file *file, unsigned lo=
ng addr,
>>   					unsigned long len, unsigned long pgoff,
>>   					unsigned long flags)
>>   {
>> -	struct hstate *hstate =3D hstate_file(file);
>> -	int mmu_psize =3D shift_to_mmu_psize(huge_page_shift(hstate));
>> -
>>   #ifdef CONFIG_PPC_RADIX_MMU
>>   	if (radix_enabled())
>>   		return radix__hugetlb_get_unmapped_area(file, addr, len,
>>   						       pgoff, flags);
>>   #endif
>> -	return slice_get_unmapped_area(addr, len, flags, mmu_psize, 1);
>> +#ifdef CONFIG_PPC_MM_SLICES
>> +	return slice_get_unmapped_area(addr, len, flags, file_to_psize(file), =
1);
>> +#endif
>> +	BUG();
>=20
> We shouldn't had new instances of BUG().
>=20
> BUILD_BUG() should do the trick here.
>=20
>>   }
>>   #endif
>>  =20
>> diff --git a/arch/powerpc/mm/mmap.c b/arch/powerpc/mm/mmap.c
>> index ae683fdc716c..c475cf810aa8 100644
>> --- a/arch/powerpc/mm/mmap.c
>> +++ b/arch/powerpc/mm/mmap.c
>> @@ -80,6 +80,7 @@ static inline unsigned long mmap_base(unsigned long rn=
d,
>>   	return PAGE_ALIGN(DEFAULT_MAP_WINDOW - gap - rnd);
>>   }
>>  =20
>> +#ifdef HAVE_ARCH_UNMAPPED_AREA
>>   #ifdef CONFIG_PPC_RADIX_MMU
>>   /*
>>    * Same function as generic code used only for radix, because we don't=
 need to overload
>> @@ -181,11 +182,42 @@ radix__arch_get_unmapped_area_topdown(struct file =
*filp,
>>   	 */
>>   	return radix__arch_get_unmapped_area(filp, addr0, len, pgoff, flags);
>>   }
>> +#endif
>> +
>> +unsigned long arch_get_unmapped_area(struct file *filp,
>> +				     unsigned long addr,
>> +				     unsigned long len,
>> +				     unsigned long pgoff,
>> +				     unsigned long flags)
>> +{
>> +#ifdef CONFIG_PPC_MM_SLICES
>> +	return slice_get_unmapped_area(addr, len, flags,
>> +				       mm_ctx_user_psize(&current->mm->context), 0);
>> +#else
>> +	BUG();
>=20
> Same.
>=20
> And the #else isn't needed
>=20
>> +#endif
>> +}
>> +
>> +unsigned long arch_get_unmapped_area_topdown(struct file *filp,
>> +					     const unsigned long addr0,
>> +					     const unsigned long len,
>> +					     const unsigned long pgoff,
>> +					     const unsigned long flags)
>> +{
>> +#ifdef CONFIG_PPC_MM_SLICES
>> +	return slice_get_unmapped_area(addr0, len, flags,
>> +				       mm_ctx_user_psize(&current->mm->context), 1);
>> +#else
>> +	BUG();
>=20
> Same
>=20
> And the #else isn't needed

Fair enough. I'll see if mpe can squash in an incremental patch.

Thanks,
Nick
