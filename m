Return-Path: <linuxppc-dev+bounces-11871-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D57E6B485CE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 09:41:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cKzRT4qQyz306d;
	Mon,  8 Sep 2025 17:41:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757317301;
	cv=none; b=jhz558wpqDzClUNykP8aOYMKSanOmG5OcbUBZNVJ04/ZEC5AeP6G5TuKQ8HJyvuyEbmtfnixjKkCdw7cViiA/PSMzOSWD8qR0wJcgi86lSyva4V+gT+aaY8eKd3NmMur2h0KqtqfjyYJGJLwfvYgfjgq37HnU++rZ+57Fbm73gtn5WCU9knnScyk0k2IvfNZ8Q3p70TwXmfm+YGSGcMQhHFttGMi4S3qwO9s79dkgBqDeaKBX+49EglwmU+8wZg7S+AGoz4YbufWMxS7G18tfnUmTxE2McS1qEVuwdebTYojOlDvY4N05vH6+igU+fFLl18FC6IwxB6+rO8PznSjqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757317301; c=relaxed/relaxed;
	bh=46V8/3D4h6GmtbNpT0VfZMpez9sqUl6d0gc+rk27e8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aSUOc9mBp7CjyFgbHyIRlxNNSF9iIoaXLCNSqTbwy3KH1z9Dt3di917/66I1yu7Q0HNHfASt9PQ24hgrFXm9/jC8cKDJwnPgAZLAHfSrs6Q9zphGzPDY58oXbR50BavMkUp8WpzuxceoKVhUjmD8/GypIDTMiOoIKdAwDiOJIecUrDbru0cw9qaPMPg8qVz8qdqhBiNf9UZ3xRTDM26KQm2AeRjOCrWlanPK3pD90dmbYNX2RZPtDjCvIYNUknPGLR6THZQD0rV3vfZ/zXw4Ckd8sMEzFq2bdFUDCn0fmcGPeScnrFXmfZw6NJ4/A2V7L2ePyMaXlUdwPqkJbB0RYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cKzRT1Wr0z2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 17:41:41 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A58261692;
	Mon,  8 Sep 2025 00:41:00 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5128D3F63F;
	Mon,  8 Sep 2025 00:41:04 -0700 (PDT)
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
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 7/7] mm: update lazy_mmu documentation
Date: Mon,  8 Sep 2025 08:39:31 +0100
Message-ID: <20250908073931.4159362-8-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250908073931.4159362-1-kevin.brodsky@arm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
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

We now support nested lazy_mmu sections on all architectures
implementing the API. Update the API comment accordingly.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/pgtable.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index df0eb898b3fc..85cd1fdb914f 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -228,8 +228,18 @@ static inline int pmd_dirty(pmd_t pmd)
  * of the lazy mode. So the implementation must assume preemption may be enabled
  * and cpu migration is possible; it must take steps to be robust against this.
  * (In practice, for user PTE updates, the appropriate page table lock(s) are
- * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
- * and the mode cannot be used in interrupt context.
+ * held, but for kernel PTE updates, no lock is held). The mode cannot be used
+ * in interrupt context.
+ *
+ * Calls may be nested: an arch_{enter,leave}_lazy_mmu_mode() pair may be called
+ * while the lazy MMU mode has already been enabled. An implementation should
+ * handle this using the state returned by enter() and taken by the matching
+ * leave() call; the LAZY_MMU_{DEFAULT,NESTED} flags can be used to indicate
+ * whether this enter/leave pair is nested inside another or not. (It is up to
+ * the implementation to track whether the lazy MMU mode is enabled at any point
+ * in time.) The expectation is that leave() will flush any batched state
+ * unconditionally, but only leave the lazy MMU mode if the passed state is not
+ * LAZY_MMU_NESTED.
  */
 #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
 typedef int lazy_mmu_state_t;
-- 
2.47.0


