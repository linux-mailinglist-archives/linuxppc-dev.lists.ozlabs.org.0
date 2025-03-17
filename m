Return-Path: <linuxppc-dev+bounces-7105-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2957A6412A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 07:19:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGPv75kVzz2yGM;
	Mon, 17 Mar 2025 17:19:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742192355;
	cv=none; b=Bz78A8xc8CjYsd6I8apvSoWPErlFd1U/ZDAfiprbucd122t2Nd13V/ptq2iYgL6kd70S1Zfw6lbKFStg0IZS1RGOtNlNfJVsKBhaJU7f9AsRw+d8SDvUcMyQ9Qt7vYdo/2c/hAEtKRSgo5j2vifpyhLDXx+69ZrIHdSvrtsE5nCF3NiRI+KZpiTZQ7ltuoMiYhwV44IfQvQdJ1kY6ax08zQ7Cq7mNPQS/DYLuWTTnSBpzheWbxHRlg1BPhG/5xKwAiidsPr4n8qFyaWTDItJ5d/p3D+32Hi3SZLLDzXdu9Hg3oIUU2vFX0Ae3ZCYiYazhl+TsHs11CVVsdo0sQ0BYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742192355; c=relaxed/relaxed;
	bh=MmDSfCWD9WhoSWlQWr2gV1apY67d6RtH3rSTiz+c+dc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CUPuSGUOFFuPgfi1dWYn2fEfvRkeXudlP8wAMPYh5LxNWguJ1fBg3PwLaH1p7oANzLGwgLwis5mH4IsrH/qZokIu6C2wi1S9IZo6OsAGpcPvB3jFz7iNy8o4QfuAbt3kMobdfXciXLR26c7d9qDX3QXs3NIAua1CmnnNItH0s3vwugYFm0cQO4FK6nNkns+X3kjcvwm4ywXN9v81mQHx3EtgfJq1o4TK/0+7ocEiw2p8ApnB4qqVqYXC6Zbnxpqqlk3XhiUS1l8wC7IpGBE1l+HH41J/KH5HukDY/DCXjbQ7hITza3EU2kQVUIKfnH3nDLYHJcEVFoxDsRkD3fLDYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGPv71M72z2ygD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 17:19:15 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FFCB1BF3;
	Sun, 16 Mar 2025 23:18:53 -0700 (PDT)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.16.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8DC983F673;
	Sun, 16 Mar 2025 23:18:37 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 2/2] arm64/ptdump: Replace u64 with pteval_t
Date: Mon, 17 Mar 2025 11:48:18 +0530
Message-Id: <20250317061818.16244-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250317061818.16244-1-anshuman.khandual@arm.com>
References: <20250317061818.16244-1-anshuman.khandual@arm.com>
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

Page table entry's value, mask and protection are represented with pteval_t
data type format not u64 that has been assumed while dumping the page table
entries. Replace all such u64 instances with pteval_t instead as required.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/ptdump.h | 8 ++++----
 arch/arm64/mm/ptdump.c          | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
index e5da9ce8a515..476a870489b9 100644
--- a/arch/arm64/include/asm/ptdump.h
+++ b/arch/arm64/include/asm/ptdump.h
@@ -24,8 +24,8 @@ struct ptdump_info {
 };
 
 struct ptdump_prot_bits {
-	u64		mask;
-	u64		val;
+	pteval_t	mask;
+	pteval_t	val;
 	const char	*set;
 	const char	*clear;
 };
@@ -34,7 +34,7 @@ struct ptdump_pg_level {
 	const struct ptdump_prot_bits *bits;
 	char name[4];
 	int num;
-	u64 mask;
+	pteval_t mask;
 };
 
 /*
@@ -51,7 +51,7 @@ struct ptdump_pg_state {
 	const struct mm_struct *mm;
 	unsigned long start_address;
 	int level;
-	u64 current_prot;
+	pteval_t current_prot;
 	bool check_wx;
 	unsigned long wx_pages;
 	unsigned long uxn_pages;
diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index fd1610b4fd15..a5651be95868 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -194,7 +194,7 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
 	struct ptdump_pg_state *st = container_of(pt_st, struct ptdump_pg_state, ptdump);
 	struct ptdump_pg_level *pg_level = st->pg_level;
 	static const char units[] = "KMGTPE";
-	u64 prot = 0;
+	pteval_t prot = 0;
 
 	/* check if the current level has been folded dynamically */
 	if (st->mm && ((level == 1 && mm_p4d_folded(st->mm)) ||
-- 
2.25.1


