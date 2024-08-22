Return-Path: <linuxppc-dev+bounces-305-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C364995AE84
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:14:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDvp3v7fz2yWy;
	Thu, 22 Aug 2024 17:13:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::22d"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=iX7A4UIL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDvn5Fwgz2xDM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:13:57 +1000 (AEST)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3db16129143so245228b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 00:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724310834; x=1724915634; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CO0xfYDzsVihapVFXw+qMWwHYfpsvq03XEdZOsUU02k=;
        b=iX7A4UILZ23lk9Ov1RyeDs5e36QYJzp0K068J5s77LBmJYboRj4SZxgzVUFhm+Dofu
         psgKkY534ZfkyYg7ZsqxtZaA+/jSntlsA/VjDXz4nTZvmVY3My7HNLysUIEd9DIXDy6a
         wgyXxma6rWeKCS3xajW675e8ke/4y5JjTd1o3d71dkB5TNEPJJsVucppk9vO3bcd+PO1
         pwyVbdwUp4bv3nxcrKe1m/q39QI3BAsvOkO7U8EBQR9yvV9m9VWbKgu/6B8whZCXuryQ
         djKRECoFDQbBc3rPDaWemDu4wZ/wLt+l3BM7syvodf2aGwsRxdts6VH3p5d+ms+ketsV
         Qyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724310834; x=1724915634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CO0xfYDzsVihapVFXw+qMWwHYfpsvq03XEdZOsUU02k=;
        b=VF1Co3tE+WvsTfJUjR65yigLlMPW46p4SHxDxrCTCT8lklvP32j0r5KCVTuEMNrH0c
         kTRlCwAjSjO8W2rrxqT6b6K/QESZ2wo81ZYFBgYpOxOLWkFnjQh2zFcjIMVZQ6oQCJe9
         2lpz+vNsCIL/oG4xcsoIAEFjkvPgSQkriqYNwqoekxJTpbMDMfexk2s+PMZRC7h16JDi
         qLBZbYzJQcRmKE6QAoIu3l6v4UlYIhhPjIX6YrJPOyb1YGMTwQh4nDFQSoKsr0nxqFBo
         GchQ6cJ9LPUJZmrraBKcXVF4OlfXYdqArLQcu+x1CvG5ppsEoJorRehJ3sgC8W4dHjlx
         nNDg==
X-Forwarded-Encrypted: i=1; AJvYcCVbviX+gAX7jXXd82RVyjIGTYaFYU897VGCI4BKhxg+p6Y9XdpZMErnfJCPCWuGtkxElBbExEp58FIloJI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy4PAhneEBwmkIevbqDh7mevbuH/IMSrJmH4NOQxefFWmvdEH5n
	7SyqtIcrMwH5iWBYCdrLLS5IniD3wzDCqD0/i8xaNe6R41nEmX+aO6HJmyisePg=
X-Google-Smtp-Source: AGHT+IHZvtclVw9AATG67WMtfqsJZD4bpWoHNpEdN87kwQejpgQ5CLrsmOGdaNcwygIvYs6P1O1W6A==
X-Received: by 2002:a05:6808:148a:b0:3db:15ed:2a24 with SMTP id 5614622812f47-3de1950bb78mr6135912b6e.24.1724310834483;
        Thu, 22 Aug 2024 00:13:54 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([240e:473:c90:f96:d029:ea8a:4e6d:d272])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac994a3sm695095a12.16.2024.08.22.00.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 00:13:54 -0700 (PDT)
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
Subject: [PATCH v2 01/14] mm: pgtable: introduce pte_offset_map_{ro|rw}_nolock()
Date: Thu, 22 Aug 2024 15:13:16 +0800
Message-Id: <e866151ccd257ca14a9361ba59f8c3086aa76e4f.1724310149.git.zhengqi.arch@bytedance.com>
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
pmdval when successful. This can help the caller recheck *pmd once the PTL
is taken. In some cases, that is, either the mmap_lock for write, or
pte_same() check on contents, is also enough to ensure that the pmd entry
is stable. But in order to prevent the interface from being abused, we
choose to pass in a dummy local variable instead of NULL.

Subsequent commits will convert pte_offset_map_nolock() into the above
two functions one by one, and finally completely delete it.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 Documentation/mm/split_page_table_lock.rst |  7 ++++
 include/linux/mm.h                         |  5 +++
 mm/pgtable-generic.c                       | 43 ++++++++++++++++++++++
 3 files changed, 55 insertions(+)

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
index da29b066495d6..a00cb35ce065f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2954,6 +2954,11 @@ static inline pte_t *pte_offset_map_lock(struct mm_struct *mm, pmd_t *pmd,
 
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
index a78a4adf711ac..9a1666574c959 100644
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
+	BUG_ON(!pmdvalp);
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
@@ -356,6 +383,22 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
  * recheck *pmd once the lock is taken; in practice, no callsite needs that -
  * either the mmap_lock for write, or pte_same() check on contents, is enough.
  *
+ * pte_offset_map_ro_nolock(mm, pmd, addr, ptlp), above, is like
+ * pte_offset_map(); but when successful, it also outputs a pointer to the
+ * spinlock in ptlp - as pte_offset_map_lock() does, but in this case without
+ * locking it.  This helps the caller to avoid a later pte_lockptr(mm, *pmd),
+ * which might by that time act on a changed *pmd: pte_offset_map_ro_nolock()
+ * provides the correct spinlock pointer for the page table that it returns.
+ * For readonly case, the caller does not need to recheck *pmd after the lock is
+ * taken, because the RCU lock will ensure that the PTE page will not be freed.
+ *
+ * pte_offset_map_rw_nolock(mm, pmd, addr, pmdvalp, ptlp), above, is like
+ * pte_offset_map_ro_nolock(); but when successful, it also outputs the
+ * pdmval. For cases where pte or pmd entries may be modified, that is, maywrite
+ * case, this can help the caller recheck *pmd once the lock is taken. In some
+ * cases, that is, either the mmap_lock for write, or pte_same() check on
+ * contents, is also enough to ensure that the pmd entry is stable.
+ *
  * Note that free_pgtables(), used after unmapping detached vmas, or when
  * exiting the whole mm, does not take page table lock before freeing a page
  * table, and may not use RCU at all: "outsiders" like khugepaged should avoid
-- 
2.20.1


