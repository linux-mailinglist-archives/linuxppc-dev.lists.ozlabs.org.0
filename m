Return-Path: <linuxppc-dev+bounces-4805-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 380A1A05392
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 07:59:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSf1M02Vnz30DV;
	Wed,  8 Jan 2025 17:59:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736319590;
	cv=none; b=CdYQpwz2igTIZc3zsAWi8njLB0U9teEVe1S5d2lM0QcLrbQJY3U43QnkpwhbjirlVBqrG5JEGsC8r57FdedEs2eqDsgKwxAq28ckfn3j+016k764j8385EWoRktcufV1IFyKffzPG87PkGDrCmjPcGkH+qS4euNVNP+bZ12r3F9tATZn0Zveezs5UyJxgwnm9t16hPzEJOGU1doAiQpq2S4dQyCIbOX30ZzIwIa6cyT02RipZBLi/2i02LhkMSBPVSTwyLzdaDbXAPytLSGEYNMBmnEbEZBQm57wUQfvRqs4+T5c4vupAQQjogCx4+C/wsjZMNEIaM5GKxbkvLs+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736319590; c=relaxed/relaxed;
	bh=WgpljFzcR37DW+k0izImY02NXJU+2N4CamZhPf6BMmU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z3gv4N0hIGBqaE3u8Z8gcXlbcKFErJaNb1jYmj2YKq48wY9KvXvZNK9LvPaEdl3AtCHJ4XOeHfR97a+9SuScvAsMVrxU4U0zKTPIwR5L+iy/bkTNCtbEb1SCAUS1MjvzlG5vFrbrx82PRbG8K0Kn5T6M3LI8aQAM1wT2oFG5wiAxQm4uD1+l9YVf/BPwvhxzXK6yGdNmhVGfnTJZI1bKgxvBqucsjWjvK7jMq0IYnJMiLjyBet/5LqnBuL+F75yj0KBCbGZT+epiJiQyHdVCwlyITjEjt/6wSTWh0qXiiM6dwZM+EOSLsVLw06L5UUjIQVbVy4rKPsC7v3r6XcebaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ex/uNRVx; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ex/uNRVx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSf1K2ZV1z305m
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 17:59:49 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2167141dfa1so9476665ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 22:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319586; x=1736924386; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgpljFzcR37DW+k0izImY02NXJU+2N4CamZhPf6BMmU=;
        b=ex/uNRVx8am8Z3zG4XJWCgd5acPBR46ONJqLjrKL7gI7ah6QjZ+ivKMguoY5nIcqHs
         ZC0GX3VfMfI9Dfsmo1UpTcLE2MyerMZ+6mcw5eobpT0+FyrsXrGWxAKbXRDN3Po4HbUT
         1GfceWVSGEwvs64TqF8UCciJC/FNvKq0P4h/516JepRfzgRYZ2o3wCrlYjvovvv1qG0I
         UKNRDtZumGN9T/DzbwP9ey5MojRBEEHnCE9GvsmqJeowMLzxQAtxYdyxFCCf/wja9O0/
         hjrmhVNGbzUCHt4GpwCmgfvYrsWNT5tOPyfKgTTuVGWdsEMJ2XP74cXbJLwDJ7UHO+f9
         sAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319586; x=1736924386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgpljFzcR37DW+k0izImY02NXJU+2N4CamZhPf6BMmU=;
        b=d+qqpkfPJvMytAVIurM464Wim6Ln69Q1TYiwLdcDrv6AN1GuOYwfJhuQlvc8Oeaw9p
         T3Ikk/gvU5hSdgqIGCkWwkCIF2eqT2aXwFN0x9tZuo78yKWlyI1zvRNPIa1XM/NJwDfR
         /SZt7ZTPZkuunPn6eJFEq2MaUCCDJGf7OFYclMZiRkaKnDgcyeJCYfZFHsWW1eXEqPjb
         cPtv03wKYxFUqt9Yi6+WmFlTvoVcKUhzEh/x6zDKULCYdWz2xKh26QazVFwwpMdlOb+L
         kMEWzHAwPETXB6cmepvdiXYACJKhASJVcaodVO1IPvXH8wx+uwQEJaoJb5FBYP0339SX
         IlDg==
X-Forwarded-Encrypted: i=1; AJvYcCWk5qx23MU9V+wCW2os2I2i1xjxx0C4FU49mFvgT3T7jhJ8vVBkpCYuQEGL2gW0xZXEB0l4n+ekt0Xzzxg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzxddGMp9COvaVoi7DXDE4wCxvh3eKwyKL/W6XkwGb0dei8cOI0
	c+WG7C7F0ZvKlSSWFJAbBwu9Bch7FDlKHGu39qKeS/nocGE8f+IUOw3Kt7xzmno=
X-Gm-Gg: ASbGncuae6SdVmVdfBYsfvj0mbP03YSos3OU5F1Di4zl15JXLk0EhvbpI3w0rzKUlAK
	9QceXOd4BMFqh+sYwUUwA/IQ37VLCrZUBkUPw9pu8qT8PetLk8cL5HfvnkarYeOB9Kjn7dk9pBG
	l2Xwd3jfNjAdjERXY+vdxcIvkNRvaDMg1NUiP9WauiXsj0lh7QB5UdgeSEgmBCHnjI3g57sPeQ+
	pgo3V3UlTflJzih76V6f0nd2TlZegAB258FaNbOCaBRxWSdX5B92PFcwMg01qhKwkf1OKcO8GCa
	gfEqeqi859wm7aFoWsKmPNw6vsM=
X-Google-Smtp-Source: AGHT+IEXmx6aGyXUatDDUSC3BIwwvJRBe2xxgGmNdG6bwRG2a4u7PgHO01+qr8GDOf9tBGHx3RRkKg==
X-Received: by 2002:a17:902:fc4d:b0:216:5db1:5dc1 with SMTP id d9443c01a7336-21a83bb9991mr32206305ad.1.1736319586298;
        Tue, 07 Jan 2025 22:59:46 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.22.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 22:59:45 -0800 (PST)
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
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 02/17] riscv: mm: Skip pgtable level check in {pud,p4d}_alloc_one
Date: Wed,  8 Jan 2025 14:57:18 +0800
Message-Id: <93a1c6bddc0ded9f1a9f15658c1e4af5c93d1194.1736317725.git.zhengqi.arch@bytedance.com>
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

From: Kevin Brodsky <kevin.brodsky@arm.com>

{pmd,pud,p4d}_alloc_one() is never called if the corresponding page
table level is folded, as {pmd,pud,p4d}_alloc() already does the
required check. We can therefore remove the runtime page table level
checks in {pud,p4d}_alloc_one. The PUD helper becomes equivalent to
the generic version, so we remove it altogether.

This is consistent with the way arm64 and x86 handle this situation
(runtime check in p4d_free() only).

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgalloc.h | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index f52264304f772..8ad0bbe838a24 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -12,7 +12,6 @@
 #include <asm/tlb.h>
 
 #ifdef CONFIG_MMU
-#define __HAVE_ARCH_PUD_ALLOC_ONE
 #define __HAVE_ARCH_PUD_FREE
 #include <asm-generic/pgalloc.h>
 
@@ -88,15 +87,6 @@ static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd,
 	}
 }
 
-#define pud_alloc_one pud_alloc_one
-static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
-{
-	if (pgtable_l4_enabled)
-		return __pud_alloc_one(mm, addr);
-
-	return NULL;
-}
-
 #define pud_free pud_free
 static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 {
@@ -118,15 +108,11 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 #define p4d_alloc_one p4d_alloc_one
 static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
 {
-	if (pgtable_l5_enabled) {
-		gfp_t gfp = GFP_PGTABLE_USER;
-
-		if (mm == &init_mm)
-			gfp = GFP_PGTABLE_KERNEL;
-		return (p4d_t *)get_zeroed_page(gfp);
-	}
+	gfp_t gfp = GFP_PGTABLE_USER;
 
-	return NULL;
+	if (mm == &init_mm)
+		gfp = GFP_PGTABLE_KERNEL;
+	return (p4d_t *)get_zeroed_page(gfp);
 }
 
 static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
-- 
2.20.1


