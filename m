Return-Path: <linuxppc-dev+bounces-967-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A80EE96B52C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 10:42:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzGFc4HJ9z2yZS;
	Wed,  4 Sep 2024 18:42:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725439332;
	cv=none; b=Y1iXrO8uy7cmGv2IlREW12vR3jWoE0RS8NWoPpFSItal47sgxi/xWyWwgtMfi4Ji051UvOn1Eh/AscxUOx60Y//g7m2eJC9NNW6oH//zU+yPzY5gf33R4KypySkS57QlJO/8xLfk3qVhd7d/tmZwSLYI9NLxBmKjCQvf8JuxgbJMrRrufA4dQC/YYqSwX+7rWIlM/QzzwuFFOWt+kuqgwLywL9Cy91Gwg4KcntyFbtWHKJltMn9exB9CjkQaaLjtkFxEK3ZKwyFAdXZq5ifVgR1F5KCCynyN6tl45zWugc7Yni4ZIZELubsgCVL2FD0es5/OHX5UEcaR/zLTvlhxCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725439332; c=relaxed/relaxed;
	bh=TUS6V5hps9BhpBteFi/blbp/e+0aHtnhPyo5Zqj4Bag=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version; b=HQs47CjHkBKeQFsW2UBuvYp8CiGVcXgUUNdLJDfsKQaRTXz3Lmk3qgrgpMTokMUdVKmZLEN4mpB9wvhRtcM5KU+praM+1LVQFNBb+i2hrtZYTGYlcrLnyPcAjcrEaeKXtGCKD5xcMYVkmYIMimxvT4ZB0CPNzySjpdA927XCvVJGuVGnPkJsQ/QA3dhSBjMj93tenX7OukYZWACVFnjVM8IIZJgTykplkLe7eNN3gUFdfhQiw+u7k3SmP+8+T2TnZJfRghtLzAos69+mxSvpHTuTWA2LCOJtNRCHuwZxyy+Zh5N82n8RJqlVA/DGI4NQhGfR/fzcLUjUva4PS+xQsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ScginwWE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ScginwWE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzGFc1z7fz2yR9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 18:42:12 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20573eb852aso3457795ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 01:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725439330; x=1726044130; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUS6V5hps9BhpBteFi/blbp/e+0aHtnhPyo5Zqj4Bag=;
        b=ScginwWEDXB2qe6tqKlRVJPFZGF4sMGAd3xBDsmZAslhW2gmMYfGMMRmMvU1IOS9IH
         dbSbmcw2aKZep4jXgPVyTA7SKzKy9GVlgNJpEG7YmUd+7gKovI+QKpg+H0q6qg0Do5hB
         jn1Ni0Gxhjk9CaKji/L3ctSSixmNQi4kJOxumhyor88W8R+nHojJLXNwMojNIUeRrAvV
         pciTKeOY6358Kb53Upp7SuixZZGxbQAHWJwiyV2yc9OgepY7ZnhbtsHg67fuqob4Qiif
         NZPcIld7NK6DvzZPJbFFFBt7VP3j+1PuBM7IwtVNADGHHMt0QaBSeenfLdFMfZsu/dVK
         qk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439330; x=1726044130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUS6V5hps9BhpBteFi/blbp/e+0aHtnhPyo5Zqj4Bag=;
        b=iQINWn3iOmGxJ/1YypgRve0KoIwrjZrVlCbky/3lmEtMV5KRTkhh5muNs08JyT6b09
         8rEkCs80dHZWNZNBsUdIalJY8H0eInP3xYBZKauwztgUG/Xy6h2g4eUrwHLOtPnCgOLm
         jrtEA07BxowQnZBFmpRMTULToNqRRo2JFEoG//qfhViVR77mpbZaHlBv6dOG+EulE0Y3
         sT49rRCifoxt+Bnwqy0M/23X4fGJqVdxpfXbU9M/9KW77WPn5+nRfo1KvTy2Bea0AatR
         ulb/XMM7tkTp8oJUql8gjSzoX9gAiG8f97bLV6W44U6vAPfFyFSU2BZSTYHZeRg85seC
         mZYw==
X-Forwarded-Encrypted: i=1; AJvYcCWbSp5mDoBk5w6r82zehrHaTN1ilnN4OwLqeIrk+pch+cne9dwXuRJ9S1iYRyaJMLq6WWlsrSBbjzcHV2E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw6rYDMIu6X3NVl5Yfw7l1CG441AtniqkMuxqvHu5RIEMg4a/Cu
	SCNAkYfzsi8+YKTRbPu2nGI3sao+AYV4e/mxG7Kt7iGYlkoBApEyisI8Cz393Ag=
X-Google-Smtp-Source: AGHT+IHV13v46mfi8eJv03VSK3v4h4kaXbg2iDfLcHBwpuweJiwY6TIZiDRC9qw17xCxMuqJ20qctg==
X-Received: by 2002:a17:902:ecc9:b0:1fb:7654:4a40 with SMTP id d9443c01a7336-206b833e006mr24427095ad.14.1725439329649;
        Wed, 04 Sep 2024 01:42:09 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae95a51csm9414045ad.117.2024.09.04.01.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 01:42:09 -0700 (PDT)
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
Subject: [PATCH v3 13/14] mm: pgtable: remove pte_offset_map_nolock()
Date: Wed,  4 Sep 2024 16:40:21 +0800
Message-Id: <20240904084022.32728-14-zhengqi.arch@bytedance.com>
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
index 1fde9242231c9..5b5a774902bd6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3004,8 +3004,6 @@ static inline pte_t *pte_offset_map_lock(struct mm_struct *mm, pmd_t *pmd,
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


