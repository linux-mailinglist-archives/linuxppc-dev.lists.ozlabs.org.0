Return-Path: <linuxppc-dev+bounces-7141-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A5BA65308
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 15:22:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGcct0bFDz2yr3;
	Tue, 18 Mar 2025 01:22:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742221357;
	cv=none; b=T4XM+tcc5Yiyb7KpH2nh3QLDpQnZg5kHOYZs8TDU0U+ykNB60u3Ch5j6RarCQUWRdkhCngVNRiFYxoRMIPJrOVBaSibvM2wKakD7yii8Wzr0VvsXebQmucCgRAfkpJeoCzCmRdussw2EM5F6ipvT7l13UnP6pzaKB7xBW6CqSG+JBlIOVB04H1gZdZG167nzwSuOJWvIt3qdu83H39wL6R3pnkS0ePNIFsYl543ExoqS5EGxkbf7CUA9Y8VISKx7anm0GiANwZJz8cxwRza7HOhPtxujTu2cGq3L7p3L8tfiejb5BRDlNeEJzWbqGYezkCb9thde/omcZRcOvLUCJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742221357; c=relaxed/relaxed;
	bh=Fo5GoDaPm0gIjYVqCGzA2mr+USoIG153jiLEzNpCVDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NOs95sy0gC/ohds2XIPabt4/5q4gUdcXYKjETi5EaspIIPCzdWTWmJyg9chSxUSXvwcjHCifWqCQ/UQgmpluY40z6/fO77fB8EuyNfHW4mq8xZTNrz2jAvSP6/ho+/Gm9yzov28cPpYmeTgAv3yzT34iZPnOlVdkEpy6ctiEab+JUnViXu3hBL4LIUFriY0DXLWh//Y6Eji8/LXWZXsRvxmBGTT44uvKP8MgYjgApgurXAWAdQ3XYXfN1BxJcydPSo4gnfy3pc0+kK7OlVketTU3ajcy8zuI74jm7HydZPzJST3scTK/Z9h+vewpzEixNmfSCRcCk8fEiwrYV4M1yA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGccr6kBKz2ySB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 01:22:36 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24CC326BE;
	Mon, 17 Mar 2025 07:22:07 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F102B3F63F;
	Mon, 17 Mar 2025 07:21:53 -0700 (PDT)
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
Subject: [PATCH 06/11] mm: Skip ptlock_init() for kernel PMDs
Date: Mon, 17 Mar 2025 14:16:55 +0000
Message-ID: <20250317141700.3701581-7-kevin.brodsky@arm.com>
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

Split page table locks are not used for pgtables associated to
init_mm, at any level. pte_alloc_kernel() does not call
ptlock_init() as a result. There is however no separate alloc/free
functions for kernel PMDs, and pmd_ptlock_init() is called
unconditionally. When ALLOC_SPLIT_PTLOCKS is true (e.g. 32-bit
architectures or if CONFIG_PREEMPT_RT is selected), this results in
unnecessary dynamic memory allocation every time a kernel PMD is
allocated.

Now that pagetable_pmd_ctor() is passed the associated mm, we can
easily remove this overhead by skipping pmd_ptlock_init() if the
pgtable is associated to init_mm. No special-casing is needed on the
dtor path, as ptlock_free() is already called unconditionally for
all levels. (ptlock_free() is a no-op unless a ptlock was allocated
for the given PTP.)

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ee31ffd7ead2..4759da9cd633 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3125,7 +3125,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 static inline bool pagetable_pmd_ctor(struct mm_struct *mm,
 				      struct ptdesc *ptdesc)
 {
-	if (!pmd_ptlock_init(ptdesc))
+	if (mm != &init_mm && !pmd_ptlock_init(ptdesc))
 		return false;
 	ptdesc_pmd_pts_init(ptdesc);
 	__pagetable_ctor(ptdesc);
-- 
2.47.0


