Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB491F999B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 16:06:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ltRr3KbBzDqbC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 00:06:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=ZtjyYI1P; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lsTD6NL5zDqSc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 23:22:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=v1JuBkjgVZu6X7IHxoR7umQyE9OF6DuLKgiaH5Hdipo=; b=ZtjyYI1PdGCLGqQJMjknk88JGR
 DPJo+q7dRMl6FQf1kQ+G9qipHOGhNzgMsWxR6R7yPRVKFhAffl7efh8hLqcXncydwOLJLQBa1ygqZ
 yBbeegWmPfz5A/nnnuAfMFX1YCHy3fSdiOcfryly1pKErYTXfpt3bF6mNOXb4r+fAOtVmIu8cex6R
 meDI2kVU5cRGqrQvFjfJI1PYLyfrR3gF/RPlMO3LgzJZj/ouo2HFD3NURcKaw/WlWE1yGr0eJSr3y
 LhT/61NbJ5pm1cRmAI1jyU7bNUJDBec63wahNEtmR/Pl+r0jS24HybzVHNRurvsk1CHnJKB4xguqc
 9/vUqJlQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkp4Z-0007C9-4L; Mon, 15 Jun 2020 13:22:47 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B653D306102;
 Mon, 15 Jun 2020 15:22:44 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A0C2C2392E70D; Mon, 15 Jun 2020 15:22:44 +0200 (CEST)
Date: Mon, 15 Jun 2020 15:22:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 3/3] powerpc/8xx: Provide ptep_get() with 16k pages
Message-ID: <20200615132244.GR2531@hirez.programming.kicks-ass.net>
References: <cover.1592225557.git.christophe.leroy@csgroup.eu>
 <341688399c1b102756046d19ea6ce39db1ae4742.1592225558.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <341688399c1b102756046d19ea6ce39db1ae4742.1592225558.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 15, 2020 at 12:57:59PM +0000, Christophe Leroy wrote:
> READ_ONCE() now enforces atomic read, which leads to:


> Fixes: 2ab3a0a02905 ("READ_ONCE: Enforce atomicity for {READ,WRITE}_ONCE() memory accesses")
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/nohash/32/pgtable.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
> index b56f14160ae5..77addb599ce7 100644
> --- a/arch/powerpc/include/asm/nohash/32/pgtable.h
> +++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
> @@ -286,6 +286,16 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
>  	return __pte(pte_update(mm, addr, ptep, ~0, 0, 0));
>  }
>  
> +#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PPC_16K_PAGES)
> +#define __HAVE_ARCH_PTEP_GET
> +static inline pte_t ptep_get(pte_t *ptep)
> +{
> +	pte_t pte = {READ_ONCE(ptep->pte), 0, 0, 0};
> +
> +	return pte;
> +}
> +#endif

Would it make sense to have a comment with this magic? The casual reader
might wonder WTH just happened when he stumbles on this :-)

Other than that, the series looks good to me, Thanks!

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
