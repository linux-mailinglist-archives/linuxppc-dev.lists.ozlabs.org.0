Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 931FC8C9DC4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2024 15:01:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OvX7kHx3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vjcx72yYMz3fwd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2024 22:55:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OvX7kHx3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VjcwP1SVdz3cjv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2024 22:54:44 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1eeabda8590so68357885ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2024 05:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716209682; x=1716814482; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PsaS7hwC6SGwZpxPNV/aTtZM8wWRDwUCiBIx6wA+SRA=;
        b=OvX7kHx3IjxEAmCx9W18KX1NeFWbtjnpIlDJl13GUsF6qGXje9QLdctDTwA8VaQsRl
         B8yNFSzE5f6PaBrzXnr1UIMDbYR5KY94eo+Q9iadWk3fyTI8ygOUMajp+BUiZkiHb6lz
         tib3lOFG/qbLQ+/kNy6KZMROyf7x6vwgY0b6ikE7CwsE2ZhTtktdMF80HLrMqvQ0NgSQ
         nqRNV5OfOY8IwRLNckI0z1e6meqPHGFOBaLFXzYKPTO4VJPc47Ompmd64vwzXtPd7b9d
         uqbu7LPMZZvDNM74ScXfTN35SBURSG71CgvulqVhlbj9M+Hw1TcITsOsL5k9lXf3tLqz
         M8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716209682; x=1716814482;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PsaS7hwC6SGwZpxPNV/aTtZM8wWRDwUCiBIx6wA+SRA=;
        b=FviuXLz+so2l855BUjC4/J1I4rohdwqS6W6jOi+J9OGJpxVxxIeXBfbHpiyUPzpgoE
         BgfCIP0vjVFWJIiGU8+iYpV2yX3580ngWMuscNiUdtYqzalKyKG4CRASXHz8Hqosn3nu
         6j6+7nT2EDrqNMlJZVYnnQ6hxJOg6kttp24/8bYT2uuSAbfAVZ9J6Qkt3PQcPjWHE6mB
         BFy4iDK8W+EQFfTNRWy57DsXdXYf9ES3FsCPTOHOGrfwos5VOX/BAENTDTi9YJYuD3ps
         QWRSwChM24l6feUxema08M6vfD3SDgtM5l2VGYYXAgUvf2m6m1IWUSmcGSd8FiHkwEva
         2KmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH0iln3wdGt9eX2F0tF7/MAhQ2emvwa5NvNl2l1xPECuQKbpWKVSQqTCVj7HcEOo/YCnWMA2p4+exzngmgzRiaZPaBmNZVB+crV3mnvA==
X-Gm-Message-State: AOJu0Yxj/iddXP26X8/8Wx6GlX/XYOXX6XbthvMD0HGpjlI6K5Zeq0vA
	lydg6DazefmJb/mtnXWcxvIEZO68Qzouxgw+ny7psTk1/xskN/3o
X-Google-Smtp-Source: AGHT+IGQD5voDad482etfAFYqJItSYWnKfB4jvZBywe8XpDGx+z9MFzihkDpII2A9KT8cmADi+Mg7g==
X-Received: by 2002:a05:6a00:b51:b0:6ed:88e5:53d4 with SMTP id d2e1a72fcca58-6f4e02aa365mr35041612b3a.8.1716209682074;
        Mon, 20 May 2024 05:54:42 -0700 (PDT)
Received: from localhost (110-175-65-7.tpgi.com.au. [110.175.65.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4eccc3b91sm16004093b3a.66.2024.05.20.05.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 05:54:41 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 May 2024 22:54:35 +1000
Message-Id: <D1EHK0STZ19E.3CTOAWG7LVBPK@gmail.com>
Subject: Re: [RFC PATCH v2 18/20] powerpc/64s: Use contiguous PMD/PUD
 instead of HUGEPD
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Jason Gunthorpe" <jgg@nvidia.com>, "Peter Xu"
 <peterx@redhat.com>, "Oscar Salvador" <osalvador@suse.de>, "Michael
 Ellerman" <mpe@ellerman.id.au>
X-Mailer: aerc 0.17.0
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <ac9f4f2d6e571e4579a8125b81eaa88fbddd6187.1715971869.git.christophe.leroy@csgroup.eu>
In-Reply-To: <ac9f4f2d6e571e4579a8125b81eaa88fbddd6187.1715971869.git.christophe.leroy@csgroup.eu>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat May 18, 2024 at 5:00 AM AEST, Christophe Leroy wrote:
> On book3s/64, the only user of hugepd is hash in 4k mode.
>
> All other setups (hash-64, radix-4, radix-64) use leaf PMD/PUD.
>
> Rework hash-4k to use contiguous PMD and PUD instead.
>
> In that setup there are only two huge page sizes: 16M and 16G.
>
> 16M sits at PMD level and 16G at PUD level.
>
> pte_update doesn't know page size, lets use the same trick as
> hpte_need_flush() to get page size from segment properties. That's
> not the most efficient way but let's do that until callers of
> pte_update() provide page size instead of just a huge flag.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/book3s/64/hash-4k.h  | 15 --------
>  arch/powerpc/include/asm/book3s/64/hash.h     | 38 +++++++++++++++----
>  arch/powerpc/include/asm/book3s/64/hugetlb.h  | 38 -------------------
>  .../include/asm/book3s/64/pgtable-4k.h        | 34 -----------------
>  .../include/asm/book3s/64/pgtable-64k.h       | 20 ----------
>  arch/powerpc/include/asm/hugetlb.h            |  4 ++
>  .../include/asm/nohash/32/hugetlb-8xx.h       |  4 --
>  .../powerpc/include/asm/nohash/hugetlb-e500.h |  4 --
>  arch/powerpc/include/asm/page.h               |  8 ----
>  arch/powerpc/mm/book3s64/hash_utils.c         | 11 ++++--
>  arch/powerpc/mm/book3s64/pgtable.c            | 12 ------
>  arch/powerpc/mm/hugetlbpage.c                 | 19 ----------
>  arch/powerpc/mm/pgtable.c                     |  2 +-
>  arch/powerpc/platforms/Kconfig.cputype        |  1 -
>  14 files changed, 43 insertions(+), 167 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/powerpc/=
include/asm/book3s/64/hash-4k.h
> index 6472b08fa1b0..c654c376ef8b 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
> @@ -74,21 +74,6 @@
>  #define remap_4k_pfn(vma, addr, pfn, prot)	\
>  	remap_pfn_range((vma), (addr), (pfn), PAGE_SIZE, (prot))
> =20
> -#ifdef CONFIG_HUGETLB_PAGE
> -static inline int hash__hugepd_ok(hugepd_t hpd)
> -{
> -	unsigned long hpdval =3D hpd_val(hpd);
> -	/*
> -	 * if it is not a pte and have hugepd shift mask
> -	 * set, then it is a hugepd directory pointer
> -	 */
> -	if (!(hpdval & _PAGE_PTE) && (hpdval & _PAGE_PRESENT) &&
> -	    ((hpdval & HUGEPD_SHIFT_MASK) !=3D 0))
> -		return true;
> -	return false;
> -}
> -#endif
> -
>  /*
>   * 4K PTE format is different from 64K PTE format. Saving the hash_slot =
is just
>   * a matter of returning the PTE bits that need to be modified. On 64K P=
TE,
> diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/inc=
lude/asm/book3s/64/hash.h
> index faf3e3b4e4b2..509811ca7695 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash.h
> @@ -4,6 +4,7 @@
>  #ifdef __KERNEL__
> =20
>  #include <asm/asm-const.h>
> +#include <asm/book3s/64/slice.h>
> =20
>  /*
>   * Common bits between 4K and 64K pages in a linux-style PTE.
> @@ -161,14 +162,10 @@ extern void hpte_need_flush(struct mm_struct *mm, u=
nsigned long addr,
>  			    pte_t *ptep, unsigned long pte, int huge);
>  unsigned long htab_convert_pte_flags(unsigned long pteflags, unsigned lo=
ng flags);
>  /* Atomic PTE updates */
> -static inline unsigned long hash__pte_update(struct mm_struct *mm,
> -					 unsigned long addr,
> -					 pte_t *ptep, unsigned long clr,
> -					 unsigned long set,
> -					 int huge)
> +static inline unsigned long hash__pte_update_one(pte_t *ptep, unsigned l=
ong clr,
> +						 unsigned long set)
>  {
>  	__be64 old_be, tmp_be;
> -	unsigned long old;
> =20
>  	__asm__ __volatile__(
>  	"1:	ldarx	%0,0,%3		# pte_update\n\
> @@ -182,11 +179,38 @@ static inline unsigned long hash__pte_update(struct=
 mm_struct *mm,
>  	: "r" (ptep), "r" (cpu_to_be64(clr)), "m" (*ptep),
>  	  "r" (cpu_to_be64(H_PAGE_BUSY)), "r" (cpu_to_be64(set))
>  	: "cc" );
> +
> +	return be64_to_cpu(old_be);
> +}
> +
> +static inline unsigned long hash__pte_update(struct mm_struct *mm,
> +					 unsigned long addr,
> +					 pte_t *ptep, unsigned long clr,
> +					 unsigned long set,
> +					 int huge)
> +{
> +	unsigned long old;
> +
> +	old =3D hash__pte_update_one(ptep, clr, set);
> +
> +	if (huge && IS_ENABLED(CONFIG_PPC_4K_PAGES)) {
> +		unsigned int psize =3D get_slice_psize(mm, addr);
> +		int nb, i;
> +
> +		if (psize =3D=3D MMU_PAGE_16M)
> +			nb =3D SZ_16M / PMD_SIZE;
> +		else if (psize =3D=3D MMU_PAGE_16G)
> +			nb =3D SZ_16G / PUD_SIZE;
> +		else
> +			nb =3D 1;
> +
> +		for (i =3D 1; i < nb; i++)
> +			hash__pte_update_one(ptep + i, clr, set);
> +	}
>  	/* huge pages use the old page table lock */
>  	if (!huge)
>  		assert_pte_locked(mm, addr);
> =20
> -	old =3D be64_to_cpu(old_be);
>  	if (old & H_PAGE_HASHPTE)
>  		hpte_need_flush(mm, addr, ptep, old, huge);
> =20

Nice series, I don't know this hugepd code very well but I'll try.
Why do you have to replicate the PTE entry here? The hash table refill
should always be working on the first PTE of the page otherwise we have
bigger problems.

What paths look at the N > 0 PTEs of a contiguous page entry?

Thanks,
Nick
