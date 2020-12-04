Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF422CE954
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 09:16:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnQXV3nQ5zDrMy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 19:16:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hiaCSk2R; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnQST1zr0zDr6w
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 19:13:13 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id 4so2686000plk.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Dec 2020 00:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=3fbzFtODlG6DhIFOuWtZWUtQuIVTw1JtB82OhelR1f8=;
 b=hiaCSk2RB4ZbZZ7qUDKx5WuheWKkTpmcIvHy+cDMvtWoe2wDZGGmS/CTLyju1KF2h8
 wrdeWY5t6bUGml15IUYpkpCB3LWc8lGpFbHfR3bWaCjZlD3sXcH9T/3RpltgStc6Koto
 1j8Cz+Cj3tG5sw/UmjdiDUMINMSPhCVp5JuxGyUJtGxH4PAe0RR8GUSCV82Zd8p/Yh41
 BzYOl3j+6ON8TZJFpdErKBQway7qpqf5hq+9ZcktbSgtVO/++tslXRwcBKuYp/G8Kldq
 AlgSDTdbZ8gam9IwQZQDkNGSFEc5lAR9DYMhIO6aym5RiP/KPWlSuKDaVLgbPXhM+Sm+
 jnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=3fbzFtODlG6DhIFOuWtZWUtQuIVTw1JtB82OhelR1f8=;
 b=YCt5ptYAaF76LiyDEPSIwiH5Aoci3Yw6QdUixtDlETrcfCWmkofcwNqDMqJWO6Uubd
 4PREVg7Q9NP1Bnv7Dg+uuCtZI1XIWbe/ad1KUIde0FXp2P/FPLzfdC5Q5Ro7iCsT/Y0U
 RNbQYABECYnr474QkGF4xgr44s+CkD0wbjhS74Q9cYj9gs9zH44EJrYCwHGp+GqoBN0W
 QxNT7TcCJinxDbTf9rDV1a9XpLB85Vx4jGVNB/qS+VY3K/EKANjxf0JlRPGdJjwC05Hg
 wlasYSUhjlIiI+mLqyxf5PQouHYfqPjIZGHkMhaNbuGtDlqoLktVJ4QcxqtaAgnOpP5X
 2GOQ==
X-Gm-Message-State: AOAM531BxZdzuX5l7CJhrkcJTuDIYT57NiE3JWh0eUfLK2/jGYUx1Q9o
 snX8FLIMvYeftM0c6bfSx4k=
X-Google-Smtp-Source: ABdhPJxFGKvxSujUjSN4DbHCJiDIqCfKt/Gd/ih5Y1oXid6kspH8VxuaLkxN8iSd6XopGq0+v05kZA==
X-Received: by 2002:a17:902:c395:b029:da:9aca:c972 with SMTP id
 g21-20020a170902c395b02900da9acac972mr2815306plg.32.1607069588337; 
 Fri, 04 Dec 2020 00:13:08 -0800 (PST)
Received: from localhost ([1.129.136.83])
 by smtp.gmail.com with ESMTPSA id n68sm4177105pfn.161.2020.12.04.00.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 00:13:07 -0800 (PST)
Date: Fri, 04 Dec 2020 18:12:58 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v8 11/12] mm/vmalloc: Hugepage vmalloc mappings
To: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Edgecombe, Rick P"
 <rick.p.edgecombe@intel.com>
References: <20201128152559.999540-1-npiggin@gmail.com>
 <20201128152559.999540-12-npiggin@gmail.com>
 <e9d3a50e1b18f9ea1cdfdc221bef75db19273417.camel@intel.com>
In-Reply-To: <e9d3a50e1b18f9ea1cdfdc221bef75db19273417.camel@intel.com>
MIME-Version: 1.0
Message-Id: <1607068679.lfd133za4h.astroid@bobo.none>
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "lizefan@huawei.com" <lizefan@huawei.com>,
 "Jonathan.Cameron@Huawei.com" <Jonathan.Cameron@Huawei.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Edgecombe, Rick P's message of December 1, 2020 6:21 am:
> On Sun, 2020-11-29 at 01:25 +1000, Nicholas Piggin wrote:
>> Support huge page vmalloc mappings. Config option
>> HAVE_ARCH_HUGE_VMALLOC
>> enables support on architectures that define HAVE_ARCH_HUGE_VMAP and
>> supports PMD sized vmap mappings.
>>=20
>> vmalloc will attempt to allocate PMD-sized pages if allocating PMD
>> size
>> or larger, and fall back to small pages if that was unsuccessful.
>>=20
>> Allocations that do not use PAGE_KERNEL prot are not permitted to use
>> huge pages, because not all callers expect this (e.g., module
>> allocations vs strict module rwx).
>=20
> Several architectures (x86, arm64, others?) allocate modules initially
> with PAGE_KERNEL and so I think this test will not exclude module
> allocations in those cases.

Ah, thanks. I guess archs must additionally ensure that their
PAGE_KERNEL allocations are suitable for huge page mappings before
enabling the option.

If there is interest from those archs to support this, I have an
early (un-posted) patch that adds an explicit VM_HUGE flag that could
override the pessemistic arch default. It's not much trouble to add this=20
to the large system hash allocations. It's very out of date now but I=20
can at least give what I have to anyone doing an arch support that
wants it.

>=20
> [snip]
>=20
>> @@ -2400,6 +2453,7 @@ static inline void set_area_direct_map(const
>> struct vm_struct *area,
>>  {
>>  	int i;
>> =20
>> +	/* HUGE_VMALLOC passes small pages to set_direct_map */
>>  	for (i =3D 0; i < area->nr_pages; i++)
>>  		if (page_address(area->pages[i]))
>>  			set_direct_map(area->pages[i]);
>> @@ -2433,11 +2487,12 @@ static void vm_remove_mappings(struct
>> vm_struct *area, int deallocate_pages)
>>  	 * map. Find the start and end range of the direct mappings to
>> make sure
>>  	 * the vm_unmap_aliases() flush includes the direct map.
>>  	 */
>> -	for (i =3D 0; i < area->nr_pages; i++) {
>> +	for (i =3D 0; i < area->nr_pages; i +=3D 1U << area->page_order) {
>>  		unsigned long addr =3D (unsigned long)page_address(area-
>> >pages[i]);
>>  		if (addr) {
>> +			unsigned long page_size =3D PAGE_SIZE << area-
>> >page_order;
>>  			start =3D min(addr, start);
>> -			end =3D max(addr + PAGE_SIZE, end);
>> +			end =3D max(addr + page_size, end);
>>  			flush_dmap =3D 1;
>>  		}
>>  	}
>=20
> The logic around this is a bit tangled. The reset of the direct map has
> to succeed, but if the set_direct_map_() functions require a split they
> could fail. For x86, set_memory_ro() calls on a vmalloc alias will
> mirror the page size and permission on the direct map and so the direct
> map will be broken to 4k pages if it's a RO vmalloc allocation.
>=20
> But after this, module vmalloc()'s could have large pages which would
> result in large RO pages on the direct map. Then it could possibly fail
> when trying to reset a 4k page out of a large RO direct map mapping.=20
>=20
> I think either module allocations need to be actually excluded from
> having large pages (seems like you might have seen other issues as
> well?), or another option could be to use the changes here:
> https://lore.kernel.org/lkml/20201125092208.12544-4-rppt@kernel.org/
> to reset the direct map for a large page range at a time for large=20
> vmalloc pages.
>=20

Right, x86 would have to do something about that before enabling.
A VM_HUGE flag might be quick and easy but maybe other options are not=20
too difficult.

Thanks,
Nick
