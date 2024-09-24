Return-Path: <linuxppc-dev+bounces-1551-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F96D983CC4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 08:12:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCTyt5qpmz2yQj;
	Tue, 24 Sep 2024 16:11:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727158310;
	cv=none; b=iS5Z5a69aA7FtOIBeFYKd3Nsvc2DX6sOXUgl9B6PhxdohBCks7aEvmnHePJ7FAnU6Iy/M5WJAhoQimePE4eMgHRvlJ/gvWM2aV9Xq0r+ax08mUqGZSQ3EO3TtGyhvVP4LXJz5U9NWIi2p7s3p+uP9n1EAsR6CqQs6l0Z8dEK1pp8+NWO+A9zfLnB4x5gOXSfi7ixIoYz7Gxj/3ISk5eqQHslGZDWK5PUoi8Skace4t17VEPFK9sUg9ymgbDJaNDD+4S6PVReyWZIonjWkytAEKb6KxfLdUkp/7+LSOG+zae2Fu+1df3bYtoBrdubJD/D5KpfgkAmIA1OVTT/7bJzww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727158310; c=relaxed/relaxed;
	bh=e0T9lvI1pcCPfr6v8oRbivQAnqkZ5MJutHJ+/bNj+/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OzD0/5zeaR2BcmO4kutbjuHqHfdKo6CXe9G7IkHd7511dGOXtyarZU34KJ/hfN/Xr/xDteFh7zzHBgVz6Ya02EWyFJyjGGtxGmceo6QMi79KjXnu219RSFgfQitGmZfWURzhhH9pTULZjzEv2qNb2B7zK9KkMdQ0RaJHlFbR7WWeSBBVXjJeg0XJuA77ViVfAWaCeZci+7BPonnn9M7mUpV2SjjxciBE+Ynaoz0snsuNCmKJsNStACLQnPvnQ5vwA0bfDhR55IAXj/vPwZPyxU1fyY2xlCIUUPasRNaHSmdxaiD2EQFbVMiAVN8nOZaqYj7QKmmjPZl5KHrkFVWTig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LchjqvWa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LchjqvWa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCTyt3XZgz2y8X
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 16:11:50 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-206bd1c6ccdso48966775ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 23:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727158309; x=1727763109; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0T9lvI1pcCPfr6v8oRbivQAnqkZ5MJutHJ+/bNj+/g=;
        b=LchjqvWaWM/STtAKIx3Z3Aicx0muPkG0OAIAGajUjIxtCTzrls5WcSJUEDpiQ4LLtl
         3VGTIh5N82bh2H4thVMyhrBysIqlhd6Q41SB//r16wXr2ce1sR1hYMBHWlAJJYgPwjc5
         YEuvVkX4YYcRP6ht7s1IqPwWTqAb7gdat3cAuSXc/2xy5us00vkXQ7DqIyuB0LIdRfqA
         51OW0WICQHVX7t1dfz1Pd+RRB8G7jtGK/cPVj03YK38vwdlvgXTJzFGolVxtZAdRIwXH
         tCNgnlJB+I5geK9pMybXqatLFh+sXY25I8Rg7Le/Nm2aOvkRrHszcbP7jg89WMSX9YXK
         mIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727158309; x=1727763109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0T9lvI1pcCPfr6v8oRbivQAnqkZ5MJutHJ+/bNj+/g=;
        b=wNj8bQBkuAse4vhl452Nfa8HdasjT5uK1upUYM4Y8R+hzrQa+C0jI+PXoyd5p/pHtJ
         pKjyaAnL2VOeKhUOK7pLiGtDp/xZ02XYUjkruKIdrUaxnnGGn7kKP/DNxsVTOelh6bMf
         n40+QVQwZQlHcbQNRIQOR/2quVngtpAf0q+uGn7NkEWiV8ngkIC4s0vAalX8Bjf0OaUW
         ZjHkrRk+0A1Cmvj0VFBTpVFG4MNc+TbQu5Xt58e8iaLUCsgqVjl9RLvGktPmWYfYfDeW
         0ijQPSS5TOPEeDG7kIEBsm8hWEgN/aMPyzHIIdlvRBpoOOzV2TvHjRBTO+j0EAh7mTHr
         PAdw==
X-Forwarded-Encrypted: i=1; AJvYcCWUpOMwRe2sLxpPPBMcg4p9QqmQipdYUYjXuFdPflThjMFGqsbNg5dZDk6QR+j2YtksiLEk5YqNmDOyA6A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzJpQSV5slnSR97hDIfbT0IncrlCgU2eTg6ot/LdAh8JRC/u2mn
	cZe+0G0s07WanFkKsRGYVb2EIyfbqy4W6rZGsRTLUnTxL/8Q9xl32s1D5VCOixA=
X-Google-Smtp-Source: AGHT+IGkJQOlzg3g752NhI9RquMqodCfvTZ7obYXRPzPmN4sDO5P6Za1vWoZJJ9nTCdoHXRNF+rvtA==
X-Received: by 2002:a17:902:ec8a:b0:202:311c:1a59 with SMTP id d9443c01a7336-208d83b6ce8mr195135205ad.27.1727158308785;
        Mon, 23 Sep 2024 23:11:48 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17229c9sm4344885ad.85.2024.09.23.23.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 23:11:48 -0700 (PDT)
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
Subject: [PATCH v4 13/13] mm: pgtable: remove pte_offset_map_nolock()
Date: Tue, 24 Sep 2024 14:10:05 +0800
Message-Id: <8eb7fcecf9ed8268980d0bd040c0a4f349cbca8f.1727148662.git.zhengqi.arch@bytedance.com>
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

Now no users are using the pte_offset_map_nolock(), remove it.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
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
index 9a4550cd830c9..e2a4502ab019b 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3015,8 +3015,6 @@ static inline pte_t *pte_offset_map_lock(struct mm_struct *mm, pmd_t *pmd,
 	return pte;
 }
 
-pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
-			unsigned long addr, spinlock_t **ptlp);
 pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
 				unsigned long addr, spinlock_t **ptlp);
 pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 262b7065a5a2e..c68aa655b7872 100644
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
  * pte_offset_map_ro_nolock(mm, pmd, addr, ptlp), above, is like pte_offset_map();
  * but when successful, it also outputs a pointer to the spinlock in ptlp - as
  * pte_offset_map_lock() does, but in this case without locking it.  This helps
-- 
2.20.1


