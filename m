Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BE855826F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 19:14:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTRgd1Qptz3cg7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 03:14:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LddGc6vd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LddGc6vd;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTRfq60vnz3cds
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 03:13:39 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 64D2FB824B5;
	Thu, 23 Jun 2022 17:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 451B1C341C8;
	Thu, 23 Jun 2022 17:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656004413;
	bh=H9XDdoABPSpvLcbeZb6mrxq8vL7qtowAVPQVxrIBCh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LddGc6vdrk8EgF6Z4hnLIdZwz699aX1/xvWQ0jdTMOyMcerBIMcJRmXrjXOiQ+2M3
	 i/6hCrDYIpxTCbiGyHA5kXvrVbJZBW+83+tTY+TLw3ruGq+d6xthR4k3mIsnCmdhuI
	 rMwYwpUQw7S42bYg88j0+naQ8aKNnfVm51nd7yXwlwHq+01IgqtNeBL/VyEWOgIGKB
	 6VXMahkdQdyTzFHYHXzV050pv6Evvsa/Xwv0KUgRN/f+qLB7QO6nGEB01sCW5Hi5Pw
	 5OpRGqtrJ1P1p8PXOc0sk1w+AwEkimSl3mGL7g15Q5RMMPlDmQLl3BriNp9A1twMHM
	 2pSiDazAborBg==
Date: Thu, 23 Jun 2022 12:13:30 -0500
From: Mike Rapoport <rppt@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/64e: Rewrite p4d_populate() as a static inline
 function
Message-ID: <YrSfOp5B+LhFXgjt@kernel.org>
References: <1b416f8a8fe1bc3f4e01175680ce310b7eb3a1e4.1655974565.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b416f8a8fe1bc3f4e01175680ce310b7eb3a1e4.1655974565.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 23, 2022 at 10:56:57AM +0200, Christophe Leroy wrote:
> Rewrite p4d_populate() as a static inline function instead of
> a macro.
> 
> This change allows typechecking and would have helped detecting
> a recently found bug in map_kernel_page().
> 
> Cc: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  arch/powerpc/include/asm/nohash/64/pgalloc.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/nohash/64/pgalloc.h b/arch/powerpc/include/asm/nohash/64/pgalloc.h
> index 668aee6017e7..e50b211becb3 100644
> --- a/arch/powerpc/include/asm/nohash/64/pgalloc.h
> +++ b/arch/powerpc/include/asm/nohash/64/pgalloc.h
> @@ -15,7 +15,10 @@ struct vmemmap_backing {
>  };
>  extern struct vmemmap_backing *vmemmap_list;
>  
> -#define p4d_populate(MM, P4D, PUD)	p4d_set(P4D, (unsigned long)PUD)
> +static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
> +{
> +	p4d_set(p4d, (unsigned long)pud);
> +}
>  
>  static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
>  {
> -- 
> 2.36.1
> 

-- 
Sincerely yours,
Mike.
