Return-Path: <linuxppc-dev+bounces-13499-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B347C1998E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 11:10:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxNKp5c0nz3cfv;
	Wed, 29 Oct 2025 21:10:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761732638;
	cv=none; b=ig62Byt+qJAZgKcJVJ/razkACEQuwnS32HFu0BusFP9OzGYcd4KH4oKn0sjuxljQ3gm5mEXgpNBqh4T520FpEUvaOauoU548+whXoA/dOe2+2y5PqkWqMa6GKqC4sK7/D9rhwEAOpQpzEhrt3kV706pFo7MM8p0BxDRtr503GnrLnArwoYNTK7ggMeB6SwJktiftCmbyWiqVCeqkNVrq+lXJPDdg/Ql9ed28dRHT2LJT1JKl+QYjZQkVTQhTRzClY5j73mZQX/1Tso64rtmNES76hWcl7oSSvNmBBRQsoV/gkFt7gKZr6n/ARFvDkK6NAXssCfM6u3SqGhj1ko/o4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761732638; c=relaxed/relaxed;
	bh=kvvX36phAp+peVOlxruWBCxwtzwfFIHoLx/bWBK6XQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gMYZe8RZme4ESYjPgLTdA6/bOVwcewK9XZT46OUzkJ8qyJjiwktESKCCMcOIjXEJIQa2fZLBgsD9DeQ5O1RoacsJN8Fj6UALTwzu50lpDuqT0Bj7w4kZNW2yv35zpJetVXt3uIoTYehGiXZ8iN1D1GJ2oLIAs9M5LFDImSSxD/WIGvOLPqLnXxw3z7fX0kt5n4dYwsEuomKVAwF7YsSgnS1CMpoSxzZX5rrzJrdH+RknzrUMr5WJ2OkHil+DDcGOZWnE4loPmRKFRE3Ifbmg8swCObRqnvxQJQRCI20wt4AwOOqi65sQ3cRDJaBOtG9t2GB94nuufKBqmCU8XMg0GA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxNKp1xQxz3bsb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 21:10:38 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 809B12BCC;
	Wed, 29 Oct 2025 03:09:59 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BA203F66E;
	Wed, 29 Oct 2025 03:10:02 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Woodhouse <dwmw2@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>,
	Juergen Gross <jgross@suse.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Subject: [PATCH v4 03/12] powerpc/mm: implement arch_flush_lazy_mmu_mode()
Date: Wed, 29 Oct 2025 10:09:00 +0000
Message-ID: <20251029100909.3381140-4-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251029100909.3381140-1-kevin.brodsky@arm.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
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

Upcoming changes to the lazy_mmu API will cause
arch_flush_lazy_mmu_mode() to be called when leaving a nested
lazy_mmu section.

Move the relevant logic from arch_leave_lazy_mmu_mode() to
arch_flush_lazy_mmu_mode() and have the former call the latter.

Note: the additional this_cpu_ptr() on the
arch_leave_lazy_mmu_mode() path will be removed in a subsequent
patch.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 .../powerpc/include/asm/book3s/64/tlbflush-hash.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index 146287d9580f..7704dbe8e88d 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -41,6 +41,16 @@ static inline void arch_enter_lazy_mmu_mode(void)
 	batch->active = 1;
 }
 
+static inline void arch_flush_lazy_mmu_mode(void)
+{
+	struct ppc64_tlb_batch *batch;
+
+	batch = this_cpu_ptr(&ppc64_tlb_batch);
+
+	if (batch->index)
+		__flush_tlb_pending(batch);
+}
+
 static inline void arch_leave_lazy_mmu_mode(void)
 {
 	struct ppc64_tlb_batch *batch;
@@ -49,14 +59,11 @@ static inline void arch_leave_lazy_mmu_mode(void)
 		return;
 	batch = this_cpu_ptr(&ppc64_tlb_batch);
 
-	if (batch->index)
-		__flush_tlb_pending(batch);
+	arch_flush_lazy_mmu_mode();
 	batch->active = 0;
 	preempt_enable();
 }
 
-#define arch_flush_lazy_mmu_mode()      do {} while (0)
-
 extern void hash__tlbiel_all(unsigned int action);
 
 extern void flush_hash_page(unsigned long vpn, real_pte_t pte, int psize,
-- 
2.47.0


