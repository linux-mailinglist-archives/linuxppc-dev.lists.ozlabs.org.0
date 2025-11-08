Return-Path: <linuxppc-dev+bounces-13967-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33043C43480
	for <lists+linuxppc-dev@lfdr.de>; Sat, 08 Nov 2025 21:18:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3nLt732Vz3c1T;
	Sun,  9 Nov 2025 07:18:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762633126;
	cv=none; b=X1o4TEl6p2fS42ZMFKmUjTjrK8XJcBidNYVUbY0pKQ0USV7Re8ATqucQRlPNTMGNF9UqroLfvBx1Ftzz80rh5egeFEYa3curVONQ1XEyXQhhmP8qKk2nGSn1/CZE5dRva680LNkFyHd2pCVG2F6RBfaibMO2I+9sHlFnk9AOeWo0YmFo3NY/xLD/K1QjhI55Q7MXQReM6XB1Zc+eo6VJNgpZ0VbiiJxi2zf1nk/nz9N+dGFH5OAvMkSZNd5jyUG0Ftf+/R248kjUM6xsAKfeHC/7DE+i/Rwk/Es1j2AkGzkqp+Obrtyu7iEz3m4r47NsnVg7pv/LzybUwL6bB/wDmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762633126; c=relaxed/relaxed;
	bh=eptMmi/rSmOF7zh3lnbB0jvPX8L9rhMmLXfTARMvAA4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=HtAHfWEcYWIPNtU94fy/Db78XCLDn+xw5eXgG1l6+j6Tmo6yNtSbZPChyDMWJrbZPjRYqJLeXKbCPbHQ5RpxdIhRPmAcBCxib2BjXlfmuKSGlxrDs7KNH7WfF38NwgdRhuPseIzVNKyGkuN9mdL6ngjOhs5yA1JgTMN9RDsmv3p2PwHu2Jz3Ca5d6ZCMGskWP1+DcGBauipF7bCh4E9zUTrH1Xgoj1MOXhR0qavMxFInn8wNE9a7Xv+JXKIYROl06CJZgH51O4GPK22n+8ni/TiPAcBkcKcVtsyHNcuM5L2HoZ1KmbsgHL3NTwFx5Oc1vY29SaDRHRWbJp9WtxK5jA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DD+8iMcC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DD+8iMcC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d3nLs2HrFz3btw
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Nov 2025 07:18:44 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso1552333b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Nov 2025 12:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762633121; x=1763237921; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eptMmi/rSmOF7zh3lnbB0jvPX8L9rhMmLXfTARMvAA4=;
        b=DD+8iMcC2Q9rOaWiBTpt6orkT56BOu7QlyAuBeG2wRvR/gLqM1z+bHKBNHmNrZrAdg
         YzmzYfvu+CMGTQ1ON/kuwQi+e7GV5BycWWQcpD0r1uym8Xj3I8bY9jp2OHsPNr4uAK3d
         siY8D2IRfC9xD3xW2ExGHM6s0V9CT+JPmuIIik1CQZCTsdev+SLBBLacYduJgln8no+L
         kF+IGxq0mmLhz3wGI0yP3LANNQ+twucBEqTAkQBnhjZ5fRnfV3sRde1oXFtpz4wct6qh
         7rSlEscRwOT0rjne57L5rNOKZH2zw99bIypT5linmZEYqJmUat21tNpDgI4FBzTjAojR
         +4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762633121; x=1763237921;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eptMmi/rSmOF7zh3lnbB0jvPX8L9rhMmLXfTARMvAA4=;
        b=HRC14K8aGLK09BMufRA+NcysO5Hq7i4d6gJAN36yMkI4RGAYKsb/VK+TBLn+CIeFlV
         qUbr3IdtoT1tvAooTDkf/JJuImV9vsgeH7yR+lhJe8Mt6Z3BG2PErBBEeRSJ6M07kHUQ
         YBDnYgz5tADznGKteJCUs3AcA2GnxLvYdriutVEihNEb4CEixxpy9Mn71dHwSE1e9Hz1
         3RaMkA5FIP1/jm2EasZL6ngERmVVdpc1O4VYBL07SDtQrQ5v/VErynwpzWzj5qyWDoY9
         GVWsfnsNPfxjtR8mGGdF7p+Qd+8HDYMwc4C0nLSZcQJOwLLGVXtOmVhSELMmYKAKzXAP
         R3xA==
X-Gm-Message-State: AOJu0YyKrYmTh3oYGrvLWJy+x5oHzdr821IpnLC5KCnmRRw1H94dSuTB
	h51aROegWxEcsX5x2z/OMWrXNw+DA8dKiUdFTxudM8UISpOlHmJXYj1y
X-Gm-Gg: ASbGncss8ecn3casJThH7ejeCrzh4pXmJ1IQcQ2JK2EU3jQDNcs8OC2sQEHOJK1JmQV
	kZkphXxtjbro0p81bDqA9HxqydPn1iuVFLVWXPf3Ch+jIiIruWhPYmCw6YCg+HfgTcwwbG2y3WP
	1YxHoahciwWMZ3Eso50cXNaGsMqAPPM42XoT6i1ZAQj7a06HM171cW86nJWCIeL6CyesTtYEe30
	TCX4sbT+H+Wm8nm8cdOHKl/pFNR+urbvzyoY/9MjCbtcIz9c8IC47nHc0suIb9W045qJj6Bzd3Y
	ptgsnltvyt34wOcV00CKOvSyyV91wK0ny/XTrDGWbgnmvqVWW6+OnrUCaQ9i6Bn9hbJTKC2dQSN
	EPcx7zOtMK8zWo/kcIrDffSXI+O9m4j2NzFRXllMV3LzaihtUbhKsLR2N0WZBVwUnsWDX/w==
X-Google-Smtp-Source: AGHT+IFb5ZIMhb48UQ+0j2VRNphIuxham09NgnX5MSt7QH3z4h9Q5UU4rBsGOgTmioZaQIMKF6pn6w==
X-Received: by 2002:a17:903:f83:b0:295:5613:c19f with SMTP id d9443c01a7336-297e56f6b9amr42076845ad.42.1762633121076;
        Sat, 08 Nov 2025 12:18:41 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297d766efe6sm44719285ad.49.2025.11.08.12.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 12:18:40 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Dave Vasilevsky via B4 Relay <devnull+dave.vasilevsky.ca@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nadav Amit <nadav.amit@gmail.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Dave Vasilevsky <dave@vasilevsky.ca>, linux-mm@kvack.org
Subject: Re: [PATCH] powerpc: Fix mprotect on book3s32
In-Reply-To: <20251027-vasi-mprotect-g3-v1-1-3c5187085f9a@vasilevsky.ca>
Date: Sun, 09 Nov 2025 00:46:04 +0530
Message-ID: <878qgg49or.ritesh.list@gmail.com>
References: <20251027-vasi-mprotect-g3-v1-1-3c5187085f9a@vasilevsky.ca>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list


++linux-mm to get some pointers on how to test such mmu_gather changes

Dave Vasilevsky via B4 Relay <devnull+dave.vasilevsky.ca@kernel.org>
writes:

> From: Dave Vasilevsky <dave@vasilevsky.ca>
>
> On 32-bit book3s with hash-MMUs, tlb_flush() was a no-op. This was
> unnoticed because all uses until recently were for unmaps, and thus
> handled by __tlb_remove_tlb_entry().
>
> After commit 4a18419f71cd ("mm/mprotect: use mmu_gather") in kernel 5.19,
> tlb_gather_mmu() started being used for mprotect as well. This caused
> mprotect to simply not work on these machines:
>
>   int *ptr = mmap(NULL, 4096, PROT_READ|PROT_WRITE,
>                   MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
>   *ptr = 1; // force HPTE to be created
>   mprotect(ptr, 4096, PROT_READ);
>   *ptr = 2; // should segfault, but succeeds

I am surprised how come this was not caught? Don't we have any straight
forward selftest for this?

Not just mprotect then right.. Many other MM paths must also be using
mmu_gather right?

>
> Fixed by making tlb_flush() actually flush TLB pages. This finally
> agrees with the behaviour of boot3s64's tlb_flush().
>
> Fixes: 4a18419f71cd ("mm/mprotect: use mmu_gather")
> Signed-off-by: Dave Vasilevsky <dave@vasilevsky.ca>
> ---
>  arch/powerpc/include/asm/book3s/32/tlbflush.h | 8 ++++++--
>  arch/powerpc/mm/book3s32/tlb.c                | 6 ++++++
>  2 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h b/arch/powerpc/include/asm/book3s/32/tlbflush.h
> index e43534da5207aa3b0cb3c07b78e29b833c141f3f..b8c587ad2ea954f179246a57d6e86e45e91dcfdc 100644
> --- a/arch/powerpc/include/asm/book3s/32/tlbflush.h
> +++ b/arch/powerpc/include/asm/book3s/32/tlbflush.h
> @@ -11,6 +11,7 @@
>  void hash__flush_tlb_mm(struct mm_struct *mm);
>  void hash__flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
>  void hash__flush_range(struct mm_struct *mm, unsigned long start, unsigned long end);
> +void hash__flush_gather(struct mmu_gather *tlb);
>  
>  #ifdef CONFIG_SMP
>  void _tlbie(unsigned long address);
> @@ -28,9 +29,12 @@ void _tlbia(void);
>   */
>  static inline void tlb_flush(struct mmu_gather *tlb)
>  {
> -	/* 603 needs to flush the whole TLB here since it doesn't use a hash table. */
> -	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE))
> +	if (mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
> +		hash__flush_gather(tlb);
> +	} else {
> +		/* 603 needs to flush the whole TLB here since it doesn't use a hash table. */
>  		_tlbia();
> +	}
>  }
>  
>  static inline void flush_range(struct mm_struct *mm, unsigned long start, unsigned long end)
> diff --git a/arch/powerpc/mm/book3s32/tlb.c b/arch/powerpc/mm/book3s32/tlb.c
> index 9ad6b56bfec96e989b96f027d075ad5812500854..3da95ecfbbb296303082e378425e92a5fbdbfac8 100644
> --- a/arch/powerpc/mm/book3s32/tlb.c
> +++ b/arch/powerpc/mm/book3s32/tlb.c
> @@ -105,3 +105,9 @@ void hash__flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr)
>  		flush_hash_pages(mm->context.id, vmaddr, pmd_val(*pmd), 1);
>  }
>  EXPORT_SYMBOL(hash__flush_tlb_page);
> +
> +void hash__flush_gather(struct mmu_gather *tlb)
> +{
> +	hash__flush_range(tlb->mm, tlb->start, tlb->end);
> +}
> +EXPORT_SYMBOL(hash__flush_gather);

Shouldn't we flush all if we get tlb_flush request for full mm? e.g.
Something like this maybe? 

+void hash__tlb_flush(struct mmu_gather *tlb)
+{
+       if (tlb->fullmm || tlb->need_flush_all)
+               hash__flush_tlb_mm(tlb->mm);
+       else
+               hash__flush_range(tlb->mm, tlb->start, tlb->end);
+}

It will be quicker if someone already has a set of tests which we can
run to validate. If not, I will take a look and see what tests one can
run to validate mmu_gather feature. 

>
> ---
> base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
> change-id: 20251027-vasi-mprotect-g3-f8f5278d4140
>
> Best regards,
> -- 
> Dave Vasilevsky <dave@vasilevsky.ca>

Thanks again for pointing this out. How did you find this though?
What hardware do you use?

-ritesh

