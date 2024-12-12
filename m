Return-Path: <linuxppc-dev+bounces-4067-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B9D9EFEEC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 23:02:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8RK757Xbz30RS;
	Fri, 13 Dec 2024 09:02:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734040939;
	cv=none; b=QmfKXPLXLfoBHm+xqaZaG6OqN5OnYXP2XdKcXhfV5IeMH9NLhmgjWMidmnD8h/Dw+oqDvFQ1+EA9huqhtmwOfCAL/LHm1mL/yZr+Y4Zsbzg2FoHSURl+cPzbTofGtYFOp98RS6erCYblIFr//0/X55PCRAreTTpqcQcBD0pTm3Xq+UnPEuXyTkNhpGiLF2wu7q80dLgeuMzFbONFzGU5FpVw78u4puKwDnuhgD+KV8W07Oe7OEgvAHHQs9mw77tt39M87cEJfmVPrAxB/KJVDiYfpi/Tb+3GU/FzeCMpxg1Vk+EOcjnuvG6mF+G+/PkyyeLCDyK7xeEr4eX/TNFMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734040939; c=relaxed/relaxed;
	bh=nUU3k3ndx8hCjIEVI0vAEW5jsu/OGAg5GP0kOz2LdOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4ZSDQxk2MIVHWHPyIJxGokQp8zkIv17QF50OCIQN8iTYTV3gJhFBkBx6WPXr4zJU+oxMVq+vHJUNX8K6NOqJkYcNmPxx5egaPTsQj81hSuCoYLLw3aEdRLqiM9/S0oTRVPAaKztJuplRcMLiqt+oLDEhAx9Z1sDvJSdrLhgAcxB/kCi2RizsHpZVh/5bi3VYPEpkKay+qf36WDuj1w3TKnc9dScmZQB/WMsRA4wMqO3Q8/wxT3a8+LoL+GT7pPXa9Hh31VWgXpy81mcuY+vbENfhQWWwlu8zGksgvUrgxx+76GoaSK74ZbKhqQNkPYhJahQZgLxEk/L8z8cc04GUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8RK00ssRz2xmS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 09:02:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nUU3k3ndx8hCjIEVI0vAEW5jsu/OGAg5GP0kOz2LdOQ=; b=vATraj/l7BYi45J3o09OIopaxJ
	C8jNjTPCPsm9QpjuSJ1IY9oPT5mUdBMuSKqTmLPfzVHPEsRg9jIMEmxtX5EH+CBf2Ad5QJkAzCOb0
	QIBWWnrVmjlWPROLIj1nnhmGbebpQ72pM/mYvVSSI7b+XJoia4xx6JsI/qmb+lwoDY8J6kpWtw2sy
	nSq0P9/nMLk51OkHcgu7wfznTwDcJV87JcZ7lYZRgkl/n/cZDkdLwKwkwqCciizJ2Mw/AcIegRxYt
	kYJ96xWeFCCL6IUF+RLxWDxyxyavltxwOVk9mRXBnRhuepZag1Y3wIlzjK2IUkkHDKONd/95VcvEW
	bk/ki6/Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tLrFA-00000008PIi-3DGS;
	Thu, 12 Dec 2024 22:01:12 +0000
Date: Thu, 12 Dec 2024 22:01:12 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com,
	riel@surriel.com, david@redhat.com, minchan@kernel.org,
	jyescas@google.com, linux@armlinux.org.uk,
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
	ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, davem@davemloft.net,
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net,
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com,
	leitao@debian.org, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	kernel-team@android.com, android-mm@google.com
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
Message-ID: <Z1tdKHFfz-tMTXit@casper.infradead.org>
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 11, 2024 at 03:27:38PM -0800, Kalesh Singh wrote:
> Hi all,
> 
> This is v2 othe the arch_mmap_hint() series.
> 
> Changes in v2:
>   - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
>     special case of the hint addr being "enforced", per Yang Shi.
>   - Consolidate most of the error handling in arch_mmap_hint().
>   - Patch 16 ("mm: Fallback to generic_mmap_hint()") was folded into
>     Patch 2 ("mm: x86: Introduce arch_mmap_hint()")
> 
> v1: https://lore.kernel.org/r/20241210024119.2488608-1-kaleshsingh@google.com/
> 
> =======
> 
> This series introduces arch_mmap_hint() to handle allocating VA space
> for the hint address.

But why?  You're basically forcing me to read the entire series to
figure out what you're doing and why.  I decline.

> Patches 1-16 introduce this new helper and Patch 17 uses it to fix the
> issue of mmap hint being ignored in some cases due to THP alignment [1]
> 
> [1] https://lore.kernel.org/r/20241118214650.3667577-1-kaleshsingh@google.com/
> 
> Thanks,
> Kalesh
> 
> 
> Kalesh Singh (16):
>   mm: Introduce generic_mmap_hint()
>   mm: x86: Introduce arch_mmap_hint()
>   mm: arm: Introduce arch_mmap_hint()
>   mm: alpha: Introduce arch_mmap_hint()
>   mm: arc: Use generic_mmap_hint()
>   mm: csky: Introduce arch_mmap_hint()
>   mm: loongarch: Introduce arch_mmap_hint()
>   mm: mips: Introduce arch_align_mmap_hint()
>   mm: parisc: Introduce arch_align_mmap_hint()
>   mm: s390: Use generic_mmap_hint()
>   mm: sh: Introduce arch_mmap_hint()
>   mm: sparc32: Introduce arch_mmap_hint()
>   mm: sparc64: Introduce arch_mmap_hint()
>   mm: xtensa: Introduce arch_mmap_hint()
>   mm: powerpc: Introduce arch_mmap_hint()
>   mm: Respect mmap hint before THP alignment if allocation is possible
> 
>  arch/alpha/include/asm/pgtable.h           |   1 +
>  arch/alpha/kernel/osf_sys.c                |  31 +++---
>  arch/arc/include/asm/pgtable.h             |   1 +
>  arch/arc/mm/mmap.c                         |  43 +++++----
>  arch/arm/include/asm/pgtable.h             |   1 +
>  arch/arm/mm/mmap.c                         | 107 +++++++++------------
>  arch/csky/abiv1/inc/abi/pgtable-bits.h     |   1 +
>  arch/csky/abiv1/mmap.c                     |  68 +++++++------
>  arch/loongarch/include/asm/pgtable.h       |   1 +
>  arch/loongarch/mm/mmap.c                   |  49 +++++-----
>  arch/mips/include/asm/pgtable.h            |   1 +
>  arch/mips/mm/mmap.c                        |  50 +++++-----
>  arch/parisc/include/asm/pgtable.h          |   1 +
>  arch/parisc/kernel/sys_parisc.c            |  53 +++++-----
>  arch/powerpc/include/asm/book3s/64/slice.h |   1 +
>  arch/powerpc/mm/book3s64/slice.c           |  31 ++++++
>  arch/s390/include/asm/pgtable.h            |   1 +
>  arch/s390/mm/mmap.c                        |  51 +++++-----
>  arch/sh/include/asm/pgtable.h              |   1 +
>  arch/sh/mm/mmap.c                          |  83 ++++++----------
>  arch/sparc/include/asm/pgtable_32.h        |   1 +
>  arch/sparc/include/asm/pgtable_64.h        |   1 +
>  arch/sparc/kernel/sys_sparc_32.c           |  33 ++++---
>  arch/sparc/kernel/sys_sparc_64.c           |  96 +++++++-----------
>  arch/x86/include/asm/pgtable_64.h          |   1 +
>  arch/x86/kernel/sys_x86_64.c               |  64 ++++++------
>  arch/xtensa/kernel/syscall.c               |  31 ++++--
>  include/linux/sched/mm.h                   |   9 ++
>  mm/huge_memory.c                           |  17 ++--
>  mm/mmap.c                                  |  86 +++++++++++------
>  30 files changed, 491 insertions(+), 424 deletions(-)
> 
> -- 
> 2.47.0.338.g60cca15819-goog
> 
> 

