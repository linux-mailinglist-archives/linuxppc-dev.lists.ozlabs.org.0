Return-Path: <linuxppc-dev+bounces-7138-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0F0A652FE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 15:22:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGccR66lBz2yqr;
	Tue, 18 Mar 2025 01:22:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742221335;
	cv=none; b=UwOuLQGk7sUBA0s5YMREwOGlrSMMKIyOCCM5HYh+XXwrWaUHe2HxVTgDRs0zt5D+GFGFsmZJGXwQ1odrVFMbdYAr8Uv+EFv+85sZYPlKGoFnonlxbNQry1BcuZj9GPAehgao688/dv6JZwkBJLRG6YdgjLiJRctyNptiVVc8MUYmGXRCuE6k5GIi1RR5tUvY8lB4B0GFf7uqQfL4Wcslz8JzR3c8PrxRtItdf6anVM0lYN5PQm9MgcTA72C53KCLOdn3GKn8tTwzLBaPq4T94ISZYewMbh3wE0bXBnkgc5kHb0+SuzgdvNy5V0rYK7i20dkfN/lpRr9wqr6Ze4kmPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742221335; c=relaxed/relaxed;
	bh=tEBbZMuK7OXxaJSao4EKWfZ44UXf7uN/ZmWU7nnmgv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvb7nJzckDMy/uUyy16/8mqVSY0bMzVKnHlVC5Qc9Ux894KNUiMFMhzMWxgwbjk3yVLgxcMeSidO1eVkeieL8ZRD8RkAFu8H6U3v7qTYXpKhazXhGwf2z8gzrbheZOciB1WBN68aqUptwMwKjIl/2YuruRKVHeJeuFwq2lj3qDPTLMjZDDi1fGXf2ZWBhehfeUwWDDJchZQLVZ4MLPHOhGlO2URcJf9dLZYu+U1KEnh0ERXXbApM1Y6lRT0cB4FKacDiVbUKoR8cMpscHoQ20IPmR6BCy+L0TrLxyHYu91vF+DYipIlbvMTkScYvrUHVSju3GEvr9B47kl/EAf8nsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGccR39MDz2ySB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 01:22:15 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67A932573;
	Mon, 17 Mar 2025 07:21:53 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FEA43F63F;
	Mon, 17 Mar 2025 07:21:40 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org
Subject: [PATCH 03/11] m68k: mm: Call ctor/dtor for kernel PTEs
Date: Mon, 17 Mar 2025 14:16:52 +0000
Message-ID: <20250317141700.3701581-4-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250317141700.3701581-1-kevin.brodsky@arm.com>
References: <20250317141700.3701581-1-kevin.brodsky@arm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The generic implementation of pte_{alloc_one,free}_kernel now calls
the [cd]tor. Align the m68k/ColdFire implementation of those
functions by calling the [cd]tor explicitly.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/m68k/include/asm/mcf_pgalloc.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/mcf_pgalloc.h b/arch/m68k/include/asm/mcf_pgalloc.h
index 465a71101b7d..fc5454d37da3 100644
--- a/arch/m68k/include/asm/mcf_pgalloc.h
+++ b/arch/m68k/include/asm/mcf_pgalloc.h
@@ -7,7 +7,7 @@
 
 static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
 {
-	pagetable_free(virt_to_ptdesc(pte));
+	pagetable_dtor_free(virt_to_ptdesc(pte));
 }
 
 extern const char bad_pmd_string[];
@@ -19,6 +19,10 @@ static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 
 	if (!ptdesc)
 		return NULL;
+	if (!pagetable_pte_ctor(mm, ptdesc)) {
+		pagetable_free(ptdesc);
+		return NULL;
+	}
 
 	return ptdesc_address(ptdesc);
 }
-- 
2.47.0


