Return-Path: <linuxppc-dev+bounces-11730-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8CDB43C44
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 14:59:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHfgb3L1Qz30V2;
	Thu,  4 Sep 2025 22:59:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756990747;
	cv=none; b=hAKkJmGJYKA1QjShvc3QqSgivfXqxuFxX8lQINKw+FEhh9gfvMapRm+bitOfzxFy/2l573kFz3gB69H+yvCac6tslXYSGwT/1Z95qUt1u5/nurQRU2zMwXbLMK+pcfxXnrdjL2zn0fEjBpnFdmJLqTCczyzzkidJGajjdmVF4JA6CzKYcxMt/JOphmKzd4/rs0XOZOEq0yS42tIavfTYVxMgl7ppM/Jx1coGujwbLcOD8GZ2JvCV5Su6rHof+852To7E8y1j3FcKPBBMS5gVq0dehq/0CIF+/Wk/a4jivQ7HFXNeSE8b+njHBerf91jfXfOW/pyJ8jwFt/R23eUOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756990747; c=relaxed/relaxed;
	bh=CcBj7SkfGcRisUp144Doi/BeLUzFNWGgepHeyPHMYvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VqyS6S+5Fz5HRzFXyfbF15EChjk0SeyabysD076uj/vSZprA3YW1cAVxnAo9Rr5diT9yfzEwxXB8MqnVsEBTDYlKmsbplTS97VWzfQiYnsFV9kNEj382o98Mu7hUwEwrmLpoafqoTMhWC4N+/1wDEjcrCBU3y6eUcFebV/YtcdmvY82r5JbNZqH393BLOak9piNBpaoP6IdWLdGooDFew5oLluG0UKC5MM/rCyX0t8YtEj3D7Mt/4E+ju6MSH5HCK+R2ATjC4qP+dwLCyMew1Or5VObPRB1/o+PTGJZLoub0Oup6Jzm+ySk2mP2dJAysi+nLL1qahaM+QUvMgNw7Tg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHfgZ5xyMz305M
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 22:59:06 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A9CE2EC6;
	Thu,  4 Sep 2025 05:58:27 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17AC83F6A8;
	Thu,  4 Sep 2025 05:58:30 -0700 (PDT)
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
Subject: [PATCH 3/7] arm64: mm: fully support nested lazy_mmu sections
Date: Thu,  4 Sep 2025 13:57:32 +0100
Message-ID: <20250904125736.3918646-4-kevin.brodsky@arm.com>
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

Despite recent efforts to prevent lazy_mmu sections from nesting, it
remains difficult to ensure that it never occurs - and in fact it
does occur on arm64 in certain situations (CONFIG_DEBUG_PAGEALLOC).
Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
made nesting tolerable on arm64, but without truly supporting it:
the inner leave() call clears TIF_LAZY_MMU, disabling the batching
optimisation before the outer section ends.

Now that the lazy_mmu API allows enter() to pass through a state to
the matching leave() call, we can actually support nesting. If
enter() is called inside an active lazy_mmu section, TIF_LAZY_MMU
will already be set, and we can then return LAZY_MMU_NESTED to
instruct the matching leave() call not to clear TIF_LAZY_MMU.

The only effect of this patch is to ensure that TIF_LAZY_MMU (and
therefore the batching optimisation) remains set until the outermost
lazy_mmu section ends. leave() still emits barriers if needed,
regardless of the nesting level, as the caller may expect any
page table changes to become visible when leave() returns.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 816197d08165..602feda97dc4 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -85,24 +85,14 @@ typedef int lazy_mmu_state_t;
 
 static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
 {
-	/*
-	 * lazy_mmu_mode is not supposed to permit nesting. But in practice this
-	 * does happen with CONFIG_DEBUG_PAGEALLOC, where a page allocation
-	 * inside a lazy_mmu_mode section (such as zap_pte_range()) will change
-	 * permissions on the linear map with apply_to_page_range(), which
-	 * re-enters lazy_mmu_mode. So we tolerate nesting in our
-	 * implementation. The first call to arch_leave_lazy_mmu_mode() will
-	 * flush and clear the flag such that the remainder of the work in the
-	 * outer nest behaves as if outside of lazy mmu mode. This is safe and
-	 * keeps tracking simple.
-	 */
+	int lazy_mmu_nested;
 
 	if (in_interrupt())
 		return LAZY_MMU_DEFAULT;
 
-	set_thread_flag(TIF_LAZY_MMU);
+	lazy_mmu_nested = test_and_set_thread_flag(TIF_LAZY_MMU);
 
-	return LAZY_MMU_DEFAULT;
+	return lazy_mmu_nested ? LAZY_MMU_NESTED : LAZY_MMU_DEFAULT;
 }
 
 static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
@@ -113,7 +103,8 @@ static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
 	if (test_and_clear_thread_flag(TIF_LAZY_MMU_PENDING))
 		emit_pte_barriers();
 
-	clear_thread_flag(TIF_LAZY_MMU);
+	if (state != LAZY_MMU_NESTED)
+		clear_thread_flag(TIF_LAZY_MMU);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-- 
2.47.0


