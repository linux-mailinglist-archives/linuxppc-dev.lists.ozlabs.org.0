Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D05C84D9E7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 07:16:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ch0eIee+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TVmw30fLrz3dTv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 17:16:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ch0eIee+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVmvH0fPSz3dLH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Feb 2024 17:15:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A82E61B76;
	Thu,  8 Feb 2024 06:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF23C433F1;
	Thu,  8 Feb 2024 06:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707372952;
	bh=4cpBdMWcDp/URDDivrNC/5C2U/2Get9Hcj59TpzJo88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ch0eIee+TLQVcxJA1IRkGd00XN03txLrgzYzC4XgFSxqfrFQSz9Zg39KFHirnk8Dn
	 HXqAbI6jaZMcaFtq1/+Jv5yhTQ9qnjaAWh0Up4V4v771H3bVOa0RD6klWQxgL/9ASp
	 H01qOpHlb0gOleU7AQDWReSZtL8qLnAwMAUt1celTZxbjdnteZmnSZq/EFqUAx0mmN
	 AeiyEEztyQtpKTBUo5oFZUSCHlnRBQ6ufZqDEhgsiFbZNBOAR+LBNUD5WKDlfHZnAd
	 6Z+vqa2O+e9MDNRJCcItgHJ2iQFkpDLAcYLkQgY9uErSvCDDSuXkWQjkTilp2CM8Ph
	 nkWZ07IuNEqyg==
Date: Thu, 8 Feb 2024 08:15:27 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 06/15] s390/pgtable: define PFN_PTE_SHIFT
Message-ID: <ZcRxfx4Ze-_KXzE7@kernel.org>
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-7-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129124649.189745-7-david@redhat.com>
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

On Mon, Jan 29, 2024 at 01:46:40PM +0100, David Hildenbrand wrote:
> We want to make use of pte_next_pfn() outside of set_ptes(). Let's
> simply define PFN_PTE_SHIFT, required by pte_next_pfn().
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/s390/include/asm/pgtable.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
> index 1299b56e43f6..4b91e65c85d9 100644
> --- a/arch/s390/include/asm/pgtable.h
> +++ b/arch/s390/include/asm/pgtable.h
> @@ -1316,6 +1316,8 @@ pgprot_t pgprot_writecombine(pgprot_t prot);
>  #define pgprot_writethrough	pgprot_writethrough
>  pgprot_t pgprot_writethrough(pgprot_t prot);
>  
> +#define PFN_PTE_SHIFT		PAGE_SHIFT
> +
>  /*
>   * Set multiple PTEs to consecutive pages with a single call.  All PTEs
>   * are within the same folio, PMD and VMA.
> -- 
> 2.43.0
> 
> 

-- 
Sincerely yours,
Mike.
