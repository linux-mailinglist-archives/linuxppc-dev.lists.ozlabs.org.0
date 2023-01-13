Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 839A866A5CE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 23:19:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ntwp131FSz3fG3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 09:19:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i41PM49W;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i41PM49W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i41PM49W;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i41PM49W;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtnxY1L4vz3bWq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jan 2023 04:10:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673629850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ckKqRBtsefZM1JDfoCvf0Xxq+48ay8EjXnX8re+vcnw=;
	b=i41PM49W8FAAo5VtaJef0OF6bZVxUUD4vM+C5hE1XH1Bk/O8axCxRuu5bOymzyQM8NPZ5s
	MCvYexoo75TOor3p/T0oeMG0TpfhwlMl61pKUsHOgX9ZO/sPGJbBnYVQBbcki390zEEAs7
	YoKbGkt6QBXt0s9aGKhzkOqRQfReOrk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673629850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ckKqRBtsefZM1JDfoCvf0Xxq+48ay8EjXnX8re+vcnw=;
	b=i41PM49W8FAAo5VtaJef0OF6bZVxUUD4vM+C5hE1XH1Bk/O8axCxRuu5bOymzyQM8NPZ5s
	MCvYexoo75TOor3p/T0oeMG0TpfhwlMl61pKUsHOgX9ZO/sPGJbBnYVQBbcki390zEEAs7
	YoKbGkt6QBXt0s9aGKhzkOqRQfReOrk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-5aW6yfX9M-KUiM6jBqS-tg-1; Fri, 13 Jan 2023 12:10:47 -0500
X-MC-Unique: 5aW6yfX9M-KUiM6jBqS-tg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25354811E9C;
	Fri, 13 Jan 2023 17:10:44 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.196])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2951C40C2064;
	Fri, 13 Jan 2023 17:10:27 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable v1 00/26] mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE on all architectures with swap PTEs
Date: Fri, 13 Jan 2023 18:10:00 +0100
Message-Id: <20230113171026.582290-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Mailman-Approved-At: Sat, 14 Jan 2023 09:17:16 +1100
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
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, linux-mm@kvack.org, Rich Felker <dalias@libc.org>, Nadav Amit <namit@vmware.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vlastimil Babka <vbabka@suse.cz>, J
 ason Gunthorpe <jgg@nvidia.com>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>, Chris Zankel <chris@zankel.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Johannes Berg <johannes@sipsolutions.net>, linux-arm-kernel@lists.infradead.org, WANG Xuerui <kernel@xen0n.name>, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Max Filippov
  <jcmvbkbc@gmail.com>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is the follow-up on [1]:
	[PATCH v2 0/8] mm: COW fixes part 3: reliable GUP R/W FOLL_GET of
	anonymous pages

After we implemented __HAVE_ARCH_PTE_SWP_EXCLUSIVE on most prominent
enterprise architectures, implement __HAVE_ARCH_PTE_SWP_EXCLUSIVE on all
remaining architectures that support swap PTEs.

This makes sure that exclusive anonymous pages will stay exclusive, even
after they were swapped out -- for example, making GUP R/W FOLL_GET of
anonymous pages reliable. Details can be found in [1].

This primarily fixes remaining known O_DIRECT memory corruptions that can
happen on concurrent swapout, whereby we can lose DMA reads to a page
(modifying the user page by writing to it).

To verify, there are two test cases (requiring swap space, obviously):
(1) The O_DIRECT+swapout test case [2] from Andrea. This test case tries
    triggering a race condition.
(2) My vmsplice() test case [3] that tries to detect if the exclusive
    marker was lost during swapout, not relying on a race condition.


For example, on 32bit x86 (with and without PAE), my test case fails
without these patches:
	$ ./test_swp_exclusive
	FAIL: page was replaced during COW
But succeeds with these patches:
	$ ./test_swp_exclusive
	PASS: page was not replaced during COW


Why implement __HAVE_ARCH_PTE_SWP_EXCLUSIVE for all architectures, even
the ones where swap support might be in a questionable state? This is the
first step towards removing "readable_exclusive" migration entries, and
instead using pte_swp_exclusive() also with (readable) migration entries
instead (as suggested by Peter). The only missing piece for that is
supporting pmd_swp_exclusive() on relevant architectures with THP
migration support.

As all relevant architectures now implement __HAVE_ARCH_PTE_SWP_EXCLUSIVE,,
we can drop __HAVE_ARCH_PTE_SWP_EXCLUSIVE in the last patch.

I tried cross-compiling all relevant setups and tested on x86 and sparc64
so far.

CCing arch maintainers only on this cover letter and on the respective
patch(es).

[1] https://lkml.kernel.org/r/20220329164329.208407-1-david@redhat.com
[2] https://gitlab.com/aarcange/kernel-testcases-for-v5.11/-/blob/main/page_count_do_wp_page-swap.c
[3] https://gitlab.com/davidhildenbrand/scratchspace/-/blob/main/test_swp_exclusive.c


RFC -> v1:
* Some smaller comment+patch description changes
* "powerpc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 32bit book3s"
 -> Fixup swap PTE description


David Hildenbrand (26):
  mm/debug_vm_pgtable: more pte_swp_exclusive() sanity checks
  alpha/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  arc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  arm/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  csky/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  hexagon/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  ia64/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  loongarch/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  m68k/mm: remove dummy __swp definitions for nommu
  m68k/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  microblaze/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  mips/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  nios2/mm: refactor swap PTE layout
  nios2/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  openrisc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  parisc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  powerpc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 32bit book3s
  powerpc/nohash/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  riscv/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  sh/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  sparc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 32bit
  sparc/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 64bit
  um/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  x86/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE also on 32bit
  xtensa/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
  mm: remove __HAVE_ARCH_PTE_SWP_EXCLUSIVE

 arch/alpha/include/asm/pgtable.h              | 40 ++++++++-
 arch/arc/include/asm/pgtable-bits-arcv2.h     | 26 +++++-
 arch/arm/include/asm/pgtable-2level.h         |  3 +
 arch/arm/include/asm/pgtable-3level.h         |  3 +
 arch/arm/include/asm/pgtable.h                | 34 +++++--
 arch/arm64/include/asm/pgtable.h              |  1 -
 arch/csky/abiv1/inc/abi/pgtable-bits.h        | 13 ++-
 arch/csky/abiv2/inc/abi/pgtable-bits.h        | 19 ++--
 arch/csky/include/asm/pgtable.h               | 17 ++++
 arch/hexagon/include/asm/pgtable.h            | 36 ++++++--
 arch/ia64/include/asm/pgtable.h               | 31 ++++++-
 arch/loongarch/include/asm/pgtable-bits.h     |  4 +
 arch/loongarch/include/asm/pgtable.h          | 38 +++++++-
 arch/m68k/include/asm/mcf_pgtable.h           | 35 +++++++-
 arch/m68k/include/asm/motorola_pgtable.h      | 37 +++++++-
 arch/m68k/include/asm/pgtable_no.h            |  6 --
 arch/m68k/include/asm/sun3_pgtable.h          | 38 +++++++-
 arch/microblaze/include/asm/pgtable.h         | 44 +++++++---
 arch/mips/include/asm/pgtable-32.h            | 88 ++++++++++++++++---
 arch/mips/include/asm/pgtable-64.h            | 23 ++++-
 arch/mips/include/asm/pgtable.h               | 35 ++++++++
 arch/nios2/include/asm/pgtable-bits.h         |  3 +
 arch/nios2/include/asm/pgtable.h              | 37 ++++++--
 arch/openrisc/include/asm/pgtable.h           | 40 +++++++--
 arch/parisc/include/asm/pgtable.h             | 40 ++++++++-
 arch/powerpc/include/asm/book3s/32/pgtable.h  | 37 ++++++--
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  1 -
 arch/powerpc/include/asm/nohash/32/pgtable.h  | 22 +++--
 arch/powerpc/include/asm/nohash/32/pte-40x.h  |  6 +-
 arch/powerpc/include/asm/nohash/32/pte-44x.h  | 18 +---
 arch/powerpc/include/asm/nohash/32/pte-85xx.h |  4 +-
 arch/powerpc/include/asm/nohash/64/pgtable.h  | 24 ++++-
 arch/powerpc/include/asm/nohash/pgtable.h     | 15 ++++
 arch/powerpc/include/asm/nohash/pte-e500.h    |  1 -
 arch/riscv/include/asm/pgtable-bits.h         |  3 +
 arch/riscv/include/asm/pgtable.h              | 28 ++++--
 arch/s390/include/asm/pgtable.h               |  1 -
 arch/sh/include/asm/pgtable_32.h              | 53 ++++++++---
 arch/sparc/include/asm/pgtable_32.h           | 26 +++++-
 arch/sparc/include/asm/pgtable_64.h           | 37 +++++++-
 arch/sparc/include/asm/pgtsrmmu.h             | 14 +--
 arch/um/include/asm/pgtable.h                 | 36 +++++++-
 arch/x86/include/asm/pgtable-2level.h         | 26 ++++--
 arch/x86/include/asm/pgtable-3level.h         | 26 +++++-
 arch/x86/include/asm/pgtable.h                |  3 -
 arch/xtensa/include/asm/pgtable.h             | 31 +++++--
 include/linux/pgtable.h                       | 29 ------
 mm/debug_vm_pgtable.c                         | 25 +++++-
 mm/memory.c                                   |  4 -
 mm/rmap.c                                     | 11 ---
 50 files changed, 944 insertions(+), 228 deletions(-)

-- 
2.39.0

