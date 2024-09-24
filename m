Return-Path: <linuxppc-dev+bounces-1539-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA84983CB0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 08:10:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCTxT28Mxz2y72;
	Tue, 24 Sep 2024 16:10:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727158237;
	cv=none; b=XmTsPaJ0x4RZWOfbxzIUkOu8sHxomuDoOQqdYj461yi8l7A9NEJVO9vdwB7EzAulKRFy1p74JDxulteoDGjMZtCxb3NkpI3mjP5herO+1VB9i1RpgYjtTJpeyWyaNHm/ov8LFeYEvqXNqqS6XTbpRwFqYds6yCKq1gDS/xSEc+XOVvxT8oUt5KNKYFWFnHQcYG2iwBE0UJ9pURftRp8d4ibMgDjMgfIQo/wQ1bX5qC9KMUBNAgalxiwa8oBG3cTeHV9KZBU8/CVwDiv5iP3ZCtXaZ9cujbLELfviKpIHbL8wnskpije73Ig6qYiFWXR0sd0LZqC7jMsgqlHPIsNukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727158237; c=relaxed/relaxed;
	bh=wFV2Gg1HPn9r0uTPIEIMJioMCNlgr9zWJ7S9CBl14ro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yi2AJpMJhqpNTEZJsFagOzxKG57O9Kny3VG1lMEiKPaJzVQPpLsOq6L2L/gVlj7T6jLGVgfqcrvSA8DcRxumU3TP5tLK6RVFCk3kRwJX9RAwDk5GBu8RnEkZzgh/I9nZiKNszsGobywkPrpk8BN2NpyzQIScGKtTQkQ+veS0DDO9chcBRJS6aQAsd/FSkNckQa+/1wdY4zVE88r11KUhCC7yw3cFsoD30X1liosf+YgCXJiIkUJBUQBQRhlheFCnfpTbhp5RXU1zw7lo445452827mgMbpgH4KH5ApkKksIejD0gyfvhudW1womh5rFAC8eBi+AtE+liIgPLutIZ7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=fmlrgneh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=fmlrgneh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCTxS6rq0z2xHr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 16:10:36 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-206b9455460so38966205ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 23:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727158234; x=1727763034; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFV2Gg1HPn9r0uTPIEIMJioMCNlgr9zWJ7S9CBl14ro=;
        b=fmlrgnehPlpgx6MLI5b42z+8r5uXdx8yG+udyAsTV84PirYP68dhppvEPE3HBnFzdh
         hkjCZ8l8S6WNa/9C/UKrZvJIw1mdZNlKDs1SzQUYyurHaO1in1N66PZXzWhC9YIcQpNg
         Ckl7/5XpSz/aiMGZnngI6+EaWPpDO8cxsMPvaNsWnh/VGvJFLr7hBoe4D6wklNQAKMZ7
         gNSJhbUzRpCmXIqisOygdyMXeRFTulJwLDhE9Lf9Q62S2Z3k55cyNhpN+JgmLpnm0EiE
         WFDL0wv0At4ypmKTycDKi/zJmH6hVJR/qLI0E9Uon3VKe1A5MdgQeGiAl8e3q9OOgvy1
         3fpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727158234; x=1727763034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFV2Gg1HPn9r0uTPIEIMJioMCNlgr9zWJ7S9CBl14ro=;
        b=HfAM08HM4EDeZJY+snBQKPF08r5XcMYdFq/WQUoG7XpscIkjG52cGt9KVY89S8pCEb
         KsLR27SIsp+xLzqiZqzv5zXOuqHZZJd6TrpqKBbJef0PoPW2pYssNw0WW3dAD/03xCNO
         a8YuoqIG4KRMuLgGccFaIf+riDhc5mKI+Fhjnszg5gZZJsHdPf0fh3KBbfDeNu/L48yZ
         lbCQkOny60n2bDb5XHl8xv+n8dQl4xQWNtWQhtb3AEfo/CFibQZP8jvvZTpNLrRzW+6v
         OSraiodQsJIMIOewSumiP//lA5DCLRCyDghosZHIcUrXHj048cbO3oDpZrcBEpW/npD3
         LkGA==
X-Forwarded-Encrypted: i=1; AJvYcCXSPShXcyRnA804RFRC61+rOyG3UAdWmyXQ7p98/RLsWEpMB+GUT4fYGBHYo/UYh5BWebDB6hVRjyEGmMM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YygilyxHecmdAL05rsTn+f1QCMCqALuWdhS/xy9qORdzpPoCt95
	wt2RJzkosLveOSpfVcn4Nh1weGXInOyAK6l/is0aGM2ru+3j8Vlqk5+pcl3pA3I=
X-Google-Smtp-Source: AGHT+IFurxEbSfxWnkgUvSmQpfQ7iOb3of4fLdIGxM8iu8OEamvgIzhTlXEYzcUx/o7HLvoMu2wctg==
X-Received: by 2002:a17:902:ce8c:b0:207:6d2:1aa5 with SMTP id d9443c01a7336-20aed0b299cmr27872445ad.13.1727158234439;
        Mon, 23 Sep 2024 23:10:34 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17229c9sm4344885ad.85.2024.09.23.23.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 23:10:33 -0700 (PDT)
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
Subject: [PATCH v4 01/13] mm: pgtable: introduce pte_offset_map_{ro|rw}_nolock()
Date: Tue, 24 Sep 2024 14:09:53 +0800
Message-Id: <1a4fea06f8cada72553a8d8992a92e9c09f2c9d4.1727148662.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1727148662.git.zhengqi.arch@bytedance.com>
References: <cover.1727148662.git.zhengqi.arch@bytedance.com>
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
index 546a9406859ad..9a4550cd830c9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3017,6 +3017,11 @@ static inline pte_t *pte_offset_map_lock(struct mm_struct *mm, pmd_t *pmd,
 
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


