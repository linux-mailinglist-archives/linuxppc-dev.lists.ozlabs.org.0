Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F242C6FCD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 16:41:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjwhH6GPQzDr9T
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 02:41:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SVHS5mVp; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjwN70c57zDrRh
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 02:26:54 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id w16so6664877pga.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 07:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UA8jXCMrqvJQGY0iCvWQeL9p8YQUamzHjwR9BZrUGA0=;
 b=SVHS5mVpiCdYOc9NhPiTz/M4gfoPlXqSWY4M177ekXe6lHoi9mSMs/ExQ2uxXkx2PM
 PXyHS2pG9uV1mzlPMXKc6m1XTsZuXIfKJ6vQoW8iMTAOoHGH88Wxh9lS7PeYJ6Nkb/77
 LRXRlnFoT3+g4AmSG2ZWnHIhEFdYhEmorggq+n1IukfNG9yEMyExLBzcTUXNN6p4A/2H
 mrY1+UMnkpR+4lowOZIGPi/3N8ggcPtSEIGCZ2gXw0Lz8p5RdARZavCgya0ONG3UNHfF
 E94U1aVUJ+d8yLWeMgsTUo05oLhnw+WQRQRc+CjB8mLi3tmU+/rPNhvqh9rgaSWgyF6p
 xY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UA8jXCMrqvJQGY0iCvWQeL9p8YQUamzHjwR9BZrUGA0=;
 b=t5zZNzgvQbK7vWXjj3Tf016WqELkgX6Li9B+hCMpo6cprJKLUa6uRw4Y+O+KoL3uf9
 HdW+3HGKnIQiigWgsLTgab/Sf5npzq8+nI1/aSoH4jnBHYxFAdQI8e3SDT7SWHCSY3Ll
 ERk+cZ+Ccjv2gaNaR891xmcsmcnro+nGbFGOUBi+vkbimZUDB9yfwgWTMCUSwg96qbMP
 9AzgTHrBXPFVKB0qi0+iz6rOMyV6uzG6DCjjGxvvl9ndSo1cw3fNZlKrGSv5l9T4KfUm
 7FIh4O0Tyu8m+Wst9Wimf4GCmfhx7JoHHwdPa5JtYFiAuSqZmjQIh8yPwVhTR/0XcDUX
 bVNQ==
X-Gm-Message-State: AOAM531DoBcAm0EQpRsJ8xUM9t3bOsHgVWvfgicnTH8ZYj9Uvfjqb0S9
 RK6WM/mGKtr3hoNnxGdOv8w=
X-Google-Smtp-Source: ABdhPJzv35VTGCMOMam2SzDUlGt7Z4AbdXDAz26bHCLjbDI3FXCi7OLfSBscze6+qVGOJUyiZfCC/w==
X-Received: by 2002:a17:90a:d495:: with SMTP id
 s21mr16043905pju.42.1606577211534; 
 Sat, 28 Nov 2020 07:26:51 -0800 (PST)
Received: from bobo.ibm.com (193-116-103-132.tpgi.com.au. [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id d22sm15500173pjw.11.2020.11.28.07.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 07:26:51 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 08/12] x86: inline huge vmap supported functions
Date: Sun, 29 Nov 2020 01:25:55 +1000
Message-Id: <20201128152559.999540-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128152559.999540-1-npiggin@gmail.com>
References: <20201128152559.999540-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Zefan Li <lizefan@huawei.com>, Borislav Petkov <bp@alien8.de>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This allows unsupported levels to be constant folded away, and so
p4d_free_pud_page can be removed because it's no longer linked to.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/x86/include/asm/vmalloc.h | 22 +++++++++++++++++++---
 arch/x86/mm/ioremap.c          | 19 -------------------
 arch/x86/mm/pgtable.c          | 13 -------------
 3 files changed, 19 insertions(+), 35 deletions(-)

diff --git a/arch/x86/include/asm/vmalloc.h b/arch/x86/include/asm/vmalloc.h
index 094ea2b565f3..e714b00fc0ca 100644
--- a/arch/x86/include/asm/vmalloc.h
+++ b/arch/x86/include/asm/vmalloc.h
@@ -1,13 +1,29 @@
 #ifndef _ASM_X86_VMALLOC_H
 #define _ASM_X86_VMALLOC_H
 
+#include <asm/cpufeature.h>
 #include <asm/page.h>
 #include <asm/pgtable_areas.h>
 
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
-bool arch_vmap_p4d_supported(pgprot_t prot);
-bool arch_vmap_pud_supported(pgprot_t prot);
-bool arch_vmap_pmd_supported(pgprot_t prot);
+static inline bool arch_vmap_p4d_supported(pgprot_t prot)
+{
+	return false;
+}
+
+static inline bool arch_vmap_pud_supported(pgprot_t prot)
+{
+#ifdef CONFIG_X86_64
+	return boot_cpu_has(X86_FEATURE_GBPAGES);
+#else
+	return false;
+#endif
+}
+
+static inline bool arch_vmap_pmd_supported(pgprot_t prot)
+{
+	return boot_cpu_has(X86_FEATURE_PSE);
+}
 #endif
 
 #endif /* _ASM_X86_VMALLOC_H */
diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index 762b5ff4edad..12c686c65ea9 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -481,25 +481,6 @@ void iounmap(volatile void __iomem *addr)
 }
 EXPORT_SYMBOL(iounmap);
 
-bool arch_vmap_p4d_supported(pgprot_t prot)
-{
-	return false;
-}
-
-bool arch_vmap_pud_supported(pgprot_t prot)
-{
-#ifdef CONFIG_X86_64
-	return boot_cpu_has(X86_FEATURE_GBPAGES);
-#else
-	return false;
-#endif
-}
-
-bool arch_vmap_pmd_supported(pgprot_t prot)
-{
-	return boot_cpu_has(X86_FEATURE_PSE);
-}
-
 /*
  * Convert a physical pointer to a virtual kernel pointer for /dev/mem
  * access
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index dfd82f51ba66..801c418ee97d 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -780,14 +780,6 @@ int pmd_clear_huge(pmd_t *pmd)
 	return 0;
 }
 
-/*
- * Until we support 512GB pages, skip them in the vmap area.
- */
-int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
-{
-	return 0;
-}
-
 #ifdef CONFIG_X86_64
 /**
  * pud_free_pmd_page - Clear pud entry and free pmd page.
@@ -859,11 +851,6 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 
 #else /* !CONFIG_X86_64 */
 
-int pud_free_pmd_page(pud_t *pud, unsigned long addr)
-{
-	return pud_none(*pud);
-}
-
 /*
  * Disable free page handling on x86-PAE. This assures that ioremap()
  * does not update sync'd pmd entries. See vmalloc_sync_one().
-- 
2.23.0

