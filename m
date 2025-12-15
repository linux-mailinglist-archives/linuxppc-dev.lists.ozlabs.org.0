Return-Path: <linuxppc-dev+bounces-14771-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A09EBCBE7D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Dec 2025 16:05:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVNds6Khpz2ytx;
	Tue, 16 Dec 2025 02:05:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765811105;
	cv=none; b=QYYEEcHNjbNndEtkEnJ0qYMtJwPuTuO0o1Jzyd62p/ul50a0NNtEPK5md+ieN7SOvLC/CwHkNhHYz0LGfB6KMWoBZvVKSmTwMVOUnL91K9OJJvAIW4JjNGW7UsvLCJ8fwvtR7amyFAhiDRJB3tpDZ8CoLi6Xkf30PjOgQT2XhuuNrdn5pnjAeq8a/0QtOGHpgWUie03/irAfiJ2btFb/OztWUHoELLDCgx/EIQmLOp8gTZfqZMPxp8pZrFvp6xu2ox3L8707D76zYbztcOBQVYxbkIsnjK79vErARYaZFw9+w0+5XVpJfj/Dnzc5N+O2Kq+gcsV+PbgQ46NCaj3KkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765811105; c=relaxed/relaxed;
	bh=DVndtn13GZjkQXq4nJ2Yz56uyt5Z2O0y34NnRlu1iqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QxPFBwq8Yw4zE7p6zEGHbvfCwzlgQP5frrWN+JxjAK39kOlXEZfbMWyhZCN27xmWjO5gQUCxt+GoiJtYiPj2DSWTi8K+kaxJWN6CtixOetWVXPuzxI0Ib/D4JaJe9IcNrU68n/RUPWQRGUnd9Ur4P2rNBRCe+ekgZuT21aTzg+RBojHlEKQ6he0WAZq/r2AZ7oG+VHgDdyV3cvHdOCfb7+/YYfw+A+TVYgkfNI5aLZyZg5DGOQa5C5vSh2yU7xifgdX8X5atzfPtLXqbe9YowinNxqJw8/0HrOe/g2QBZvJ5FNz5qph8PYeI/ypJnpWRtFpEx22iLWZi2wsGi6JpVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVNds0MWvz2yFd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 02:05:05 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB8BF169E;
	Mon, 15 Dec 2025 07:04:26 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E8EC3F73B;
	Mon, 15 Dec 2025 07:04:28 -0800 (PST)
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
Subject: [PATCH v6 10/14] arm64: mm: replace TIF_LAZY_MMU with is_lazy_mmu_mode_active()
Date: Mon, 15 Dec 2025 15:03:19 +0000
Message-ID: <20251215150323.2218608-11-kevin.brodsky@arm.com>
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

The generic lazy_mmu layer now tracks whether a task is in lazy MMU
mode. As a result we no longer need a TIF flag for that purpose -
let's use the new is_lazy_mmu_mode_active() helper instead.

The explicit check for in_interrupt() is no longer necessary either
as is_lazy_mmu_mode_active() always returns false in interrupt
context.

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/pgtable.h     | 19 +++----------------
 arch/arm64/include/asm/thread_info.h |  3 +--
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 7f528c36d53c..445e18e92221 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -62,28 +62,16 @@ static inline void emit_pte_barriers(void)
 
 static inline void queue_pte_barriers(void)
 {
-	unsigned long flags;
-
-	if (in_interrupt()) {
-		emit_pte_barriers();
-		return;
-	}
-
-	flags = read_thread_flags();
-
-	if (flags & BIT(TIF_LAZY_MMU)) {
+	if (is_lazy_mmu_mode_active()) {
 		/* Avoid the atomic op if already set. */
-		if (!(flags & BIT(TIF_LAZY_MMU_PENDING)))
+		if (!test_thread_flag(TIF_LAZY_MMU_PENDING))
 			set_thread_flag(TIF_LAZY_MMU_PENDING);
 	} else {
 		emit_pte_barriers();
 	}
 }
 
-static inline void arch_enter_lazy_mmu_mode(void)
-{
-	set_thread_flag(TIF_LAZY_MMU);
-}
+static inline void arch_enter_lazy_mmu_mode(void) {}
 
 static inline void arch_flush_lazy_mmu_mode(void)
 {
@@ -94,7 +82,6 @@ static inline void arch_flush_lazy_mmu_mode(void)
 static inline void arch_leave_lazy_mmu_mode(void)
 {
 	arch_flush_lazy_mmu_mode();
-	clear_thread_flag(TIF_LAZY_MMU);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index a803b887b0b4..e7cd017b07c8 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -84,8 +84,7 @@ void arch_setup_new_exec(void);
 #define TIF_SME_VL_INHERIT	28	/* Inherit SME vl_onexec across exec */
 #define TIF_KERNEL_FPSTATE	29	/* Task is in a kernel mode FPSIMD section */
 #define TIF_TSC_SIGSEGV		30	/* SIGSEGV on counter-timer access */
-#define TIF_LAZY_MMU		31	/* Task in lazy mmu mode */
-#define TIF_LAZY_MMU_PENDING	32	/* Ops pending for lazy mmu mode exit */
+#define TIF_LAZY_MMU_PENDING	31	/* Ops pending for lazy mmu mode exit */
 
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
-- 
2.51.2


