Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7416C872EDF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 07:25:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PJzwl3aD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqMqp1vQ3z3dhY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 17:25:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PJzwl3aD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqMq407RWz3vdr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 17:24:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC5616170B;
	Wed,  6 Mar 2024 06:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90084C433F1;
	Wed,  6 Mar 2024 06:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709706284;
	bh=Ul9xyIM/xyWLYImXlcZ+ekHRz3h/sTxONmN5nrLAWX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJzwl3aDmw2R/PvwbEBvPZ3u+NLY0fqRSSGQgKs2InVezXhX/9DQWsIrHIhu6BbPu
	 lgBAiYFIW15YCX3uOOubXQRSCklHU0tR1/Wnu1iyHq5KnLswQs0CahMqIfxtbisXtq
	 o+T42dG+q7+R2aeWH0os80Ht3TAr1gN7h+7a4H9djzp65CmezNaMO/BHAz0PwmAW7E
	 7n/IBVf10MWU7PGd5fTqa+TdvYH8Xr+kr8N8PPUfHnmMCXFCxS3kLQE06IWLreXIeE
	 z2km+RVZaY98fb9Wc0TVXUnk09iQW67QBULk7oHkE0cuQRikKMqfSIuqO8YrFtBMGh
	 NjwIRRPzm4buw==
Date: Wed, 6 Mar 2024 08:23:50 +0200
From: Mike Rapoport <rppt@kernel.org>
To: peterx@redhat.com
Subject: Re: [PATCH v3 04/10] mm/x86: Replace pgd_large() with pgd_leaf()
Message-ID: <ZegL9nbKpWe3GM0_@kernel.org>
References: <20240305043750.93762-1-peterx@redhat.com>
 <20240305043750.93762-5-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305043750.93762-5-peterx@redhat.com>
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
Cc: Muchun Song <muchun.song@linux.dev>, Yang Shi <shy828301@gmail.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 05, 2024 at 12:37:44PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> pgd_leaf() is a global API while pgd_large() is not.  Always use
> the global pgd_leaf(), then drop pgd_large().
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/x86/include/asm/pgtable.h | 4 ++--
>  arch/x86/mm/pti.c              | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index 69ed0ea0641b..d6e993a5659f 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1418,8 +1418,8 @@ static inline bool pgdp_maps_userspace(void *__ptr)
>  	return (((ptr & ~PAGE_MASK) / sizeof(pgd_t)) < PGD_KERNEL_START);
>  }
>  
> -#define pgd_leaf	pgd_large
> -static inline int pgd_large(pgd_t pgd) { return 0; }
> +#define pgd_leaf	pgd_leaf
> +static inline int pgd_leaf(pgd_t pgd) { return 0; }
>  
>  #ifdef CONFIG_PAGE_TABLE_ISOLATION
>  /*
> diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
> index dc0a81f5f60e..c17aab24c1b3 100644
> --- a/arch/x86/mm/pti.c
> +++ b/arch/x86/mm/pti.c
> @@ -185,7 +185,7 @@ static p4d_t *pti_user_pagetable_walk_p4d(unsigned long address)
>  
>  		set_pgd(pgd, __pgd(_KERNPG_TABLE | __pa(new_p4d_page)));
>  	}
> -	BUILD_BUG_ON(pgd_large(*pgd) != 0);
> +	BUILD_BUG_ON(pgd_leaf(*pgd) != 0);
>  
>  	return p4d_offset(pgd, address);
>  }
> -- 
> 2.44.0
> 
> 

-- 
Sincerely yours,
Mike.
