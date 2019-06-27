Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 902BC57AD7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 06:49:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z6rJ59JvzDqW7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 14:49:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z6pX0yDdzDqW2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 14:48:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45Z6pW1Pl7z9sCJ;
 Thu, 27 Jun 2019 14:48:02 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Subject: Re: [PATCH] powerpc/64s/radix: Define arch_ioremap_p4d_supported()
In-Reply-To: <1561555260-17335-1-git-send-email-anshuman.khandual@arm.com>
References: <1561555260-17335-1-git-send-email-anshuman.khandual@arm.com>
Date: Thu, 27 Jun 2019 14:48:00 +1000
Message-ID: <87d0iztz0f.fsf@concordia.ellerman.id.au>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-next@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anshuman Khandual <anshuman.khandual@arm.com> writes:
> Recent core ioremap changes require HAVE_ARCH_HUGE_VMAP subscribing archs
> provide arch_ioremap_p4d_supported() failing which will result in a build
> failure like the following.
>
> ld: lib/ioremap.o: in function `.ioremap_huge_init':
> ioremap.c:(.init.text+0x3c): undefined reference to
> `.arch_ioremap_p4d_supported'
>
> This defines a stub implementation for arch_ioremap_p4d_supported() keeping
> it disabled for now to fix the build problem.

The easiest option is for this to be folded into your patch that creates
the requirement for arch_ioremap_p4d_supported().

Andrew might do that for you, or you could send a v2.

This looks fine from a powerpc POV:

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-next@vger.kernel.org
>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This has been just build tested and fixes the problem reported earlier.
>
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 8904aa1..c81da88 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -1124,6 +1124,11 @@ void radix__ptep_modify_prot_commit(struct vm_area_struct *vma,
>  	set_pte_at(mm, addr, ptep, pte);
>  }
>  
> +int __init arch_ioremap_p4d_supported(void)
> +{
> +	return 0;
> +}
> +
>  int __init arch_ioremap_pud_supported(void)
>  {
>  	/* HPT does not cope with large pages in the vmalloc area */
> -- 
> 2.7.4
