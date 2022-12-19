Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD473650635
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 03:17:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nb3JT5DQhz3bj0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 13:17:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PATNVhgd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=chenhuacai@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PATNVhgd;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nb2Tn5LSlz2xVr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Dec 2022 12:40:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 372CF60E0A
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Dec 2022 01:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11DC9C433A4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Dec 2022 01:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671414041;
	bh=9nyV2VLryTNQ2RWGz3ZIj4+lGtx6hnYLztBjAV0zvPk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PATNVhgdHjYWGiZiASI0bBaWPGO5qTJR2J725H79e6EhmAT4XY1N6hsV0m/tQJEp7
	 a/2WvulFJ6gOCpeo5QTXLzunPUQjlh2it+91pkfEEgDCo6RRGWx0krLoQTsVX7gm9R
	 EVdLgzQN6omHyhybQOq0Ih61Cy92rrRlJTIMKPPQ05AzuTaeoo0eXxzs5b9a/1j2Pe
	 cbjteZLbAKsUC5nPsrAsxmzdAcCBOcZpfEX5kvBGMV5m1XRhGlo26443cbMEi9DMsc
	 DM2vxo07g5jBYvi3+mwzcTrBmo8h2hYFNguAYLVO1Y7c/iAYn7ysl1MKA9AbHfYbS/
	 rYDwQhhKDNexw==
Received: by mail-ej1-f52.google.com with SMTP id kw15so18149684ejc.10
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Dec 2022 17:40:40 -0800 (PST)
X-Gm-Message-State: ANoB5pmgZk7HhZaqO8b+esDKDuVpOPrjAD1Prxb2w9PmDXCw3Rz4iwSK
	oRCi0UnyLHz4BR1gPTfZAFRqXMvl7cYM4PQuKiI=
X-Google-Smtp-Source: AA0mqf7fa22WDTII8PuIoosVINgEu5ldbNcdzS6oKOztHUJ2Qlsma3hMLsf/nMU+opz2u3k/iVMluUrTunlVexMitRk=
X-Received: by 2002:a17:906:f116:b0:7c1:764:5e08 with SMTP id
 gv22-20020a170906f11600b007c107645e08mr12961272ejb.72.1671414039185; Sun, 18
 Dec 2022 17:40:39 -0800 (PST)
MIME-Version: 1.0
References: <20221206144730.163732-1-david@redhat.com> <CAAhV-H4bU7JnAPyf9Mv1m+WGR5NWmHJLva3d9_CsRd4Q_OHVpg@mail.gmail.com>
 <b3b90a8e-16e9-a314-8531-e225f8a52817@redhat.com>
In-Reply-To: <b3b90a8e-16e9-a314-8531-e225f8a52817@redhat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 19 Dec 2022 09:40:31 +0800
X-Gmail-Original-Message-ID: <CAAhV-H74np_5BZ0s=z-bV1OLhRf4cEOAOp4d3kNfBLWNkY33_A@mail.gmail.com>
Message-ID: <CAAhV-H74np_5BZ0s=z-bV1OLhRf4cEOAOp4d3kNfBLWNkY33_A@mail.gmail.com>
Subject: Re: [PATCH mm-unstable RFC 00/26] mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
 on all architectures with swap PTEs
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 19 Dec 2022 13:17:00 +1100
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

On Sun, Dec 18, 2022 at 5:59 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 18.12.22 04:32, Huacai Chen wrote:
> > Hi, David,
> >
> > What is the opposite of exclusive here? Shared or inclusive? I prefer
> > pte_swp_mkshared() or pte_swp_mkinclusive() rather than
> > pte_swp_clear_exclusive(). Existing examples: dirty/clean, young/old
> > ...
>
> Hi Huacai,
>
> thanks for having a look!
>
> Please note that this series doesn't add these primitives but merely
> implements them on all remaining architectures.
>
> Having that said, the semantics are "exclusive" vs. "maybe shared", not
> "exclusive" vs. "shared" or sth. else. It would have to be
> pte_swp_mkmaybe_shared().
>
>
> Note that this naming matches just the way we handle it for the other
> pte_swp_ flags we have, namely:
>
> pte_swp_mksoft_dirty()
> pte_swp_soft_dirty()
> pte_swp_clear_soft_dirty()
>
> and
>
> pte_swp_mkuffd_wp()
> pte_swp_uffd_wp()
> pte_swp_clear_uffd_wp()
>
>
> For example, we also (thankfully) didn't call it pte_mksoft_clean().
> Grepping for "pte_swp.*soft_dirty" gives you the full picture.
>
> Thanks!
OK, got it.

Huacai
>
> David
>
> >
> > Huacai
> >
> > On Tue, Dec 6, 2022 at 10:48 PM David Hildenbrand <david@redhat.com> wrote:
> >>
> >> This is the follow-up on [1]:
> >>          [PATCH v2 0/8] mm: COW fixes part 3: reliable GUP R/W FOLL_GET of
> >>          anonymous pages
> >>
> >> After we implemented __HAVE_ARCH_PTE_SWP_EXCLUSIVE on most prominent
> >> enterprise architectures, implement __HAVE_ARCH_PTE_SWP_EXCLUSIVE on all
> >> remaining architectures that support swap PTEs.
> >>
> >> This makes sure that exclusive anonymous pages will stay exclusive, even
> >> after they were swapped out -- for example, making GUP R/W FOLL_GET of
> >> anonymous pages reliable. Details can be found in [1].
> >>
> >> This primarily fixes remaining known O_DIRECT memory corruptions that can
> >> happen on concurrent swapout, whereby we can lose DMA reads to a page
> >> (modifying the user page by writing to it).
> >>
> >> To verify, there are two test cases (requiring swap space, obviously):
> >> (1) The O_DIRECT+swapout test case [2] from Andrea. This test case tries
> >>      triggering a race condition.
> >> (2) My vmsplice() test case [3] that tries to detect if the exclusive
> >>      marker was lost during swapout, not relying on a race condition.
> >>
> >>
> >> For example, on 32bit x86 (with and without PAE), my test case fails
> >> without these patches:
> >>          $ ./test_swp_exclusive
> >>          FAIL: page was replaced during COW
> >> But succeeds with these patches:
> >>          $ ./test_swp_exclusive
> >>          PASS: page was not replaced during COW
> >>
> >>
> >> Why implement __HAVE_ARCH_PTE_SWP_EXCLUSIVE for all architectures, even
> >> the ones where swap support might be in a questionable state? This is the
> >> first step towards removing "readable_exclusive" migration entries, and
> >> instead using pte_swp_exclusive() also with (readable) migration entries
> >> instead (as suggested by Peter). The only missing piece for that is
> >> supporting pmd_swp_exclusive() on relevant architectures with THP
> >> migration support.
> >>
> >> As all relevant architectures now implement __HAVE_ARCH_PTE_SWP_EXCLUSIVE,,
> >> we can drop __HAVE_ARCH_PTE_SWP_EXCLUSIVE in the last patch.
> >>
> >>
> >> RFC because some of the swap PTE layouts are really tricky and I really
> >> need some feedback related to deciphering these layouts and "using yet
> >> unused PTE bits in swap PTEs". I tried cross-compiling all relevant setups
> >> (phew, I might only miss some power/nohash variants), but only tested on
> >> x86 so far.
> >>
> >> CCing arch maintainers only on this cover letter and on the respective
> >> patch(es).
> >>
> >>
> >> [1] https://lkml.kernel.org/r/20220329164329.208407-1-david@redhat.com
> >> [2] https://gitlab.com/aarcange/kernel-testcases-for-v5.11/-/blob/main/page_count_do_wp_page-swap.c
> >> [3] https://gitlab.com/davidhildenbrand/scratchspace/-/blob/main/test_swp_exclusive.c
> >>
> >> David Hildenbrand (26):
> >>    mm/debug_vm_pgtable: more pte_swp_exclusive() sanity checks
> >>    alpha/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> >>    arc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> >>    arm/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> >>    csky/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> >>    hexagon/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> >>    ia64/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> >>    loongarch/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> >>    m68k/mm: remove dummy __swp definitions for nommu
> >>    m68k/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> >>    microblaze/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> >>    mips/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> >>    nios2/mm: refactor swap PTE layout
> >>    nios2/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> >>    openrisc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> >>    parisc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> >>    powerpc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 32bit book3s
> >>    powerpc/nohash/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> >>    riscv/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> >>    sh/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> >>    sparc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 32bit
> >>    sparc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 64bit
> >>    um/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> >>    x86/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE also on 32bit
> >>    xtensa/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> >>    mm: remove __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> >>
> >>   arch/alpha/include/asm/pgtable.h              | 40 ++++++++-
> >>   arch/arc/include/asm/pgtable-bits-arcv2.h     | 26 +++++-
> >>   arch/arm/include/asm/pgtable-2level.h         |  3 +
> >>   arch/arm/include/asm/pgtable-3level.h         |  3 +
> >>   arch/arm/include/asm/pgtable.h                | 34 ++++++--
> >>   arch/arm64/include/asm/pgtable.h              |  1 -
> >>   arch/csky/abiv1/inc/abi/pgtable-bits.h        | 13 ++-
> >>   arch/csky/abiv2/inc/abi/pgtable-bits.h        | 19 ++--
> >>   arch/csky/include/asm/pgtable.h               | 17 ++++
> >>   arch/hexagon/include/asm/pgtable.h            | 36 ++++++--
> >>   arch/ia64/include/asm/pgtable.h               | 31 ++++++-
> >>   arch/loongarch/include/asm/pgtable-bits.h     |  4 +
> >>   arch/loongarch/include/asm/pgtable.h          | 38 +++++++-
> >>   arch/m68k/include/asm/mcf_pgtable.h           | 35 +++++++-
> >>   arch/m68k/include/asm/motorola_pgtable.h      | 37 +++++++-
> >>   arch/m68k/include/asm/pgtable_no.h            |  6 --
> >>   arch/m68k/include/asm/sun3_pgtable.h          | 38 +++++++-
> >>   arch/microblaze/include/asm/pgtable.h         | 44 +++++++---
> >>   arch/mips/include/asm/pgtable-32.h            | 86 ++++++++++++++++---
> >>   arch/mips/include/asm/pgtable-64.h            | 23 ++++-
> >>   arch/mips/include/asm/pgtable.h               | 35 ++++++++
> >>   arch/nios2/include/asm/pgtable-bits.h         |  3 +
> >>   arch/nios2/include/asm/pgtable.h              | 37 ++++++--
> >>   arch/openrisc/include/asm/pgtable.h           | 40 +++++++--
> >>   arch/parisc/include/asm/pgtable.h             | 40 ++++++++-
> >>   arch/powerpc/include/asm/book3s/32/pgtable.h  | 37 ++++++--
> >>   arch/powerpc/include/asm/book3s/64/pgtable.h  |  1 -
> >>   arch/powerpc/include/asm/nohash/32/pgtable.h  | 22 +++--
> >>   arch/powerpc/include/asm/nohash/32/pte-40x.h  |  6 +-
> >>   arch/powerpc/include/asm/nohash/32/pte-44x.h  | 18 +---
> >>   arch/powerpc/include/asm/nohash/32/pte-85xx.h |  4 +-
> >>   arch/powerpc/include/asm/nohash/64/pgtable.h  | 24 +++++-
> >>   arch/powerpc/include/asm/nohash/pgtable.h     | 15 ++++
> >>   arch/powerpc/include/asm/nohash/pte-e500.h    |  1 -
> >>   arch/riscv/include/asm/pgtable-bits.h         |  3 +
> >>   arch/riscv/include/asm/pgtable.h              | 28 ++++--
> >>   arch/s390/include/asm/pgtable.h               |  1 -
> >>   arch/sh/include/asm/pgtable_32.h              | 53 +++++++++---
> >>   arch/sparc/include/asm/pgtable_32.h           | 26 +++++-
> >>   arch/sparc/include/asm/pgtable_64.h           | 37 +++++++-
> >>   arch/sparc/include/asm/pgtsrmmu.h             | 14 +--
> >>   arch/um/include/asm/pgtable.h                 | 36 +++++++-
> >>   arch/x86/include/asm/pgtable-2level.h         | 26 ++++--
> >>   arch/x86/include/asm/pgtable-3level.h         | 26 +++++-
> >>   arch/x86/include/asm/pgtable.h                |  3 -
> >>   arch/xtensa/include/asm/pgtable.h             | 31 +++++--
> >>   include/linux/pgtable.h                       | 29 -------
> >>   mm/debug_vm_pgtable.c                         | 25 +++++-
> >>   mm/memory.c                                   |  4 -
> >>   mm/rmap.c                                     | 11 ---
> >>   50 files changed, 943 insertions(+), 227 deletions(-)
> >>
> >> --
> >> 2.38.1
> >>
> >>
> >
>
> --
> Thanks,
>
> David / dhildenb
>
