Return-Path: <linuxppc-dev+bounces-4520-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAC39FE423
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 10:09:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YM9Jg67yhz2ymg;
	Mon, 30 Dec 2024 20:09:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735549747;
	cv=none; b=nQPPiVtU9IPWMld8sTCsIgFGDZxJvCdwf9iiYcDyqIrv3wD59VXYGtnxVyDFlKqyzpNxH+ShxKmYssB1oSMs6cdNNI47D718XzvnOFpoGK5yCrCIotYO3cRjM0Qanqd4An6vL6oeuk4nognfa6z7+2TrrP6wmG2OXd1yDFJ8VC9wIoG8/7tjotoRkDJ6Y+DKru9JMQT7B/FCuAjot9PGOSlfZ98UOzEOT2vvy7wLeUPiSkC9bktkj3Obt5G5Ltu1T67JUPz+YqFVS78EUqqBrDBtXSnOizrcoUDFVULRNpAVOGayyhh77YPPsbOoAyZ77EbRBhRjVvpbiOT8j9kLsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735549747; c=relaxed/relaxed;
	bh=mHzGZQny5JmimEm0kycepUlCOKttN6NXbKtm7VNKgbw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ElLtdfLTSJS3uOUhZrLr/bKPX/POm1fMDWGZ5CiEuc8kgO+NB/49zWlLLihGjPvyims8e23fgSmZxhO2UNgR/w0Rmmqm1+lhMlRJF4AiybQaIE+SHzA7kqEdCaD82AuVRLYf/jrofsCTQ5RqYRIYYPY2pvuXImCeSd5Z4SsK9pzR9J+hkqlBQqWUaiXoDnSyDVkWyB6e7UTY3aF8YCYm0Yg/7TqNIgzFfwslT1925GgxVqo/6HNtjFxO3/dpadWf++mIK1p1eKKhHsVIx3/PdJd4gLN3/Nuv9xtrdFOSST/JJNeaz81K9ao4+vGXUe9xpBt7/OcFwrKyDR4udKtrOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MqnSthmA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MqnSthmA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YM9Jf6T4Zz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 20:09:06 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21649a7bcdcso113075985ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 01:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549745; x=1736154545; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHzGZQny5JmimEm0kycepUlCOKttN6NXbKtm7VNKgbw=;
        b=MqnSthmAaOepK7EwBJWTQNPUIjlTrSqC7Ymq+6UgNLs6nelIePNjhRcZ+qvqQXA8FB
         7CPEOtpSCpLhjROoTwN05HR7QtP230VkfUCIlxPWFSsPbhHFg/vlvAJZZd1rgpUymlfH
         koR5bvw6MgVvddYLieH1WjtolpJgVprYVpPPMEWCIxq1G5ur0NKlm6Eg3VkkIGQfla/k
         pBZ+eGsL61Wv2iwNxfGqV7ZbBTP6sofAH4U9KJRMQ1IrAWbGZzjQjtUm1znKHyKgrhSB
         AK3E10Khy7Qh47ud+j425g/Af+I7jST39kZHWIbIglcL9fkSdeTlorXGgWns0bTV23mq
         4LQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549745; x=1736154545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHzGZQny5JmimEm0kycepUlCOKttN6NXbKtm7VNKgbw=;
        b=mBQ0zpyGvCJf5G9xtuV6Fz3pFkK0ujTxQ2ySbX0q7nx2B6l9VtgeToLpx2Pmnqyu8r
         j2+9G6CPtjZKQFZPNy14H08tMtkcxnjCKivrOmRB4mGDiQ5R4idBsWDyiE4IMnQz31rG
         UMRUbxOXQV0FuiTxl1WAFcuGHT6yVjE5XmgzFRxfsya4JjD5pd8BUMYEebYnpmzn3d1B
         HyHSqaaiRO1beIRaRU0KqHQKptUWPZfp3+u61BS5ujgLncNI683TH+4GyXAGzD0eB2Su
         KN0eRM495aKzc33HQKOz1rxKrVFWYoMvpwu1ghHzy30LSN9mqUd+3cbsld9L/3P9vi6g
         bmiw==
X-Forwarded-Encrypted: i=1; AJvYcCWKVqkeBtOgJ7oltHHNtCGJcv90a2jUwP1qp69skFME8tFhq/wsMhwRxsyQPMseN1nWH2HqS+xLanJPtqA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxL/hFoAFpFVo2cmCsnQCUD1O9ezpUMp3gPYEJsQyNrpFrr9J+Z
	uep0Fnu02RXrgTCG17FtHfRyWYOsrAC2AU4F1lro652Q5jqMqd3xhdOxU/qGYfs=
X-Gm-Gg: ASbGncsfWrnP8fSjPeaJZCnUDYOo8BawpNH9jL6JL3ZLcruvwvlLbZnlyR3Bn86/mF3
	Q36YXdxjzoknzRSmZT8wVNYB7tdtbJibaa6//LQO6fInTiI7xxb6tYelvYCp4Sy8LlWPKGQ81m4
	wMLO7bLRM6hxdLAvsl77VO7TnGLOx913kKaFkT4XvdkQJrkQiNfNdV9sLJbJpwdJ2o1PiIPtEgu
	+itH9wbp/oixxPa6gkvGO579CjMocTreQe/IYvF62odvgOzKC/MTmE2pWsMg33EJY47o9F4N761
	zSMpM9/zXmNNSqwEtt7Ksw==
X-Google-Smtp-Source: AGHT+IEdmvGR6U/qwRYH5ruA02a+sFRctKWchidIfEBAoumo12DzBepIE5K3QuQVJJ60xG/AvigJ4Q==
X-Received: by 2002:a05:6a20:a127:b0:1db:ddba:8795 with SMTP id adf61e73a8af0-1e5e08028cfmr53967973637.36.1735549745320;
        Mon, 30 Dec 2024 01:09:05 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:09:04 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 02/15] riscv: mm: Skip pgtable level check in {pud,p4d}_alloc_one
Date: Mon, 30 Dec 2024 17:07:37 +0800
Message-Id: <84ddf857508b98a195a790bc6ff6ab8849b44633.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
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
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
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


