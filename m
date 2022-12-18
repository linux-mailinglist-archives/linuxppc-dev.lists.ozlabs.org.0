Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 102EC64FDCA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Dec 2022 06:21:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NZWRN178Lz3bdf
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Dec 2022 16:21:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NZznuv2H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=chenhuacai@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NZznuv2H;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NZT296k4Fz2yPY
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Dec 2022 14:33:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 51F9BB80B35
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Dec 2022 03:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3AEAC433F0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Dec 2022 03:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671334394;
	bh=tIkYFzXEO2chGeVvpnhnUSRiaYqUOvaPo7G7agH5seU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NZznuv2H9MQueEsr6jgEx1junfwjYsvNcOR43Yi/brcuSQR9UH+m6CrgXjrTxCtE7
	 e6bwe9cJqXk1WuwXoKDMvpo9TzcCqL2J7/rfInWmXCzjpBl8AaPX8/ZDKlqMvr8Jnb
	 yPLDT135jBzOiGZQnkegHTEPk2QAKPw71lNMeRicomC31rduSeqQEgDS6bhnzMGqcq
	 lEoicK81SZ/d6NH3t3vJk88ScyMf0ePdwVfZuCHv/jvCCwGUN6mZAZhI4t+dG610gH
	 fki7MqLM2MPF400PykUCrGAk2XSSyU7i3CvLgBvt+bZ5XueXYRrGIX178MJ5NirAWw
	 7omV8lnwwK5iA==
Received: by mail-ed1-f44.google.com with SMTP id z92so8693119ede.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Dec 2022 19:33:13 -0800 (PST)
X-Gm-Message-State: ANoB5pnMjuPlwtrjGvDG2AkvhnpAvGJBAY1Fw3Vq+1O6nHz2hE4y8mjS
	PF2ur7/tQMVHJvyZLgmvhIBE38z4SwweXEupuH8=
X-Google-Smtp-Source: AA0mqf6HJrjOIUv4bzcPb2/bKtCuYat7PlsqCSDeflk0KMk+BHjoAVHTjhW6I8Yv82IxystWMfrMsjTObq3olIShGs4=
X-Received: by 2002:a05:6402:5003:b0:462:a25f:f0f2 with SMTP id
 p3-20020a056402500300b00462a25ff0f2mr35194911eda.156.1671334392205; Sat, 17
 Dec 2022 19:33:12 -0800 (PST)
MIME-Version: 1.0
References: <20221206144730.163732-1-david@redhat.com>
In-Reply-To: <20221206144730.163732-1-david@redhat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 18 Dec 2022 11:32:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4bU7JnAPyf9Mv1m+WGR5NWmHJLva3d9_CsRd4Q_OHVpg@mail.gmail.com>
Message-ID: <CAAhV-H4bU7JnAPyf9Mv1m+WGR5NWmHJLva3d9_CsRd4Q_OHVpg@mail.gmail.com>
Subject: Re: [PATCH mm-unstable RFC 00/26] mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 on all architectures with swap PTEs
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 18 Dec 2022 16:21:06 +1100
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mips@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, Vineet Gupta <
 vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>, Chris Zankel <chris@zankel.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Johannes Berg <johannes@sipsolutions.net>, linux-arm-kernel@lists.infradead.org, WANG Xuerui <kernel@xen0n.name>, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel
 .org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, David,

What is the opposite of exclusive here? Shared or inclusive? I prefer
pte_swp_mkshared() or pte_swp_mkinclusive() rather than
pte_swp_clear_exclusive(). Existing examples: dirty/clean, young/old
...

Huacai

On Tue, Dec 6, 2022 at 10:48 PM David Hildenbrand <david@redhat.com> wrote:
>
> This is the follow-up on [1]:
>         [PATCH v2 0/8] mm: COW fixes part 3: reliable GUP R/W FOLL_GET of
>         anonymous pages
>
> After we implemented __HAVE_ARCH_PTE_SWP_EXCLUSIVE on most prominent
> enterprise architectures, implement __HAVE_ARCH_PTE_SWP_EXCLUSIVE on all
> remaining architectures that support swap PTEs.
>
> This makes sure that exclusive anonymous pages will stay exclusive, even
> after they were swapped out -- for example, making GUP R/W FOLL_GET of
> anonymous pages reliable. Details can be found in [1].
>
> This primarily fixes remaining known O_DIRECT memory corruptions that can
> happen on concurrent swapout, whereby we can lose DMA reads to a page
> (modifying the user page by writing to it).
>
> To verify, there are two test cases (requiring swap space, obviously):
> (1) The O_DIRECT+swapout test case [2] from Andrea. This test case tries
>     triggering a race condition.
> (2) My vmsplice() test case [3] that tries to detect if the exclusive
>     marker was lost during swapout, not relying on a race condition.
>
>
> For example, on 32bit x86 (with and without PAE), my test case fails
> without these patches:
>         $ ./test_swp_exclusive
>         FAIL: page was replaced during COW
> But succeeds with these patches:
>         $ ./test_swp_exclusive
>         PASS: page was not replaced during COW
>
>
> Why implement __HAVE_ARCH_PTE_SWP_EXCLUSIVE for all architectures, even
> the ones where swap support might be in a questionable state? This is the
> first step towards removing "readable_exclusive" migration entries, and
> instead using pte_swp_exclusive() also with (readable) migration entries
> instead (as suggested by Peter). The only missing piece for that is
> supporting pmd_swp_exclusive() on relevant architectures with THP
> migration support.
>
> As all relevant architectures now implement __HAVE_ARCH_PTE_SWP_EXCLUSIVE,,
> we can drop __HAVE_ARCH_PTE_SWP_EXCLUSIVE in the last patch.
>
>
> RFC because some of the swap PTE layouts are really tricky and I really
> need some feedback related to deciphering these layouts and "using yet
> unused PTE bits in swap PTEs". I tried cross-compiling all relevant setups
> (phew, I might only miss some power/nohash variants), but only tested on
> x86 so far.
>
> CCing arch maintainers only on this cover letter and on the respective
> patch(es).
>
>
> [1] https://lkml.kernel.org/r/20220329164329.208407-1-david@redhat.com
> [2] https://gitlab.com/aarcange/kernel-testcases-for-v5.11/-/blob/main/page_count_do_wp_page-swap.c
> [3] https://gitlab.com/davidhildenbrand/scratchspace/-/blob/main/test_swp_exclusive.c
>
> David Hildenbrand (26):
>   mm/debug_vm_pgtable: more pte_swp_exclusive() sanity checks
>   alpha/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>   arc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>   arm/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>   csky/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>   hexagon/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>   ia64/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>   loongarch/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>   m68k/mm: remove dummy __swp definitions for nommu
>   m68k/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>   microblaze/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>   mips/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>   nios2/mm: refactor swap PTE layout
>   nios2/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>   openrisc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>   parisc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>   powerpc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 32bit book3s
>   powerpc/nohash/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>   riscv/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>   sh/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>   sparc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 32bit
>   sparc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 64bit
>   um/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>   x86/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE also on 32bit
>   xtensa/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>   mm: remove __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>
>  arch/alpha/include/asm/pgtable.h              | 40 ++++++++-
>  arch/arc/include/asm/pgtable-bits-arcv2.h     | 26 +++++-
>  arch/arm/include/asm/pgtable-2level.h         |  3 +
>  arch/arm/include/asm/pgtable-3level.h         |  3 +
>  arch/arm/include/asm/pgtable.h                | 34 ++++++--
>  arch/arm64/include/asm/pgtable.h              |  1 -
>  arch/csky/abiv1/inc/abi/pgtable-bits.h        | 13 ++-
>  arch/csky/abiv2/inc/abi/pgtable-bits.h        | 19 ++--
>  arch/csky/include/asm/pgtable.h               | 17 ++++
>  arch/hexagon/include/asm/pgtable.h            | 36 ++++++--
>  arch/ia64/include/asm/pgtable.h               | 31 ++++++-
>  arch/loongarch/include/asm/pgtable-bits.h     |  4 +
>  arch/loongarch/include/asm/pgtable.h          | 38 +++++++-
>  arch/m68k/include/asm/mcf_pgtable.h           | 35 +++++++-
>  arch/m68k/include/asm/motorola_pgtable.h      | 37 +++++++-
>  arch/m68k/include/asm/pgtable_no.h            |  6 --
>  arch/m68k/include/asm/sun3_pgtable.h          | 38 +++++++-
>  arch/microblaze/include/asm/pgtable.h         | 44 +++++++---
>  arch/mips/include/asm/pgtable-32.h            | 86 ++++++++++++++++---
>  arch/mips/include/asm/pgtable-64.h            | 23 ++++-
>  arch/mips/include/asm/pgtable.h               | 35 ++++++++
>  arch/nios2/include/asm/pgtable-bits.h         |  3 +
>  arch/nios2/include/asm/pgtable.h              | 37 ++++++--
>  arch/openrisc/include/asm/pgtable.h           | 40 +++++++--
>  arch/parisc/include/asm/pgtable.h             | 40 ++++++++-
>  arch/powerpc/include/asm/book3s/32/pgtable.h  | 37 ++++++--
>  arch/powerpc/include/asm/book3s/64/pgtable.h  |  1 -
>  arch/powerpc/include/asm/nohash/32/pgtable.h  | 22 +++--
>  arch/powerpc/include/asm/nohash/32/pte-40x.h  |  6 +-
>  arch/powerpc/include/asm/nohash/32/pte-44x.h  | 18 +---
>  arch/powerpc/include/asm/nohash/32/pte-85xx.h |  4 +-
>  arch/powerpc/include/asm/nohash/64/pgtable.h  | 24 +++++-
>  arch/powerpc/include/asm/nohash/pgtable.h     | 15 ++++
>  arch/powerpc/include/asm/nohash/pte-e500.h    |  1 -
>  arch/riscv/include/asm/pgtable-bits.h         |  3 +
>  arch/riscv/include/asm/pgtable.h              | 28 ++++--
>  arch/s390/include/asm/pgtable.h               |  1 -
>  arch/sh/include/asm/pgtable_32.h              | 53 +++++++++---
>  arch/sparc/include/asm/pgtable_32.h           | 26 +++++-
>  arch/sparc/include/asm/pgtable_64.h           | 37 +++++++-
>  arch/sparc/include/asm/pgtsrmmu.h             | 14 +--
>  arch/um/include/asm/pgtable.h                 | 36 +++++++-
>  arch/x86/include/asm/pgtable-2level.h         | 26 ++++--
>  arch/x86/include/asm/pgtable-3level.h         | 26 +++++-
>  arch/x86/include/asm/pgtable.h                |  3 -
>  arch/xtensa/include/asm/pgtable.h             | 31 +++++--
>  include/linux/pgtable.h                       | 29 -------
>  mm/debug_vm_pgtable.c                         | 25 +++++-
>  mm/memory.c                                   |  4 -
>  mm/rmap.c                                     | 11 ---
>  50 files changed, 943 insertions(+), 227 deletions(-)
>
> --
> 2.38.1
>
>
