Return-Path: <linuxppc-dev+bounces-327-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 846E295AEBB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:17:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDx46j29z2yvx;
	Thu, 22 Aug 2024 17:15:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=fnQsOP6y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDx44H5Wz2ysd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:15:04 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7106cf5771bso456060b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 00:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724310903; x=1724915703; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFdM7jnff0z8zF8oYknH78hRu/cQudWIIbslP9zGsAs=;
        b=fnQsOP6yixVAPuVjU4jC/uwZSD1bnfJlQidlOA65WfL8mhCM023F0M2kIuqlRD8o1r
         SLyEFpo6gA2pWIRVdHrBv1zlNAjvH+sG71nghpAuRyAcbdAvGNsWGRM9fouu4RF3pzr3
         ul595/EWTbpNM/0nnYolleTsVvacY4WtGxijsLsk3/yXL/lBTqCpp14gtAyure2okJlV
         4j4zsZbLLTocXzLDxBoVjtGMon+/hWkixklLBe3b8hHO+XbpNa0n5fEQqVJ9zYDTJjfV
         dC6K/1eTX6CroUjSeBUj/cAj5+1g1ebVtiHjuU+yhGEEYEOgP29VfUQox7DE9SXshoOJ
         thiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724310903; x=1724915703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFdM7jnff0z8zF8oYknH78hRu/cQudWIIbslP9zGsAs=;
        b=o9J4kQ/JjHPR+gPnCpwdJv8waHvzMvx7Wn7OaYhmgD+b8vk0F8L9q9z0c6hppCTuQt
         NiCdSluDrPg9vH6zWc6PXkOOzgeuj9h44vfilvKxHG8C5S1lccWnUEpcTg4E7qyoh3pB
         pk12PdSaxt6PYUpcZvnKYgMktgiJOC1ug03zIqo7dER7JJ3rx+p6tUHkCHR14DyZOIsh
         pmOyZ7wYFUxPd3hq4CU6tJbXu5eXJpN8Gkec67iBfFNvkQm/flyd4dR4Is27EMdQKlgl
         ovkfsu7h88uCHML26k07YmlrNyRMDlAaopKvLybV4KCUp8TdK7iLKIsr8N5o4GQ9+CkK
         703A==
X-Forwarded-Encrypted: i=1; AJvYcCUhfM8mHbaFym7kmvhk4jgrpFiYDyNTSig5rdBioGas3rremYq2Q/Xvuv7sS06VD7SNsRzPnsCkSGz84lc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywuk71nPbUTmSSc1ALGXfGJhRtU3v6/JCbFYJvgbSi0l6My8k7O
	YUTPI+jPDDC+yjXjyhMu/bek50Wj+U3Ihqs1FQRL5NR5oQCzwi4KoWKSXZmlzzw=
X-Google-Smtp-Source: AGHT+IElSFOoF4KMPSsF0Gy5tbhJtfEKgqkCJ+pjJm8bK93AAf5vkcbpbvWiZRIPotD+TEYG0fABhg==
X-Received: by 2002:a05:6a00:b53:b0:70d:2fb5:f996 with SMTP id d2e1a72fcca58-714234922a8mr5431869b3a.11.1724310902611;
        Thu, 22 Aug 2024 00:15:02 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([240e:473:c90:f96:d029:ea8a:4e6d:d272])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac994a3sm695095a12.16.2024.08.22.00.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 00:15:02 -0700 (PDT)
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
Subject: [PATCH v2 13/14] mm: pgtable: remove pte_offset_map_nolock()
Date: Thu, 22 Aug 2024 15:13:28 +0800
Message-Id: <061a61c5871948680488ad02fd1e03547948a500.1724310149.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1724310149.git.zhengqi.arch@bytedance.com>
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
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

Now no users are using the pte_offset_map_nolock(), remove it.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 Documentation/mm/split_page_table_lock.rst |  3 ---
 include/linux/mm.h                         |  2 --
 mm/pgtable-generic.c                       | 21 ---------------------
 3 files changed, 26 deletions(-)

diff --git a/Documentation/mm/split_page_table_lock.rst b/Documentation/mm/split_page_table_lock.rst
index 08d0e706a32db..581446d4a4eba 100644
--- a/Documentation/mm/split_page_table_lock.rst
+++ b/Documentation/mm/split_page_table_lock.rst
@@ -16,9 +16,6 @@ There are helpers to lock/unlock a table and other accessor functions:
  - pte_offset_map_lock()
 	maps PTE and takes PTE table lock, returns pointer to PTE with
 	pointer to its PTE table lock, or returns NULL if no PTE table;
- - pte_offset_map_nolock()
-	maps PTE, returns pointer to PTE with pointer to its PTE table
-	lock (not taken), or returns NULL if no PTE table;
  - pte_offset_map_ro_nolock()
 	maps PTE, returns pointer to PTE with pointer to its PTE table
 	lock (not taken), or returns NULL if no PTE table;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index a00cb35ce065f..1d3e8882f6ba1 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2952,8 +2952,6 @@ static inline pte_t *pte_offset_map_lock(struct mm_struct *mm, pmd_t *pmd,
 	return pte;
 }
 
-pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
-			unsigned long addr, spinlock_t **ptlp);
 pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
 				unsigned long addr, spinlock_t **ptlp);
 pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 9a1666574c959..3b6dd8bb5b134 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -305,18 +305,6 @@ pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
 	return NULL;
 }
 
-pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
-			     unsigned long addr, spinlock_t **ptlp)
-{
-	pmd_t pmdval;
-	pte_t *pte;
-
-	pte = __pte_offset_map(pmd, addr, &pmdval);
-	if (likely(pte))
-		*ptlp = pte_lockptr(mm, &pmdval);
-	return pte;
-}
-
 pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
 				unsigned long addr, spinlock_t **ptlp)
 {
@@ -374,15 +362,6 @@ pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
  * and disconnected table.  Until pte_unmap(pte) unmaps and rcu_read_unlock()s
  * afterwards.
  *
- * pte_offset_map_nolock(mm, pmd, addr, ptlp), above, is like pte_offset_map();
- * but when successful, it also outputs a pointer to the spinlock in ptlp - as
- * pte_offset_map_lock() does, but in this case without locking it.  This helps
- * the caller to avoid a later pte_lockptr(mm, *pmd), which might by that time
- * act on a changed *pmd: pte_offset_map_nolock() provides the correct spinlock
- * pointer for the page table that it returns.  In principle, the caller should
- * recheck *pmd once the lock is taken; in practice, no callsite needs that -
- * either the mmap_lock for write, or pte_same() check on contents, is enough.
- *
  * pte_offset_map_ro_nolock(mm, pmd, addr, ptlp), above, is like
  * pte_offset_map(); but when successful, it also outputs a pointer to the
  * spinlock in ptlp - as pte_offset_map_lock() does, but in this case without
-- 
2.20.1


