Return-Path: <linuxppc-dev+bounces-9038-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44138AC9116
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 16:06:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b84lm4skqz2yfx;
	Sat, 31 May 2025 00:06:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748613972;
	cv=none; b=DtE3r14pF04UUx/DFzdp5XCiblYaGJYSqi/+l+60g6gT712dQ/UqfhP3YQptXiABV5ZTMCNcZIXGZeoxj6S5Tp+ztPG0EWvTB2+vAZ8GoT+KML+C9rQ7R2TAgDBKY/GV3IvG3wLMk40Nci93BdgfIkoe3Iwnu+RnVTIjsQDI+ZvyxeQSQ4Bg0XXOzvGz0qLMygj0EyW7xwtGgfXPio1h6TweDXl4MaKcI64lQAwtR49uxbYc+oIDy6IIyOFxKCqgH9UIU+t6DOxS0C7IG0xcj9j7eX3vBF58DanWE5LoaBixYgS50V27JkMwYmgfdnBTF0dtHCPf5I2SrlasFHEYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748613972; c=relaxed/relaxed;
	bh=7eGTseOzNJr05Fj1yEUAb0RalC6UtR410oEZsPPsDSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BHcqyWzhwxFnnqcCeUqa2LRUcDfWmfBrB1Ulld51z8SotYcgRntB7vgbuM6DKMLsFYMgGi6i0EDPOpad9QAfKuJHLEFKi/4ZqENOJMxp9yTcYKSEF6sXteQTUKEDFeWwkfK1OH14eEmlELaOz2+YlhZucBjKgZ7A5VytZw8MuoHM6ZqeRM2CQ/kVgUjkYYHWGH0GMG49xR9aoinILlOcwgBBGYRO4cNfE0CIfrVFxMNUpF3Cw7nU3HsjHYo1z/7UAqRh7g26zk1UY0eU+ChG/NU7k5mhJyNbYSVUsPaD0RtgyoYGKvzEbezzZ5MC39UPoFac7Hd1TkoxVUZDa1rCcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b84lm04CDz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 May 2025 00:06:12 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8076E26AC;
	Fri, 30 May 2025 07:05:20 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAB693F673;
	Fri, 30 May 2025 07:05:31 -0700 (PDT)
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
Subject: [RFC PATCH v1 6/6] Revert "arm64/mm: Permit lazy_mmu_mode to be nested"
Date: Fri, 30 May 2025 15:04:44 +0100
Message-ID: <20250530140446.2387131-7-ryan.roberts@arm.com>
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

Commit 491344301b25 ("arm64/mm: Permit lazy_mmu_mode to be nested") made
the arm64 implementation of lazy_mmu_mode tolerant to nesting. But
subsequent commits have fixed the core code to ensure that lazy_mmu_mode
never gets nested (as originally intended). Therefore we can revert this
commit and reinstate the VM_WARN() if nesting is detected in future.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index add75dee49f5..dcf0adbeb803 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -83,21 +83,11 @@ static inline void queue_pte_barriers(void)
 #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
 static inline void arch_enter_lazy_mmu_mode(void)
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
-
 	if (in_interrupt())
 		return;
 
+	VM_WARN_ON(test_thread_flag(TIF_LAZY_MMU));
+
 	set_thread_flag(TIF_LAZY_MMU);
 }
 
-- 
2.43.0


