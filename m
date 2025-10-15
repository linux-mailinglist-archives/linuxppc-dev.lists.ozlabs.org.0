Return-Path: <linuxppc-dev+bounces-12890-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F287ABDD683
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 10:29:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmkks5zWvz3dBn;
	Wed, 15 Oct 2025 19:28:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760516933;
	cv=none; b=HATL3Yotj4CczahW1YawLX2Cn11gdkZOVOD3TTyksqw2i3bCHZnXT0j9dg6nvbS0KPCPxm5W/r9pw2sWZZ3IINHOBV2nM+T5FtF3SbsvCv5pXly6Nw1xgjKbgbN6v0MaYV5MTTheIPhHXL9Et8LQbIt0vruLYW9t5gXGWFN6SyUnMc59ITqxmeGVDm0nvn6pwMIj/YeIArg5jlOr/+DejApbJOPGlUoUUDUDPcr+yj3klH4YlJMHoGj0c5rvdlTptyulVUeRsTf7iVkDvXCuP8lYtujgMofEOD8y5H4pc3clpCP0aeVGPeUlKAXbYSUSurW4/eRuhsMRZXtNVrZNrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760516933; c=relaxed/relaxed;
	bh=/Oc2Kn+68+9BJj/EDaEdJiag5mR/bu1km+1hhaHUolU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gTWB1KQ5Huqb8J2a6xfbyyWnSw9HUGlbi4oJMyEb8EwDY2iWD+ekkEQWtEEaRDvKUhPP+JTtaRgU6P6xCH0W4FOv3Rg7KgRCqasX5VkOUE9hjUmQWk7t8jAjm8EZprQY1CLkP9os8iAPkTV0UGrvuIIab90Y7zbPW2F/2T4imlbvBlxUxaHv3t/yn6ywRUAIBuGkRJLb7Os2aMs4/4/Y27Fd2EpuGeAoIviDMvb+lehAwEN7FcCHYhwhTSjfA3T4pPBdyl/v6R4ifjlhL2BmdmsanmSaafOIjMEfuKkyJa/0WFB6pOhLV9aEfMTIDog0Cmc200Ts7Mwy5JVbocJi4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmkks1K1Rz3d9v
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 19:28:53 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3A1E2379;
	Wed, 15 Oct 2025 01:28:44 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF2653F66E;
	Wed, 15 Oct 2025 01:28:47 -0700 (PDT)
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
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Subject: [PATCH v3 13/13] mm: introduce arch_wants_lazy_mmu_mode()
Date: Wed, 15 Oct 2025 09:27:27 +0100
Message-ID: <20251015082727.2395128-14-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251015082727.2395128-1-kevin.brodsky@arm.com>
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
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

powerpc decides at runtime whether the lazy MMU mode should be used.

To avoid the overhead associated with managing
task_struct::lazy_mmu_state if the mode isn't used, introduce
arch_wants_lazy_mmu_mode() and bail out of lazy_mmu_mode_* if it
returns false. Add a default definition returning true, and an
appropriate implementation for powerpc.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
This patch seemed like a good idea to start with, but now I'm not so
sure that the churn added to the generic layer is worth it.

It provides a minor optimisation for just powerpc. x86 with XEN_PV also
chooses at runtime whether to implement lazy_mmu helpers or not, but
it doesn't fit this API so neatly and isn't handled here.
---
 .../include/asm/book3s/64/tlbflush-hash.h        | 11 ++++++-----
 include/linux/pgtable.h                          | 16 ++++++++++++----
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index bbc54690d374..a91b354cf87c 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -23,10 +23,14 @@ DECLARE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
 
 extern void __flush_tlb_pending(struct ppc64_tlb_batch *batch);
 
+#define arch_wants_lazy_mmu_mode arch_wants_lazy_mmu_mode
+static inline bool arch_wants_lazy_mmu_mode(void)
+{
+	return !radix_enabled();
+}
+
 static inline void arch_enter_lazy_mmu_mode(void)
 {
-	if (radix_enabled())
-		return;
 	/*
 	 * apply_to_page_range can call us this preempt enabled when
 	 * operating on kernel page tables.
@@ -46,9 +50,6 @@ static inline void arch_flush_lazy_mmu_mode(void)
 
 static inline void arch_leave_lazy_mmu_mode(void)
 {
-	if (radix_enabled())
-		return;
-
 	arch_flush_lazy_mmu_mode();
 	preempt_enable();
 }
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 718c9c788114..db4f388d2a16 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -261,11 +261,19 @@ static inline int pmd_dirty(pmd_t pmd)
  * currently enabled.
  */
 #ifdef CONFIG_ARCH_LAZY_MMU
+
+#ifndef arch_wants_lazy_mmu_mode
+static inline bool arch_wants_lazy_mmu_mode(void)
+{
+	return true;
+}
+#endif
+
 static inline void lazy_mmu_mode_enable(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
-	if (in_interrupt())
+	if (!arch_wants_lazy_mmu_mode() || in_interrupt())
 		return;
 
 	VM_BUG_ON(state->count == U8_MAX);
@@ -283,7 +291,7 @@ static inline void lazy_mmu_mode_disable(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
-	if (in_interrupt())
+	if (!arch_wants_lazy_mmu_mode() || in_interrupt())
 		return;
 
 	VM_BUG_ON(state->count == 0);
@@ -303,7 +311,7 @@ static inline void lazy_mmu_mode_pause(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
-	if (in_interrupt())
+	if (!arch_wants_lazy_mmu_mode() || in_interrupt())
 		return;
 
 	VM_WARN_ON(state->count == 0 || !state->enabled);
@@ -316,7 +324,7 @@ static inline void lazy_mmu_mode_resume(void)
 {
 	struct lazy_mmu_state *state = &current->lazy_mmu_state;
 
-	if (in_interrupt())
+	if (!arch_wants_lazy_mmu_mode() || in_interrupt())
 		return;
 
 	VM_WARN_ON(state->count == 0 || state->enabled);
-- 
2.47.0


