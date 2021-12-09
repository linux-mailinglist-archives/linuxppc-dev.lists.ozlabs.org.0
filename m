Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F0046E435
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 09:30:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8nKd28pGz3cC3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 19:30:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SWSAEzeO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SWSAEzeO; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8nK13YB9z303F
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 19:29:57 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id 8so4769428pfo.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Dec 2021 00:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=9H/GHLYKDSqQ6g2PQwBggdSfSWmPczKEJhQX1EPpfFQ=;
 b=SWSAEzeOCvaNSOkA6YxTBLHRzVAvvJvTZ0ROf54wotqbLrGRWpHwfTCxD9exucgEPL
 ZY6ObLta3O2jeclJdFjdMlqhj5V90rkmDMNIy/cEngYOkhlwO/RvXhBjYcZMekQx31P9
 ZDmgirAJmCj7erf9teVzMLiEuqvjAPhE4AHeuiSITAGMB0Azs/t0rAI332ECEOnifRrp
 sepNL3SWcE1apzjrlzcXMmRfR4TKY+FbnW2gPOwtgXMSiszYdUutdsWrWUEKV3rvNf37
 ys5TcUm3mt3TEHw89u/TDUi7aftbHbHLapuQ5jbsrsfyNJtdUJYJ1ZA+15KRJtmuqmZ6
 9Vug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=9H/GHLYKDSqQ6g2PQwBggdSfSWmPczKEJhQX1EPpfFQ=;
 b=baLz8KGH7vCA/dxheMOUn6QRxLrhFv2FTCYHII/pUMXlt8DySnURKs/Bcowxi8ZyW3
 r7fY82g26apH6KZtx+5qeuL29PsAHBmne6jp96sMEXOOSsf7va+nWaX5WvBIacjy7TH8
 L5ui6F06wTsFBQtI7viJNNv9qlpt3IVEWL705RFhZpD6fygiqGib6gUbPYvVjNvcrrMZ
 xQ9XXYLUR2Oh7OofXiUOEjfHrLbwrQIDWeSI5ny7S5lH7xjYjL1oG2/1BwzpXXvMxZYn
 xxuk7mVgPQu0S9xyS2xlx4mHMeyBJ+sFbC9vL+Ot5EcKK6effuIklDgCfddyv1St4P43
 zKxw==
X-Gm-Message-State: AOAM533bSyqvY0YPri099ECz2JBcXioVSxJiL+dE+KnDqFq4oQRsBPhD
 LSdCVU4s5ef2ADaDXKKLKfs=
X-Google-Smtp-Source: ABdhPJxsRpn0OwIj9OnJnlZDouA2KB4j891V7J04sAUqBGBQO41K7qL9NQ20rCTwGs68XzXwDZSPjQ==
X-Received: by 2002:a05:6a00:84d:b0:4ae:da2:9ce7 with SMTP id
 q13-20020a056a00084d00b004ae0da29ce7mr10319610pfk.16.1639038594281; 
 Thu, 09 Dec 2021 00:29:54 -0800 (PST)
Received: from localhost (203-219-139-206.static.tpgi.com.au.
 [203.219.139.206])
 by smtp.gmail.com with ESMTPSA id o129sm5944858pfg.44.2021.12.09.00.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 00:29:53 -0800 (PST)
Date: Thu, 09 Dec 2021 18:29:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 15/18] powerpc/64s: Always define arch unmapped area
 calls
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20211201144153.2456614-1-npiggin@gmail.com>
 <20211201144153.2456614-16-npiggin@gmail.com>
 <069c343a-c373-ed41-2778-b0abcbb9ba09@csgroup.eu>
In-Reply-To: <069c343a-c373-ed41-2778-b0abcbb9ba09@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1639038344.hmjgs8e78s.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of December 8, 2021 8:00 pm:
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
>=20
> Could use CONFIG_PPC_BOOK3S_64 instead

It was going to make it de-selectable with !HASH. I think your series=20
cleans this stuff up so I dont' think it's a big deal.

>=20
>> +static inline int file_to_psize(struct file *file)
>=20
> 'inline' is not needed.

It is otherwise a !SLICES config causes it to give a defined but not=20
used error.

>=20
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
>=20
> Could use CONFIG_PPC_BOOK3S_64 instead. Or better, put all that stuff in=20
> a file in mm/book3s64/ directory

Seeing as you cleaned it up with your series, probably doesn't matter
much.

Thanks,
Nick
