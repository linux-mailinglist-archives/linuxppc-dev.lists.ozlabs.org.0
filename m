Return-Path: <linuxppc-dev+bounces-955-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A3696B50C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 10:40:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzGD45Gf1z2yQ9;
	Wed,  4 Sep 2024 18:40:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725439252;
	cv=none; b=GbesPAb8uq3a0w6kX6u+IpF/aA/Mg82ttotLyjBcO7M7bHN22hx1AdzScaca6B4GVkZx5GI8M2otfHgGHu+tjG/Bgd/nN4SZordm01Rk9B1qNdxaM/Apk87gDzuVD9QrbXIQyBkP6eiNJ0ttcIUW+mMCabpiucFgQ6ytB4sWoElw9zasED8Z07HMUXFKnub8LIU/FtvtnaPpQJrnTHsaOfzLjVZNkN7URAmXQPDlLpyjJRH4m2vX4h3kTHjeDZ1QCpxu5ObnTuLf6WnOGVzaaecAL7gwCwzGNLaTtEUHGrHyWoSnSNfZ3a3FR/zvBjap/aUxLgQQan2B9w4OQ6fZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725439252; c=relaxed/relaxed;
	bh=3ZoTvF0msswRhisxHHwhwQPLPrn7vj0AmYqzYo7APLw=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version; b=DEGR8vj5mZX/0/lwvVFxlvPYQvXSAenuTmeyYb0EjlW5sqYrrid/6aJtTYJ+kRsDEG15hi0ZsYbrhcPADo855uKQ8qioy/vUnSQ7WvukY0+NPWplFC2j6T7zQ9WX3HB77jx5vcjmnIQk3W2CH6n1ZLsweOipdacd9JghtFXgZCEzMqQdLVxSgIvOo6kzn8uasRjvADqKRritmR4c2Yznwt2l0j+swVsudbsCcw7Hdp+Cb1h3BzR5tCQZizjEiF12pY3I70UVhm9Q28g1PqN+4DQjGNJinrZgrV+PJaw9/NPAWq1CLiI6l815MPCvrk+fQ/gaGEM43+E1m6FIxxYFQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=NP20WRrC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=NP20WRrC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzGD42xZfz2yDx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 18:40:52 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2053f6b8201so31851665ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 01:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725439250; x=1726044050; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZoTvF0msswRhisxHHwhwQPLPrn7vj0AmYqzYo7APLw=;
        b=NP20WRrC3NKs1IcqQPIpGYPCqz2FsVzWN/tHag9oXmdqMssOtTm4pI6xqlZ5Dumqsf
         mvVFHNlk05QIm7KA8BqMX3q6IO520iXdXhRVSGwHcMfGkfiAmFz1YFysnWBrSHmiFDsd
         RUe1Vs4eGSqAemTpJg20rIFUuEG/RSZS/PH4I1GFskDQl/TcnuuTenImEtJ9I7ZqmZT1
         XApUCQmTXYbOXURn6KGUc5eK8DQ5XOSbnl4JLUzXy99D2MJkwef3B0TV2LFym/PA5uCD
         hmQLfnOTy5GGk5mHxPIS2hrRbDJ5T/S3lUvxyJb3ZSmjSfPbe+mo0Fy5RIReZ6abyLBT
         zGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439250; x=1726044050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ZoTvF0msswRhisxHHwhwQPLPrn7vj0AmYqzYo7APLw=;
        b=LVnDx1xD0XILTmmUTC9m//JU49Udn0yCvvTJ//xkTebmjn7NE17XcAtCFP+VZmDyA6
         Biew/gRJUDJoMTzTO4mEELMHbts3t2KBiuOD7XLgBVA6tHxJ1NJU99IMb2VUD+y/4nr8
         UmUDeoZ68anbKrZsYuiFqzjHODzd/nSh+4zn+JuKaEWuJAFoYvuxjwpegJFFS3oHuUmt
         qSNqOPD4jiJKYV5XHwFlzL80y3V5NKuHg7LoU8UtyjtR3FUjyksEqMG0t6AHIM2UZn2Y
         MWN5BfId4qrSwhK+Fn9jamaCpqjXkaOISR0ZgO83UM4t9W9VmGtEjOJarqHq0281FZ8e
         ukcg==
X-Forwarded-Encrypted: i=1; AJvYcCUIV2CnXeVYyR1RJ9nUJ8zescUXgvw4EkRCp4cEKa8fwOny0bgA9XP8nuY9o0xghrzgMB/Y9QDrkKae4Ig=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxD3k2BeGRhLb0feEftv7i4ghNUxba57+NzdSGNwqmAEY+KliRq
	dUExNhSMEx8NFGiGH0gmsLJXJ/Upg0MgOkrDOrdAd4AbjOQQz2bYdUJTyenPGtk=
X-Google-Smtp-Source: AGHT+IHLu4af/0RdmwIJrtep3I3PIUPy/4FB7EG8zsCDexMsa/uyvNrQYTXwy/3KiLtDhw4LWBklXg==
X-Received: by 2002:a17:902:ce0b:b0:202:3dcf:8c38 with SMTP id d9443c01a7336-20546b35d3fmr190359795ad.44.1725439249775;
        Wed, 04 Sep 2024 01:40:49 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae95a51csm9414045ad.117.2024.09.04.01.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 01:40:49 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: david@redhat.com,
	hughd@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	vishal.moola@gmail.com,
	peterx@redhat.com,
	ryan.roberts@arm.com,
	christophe.leroy2@cs-soprasteria.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 01/14] mm: pgtable: introduce pte_offset_map_{ro|rw}_nolock()
Date: Wed,  4 Sep 2024 16:40:09 +0800
Message-Id: <20240904084022.32728-2-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
References: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
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

Currently, the usage of pte_offset_map_nolock() can be divided into the
following two cases:

1) After acquiring PTL, only read-only operations are performed on the PTE
   page. In this case, the RCU lock in pte_offset_map_nolock() will ensure
   that the PTE page will not be freed, and there is no need to worry
   about whether the pmd entry is modified.

2) After acquiring PTL, the pte or pmd entries may be modified. At this
   time, we need to ensure that the pmd entry has not been modified
   concurrently.

To more clearing distinguish between these two cases, this commit
introduces two new helper functions to replace pte_offset_map_nolock().
For 1), just rename it to pte_offset_map_ro_nolock(). For 2), in addition
to changing the name to pte_offset_map_rw_nolock(), it also outputs the
pmdval when successful. It is applicable for may-write cases where any
modification operations to the page table may happen after the
corresponding spinlock is held afterwards. But the users should make sure
the page table is stable like checking pte_same() or checking pmd_same()
by using the output pmdval before performing the write operations.

Note: "RO" / "RW" expresses the intended semantics, not that the *kmap*
will be read-only/read-write protected.

Subsequent commits will convert pte_offset_map_nolock() into the above
two functions one by one, and finally completely delete it.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 Documentation/mm/split_page_table_lock.rst |  7 +++
 include/linux/mm.h                         |  5 +++
 mm/pgtable-generic.c                       | 50 ++++++++++++++++++++++
 3 files changed, 62 insertions(+)

diff --git a/Documentation/mm/split_page_table_lock.rst b/Documentation/mm/split_page_table_lock.rst
index e4f6972eb6c04..08d0e706a32db 100644
--- a/Documentation/mm/split_page_table_lock.rst
+++ b/Documentation/mm/split_page_table_lock.rst
@@ -19,6 +19,13 @@ There are helpers to lock/unlock a table and other accessor functions:
  - pte_offset_map_nolock()
 	maps PTE, returns pointer to PTE with pointer to its PTE table
 	lock (not taken), or returns NULL if no PTE table;
+ - pte_offset_map_ro_nolock()
+	maps PTE, returns pointer to PTE with pointer to its PTE table
+	lock (not taken), or returns NULL if no PTE table;
+ - pte_offset_map_rw_nolock()
+	maps PTE, returns pointer to PTE with pointer to its PTE table
+	lock (not taken) and the value of its pmd entry, or returns NULL
+	if no PTE table;
  - pte_offset_map()
 	maps PTE, returns pointer to PTE, or returns NULL if no PTE table;
  - pte_unmap()
diff --git a/include/linux/mm.h b/include/linux/mm.h
index a7c74a840249a..1fde9242231c9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3006,6 +3006,11 @@ static inline pte_t *pte_offset_map_lock(struct mm_struct *mm, pmd_t *pmd,
 
 pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
 			unsigned long addr, spinlock_t **ptlp);
+pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
+				unsigned long addr, spinlock_t **ptlp);
+pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
+				unsigned long addr, pmd_t *pmdvalp,
+				spinlock_t **ptlp);
 
 #define pte_unmap_unlock(pte, ptl)	do {		\
 	spin_unlock(ptl);				\
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index a78a4adf711ac..262b7065a5a2e 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -317,6 +317,33 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
 	return pte;
 }
 
+pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
+				unsigned long addr, spinlock_t **ptlp)
+{
+	pmd_t pmdval;
+	pte_t *pte;
+
+	pte = __pte_offset_map(pmd, addr, &pmdval);
+	if (likely(pte))
+		*ptlp = pte_lockptr(mm, &pmdval);
+	return pte;
+}
+
+pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
+				unsigned long addr, pmd_t *pmdvalp,
+				spinlock_t **ptlp)
+{
+	pmd_t pmdval;
+	pte_t *pte;
+
+	VM_WARN_ON_ONCE(!pmdvalp);
+	pte = __pte_offset_map(pmd, addr, &pmdval);
+	if (likely(pte))
+		*ptlp = pte_lockptr(mm, &pmdval);
+	*pmdvalp = pmdval;
+	return pte;
+}
+
 /*
  * pte_offset_map_lock(mm, pmd, addr, ptlp), and its internal implementation
  * __pte_offset_map_lock() below, is usually called with the pmd pointer for
@@ -356,6 +383,29 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
  * recheck *pmd once the lock is taken; in practice, no callsite needs that -
  * either the mmap_lock for write, or pte_same() check on contents, is enough.
  *
+ * pte_offset_map_ro_nolock(mm, pmd, addr, ptlp), above, is like pte_offset_map();
+ * but when successful, it also outputs a pointer to the spinlock in ptlp - as
+ * pte_offset_map_lock() does, but in this case without locking it.  This helps
+ * the caller to avoid a later pte_lockptr(mm, *pmd), which might by that time
+ * act on a changed *pmd: pte_offset_map_ro_nolock() provides the correct spinlock
+ * pointer for the page table that it returns. Even after grabbing the spinlock,
+ * we might be looking either at a page table that is still mapped or one that
+ * was unmapped and is about to get freed. But for R/O access this is sufficient.
+ * So it is only applicable for read-only cases where any modification operations
+ * to the page table are not allowed even if the corresponding spinlock is held
+ * afterwards.
+ *
+ * pte_offset_map_rw_nolock(mm, pmd, addr, pmdvalp, ptlp), above, is like
+ * pte_offset_map_ro_nolock(); but when successful, it also outputs the pdmval.
+ * It is applicable for may-write cases where any modification operations to the
+ * page table may happen after the corresponding spinlock is held afterwards.
+ * But the users should make sure the page table is stable like checking pte_same()
+ * or checking pmd_same() by using the output pmdval before performing the write
+ * operations.
+ *
+ * Note: "RO" / "RW" expresses the intended semantics, not that the *kmap* will
+ * be read-only/read-write protected.
+ *
  * Note that free_pgtables(), used after unmapping detached vmas, or when
  * exiting the whole mm, does not take page table lock before freeing a page
  * table, and may not use RCU at all: "outsiders" like khugepaged should avoid
-- 
2.20.1


