Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A45840558
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 13:47:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YfaWmx2n;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YfaWmx2n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNp3y021Hz3cTq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 23:47:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YfaWmx2n;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YfaWmx2n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNp3C5LbPz2yyT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jan 2024 23:47:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706532420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KvkAH0bQzCOTptNfhBBhiuyqh5M2/G8GqLgKULFKaNQ=;
	b=YfaWmx2nBejTq5HMH1lesyq31vqoeAI0m71bVkpBELOzisHNYTWH2ZNWKgsbC57xS8hNJ/
	qTFYk/t6derFCllTKjseRRGFKrBNgo3as4Fwtq1F9qpTYrNp1hvN8AEjCbXQBRAP+dMMtw
	I0JbSNNiDtT333Hff3XJrbOxftsRJYE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706532420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KvkAH0bQzCOTptNfhBBhiuyqh5M2/G8GqLgKULFKaNQ=;
	b=YfaWmx2nBejTq5HMH1lesyq31vqoeAI0m71bVkpBELOzisHNYTWH2ZNWKgsbC57xS8hNJ/
	qTFYk/t6derFCllTKjseRRGFKrBNgo3as4Fwtq1F9qpTYrNp1hvN8AEjCbXQBRAP+dMMtw
	I0JbSNNiDtT333Hff3XJrbOxftsRJYE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-369-GprgdTNKNKqdu1U7aI74eA-1; Mon,
 29 Jan 2024 07:46:58 -0500
X-MC-Unique: GprgdTNKNKqdu1U7aI74eA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4DE129AC02A;
	Mon, 29 Jan 2024 12:46:56 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C575107BD;
	Mon, 29 Jan 2024 12:46:50 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/15] mm/memory: optimize fork() with PTE-mapped THP
Date: Mon, 29 Jan 2024 13:46:34 +0100
Message-ID: <20240129124649.189745-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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
Cc: David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" 
 <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that the rmap overhaul[1] is upstream that provides a clean interface
for rmap batching, let's implement PTE batching during fork when processing
PTE-mapped THPs.

This series is partially based on Ryan's previous work[2] to implement
cont-pte support on arm64, but its a complete rewrite based on [1] to
optimize all architectures independent of any such PTE bits, and to
use the new rmap batching functions that simplify the code and prepare
for further rmap accounting changes.

We collect consecutive PTEs that map consecutive pages of the same large
folio, making sure that the other PTE bits are compatible, and (a) adjust
the refcount only once per batch, (b) call rmap handling functions only
once per batch and (c) perform batch PTE setting/updates.

While this series should be beneficial for adding cont-pte support on
ARM64[2], it's one of the requirements for maintaining a total mapcount[3]
for large folios with minimal added overhead and further changes[4] that
build up on top of the total mapcount.

Independent of all that, this series results in a speedup during fork with
PTE-mapped THP, which is the default with THPs that are smaller than a PMD
(for example, 16KiB to 1024KiB mTHPs for anonymous memory[5]).

On an Intel Xeon Silver 4210R CPU, fork'ing with 1GiB of PTE-mapped folios
of the same size (stddev < 1%) results in the following runtimes
for fork() (shorter is better):

Folio Size | v6.8-rc1 |      New | Change
------------------------------------------
      4KiB | 0.014328 | 0.014035 |   - 2%
     16KiB | 0.014263 | 0.01196  |   -16%
     32KiB | 0.014334 | 0.01094  |   -24%
     64KiB | 0.014046 | 0.010444 |   -26%
    128KiB | 0.014011 | 0.010063 |   -28%
    256KiB | 0.013993 | 0.009938 |   -29%
    512KiB | 0.013983 | 0.00985  |   -30%
   1024KiB | 0.013986 | 0.00982  |   -30%
   2048KiB | 0.014305 | 0.010076 |   -30%

Note that these numbers are even better than the ones from v1 (verified
over multiple reboots), even though there were only minimal code changes.
Well, I removed a pte_mkclean() call for anon folios, maybe that also
plays a role.

But my experience is that fork() is extremely sensitive to code size,
inlining, ... so I suspect we'll see on other architectures rather a change
of -20% instead of -30%, and it will be easy to "lose" some of that speedup
in the future by subtle code changes.

Next up is PTE batching when unmapping. Only tested on x86-64.
Compile-tested on most other architectures.

v2 -> v3:
 * Rebased on mm-unstable
 * Picked up RB's
 * Updated documentation of wrprotect_ptes().

v1 -> v2:
 * "arm64/mm: Make set_ptes() robust when OAs cross 48-bit boundary"
  -> Added patch from Ryan
 * "arm/pgtable: define PFN_PTE_SHIFT"
  -> Removed the arm64 bits
 * "mm/pgtable: make pte_next_pfn() independent of set_ptes()"
 * "arm/mm: use pte_next_pfn() in set_ptes()"
 * "powerpc/mm: use pte_next_pfn() in set_ptes()"
  -> Added to use pte_next_pfn() in some arch set_ptes() implementations
     I tried to make use of pte_next_pfn() also in the others, but it's
     not trivial because the other archs implement set_ptes() in their
     asm/pgtable.h. Future work.
 * "mm/memory: factor out copying the actual PTE in copy_present_pte()"
  -> Move common folio_get() out of if/else
 * "mm/memory: optimize fork() with PTE-mapped THP"
  -> Add doc for wrprotect_ptes
  -> Extend description to mention handling of pinned folios
  -> Move common folio_ref_add() out of if/else
 * "mm/memory: ignore dirty/accessed/soft-dirty bits in folio_pte_batch()"
  -> Be more conservative with dirt/soft-dirty, let the caller specify
     using flags

[1] https://lkml.kernel.org/r/20231220224504.646757-1-david@redhat.com
[2] https://lkml.kernel.org/r/20231218105100.172635-1-ryan.roberts@arm.com
[3] https://lkml.kernel.org/r/20230809083256.699513-1-david@redhat.com
[4] https://lkml.kernel.org/r/20231124132626.235350-1-david@redhat.com
[5] https://lkml.kernel.org/r/20231207161211.2374093-1-ryan.roberts@arm.com

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: sparclinux@vger.kernel.org

---

Andrew asked for a resend based on latest mm-unstable. I am sending this
out earlier than I would usually have sent out the next version, so we can
pull it into mm-unstable again now that v1 was dropped.

David Hildenbrand (14):
  arm/pgtable: define PFN_PTE_SHIFT
  nios2/pgtable: define PFN_PTE_SHIFT
  powerpc/pgtable: define PFN_PTE_SHIFT
  riscv/pgtable: define PFN_PTE_SHIFT
  s390/pgtable: define PFN_PTE_SHIFT
  sparc/pgtable: define PFN_PTE_SHIFT
  mm/pgtable: make pte_next_pfn() independent of set_ptes()
  arm/mm: use pte_next_pfn() in set_ptes()
  powerpc/mm: use pte_next_pfn() in set_ptes()
  mm/memory: factor out copying the actual PTE in copy_present_pte()
  mm/memory: pass PTE to copy_present_pte()
  mm/memory: optimize fork() with PTE-mapped THP
  mm/memory: ignore dirty/accessed/soft-dirty bits in folio_pte_batch()
  mm/memory: ignore writable bit in folio_pte_batch()

Ryan Roberts (1):
  arm64/mm: Make set_ptes() robust when OAs cross 48-bit boundary

 arch/arm/include/asm/pgtable.h      |   2 +
 arch/arm/mm/mmu.c                   |   2 +-
 arch/arm64/include/asm/pgtable.h    |  28 ++--
 arch/nios2/include/asm/pgtable.h    |   2 +
 arch/powerpc/include/asm/pgtable.h  |   2 +
 arch/powerpc/mm/pgtable.c           |   5 +-
 arch/riscv/include/asm/pgtable.h    |   2 +
 arch/s390/include/asm/pgtable.h     |   2 +
 arch/sparc/include/asm/pgtable_64.h |   2 +
 include/linux/pgtable.h             |  33 ++++-
 mm/memory.c                         | 212 ++++++++++++++++++++++------
 11 files changed, 229 insertions(+), 63 deletions(-)


base-commit: d162e170f1181b4305494843e1976584ddf2b72e
-- 
2.43.0

