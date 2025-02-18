Return-Path: <linuxppc-dev+bounces-6331-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0337EA3AA5E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 22:03:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyBnQ5LwVz2xrb;
	Wed, 19 Feb 2025 08:03:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739901483;
	cv=none; b=kvhm1poc8IFTDpcbJlMEcNtnkM7BUnP7E4Ptjy59iXoO9ubCD/TOmAcgDk81/mFExz8hKTYdd78Q69DroV8GxKCtV319yOzd9lDIqskzo9lOFK0PFPReyYMOUiWZ7MRq6I4JmpQXWH50k5D37DuQmErueMRfJuckpQqb95kyo7Z3P9vW+tFI/7uZ/12F2YTebJ0s/Qr1mSDbVmlxm5Ek89CI9tFw26yjSkxm2WqKGp6W8g2b2Y2p0d/4WnsSBIzkZ2F97ZFT6jvMKi3Yp8ju4RPDsTUqkirDFkDJpxzSvcNxjAHCrYwI2nEe52aX/vXdW/LAHUvc8ggVtmk0+4yoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739901483; c=relaxed/relaxed;
	bh=acUkvDOoPzVu8QFyEGbOwTRevnv3q6AoiZvxRlOpwJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mhaAIltd9pAjp9ygE0x7+fyoM9FcusDyD3uK7oO1digxLf/GdPHqrimMjak/BfJA1Zoo92gU4wrjmspE+anyciklUXJyedFjJgNzh/alY2eHtZhYGu6Bwi5cOuXDBnC4i76DSlLm+yN43OnJklhvge5HQoC5Lxns/sg2ekAH1z0JGQ/w9XC27pGS9/585TsyS9725Vu7kqCoUcVl1TJsWiTg5w60rXwN35x0B73unNeHSG2f7d85o9uxrmR7J2QTEytjL+chc4Ej7tBewF2uW83VEhIGPDJoLdOzPgflvjhhcmUnjoJw6pjS0q+J4BBDIYuF2AyPO2AZ/6XrW2iZMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hucvAK8S; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hucvAK8S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yy6gt3wwrz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 04:58:02 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54298ec925bso7837791e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 09:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739901479; x=1740506279; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acUkvDOoPzVu8QFyEGbOwTRevnv3q6AoiZvxRlOpwJ0=;
        b=hucvAK8SC/hQgkM8ot/WORFpDKCt5+O6bFlVEKmcqpIKiR7R+0dALDxPb5zWFJS4Th
         /rqOlPL0VM7f5wzhGpXA4G64AUdP8hVAfEhfOqOC2tkqShgrWSBrwhFgEKGrcwHHi5WZ
         fYMsuhP5euByuqviNJzTGEnM/lX3n0MdzQyZMA8v7H/2cZHrbUfjyVEi1WmGHJVQJX5J
         qfJFwpSaXErtsKAbAmMj8+f4Eu7dlLgyXhXzn9a5xVABivIzF++oMmgnUFlhC9RxQNNN
         meeWsdXc9vyG4Pe0TXAJPu3XNqj6dNcjnsgo8aMw00w/yKlFT3VamtfI+hqwLP7PnIhI
         K5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739901479; x=1740506279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acUkvDOoPzVu8QFyEGbOwTRevnv3q6AoiZvxRlOpwJ0=;
        b=r1a3+e9w4+j+vs6DexI9KXKUtQAUzopHCfgcbNBNoH7NKVrjRCTxDiMzB5eNRmcFG1
         jEnvEIaAmfriFge39dSlCqJN0g43/Q047BDqH2ZF/CIms45Lpe4uS3z0SMEwVCM3YVVl
         Vh2WH6OxOa/DHv4wapCMeh7NV7Naq5n9FkX1HDaB2xhblIFylCH9n4gCa/TiSoDczp+M
         prCwoqZxhLaaf0h9R1G8w59xMMATGRzI63AXj+sNGER44dC90+iVJoHOLJ/CMnwjJo1V
         8JNSm5w/JROYzqNpMWXmAYsX0LzxHhA66hYZXqwDLSfkA9rMhM4bSodF6VA4SZnZAhrY
         ZxhA==
X-Forwarded-Encrypted: i=1; AJvYcCWUgTTn0QA26hmM3Ts+nMEEt1jBlMpvF35ztuD5a31EyKVqXsAXbCQxbBJMxOv3B5i+/uDhCPZ+lDHf338=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyqEF2OCocJgirYXs8EYe6LX2gYcBfBdRJyOQoYtUY4e9BZTidz
	SJ9veMw7beMSDSKtIJtd52gi+2IdY9ih9qMM1gLRNCdFeA01R+a5
X-Gm-Gg: ASbGncsFEQfQRFV6fCDD/ryfoFu8ApghntrJzzhT1kmo3ZVGRnWoFXe2cMgBsde0Ba2
	sBKxriPXnpXzemPfmYPbbYKJULZBn6rixeR5ML+w8zvudNSsaKiEF+u8kdJyVEcdm/e/M1uxZw4
	ZBGMyYlnmo13iIq7HYZ0I59WroRON0ds8+pAd6axdZBhO1sUtXvEZN/+1H44BNwqzUuncY/a0QI
	UDOyPOos8+wSN6/UohGpl0q57Df+leOASYEQkfE5is7t7OWbcYBWkzJ5gkP/ZebUoSzmOSJ6aDE
	BE1hfHnkohJQtMqmzVUdCnQeHgw3tuEEqAKlVWfbVjCUJua0g9alBKZmENwk2A==
X-Google-Smtp-Source: AGHT+IEGlkLPaex5Nk+m7WgXIuMgOlltIYpcbCZK41uHBEuu20+yIMUmFVs0CaJEx31B2yiq1Zo5ew==
X-Received: by 2002:a05:6512:33cd:b0:540:1b07:e033 with SMTP id 2adb3069b0e04-5462ef2373cmr237152e87.45.1739901478771;
        Tue, 18 Feb 2025 09:57:58 -0800 (PST)
Received: from es40.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545254f7072sm1709286e87.127.2025.02.18.09.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:57:58 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: linmag7@gmail.com,
	richard.henderson@linaro.org,
	mattst88@gmail.com,
	glaubitz@physik.fu-berlin.de,
	ink@unseen.parts,
	kees@kernel.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: chris@zankel.net,
	dinguyen@kernel.org,
	jcmvbkbc@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	loongarch@lists.linux.dev,
	monstr@monstr.eu,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 1/1] mm: pgtable: fix pte_swp_exclusive
Date: Tue, 18 Feb 2025 18:55:14 +0100
Message-ID: <20250218175735.19882-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218175735.19882-1-linmag7@gmail.com>
References: <20250218175735.19882-1-linmag7@gmail.com>
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
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Make pte_swp_exclusive return bool instead of int. This will better reflect
how pte_swp_exclusive is actually used in the code. This fixes swap/swapoff
problems on Alpha due pte_swp_exclusive not returning correct values when
_PAGE_SWP_EXCLUSIVE bit resides in upper 32-bits of PTE (like on alpha).

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/pgtable.h             | 2 +-
 arch/arc/include/asm/pgtable-bits-arcv2.h    | 2 +-
 arch/arm/include/asm/pgtable.h               | 2 +-
 arch/arm64/include/asm/pgtable.h             | 2 +-
 arch/csky/include/asm/pgtable.h              | 2 +-
 arch/hexagon/include/asm/pgtable.h           | 2 +-
 arch/loongarch/include/asm/pgtable.h         | 2 +-
 arch/m68k/include/asm/mcf_pgtable.h          | 2 +-
 arch/m68k/include/asm/motorola_pgtable.h     | 2 +-
 arch/m68k/include/asm/sun3_pgtable.h         | 2 +-
 arch/microblaze/include/asm/pgtable.h        | 2 +-
 arch/mips/include/asm/pgtable.h              | 4 ++--
 arch/nios2/include/asm/pgtable.h             | 2 +-
 arch/openrisc/include/asm/pgtable.h          | 2 +-
 arch/parisc/include/asm/pgtable.h            | 2 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h | 2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 2 +-
 arch/powerpc/include/asm/nohash/pgtable.h    | 2 +-
 arch/riscv/include/asm/pgtable.h             | 2 +-
 arch/s390/include/asm/pgtable.h              | 2 +-
 arch/sh/include/asm/pgtable_32.h             | 2 +-
 arch/sparc/include/asm/pgtable_32.h          | 2 +-
 arch/sparc/include/asm/pgtable_64.h          | 2 +-
 arch/um/include/asm/pgtable.h                | 2 +-
 arch/x86/include/asm/pgtable.h               | 2 +-
 arch/xtensa/include/asm/pgtable.h            | 2 +-
 26 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 02e8817a8921..b0870de4b5b8 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -334,7 +334,7 @@ extern inline pte_t mk_swap_pte(unsigned long type, unsigned long offset)
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/arc/include/asm/pgtable-bits-arcv2.h b/arch/arc/include/asm/pgtable-bits-arcv2.h
index 8ebec1b21d24..3084c53f402d 100644
--- a/arch/arc/include/asm/pgtable-bits-arcv2.h
+++ b/arch/arc/include/asm/pgtable-bits-arcv2.h
@@ -130,7 +130,7 @@ void update_mmu_cache_range(struct vm_fault *vmf, struct vm_area_struct *vma,
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index be91e376df79..aa4f3f71789c 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -303,7 +303,7 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(swp)	__pte((swp).val)
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_isset(pte, L_PTE_SWP_EXCLUSIVE);
 }
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 0b2a2ad1b9e8..b48b70d8d12d 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -496,7 +496,7 @@ static inline pte_t pte_swp_mkexclusive(pte_t pte)
 	return set_pte_bit(pte, __pgprot(PTE_SWP_EXCLUSIVE));
 }
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & PTE_SWP_EXCLUSIVE;
 }
diff --git a/arch/csky/include/asm/pgtable.h b/arch/csky/include/asm/pgtable.h
index a397e1718ab6..e68722eb33d9 100644
--- a/arch/csky/include/asm/pgtable.h
+++ b/arch/csky/include/asm/pgtable.h
@@ -200,7 +200,7 @@ static inline pte_t pte_mkyoung(pte_t pte)
 	return pte;
 }
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/hexagon/include/asm/pgtable.h b/arch/hexagon/include/asm/pgtable.h
index 8c5b7a1c3d90..fa007eb9aad3 100644
--- a/arch/hexagon/include/asm/pgtable.h
+++ b/arch/hexagon/include/asm/pgtable.h
@@ -390,7 +390,7 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 		(((type & 0x1f) << 1) | \
 		 ((offset & 0x3ffff8) << 10) | ((offset & 0x7) << 7)) })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index da346733a1da..bac946693d87 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -302,7 +302,7 @@ static inline pte_t mk_swap_pte(unsigned long type, unsigned long offset)
 #define __pmd_to_swp_entry(pmd) ((swp_entry_t) { pmd_val(pmd) })
 #define __swp_entry_to_pmd(x)	((pmd_t) { (x).val | _PAGE_HUGE })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/m68k/include/asm/mcf_pgtable.h b/arch/m68k/include/asm/mcf_pgtable.h
index 48f87a8a8832..7e9748b29c44 100644
--- a/arch/m68k/include/asm/mcf_pgtable.h
+++ b/arch/m68k/include/asm/mcf_pgtable.h
@@ -274,7 +274,7 @@ extern pgd_t kernel_pg_dir[PTRS_PER_PGD];
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	(__pte((x).val))
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/m68k/include/asm/motorola_pgtable.h b/arch/m68k/include/asm/motorola_pgtable.h
index 9866c7acdabe..26da9b985c5f 100644
--- a/arch/m68k/include/asm/motorola_pgtable.h
+++ b/arch/m68k/include/asm/motorola_pgtable.h
@@ -191,7 +191,7 @@ extern pgd_t kernel_pg_dir[128];
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/m68k/include/asm/sun3_pgtable.h b/arch/m68k/include/asm/sun3_pgtable.h
index 30081aee8164..ac0793f57f31 100644
--- a/arch/m68k/include/asm/sun3_pgtable.h
+++ b/arch/m68k/include/asm/sun3_pgtable.h
@@ -175,7 +175,7 @@ extern pgd_t kernel_pg_dir[PTRS_PER_PGD];
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/microblaze/include/asm/pgtable.h b/arch/microblaze/include/asm/pgtable.h
index e4ea2ec3642f..b281c2bbd6c0 100644
--- a/arch/microblaze/include/asm/pgtable.h
+++ b/arch/microblaze/include/asm/pgtable.h
@@ -406,7 +406,7 @@ extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) >> 2 })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val << 2 })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index c29a551eb0ca..c19da4ab7552 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -540,7 +540,7 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 #endif
 
 #if defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32)
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte.pte_low & _PAGE_SWP_EXCLUSIVE;
 }
@@ -557,7 +557,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 	return pte;
 }
 #else
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/nios2/include/asm/pgtable.h b/arch/nios2/include/asm/pgtable.h
index eab87c6beacb..64ce06bae8ac 100644
--- a/arch/nios2/include/asm/pgtable.h
+++ b/arch/nios2/include/asm/pgtable.h
@@ -265,7 +265,7 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 #define __swp_entry_to_pte(swp)	((pte_t) { (swp).val })
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/openrisc/include/asm/pgtable.h b/arch/openrisc/include/asm/pgtable.h
index 60c6ce7ff2dc..34cad9177a48 100644
--- a/arch/openrisc/include/asm/pgtable.h
+++ b/arch/openrisc/include/asm/pgtable.h
@@ -413,7 +413,7 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index babf65751e81..dfeba45b6d6f 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -431,7 +431,7 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 42c3af90d1f0..92d21c6faf1e 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -365,7 +365,7 @@ static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) >> 3 })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val << 3 })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 6d98e6f08d4d..dbf772bef20d 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -693,7 +693,7 @@ static inline pte_t pte_swp_mkexclusive(pte_t pte)
 	return __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_SWP_EXCLUSIVE));
 }
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return !!(pte_raw(pte) & cpu_to_be64(_PAGE_SWP_EXCLUSIVE));
 }
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 8d1f0b7062eb..7d6b9e5b286e 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -286,7 +286,7 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 	return __pte((pte_val(pte) & _PAGE_CHG_MASK) | pgprot_val(newprot));
 }
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 050fdc49b5ad..433c78c44e02 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -880,7 +880,7 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 3ca5af4cfe43..cb86dbf7126a 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -913,7 +913,7 @@ static inline int pmd_protnone(pmd_t pmd)
 }
 #endif
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/sh/include/asm/pgtable_32.h b/arch/sh/include/asm/pgtable_32.h
index f939f1215232..5f221f3269e3 100644
--- a/arch/sh/include/asm/pgtable_32.h
+++ b/arch/sh/include/asm/pgtable_32.h
@@ -478,7 +478,7 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 /* In both cases, we borrow bit 6 to store the exclusive marker in swap PTEs. */
 #define _PAGE_SWP_EXCLUSIVE	_PAGE_USER
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte.pte_low & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
index 62bcafe38b1f..0362f8357371 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -353,7 +353,7 @@ static inline swp_entry_t __swp_entry(unsigned long type, unsigned long offset)
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & SRMMU_SWP_EXCLUSIVE;
 }
diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 2b7f358762c1..65e53491fe07 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -1027,7 +1027,7 @@ pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
 #define __pte_to_swp_entry(pte)		((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/um/include/asm/pgtable.h b/arch/um/include/asm/pgtable.h
index 5601ca98e8a6..c32309614a15 100644
--- a/arch/um/include/asm/pgtable.h
+++ b/arch/um/include/asm/pgtable.h
@@ -316,7 +316,7 @@ extern pte_t *virt_to_pte(struct mm_struct *mm, unsigned long addr);
 	((swp_entry_t) { pte_val(pte_mkuptodate(pte)) })
 #define __swp_entry_to_pte(x)		((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_get_bits(pte, _PAGE_SWP_EXCLUSIVE);
 }
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 593f10aabd45..4c7ce40023d3 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1586,7 +1586,7 @@ static inline pte_t pte_swp_mkexclusive(pte_t pte)
 	return pte_set_flags(pte, _PAGE_SWP_EXCLUSIVE);
 }
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_flags(pte) & _PAGE_SWP_EXCLUSIVE;
 }
diff --git a/arch/xtensa/include/asm/pgtable.h b/arch/xtensa/include/asm/pgtable.h
index 1647a7cc3fbf..6da0aa0604f1 100644
--- a/arch/xtensa/include/asm/pgtable.h
+++ b/arch/xtensa/include/asm/pgtable.h
@@ -355,7 +355,7 @@ ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
-static inline int pte_swp_exclusive(pte_t pte)
+static inline bool pte_swp_exclusive(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
 }
-- 
2.48.1


