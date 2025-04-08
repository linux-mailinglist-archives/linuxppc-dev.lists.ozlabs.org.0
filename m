Return-Path: <linuxppc-dev+bounces-7536-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 242F4A7FA70
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 11:55:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZX1dV1qL8z30Vb;
	Tue,  8 Apr 2025 19:54:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744106078;
	cv=none; b=CP0M9BA08rC47+K46P5SOFW2b6wvS3Up+saXSs9uaCPHz0LCusGsd33rFdrxbyyxXXjpRfWWBfaGOsJngBxY7z3OF/d/qepf9i1fP9rukOfJHFk1f3lstl2T+Jz+6QhPv5l1+mLglB/+GNd+R4gFWjw3q7z8t5PwcvPVCdGLPyBocHWoo8as894fgoa75/PDh/DVHgDmZQB3L68mqtcFqPhGYtSd9QgYbcU7hBl0EFo47abvNaDthNrks5WzKUef9mFmI+zv5X8gEPZCrHuui3w82c7v4ef0ESYAnR8lfCi5hsoSwf3wN5UDJuFrUjZNfT3GjcFqvPqfaM8tpwYNvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744106078; c=relaxed/relaxed;
	bh=08E//Tnzm4Otbmgjv5PkMZzFPCICf9ItkLK9Ykz94vQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eATSxwW7eN/H1wP2o04h752QmlNdhJ04EBj0LKi9YVacg69wETfyW8s7jVXZQN4wwsdnAWd2NG05LOeod04OqRZdZE7Qm+Eo7tUG62G8TB46yOlzwnfCJrrc1vc2IEm572fQNZY7/cipoqcdw6EnlGTzBzXC/6Sq2oIU4n4BswXsT75EQxpd7RR6E8VQmklsFNVT04tQV+w8wSd9gfte6AZoz+wr0p6K1CpOi1waSeRCWL9ShXWt+I9Fgb4534vUylEub1fwynTSOGL7tWPl8xRmQzyJgT0WUWNnD8MTKpfl3c/yqiyJNXne2QlUlMlXw1TleC4plB0QIzX0HAx2lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZX1dT5M1vz300B
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 19:54:37 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C22912308;
	Tue,  8 Apr 2025 02:54:07 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8289A3F6A8;
	Tue,  8 Apr 2025 02:54:02 -0700 (PDT)
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
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 12/12] riscv: mm: Call PUD/P4D ctor in special kernel pgtable alloc
Date: Tue,  8 Apr 2025 10:52:22 +0100
Message-ID: <20250408095222.860601-13-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250408095222.860601-1-kevin.brodsky@arm.com>
References: <20250408095222.860601-1-kevin.brodsky@arm.com>
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

Constructors for PUD/P4D-level pgtables were recently introduced.
They should be called for all pgtables; make sure they are called
for special kernel mappings created by create_pgd_mapping() too.

While at it also switch to using pagetable_alloc() like
in alloc_{pte,pmd}_late().

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/riscv/mm/init.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 59a982f88908..8d0374d7ce8e 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -590,11 +590,11 @@ static phys_addr_t __init alloc_pud_fixmap(uintptr_t va)
 
 static phys_addr_t __meminit alloc_pud_late(uintptr_t va)
 {
-	unsigned long vaddr;
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
 
-	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr);
-	return __pa(vaddr);
+	BUG_ON(!ptdesc);
+	pagetable_pud_ctor(ptdesc);
+	return __pa((pud_t *)ptdesc_address(ptdesc));
 }
 
 static p4d_t *__init get_p4d_virt_early(phys_addr_t pa)
@@ -628,11 +628,11 @@ static phys_addr_t __init alloc_p4d_fixmap(uintptr_t va)
 
 static phys_addr_t __meminit alloc_p4d_late(uintptr_t va)
 {
-	unsigned long vaddr;
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
 
-	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr);
-	return __pa(vaddr);
+	BUG_ON(!ptdesc);
+	pagetable_p4d_ctor(ptdesc);
+	return __pa((p4d_t *)ptdesc_address(ptdesc));
 }
 
 static void __meminit create_pud_mapping(pud_t *pudp, uintptr_t va, phys_addr_t pa, phys_addr_t sz,
-- 
2.47.0


