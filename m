Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1937824E1F9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 22:16:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BYCTF70HgzDrL1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 06:16:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Jsm0Siwj; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BYCR76xKhzDrHY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Aug 2020 06:14:26 +1000 (AEST)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AEE02207CD;
 Fri, 21 Aug 2020 20:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598040863;
 bh=GIZSv+n11Fktxzw4XltsqI4m6vkx8INTDFrt/8602bc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Jsm0SiwjyjLdaC9x30KSU052qwlMNfDxNbp/v2GTQ314YIOfB5mn0PNyo3a5HyfAT
 4sANyMs+iVHal+mEKYqfPdgxvyiLDgv11V+6Lbb/SF/R9PYsMREn8gTcrgWQaSROWb
 u9xVLheHbRwcaiQ0OLEd29483GS1ksAQUXUfNqp0=
Date: Fri, 21 Aug 2020 13:14:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 05/12] mm: HUGE_VMAP arch support cleanup
Message-Id: <20200821131422.110abb1a0c0b6a9d378b0e48@linux-foundation.org>
In-Reply-To: <20200821151216.1005117-6-npiggin@gmail.com>
References: <20200821151216.1005117-1-npiggin@gmail.com>
 <20200821151216.1005117-6-npiggin@gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Zefan Li <lizefan@huawei.com>, Borislav Petkov <bp@alien8.de>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 22 Aug 2020 01:12:09 +1000 Nicholas Piggin <npiggin@gmail.com> wrote:

> This changes the awkward approach where architectures provide init
> functions to determine which levels they can provide large mappings for,
> to one where the arch is queried for each call.
> 
> This removes code and indirection, and allows constant-folding of dead
> code for unsupported levels.
> 
> This also adds a prot argument to the arch query. This is unused
> currently but could help with some architectures (e.g., some powerpc
> processors can't map uncacheable memory with large pages).
> 
> --- a/arch/arm64/include/asm/vmalloc.h
> +++ b/arch/arm64/include/asm/vmalloc.h
> @@ -1,4 +1,12 @@
>  #ifndef _ASM_ARM64_VMALLOC_H
>  #define _ASM_ARM64_VMALLOC_H
>  
> +#include <asm/page.h>
> +
> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
> +bool arch_vmap_p4d_supported(pgprot_t prot);
> +bool arch_vmap_pud_supported(pgprot_t prot);
> +bool arch_vmap_pmd_supported(pgprot_t prot);
> +#endif

Moving these out of generic code and into multiple arch headers is
unfortunate.  Can we leave them in include/linux/somewhere?  And remove
the ifdefs, if so inclined - they just move the build error from
link-time to compile-time, and such an error shouldn't occur!

