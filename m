Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9238E118A4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 14:03:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vv6W0RDJzDqVw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 22:03:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vv5B5SVBzDqM4
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 22:02:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44vv5B0821z9s9N;
 Thu,  2 May 2019 22:02:05 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, aneesh.kumar@linux.ibm.com
Subject: Re: [PATCH v2 01/17] powerpc/mm: Don't BUG() in hugepd_page()
In-Reply-To: <ff4366d14b3ef4de6af835a880a772477577139f.1556258135.git.christophe.leroy@c-s.fr>
References: <cover.1556258134.git.christophe.leroy@c-s.fr>
 <ff4366d14b3ef4de6af835a880a772477577139f.1556258135.git.christophe.leroy@c-s.fr>
Date: Thu, 02 May 2019 22:02:05 +1000
Message-ID: <87o94lxdxe.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Use VM_BUG_ON() instead of BUG_ON(), as those BUG_ON()
> are not there to catch runtime errors but to catch errors
> during development cycle only.

I've dropped this one and the next, because I don't like VM_BUG_ON().

Why not? Because it's contradictory. It's a condition that's so
important that we should BUG, but only if the kernel has been built
specially for debugging.

I don't really buy the development cycle distinction, it's not like we
have a rigorous test suite that we run and then we declare everything's
gold and ship a product. We often don't find bugs until they're hit in
the wild.

For example the recent corruption Joel discovered with STRICT_KERNEL_RWX
could have been caught by a BUG_ON() to check we weren't patching kernel
text in radix__change_memory_range(), but he wouldn't have been using
CONFIG_DEBUG_VM. (See 8adddf349fda)

I know Aneesh disagrees with me on this, so maybe you two can convince
me otherwise.

cheers

> diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
> index 8d40565ad0c3..7f1867e428c0 100644
> --- a/arch/powerpc/include/asm/hugetlb.h
> +++ b/arch/powerpc/include/asm/hugetlb.h
> @@ -14,7 +14,7 @@
>   */
>  static inline pte_t *hugepd_page(hugepd_t hpd)
>  {
> -	BUG_ON(!hugepd_ok(hpd));
> +	VM_BUG_ON(!hugepd_ok(hpd));
>  	/*
>  	 * We have only four bits to encode, MMU page size
>  	 */
> @@ -42,7 +42,7 @@ static inline void flush_hugetlb_page(struct vm_area_struct *vma,
>  
>  static inline pte_t *hugepd_page(hugepd_t hpd)
>  {
> -	BUG_ON(!hugepd_ok(hpd));
> +	VM_BUG_ON(!hugepd_ok(hpd));
>  #ifdef CONFIG_PPC_8xx
>  	return (pte_t *)__va(hpd_val(hpd) & ~HUGEPD_SHIFT_MASK);
>  #else
> -- 
> 2.13.3
