Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD6630397A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 10:52:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQ28G47cdzDqjV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 20:52:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HAPMFftR; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQ25y178FzDq9l
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 20:50:13 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id b21so4325679pgk.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 01:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=0BoP+OYH6EXdZxnw4jTi+ce0h1kJJ+YvrP995HEeEfk=;
 b=HAPMFftRZxQG/fBZeVQHKpfYqezKjPzUFWYma5LOeOZuhMrSgaQnFghwR82Hi0Tcad
 6i4fqeK0OEgAe0lPjMHX+w/LEXKabwaw3WgD+7gti+Eq3I7UGN+6+YRRaTKc5T6KgGFT
 x+FH14E2Wga0siPTYUQdnIEKHn+e2plYn73AjOkuryD4Sp/FSHEuDne1lLKJVidRQtNt
 obqeveTlFYP05jEmDI0GDr5yXXaz9RQ4vG8/zio/JQSQ+/5P7bwkD8IJjsswZP/7emSG
 r4VtW5DBjjmSYLx8gY9cAkgVlI/TN/bJJNxZzeydR0tM7Q0sJIlZvG5IcVD30HdqeCXI
 GG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=0BoP+OYH6EXdZxnw4jTi+ce0h1kJJ+YvrP995HEeEfk=;
 b=QReAPEzskgfX/PS4YfxrkITtmzUma6jxrKGsvD1ctZOEsPyVIfdKRRMpRp6/X3MT2b
 kq7uOZ7hwxXeN/zN6kXP4RO7wwzeSG9BG4Epk4VpTgKycfefRu1N36233XrMXN97bNnu
 X1leD7YuTlav/lUjbcXWNqbeIjJaLJTklap2aTERBAImZyYqoszxPlDgJymDIRfGCqGj
 kdgW/ZUkDCw9HKwNiZP5mwWLL5qxPBiwWu9X+Q6U7HH2cRd7WmK14ksrBYHoaNVBHXDQ
 2KisoWnMhR37XARvi31yIsBVQKpby/Lx9tm6/+kKskvvp9VM/Or/d6MthVgkTq31sbnH
 Xdrg==
X-Gm-Message-State: AOAM5301jktLQLeIQObQi7GLzLHfWEO2vqL/68iAMSFEo1/UopziR6Rp
 G8o4GIOmQJ4xw6AA5rg5ZtA=
X-Google-Smtp-Source: ABdhPJzy2Ur7IdM2ZfVTsqMbS5tBjuUgvkwINi0xes7/ASkks7ScG4l9nU4ZAYkMr3Wud5aCblU1YA==
X-Received: by 2002:aa7:8b0f:0:b029:1c0:e782:ba29 with SMTP id
 f15-20020aa78b0f0000b02901c0e782ba29mr4498133pfd.37.1611654610729; 
 Tue, 26 Jan 2021 01:50:10 -0800 (PST)
Received: from localhost
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id c11sm17063325pfl.185.2021.01.26.01.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 01:50:10 -0800 (PST)
Date: Tue, 26 Jan 2021 19:50:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: RE: [PATCH v10 11/12] mm/vmalloc: Hugepage vmalloc mappings
To: Andrew Morton <akpm@linux-foundation.org>, 'Christophe Leroy'
 <christophe.leroy@csgroup.eu>, David Laight <David.Laight@ACULAB.COM>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20210124082230.2118861-1-npiggin@gmail.com>
 <20210124082230.2118861-12-npiggin@gmail.com>
 <933352bd-dcf3-c483-4d7a-07afe1116cf1@csgroup.eu>
 <7749b310046c4b9baa07037af1d97d87@AcuMS.aculab.com>
In-Reply-To: <7749b310046c4b9baa07037af1d97d87@AcuMS.aculab.com>
MIME-Version: 1.0
Message-Id: <1611654541.je6x6v0xw5.astroid@bobo.none>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Ding Tianhong <dingtianhong@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 =?iso-8859-1?q?Zefan=0A?= Li <lizefan@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from David Laight's message of January 25, 2021 10:24 pm:
> From: Christophe Leroy
>> Sent: 25 January 2021 09:15
>>=20
>> Le 24/01/2021 =C3=A0 09:22, Nicholas Piggin a =C3=A9crit=C2=A0:
>> > Support huge page vmalloc mappings. Config option HAVE_ARCH_HUGE_VMALL=
OC
>> > enables support on architectures that define HAVE_ARCH_HUGE_VMAP and
>> > supports PMD sized vmap mappings.
>> >
>> > vmalloc will attempt to allocate PMD-sized pages if allocating PMD siz=
e
>> > or larger, and fall back to small pages if that was unsuccessful.
>> >
>> > Architectures must ensure that any arch specific vmalloc allocations
>> > that require PAGE_SIZE mappings (e.g., module allocations vs strict
>> > module rwx) use the VM_NOHUGE flag to inhibit larger mappings.
>> >
>> > When hugepage vmalloc mappings are enabled in the next patch, this
>> > reduces TLB misses by nearly 30x on a `git diff` workload on a 2-node
>> > POWER9 (59,800 -> 2,100) and reduces CPU cycles by 0.54%.
>> >
>> > This can result in more internal fragmentation and memory overhead for=
 a
>> > given allocation, an option nohugevmalloc is added to disable at boot.
>> >
>> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> > ---
>> >   arch/Kconfig            |  10 +++
>> >   include/linux/vmalloc.h |  18 ++++
>> >   mm/page_alloc.c         |   5 +-
>> >   mm/vmalloc.c            | 192 ++++++++++++++++++++++++++++++--------=
--
>> >   4 files changed, 177 insertions(+), 48 deletions(-)
>> >
>>=20
>> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> > index 0377e1d059e5..eef61e0f5170 100644
>> > --- a/mm/vmalloc.c
>> > +++ b/mm/vmalloc.c
>>=20
>> > @@ -2691,15 +2746,18 @@ EXPORT_SYMBOL_GPL(vmap_pfn);
>> >   #endif /* CONFIG_VMAP_PFN */
>> >
>> >   static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_m=
ask,
>> > -				 pgprot_t prot, int node)
>> > +				 pgprot_t prot, unsigned int page_shift,
>> > +				 int node)
>> >   {
>> >   	const gfp_t nested_gfp =3D (gfp_mask & GFP_RECLAIM_MASK) | __GFP_ZE=
RO;
>> > -	unsigned int nr_pages =3D get_vm_area_size(area) >> PAGE_SHIFT;
>> > -	unsigned long array_size;
>> > -	unsigned int i;
>> > +	unsigned int page_order =3D page_shift - PAGE_SHIFT;
>> > +	unsigned long addr =3D (unsigned long)area->addr;
>> > +	unsigned long size =3D get_vm_area_size(area);
>> > +	unsigned int nr_small_pages =3D size >> PAGE_SHIFT;
>> >   	struct page **pages;
>> > +	unsigned int i;
>> >
>> > -	array_size =3D (unsigned long)nr_pages * sizeof(struct page *);
>> > +	array_size =3D (unsigned long)nr_small_pages * sizeof(struct page *)=
;
>>=20
>> array_size() is a function in include/linux/overflow.h
>>=20
>> For some reason, it breaks the build with your series.
>=20
> I can't see the replacement definition for array_size.
> The old local variable is deleted.

Yeah I saw that after taking another look. Must have sent in a bad diff.=20
The v11 fixed that and a couple of other compile issues.

Thanks,
Nick
