Return-Path: <linuxppc-dev+bounces-1605-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C471986CBF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 08:47:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDkfW41Fmz2yVM;
	Thu, 26 Sep 2024 16:46:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::732"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727333219;
	cv=none; b=F5nt5kRqS2m5X0o25w8TvgWwDWRLBVvWeCuSL0RDb8YygwTAnxg5To3hU5RsQcKl7+0apz3nd4f5f0ZwjhsvGqU4RznFzplo1dbvW4EJ8CJdNrXNIfxu4Qh41TPE/g7IK/CzOe2QE16CpgBaLIJq4mZs2mvB8akXH64QKKVfSG2jYV++XV5RlPhNEBuzFlT8bmERc9vQnUlUP3KPj1HEABHX8V2w4/EDs2SEEL5O4DlzRmgbCUVjaCHhdHiwvdg5drmAsO9/6lwdmAoXmrupKQg+14XqXbronEGhAxzUU/gROy4x//QZmng/ZS9rb+uOcfuZGMkH6Ai7dEZNTtHXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727333219; c=relaxed/relaxed;
	bh=VEMasL/thV9Tj1Tfta4uIol3BYRuzPr3NckO1OF+52k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l+tAuu3FiPM/vXx7EiYSAcIdB5cId+vDdo+G+2GyYCARR/gNYD+zO6IT9lD6dg5TiS+s05CeIS3+HRJKfjYqt/mrTOOaAjf/LcLEWD5EONIwc2qeYmNcCPlSsS1gBFRJXWEzAe2I4+0qMWqUEtcgNQOmiU6zpq9pxwuxpLJY2t7WINu9dNTAsZrMATO9tyotNoxAx69shn97ItUMTsZGDYCtpu/MROTdMEPQD4drdbWpe/Q9wjYHfdQF2swdcMI5OWRpQR8TBVHMwKftR1BA6N5lISwY4fK+RRC1VX9WGi2fi3dHN9eayv4a5gkWMp2g1DC+LiJixo72t09fEx18VQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gXAsE39G; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gXAsE39G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDkfW1CvFz2yGL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 16:46:59 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7acd7d9dbefso65413985a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 23:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727333216; x=1727938016; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEMasL/thV9Tj1Tfta4uIol3BYRuzPr3NckO1OF+52k=;
        b=gXAsE39GROAUw0VnmImtgD3VQeTynvT9qxeI69S/HPeh9Cjrulo2uBFVtFA3L5FIPC
         tR2JA7ILpaslF2yIfHEZy26zZiqJYHS4pnQ7eJlCBS167fGNuytZaj+pwcJWrzvUv7OP
         VxB5Y4Ltig8cJ/i5Jxkt3pFIkpmsPzcjBm/JtNl8Xcu2kEXRKT0hwbrfCJhzQNYhGO/q
         xeXTfzb8Pnc5CuNLCEeqzM70bY54UUrAYD4bBXkqwoWsgel8xG6oMXhcRBI5r0oqok82
         cI6DVKgHjKio5nwqzuCa12CEGRgaHK283NvDB65h29pPpuaXcxFZ+ly8FnQ6FuhnZjA5
         Ou7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333216; x=1727938016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEMasL/thV9Tj1Tfta4uIol3BYRuzPr3NckO1OF+52k=;
        b=n7/ra0y2IdXcRQGRyWn4E7MKDgqSPUiwPJGDKXdxLGJESJdMPfqHaFtf0TDfTyrOta
         VQUpVjXsWaz9gqdttmISvAF/GEAFs8Apl2dJugZLV73vkEJioc9mBwbZ5laXrWzy5Mxm
         KsVsEZk/3iuWH/P0NZC4sgtIRS6VzPaDJ5z6cRHEayyX0fMcJNghWyEBHdEn4W3v5EIY
         HlSMeLq8EEBPOe/drCEpm44bXKErnmKJSWgdWiGYnh3qjCRW7qdC8Cg1MaU4sv/NG1v3
         8fpPJO7QuYutIM/Su6J/Z00wJkH2Q8P+gi+SBrkQdeps3d8UHg9ikVfWjgjv5S9PE2T2
         JUJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyMuyN90SKOWbyP5cFo++5kZ5KKAeXaCGDFc+ITBArcdl+BMrfC0osn6kJzmuGoaYSfy4/+Y9DF8idHyI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwoS9233G98sc/OLERzEitp535Xs6OdNklYcDPL7bz7ETfyj07L
	gPGFHjvz3OsP4J1Z1X8abAGdxcjFRgw3jf9IfGrMlwaVhiXbN2g/1Pc9cTQvVsw=
X-Google-Smtp-Source: AGHT+IFdBHDg/pcI8fYkiDBKrKz5/bcsNyjF/Vh4ia+kT/ICQCu69/2acL+Eh3ZQbIhYSZdsv978Jw==
X-Received: by 2002:a05:622a:20b:b0:458:4b6b:ff16 with SMTP id d75a77b69052e-45b5def4888mr86143491cf.32.1727333215740;
        Wed, 25 Sep 2024 23:46:55 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5257ff1esm23024611cf.38.2024.09.25.23.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:46:55 -0700 (PDT)
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
Subject: [PATCH v5 01/13] mm: pgtable: introduce pte_offset_map_{ro|rw}_nolock()
Date: Thu, 26 Sep 2024 14:46:14 +0800
Message-Id: <5aeecfa131600a454b1f3a038a1a54282ca3b856.1727332572.git.zhengqi.arch@bytedance.com>
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
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Acked-by: David Hildenbrand <david@redhat.com>
---
 Documentation/mm/split_page_table_lock.rst |  7 ++++
 include/linux/mm.h                         |  5 +++
 mm/pgtable-generic.c                       | 48 ++++++++++++++++++++++
 3 files changed, 60 insertions(+)

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
index e9077ab169723..46828b9a74f2c 100644
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
index a78a4adf711ac..daa08b91ab6b2 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -317,6 +317,31 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
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
+	pte_t *pte;
+
+	VM_WARN_ON_ONCE(!pmdvalp);
+	pte = __pte_offset_map(pmd, addr, pmdvalp);
+	if (likely(pte))
+		*ptlp = pte_lockptr(mm, pmdvalp);
+	return pte;
+}
+
 /*
  * pte_offset_map_lock(mm, pmd, addr, ptlp), and its internal implementation
  * __pte_offset_map_lock() below, is usually called with the pmd pointer for
@@ -356,6 +381,29 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
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


