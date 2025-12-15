Return-Path: <linuxppc-dev+bounces-14769-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B00CBE7CB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Dec 2025 16:05:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVNdf3h7Gz2yqW;
	Tue, 16 Dec 2025 02:04:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765811094;
	cv=none; b=G85sYyojCJ1roN253/NTN+liGkGP1NXjGCTWwh89HTrBST8dJKaqbQfpYvTwyioMuoq6kU+JZ4r4e2nIVZJxgLWxSko1tQ9W5zaDg5EUlDYkVjb8hSWQEN8eR4Tf3OUlS/8pgrvJoPlzhtUbzIFlExyp2hvILxIK0yA/oqbyOYOuWNAzJ0eqD3YaScyrkpCcemP15GzcbFCcVV0KaDb+g4XOtFr3KvLG3xUK1LPzaWyWUOuN8hArdsebS303qy8P3YlMe+h3L6Mg539M4oJwuV5JrU00wuBrZGXxHLfHJEmEfrLZyFy8aa26giclE2+h+fwZ6kjidS1ahQJQx1rbXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765811094; c=relaxed/relaxed;
	bh=FwPCDeKwwbwQlMyHR9dxpUzK/M4F6kWCHoFMIjV0Jb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qulx1WPuqw0EtPFX//JrDLnMr3ouqkq5b/r2nvLi7a8mWK7TK4zsldHPr3LPO1AC4l+2fQeZjjI/QTlFgzszQ0wldkDfCGNZ5AG+ByQb5GuYN933IS9O+qCk8hLXicPM7gN/3CVjWlMNymsAfTYNLgsPgWNTOysmrVIAo1+7Qg9zFK44nZMqot8b9rxamEoj/5c4qT6iEGt1kbmlfDQfmE22KeJvuMCNvHraNpbRV+OMKTeNjC4uJkiAdTRKOAP6h+OcDlIobgdhcgDrE9rEPrvZsCbrQDlGPsKL6pf7o8k24loyDl9M1q7bb7ILWOl3/AQfnaEmxD1CxwZdts66Wg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVNdd4nCXz2yqF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 02:04:53 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52004497;
	Mon, 15 Dec 2025 07:04:15 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 134D63F73B;
	Mon, 15 Dec 2025 07:04:16 -0800 (PST)
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
	x86@kernel.org,
	"David Hildenbrand (Red Hat)" <david@kernel.org>
Subject: [PATCH v6 08/14] mm: bail out of lazy_mmu_mode_* in interrupt context
Date: Mon, 15 Dec 2025 15:03:17 +0000
Message-ID: <20251215150323.2218608-9-kevin.brodsky@arm.com>
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

The lazy MMU mode cannot be used in interrupt context. This is
documented in <linux/pgtable.h>, but isn't consistently handled
across architectures.

arm64 ensures that calls to lazy_mmu_mode_* have no effect in
interrupt context, because such calls do occur in certain
configurations - see commit b81c688426a9 ("arm64/mm: Disable barrier
batching in interrupt contexts"). Other architectures do not check
this situation, most likely because it hasn't occurred so far.

Let's handle this in the new generic lazy_mmu layer, in the same
fashion as arm64: bail out of lazy_mmu_mode_* if in_interrupt().
Also remove the arm64 handling that is now redundant.

Both arm64 and x86/Xen also ensure that any lazy MMU optimisation is
disabled while in interrupt (see queue_pte_barriers() and
xen_get_lazy_mode() respectively). This will be handled in the
generic layer in a subsequent patch.

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/pgtable.h |  9 ---------
 include/linux/pgtable.h          | 17 ++++++++++++++++-
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index f7d66c261347..bf9178902bdb 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -94,26 +94,17 @@ static inline void arch_enter_lazy_mmu_mode(void)
 	 * keeps tracking simple.
 	 */
 
-	if (in_interrupt())
-		return;
-
 	set_thread_flag(TIF_LAZY_MMU);
 }
 
 static inline void arch_flush_lazy_mmu_mode(void)
 {
-	if (in_interrupt())
-		return;
-
 	if (test_and_clear_thread_flag(TIF_LAZY_MMU_PENDING))
 		emit_pte_barriers();
 }
 
 static inline void arch_leave_lazy_mmu_mode(void)
 {
-	if (in_interrupt())
-		return;
-
 	arch_flush_lazy_mmu_mode();
 	clear_thread_flag(TIF_LAZY_MMU);
 }
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 116a18b7916c..dddde6873d1e 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -233,26 +233,41 @@ static inline int pmd_dirty(pmd_t pmd)
  * preemption, as a consequence generic code may not sleep while the lazy MMU
  * mode is active.
  *
- * Nesting is not permitted and the mode cannot be used in interrupt context.
+ * The mode is disabled in interrupt context and calls to the lazy_mmu API have
+ * no effect.
+ *
+ * Nesting is not permitted.
  */
 #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
 static inline void lazy_mmu_mode_enable(void)
 {
+	if (in_interrupt())
+		return;
+
 	arch_enter_lazy_mmu_mode();
 }
 
 static inline void lazy_mmu_mode_disable(void)
 {
+	if (in_interrupt())
+		return;
+
 	arch_leave_lazy_mmu_mode();
 }
 
 static inline void lazy_mmu_mode_pause(void)
 {
+	if (in_interrupt())
+		return;
+
 	arch_leave_lazy_mmu_mode();
 }
 
 static inline void lazy_mmu_mode_resume(void)
 {
+	if (in_interrupt())
+		return;
+
 	arch_enter_lazy_mmu_mode();
 }
 #else
-- 
2.51.2


