Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 384282125D1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 16:13:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yKnY5kvjzDqw9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 00:13:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=cmarinas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yKgN1RL9zDqGT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 00:08:00 +1000 (AEST)
Received: from gaia (unknown [95.146.230.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F272720780;
 Thu,  2 Jul 2020 14:07:54 +0000 (UTC)
Date: Thu, 2 Jul 2020 15:07:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V3 (RESEND) 2/3] mm/sparsemem: Enable vmem_altmap support
 in vmemmap_alloc_block_buf()
Message-ID: <20200702140752.GF22241@gaia>
References: <1592442930-9380-1-git-send-email-anshuman.khandual@arm.com>
 <1592442930-9380-3-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592442930-9380-3-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 18, 2020 at 06:45:29AM +0530, Anshuman Khandual wrote:
> There are many instances where vmemap allocation is often switched between
> regular memory and device memory just based on whether altmap is available
> or not. vmemmap_alloc_block_buf() is used in various platforms to allocate
> vmemmap mappings. Lets also enable it to handle altmap based device memory
> allocation along with existing regular memory allocations. This will help
> in avoiding the altmap based allocation switch in many places.
> 
> While here also implement a regular memory allocation fallback mechanism
> when the first preferred device memory allocation fails. This will ensure
> preserving the existing semantics on powerpc platform. To summarize there
> are three different methods to call vmemmap_alloc_block_buf().
> 
> (., NULL,   false) /* Allocate from system RAM */
> (., altmap, false) /* Allocate from altmap without any fallback */
> (., altmap, true)  /* Allocate from altmap with fallback (system RAM) */
[...]
> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
> index bc73abf0bc25..01e25b56eccb 100644
> --- a/arch/powerpc/mm/init_64.c
> +++ b/arch/powerpc/mm/init_64.c
> @@ -225,12 +225,12 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>  		 * fall back to system memory if the altmap allocation fail.
>  		 */
>  		if (altmap && !altmap_cross_boundary(altmap, start, page_size)) {
> -			p = altmap_alloc_block_buf(page_size, altmap);
> -			if (!p)
> -				pr_debug("altmap block allocation failed, falling back to system memory");
> +			p = vmemmap_alloc_block_buf(page_size, node,
> +						    altmap, true);
> +		} else {
> +			p = vmemmap_alloc_block_buf(page_size, node,
> +						    NULL, false);
>  		}
> -		if (!p)
> -			p = vmemmap_alloc_block_buf(page_size, node);
>  		if (!p)
>  			return -ENOMEM;

Is the fallback argument actually necessary. It may be cleaner to just
leave the code as is with the choice between altmap and NULL. If an arch
needs a fallback (only powerpc), they have the fallback in place
already. I don't see the powerpc code any better after this change.

I'm fine with the altmap argument though.

-- 
Catalin
