Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D9A36159F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 00:44:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLvXV5PvBz30G6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 08:44:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=LGwG/jXj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=LGwG/jXj; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLvX36nMfz3001
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 08:43:45 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id u7so11112821plr.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 15:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=JY3LY8etXyosEeu5nfWlhvzebGDT/edrkrlKplV2R0Q=;
 b=LGwG/jXjcqstX7vCLunH2tlSTh6FEg3VqmVYhhwaWMbz1gRpN9Dc+pKMBttZG4F2eH
 +nk8aBQ2fPJnJhVZ2Nv5ytsKTlagBaosP37szFwCRj8Ib0f+ZQBXZ6lPne4jFGq86Bs7
 Yl/AWNZNO+DwuQ/A/1FVG7uXMXFQ0Bg71mqpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=JY3LY8etXyosEeu5nfWlhvzebGDT/edrkrlKplV2R0Q=;
 b=Q6fqZfAksPpZXBtycS2FgbJ5thed3lWfMBOe4ha8gGdK03EspQWMrk9t1RPbhuSL5k
 HkY1gVnpHZhhsYRzYHafgPH3G5+y8U3ZdLZQr5IWREp2O6JvmG6jcKaCi9NZ0CuwXYZk
 HFbOnelhBTv3X1uZgX7Dter1XpvxZzdcnhHQuddz7SIlbXlr9bU1DhB2nljKNg7I6LxQ
 +6PF2pTsr4ytD5l/ioO6Ct9vOTxA7PN4xg3/Z20kTAnwUmBhX/tVemNT41fCMJej6Rl+
 vZkQKlQJYRf51AvwXnlOk/319AC3L74VZljGrhcY97Kv/xM27S3byFW3ApG+qr1+Y4Kh
 mJYw==
X-Gm-Message-State: AOAM533VFOd/8RonqVaEKzC7RMhI5khv0PrvJcfMwoEwXfWftPfNZqrE
 pNeKAI+o3cEFILuoKRl6JFsEkw==
X-Google-Smtp-Source: ABdhPJyqfJG8J3NRw4PtXWUZy53AS96UfvtUYllUApPaRqPEmjx1X+9e6E5OLIVUTnR/j6EwfW2Icg==
X-Received: by 2002:a17:90a:17a3:: with SMTP id
 q32mr6358434pja.224.1618526621918; 
 Thu, 15 Apr 2021 15:43:41 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-3f8b-a64e-9a27-b872.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:3f8b:a64e:9a27:b872])
 by smtp.gmail.com with ESMTPSA id h22sm2980650pfn.55.2021.04.15.15.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 15:43:41 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Steven Price <steven.price@arm.com>, akpm@linux-foundation.org
Subject: Re: [PATCH v1 1/5] mm: pagewalk: Fix walk for hugepage tables
In-Reply-To: <733408f48b1ed191f53518123ee6fc6d42287cc6.1618506910.git.christophe.leroy@csgroup.eu>
References: <cover.1618506910.git.christophe.leroy@csgroup.eu>
 <733408f48b1ed191f53518123ee6fc6d42287cc6.1618506910.git.christophe.leroy@csgroup.eu>
Date: Fri, 16 Apr 2021 08:43:38 +1000
Message-ID: <877dl3184l.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

> Pagewalk ignores hugepd entries and walk down the tables
> as if it was traditionnal entries, leading to crazy result.
>
> Add walk_hugepd_range() and use it to walk hugepage tables.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  mm/pagewalk.c | 54 +++++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 48 insertions(+), 6 deletions(-)
>
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index e81640d9f177..410a9d8f7572 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -58,6 +58,32 @@ static int walk_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	return err;
>  }
>  
> +static int walk_hugepd_range(hugepd_t *phpd, unsigned long addr,
> +			     unsigned long end, struct mm_walk *walk, int pdshift)
> +{
> +	int err = 0;
> +#ifdef CONFIG_ARCH_HAS_HUGEPD
> +	const struct mm_walk_ops *ops = walk->ops;
> +	int shift = hugepd_shift(*phpd);
> +	int page_size = 1 << shift;
> +
> +	if (addr & (page_size - 1))
> +		return 0;
> +
> +	for (;;) {
> +		pte_t *pte = hugepte_offset(*phpd, addr, pdshift);
> +
> +		err = ops->pte_entry(pte, addr, addr + page_size, walk);
> +		if (err)
> +			break;
> +		if (addr >= end - page_size)
> +			break;
> +		addr += page_size;
> +	}

Initially I thought this was a somewhat unintuitive way to structure
this loop, but I see it parallels the structure of walk_pte_range_inner,
so I think the consistency is worth it.

I notice the pte walking code potentially takes some locks: does this
code need to do that?

arch/powerpc/mm/hugetlbpage.c says that hugepds are protected by the
mm->page_table_lock, but I don't think we're taking it in this code.

> +#endif
> +	return err;
> +}
> +
>  static int walk_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
>  			  struct mm_walk *walk)
>  {
> @@ -108,7 +134,10 @@ static int walk_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
>  				goto again;
>  		}
>  
> -		err = walk_pte_range(pmd, addr, next, walk);
> +		if (is_hugepd(__hugepd(pmd_val(*pmd))))
> +			err = walk_hugepd_range((hugepd_t *)pmd, addr, next, walk, PMD_SHIFT);
> +		else
> +			err = walk_pte_range(pmd, addr, next, walk);
>  		if (err)
>  			break;
>  	} while (pmd++, addr = next, addr != end);
> @@ -157,7 +186,10 @@ static int walk_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
>  		if (pud_none(*pud))
>  			goto again;
>  
> -		err = walk_pmd_range(pud, addr, next, walk);
> +		if (is_hugepd(__hugepd(pud_val(*pud))))
> +			err = walk_hugepd_range((hugepd_t *)pud, addr, next, walk, PUD_SHIFT);
> +		else
> +			err = walk_pmd_range(pud, addr, next, walk);

I'm a bit worried you might end up calling into walk_hugepd_range with
ops->pte_entry == NULL, and then jumping to 0.

static int walk_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
			  struct mm_walk *walk)
{
...
        pud = pud_offset(p4d, addr);
	do {
                ...
                if ((!walk->vma && (pud_leaf(*pud) || !pud_present(*pud))) ||
		    walk->action == ACTION_CONTINUE ||
		    !(ops->pmd_entry || ops->pte_entry)) <<< THIS CHECK
			continue;
                ...
		if (is_hugepd(__hugepd(pud_val(*pud))))
			err = walk_hugepd_range((hugepd_t *)pud, addr, next, walk, PUD_SHIFT);
		else
			err = walk_pmd_range(pud, addr, next, walk);
		if (err)
			break;
	} while (pud++, addr = next, addr != end);

walk_pud_range will proceed if there is _either_ an ops->pmd_entry _or_
an ops->pte_entry, but walk_hugepd_range will call ops->pte_entry
unconditionally.

The same issue applies to walk_{p4d,pgd}_range...

Kind regards,
Daniel
