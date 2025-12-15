Return-Path: <linuxppc-dev+bounces-14764-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE35CBE7B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Dec 2025 16:04:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVNd63q7cz2yPM;
	Tue, 16 Dec 2025 02:04:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765811066;
	cv=none; b=UMv3268QmM5DT7YoFzhy4h9po9Me7i5Rob5LajJHBJrHP3auBx98BMRajIAbNwshMul9pZkKTJxcRJU9mWeMZHUIT+4khaNbCfAtLQ7m+9TUm5uduWTXMzYnxSg9LzOR2rxSaI0EE+QA5j5Q+LK7J3+DQfyrk0RlQAzFN+TVvVodzWkC7GHpmc/+nl5DMjY/54+nrn8XT225jqwUBrkvASHwrhf8JPQmFCkzToAMsy6yWg97OJJdz8LSCWnXNlh6DHffZ8/wX34x1VblJytHIMTEtQI2JpZs20//XW09AZPdVXlbvj1HCh7Eo+Hpa/c5Y7VogyXDAce7y5stql1SwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765811066; c=relaxed/relaxed;
	bh=0rF0AsidLeOMu7qD5PDF0s/XHOeU6WMx+Baq4lCM4i8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cW395L90ou+6Nu3l/avU9yyKcI7atrsM90NyIyp4sPFgCEq1p/Ao7KznCw6S0TT8CJbuC6UZq6L1WhlkAI/uxMP2/svPl2UIjT3Qf4upGQptjdAe8+BMXWYqagybjdcnCXQHjyTxue3a7fJUjLYs5U7LRg871DebTx6A0RABKMTUIpZ+cYSD/Cxx0+r95TjaNxD4FK2vYPrScRv5DQ3eRSpVYX24sHOngY7tcV/CjUVrpFiFnVFo5R9bgqN9THppHCp+B92oWm8jFfTRK5+n9vBrXZQFkNt80L11EUZ4m0h2aHPUNyKeCPopDue61rHvwBdQD4ldo5G7pf5YiXiBxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVNd558cGz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 02:04:25 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DD31165C;
	Mon, 15 Dec 2025 07:03:47 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F099A3F73B;
	Mon, 15 Dec 2025 07:03:48 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
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
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Subject: [PATCH v6 03/14] powerpc/mm: implement arch_flush_lazy_mmu_mode()
Date: Mon, 15 Dec 2025 15:03:12 +0000
Message-ID: <20251215150323.2218608-4-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251215150323.2218608-1-kevin.brodsky@arm.com>
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
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
arch_flush_lazy_mmu_mode() and have the former call the latter. The
radix_enabled() check is required in both as
arch_flush_lazy_mmu_mode() will be called directly from the generic
layer in a subsequent patch.

Note: the additional this_cpu_ptr() and radix_enabled() calls on the
arch_leave_lazy_mmu_mode() path will be removed in a subsequent
patch.

Acked-by: David Hildenbrand <david@redhat.com>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 .../powerpc/include/asm/book3s/64/tlbflush-hash.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index 146287d9580f..2d45f57df169 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -41,7 +41,7 @@ static inline void arch_enter_lazy_mmu_mode(void)
 	batch->active = 1;
 }
 
-static inline void arch_leave_lazy_mmu_mode(void)
+static inline void arch_flush_lazy_mmu_mode(void)
 {
 	struct ppc64_tlb_batch *batch;
 
@@ -51,12 +51,21 @@ static inline void arch_leave_lazy_mmu_mode(void)
 
 	if (batch->index)
 		__flush_tlb_pending(batch);
+}
+
+static inline void arch_leave_lazy_mmu_mode(void)
+{
+	struct ppc64_tlb_batch *batch;
+
+	if (radix_enabled())
+		return;
+	batch = this_cpu_ptr(&ppc64_tlb_batch);
+
+	arch_flush_lazy_mmu_mode();
 	batch->active = 0;
 	preempt_enable();
 }
 
-#define arch_flush_lazy_mmu_mode()      do {} while (0)
-
 extern void hash__tlbiel_all(unsigned int action);
 
 extern void flush_hash_page(unsigned long vpn, real_pte_t pte, int psize,
-- 
2.51.2


