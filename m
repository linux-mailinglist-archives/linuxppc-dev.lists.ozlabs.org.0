Return-Path: <linuxppc-dev+bounces-9039-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C922FAC911C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 16:06:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b84ln1Qtrz2ym2;
	Sat, 31 May 2025 00:06:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748613972;
	cv=none; b=Gw5enzcUEQVqOSNPonVKljVzE7XqIlklsjpEYwnRL20gKyplMcUSM7WSXMIdJ+PNdZfTlHLcX2ERwToGF3i/13My67OXPaFLnXGrZQOnFdW7ksFD1vkvhM73XiC/du8iaHPsAEvD/W+rYtXx0BnhAcDrNBQj8N7R8qkoPltkW09QjNatpiWTw6e7VPwZWMLm1mgS41RBd+BZtkeYw/1E/G2Sokssil+D+CskBPp3dH87PNp140PsjHONhe4wrzqTvAHpJ+rcMJtbkC/jFeSqhcG1giW/AewnAiDv2rSJTA/sRxlDQnA+eebnM7cCWtZ2n8/ViDCyYpGpg63LFOjXzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748613972; c=relaxed/relaxed;
	bh=EUPgw/7pzLD6N6r0driX00E5pSCpiid8jSWJPmUN/DU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GwzaJesXy8rNgPhKQJtMvcvsfvsczBnWEbZ1Fo/yd2Gg8uaOj6gxtwMUV8u4Q11LCm+LsfMKk0fAy1mvv6ngwIu0QSf2YXklueEKJTitn8WwIhASVqV87reRRnBJBhW7eqM3Y8azU6lHZImECou4sQKJyoF1ZfrgbYeZKwd/05lcOB5XeGbraMlpdf7LdjtvrIGe6Jt7XTVNB/OakB5HhHpGUKZ0iDlupaMs8K7KiuXnsWL7oOnNBcv2iiHUMpsGphMf6VFhE7nQWtP+9m7j29M8+vgQLcfXwAHkbUB8nRTuZDlARL3a5+XS3jaWQAlmpsCZ2k4Ur+YLYQhn39GJKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b84ll6r7wz2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 May 2025 00:06:11 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A52826A4;
	Fri, 30 May 2025 07:05:15 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9729C3F673;
	Fri, 30 May 2025 07:05:26 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-mm@kvack.org
Subject: [RFC PATCH v1 5/6] mm: Avoid calling page allocator while in lazy mmu mode
Date: Fri, 30 May 2025 15:04:43 +0100
Message-ID: <20250530140446.2387131-6-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530140446.2387131-1-ryan.roberts@arm.com>
References: <20250530140446.2387131-1-ryan.roberts@arm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Lazy mmu mode applies to the current task and permits pte modifications
to be deferred and updated at a later time in a batch to improve
performance. tlb_next_batch() is called in lazy mmu mode as follows:

zap_pte_range
  arch_enter_lazy_mmu_mode
  do_zap_pte_range
    zap_present_ptes
      zap_present_folio_ptes
        __tlb_remove_folio_pages
          __tlb_remove_folio_pages_size
            tlb_next_batch
  arch_leave_lazy_mmu_mode

tlb_next_batch() may call into the page allocator which is problematic
with CONFIG_DEBUG_PAGEALLOC because debug_pagealloc_[un]map_pages()
calls the arch implementation of __kernel_map_pages() which must modify
the ptes for the linear map.

There are two possibilities at this point:

- If the arch implementation modifies the ptes directly without first
  entering lazy mmu mode, the pte modifications may get deferred until
  the existing lazy mmu mode is exited. This could result in taking
  spurious faults for example.

- If the arch implementation enters a nested lazy mmu mode before
  modification of the ptes (many arches use apply_to_page_range()),
  then the linear map updates will definitely be applied upon leaving
  the inner lazy mmu mode. But because lazy mmu mode does not support
  nesting, the remainder of the outer user is no longer in lazy mmu
  mode and the optimization opportunity is lost.

So let's just ensure that the page allocator is never called from within
lazy mmu mode. Use the new arch_in_lazy_mmu_mode() API to check if we
are in lazy mmu mode, and if so, when calling into the page allocator,
temporarily leave lazy mmu mode.

Given this new API we can also add VM_WARNings to check that we exit
lazy mmu mode when required to ensure the PTEs are actually updated
prior to tlb flushing.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/asm-generic/tlb.h |  2 ++
 mm/mmu_gather.c           | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 88a42973fa47..84fb269b78a5 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -469,6 +469,8 @@ tlb_update_vma_flags(struct mmu_gather *tlb, struct vm_area_struct *vma)
 
 static inline void tlb_flush_mmu_tlbonly(struct mmu_gather *tlb)
 {
+	VM_WARN_ON(arch_in_lazy_mmu_mode());
+
 	/*
 	 * Anything calling __tlb_adjust_range() also sets at least one of
 	 * these bits.
diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index db7ba4a725d6..0bd1e69b048b 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -18,6 +18,7 @@
 static bool tlb_next_batch(struct mmu_gather *tlb)
 {
 	struct mmu_gather_batch *batch;
+	bool lazy_mmu;
 
 	/* Limit batching if we have delayed rmaps pending */
 	if (tlb->delayed_rmap && tlb->active != &tlb->local)
@@ -32,7 +33,15 @@ static bool tlb_next_batch(struct mmu_gather *tlb)
 	if (tlb->batch_count == MAX_GATHER_BATCH_COUNT)
 		return false;
 
+	lazy_mmu = arch_in_lazy_mmu_mode();
+	if (lazy_mmu)
+		arch_leave_lazy_mmu_mode();
+
 	batch = (void *)__get_free_page(GFP_NOWAIT | __GFP_NOWARN);
+
+	if (lazy_mmu)
+		arch_enter_lazy_mmu_mode();
+
 	if (!batch)
 		return false;
 
@@ -145,6 +154,8 @@ static void tlb_batch_pages_flush(struct mmu_gather *tlb)
 {
 	struct mmu_gather_batch *batch;
 
+	VM_WARN_ON(arch_in_lazy_mmu_mode());
+
 	for (batch = &tlb->local; batch && batch->nr; batch = batch->next)
 		__tlb_batch_free_encoded_pages(batch);
 	tlb->active = &tlb->local;
@@ -154,6 +165,8 @@ static void tlb_batch_list_free(struct mmu_gather *tlb)
 {
 	struct mmu_gather_batch *batch, *next;
 
+	VM_WARN_ON(arch_in_lazy_mmu_mode());
+
 	for (batch = tlb->local.next; batch; batch = next) {
 		next = batch->next;
 		free_pages((unsigned long)batch, 0);
@@ -363,6 +376,8 @@ void tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
 	struct mmu_table_batch **batch = &tlb->batch;
 
+	VM_WARN_ON(arch_in_lazy_mmu_mode());
+
 	if (*batch == NULL) {
 		*batch = (struct mmu_table_batch *)__get_free_page(GFP_NOWAIT | __GFP_NOWARN);
 		if (*batch == NULL) {
-- 
2.43.0


