Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD39917589
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 03:24:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Yrxq8kvf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W83rM1X9xz3dvs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 11:24:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Yrxq8kvf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W83qf26PRz3ck2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 11:23:24 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1f9b523a15cso531405ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 18:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719364998; x=1719969798; darn=lists.ozlabs.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4B0rJOt+TwGvnGU5npNqzbhof2wF8oGmpu7vqDya1w=;
        b=Yrxq8kvf8IQD8rqZvDM1nnrfAFDg9oaC9tM2OKcgEfT5RpTLv4A4UkpzfyxZSsXQzP
         WrgQD7HkG/cyjaW9plOjJTn7F3AM3m9QFCFlpvwOljlArafzVwQ4sP4Wy8lHT3fKK2ps
         BPqdT6M4+ojnksI8oyM4uaUu1Iw4P8iuUv/wFPtGrC3B/n1TwR8RXGQgZRW00JU1Pj+K
         oWUpZwbK66jSb9m5saDjIRNGSO5O1v6Pkl1y1/T+G3qvmykSYJJatjcojb26GJKP18zi
         dEf6VGbfRGVKMYkBTxIpFc7eSrlM1mLRoNEiXGa2y/4OmiGUtBYnht8/M/IyYal8V4nJ
         mNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719364998; x=1719969798;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G4B0rJOt+TwGvnGU5npNqzbhof2wF8oGmpu7vqDya1w=;
        b=d31+7ZfHPzJQrMEQqOWwPY32KfM89tU1HbZgfvN94El72Qm5iaxXwHW9aCXq2L8lvT
         w6JIET0wSnWbPgzX4W69hNebe0IjLThHUc5wA4The3eyTRL0Z35qKTUkSyaJBnO11+J8
         XjaRX3uzu5G+sav/noAWZMfZiap3fqws84um6bXtGdukNTfRTogh0Z9+EbxITE3bjokv
         LdS92EUk3NqtOw9yg4C7bp/p17up6YoFHcTPqbyWcsYt1oCWpXMhGIjQzqZx27q+TUkF
         h3pp1htO0MisXlYtvtQ2C/+WGUj4W/masjxcCoQDbn+NscHpM4hjPA5Zq8pGpj+7gBTl
         /07g==
X-Forwarded-Encrypted: i=1; AJvYcCVyTHOK/tLgfkVUy7nM53za2JuQsssSeV0MxOiX1KPVbG9aOPzqVYa0Z+HHaWGWdJVL1L1Mm5cEFCrZL0sxXRx5xLniSbCTgCi8V80M5w==
X-Gm-Message-State: AOJu0YxKpBvWabd6xa2zKBSfErLsoO/8J9a0D2WbRxBWoqAT+5S9iDZo
	xw2vFBqTt9JWw7NbRAbGnjvCxV10r+jrbexlNb1PblimxQos6woK
X-Google-Smtp-Source: AGHT+IEqVqDw1A2NGO/alG4xT0pZfiNKGUIkmcWKhLu+8DBykPZWCX+p598Z0xCi0cvGZzLtolmp2Q==
X-Received: by 2002:a17:902:7441:b0:1f4:a04e:8713 with SMTP id d9443c01a7336-1fa5e6bde38mr60633605ad.28.1719364997855;
        Tue, 25 Jun 2024 18:23:17 -0700 (PDT)
Received: from localhost (118-211-5-80.tpgi.com.au. [118.211.5.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3c5d29sm87734655ad.154.2024.06.25.18.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 18:23:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Jun 2024 11:23:11 +1000
Message-Id: <D29K0SVIUJDR.2HQTLIJG4R7VG@gmail.com>
To: "LEROY Christophe" <christophe.leroy2@cs-soprasteria.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, "Jason Gunthorpe" <jgg@nvidia.com>,
 "Peter Xu" <peterx@redhat.com>, "Oscar Salvador" <osalvador@suse.de>,
 "Michael Ellerman" <mpe@ellerman.id.au>
Subject: Re: [PATCH v6 21/23] powerpc/64s: Use contiguous PMD/PUD instead of
 HUGEPD
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.17.0
References: <cover.1719240269.git.christophe.leroy@csgroup.eu>
 <23f3fe9e8fe37cb164a369850d4569dddf359fdf.1719240269.git.christophe.leroy@csgroup.eu> <D28TSEV6QV38.2NWPFRY8KCQK7@gmail.com> <a8f76535-2d5a-4f25-83be-31aab1cd38c4@cs-soprasteria.com>
In-Reply-To: <a8f76535-2d5a-4f25-83be-31aab1cd38c4@cs-soprasteria.com>
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

On Tue Jun 25, 2024 at 3:20 PM AEST, LEROY Christophe wrote:
>
>
> Le 25/06/2024 =C3=A0 06:49, Nicholas Piggin a =C3=A9crit=C2=A0:
> > On Tue Jun 25, 2024 at 12:45 AM AEST, Christophe Leroy wrote:
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
> >=20
> > [snip]
> >=20
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
> >> +	if (IS_ENABLED(CONFIG_PPC_4K_PAGES) && huge) {
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
> >> +		WARN_ON_ONCE(nb =3D=3D 1);	/* Should never happen */
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
> > We definitely need a bit more comment and changelog about the atomicity
> > issues here. I think the plan should be all hash-side access just
> > operates on PTE[0], which should avoid that whole race. There could be
> > some cases that don't follow that. Adding some warnings to catch such
> > things could be good too.
>
> That seems to be the case indeed, as we have the following in=20
> hash_page_mm():
>
> #ifndef CONFIG_PPC_64K_PAGES
> 	/*
> 	 * If we use 4K pages and our psize is not 4K, then we might
> 	 * be hitting a special driver mapping, and need to align the
> 	 * address before we fetch the PTE.
> 	 *
> 	 * It could also be a hugepage mapping, in which case this is
> 	 * not necessary, but it's not harmful, either.
> 	 */
> 	if (psize !=3D MMU_PAGE_4K)
> 		ea &=3D ~((1ul << mmu_psize_defs[psize].shift) - 1);
> #endif /* CONFIG_PPC_64K_PAGES */

Yeah, for that one it works (comment needs updating to say that it
*is* necessary). I think that's the main thing but there's other
possible places where it might not hold -- KVM too, not just the
hash refill.

> >=20
> > I'd been meaning to do more on this sooner, sorry. I've started
> > tinkering with adding a bit of debug code. I'll see if I can help with
> > adding a bit of comments.
>
> Yes would we very welcome, I guess you'll send it as followup/fixup=20
> patch to the series ?

Yeah, the basic approach I think is good, so it wouldn't be a
big rework.

>
> >=20
> > [snip]
> >=20
> >> diff --git a/arch/powerpc/mm/book3s64/hugetlbpage.c b/arch/powerpc/mm/=
book3s64/hugetlbpage.c
> >> index 5a2e512e96db..83c3361b358b 100644
> >> --- a/arch/powerpc/mm/book3s64/hugetlbpage.c
> >> +++ b/arch/powerpc/mm/book3s64/hugetlbpage.c
> >> @@ -53,6 +53,16 @@ int __hash_page_huge(unsigned long ea, unsigned lon=
g access, unsigned long vsid,
> >>   		/* If PTE permissions don't match, take page fault */
> >>   		if (unlikely(!check_pte_access(access, old_pte)))
> >>   			return 1;
> >> +		/*
> >> +		 * If hash-4k, hugepages use seeral contiguous PxD entries
> >> +		 * so bail out and let mm make the page young or dirty
> >> +		 */
> >> +		if (IS_ENABLED(CONFIG_PPC_4K_PAGES)) {
> >> +			if (!(old_pte & _PAGE_ACCESSED))
> >> +				return 1;
> >> +			if ((access & _PAGE_WRITE) && !(old_pte & _PAGE_DIRTY))
> >> +				return 1;
> >> +		}
> >>  =20
> >>   		/*
> >>   		 * Try to lock the PTE, add ACCESSED and DIRTY if it was
> >=20
> > I'm hoping we wouldn't have to do this, if we follow the PTE[0] rule.
>
> But we still need all entries to be updated so that page walker which=20
> don't know they must use PTE[0] get the right information ?

Ah yeah. Maybe for ACCESSED|DIRTY we can slightly adjust that rule
and apply it to all PTEs. If we can do that then it takes care of
a few other cases too.

Bug what is the consequence of two pte_update racing? Let's say
page_vma_mkclean_one vs setting dirty. Can you end up with some
PTEs dirty and some not?

Thanks,
Nick
