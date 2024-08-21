Return-Path: <linuxppc-dev+bounces-264-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB6D9597CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:40:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpjXz647yz2yGY;
	Wed, 21 Aug 2024 20:40:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Z52+5f4G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpfPz5y9Pz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 18:19:35 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-714262f1bb4so278193b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 01:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724228373; x=1724833173; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgE/WG98IUTB5tF1fVgrlRXpW1wPHqZ1M9xizEuPG+g=;
        b=Z52+5f4GzfOVWjwpzpAwSygnOUPREjFKMBTRacTbh3/Nebmsmc2Vt3QXpBU0xSXhbm
         dA38ckmPIcg8PcraKBO3QeHX/k44K+NuHUQzpCwkmUEbY5tvrG2XUZlguFTM3DBxpE0K
         k6rSXhukf33eqimMKRgxNwnTQROOdlquzWrgpPvdjVv5UZ53NJIjZshxBW9oq34Ea6MP
         YkHDmJxB4dHmCAvdaajdn0ua/1ZilvUrLDd3RtIcYRlthdPqV0HxkygvzhKnSnT0CbZz
         2FTIkTBVpXeSbJchctkPRIIbahMnwyCdzPlTMNoB6m/DXvvF2L0Txu0VHUnCwT5236gT
         /2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724228373; x=1724833173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VgE/WG98IUTB5tF1fVgrlRXpW1wPHqZ1M9xizEuPG+g=;
        b=bAA90eCjgOCnlzk6JIbejc7SQjl4MgC4BUMOP6iKZkDVaAfdlhF5PtsYY+yh8/uVUd
         AyBIYS8GKUo+cQ2bxzs7x+Jt0wUxciS4LnKeYZdlwyeqEAUoMnZt6BY8VltVT8Pp9wNr
         maqOIchxyY7EdmJu0ogB+ksR0eUf19Z7nWI9Go7B5mxMPFwrVVph/B54L+ETS1z2Rh4s
         6rZb56ZuLq3Yk3PPuvIKYZgShD+wq6Y+bfNJAufi3cY9uGvtMZws0zfn9g4eWdTYO+/+
         lSMKJkjp7VhoaxCZuOPyDnr0hlvjRo6fS9B4RX8trYExRsdqp4QOR4fhTscNomGO1uVt
         nEYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/zlx37qdwVpNGNifjODLvoQANXROuBUgRoWEi52A3yhDiIjPSHrq3kAlHTcjhC+PXxpuj+Bhi5Bo89hM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxfwpNNCXZyTgWVc5FWSm8AvNYJT+yDms/wauLeqmpp7EmaXnd2
	TGB21pBoyTkdSSBvGuqhwrFLrzeaKBxPp+j4PW0FpyMoq2GdjEGPjZe0WtLIrlc=
X-Google-Smtp-Source: AGHT+IF11KqU9EwWDBxqOuV+x8Or0DtjlDyZMn8HSaNUPAUvyVetfGjOkbkYFHx43yYUuJqRZJ73CA==
X-Received: by 2002:a05:6a21:2986:b0:1c0:e49a:6900 with SMTP id adf61e73a8af0-1cad80ef085mr1849540637.7.1724228372801;
        Wed, 21 Aug 2024 01:19:32 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb9049b0sm1091453a91.17.2024.08.21.01.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:19:32 -0700 (PDT)
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
	ryan.roberts@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 01/14] mm: pgtable: introduce pte_offset_map_{readonly|maywrite}_nolock()
Date: Wed, 21 Aug 2024 16:18:44 +0800
Message-Id: <cf9ba8ef10d198584ee907affa516ecebbe29244.1724226076.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1724226076.git.zhengqi.arch@bytedance.com>
References: <cover.1724226076.git.zhengqi.arch@bytedance.com>
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
For 1), just rename it to pte_offset_map_readonly_nolock(). For 2), in
addition to changing the name to pte_offset_map_maywrite_nolock(), it also
outputs the pmdval when successful. This can help the caller recheck *pmd
once the PTL is taken. In some cases we can pass NULL to pmdvalp: either
the mmap_lock for write, or pte_same() check on contents, is also enough
to ensure that the pmd entry is stable.

Subsequent commits will convert pte_offset_map_nolock() into the above
two functions one by one, and finally completely delete it.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 Documentation/mm/split_page_table_lock.rst |  7 ++++
 include/linux/mm.h                         |  5 +++
 mm/pgtable-generic.c                       | 43 ++++++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/Documentation/mm/split_page_table_lock.rst b/Documentation/mm/split_page_table_lock.rst
index e4f6972eb6c04..f54f717ae8bdf 100644
--- a/Documentation/mm/split_page_table_lock.rst
+++ b/Documentation/mm/split_page_table_lock.rst
@@ -19,6 +19,13 @@ There are helpers to lock/unlock a table and other accessor functions:
  - pte_offset_map_nolock()
 	maps PTE, returns pointer to PTE with pointer to its PTE table
 	lock (not taken), or returns NULL if no PTE table;
+ - pte_offset_map_readonly_nolock()
+	maps PTE, returns pointer to PTE with pointer to its PTE table
+	lock (not taken), or returns NULL if no PTE table;
+ - pte_offset_map_maywrite_nolock()
+	maps PTE, returns pointer to PTE with pointer to its PTE table
+	lock (not taken) and the value of its pmd entry, or returns NULL
+	if no PTE table;
  - pte_offset_map()
 	maps PTE, returns pointer to PTE, or returns NULL if no PTE table;
  - pte_unmap()
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 00501f85f45f0..1fe0ceabcaf39 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2954,6 +2954,11 @@ static inline pte_t *pte_offset_map_lock(struct mm_struct *mm, pmd_t *pmd,
 
 pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
 			unsigned long addr, spinlock_t **ptlp);
+pte_t *pte_offset_map_readonly_nolock(struct mm_struct *mm, pmd_t *pmd,
+				      unsigned long addr, spinlock_t **ptlp);
+pte_t *pte_offset_map_maywrite_nolock(struct mm_struct *mm, pmd_t *pmd,
+				      unsigned long addr, pmd_t *pmdvalp,
+				      spinlock_t **ptlp);
 
 #define pte_unmap_unlock(pte, ptl)	do {		\
 	spin_unlock(ptl);				\
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index a78a4adf711ac..29d1fd6fd2963 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -317,6 +317,33 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
 	return pte;
 }
 
+pte_t *pte_offset_map_readonly_nolock(struct mm_struct *mm, pmd_t *pmd,
+				      unsigned long addr, spinlock_t **ptlp)
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
+pte_t *pte_offset_map_maywrite_nolock(struct mm_struct *mm, pmd_t *pmd,
+				      unsigned long addr, pmd_t *pmdvalp,
+				      spinlock_t **ptlp)
+{
+	pmd_t pmdval;
+	pte_t *pte;
+
+	pte = __pte_offset_map(pmd, addr, &pmdval);
+	if (likely(pte))
+		*ptlp = pte_lockptr(mm, &pmdval);
+	if (pmdvalp)
+		*pmdvalp = pmdval;
+	return pte;
+}
+
 /*
  * pte_offset_map_lock(mm, pmd, addr, ptlp), and its internal implementation
  * __pte_offset_map_lock() below, is usually called with the pmd pointer for
@@ -356,6 +383,22 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
  * recheck *pmd once the lock is taken; in practice, no callsite needs that -
  * either the mmap_lock for write, or pte_same() check on contents, is enough.
  *
+ * pte_offset_map_readonly_nolock(mm, pmd, addr, ptlp), above, is like
+ * pte_offset_map(); but when successful, it also outputs a pointer to the
+ * spinlock in ptlp - as pte_offset_map_lock() does, but in this case without
+ * locking it.  This helps the caller to avoid a later pte_lockptr(mm, *pmd),
+ * which might by that time act on a changed *pmd: pte_offset_map_readonly_nolock()
+ * provides the correct spinlock pointer for the page table that it returns.
+ * For readonly case, the caller does not need to recheck *pmd after the lock is
+ * taken, because the RCU lock will ensure that the PTE page will not be freed.
+ *
+ * pte_offset_map_maywrite_nolock(mm, pmd, addr, pmdvalp, ptlp), above, is like
+ * pte_offset_map_readonly_nolock(); but when successful, it also outputs the
+ * pdmval. For cases where pte or pmd entries may be modified, that is, maywrite
+ * case, this can help the caller recheck *pmd once the lock is taken. In some
+ * cases we can pass NULL to pmdvalp: either the mmap_lock for write, or
+ * pte_same() check on contents, is also enough.
+ *
  * Note that free_pgtables(), used after unmapping detached vmas, or when
  * exiting the whole mm, does not take page table lock before freeing a page
  * table, and may not use RCU at all: "outsiders" like khugepaged should avoid
-- 
2.20.1


