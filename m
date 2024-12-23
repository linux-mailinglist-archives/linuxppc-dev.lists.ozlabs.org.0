Return-Path: <linuxppc-dev+bounces-4445-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA5E9FAC75
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 10:46:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGtSn6CQnz30Nc;
	Mon, 23 Dec 2024 20:46:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734947177;
	cv=none; b=EaveMs/ltaxUG2cafm/Ykn2uN8oThlhCGJ33lPvUhbogPxTcmm2Do1RvqJviu5O0s7uP9SU6php2/JM4UBVs337LNtMXiQJnTb9mv0vGDh783CE/NNI53dhsxwqOYg1aVc3ssSPXSLgINbmsvVv7XbbBvXFUGOZZ0NF7+z8dDLdUiKV65wPS0aCRNSdEqU8EvqZa5B8HexN2vuiH/IS31WMgtNgF5hosUgLZSygtVOzdo1iM3NEdLMt/sWb4LLnTkg0ZcQCj8yqtbB3KOQEtXKnWNoNWRfOqkMffwWxwZymi2UIivUSd4GA9JjK+PKTa++XymUes9YVEcfvbCRIKuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734947177; c=relaxed/relaxed;
	bh=FItpERzyh1wDMphf2PSqriZlspFkmpQlPhA2jGTCtDU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XB79mQz/LfiqMz2UFYE926G8G1hYD7Ha/b84x4o8hVHVoUR0HzHYJ2UhkNCgZlksmInwCPSKamSn77On7AM5I/UsUrVx/U4Olb2wmm8f/gUnUz8G+qJDbIvZa87JdAHKR4PAcu4XCpIWzNutbfS8cwUyY3yC42ObKRnhqqq9ujwq4pTWSnFUABazf99BkWie04rRTrzGZanACM4dJH9Gje7s6634jwbs/dmAA1Rvy805Jtiap4+0wKyepFCBe7s6AL1g4MyhL/Y9295ZHhgfJDZ2L3R74pVVWIHgJgc2ChKS00YI7qIxDyQU3VMY+KwCqywJQBQvY+5pViQrEg89kQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=XC5COSlr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=XC5COSlr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGtSm6Rvxz30Gm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 20:46:16 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-801986033f9so2394983a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 01:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947175; x=1735551975; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FItpERzyh1wDMphf2PSqriZlspFkmpQlPhA2jGTCtDU=;
        b=XC5COSlrMLMpO6hgGY58sYxeWu4/8LPJ5C0nJiwELR0+VWLOV/W5D8KazhyP4yHigE
         gngc2L1kBJws+usm5DCMBtltMi2MKq4SwzkoH8p+/XKo0LVChEffZsUdlO9GVGJjzvOR
         80e2SoxlPrHjy9FI6l9e0Zcf3kIljxMwqR8hscDvQ4/FmPayyEPwsmE4ZI8inzZQT/Hm
         o2fIQKxq93f75pB0xTMC3b6d9HiIoLw7/9B5QtvdMHTg/q8aR/e/tiwjnsI1m5XTHff+
         aNB2WAmd4DFWUSLCEOrWR9T4eNySTU2cUavJpTh4Vzp9+vO3wJxjYgmWfAFpwDLTjzKO
         /P1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947175; x=1735551975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FItpERzyh1wDMphf2PSqriZlspFkmpQlPhA2jGTCtDU=;
        b=jPPhb0fqapnVzVicWnpr/dPnFJhSeGpShthH3ZNE48FCVJaad0bG4jwYuLrUJz5mjk
         qblDgdFggrlLmwFdV3g4YD6HSWRn4oLe3+7Yqd/thZ4t/r34QGkyG+pZ7cZKwYQyaRnR
         u72Pv7rpZJcRoh1NFspAy98FuqtTay9viRsR7AKf4tA8MbdUc09BMtzgd+OPrhJ/zfr2
         l9hzEtAFmclTTQuBWPMVKW/flEfU9kbUZ+YCfKp0yjk9MIB+rT5Srt+GrgHQ6mZvJPXs
         ygE8Wc/3AaFTtm2XqUE360AvycBFjlYnwhV3Q5NBvD5AHYKB9z6zKJCbajyVj9CxyM33
         tv9g==
X-Forwarded-Encrypted: i=1; AJvYcCX7HslwrEdgQtOb6G+sixDrvQSDe37QwO/S3GyHA21Fo/uegDycYozFbhNNHHBi+5/j8KkEmyX5txi43XA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yys6WIv0KN7brXjnYbhJ2Q6P+A+X6I8TFQLIPKUSmUjjp2TRohi
	55sWKqzDRq4A4HJXBJ/Ex9rLEFR587CR/XS7hND27i25ojOHr0AdaZCF1mffaJA=
X-Gm-Gg: ASbGncvAl1R3f79T2IQ1zQ0ZxLhNGca67+91GMUWsC/djyy0T0bGfCX7Z+6rCQuZDd+
	H0w5vvVFnsUpVOugQZTJImCzUZmPu7OQEzAi/QQeFsBgVhWJfeo/OB7Gs4mNb70g/Y/674x5/S2
	tMqwn3ssGQWJ//jYZ33Q/Z1VUhiYGepWB+qK3J7d9eKmtGJLuB8Tykie7gbMycPDHAUjE0E6L4O
	p1IpG7+kh+EzMuCpNDr7btUs3VTSZ3z+u7u1v46Vur87tIgvEKTMkaG8+wTp5ENK6smiZxQZV7S
	mp9mGI10ObJ3wQ4E1wIBdw==
X-Google-Smtp-Source: AGHT+IF9RJvbCaq38Te31r1RKGqLS5POHI3EPqaSbNpVA67C9keEJqX0jQ2rnqy+EikMhfv/vLwTVQ==
X-Received: by 2002:a05:6a20:12d2:b0:1e0:c0fa:e088 with SMTP id adf61e73a8af0-1e5e059b19cmr20289317637.18.1734947175103;
        Mon, 23 Dec 2024 01:46:15 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:46:14 -0800 (PST)
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
Subject: [PATCH v3 15/17] mm: pgtable: remove tlb_remove_page_ptdesc()
Date: Mon, 23 Dec 2024 17:41:01 +0800
Message-Id: <b37435768345e0fcf7ea358f69b4a71767f0f530.1734945104.git.zhengqi.arch@bytedance.com>
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

Here we are explicitly dealing with struct page, and the following logic
semms strange:

tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));

tlb_remove_page_ptdesc
--> tlb_remove_page(tlb, ptdesc_page(pt));

So remove tlb_remove_page_ptdesc() and make callers call tlb_remove_page()
directly.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/csky/include/asm/pgalloc.h      | 2 +-
 arch/hexagon/include/asm/pgalloc.h   | 2 +-
 arch/loongarch/include/asm/pgalloc.h | 2 +-
 arch/m68k/include/asm/sun3_pgalloc.h | 2 +-
 arch/mips/include/asm/pgalloc.h      | 2 +-
 arch/nios2/include/asm/pgalloc.h     | 2 +-
 arch/openrisc/include/asm/pgalloc.h  | 2 +-
 arch/riscv/include/asm/pgalloc.h     | 2 +-
 arch/sh/include/asm/pgalloc.h        | 2 +-
 arch/um/include/asm/pgalloc.h        | 8 ++++----
 include/asm-generic/tlb.h            | 6 ------
 11 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index f1ce5b7b28f22..936a43a49e704 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -64,7 +64,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
 	pagetable_dtor(page_ptdesc(pte));		\
-	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
+	tlb_remove_page(tlb, (pte));			\
 } while (0)
 
 extern void pagetable_init(void);
diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
index 40e42a0e71673..8b1550498f1bf 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -90,7 +90,7 @@ static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
 	pagetable_dtor((page_ptdesc(pte)));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
+	tlb_remove_page((tlb), (pte));				\
 } while (0)
 
 #endif
diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 7211dff8c969e..5a4f22aeb6189 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -58,7 +58,7 @@ static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 #define __pte_free_tlb(tlb, pte, address)			\
 do {								\
 	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
+	tlb_remove_page((tlb), (pte));				\
 } while (0)
 
 #ifndef __PAGETABLE_PMD_FOLDED
diff --git a/arch/m68k/include/asm/sun3_pgalloc.h b/arch/m68k/include/asm/sun3_pgalloc.h
index 2b626cb3ad0ae..63d9f95f5e3dd 100644
--- a/arch/m68k/include/asm/sun3_pgalloc.h
+++ b/arch/m68k/include/asm/sun3_pgalloc.h
@@ -20,7 +20,7 @@ extern const char bad_pmd_string[];
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
 	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
+	tlb_remove_page((tlb), (pte));				\
 } while (0)
 
 static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd, pte_t *pte)
diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index 36d9805033c4b..bbee21345154b 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -57,7 +57,7 @@ static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 #define __pte_free_tlb(tlb, pte, address)			\
 do {								\
 	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
+	tlb_remove_page((tlb), (pte));				\
 } while (0)
 
 #ifndef __PAGETABLE_PMD_FOLDED
diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
index 12a536b7bfbd4..641cec8fb2a22 100644
--- a/arch/nios2/include/asm/pgalloc.h
+++ b/arch/nios2/include/asm/pgalloc.h
@@ -31,7 +31,7 @@ extern pgd_t *pgd_alloc(struct mm_struct *mm);
 #define __pte_free_tlb(tlb, pte, addr)					\
 	do {								\
 		pagetable_dtor(page_ptdesc(pte));			\
-		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
+		tlb_remove_page((tlb), (pte));				\
 	} while (0)
 
 #endif /* _ASM_NIOS2_PGALLOC_H */
diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index 596e2355824e3..e9b9bc53ece0b 100644
--- a/arch/openrisc/include/asm/pgalloc.h
+++ b/arch/openrisc/include/asm/pgalloc.h
@@ -69,7 +69,7 @@ extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
 	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
+	tlb_remove_page((tlb), (pte));				\
 } while (0)
 
 #endif
diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index c8907b8317115..ab4f9b2cf9e11 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -29,7 +29,7 @@ static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
 		tlb_remove_ptdesc(tlb, pt);
 	} else {
 		pagetable_dtor(pt);
-		tlb_remove_page_ptdesc(tlb, pt);
+		tlb_remove_page(tlb, ptdesc_page((struct ptdesc *)pt));
 	}
 }
 
diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index 96d938fdf2244..43812b2363efd 100644
--- a/arch/sh/include/asm/pgalloc.h
+++ b/arch/sh/include/asm/pgalloc.h
@@ -35,7 +35,7 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 #define __pte_free_tlb(tlb, pte, addr)				\
 do {								\
 	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
+	tlb_remove_page((tlb), (pte));				\
 } while (0)
 
 #endif /* __ASM_SH_PGALLOC_H */
diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index f0af23c3aeb2b..98190c318a8e9 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -28,7 +28,7 @@ extern pgd_t *pgd_alloc(struct mm_struct *);
 #define __pte_free_tlb(tlb, pte, address)			\
 do {								\
 	pagetable_dtor(page_ptdesc(pte));			\
-	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
+	tlb_remove_page((tlb), (pte));				\
 } while (0)
 
 #if CONFIG_PGTABLE_LEVELS > 2
@@ -36,15 +36,15 @@ do {								\
 #define __pmd_free_tlb(tlb, pmd, address)			\
 do {								\
 	pagetable_dtor(virt_to_ptdesc(pmd));			\
-	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
+	tlb_remove_page((tlb), virt_to_page(pmd));		\
 } while (0)
 
 #if CONFIG_PGTABLE_LEVELS > 3
 
 #define __pud_free_tlb(tlb, pud, address)			\
 do {								\
-	pagetable_dtor(virt_to_ptdesc(pud));		\
-	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pud));	\
+	pagetable_dtor(virt_to_ptdesc(pud));			\
+	tlb_remove_page((tlb), virt_to_page(pud));		\
 } while (0)
 
 #endif
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 69de47c7ef3c5..8d6cfe5058543 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -504,12 +504,6 @@ static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
 	tlb_remove_table(tlb, pt);
 }
 
-/* Like tlb_remove_ptdesc, but for page-like page directories. */
-static inline void tlb_remove_page_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
-{
-	tlb_remove_page(tlb, ptdesc_page(pt));
-}
-
 static inline void tlb_change_page_size(struct mmu_gather *tlb,
 						     unsigned int page_size)
 {
-- 
2.20.1


