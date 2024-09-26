Return-Path: <linuxppc-dev+bounces-1614-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC83986CCF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 08:48:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDkgp5lshz2yTy;
	Thu, 26 Sep 2024 16:48:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::833"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727333286;
	cv=none; b=CC+hwA+CiOdtMY2oOQ6bg4djcaZh4Awanq/P9XADEDEJnCR/vwDLF2nYlIcABr1JXVK8L6W42vLm2X21s2UGD7Gs1JSUk5P4V35IhuZmrO8nHsiwZRp6luDuUlQIzKmMgZtJs/Mr25crK7LZiuBQpedVgn/SVKWPZ+ysCkWzJojnGjAClZNnVJ7NPEjsO9b8afsXuS0BKC8S/x/TbJa9UhwVTH+AtrnYVos8SHkt5X6unJ5VSGdk6Xu3d1OT/Ec2EaEy1PhqYXwbMOETLSIPd8XPFQWFFUgsn7rG6C/4pbAL8mIs95tMNHQ3Vu86ZgGDLbg/UbeAJXzwChDLx45p8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727333286; c=relaxed/relaxed;
	bh=RsEgu/iD0T6JQDFamAgFHiL1Lm0nKVk+wAfYQhZRThE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hj1CSLbPmktmAzMvL65AbUAb/dFmYAFKj20k9YdSTfFyLp9D3UoFLQKYiHw94ZKJPo60i7+dMJTiJGYyhzZxAq74WisTwQrO4V2X45pYoZS94tBof5EFFDwx18qaza3o2lXLq52VpFzFvZyRMj1y/fEIABSmBtAvtmS7nvFL5+s51AIArqVPw8WHTPd1azgX0ssgBOnGiqASqg2nb/ZwiF8Cmujn/jnrpYDfOKMaot9Mvnw0srhNiPK417yextiyvyC/CJx2YCitoCo0bMfu8R3g/jvwDjhhgJPJlcG6Fx3dNsBl/NjMXpFuKZnS4ccPTsSVORqlvk8XMNoMWMjc9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=h9G5dQ98; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=h9G5dQ98;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDkgp2ZFyz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 16:48:06 +1000 (AEST)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4582a0b438aso4510401cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 23:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727333284; x=1727938084; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsEgu/iD0T6JQDFamAgFHiL1Lm0nKVk+wAfYQhZRThE=;
        b=h9G5dQ98DcIuL4nU0dZVq3beiw110v4EYwUOoWmnZaLRhbU8J4X/xPc5PbdlHPXVF/
         FZkesPvv1senobbAqJb1+mPN4CWtC8l/pAa870VagQCwL8C803Q2DdsaxJWCFunEOm9B
         ODq2bxS6LZC4J/9gzf2C+ryxM/Y+oGDoejLZgEXDunDp9YC35mwMF50d22H6z+DKuk0J
         VjKYtARZHnOMnwLuSXRJdJ8YOZ4JZlGTrPmVHpn00E2h7q+8EvAuGmYjsxSwv5u5D4oS
         T6duigg4yTnFs8X2kruSGMGUx2uytDGsM5KmDFKRwdoHvOGPGCc5oma3Xp17tGMBc7Ot
         CW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333284; x=1727938084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RsEgu/iD0T6JQDFamAgFHiL1Lm0nKVk+wAfYQhZRThE=;
        b=tRruZFO2U6ZcU4NpSfBNec67FM74vclt/TuT7a7iwSbNYx0dlCAnQgA7Pdd8DUNKAO
         0ip/N0wBVM15WSgycc9ZEn9MOPRrrOL5OYY1GOB5DS1nhzmZ8r9+pNd5ARIgHN99yHrS
         lUhp6TM0zCUgYap/VmqBIATgkLsj9DGWjX5+JMmwvz2uPAuaNpCa/IeUjSLUqcHn1tLH
         deOKFgZXKtm9N8LTO2UxyGgzoiDOTQ5v9D1sHWLP7mP3WBApywuGycYDnTK2wYNUR9oO
         sKvohSsSERj7igHl/p2wtzlHvbJv/84xIk/HeXLPwntQkiOm5MGEctQ9P2Yg/o89fBi9
         QyCw==
X-Forwarded-Encrypted: i=1; AJvYcCUCl1FMINw0e1g1lueSMTA0EkJ2wlHFn8meIuX59gf01/Ux5a+/rnkQ1AUuNs0Mk033CgH93pXFwlQH9W8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy/nE97WZbodg43sYgDrlLdqhCQq/KYrY/kniJa9z96EEpLW73K
	RjkdeLMR2LMlQzJ3dGI/Jzhl9vgk2P1iooDuFxP/pqNDWVNK42bz/6iR8EC8y2k=
X-Google-Smtp-Source: AGHT+IGAlBKd7aKCt6XxIcAXM/Sjs0v2+e+7/droKiEQYGe4LhoKPN6bWAepHInU8bkNuwlluGjQYA==
X-Received: by 2002:ac8:7d4c:0:b0:458:4aec:2749 with SMTP id d75a77b69052e-45b5e045e56mr87889061cf.57.1727333284339;
        Wed, 25 Sep 2024 23:48:04 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5257ff1esm23024611cf.38.2024.09.25.23.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:48:03 -0700 (PDT)
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
Subject: [PATCH v5 10/13] mm: page_vma_mapped_walk: map_pte() use pte_offset_map_rw_nolock()
Date: Thu, 26 Sep 2024 14:46:23 +0800
Message-Id: <2620a48f34c9f19864ab0169cdbf253d31a8fcaa.1727332572.git.zhengqi.arch@bytedance.com>
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

In the caller of map_pte(), we may modify the pvmw->pte after acquiring
the pvmw->ptl, so convert it to using pte_offset_map_rw_nolock(). At
this time, the pte_same() check is not performed after the pvmw->ptl held,
so we should get pmdval and do pmd_same() check to ensure the stability of
pvmw->pmd.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/page_vma_mapped.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index ae5cc42aa2087..ab1671e71cb2d 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -13,7 +13,8 @@ static inline bool not_found(struct page_vma_mapped_walk *pvmw)
 	return false;
 }
 
-static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
+static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
+		    spinlock_t **ptlp)
 {
 	pte_t ptent;
 
@@ -25,6 +26,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
 		return !!pvmw->pte;
 	}
 
+again:
 	/*
 	 * It is important to return the ptl corresponding to pte,
 	 * in case *pvmw->pmd changes underneath us; so we need to
@@ -32,8 +34,8 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
 	 * proceeds to loop over next ptes, and finds a match later.
 	 * Though, in most cases, page lock already protects this.
 	 */
-	pvmw->pte = pte_offset_map_nolock(pvmw->vma->vm_mm, pvmw->pmd,
-					  pvmw->address, ptlp);
+	pvmw->pte = pte_offset_map_rw_nolock(pvmw->vma->vm_mm, pvmw->pmd,
+					     pvmw->address, pmdvalp, ptlp);
 	if (!pvmw->pte)
 		return false;
 
@@ -67,8 +69,13 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
 	} else if (!pte_present(ptent)) {
 		return false;
 	}
+	spin_lock(*ptlp);
+	if (unlikely(!pmd_same(*pmdvalp, pmdp_get_lockless(pvmw->pmd)))) {
+		pte_unmap_unlock(pvmw->pte, *ptlp);
+		goto again;
+	}
 	pvmw->ptl = *ptlp;
-	spin_lock(pvmw->ptl);
+
 	return true;
 }
 
@@ -278,7 +285,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			step_forward(pvmw, PMD_SIZE);
 			continue;
 		}
-		if (!map_pte(pvmw, &ptl)) {
+		if (!map_pte(pvmw, &pmde, &ptl)) {
 			if (!pvmw->pte)
 				goto restart;
 			goto next_pte;
@@ -305,8 +312,13 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 		} while (pte_none(ptep_get(pvmw->pte)));
 
 		if (!pvmw->ptl) {
+			spin_lock(ptl);
+			if (unlikely(!pmd_same(pmde, pmdp_get_lockless(pvmw->pmd)))) {
+				pte_unmap_unlock(pvmw->pte, ptl);
+				pvmw->pte = NULL;
+				goto restart;
+			}
 			pvmw->ptl = ptl;
-			spin_lock(pvmw->ptl);
 		}
 		goto this_pte;
 	} while (pvmw->address < end);
-- 
2.20.1


