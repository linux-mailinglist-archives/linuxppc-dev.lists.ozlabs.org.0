Return-Path: <linuxppc-dev+bounces-1617-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A18986CD4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 08:48:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDkhF5fVDz2yVV;
	Thu, 26 Sep 2024 16:48:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::829"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727333309;
	cv=none; b=cw0yQJ5oYNexvsRViZGypWpQvXFHIJg9twk+g96p9BOTMC1NRDx+V4HqTwN+BT4rEA2h20t+rrIa4YKABHQbpXHv7D76QDnHjVWaZATGLHNnSTOzf5vyxnecsufkWiv9mOEJaviJnZFaTlKbJiW7gaaz92ANfQz1zbXVnxqohYzsHqEkF7Zt1RZXMrSLmtdeuM3gzquRLtUtsLcMeEDD8reaR3XZmlXVvfPs47KpUOB/zqL4WkkK5NH3Jyo4JxhN5MwsuJcLVpwg8576nHcImdJTSLxIhzAlJrMNxYfqYc4V6033p/BOU/5SXN/Ac1zkz/gPHhuCKhaoxA0Vb6IIcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727333309; c=relaxed/relaxed;
	bh=XK9xLAd1aeWWLl9nHV9gcamA18VQvE5iTgorpb3Ql3Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bdOJ6s4W0Qvj4e7k3X9U1PZZswo4bC+GuJqnAiwWDIV9BkbPgmbPIU4VmVk8t3Iqs27c88hZyb5WDTbRhyFnQONrrkI6jaoIZgX5JcwLcnh1pjFPxW6UcbzcqowJN0cs3b5q1MWrVfT2MAgjkryaN5uG2yz605DjKgis1/YMgLGDerqv1niD5OHxkmO3Ipl1ZYudfVm6k9HaJ9bHacs8DSfhXSMuTBT3IX7vo1y7c0C8kuCsnhtQGU0S675UjIwlRcpHOdf7PCXsDtwjOINTaoACVUmtQ/xsXJVF42q/6MUYkYHCHzD2d+wOH17LtJYfZpUK59woy2wKwg+p8TUldw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=iMWKA+ge; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=iMWKA+ge;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDkhF2SLVz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 16:48:29 +1000 (AEST)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4585e25f42bso4782261cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 23:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727333307; x=1727938107; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XK9xLAd1aeWWLl9nHV9gcamA18VQvE5iTgorpb3Ql3Q=;
        b=iMWKA+geurTeDk5ddTenVfFCO4w/btjar5fuHE4BFKuu/wddXNpknP/QDc+0yo9IqL
         XHPjuSVG9Qbam80nHZ6It+dKYmN8QcmEdY072/7HwJ8ro0HsBTlLagWDnPg86uOnRIb7
         qcJstgs82tpFCEqjfFcuFFhituDwbAzFonmiS4DCSoS3hbJsoUG32KGJmaCcT3fcR/+n
         Ar4k97/3hh8BoESPAP46ONZsOzhlpj+alznk2O8Oz/kCDkdIjb1H0urgN1QaS65k2R7n
         NwNNbAl5aqj/+g/tvaDiKYO43JRSd/+t1FTrhEcRKjhZst8JuJSJBwX9zVtpqXw5Q4eT
         UojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333307; x=1727938107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XK9xLAd1aeWWLl9nHV9gcamA18VQvE5iTgorpb3Ql3Q=;
        b=hghly2QXxvPAa38ZwAaNhlxYJP29qyeKg1wV2WtsTcnQTjAIMzHUbhRLoYzsUnifBW
         FZsjbwqMY+XxRjQ9Wi2FiKca9bfjmWRLarc3ZCh6ZpR/YkghpW70cIoBh6I1/fV4OGcR
         gZR6wWm4dyK5LxNL5KUX+asoTbFD2UED5aHoVHQKYf5Ruquv43RCb9yoP0XPvdUxjqz6
         DILcijl09/T4dxbGsOLUFkXZMo3i7404GWJKVbFshzbjQk9T2tZxMMKJsQfeHQ/yEj0U
         JWs4katvAndtlLkbGVztxLPMb+XiEAYTYDxc8GWyNMyGtUBWEkALfeXk5f52FfVqvNCb
         mwsg==
X-Forwarded-Encrypted: i=1; AJvYcCVDi84cDlgW03dw5oqUFhccQU2iSX28OaB7JlGINZUjA8Vmub01ZpPlpJ/uhoUKKA8n7QfegXc2RXARmQo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyQuKoZe5Uj6kHkQAPYWVHXKNGJnzd8JsVh3Kt0zau3AntiRdBY
	vxLAUCU/pUmBWKqxtpWkZQERaTbUtp9WBZhYFgZr8XIAxUdI9OmE6aSOteXaKzc=
X-Google-Smtp-Source: AGHT+IHnYRThLjQtuqQ25g++f96or6jGXpOGKBOHjBYtOEzyfC2Zv3m6NDV/6g7eYEpePNjEvQY05w==
X-Received: by 2002:a05:622a:2996:b0:458:37c6:46fa with SMTP id d75a77b69052e-45b5def2036mr66535021cf.28.1727333307294;
        Wed, 25 Sep 2024 23:48:27 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5257ff1esm23024611cf.38.2024.09.25.23.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:48:26 -0700 (PDT)
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
Subject: [PATCH v5 13/13] mm: pgtable: remove pte_offset_map_nolock()
Date: Thu, 26 Sep 2024 14:46:26 +0800
Message-Id: <d04f9bbbcde048fb6ffa6f2bdbc6f9b22d5286f9.1727332572.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1727332572.git.zhengqi.arch@bytedance.com>
References: <cover.1727332572.git.zhengqi.arch@bytedance.com>
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
Acked-by: David Hildenbrand <david@redhat.com>
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
index 46828b9a74f2c..60a55b28cf679 100644
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
index daa08b91ab6b2..5297dcc38c37a 100644
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
@@ -372,15 +360,6 @@ pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
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


