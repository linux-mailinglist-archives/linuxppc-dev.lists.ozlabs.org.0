Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id D99C78CB823
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 03:22:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IBeNuloZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VkYHl27k1z3gLV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 11:14:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IBeNuloZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VkYGz122Mz3fsL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 11:14:02 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6f693306b7cso1341186b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 18:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716340440; x=1716945240; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ucokp0AAkm1JrdVm50A3xJsq/C1UNhIjxFEJPxYe7E=;
        b=IBeNuloZrn4YcMQeNandIPw2dll/OSMKAhEqsll5ptl6VzSLnwU+vL3CrMRLXw+RbP
         Vidr76aTnrJ9opyutQBcQaU7jmw+LIHwRnb8MvhyWO8OdYCMhSjt+t2b3SeaYl0qahAZ
         3C73OaOVP0zAXXsBmf0+vrck/GNiVoUW5peLayF+RAPqLul2NsmFbGmPNLjhPwCU2+1j
         ZfszLtz1BvWuc5g7y39u3k7HiNktDgheuW75eg3PeangkLhGsdhJAMVw51G9gBlsXyDI
         fyzDwBIBcHm/dvsT8OxZth3OseA5QulfszWBsQQVVi4eslEGfqXwymy2SCcBusidr4TV
         fcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716340440; x=1716945240;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Ucokp0AAkm1JrdVm50A3xJsq/C1UNhIjxFEJPxYe7E=;
        b=jY+uJnZ7gS66yHlnnf7SrHus+tkWmY5vHanG8W7fOqcQcfUIjQVlKDToidieh+QNth
         J9DSGhT5Bcx2mTFzcwCe207mmR/gIjo4BczNTbflDTWNtaZDXy3G0cs+w5u10RvP8LxE
         /MVmKPKiZyZzJZsTJP7KGEjYGRHhv16D3OG93+UtsjoXIvuif1qe470lWsj6moAt+WK9
         bFSG0H+OTOw7CXli+JCe8Ql3+b8wLHyy8Wy6FN35eRn8JC1oGb0LDqGNA4lDAxWbjQ7I
         BQ3mI/fCYLiK9PzsmB4v5HzqLoa3MsD9aU5km116m0KN+u0CCSs5A7v8SvuFMj0GkoL/
         akgw==
X-Forwarded-Encrypted: i=1; AJvYcCUpzMnxUU2CgXwjjL+7ElZkhHwda7N79QY4seXssIkItNnnlDe0lX68ONN+vDjMI9zw6g3RPabvh2YMpDjxvgzKX8yMP0JwayUi/FdwOg==
X-Gm-Message-State: AOJu0Yz9Nj1v3qmaO+paOO3mQTUhulxrDq32ReMvk4w+r/Z10jq+uUFv
	OwCmd/Wz+ngt1YLUDsXHFsb99wkmGXbDDfoREjKhWk55BBiWpImZ
X-Google-Smtp-Source: AGHT+IEeVFE7TfOpUrd1nI8e4z4RKvVMRMKWzoj8PEjSm761mXEMfBxfjcGLSveVOlL3LkbU11N+RQ==
X-Received: by 2002:a05:6a20:c909:b0:1b0:1025:2d5 with SMTP id adf61e73a8af0-1b1f88a6e1fmr780915637.36.1716340440370;
        Tue, 21 May 2024 18:14:00 -0700 (PDT)
Received: from localhost (110-175-65-7.tpgi.com.au. [110.175.65.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bd930a3bf0sm1972833a91.5.2024.05.21.18.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 18:13:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 May 2024 11:13:53 +1000
Message-Id: <D1FRWM5DHHOT.3EAJGCLO0YTND@gmail.com>
Subject: Re: [RFC PATCH v2 18/20] powerpc/64s: Use contiguous PMD/PUD
 instead of HUGEPD
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Jason Gunthorpe" <jgg@nvidia.com>, "Peter Xu"
 <peterx@redhat.com>, "Oscar Salvador" <osalvador@suse.de>, "Michael
 Ellerman" <mpe@ellerman.id.au>
X-Mailer: aerc 0.17.0
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <ac9f4f2d6e571e4579a8125b81eaa88fbddd6187.1715971869.git.christophe.leroy@csgroup.eu> <D1EHK0STZ19E.3CTOAWG7LVBPK@gmail.com> <99575c2c-7840-4fa4-b84e-aaddc7fef4cb@csgroup.eu>
In-Reply-To: <99575c2c-7840-4fa4-b84e-aaddc7fef4cb@csgroup.eu>
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue May 21, 2024 at 2:43 AM AEST, Christophe Leroy wrote:
>
>
> Le 20/05/2024 =C3=A0 14:54, Nicholas Piggin a =C3=A9crit=C2=A0:
> > On Sat May 18, 2024 at 5:00 AM AEST, Christophe Leroy wrote:
> >> On book3s/64, the only user of hugepd is hash in 4k mode.
> >>
> >> All other setups (hash-64, radix-4, radix-64) use leaf PMD/PUD.
> >>
> >> Rework hash-4k to use contiguous PMD and PUD instead.
> >>
> >> In that setup there are only two huge page sizes: 16M and 16G.
> >>
> >> 16M sits at PMD level and 16G at PUD level.
> >>
> >> pte_update doesn't know page size, lets use the same trick as
> >> hpte_need_flush() to get page size from segment properties. That's
> >> not the most efficient way but let's do that until callers of
> >> pte_update() provide page size instead of just a huge flag.
> >>
> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> ---
> >>   arch/powerpc/include/asm/book3s/64/hash-4k.h  | 15 --------
> >>   arch/powerpc/include/asm/book3s/64/hash.h     | 38 +++++++++++++++--=
--
> >>   arch/powerpc/include/asm/book3s/64/hugetlb.h  | 38 -----------------=
--
> >>   .../include/asm/book3s/64/pgtable-4k.h        | 34 -----------------
> >>   .../include/asm/book3s/64/pgtable-64k.h       | 20 ----------
> >>   arch/powerpc/include/asm/hugetlb.h            |  4 ++
> >>   .../include/asm/nohash/32/hugetlb-8xx.h       |  4 --
> >>   .../powerpc/include/asm/nohash/hugetlb-e500.h |  4 --
> >>   arch/powerpc/include/asm/page.h               |  8 ----
> >>   arch/powerpc/mm/book3s64/hash_utils.c         | 11 ++++--
> >>   arch/powerpc/mm/book3s64/pgtable.c            | 12 ------
> >>   arch/powerpc/mm/hugetlbpage.c                 | 19 ----------
> >>   arch/powerpc/mm/pgtable.c                     |  2 +-
> >>   arch/powerpc/platforms/Kconfig.cputype        |  1 -
> >>   14 files changed, 43 insertions(+), 167 deletions(-)
> >>
> >> diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/power=
pc/include/asm/book3s/64/hash-4k.h
> >> index 6472b08fa1b0..c654c376ef8b 100644
> >> --- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
> >> +++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
> >> @@ -74,21 +74,6 @@
> >>   #define remap_4k_pfn(vma, addr, pfn, prot)	\
> >>   	remap_pfn_range((vma), (addr), (pfn), PAGE_SIZE, (prot))
> >>  =20
> >> -#ifdef CONFIG_HUGETLB_PAGE
> >> -static inline int hash__hugepd_ok(hugepd_t hpd)
> >> -{
> >> -	unsigned long hpdval =3D hpd_val(hpd);
> >> -	/*
> >> -	 * if it is not a pte and have hugepd shift mask
> >> -	 * set, then it is a hugepd directory pointer
> >> -	 */
> >> -	if (!(hpdval & _PAGE_PTE) && (hpdval & _PAGE_PRESENT) &&
> >> -	    ((hpdval & HUGEPD_SHIFT_MASK) !=3D 0))
> >> -		return true;
> >> -	return false;
> >> -}
> >> -#endif
> >> -
> >>   /*
> >>    * 4K PTE format is different from 64K PTE format. Saving the hash_s=
lot is just
> >>    * a matter of returning the PTE bits that need to be modified. On 6=
4K PTE,
> >> diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/=
include/asm/book3s/64/hash.h
> >> index faf3e3b4e4b2..509811ca7695 100644
> >> --- a/arch/powerpc/include/asm/book3s/64/hash.h
> >> +++ b/arch/powerpc/include/asm/book3s/64/hash.h
> >> @@ -4,6 +4,7 @@
> >>   #ifdef __KERNEL__
> >>  =20
> >>   #include <asm/asm-const.h>
> >> +#include <asm/book3s/64/slice.h>
> >>  =20
> >>   /*
> >>    * Common bits between 4K and 64K pages in a linux-style PTE.
> >> @@ -161,14 +162,10 @@ extern void hpte_need_flush(struct mm_struct *mm=
, unsigned long addr,
> >>   			    pte_t *ptep, unsigned long pte, int huge);
> >>   unsigned long htab_convert_pte_flags(unsigned long pteflags, unsigne=
d long flags);
> >>   /* Atomic PTE updates */
> >> -static inline unsigned long hash__pte_update(struct mm_struct *mm,
> >> -					 unsigned long addr,
> >> -					 pte_t *ptep, unsigned long clr,
> >> -					 unsigned long set,
> >> -					 int huge)
> >> +static inline unsigned long hash__pte_update_one(pte_t *ptep, unsigne=
d long clr,
> >> +						 unsigned long set)
> >>   {
> >>   	__be64 old_be, tmp_be;
> >> -	unsigned long old;
> >>  =20
> >>   	__asm__ __volatile__(
> >>   	"1:	ldarx	%0,0,%3		# pte_update\n\
> >> @@ -182,11 +179,38 @@ static inline unsigned long hash__pte_update(str=
uct mm_struct *mm,
> >>   	: "r" (ptep), "r" (cpu_to_be64(clr)), "m" (*ptep),
> >>   	  "r" (cpu_to_be64(H_PAGE_BUSY)), "r" (cpu_to_be64(set))
> >>   	: "cc" );
> >> +
> >> +	return be64_to_cpu(old_be);
> >> +}
> >> +
> >> +static inline unsigned long hash__pte_update(struct mm_struct *mm,
> >> +					 unsigned long addr,
> >> +					 pte_t *ptep, unsigned long clr,
> >> +					 unsigned long set,
> >> +					 int huge)
> >> +{
> >> +	unsigned long old;
> >> +
> >> +	old =3D hash__pte_update_one(ptep, clr, set);
> >> +
> >> +	if (huge && IS_ENABLED(CONFIG_PPC_4K_PAGES)) {
> >> +		unsigned int psize =3D get_slice_psize(mm, addr);
> >> +		int nb, i;
> >> +
> >> +		if (psize =3D=3D MMU_PAGE_16M)
> >> +			nb =3D SZ_16M / PMD_SIZE;
> >> +		else if (psize =3D=3D MMU_PAGE_16G)
> >> +			nb =3D SZ_16G / PUD_SIZE;
> >> +		else
> >> +			nb =3D 1;
> >> +
> >> +		for (i =3D 1; i < nb; i++)
> >> +			hash__pte_update_one(ptep + i, clr, set);
> >> +	}
> >>   	/* huge pages use the old page table lock */
> >>   	if (!huge)
> >>   		assert_pte_locked(mm, addr);
> >>  =20
> >> -	old =3D be64_to_cpu(old_be);
> >>   	if (old & H_PAGE_HASHPTE)
> >>   		hpte_need_flush(mm, addr, ptep, old, huge);
> >>  =20
> >=20
> > Nice series, I don't know this hugepd code very well but I'll try.
> > Why do you have to replicate the PTE entry here? The hash table refill
> > should always be working on the first PTE of the page otherwise we have
> > bigger problems.
>
> I don't know how book3s/64 works exactly, but on nohash, when you get a=
=20
> TLB miss exception the only thing you have is the address and you don't=
=20
> know yes it is a hugepage so you get the PTE as if it was a 4k page and=
=20
> it is only when you read that PTE that you know it is a hugepage.
>
> Ok, on book3s/64 the page size seems to be encoded inside the segment so=
=20
> maybe it is a bit different but anyway the TLB miss exception (or DSI ?)=
=20
> can happen at any address.

Right.

If you think of the hash page table as a software loaded TLB (which
is how Linux kind of thinks of it), then DSI is a TLB miss. hash_page_x
calls find the Linux pte and load that translation into hash page table.

One of the hard parts is keeping them coherent with low overhead. This
requires pte bits H_PAGE_BUSY as a lock and H_PAGE_HASHPTE which means
it might be in the hash table. So Linux PTE and hash PTE have to be
1:1 in general.

There are probably cases where we could get away from 1:1, but I would
much prefer not to. Maybe read-only access would be okay though. But
the hash_page will have to always operate on the 0th pte, which I think
we get via segment size masking, same for any set / update / clear of
the pte.

> >=20
> > What paths look at the N > 0 PTEs of a contiguous page entry?
> >=20
>
> pte_offset_kernel() or pte_offset_map_lock() will land on any contiguous=
=20
> PTE based on the address handed to pte_index(), as if it was a standard=
=20
> (4k or 64k) page.
>
> pte_index() doesn't know it is a hugepage, that's the reason why we need=
=20
> to duplicate the entry.

From the mm/ side of things, hugetlb page tables are always walked via
the huge vma which knows the page size and could align address... I
guess except for fast gup? Which should be read-only. So okay you do
need to replicate huge ptes for fast gup at least. Any others?

There's going to need to be a little more to it. __hash_page_huge sets
PTE accessed and dirty for example, so if we allow any PTE readers to
check the non-0th pte we would have to do something about that.

How do you deal with dirty/accessed bits for other subarchs?

We could just remove the hash_page setting of those bits and just cause
a fault and require Linux mm to set them. At least for hugepages we
could do that probably without any real performance worry.

Thanks,
Nick
