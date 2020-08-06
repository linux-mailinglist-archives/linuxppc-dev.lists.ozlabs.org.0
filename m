Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFEF23DA6A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 14:43:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMp8D0shvzDq9B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 22:43:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMnxk5hg2zDq61
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 22:34:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nKUU7caN; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BMnxj6rwcz9sPB;
 Thu,  6 Aug 2020 22:34:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596717290;
 bh=uXax7qaVjsua7t/iX49iAzEI6jVKdaQSXiQlJz+6sL0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=nKUU7caNM3HVy8vH9EFY2CgDRgAAJvrk/I1T5QZOnSYQtmrPRW17MqXophZFaxOaz
 TtEdZLvzSsxgJCDBVbVdrykYtJYZGJLuwVyvXP/0CLJyow1InepICaxfoc7MTg4tR9
 Aq9uQXpxtzkqiUrH1s7Ij7lvrZY1KfK5GK2paYFVdyALwFDnTnAbzmnvgsvzzD4Eou
 T9qGp4Kvqwb0nYXOywPcZ5DzLYYLXrteVDstM6v3XSLfxTB4cc7eAPLxhvl8PWh2T4
 V8LnphZN3tJPvQ5MwIgdpYrCQq4Q0Og2bwfIXLln5ZuEZL+2k+bLDJNx4kGMjHsCr5
 6oOVEFCypcgXQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/book3s64/radix: Make radix_mem_block_size 64bit
In-Reply-To: <20200806081415.208546-1-aneesh.kumar@linux.ibm.com>
References: <20200806081415.208546-1-aneesh.kumar@linux.ibm.com>
Date: Thu, 06 Aug 2020 22:34:49 +1000
Message-ID: <874kpgymty.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> Similar to commit: 89c140bbaeee ("pseries: Fix 64 bit logical memory block panic")
> make sure we update different variables tracking lmb_size are updated
> to be 64 bit.

That commit went to all stable releases, should this one also?

cheers

> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> index 55442d45c597..1a0c9d09950f 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -85,7 +85,7 @@ extern unsigned int mmu_base_pid;
>  /*
>   * memory block size used with radix translation.
>   */
> -extern unsigned int __ro_after_init radix_mem_block_size;
> +extern unsigned long __ro_after_init radix_mem_block_size;
>  
>  #define PRTB_SIZE_SHIFT	(mmu_pid_bits + 4)
>  #define PRTB_ENTRIES	(1ul << mmu_pid_bits)
> diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
> index 17ccc6474ab6..07c158c5f939 100644
> --- a/arch/powerpc/include/asm/drmem.h
> +++ b/arch/powerpc/include/asm/drmem.h
> @@ -21,7 +21,7 @@ struct drmem_lmb {
>  struct drmem_lmb_info {
>  	struct drmem_lmb        *lmbs;
>  	int                     n_lmbs;
> -	u32                     lmb_size;
> +	u64                     lmb_size;
>  };
>  
>  extern struct drmem_lmb_info *drmem_info;
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 28c784976bed..ca76d9d6372a 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -34,7 +34,7 @@
>  
>  unsigned int mmu_pid_bits;
>  unsigned int mmu_base_pid;
> -unsigned int radix_mem_block_size __ro_after_init;
> +unsigned long radix_mem_block_size __ro_after_init;
>  
>  static __ref void *early_alloc_pgtable(unsigned long size, int nid,
>  			unsigned long region_start, unsigned long region_end)
> -- 
> 2.26.2
