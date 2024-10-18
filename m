Return-Path: <linuxppc-dev+bounces-2387-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D33F59A44B1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 19:31:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVWvT09rjz3btR;
	Sat, 19 Oct 2024 04:31:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729272660;
	cv=none; b=GhcO5IFL88FYLtb3gFZRrGrgHKMd0X5WrxMvpR9zJ4mHS/JXyvITjYXIC/RwKfLKqInceQftSN1KmmlmLJOArpjo/NYQDEqrgiOLWAGzAKTwRyhMuCwdCqByCJLgpPijSV2mHizvK+T/DVS0UsAOGHwJ3ywm8O/iKn7ooqkiFZvguWYq45BIvpll+PnB4A9wEOk6aal1d039javPGTzOV8oix9MxzhID4ZR0oaxTxmyixqKXNncmZWuLZ30Oud67z0gfVbP0RCDqPjmkG+j5PvQsXRNhRXMJhK5U37drzk4IkhS7EnaOP6lDeajAHHcTSLmBQsx2is2lmsMrHwkuKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729272660; c=relaxed/relaxed;
	bh=SYv3qxbJ8XzSYVM3O5y7o2xiEmCUj8b+8LHRXlL50QE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LF100CEI7o8cE2ZF/p9u5Yn4taAfViHfB9z4e++aBBn97FM31sX4jCp+bdCYuAG+USIo3QbUD1JGqSValJLkwjYIe2Lw1b7C07MBKpfNXUp1XYT2sToiwbJnbZten8elsSVkakLPisB6+EoNj8shIDigjHmgishxdIe43RC72ozLrid7G6PMhO0bir45T25kwkDyOm/7kT5K1sP1pwoHjag7N9tIY8zYMhy5FzJ9t7sTxZq/qswVOvRck7EUhHydoRxZybJQ0Mxo2Fe0oe7SgDbtCEtQwx45NQQf+RJjvA8hSFfsdHcXC7/LrdwdkscJrpRrhqNL5S7jkxyt1Qhm7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UHWYlkTE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UHWYlkTE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVWvS1BCVz3bqW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 04:31:00 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-71e3fce4a60so1656043b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 10:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729272657; x=1729877457; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYv3qxbJ8XzSYVM3O5y7o2xiEmCUj8b+8LHRXlL50QE=;
        b=UHWYlkTEs/iA6uq8W15siN1eIOhsv0ePvx2Gz6fw4c2J6XXvmqGAzRZ5mdchQRH+wd
         9THleXLaQHTDutVyf9DKAjQ0ZaDBW0Hmd6K8VyY6P3cuzWRldBxsBvKMW1nnEDpMQD16
         B0SS/MdtH/wSFCrRNRGOWc/w7ke9oCOXtoqvTX2q1gj558IUZfxvo1rdLz2Nh74mhjsr
         jfcYAf7mkYSUUSgXdTXjoPnSIXtEeG9pnlVMWd73D7/FbW+DE6NQtZUGOka3CELfCd+r
         p9QODeZKqZGU+f4thjRdbZqVA0qcWaMtghwrxFqgk/aT5SvzmvcYvn/o10hSIuI3svTH
         oefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729272657; x=1729877457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYv3qxbJ8XzSYVM3O5y7o2xiEmCUj8b+8LHRXlL50QE=;
        b=NS3CLn5EFcS8T6cpJ4P0UXHMBvBjUH60rFdb97Eth8ofErFy2RiVRJ0ZEzNrcs1EQF
         K2j/QFSSD26gjapJT58hdECyh3eFK1N9BXX4t4JMdc95W8VB7zCEBHMRkqMzBPnPLz1f
         ooyDeMBLpJoYA1c8bnqXQBhgM6VSbH8AUiJLBbik2OG9pjeXTlTRcteDmWuoKQ3X1Jvq
         pvTXuQe8jPJwERYDihcRQWnegf00RLNB2m/f7eGxsh8NOInVgtbS+K555UZ/xlD7dSTu
         snxYlzECN4SnzW/5vOvM06PEVH/w21HVk6Dp7sNUQGWiUsXIgi5e5maiwl8cR8lf1a4p
         +C1w==
X-Gm-Message-State: AOJu0YydyMyBDRvLEaVk2qr9Yr+UPN/teGD9xQ3r4wEdz6jtqwncAEnt
	iTj5PCjOg4MhMgUnyQJ6nKr/bsWVBBFTesPz802ZVGVmzfYRFlc0iGAnQeSO
X-Google-Smtp-Source: AGHT+IGzdUgXGWS3Rnfne00N0lzoqmJmv13oE/GEcsOOigglv7dM20Xc4zaopt4Axws81Q8JXv67zw==
X-Received: by 2002:a05:6a21:a4c1:b0:1d8:f1f4:f4ee with SMTP id adf61e73a8af0-1d92c4baaaemr4986521637.8.1729272656623;
        Fri, 18 Oct 2024 10:30:56 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea3311f51sm1725242b3a.36.2024.10.18.10.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 10:30:55 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v3 07/12] book3s64/hash: Make kernel_map_linear_page() generic
Date: Fri, 18 Oct 2024 22:59:48 +0530
Message-ID: <5b67df7b29e68d7c78d6fc1f42d41137299bac6b.1729271995.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1729271995.git.ritesh.list@gmail.com>
References: <cover.1729271995.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Currently kernel_map_linear_page() function assumes to be working on
linear_map_hash_slots array. But since in later patches we need a
separate linear map array for kfence, hence make
kernel_map_linear_page() take a linear map array and lock in it's
function argument.

This is needed to separate out kfence from debug_pagealloc
infrastructure.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 47 ++++++++++++++-------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index ab50bb33a390..11975a2f7403 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -272,11 +272,8 @@ void hash__tlbiel_all(unsigned int action)
 }
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
-static u8 *linear_map_hash_slots;
-static unsigned long linear_map_hash_count;
-static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
-
-static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
+static void kernel_map_linear_page(unsigned long vaddr, unsigned long idx,
+				   u8 *slots, raw_spinlock_t *lock)
 {
 	unsigned long hash;
 	unsigned long vsid = get_kernel_vsid(vaddr, mmu_kernel_ssize);
@@ -290,7 +287,7 @@ static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
 	if (!vsid)
 		return;
 
-	if (linear_map_hash_slots[lmi] & 0x80)
+	if (slots[idx] & 0x80)
 		return;
 
 	ret = hpte_insert_repeating(hash, vpn, __pa(vaddr), mode,
@@ -298,36 +295,40 @@ static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
 				    mmu_linear_psize, mmu_kernel_ssize);
 
 	BUG_ON (ret < 0);
-	raw_spin_lock(&linear_map_hash_lock);
-	BUG_ON(linear_map_hash_slots[lmi] & 0x80);
-	linear_map_hash_slots[lmi] = ret | 0x80;
-	raw_spin_unlock(&linear_map_hash_lock);
+	raw_spin_lock(lock);
+	BUG_ON(slots[idx] & 0x80);
+	slots[idx] = ret | 0x80;
+	raw_spin_unlock(lock);
 }
 
-static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
+static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long idx,
+				     u8 *slots, raw_spinlock_t *lock)
 {
-	unsigned long hash, hidx, slot;
+	unsigned long hash, hslot, slot;
 	unsigned long vsid = get_kernel_vsid(vaddr, mmu_kernel_ssize);
 	unsigned long vpn = hpt_vpn(vaddr, vsid, mmu_kernel_ssize);
 
 	hash = hpt_hash(vpn, PAGE_SHIFT, mmu_kernel_ssize);
-	raw_spin_lock(&linear_map_hash_lock);
-	if (!(linear_map_hash_slots[lmi] & 0x80)) {
-		raw_spin_unlock(&linear_map_hash_lock);
+	raw_spin_lock(lock);
+	if (!(slots[idx] & 0x80)) {
+		raw_spin_unlock(lock);
 		return;
 	}
-	hidx = linear_map_hash_slots[lmi] & 0x7f;
-	linear_map_hash_slots[lmi] = 0;
-	raw_spin_unlock(&linear_map_hash_lock);
-	if (hidx & _PTEIDX_SECONDARY)
+	hslot = slots[idx] & 0x7f;
+	slots[idx] = 0;
+	raw_spin_unlock(lock);
+	if (hslot & _PTEIDX_SECONDARY)
 		hash = ~hash;
 	slot = (hash & htab_hash_mask) * HPTES_PER_GROUP;
-	slot += hidx & _PTEIDX_GROUP_IX;
+	slot += hslot & _PTEIDX_GROUP_IX;
 	mmu_hash_ops.hpte_invalidate(slot, vpn, mmu_linear_psize,
 				     mmu_linear_psize,
 				     mmu_kernel_ssize, 0);
 }
 
+static u8 *linear_map_hash_slots;
+static unsigned long linear_map_hash_count;
+static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
 static inline void hash_debug_pagealloc_alloc_slots(void)
 {
 	if (!debug_pagealloc_enabled())
@@ -362,9 +363,11 @@ static int hash_debug_pagealloc_map_pages(struct page *page, int numpages,
 		if (lmi >= linear_map_hash_count)
 			continue;
 		if (enable)
-			kernel_map_linear_page(vaddr, lmi);
+			kernel_map_linear_page(vaddr, lmi,
+				linear_map_hash_slots, &linear_map_hash_lock);
 		else
-			kernel_unmap_linear_page(vaddr, lmi);
+			kernel_unmap_linear_page(vaddr, lmi,
+				linear_map_hash_slots, &linear_map_hash_lock);
 	}
 	local_irq_restore(flags);
 	return 0;
-- 
2.46.0


