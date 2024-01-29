Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A81BF840864
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 15:33:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Iqvpnmy6;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Iqvpnmy6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNrPl4Pnpz3cVP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 01:33:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Iqvpnmy6;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Iqvpnmy6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNrP141Pfz30QJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 01:32:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706538753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UhBdOI+JB6L0dCFGLAOqO2pJABjn3Znd2yV65wClG/w=;
	b=Iqvpnmy6mMOPZYG3tx6bZyM1BBxCV+4385uaRT74evBaBlOh3R6HgGA6282djlwpn0ZbeE
	xpmrbEGCe8wFspedK7kQ1URAAT4MbKHIiT6zUZxjDHa8AWqylfV9qr3YdfR1y99pJlWW/N
	8v0S5RIQtE24HcSrrIXkIm0/j7+r6rE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706538753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UhBdOI+JB6L0dCFGLAOqO2pJABjn3Znd2yV65wClG/w=;
	b=Iqvpnmy6mMOPZYG3tx6bZyM1BBxCV+4385uaRT74evBaBlOh3R6HgGA6282djlwpn0ZbeE
	xpmrbEGCe8wFspedK7kQ1URAAT4MbKHIiT6zUZxjDHa8AWqylfV9qr3YdfR1y99pJlWW/N
	8v0S5RIQtE24HcSrrIXkIm0/j7+r6rE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-478-Kz5-1HWrO6SlttN34_aWHQ-1; Mon,
 29 Jan 2024 09:32:29 -0500
X-MC-Unique: Kz5-1HWrO6SlttN34_aWHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 979933C13A90;
	Mon, 29 Jan 2024 14:32:27 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75D74C3F;
	Mon, 29 Jan 2024 14:32:22 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/9] mm/memory: optimize unmap/zap with PTE-mapped THP
Date: Mon, 29 Jan 2024 15:32:12 +0100
Message-ID: <20240129143221.263763-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Matthew Wilcox <willy@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Ryan Roberts <ryan.roberts@arm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Nick Piggin <npiggin@gmail.com>, Sven Schnelle <svens@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is based on [1] and must be applied on top of it.
Similar to what we did with fork(), let's implement PTE batching
during unmap/zap when processing PTE-mapped THPs.

We collect consecutive PTEs that map consecutive pages of the same large
folio, making sure that the other PTE bits are compatible, and (a) adjust
the refcount only once per batch, (b) call rmap handling functions only
once per batch, (c) perform batch PTE setting/updates and (d) perform TLB
entry removal once per batch.

Ryan was previously working on this in the context of cont-pte for
arm64, int latest iteration [2] with a focus on arm6 with cont-pte only.
This series implements the optimization for all architectures, independent
of such PTE bits, teaches MMU gather/TLB code to be fully aware of such
large-folio-pages batches as well, and amkes use of our new rmap batching
function when removing the rmap.

To achieve that, we have to enlighten MMU gather / page freeing code
(i.e., everything that consumes encoded_page) to process unmapping
of consecutive pages that all belong to the same large folio. I'm being
very careful to not degrade order-0 performance, and it looks like I
managed to achieve that.

While this series should -- similar to [1] -- be beneficial for adding
cont-pte support on arm64[2], it's one of the requirements for maintaining
a total mapcount[3] for large folios with minimal added overhead and
further changes[4] that build up on top of the total mapcount.

Independent of all that, this series results in a speedup during munmap()
and similar unmapping (process teardown, MADV_DONTNEED on larger ranges)
with PTE-mapped THP, which is the default with THPs that are smaller than
a PMD (for example, 16KiB to 1024KiB mTHPs for anonymous memory[5]).

On an Intel Xeon Silver 4210R CPU, munmap'ing a 1GiB VMA backed by
PTE-mapped folios of the same size (stddev < 1%) results in the following
runtimes for munmap() in seconds (shorter is better):

Folio Size | mm-unstable |      New | Change
---------------------------------------------
      4KiB |    0.058110 | 0.057715 |   - 1%
     16KiB |    0.044198 | 0.035469 |   -20%
     32KiB |    0.034216 | 0.023522 |   -31%
     64KiB |    0.029207 | 0.018434 |   -37%
    128KiB |    0.026579 | 0.014026 |   -47%
    256KiB |    0.025130 | 0.011756 |   -53%
    512KiB |    0.024292 | 0.010703 |   -56%
   1024KiB |    0.023812 | 0.010294 |   -57%
   2048KiB |    0.023785 | 0.009910 |   -58%

CCing especially s390x folks, because they have a tlb freeing hooks that
needs adjustment. Only tested on x86-64 for now, will have to do some more
stress testing. Compile-tested on most other architectures. The PPC
change is negleglible and makes my cross-compiler happy.

[1] https://lkml.kernel.org/r/20240129124649.189745-1-david@redhat.com
[2] https://lkml.kernel.org/r/20231218105100.172635-1-ryan.roberts@arm.com
[3] https://lkml.kernel.org/r/20230809083256.699513-1-david@redhat.com
[4] https://lkml.kernel.org/r/20231124132626.235350-1-david@redhat.com
[5] https://lkml.kernel.org/r/20231207161211.2374093-1-ryan.roberts@arm.com

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: Nick Piggin <npiggin@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org

David Hildenbrand (9):
  mm/memory: factor out zapping of present pte into zap_present_pte()
  mm/memory: handle !page case in zap_present_pte() separately
  mm/memory: further separate anon and pagecache folio handling in
    zap_present_pte()
  mm/memory: factor out zapping folio pte into zap_present_folio_pte()
  mm/mmu_gather: pass "delay_rmap" instead of encoded page to
    __tlb_remove_page_size()
  mm/mmu_gather: define ENCODED_PAGE_FLAG_DELAY_RMAP
  mm/mmu_gather: add __tlb_remove_folio_pages()
  mm/mmu_gather: add tlb_remove_tlb_entries()
  mm/memory: optimize unmap/zap with PTE-mapped THP

 arch/powerpc/include/asm/tlb.h |   2 +
 arch/s390/include/asm/tlb.h    |  30 ++++--
 include/asm-generic/tlb.h      |  40 ++++++--
 include/linux/mm_types.h       |  37 ++++++--
 include/linux/pgtable.h        |  66 +++++++++++++
 mm/memory.c                    | 167 +++++++++++++++++++++++----------
 mm/mmu_gather.c                |  63 +++++++++++--
 mm/swap.c                      |  12 ++-
 mm/swap_state.c                |  12 ++-
 9 files changed, 347 insertions(+), 82 deletions(-)

-- 
2.43.0

