Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BB5A5AC4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 17:47:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MZGY0Z0nzDqP2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 01:47:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZWpt45w7"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MYxT190DzDqcw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 01:32:38 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id gn20so6715163plb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Sep 2019 08:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aePqf3cR9ZLztw0DXP+i/Rb70qzyDNY65JdTCD9MzPg=;
 b=ZWpt45w7NPa3Y0Sj3UbtnPWdy8NKhdNCVwY7lAk3qpQqh32qENGMsro05JRNjv4Gj3
 7AHOTR9HW8u0HVVq6mYILBeIodSZ6Xr8N1efYvB9ddJmscyO2CO5yjjBwt7XE+Q2pmZf
 AFevUZL/YY6uZA56nLWsnOHUd/6Fq03Gjl1wnfCkTkdICL77MDIXk9zjl6tPyADu7wCL
 ML0Z/vqCeC2HFKEbZ8slOtyhmNdUj7ECmv51ef9O6qDei/TE6hQ9f3HIV++g+UOV+nLG
 XHNCRgz2gL4UUVAiblMbGUiVPp1h9Td690P2S85ZWxFR28kVyWRSVBOv0kI93sdTawbG
 J00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aePqf3cR9ZLztw0DXP+i/Rb70qzyDNY65JdTCD9MzPg=;
 b=IRYrsy1h3cLtoQ5zAcsTIH8DW0Qf/+Ih8p4yoLQd1VEexSfOi1Ih3onupkFuoW5Y3G
 GJcY2r5QR73tWwNOm0ZjXzRKy5MvdljKMB0PAeXqxER/51kMJbNfvVmPvvIBWHdr0xoe
 2WagHM7Zz6VDaNAsCdNz6MLbPFpc/u1cj1z2X/w7nKstN8mU8kZBlLZQr7ag7aLuO9cm
 2Z3b7obo9ocLU9QEEv2/lxBNbpcsps5fzjunvNveZjwN/smpQ0Hnpa1qHDytDKqIeF21
 4yK3fO3QvG55bJVAP7PyaIMLPLFmoeZXnYWqQYyFk9LifddZe+aGtHYUWuXqZnRxbdw1
 D0BQ==
X-Gm-Message-State: APjAAAVRnBsZJzT7EF77E0C+B824V1HMDLZL3tfbDiPQ1RY4i/fRktz2
 zxFmrbcXWWNy8kSYLKm17jZOROXG5q8=
X-Google-Smtp-Source: APXvYqzPAzYlEVr9uN9NUS/TdqdnWWgd+sH6cAuI64yPBtLbqRQW8I874+SUpkpYWksN1VrBzLd9Tg==
X-Received: by 2002:a17:902:b086:: with SMTP id
 p6mr6201935plr.315.1567438356724; 
 Mon, 02 Sep 2019 08:32:36 -0700 (PDT)
Received: from bobo.local0.net ([61.68.187.15])
 by smtp.gmail.com with ESMTPSA id b14sm15966033pfo.15.2019.09.02.08.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 08:32:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/6] powerpc/64s: make mmu_partition_table_set_entry TLB flush
 optional
Date: Tue,  3 Sep 2019 01:29:28 +1000
Message-Id: <20190902152931.17840-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902152931.17840-1-npiggin@gmail.com>
References: <20190902152931.17840-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No functional change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/mmu.h           | 2 +-
 arch/powerpc/kvm/book3s_hv_nested.c      | 2 +-
 arch/powerpc/mm/book3s64/hash_utils.c    | 2 +-
 arch/powerpc/mm/book3s64/pgtable.c       | 4 ++--
 arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index ba94ce8c22d7..0699cfeeb8c9 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -257,7 +257,7 @@ extern void radix__mmu_cleanup_all(void);
 /* Functions for creating and updating partition table on POWER9 */
 extern void mmu_partition_table_init(void);
 extern void mmu_partition_table_set_entry(unsigned int lpid, unsigned long dw0,
-					  unsigned long dw1);
+					  unsigned long dw1, bool flush);
 #endif /* CONFIG_PPC64 */
 
 struct mm_struct;
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index b3316da2f13e..fff90f2c3de2 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -411,7 +411,7 @@ static void kvmhv_flush_lpid(unsigned int lpid)
 void kvmhv_set_ptbl_entry(unsigned int lpid, u64 dw0, u64 dw1)
 {
 	if (!kvmhv_on_pseries()) {
-		mmu_partition_table_set_entry(lpid, dw0, dw1);
+		mmu_partition_table_set_entry(lpid, dw0, dw1, true);
 		return;
 	}
 
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 7aed27ea5361..b73d08b54d12 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -825,7 +825,7 @@ static void __init hash_init_partition_table(phys_addr_t hash_table,
 	 * For now, UPRT is 0 and we have no segment table.
 	 */
 	htab_size =  __ilog2(htab_size) - 18;
-	mmu_partition_table_set_entry(0, hash_table | htab_size, 0);
+	mmu_partition_table_set_entry(0, hash_table | htab_size, 0, true);
 	pr_info("Partition table %p\n", partition_tb);
 }
 
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index c2b87c5ba50b..6fab9c0bbbaf 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -224,7 +224,7 @@ static void flush_partition(unsigned int lpid, bool radix)
 }
 
 void mmu_partition_table_set_entry(unsigned int lpid, unsigned long dw0,
-				  unsigned long dw1)
+				  unsigned long dw1, bool flush)
 {
 	unsigned long old = be64_to_cpu(partition_tb[lpid].patb0);
 
@@ -251,7 +251,7 @@ void mmu_partition_table_set_entry(unsigned int lpid, unsigned long dw0,
 		uv_register_pate(lpid, dw0, dw1);
 		pr_info("PATE registered by ultravisor: dw0 = 0x%lx, dw1 = 0x%lx\n",
 			dw0, dw1);
-	} else {
+	} else if (flush) {
 		flush_partition(lpid, (old & PATB_HR));
 	}
 }
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 83fa7864e8f4..078a7eeec1f5 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -396,7 +396,7 @@ static void __init radix_init_partition_table(void)
 	rts_field = radix__get_tree_size();
 	dw0 = rts_field | __pa(init_mm.pgd) | RADIX_PGD_INDEX_SIZE | PATB_HR;
 	dw1 = __pa(process_tb) | (PRTB_SIZE_SHIFT - 12) | PATB_GR;
-	mmu_partition_table_set_entry(0, dw0, dw1);
+	mmu_partition_table_set_entry(0, dw0, dw1, true);
 
 	asm volatile("ptesync" : : : "memory");
 	asm volatile(PPC_TLBIE_5(%0,%1,2,1,1) : :
-- 
2.22.0

