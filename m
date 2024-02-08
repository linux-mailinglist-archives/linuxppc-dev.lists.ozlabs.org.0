Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 647BA84D9CF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 07:13:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HJX01pqq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TVmqz2RbYz3bvJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 17:13:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HJX01pqq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVmqC4M33z3bx2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Feb 2024 17:12:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2CAB561B0E;
	Thu,  8 Feb 2024 06:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96ADEC43390;
	Thu,  8 Feb 2024 06:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707372739;
	bh=L4FBQtW/eF2Uu1SqIrK2nRsbjsKSv4bUFB1aeX49JJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HJX01pqqXnG+GEldJgYaVDhgObRa/4ZDUsQRXO0FxxpW+AgXzngnCGwKPtmlrSDNF
	 Cd0wch4ykXrr0mi1Egq91joKDYcLOSWO4CV5+NT+l0PKfU1ySJjGlhsCWGbNmfqv8r
	 W/rtdDJdoiXubGXIwaYbFfQafaBSv8zSGBXWrti3K34px06JngBKtot/k1I6J8kupf
	 7RkJg6zbfIo00oLX58qxCXkm64N8BM0iGfo103B+q498Q8cmvH2+glZIe263m+Hl6Z
	 B7vaV7wzv47KLyOCMCRswjVEGZqlxxnccg4wI4k9pxoaK10TbQYx++1EmVWsPo0kxO
	 3dRtTW0ogm2QA==
Date: Thu, 8 Feb 2024 08:11:54 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 02/15] arm/pgtable: define PFN_PTE_SHIFT
Message-ID: <ZcRwqizngdTmd7G8@kernel.org>
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129124649.189745-3-david@redhat.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@d
 avemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 29, 2024 at 01:46:36PM +0100, David Hildenbrand wrote:
> We want to make use of pte_next_pfn() outside of set_ptes(). Let's
> simply define PFN_PTE_SHIFT, required by pte_next_pfn().
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/arm/include/asm/pgtable.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
> index d657b84b6bf7..be91e376df79 100644
> --- a/arch/arm/include/asm/pgtable.h
> +++ b/arch/arm/include/asm/pgtable.h
> @@ -209,6 +209,8 @@ static inline void __sync_icache_dcache(pte_t pteval)
>  extern void __sync_icache_dcache(pte_t pteval);
>  #endif
>  
> +#define PFN_PTE_SHIFT		PAGE_SHIFT
> +
>  void set_ptes(struct mm_struct *mm, unsigned long addr,
>  		      pte_t *ptep, pte_t pteval, unsigned int nr);
>  #define set_ptes set_ptes
> -- 
> 2.43.0
> 
> 

-- 
Sincerely yours,
Mike.
