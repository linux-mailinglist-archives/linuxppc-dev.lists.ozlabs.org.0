Return-Path: <linuxppc-dev+bounces-4820-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8BAA0540C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 08:03:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSf5q4gkrz302N;
	Wed,  8 Jan 2025 18:03:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736319823;
	cv=none; b=TFxi0Sz6UVt3PKsb9jBvbPhtuYi3b94es8aJAY5O9rp8sCoUx9xo21NjIA3a2a8icr0F6QM1JtWHK321XG9a7hZhUIks2BIvkxgU4IC9iEQaMpOc7N8gY8RP8h9ee+a73x4Or9pbGSTnWQ1p+2WzDloobQ+BIrurMK3nNXLgGSOqAkCgoWNfyK5p2xOXyYhd3T/+STmsrJh+4aA+uK4m9HWJwXglXzs2pM4s++suLJEWVvzrN+2guEPjfDIUiyq6tMAxxhIi7MHnggdcN0Zmo4LpEdrno9hGPAg40GXtzrtNnYz3nakZ0YIBm232c1cY5guFqFmv2QSUuejp7CXj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736319823; c=relaxed/relaxed;
	bh=SmV2C/123ilQKoYc6h41pKDzG2aiaIfZ7nQkaBcWxp0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jR8xxwcrzLOpF+QL7xKjEVpE4gN0s5RdO7PLCNGRHZyewLEl7RMjH9dXko4Ion2KTpAXtJrijWp68gP9bRIn6SPshHZb+pGBBqadMpy59tQksZTBzM7phz+gz3TeAeiXx6NoghhuQbEb+oFu9Q5+I5HVf6/36VtFd/488W2HAEeRol1/rLjP5BnZQpkSgpHW/uS1Qo/GwLhWg3v4aQT5NW8lLfw2H5x8qR1AD46kF5rUxjDni3kbXMUG2CgZgYFRvIV/DxTUJYE5yvuNga5yIc4vfLqhzsGdFweK+sAVOiYobNZ3IUKYFFidQyW36dNgq9GuhGxemzZ9NWUHiMeqMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CS3+ax9Q; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CS3+ax9Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSf5p3zTHz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 18:03:42 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2167141dfa1so9535585ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 23:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319820; x=1736924620; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmV2C/123ilQKoYc6h41pKDzG2aiaIfZ7nQkaBcWxp0=;
        b=CS3+ax9QElctcCFTDoo5QCrd0mlmDmChzJ7XQGFhp3MFWn0DTmrE/Rc6Fs/h7qTReW
         jY9X+2x2YcdKWbOYsGmhq//EoPidQUfNqD3K4I4JwSEQmKAM3zEzb652XNtGpBL18/po
         h2JNCFZooHCn0AseHwmhu7iy6FkrhJ+/JhjKqR82ARqJCK4CGE09t4z6R+ywZDGy3JY7
         8LbGMf1TuuADSNr7vXKh3rXPiwHvRVBjU0dTWX8TMpJVwXWqzqmBJnSQfgnIzQfOJMw9
         HWoYYaMY7sdg6Yf+CfPff7PnFCkvcFf9cCock6B3XCT/v3lf+fMetRxq+fKodccgd8i+
         CELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319820; x=1736924620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmV2C/123ilQKoYc6h41pKDzG2aiaIfZ7nQkaBcWxp0=;
        b=ZedAUcpNw870tOSMAstlk/KfRrQTX8Ix2VjTInsStqt/eqFiNZMv3FoZL5oDlFDJrz
         nXTpv5vTJ5LNuzEfnNkFamzEKTitYloKEun/oRc8T0EPSt+QwcrkURHoJzk1+O6q0pAn
         8jIrSCcFEB/wlfc1t+8Ogis7WgeDoVebRsyPCJ5ECOkHpyskVH/8MmfBBPURt/cvJggk
         p6z7vpkkg0AEFZ1BLZEFABcA/+7KtGGo99oGewXUCc+vte6lQSgqpVBtqUS2N7zoPDcn
         NZygy2Qytqor0mpKCLc3fRmKwyM5T7PDTNpFpb9A6IWjtdZeET4O7rADtdKGtTJJgviP
         hZ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWOrdb97h3uJ54NeJWUxB2eSDlktFPzSmNbpB5SCZmNeWxF5uGxsUHAGvTdBadG6zQvTHKNSnAOI2pNh8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx3eUu5SNdG4CfgnKWtqIPYqDm6nV+T5j3VipC1fpGH8dbaiBxp
	kklBBGlMsx9oW/8EP6c5IEH+LaF8icJ8FW4qTxrJmK+bWxmqxWfoz6FbiGnGpi8=
X-Gm-Gg: ASbGncs5IXfchmU5RVx1jAMNlWpLi3hBm6vPB0iurbHsshtHtTFg/XNHxTZlIw3wA+2
	HK9BsPAUWVsG1uOCzkhfvsfIC9vBdoF4vw68tdanHJqVYcw/rQwseshR2x6BBFhm58XzvQUnfA4
	wFVCYAop0k4GKNXIIV0wG7dSNUrDl+CaO++gV1+VRwTeAGFtwEIOrVFmV2TCfALYJ4f2jffK8xm
	KjrONmGMzM1oe/uv52bxULXGyWU49++jCvKaSG67MeU8FJxzepG8UaC0oXO2K47r/+lqMscNBio
	1VmViM9uUb8xjk9KF7kdoQ70u0E=
X-Google-Smtp-Source: AGHT+IFPhscn4ro6sBJsBOR2a8pRlJGCRsiSDouRo+43OGNlwIzbjZLHQRkjQ8iB7a2FmZbbQjyk4w==
X-Received: by 2002:a17:902:fc46:b0:216:4fad:35d0 with SMTP id d9443c01a7336-21a7a1d4731mr100818035ad.9.1736319820276;
        Tue, 07 Jan 2025 23:03:40 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:03:39 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
	palmer@dabbelt.com,
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
Subject: [PATCH v5 17/17] mm: pgtable: introduce generic pagetable_dtor_free()
Date: Wed,  8 Jan 2025 14:57:33 +0800
Message-Id: <1663a0565aca881d1338ceb7d1db4aa9c333abd6.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
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

The pte_free(), pmd_free(), __pud_free() and __p4d_free() in
asm-generic/pgalloc.h and the generic __tlb_remove_table() are basically
the same, so let's introduce pagetable_dtor_free() to deduplicate them.

In addition, the pagetable_dtor_free() in s390 does the same thing, so
let's s390 also calls generic pagetable_dtor_free().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: Alexander Gordeev <agordeev@linux.ibm.com> # s390
---
 arch/s390/mm/pgalloc.c        |  6 ------
 include/asm-generic/pgalloc.h | 12 ++++--------
 include/asm-generic/tlb.h     |  3 +--
 include/linux/mm.h            |  6 ++++++
 4 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index 3e002dea6278f..a4e7619020931 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -180,12 +180,6 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 	return table;
 }
 
-static void pagetable_dtor_free(struct ptdesc *ptdesc)
-{
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
-}
-
 void page_table_free(struct mm_struct *mm, unsigned long *table)
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(table);
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 4afb346eae255..e3977ddca15e4 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -109,8 +109,7 @@ static inline void pte_free(struct mm_struct *mm, struct page *pte_page)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte_page);
 
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 
@@ -153,8 +152,7 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
 
 	BUG_ON((unsigned long)pmd & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 #endif
 
@@ -202,8 +200,7 @@ static inline void __pud_free(struct mm_struct *mm, pud_t *pud)
 	struct ptdesc *ptdesc = virt_to_ptdesc(pud);
 
 	BUG_ON((unsigned long)pud & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 #ifndef __HAVE_ARCH_PUD_FREE
@@ -248,8 +245,7 @@ static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
 	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
 
 	BUG_ON((unsigned long)p4d & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 #ifndef __HAVE_ARCH_P4D_FREE
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 53ae7748f555b..e402aef79c93e 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -213,8 +213,7 @@ static inline void __tlb_remove_table(void *table)
 {
 	struct ptdesc *ptdesc = (struct ptdesc *)table;
 
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 #endif
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index cad11fa10c192..94078c488e904 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3001,6 +3001,12 @@ static inline void pagetable_dtor(struct ptdesc *ptdesc)
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
 }
 
+static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
+{
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
+}
+
 static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
 {
 	struct folio *folio = ptdesc_folio(ptdesc);
-- 
2.20.1


