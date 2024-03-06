Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF13872EE5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 07:28:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oKNIDLuN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqMvl0npKz3vXM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 17:28:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oKNIDLuN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqMv16lTWz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 17:28:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D4A94618CB;
	Wed,  6 Mar 2024 06:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91E1C433F1;
	Wed,  6 Mar 2024 06:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709706491;
	bh=V1Mfq7Y3AfGZ+fTn0cuNK5g8OD2Cj2Hf0foPZDXtLP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oKNIDLuN1zcY9zNB8rL62xeb/R+s5Gzot2AtdqSnRtFkZGmCVsAO4jRtML4UfdAEe
	 pUqr2Rdg77iw5wNSF9UF+HiEAQCgZtNyoJfL9RIM1UoqbWFIuG/s3owFFls+0ptqtM
	 /wCULQejCsKlUfHMnEPjWlMU8WNNPjZayaSuhoMrb3b3ZQ889cQsfe5w66uKXN7K0T
	 dlirD+YfaP2xoM1QZxAVly75hKm/AZZ4AdXsGYColI/iqY4iIJuXNO5U97O3g/WYuZ
	 QMJZKeR5k6quh8zJ5keTU8L/HDykc2GpgeWTm4muXBQke04hp0lO0s+4oQsB6O+5jy
	 buAMbCC9wt+Ng==
Date: Wed, 6 Mar 2024 08:27:17 +0200
From: Mike Rapoport <rppt@kernel.org>
To: peterx@redhat.com
Subject: Re: [PATCH v3 05/10] mm/x86: Drop two unnecessary pud_leaf()
 definitions
Message-ID: <ZegMxVPdfZD1r0oT@kernel.org>
References: <20240305043750.93762-1-peterx@redhat.com>
 <20240305043750.93762-6-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305043750.93762-6-peterx@redhat.com>
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

On Tue, Mar 05, 2024 at 12:37:45PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> pud_leaf() has a fallback macro defined in include/linux/pgtable.h already.
> Drop the extra two for x86.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Acked-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/x86/include/asm/pgtable.h      | 1 -
>  include/asm-generic/pgtable-nopmd.h | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index d6e993a5659f..9db7a38a0e9f 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1097,7 +1097,6 @@ static inline int pud_bad(pud_t pud)
>  	return (pud_flags(pud) & ~(_KERNPG_TABLE | _PAGE_USER)) != 0;
>  }
>  #else
> -#define pud_leaf	pud_large
>  static inline int pud_large(pud_t pud)
>  {
>  	return 0;
> diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
> index 8ffd64e7a24c..fa27e16bbe1b 100644
> --- a/include/asm-generic/pgtable-nopmd.h
> +++ b/include/asm-generic/pgtable-nopmd.h
> @@ -31,7 +31,6 @@ static inline int pud_none(pud_t pud)		{ return 0; }
>  static inline int pud_bad(pud_t pud)		{ return 0; }
>  static inline int pud_present(pud_t pud)	{ return 1; }
>  static inline int pud_user(pud_t pud)		{ return 0; }
> -static inline int pud_leaf(pud_t pud)		{ return 0; }
>  static inline void pud_clear(pud_t *pud)	{ }
>  #define pmd_ERROR(pmd)				(pud_ERROR((pmd).pud))
>  
> -- 
> 2.44.0
> 
> 

-- 
Sincerely yours,
Mike.
