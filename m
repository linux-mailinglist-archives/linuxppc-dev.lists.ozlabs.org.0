Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5C84B07F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 05:46:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45T9pf0LzBzDqkd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 13:46:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="W+j0kD9y"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45T9mr56vRzDqf2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 13:44:27 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id n2so8823610pgp.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 20:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=EGHEaYjfXjUJTdauQ4fG3Qy+hvFG8OA2oIP4ZHxwa88=;
 b=W+j0kD9yojaW+hMlyk96Hha2xluF+17N7BX9ERK2TgvEPC51BC4u2dq+nw03r1DWnx
 qvEJnZfOncY8GNkfHLYyFd1gUqK/DmwkvbMMbTo2XYoe4knHRkooq2LDS7hxglixe+lt
 HsY3uvWPW/XZKJ44ul+TFBuD0gLNwY9RuVBPX1VgqzRWsFUjTBvVUaOh+u4eFiw+CObP
 Jp83FXUzxjExnl4Uyx+Nr2FrIZkfzQjY4+aPzkAcfTPALITve38+sCyAndT+LyNUeJU7
 T/GcE419O6pmuHckNP5CbqtcPwnuADo1M5bulo/e0geUj9rCOlWLnno8sobB9iPLWqlm
 gz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=EGHEaYjfXjUJTdauQ4fG3Qy+hvFG8OA2oIP4ZHxwa88=;
 b=eOLbOj19NbXEqamMks188FSqh9m8VMx9ArSe2fn5KzfV+sWXmWbML64B0SC5lEStUt
 /1zhOr2TanaKXlbGAAQskKsE6TbIh5UpORwk5mBenfZXfdVSVxQw1sbEwaNoVn480ajL
 J7z5BmLyzdlsa3dC3d47SWd0tkoAT8PoYsMyjjti7gqAKb6FrLqhGL63LM4iatakbDUC
 DLIYSxTkhi/gCVML4xxQmqs8knSYvScT7bLumK3X+hkH7u4njIAPlltVRWdexHz+RJqF
 ItzXQ+U6p3dCZFJsTSk9E2nWcE7IOGJatlzeguZ2gWHSnlb7mD8RG8WJCPssDSStFqDJ
 ScMQ==
X-Gm-Message-State: APjAAAUDTVJ4sozbGxqL3oPj6p0wVPSmmJbIUBwK0e/w3ARyzhe3b89p
 E//dDkAgjSf+8uMId+T4l4E=
X-Google-Smtp-Source: APXvYqwB7lHrI569djdy3eQ/PTdJiIHmfUvLO5bVVwFEwAzySywuMBRsshv/4G+mG7op0lLRUOHdYQ==
X-Received: by 2002:a62:68c4:: with SMTP id
 d187mr126870371pfc.245.1560915864395; 
 Tue, 18 Jun 2019 20:44:24 -0700 (PDT)
Received: from localhost (193-116-92-108.tpgi.com.au. [193.116.92.108])
 by smtp.gmail.com with ESMTPSA id r1sm11612280pfq.100.2019.06.18.20.44.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 20:44:23 -0700 (PDT)
Date: Wed, 19 Jun 2019 13:39:19 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 4/4] mm/vmalloc: Hugepage vmalloc mappings
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org,
 Russell Currey <ruscur@russell.cc>
References: <20190610043838.27916-1-npiggin@gmail.com>
 <20190610043838.27916-4-npiggin@gmail.com>
 <b79bf11d-43c7-88c9-8395-239625a1bdcf@c-s.fr>
In-Reply-To: <b79bf11d-43c7-88c9-8395-239625a1bdcf@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1560915223.if2qg1yc7k.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on June 11, 2019 3:39 pm:
>=20
>=20
> Le 10/06/2019 =C3=A0 06:38, Nicholas Piggin a =C3=A9crit=C2=A0:
>> For platforms that define HAVE_ARCH_HUGE_VMAP, have vmap allow vmalloc t=
o
>> allocate huge pages and map them
>=20
> Will this be compatible with Russell's series=20
> https://patchwork.ozlabs.org/patch/1099857/ for the implementation of=20
> STRICT_MODULE_RWX ?
> I see that apply_to_page_range() have things like BUG_ON(pud_huge(*pud));
>=20
> Might also be an issue for arm64 as I think Russell's implementation=20
> comes from there.

Yeah you're right (and correct about arm64 problem). I'll fix that up.

>> +static int vmap_hpages_range(unsigned long start, unsigned long end,
>> +			   pgprot_t prot, struct page **pages,
>> +			   unsigned int page_shift)
>> +{
>> +	BUG_ON(page_shift !=3D PAGE_SIZE);
>=20
> Do we really need a BUG_ON() there ? What happens if this condition is=20
> true ?

If it's true then vmap_pages_range would die horribly reading off the
end of the pages array thinking they are struct page pointers.

I guess it could return failure.

>> +	return vmap_pages_range(start, end, prot, pages);
>> +}
>> +#endif
>> +
>> +
>>   int is_vmalloc_or_module_addr(const void *x)
>>   {
>>   	/*
>> @@ -462,7 +498,7 @@ struct page *vmalloc_to_page(const void *vmalloc_add=
r)
>>   {
>>   	unsigned long addr =3D (unsigned long) vmalloc_addr;
>>   	struct page *page =3D NULL;
>> -	pgd_t *pgd =3D pgd_offset_k(addr);
>> +	pgd_t *pgd;
>>   	p4d_t *p4d;
>>   	pud_t *pud;
>>   	pmd_t *pmd;
>> @@ -474,27 +510,38 @@ struct page *vmalloc_to_page(const void *vmalloc_a=
ddr)
>>   	 */
>>   	VIRTUAL_BUG_ON(!is_vmalloc_or_module_addr(vmalloc_addr));
>>  =20
>> +	pgd =3D pgd_offset_k(addr);
>>   	if (pgd_none(*pgd))
>>   		return NULL;
>> +
>>   	p4d =3D p4d_offset(pgd, addr);
>>   	if (p4d_none(*p4d))
>>   		return NULL;
>> -	pud =3D pud_offset(p4d, addr);
>> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
>=20
> Do we really need that ifdef ? Won't p4d_large() always return 0 when is=20
> not set ?
> Otherwise, could we use IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP) instead ?
>=20
> Same several places below.

Possibly some of them are not defined without HAVE_ARCH_HUGE_VMAP
I think. I'll try to apply this pattern as much as possible.

>> @@ -2541,14 +2590,17 @@ static void *__vmalloc_area_node(struct vm_struc=
t *area, gfp_t gfp_mask,
>>   				 pgprot_t prot, int node)
>>   {
>>   	struct page **pages;
>> +	unsigned long addr =3D (unsigned long)area->addr;
>> +	unsigned long size =3D get_vm_area_size(area);
>> +	unsigned int page_shift =3D area->page_shift;
>> +	unsigned int shift =3D page_shift + PAGE_SHIFT;
>>   	unsigned int nr_pages, array_size, i;
>>   	const gfp_t nested_gfp =3D (gfp_mask & GFP_RECLAIM_MASK) | __GFP_ZERO=
;
>>   	const gfp_t alloc_mask =3D gfp_mask | __GFP_NOWARN;
>>   	const gfp_t highmem_mask =3D (gfp_mask & (GFP_DMA | GFP_DMA32)) ?
>> -					0 :
>> -					__GFP_HIGHMEM;
>> +					0 : __GFP_HIGHMEM;
>=20
> This patch is already quite big, shouldn't this kind of unrelated=20
> cleanups be in another patch ?

Okay, 2 against 1. I'll minimise changes like this.

Thanks,
Nick

=
