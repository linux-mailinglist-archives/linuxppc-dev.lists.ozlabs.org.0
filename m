Return-Path: <linuxppc-dev+bounces-11734-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F08F3B43C4C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 14:59:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHfh063Y7z3bhY;
	Thu,  4 Sep 2025 22:59:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756990768;
	cv=none; b=IClbax5Tdp76yg+YmpLwTUxBoQmLs6cVO/GdlbtjNQ0SzFyKItYYgE2jV0S2YBfbOvumcKteIBOHSxP6ZetC3cSvjmx0a6LHtJ3M39f3tUUHbL+vke61cLlFVWjT+mab2f/S5vpGgdhiE8kODCejJDaF9SHKW7OBF1T957FJV9kEsDed1yhSobCxwFSwDKyplBMenCKOqIP/TBD3hop7jt8g+kkBCTAM56wMUxk9k56cUCNfFQG77k1nnAmPlHpKmnZ4cr1zIZd3wUJZHHiTWQUh/1dDoBJR53bfg+rrHzaojDxqvL4S3tec8gqDUpIy+JsQ29eswHYsg7o8V4+qQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756990768; c=relaxed/relaxed;
	bh=0BUJXONwqTBSysHPr42gCRrrCMl1Y1aaFX8/rMouS8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8ZE5KfKfQCPhl+L0osawRjH+8N05tRe9X9/aJozEaye2hWFRuu9+eVHAFvg+gUFGZkI5CWbRo4smt9rWChMdUFIKcBXHpjdO3y7W+KWsUYrFeSsuoIC8dKgh9XYvs9EUUe5hAGVlqpP5r9U8eEPUzce5Bvpfu/s0o+eshtnZu1e+u2+IydQNokrVCn6fnMMqQUky/Z6jUJfwKBd9Z5jdlEsbChsQbP+ciESBGLTyzVg7ANPbG3T5ox/YgxVz9HFKngtltHox/KQmCvZfXOBQoJ0oBoCM6AkbcOqJGfTD6SYaLuI6OpBpkGSFCyQXWALyaCgejJEybQHRYFO/7dZbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHfh0069Gz3bcJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 22:59:28 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00A6F2ED2;
	Thu,  4 Sep 2025 05:58:37 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0CAA3F6A8;
	Thu,  4 Sep 2025 05:58:40 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 5/7] powerpc/mm: support nested lazy_mmu sections
Date: Thu,  4 Sep 2025 13:57:34 +0100
Message-ID: <20250904125736.3918646-6-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250904125736.3918646-1-kevin.brodsky@arm.com>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
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

The lazy_mmu API now allows nested sections to be handled by arch
code: enter() can return a flag if called inside another lazy_mmu
section, so that the matching call to leave() leaves any
optimisation enabled.

This patch implements that new logic for powerpc: if there is an
active batch, then enter() returns LAZY_MMU_NESTED and the matching
leave() leaves batch->active set. The preempt_{enable,disable} calls
are left untouched as they already handle nesting themselves.

TLB flushing is still done in leave() regardless of the nesting
level, as the caller may rely on it whether nesting is occurring or
not.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 .../powerpc/include/asm/book3s/64/tlbflush-hash.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index c9f1e819e567..001c474da1fe 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -30,6 +30,7 @@ typedef int lazy_mmu_state_t;
 static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
 {
 	struct ppc64_tlb_batch *batch;
+	int lazy_mmu_nested;
 
 	if (radix_enabled())
 		return LAZY_MMU_DEFAULT;
@@ -39,9 +40,14 @@ static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
 	 */
 	preempt_disable();
 	batch = this_cpu_ptr(&ppc64_tlb_batch);
-	batch->active = 1;
+	lazy_mmu_nested = batch->active;
 
-	return LAZY_MMU_DEFAULT;
+	if (!lazy_mmu_nested) {
+		batch->active = 1;
+		return LAZY_MMU_DEFAULT;
+	} else {
+		return LAZY_MMU_NESTED;
+	}
 }
 
 static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
@@ -54,7 +60,10 @@ static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
 
 	if (batch->index)
 		__flush_tlb_pending(batch);
-	batch->active = 0;
+
+	if (state != LAZY_MMU_NESTED)
+		batch->active = 0;
+
 	preempt_enable();
 }
 
-- 
2.47.0


