Return-Path: <linuxppc-dev+bounces-12883-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8249DBDD653
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 10:28:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmkkC3t6Pz3cl3;
	Wed, 15 Oct 2025 19:28:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760516899;
	cv=none; b=nXDN0jBUHlTac9g0mGgDXgnT6SQ79oPMusVOQc9JMqstrJACf+TIZb1PTUs3O0T9igvChDePhJxJXLwDsRH0+Ortb2KPgbIH9U87vLJX4Dgx9WBFX9UsiPBJ6gofMrnnoKUemLlZVVVu22JU8+VxvQXf3iCPxAWvbsL2UUzMKHzycdsLpVll5chuYFAyXAQNZ39y7xpFjIKY0YO6JFQJASztc5nfrQH0+6bI7q9ap9BC6Cqf9psA5kqrn+TffwOa9l0HR448qkBZBM8w80hUqUN+V5TpkxUgxQHJ8bba7fYxaZTakWiqAys5IIvgD039JEcE2K/t6VoJq/S1unHr/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760516899; c=relaxed/relaxed;
	bh=I83fbc1i6YBh9Tx5vcIae/Zyg2QUUX+f5uI4Ym14wuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dAYwD/hpzk6pkyF+yjxIY36bpswH5xfaIyKJWM7+4i6Up8jfwA6sG4+BD82hBpOrROfQWGl+JXRLnNBUbs6oeECZN4uaYVag/ys+jUX1dDsxB3CXKRJ3UaF0hSs1oq/zGH0RRGskNy/u4mXwboecFuXskD01mPQ3F2reACKabowNx9PvPojiaQPcjewYk612Wx/juTMFbVO0rddTPMYlt8BGsTDYSUR/cCnjrt6vEtE3r/22EWGYLxBfR1Z+4Rl5myWj0aNWk4KlkFQFWCysB6js+Jx4kxocY6LubVWGvqIVhy2ptG7e2xhBU6A0UWb0owJJt4/McYRB9O2zAWyYuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmkkB6KTzz3chZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 19:28:18 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE70F1A9A;
	Wed, 15 Oct 2025 01:27:39 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB26A3F66E;
	Wed, 15 Oct 2025 01:27:42 -0700 (PDT)
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
Subject: [PATCH v3 01/13] powerpc/64s: Do not re-activate batched TLB flush
Date: Wed, 15 Oct 2025 09:27:15 +0100
Message-ID: <20251015082727.2395128-2-kevin.brodsky@arm.com>
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

From: Alexander Gordeev <agordeev@linux.ibm.com>

Since commit b9ef323ea168 ("powerpc/64s: Disable preemption in hash
lazy mmu mode") a task can not be preempted while in lazy MMU mode.
Therefore, the batch re-activation code is never called, so remove it.

Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
This patch was originally posted as part of [1]; the series was not
taken but this patch remains relevant.

[1] https://lore.kernel.org/all/cover.1749747752.git.agordeev@linux.ibm.com/
---
 arch/powerpc/include/asm/thread_info.h |  2 --
 arch/powerpc/kernel/process.c          | 25 -------------------------
 2 files changed, 27 deletions(-)

diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index b0f200aba2b3..97f35f9b1a96 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -154,12 +154,10 @@ void arch_setup_new_exec(void);
 /* Don't move TLF_NAPPING without adjusting the code in entry_32.S */
 #define TLF_NAPPING		0	/* idle thread enabled NAP mode */
 #define TLF_SLEEPING		1	/* suspend code enabled SLEEP mode */
-#define TLF_LAZY_MMU		3	/* tlb_batch is active */
 #define TLF_RUNLATCH		4	/* Is the runlatch enabled? */
 
 #define _TLF_NAPPING		(1 << TLF_NAPPING)
 #define _TLF_SLEEPING		(1 << TLF_SLEEPING)
-#define _TLF_LAZY_MMU		(1 << TLF_LAZY_MMU)
 #define _TLF_RUNLATCH		(1 << TLF_RUNLATCH)
 
 #ifndef __ASSEMBLER__
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index eb23966ac0a9..9237dcbeee4a 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1281,9 +1281,6 @@ struct task_struct *__switch_to(struct task_struct *prev,
 {
 	struct thread_struct *new_thread, *old_thread;
 	struct task_struct *last;
-#ifdef CONFIG_PPC_64S_HASH_MMU
-	struct ppc64_tlb_batch *batch;
-#endif
 
 	new_thread = &new->thread;
 	old_thread = &current->thread;
@@ -1291,14 +1288,6 @@ struct task_struct *__switch_to(struct task_struct *prev,
 	WARN_ON(!irqs_disabled());
 
 #ifdef CONFIG_PPC_64S_HASH_MMU
-	batch = this_cpu_ptr(&ppc64_tlb_batch);
-	if (batch->active) {
-		current_thread_info()->local_flags |= _TLF_LAZY_MMU;
-		if (batch->index)
-			__flush_tlb_pending(batch);
-		batch->active = 0;
-	}
-
 	/*
 	 * On POWER9 the copy-paste buffer can only paste into
 	 * foreign real addresses, so unprivileged processes can not
@@ -1369,20 +1358,6 @@ struct task_struct *__switch_to(struct task_struct *prev,
 	 */
 
 #ifdef CONFIG_PPC_BOOK3S_64
-#ifdef CONFIG_PPC_64S_HASH_MMU
-	/*
-	 * This applies to a process that was context switched while inside
-	 * arch_enter_lazy_mmu_mode(), to re-activate the batch that was
-	 * deactivated above, before _switch(). This will never be the case
-	 * for new tasks.
-	 */
-	if (current_thread_info()->local_flags & _TLF_LAZY_MMU) {
-		current_thread_info()->local_flags &= ~_TLF_LAZY_MMU;
-		batch = this_cpu_ptr(&ppc64_tlb_batch);
-		batch->active = 1;
-	}
-#endif
-
 	/*
 	 * Math facilities are masked out of the child MSR in copy_thread.
 	 * A new task does not need to restore_math because it will
-- 
2.47.0


