Return-Path: <linuxppc-dev+bounces-329-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C0F95AEBF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:17:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDxC13k0z2ywh;
	Thu, 22 Aug 2024 17:15:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ZvtQBeIA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDxB5ftWz2ywR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:15:10 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7142448aaf9so338316b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 00:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724310908; x=1724915708; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XLeH1tU+payUby5GohREupClIvRGZdbeLsp/8eA5FY=;
        b=ZvtQBeIAYrrR2IbbELeSuHKFoym6qJ2jyqz2VVi5UmGhTCHUKIkaqhSuZNEANQt7FA
         y8sSSZdx8hTJKRNX2yNJ1MBIEgl6hRMlg9rWjqHC6hcfD68+huo11vv6Y+1hA2NhzhIM
         R0c24o8cP+MlxikeQYwZ5+xBc5eHORMYXqsMDg/y0hukdFx3TrIYwDlMrmZ50AJAEfBn
         /l/3v5L+H8YfjFEQpRYpo+LBxpI4edYCAQr0NkppDUTb7SL7uSZQ+URY93VLENr0p6+o
         cwmxJmgq/i6cFruqUi3Nccibaya0OHp85rbYrMhTQLYkG9nFuiyiSeTYAWSuk7nmxYq+
         SPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724310908; x=1724915708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XLeH1tU+payUby5GohREupClIvRGZdbeLsp/8eA5FY=;
        b=pDxUJErllgs3hMAoSci5ZjNdgwyJe8uEvTELvrPkdVFDQUCANGEQT80aQs7z00A424
         FNqcenZV8/lLy2WKGTFbRZzb1mnKhlGW6sFS0yOf1gVj7mpJMOZwsQR1kwO3ovDNd7Ji
         dupL4kUZNA45cWUYjUCqpfsj5EPn2IoCebmcTZWi0M8+XFBCGDz8KcqNYUBAl9o+b/Qb
         PV4HvkVE8ZT5VRvon+DdRe7NBG7sMhPD8ZBc6BQE6+i4IBISo5HEO08iMX3hsahG2mbz
         J5jIiD7DOnPo47s41Idg0ZW8hAdBRi5lydgOyaAUI1AVW4lfzpB9lpEnGzyoHecB7nD5
         pmmw==
X-Forwarded-Encrypted: i=1; AJvYcCXTxFpvlP0Z6J+xj5jnkKXJ1Up2IY6aw6MMhaYCYU4IYEo7ZIq9QygektJlr1oe0MoYdHHrTsLJzmus8uE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw1x45HFBguqlPqIP3CHUmhT2k2GbX9G3C9GN8lwKs4fbKtwjPr
	8J1OBALU89MYMPSjIJ3fvXMIjQmC4BgHo4adCbcuxKOeLG1fv90dU5yxxiNGD9I=
X-Google-Smtp-Source: AGHT+IGjO58kdb6JjGpOfA0UnXFn2ByeOkp/uIZzxQt7YtlV+9PVIdBNBOEj4fOrvZDCpXHiWUn49Q==
X-Received: by 2002:aa7:8244:0:b0:710:d294:a2b with SMTP id d2e1a72fcca58-7143176773amr3032765b3a.8.1724310908168;
        Thu, 22 Aug 2024 00:15:08 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([240e:473:c90:f96:d029:ea8a:4e6d:d272])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac994a3sm695095a12.16.2024.08.22.00.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 00:15:07 -0700 (PDT)
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
Subject: [PATCH v2 14/14] mm: khugepaged: retract_page_tables() use pte_offset_map_rw_nolock()
Date: Thu, 22 Aug 2024 15:13:29 +0800
Message-Id: <fa0f9e54339a6966c346ca97a83656a72580cdad.1724310149.git.zhengqi.arch@bytedance.com>
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

In retract_page_tables(), we may modify the pmd entry after acquiring the
pml and ptl, so we should also check whether the pmd entry is stable.
Using pte_offset_map_rw_nolock() + pmd_same() to do it.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/khugepaged.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 15d3f7f3c65f2..799412041d262 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1723,6 +1723,7 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 		spinlock_t *pml;
 		spinlock_t *ptl;
 		bool skipped_uffd = false;
+		pte_t *pte;
 
 		/*
 		 * Check vma->anon_vma to exclude MAP_PRIVATE mappings that
@@ -1758,11 +1759,25 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 					addr, addr + HPAGE_PMD_SIZE);
 		mmu_notifier_invalidate_range_start(&range);
 
+		pte = pte_offset_map_rw_nolock(mm, pmd, addr, &pgt_pmd, &ptl);
+		if (!pte) {
+			mmu_notifier_invalidate_range_end(&range);
+			continue;
+		}
+
 		pml = pmd_lock(mm, pmd);
-		ptl = pte_lockptr(mm, pmd);
 		if (ptl != pml)
 			spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
 
+		if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd)))) {
+			pte_unmap_unlock(pte, ptl);
+			if (ptl != pml)
+				spin_unlock(pml);
+			mmu_notifier_invalidate_range_end(&range);
+			continue;
+		}
+		pte_unmap(pte);
+
 		/*
 		 * Huge page lock is still held, so normally the page table
 		 * must remain empty; and we have already skipped anon_vma
-- 
2.20.1


