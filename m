Return-Path: <linuxppc-dev+bounces-276-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDE79597F3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:43:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wpjc118ckz2yVF;
	Wed, 21 Aug 2024 20:43:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::531"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=chMYZpW8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpfRY3Qxnz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 18:20:57 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7a18ba4143bso4178394a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 01:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724228455; x=1724833255; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpkIwk88smkdA0CmKwnRaaffLUYg3/8r+GLLHrp0y28=;
        b=chMYZpW8PqTbTfqWtrKBS1Id3jbOpkk+N8kHcZptNEEJA7ALYWnAfxGXoaAXYWmLE/
         zLpGWOXBdosJZQ37va1w8h0XmyMeLDTPiRgUhcabgwPrZD+wzZJeFt/Y81gpwZ80IING
         NIaxjlliVqX127zoPtrYqzQil37A+/j4dBLQx8vxVKjFra2vKAz45uo7Sz8qcF5PXn7c
         AMtrX1QzanGNoNTCMP3x026bJZiAT87dFwDLNzS1ds86mv1IItPw8YMheiyOpmBVZeW5
         OA99jEhZqY7qQbPzMMNm3PPcYorzKd1Go2BhW26r4Skj13a2dMdiCuGYWW0ivLcNNv/X
         l37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724228455; x=1724833255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpkIwk88smkdA0CmKwnRaaffLUYg3/8r+GLLHrp0y28=;
        b=YY3lSRBc+Pi4HQ4pec7/kce2+lpH7w4XTYgpQmHyv1YTWs9iqev6Q15N8zbPqQsSmX
         fyjzY8BjTTJKW23zUn/0zIVHgN1VrLcfjvHoWX2tdwZK42CmJvBOCngwIx5r4BXgQB1W
         /ShEtAFcdCXGGBnuqVhCMf3d2bewO+y8hHCmWi+xFsnB5kOAvGJP8/qMY319Hi1kavQV
         y5Tvy3HOnb5a4wk2fphxSTtaa2MSWknd8Z/RlI7gcAJ+2w7ez4Wmhjj181aJWi5BhB2s
         WKwnoRE4VaX0t0WjweB5U0nYYUfQ+rKHbFo8HFFb9LUNjpjiE3DksPmyUTayXeXO/n4C
         drAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZorhOjocDwkoeUZDGRU7p8DoY4rwg/k0OeQeYHMQnxgRFcI6nsParROGVzGm4Y9LEoRYA3h2Shx6gbMI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyxGg+VT4qg2RhVhD7PGwNmSOZMP7ABTGVOAGFHWTnh2JdjTM07
	i7+aFKC3EQQk+MrCDeK6fjv52XvtA5vND9TIIUpEpqwAC655I9RGPa179zRqVVo=
X-Google-Smtp-Source: AGHT+IGrVkekNFESU70hIpUuBMPasbPeBaSvK0LFz7NLCJlpTpTqHUrWHKc0kKTsT//aSMihe2hbaA==
X-Received: by 2002:a05:6a20:ce47:b0:1c4:a49b:403 with SMTP id adf61e73a8af0-1cad81a4248mr2186429637.46.1724228454750;
        Wed, 21 Aug 2024 01:20:54 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb9049b0sm1091453a91.17.2024.08.21.01.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:20:54 -0700 (PDT)
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
Subject: [PATCH 13/14] mm: pgtable: remove pte_offset_map_nolock()
Date: Wed, 21 Aug 2024 16:18:56 +0800
Message-Id: <129f11e3434c5af898096c1cf3fe378f50bc94b3.1724226076.git.zhengqi.arch@bytedance.com>
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

Now no users are using the pte_offset_map_nolock(), remove it.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 Documentation/mm/split_page_table_lock.rst |  3 ---
 include/linux/mm.h                         |  2 --
 mm/pgtable-generic.c                       | 21 ---------------------
 3 files changed, 26 deletions(-)

diff --git a/Documentation/mm/split_page_table_lock.rst b/Documentation/mm/split_page_table_lock.rst
index f54f717ae8bdf..596b425fb28e6 100644
--- a/Documentation/mm/split_page_table_lock.rst
+++ b/Documentation/mm/split_page_table_lock.rst
@@ -16,9 +16,6 @@ There are helpers to lock/unlock a table and other accessor functions:
  - pte_offset_map_lock()
 	maps PTE and takes PTE table lock, returns pointer to PTE with
 	pointer to its PTE table lock, or returns NULL if no PTE table;
- - pte_offset_map_nolock()
-	maps PTE, returns pointer to PTE with pointer to its PTE table
-	lock (not taken), or returns NULL if no PTE table;
  - pte_offset_map_readonly_nolock()
 	maps PTE, returns pointer to PTE with pointer to its PTE table
 	lock (not taken), or returns NULL if no PTE table;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1fe0ceabcaf39..f7c207c3ab701 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2952,8 +2952,6 @@ static inline pte_t *pte_offset_map_lock(struct mm_struct *mm, pmd_t *pmd,
 	return pte;
 }
 
-pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
-			unsigned long addr, spinlock_t **ptlp);
 pte_t *pte_offset_map_readonly_nolock(struct mm_struct *mm, pmd_t *pmd,
 				      unsigned long addr, spinlock_t **ptlp);
 pte_t *pte_offset_map_maywrite_nolock(struct mm_struct *mm, pmd_t *pmd,
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 29d1fd6fd2963..9ba2e423bdb41 100644
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
 pte_t *pte_offset_map_readonly_nolock(struct mm_struct *mm, pmd_t *pmd,
 				      unsigned long addr, spinlock_t **ptlp)
 {
@@ -374,15 +362,6 @@ pte_t *pte_offset_map_maywrite_nolock(struct mm_struct *mm, pmd_t *pmd,
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
  * pte_offset_map_readonly_nolock(mm, pmd, addr, ptlp), above, is like
  * pte_offset_map(); but when successful, it also outputs a pointer to the
  * spinlock in ptlp - as pte_offset_map_lock() does, but in this case without
-- 
2.20.1


