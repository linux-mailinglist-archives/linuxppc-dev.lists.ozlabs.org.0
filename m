Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5C784D9F8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 07:20:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dfNiMFha;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TVn0m4sV4z3ckl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 17:20:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dfNiMFha;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVmzt0DPkz3cPW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Feb 2024 17:19:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9BEE6CE1B8E;
	Thu,  8 Feb 2024 06:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2B9C433C7;
	Thu,  8 Feb 2024 06:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707373191;
	bh=nxciaXphWmGCQZgRp+6AraxUwzLXbBBeY7cwt8JPcBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dfNiMFhazIYH10xRr5CgSsEUKx1/MHtqdKR5dLOtoLSCnzVdAATtU7nxrVFXM4BpC
	 gCGwotvDn7ACXKus06eXzj+eZFYm9wAopITxFL8a8tezWcb5Lap0xHbr493kIoHncD
	 Ji8m2xjisvxTYwQzAoYpx49/a9Zp+h1Kt+4N1ta6uMLLzeAGNNcMHTSIzdp5pDP730
	 wyrBnBWla/DtCF/gympbDZ+QYOcvjC5PLvCSqHgYCqiQyCQdmHKGPyxvZv6QkTBUnH
	 M9Idx2TB81kcYGZKOss9xP7XeuY91FZ5wUyl1ETidkY4l1k3mGk5EtF84qqV9GR0PD
	 xUtpEa/HDCbrA==
Date: Thu, 8 Feb 2024 08:19:27 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 08/15] mm/pgtable: make pte_next_pfn() independent of
 set_ptes()
Message-ID: <ZcRyb2o_lq2XITH_@kernel.org>
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-9-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129124649.189745-9-david@redhat.com>
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

On Mon, Jan 29, 2024 at 01:46:42PM +0100, David Hildenbrand wrote:
> Let's provide pte_next_pfn(), independently of set_ptes(). This allows for
> using the generic pte_next_pfn() version in some arch-specific set_ptes()
> implementations, and prepares for reusing pte_next_pfn() in other context.
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  include/linux/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index f6d0e3513948..351cd9dc7194 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -212,7 +212,6 @@ static inline int pmd_dirty(pmd_t pmd)
>  #define arch_flush_lazy_mmu_mode()	do {} while (0)
>  #endif
>  
> -#ifndef set_ptes
>  
>  #ifndef pte_next_pfn
>  static inline pte_t pte_next_pfn(pte_t pte)
> @@ -221,6 +220,7 @@ static inline pte_t pte_next_pfn(pte_t pte)
>  }
>  #endif
>  
> +#ifndef set_ptes
>  /**
>   * set_ptes - Map consecutive pages to a contiguous range of addresses.
>   * @mm: Address space to map the pages into.
> -- 
> 2.43.0
> 
> 

-- 
Sincerely yours,
Mike.
