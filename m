Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D02915DC9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 06:50:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bT6uW6rv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7XTC6JyLz3dHC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 14:50:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bT6uW6rv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7XST4Sbvz3cP3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 14:49:59 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-6bce380eb9bso3056165a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 21:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719290993; x=1719895793; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZuqG7biAOqgDgQrrsZ67iRk9Ad3cri9ERlzvBniIlQU=;
        b=bT6uW6rvcEmuWl39TtfYzig3Z7Hpgi65rX0i9E/OcWtn0gvENeku1jy0JY0tbA4Xwr
         p5xPSJeYXfr/W9dCwDs77P2CmpgLnlTPJYS7DOYCRxVxmv4iqKhGsWLCimHcgKJb5wn9
         QO6lFNXx7H1epm8cigJ3GPsIzAna3+USJOF0k2AV0f7jPqJKrRhQlsfQT9BmdoNBMLHN
         ykalXeEDB2tFc1PNAf2km+GN7CyoitnSI0QM2O5nDA4UQkq008TqT1erowmFfV33bVX1
         YE0KGasCtQDMjTc/yUBtuAvn4a3HFAVL26VpmCfapTBc0WB1VFQKg14S1JZv4IEwIm0Q
         4ojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719290993; x=1719895793;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZuqG7biAOqgDgQrrsZ67iRk9Ad3cri9ERlzvBniIlQU=;
        b=pvayxlDKDiBR0x3IaKgI5lRZhjcUgdPqdD9FBhVjOiB54KNyqOUStiIOd1mtMBXnGu
         hOUHnAOfmWZt7Gw9mwBe7nggPhnsT/x0Cr2KTWrBlK2PLonz83ZIL6QrRzHcdzmqHhD6
         h45wc6yJqid5PGBzqHiKaOK+E1igvdlDrq628GQV1ql1NaIn2hDYEZb8kiH0HmebeEHf
         bDsOtMoj/vaYj4XiZbhiOFUL2BhLxpTnN7SBsW7bu+kfqYu1izPYrWMo5U6CuSbQvsAz
         ldp41HpAn52Krm78vnCqNPlAFdstHyH68CFcvzV0+v84G++S6iY4abJLiK9PcqaeOabH
         NNTg==
X-Forwarded-Encrypted: i=1; AJvYcCURaD92HcAQ+graSOMpehIsEwXvdZUJgALziPvje1QagbLLY97M17S+2f+D3nc7WBEwIMf6pDy62FE1ejSAzLHr+pTy3XhIWtS1iSOK/A==
X-Gm-Message-State: AOJu0YwaZJlHQIn66sNH6lAz+tTWSeNlyuEt60JQ9ZmZIzZZ3XCz1gQ4
	UKozZrwEV76U0EhFJdDCyOec5ipJZ8SvBZ4GPngPoDPPKhhCOkPe
X-Google-Smtp-Source: AGHT+IEMY8o/252qBDFEIJQKQoJP+4B/vRW3iANS8a4tWuh2eFp5ixvi1C+Zofa9uCivrKn8XtAURA==
X-Received: by 2002:a05:6a20:be13:b0:1bd:2292:e592 with SMTP id adf61e73a8af0-1bd2292e5efmr233523637.22.1719290992767;
        Mon, 24 Jun 2024 21:49:52 -0700 (PDT)
Received: from localhost (118-211-5-80.tpgi.com.au. [118.211.5.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c8b832639bsm275497a91.1.2024.06.24.21.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 21:49:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Jun 2024 14:49:45 +1000
Message-Id: <D28TSEV6QV38.2NWPFRY8KCQK7@gmail.com>
Subject: Re: [PATCH v6 21/23] powerpc/64s: Use contiguous PMD/PUD instead of
 HUGEPD
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Jason Gunthorpe" <jgg@nvidia.com>, "Peter Xu"
 <peterx@redhat.com>, "Oscar Salvador" <osalvador@suse.de>, "Michael
 Ellerman" <mpe@ellerman.id.au>
X-Mailer: aerc 0.17.0
References: <cover.1719240269.git.christophe.leroy@csgroup.eu>
 <23f3fe9e8fe37cb164a369850d4569dddf359fdf.1719240269.git.christophe.leroy@csgroup.eu>
In-Reply-To: <23f3fe9e8fe37cb164a369850d4569dddf359fdf.1719240269.git.christophe.leroy@csgroup.eu>
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

On Tue Jun 25, 2024 at 12:45 AM AEST, Christophe Leroy wrote:
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

[snip]

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
> +	if (IS_ENABLED(CONFIG_PPC_4K_PAGES) && huge) {
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
> +		WARN_ON_ONCE(nb =3D=3D 1);	/* Should never happen */
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

We definitely need a bit more comment and changelog about the atomicity
issues here. I think the plan should be all hash-side access just
operates on PTE[0], which should avoid that whole race. There could be
some cases that don't follow that. Adding some warnings to catch such
things could be good too.

I'd been meaning to do more on this sooner, sorry. I've started
tinkering with adding a bit of debug code. I'll see if I can help with
adding a bit of comments.

[snip]

> diff --git a/arch/powerpc/mm/book3s64/hugetlbpage.c b/arch/powerpc/mm/boo=
k3s64/hugetlbpage.c
> index 5a2e512e96db..83c3361b358b 100644
> --- a/arch/powerpc/mm/book3s64/hugetlbpage.c
> +++ b/arch/powerpc/mm/book3s64/hugetlbpage.c
> @@ -53,6 +53,16 @@ int __hash_page_huge(unsigned long ea, unsigned long a=
ccess, unsigned long vsid,
>  		/* If PTE permissions don't match, take page fault */
>  		if (unlikely(!check_pte_access(access, old_pte)))
>  			return 1;
> +		/*
> +		 * If hash-4k, hugepages use seeral contiguous PxD entries
> +		 * so bail out and let mm make the page young or dirty
> +		 */
> +		if (IS_ENABLED(CONFIG_PPC_4K_PAGES)) {
> +			if (!(old_pte & _PAGE_ACCESSED))
> +				return 1;
> +			if ((access & _PAGE_WRITE) && !(old_pte & _PAGE_DIRTY))
> +				return 1;
> +		}
> =20
>  		/*
>  		 * Try to lock the PTE, add ACCESSED and DIRTY if it was

I'm hoping we wouldn't have to do this, if we follow the PTE[0] rule.

I think is minor enough that should not prevent testing in -mm.

Thanks,
Nick
