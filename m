Return-Path: <linuxppc-dev+bounces-1545-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 181FF983CBA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 08:11:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCTyB0q2wz2yS0;
	Tue, 24 Sep 2024 16:11:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727158274;
	cv=none; b=DXX9MYDUUTAsaRRQne5KVibsJpaYFD1FRfK1e6t3LR7G6Dot93HOdlkOjrp6F8cdVlWQ5qnc4/wpKnsoCxZEC9U4J7I5PWLaUczVZIb0Q2NM4V4PiW0mObAdTKhAk21iG5mLu43nptwBEqFwVyi3LvHQaX3MDRpa8sfruXz4UcDhNeammCvEgDcA3S+onYcOy+PpUgDXCP1DoWWvVy77MlwU8yE/k2J2/Rw8rjDifJRvCC9FSgnWGLiQQfK6fqXHoc77jwh04kBNQUwdTIG5/DcbGigsUvVUaKa/wa7UTrDjFg88DWRJEDv7a6pZwsSRXNHx4bzqwvwE3mUQXqx1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727158274; c=relaxed/relaxed;
	bh=dtqkBA88kwvMRDkdpXIuTPjK06Yw44S9bnA3B3TRVKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YdEH+4PoyvkQDT+wDLcs0fkGu0MrDRRFtU53FmGS0f0/UrUQqY2+Nj/Dh0A31X1nMW6Vk9NlV7dRlgsMCwBcmxJsO/0daC9eI0H4Kkjb2N0vNLvJpcA0pdXn/J9V8wExkikQnsYi/d4NXM4OWq59I+B9b75rLvXsU2jdWEslu8HjZDL9fPuTm1hFO2cxQ4DMhnxEvq841sohKYCXNR0mDOFr62dUq8DRYgQGDNKGNbOuFrc+Ma9nZcMGEfcRFeFL0mmKTfg3ZrzRF7kvJyY2IusOm5E2pztfbtOBceKnsuug85h6BHLBXa94zvs3jfXbzV5ABaJ4xBLvf/AyGf3ZyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=U70qopK2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=U70qopK2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCTy95kBsz2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 16:11:13 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-206e614953aso49438475ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 23:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727158272; x=1727763072; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtqkBA88kwvMRDkdpXIuTPjK06Yw44S9bnA3B3TRVKU=;
        b=U70qopK2jz040D576+8wlMjBrnGImjO8EsWB44PkcsYgyFIyGUpWtoH7PTBU1V4jN7
         HZX6SNs/miDdmj6YWgWPEsbMZhjVhTlrTfX7xqA2jCWTC2up8R6p2DZVLmVCGtfm4zWi
         nJPlVsb5IU/vFFy0EiFWaZaKL9J5serhL+9m3jzDZ6dReUkZdYVYg99/omEYi3IMrv7O
         /zRdRSFXXFCon99tFHWn6g2TQ6ZZFqleVMtg5cIpX8CKj/IxAMIMk74b7WmuedudIEhN
         veUJC+LilcR+Bxnxo58fUFAvBaVmg+g+HDqT36QnIL367hNVWNW3+B4hI5KLLv8fVB46
         3RtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727158272; x=1727763072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtqkBA88kwvMRDkdpXIuTPjK06Yw44S9bnA3B3TRVKU=;
        b=mas/IjSuXjtVhV6L5RHZc/GPUEkxsMaJmT2e2juKKCMKUTsqCIKuuAM1DqX77sJ/Px
         srbaLCqIT/BzP8t7S3hxbZFnjw2kxvZAlG8Sn8arAgP4BwOzsEQI/GIfWA+JXy64a0kg
         X9ny8ZjzD31nPhpLAzmhisxt41auW6kfyjbjX8r+dHT8UyGjom0G4wjcrEmrpSqu6KkI
         5i+QojuDKwvTm/GU14H/J2R9OhuNl51LTIAZ3RUFAlUiEC9qlfLi8vzDGblc4sTUH2Qg
         cnItRaJc8OOU2WMVISDdgO1AvCoPoUL4HqepHitls0UURwZjuJDoo7exnrGmOpYoM/Bp
         JGCA==
X-Forwarded-Encrypted: i=1; AJvYcCVQpAClRFwYll7VY5Vsgz/dhAYlmiUquDIWhVLVuK9haxE3q8mx4nW+RrarzQAixevuTzUD7vzgVzJ8cNI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxmHOahs8lLPdKqo7VRUgmUTxEaoF7hr3hNSd1bWpXb0iQP1+f2
	1Zd5j4hO0V+CLdGEfMOCZJ4TZtyDXquwgkQowtKA9fWdQGssYg7czgtSdU8TBhA=
X-Google-Smtp-Source: AGHT+IGXhl7eW49ih0T9YK4dpESD/v76/2vHb7m+lE9WqCGFaYPlARnoD/c7DbHxV22Za7qr6kwfpA==
X-Received: by 2002:a17:902:f54f:b0:205:755c:dde6 with SMTP id d9443c01a7336-208d83cc8b6mr212103045ad.30.1727158272107;
        Mon, 23 Sep 2024 23:11:12 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17229c9sm4344885ad.85.2024.09.23.23.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 23:11:11 -0700 (PDT)
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
Subject: [PATCH v4 07/13] mm: khugepaged: collapse_pte_mapped_thp() use pte_offset_map_rw_nolock()
Date: Tue, 24 Sep 2024 14:09:59 +0800
Message-Id: <07d975c50fe09c246e087303b39998430b1a66bd.1727148662.git.zhengqi.arch@bytedance.com>
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

In collapse_pte_mapped_thp(), we may modify the pte and pmd entry after
acquring the ptl, so convert it to using pte_offset_map_rw_nolock(). At
this time, the pte_same() check is not performed after the PTL held. So we
should get pgt_pmd and do pmd_same() check after the ptl held.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/khugepaged.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 6498721d4783a..8ab79c13d077f 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1605,7 +1605,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 	if (userfaultfd_armed(vma) && !(vma->vm_flags & VM_SHARED))
 		pml = pmd_lock(mm, pmd);
 
-	start_pte = pte_offset_map_nolock(mm, pmd, haddr, &ptl);
+	start_pte = pte_offset_map_rw_nolock(mm, pmd, haddr, &pgt_pmd, &ptl);
 	if (!start_pte)		/* mmap_lock + page lock should prevent this */
 		goto abort;
 	if (!pml)
@@ -1613,6 +1613,9 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 	else if (ptl != pml)
 		spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
 
+	if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
+		goto abort;
+
 	/* step 2: clear page table and adjust rmap */
 	for (i = 0, addr = haddr, pte = start_pte;
 	     i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
@@ -1645,7 +1648,6 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 		nr_ptes++;
 	}
 
-	pte_unmap(start_pte);
 	if (!pml)
 		spin_unlock(ptl);
 
@@ -1658,13 +1660,19 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 	/* step 4: remove empty page table */
 	if (!pml) {
 		pml = pmd_lock(mm, pmd);
-		if (ptl != pml)
+		if (ptl != pml) {
 			spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
+			if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd)))) {
+				spin_unlock(pml);
+				goto abort;
+			}
+		}
 	}
 	pgt_pmd = pmdp_collapse_flush(vma, haddr, pmd);
 	pmdp_get_lockless_sync();
 	if (ptl != pml)
 		spin_unlock(ptl);
+	pte_unmap(start_pte);
 	spin_unlock(pml);
 
 	mmu_notifier_invalidate_range_end(&range);
-- 
2.20.1


