Return-Path: <linuxppc-dev+bounces-4436-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2661B9FAC3F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 10:44:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGtQb14cWz2ywy;
	Mon, 23 Dec 2024 20:44:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734947063;
	cv=none; b=Q2EJ1iZKVZ1/byVZdYvd2l2bqQ2eom921YMP5EIrvIY3ayIy3nBz0OtfR55rhNj2WRDWNGtdZk2csxfMyiOfUzyitQb/q5zE696iW7gghEUC6pg5QVQSCnW8enY4ZJ/BIO7QzLWpaUlUUZqvyo10cZxI+wVwwkePk5PxB2Eq/TI5/5nZ+Twt13GuD+QETqTTyQg7pi9KD/FAnbC6cIcNfzeRnc7DBndACxCh+MjqAlCXMVchgyg1l6OxOt2txM/onVRo5iRPDCTy+n5yaOnsz3A85XdxEIItnaw0N67q0FX0QdcbK0O9R8uyVNB3jpNsYWm9WPecXsoxtDI8/XGgJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734947063; c=relaxed/relaxed;
	bh=xY41yoAggnrpKZDOvMIy0+FhpPRF9QFn+bDK7HKPzWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mZYSfQEECF2eXYO6TTqfl8u6MFxksT0xY/sT1PTPo0tJ+GwgQX3afKsCMYLn6pqX5ws0XLhncR7yabEF4r0R+LNC/b7IkKfKUtkaUF5jwwNE79qUnjz7q3Rxam7g6zyDs0+pdZ9lwPi7Z+mEjyjERQI7bO3UpQHQ9pWGiFXgT8us456Z+soX3m2VWW8MUNJEadRtXVKkngyQ6YZ7wN+6vatheYF9D4ljrMuEXF/X6bC4LRNFQZoehoCMYEu5dWBA72uPVfytWtzpVRNAM+Xmmu8dOh1Uku1YnuQlkxYriL8PstwqzKL98gpUBTFcXIRJF+X8q6joegWzRTbteFbXTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=C6/lhThn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=C6/lhThn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGtQZ1mQWz2xbN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 20:44:22 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so2340542a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 01:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947060; x=1735551860; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xY41yoAggnrpKZDOvMIy0+FhpPRF9QFn+bDK7HKPzWw=;
        b=C6/lhThnVAf/Urd2cNIgAm4kI6fUsRS5ILhPulmoJyaPJmrzjDhKvbT13W047qdKhg
         xx1t0pMZwqdeHF+UPKgC97y/dJFlqX3WAY4/GSXjaqGZyNCE5dEkIoHUpFhYuFDDE+S9
         IM4D/HFtr7TjyWkNhBWyr77/c/pY5aYJDisO4lyMML+kLA6HKlrihWeI9nxVJ6YzV5l9
         L1eVdAMwPzmpsYaVuSHXlQ2T5AxoDycIEdVbieZfI3yfCZUKCaaKCuMRVInme+A7lUCH
         ctWFdJEYKULqG1SDvkIzHBY0lbQ44yU30ecpS1mogttifY0kzj1xCHBny7Dzti8P92fM
         I1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947060; x=1735551860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xY41yoAggnrpKZDOvMIy0+FhpPRF9QFn+bDK7HKPzWw=;
        b=eUGrtBhqdcNHzSaXmdvCoWkCWvXvoo9UmqB8xXd/SDU2lm0OlwOl2gwFN90G+CgChW
         sr9sjWe5IswB+AzO+SUpNxk4NJjUvvmTf7vTVm6RosQH1EwYjVuEYsde+33Osx+4/+FE
         VlBSIwpjzGzik5ILEYLS8YN0NyB2Oi4yA5lGez0PJejKGBgL2K/4Z5Kfr34CaV5KSdPq
         5GJrQDJQ38De8DeLno319a3b8GDglQVhUyyLICjfSNV9NzQT0dzO2abMum+ScXYkl4x0
         9QSy2uKB84wi5C3OvajR2054buoAzqk0lCwZduk4iSggCVeHPNq8H33t6uSoNDtBkoC3
         BGow==
X-Forwarded-Encrypted: i=1; AJvYcCULr7eYvpKd5Z0kbeLYlBjvnrFZZVbo1gfFCM8SI0qcZi9rgZLZMs6yPtoJ2a9R+7s+rgbwpABEIQT5H7Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyM8FO7Q3ryjQKp2Rbu7Xijz2SrjwKYoZyxg2yz4fYVVs+O8vsT
	hZEYNgpYv2wSYgbzV8r/52+/lLfHyq/PKXDHiAf3zZudohpOVXrD4iA1TKzYrW4=
X-Gm-Gg: ASbGnctFZvLWWaGea/4bwSlFn7n5FL7eifUk8NHGgN3XLove3iSfBnxuZ+FlVsGuuRP
	UqsUsuTdbsI4m37jU+hGA7fJCTQPuBQ+IBQJZK3t0ooBhF7a1m13Z10Rago7I5sAtel1z8oDCDJ
	QV3mMkZ07ordGUFDa3XNu+F234WA1WBWLLYqAD2/OB/TYHBSvPsC9Nzx41zq+LbqIkmDUWpfc1O
	Vy+KXFEKKA7uuT0T9gxuAqEUv70eo1gFYJade+IZSgFCeKDR/GnI6ObO3Vk8b/sR20Qlj623s3a
	WHMENEEO71jb2o0gZOVMeQ==
X-Google-Smtp-Source: AGHT+IF7O/ZMCvOOtywTANPL1zwoTq06yXXDMhnBrPgrfov3E/r1DzhOhOYD8wImAojzeP7TdceoFw==
X-Received: by 2002:a05:6a21:3285:b0:1e1:aad7:d50d with SMTP id adf61e73a8af0-1e5e084b681mr22018514637.46.1734947059944;
        Mon, 23 Dec 2024 01:44:19 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:44:19 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 06/17] s390: pgtable: add statistics for PUD and P4D level page table
Date: Mon, 23 Dec 2024 17:40:52 +0800
Message-Id: <35be22a2b1666df729a9fc108c2da5cce266e4be.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Like PMD and PTE level page table, also add statistics for PUD and P4D
page table.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-s390@vger.kernel.org
---
 arch/s390/include/asm/pgalloc.h | 29 +++++++++++++++++++-------
 arch/s390/include/asm/tlb.h     | 37 +++++++++++++++++----------------
 2 files changed, 40 insertions(+), 26 deletions(-)

diff --git a/arch/s390/include/asm/pgalloc.h b/arch/s390/include/asm/pgalloc.h
index 7b84ef6dc4b6d..a0c1ca5d8423c 100644
--- a/arch/s390/include/asm/pgalloc.h
+++ b/arch/s390/include/asm/pgalloc.h
@@ -53,29 +53,42 @@ static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	unsigned long *table = crst_table_alloc(mm);
 
-	if (table)
-		crst_table_init(table, _REGION2_ENTRY_EMPTY);
+	if (!table)
+		return NULL;
+	crst_table_init(table, _REGION2_ENTRY_EMPTY);
+	pagetable_p4d_ctor(virt_to_ptdesc(table));
+
 	return (p4d_t *) table;
 }
 
 static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
 {
-	if (!mm_p4d_folded(mm))
-		crst_table_free(mm, (unsigned long *) p4d);
+	if (mm_p4d_folded(mm))
+		return;
+
+	pagetable_p4d_dtor(virt_to_ptdesc(p4d));
+	crst_table_free(mm, (unsigned long *) p4d);
 }
 
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	unsigned long *table = crst_table_alloc(mm);
-	if (table)
-		crst_table_init(table, _REGION3_ENTRY_EMPTY);
+
+	if (!table)
+		return NULL;
+	crst_table_init(table, _REGION3_ENTRY_EMPTY);
+	pagetable_pud_ctor(virt_to_ptdesc(table));
+
 	return (pud_t *) table;
 }
 
 static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 {
-	if (!mm_pud_folded(mm))
-		crst_table_free(mm, (unsigned long *) pud);
+	if (mm_pud_folded(mm))
+		return;
+
+	pagetable_pud_dtor(virt_to_ptdesc(pud));
+	crst_table_free(mm, (unsigned long *) pud);
 }
 
 static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long vmaddr)
diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
index e95b2c8081eb8..b946964afce8e 100644
--- a/arch/s390/include/asm/tlb.h
+++ b/arch/s390/include/asm/tlb.h
@@ -110,24 +110,6 @@ static inline void pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 	tlb_remove_ptdesc(tlb, pmd);
 }
 
-/*
- * p4d_free_tlb frees a pud table and clears the CRSTE for the
- * region second table entry from the tlb.
- * If the mm uses a four level page table the single p4d is freed
- * as the pgd. p4d_free_tlb checks the asce_limit against 8PB
- * to avoid the double free of the p4d in this case.
- */
-static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
-				unsigned long address)
-{
-	if (mm_p4d_folded(tlb->mm))
-		return;
-	__tlb_adjust_range(tlb, address, PAGE_SIZE);
-	tlb->mm->context.flush_mm = 1;
-	tlb->freed_tables = 1;
-	tlb_remove_ptdesc(tlb, p4d);
-}
-
 /*
  * pud_free_tlb frees a pud table and clears the CRSTE for the
  * region third table entry from the tlb.
@@ -140,11 +122,30 @@ static inline void pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 {
 	if (mm_pud_folded(tlb->mm))
 		return;
+	pagetable_pud_dtor(virt_to_ptdesc(pud));
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
 	tlb->cleared_p4ds = 1;
 	tlb_remove_ptdesc(tlb, pud);
 }
 
+/*
+ * p4d_free_tlb frees a p4d table and clears the CRSTE for the
+ * region second table entry from the tlb.
+ * If the mm uses a four level page table the single p4d is freed
+ * as the pgd. p4d_free_tlb checks the asce_limit against 8PB
+ * to avoid the double free of the p4d in this case.
+ */
+static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
+				unsigned long address)
+{
+	if (mm_p4d_folded(tlb->mm))
+		return;
+	pagetable_p4d_dtor(virt_to_ptdesc(p4d));
+	__tlb_adjust_range(tlb, address, PAGE_SIZE);
+	tlb->mm->context.flush_mm = 1;
+	tlb->freed_tables = 1;
+	tlb_remove_ptdesc(tlb, p4d);
+}
 
 #endif /* _S390_TLB_H */
-- 
2.20.1


