Return-Path: <linuxppc-dev+bounces-4432-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8089FAC28
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 10:43:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGtPd00y0z2ywC;
	Mon, 23 Dec 2024 20:43:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734947012;
	cv=none; b=Ag8tIP2jUV1RspIo1HxtF0gFb8ccHcHAY++OLzZCE5owPeRJ3pvreTmuojnMw9CbgzJ0lj358EYdDd1KqcGFtmexeEB0H+1FGw94+TLc22A7GGNHztw+vJ/j/oW/mrmSt5Da/7yRaHlfAvtoEqZrnNnHCxF3xMUFoRhxhBovUfIlxlL0KhqgWc5a+3yxSzEr3ayHKC/zIGAXYE0F+gie2QN0V7i4ZFltb8o1g9k/FmYxve+Y0OzGMo2YxNdPAQyMDMrK3dYy/kIVjiyHQ36hEPcDpEwBhxhYxyWfgUOFawHcbMHPudqhUcHh3aBXGXNKI9+TRNDuWvUFnRREuGgqQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734947012; c=relaxed/relaxed;
	bh=B/tJ15+vmer/NbqXoUznjybhQp/MgC6GOdT/GuQUXpM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B/UOtPunGkT8PsHq1rQ6yaESBgBeNZ03BCzwv/LjYQHnPDrbCCLmo2QiGpOgqNoPUsVY5DkIfB8DYAlPHt8/pQ++gLHoZsPdqIbzWJ9BXg2x+gEEfFaJz0MDagqzsLPo/A0xz6/KxS8QrvLWqWVAZcMc10hRigSdroJ8iYcewpXKJFp60cx9sbggN5q0FPhDzxcpawcJXha7JC0bYTL2KUz4GrfQhDgKc5PXzDMEVFKW2bQ720XuCtioOer6uMjkNdl35+wMXH1EpbXp+R6Dx+LTU7+WYTitYQxZE/fUMUIu+pojfvE7ah95RqihQIvS04JUmqDktg5vB3rxJkdXnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=U9KpJdWZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=U9KpJdWZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGtPb3GFXz2xbN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 20:43:31 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-725c86bbae7so3476782b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 01:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947009; x=1735551809; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/tJ15+vmer/NbqXoUznjybhQp/MgC6GOdT/GuQUXpM=;
        b=U9KpJdWZZn2MpuxwU9fsnKmu+aJb4Fwm3vtCzXUkSll8x4Wfvc+hqP8U8OqwNcbddD
         jOcpoA2uvqes9HkhpSqXHnQwWzMm11QDRBofJ4g5UWMcQRKABzvtS19586YVqKGVh1CU
         0bau6hgw0b9YKs7FpXyDXk1JRqat+D3TO+xNrz4Sm7xvM7nZ6fOz84ZYBttEzVob57yE
         aZAeBNwi1BMBliMPGFXP5+7JmS50a7OZbKX1BfC8Hr0cqYnpFq8++CAVbw8Lsagg8mxP
         mdKyKue1cqsTRKoDlmRwi8bhh07RInXSRx7CVF5Ff6BryxEICROcqXKhp/s32TGhhkVY
         CMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947009; x=1735551809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/tJ15+vmer/NbqXoUznjybhQp/MgC6GOdT/GuQUXpM=;
        b=X0Ws2oFqBZQB5gs/bo/sI76TO9U4jfTbTsAW+9C5qKDs9rqSak2owhGnkq5duq+2SH
         A9h5CIcB9byioV9HSrjDab336Aw3jK9mBD67dIsm1qBXNDjuvfKxlFgJSGjGKLlAuU1z
         z6qFa9jeLJ98U32yxvTZyJ3cG0ToGq1sFlDRRjELlk2crwhXKWPSB/lk1+B01/I8bV9f
         GzUPJUbpa80hFXFoHMdhOb63i1jQHtE0FBIO+hAW/gwyD1Df9mBy+7avx8Ok4Gen5y1/
         197XwBiHebtDADCFXeNxqcuJEw10snlgLtTmpWcgFK+3fXsRAzPQxqgCLM589t/AfjbB
         Oq5A==
X-Forwarded-Encrypted: i=1; AJvYcCXSNhffH7c3ULtRgAUZO5XFgmohCQaS8EeIacmGmiILNlDLSMRlT6u7qs+zvnzAAYZkiLpqcfBPup3gt7c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzuQJSVNcxrFPZNOLYi2Dw5wuR6Eng8RIcLzMcbO483emXbq//Q
	QpLQHZSwdKy0ChwHT82zQuro/ozPwhWrMK2d2jBAqHb96od09Z08zQHeWYZZjHQ=
X-Gm-Gg: ASbGncs9xF59FZLDLlcRC7C0O/DiNbPyfKpt715EfBN+7XXq8eJvM2J/lnesh2/g4wX
	vOUjqp6YTp13MbqCg0sCuYUq/UnA9e20jtyzqnT3vWbdgu3qwzg3TYfw+8EHUIBhbMV5ON633dF
	1uXmsACDyLWheNZwHwDPuyHSpihfx7juj8xFdKjaqBk4ai44X13lrbbPgUc3ZCRXa+sXS5EnPOu
	pflxGYX6D7vePW251QaKcAoBoZMREHL2uWRI/fo3Uga2yOp2H0VFUCiSabX0pQUSVx7i6KrGc9p
	tQERAbzJptZh+yIZMmHCxg==
X-Google-Smtp-Source: AGHT+IGn0WgNlH4n6jFU+xV15Lu8l6dnMV2FFWuW4zvXTMVJTCCaTT+ZxewqFKpQcJgKvmYU0RJrVw==
X-Received: by 2002:a05:6a00:35ca:b0:724:f86e:e3d9 with SMTP id d2e1a72fcca58-72abdecbdb4mr16058641b3a.14.1734947008718;
        Mon, 23 Dec 2024 01:43:28 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:43:28 -0800 (PST)
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
Subject: [PATCH v3 02/17] riscv: mm: Skip pgtable level check in {pud,p4d}_alloc_one
Date: Mon, 23 Dec 2024 17:40:48 +0800
Message-Id: <84ddf857508b98a195a790bc6ff6ab8849b44633.1734945104.git.zhengqi.arch@bytedance.com>
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


