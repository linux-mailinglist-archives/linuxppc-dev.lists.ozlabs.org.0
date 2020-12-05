Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 943E42CFA35
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 08:14:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cp15k6CrMzDqDb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 18:14:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ixoQmnhN; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cp0lp1ZdZzDqhS
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 17:58:29 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id o5so4937294pgm.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Dec 2020 22:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UA8jXCMrqvJQGY0iCvWQeL9p8YQUamzHjwR9BZrUGA0=;
 b=ixoQmnhNu+iHTE6dMu5n0TMwbk9gQXZJrp5BPd4nj7PWlUO8ufqJebhBmqsXFyW8Dj
 kMwORXdB3zpgGNBg3iaUDUhTXfjJqGp4WdlLfnTB3MCL9hQWdqhU3+sTpxRlHA0LsBjS
 ssB8DMSbO0zVaArWu+WG3Ir4VhRQdKbAArRIJsHiHv5pEKLTEASbsZ7gZo2ReCaO2H4F
 p0ePGs/hOfpLP0j3N2l0CiWPKVAUUgmop2u4sqdmSWtFcnjVDFLMRLcZ2Iqtf7V9sFh1
 WxZPFTaSbfa1ijLV6ABCVc2rNw39S75ALk7KsYYXFb+7SH2Qn81c7qqSA2TpnACan6lP
 voKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UA8jXCMrqvJQGY0iCvWQeL9p8YQUamzHjwR9BZrUGA0=;
 b=HkzUByhVSqdKw1N6tV4ejJrNMmDibXS1Z6H8Oc1G4H99gjOORncB9ClWMnt4Eb0UAx
 ycHfvRDolyhP45gZcWqdhQUHi7qdeUDrrVhZRC4qi3IlJj8Nq7jDHAzA25A6GXUwfKpk
 v5csgpbv+OGrNOG21Cap4x8VO3nfOlfU+LzK3fhzRlPg1jQdK1qpWvYBCorAhpK4pGOK
 hK52DSyOqVV4tH9Z0mDSJYUmAd4oCK5auSq3DQfOgfK6HB4z3ExFc02ICLMV/Z+xzAmx
 lfnQmS/Bp5l8b0FBlg/OK50ojs+mH8hMu64iNlIu094N1Tmg2eKNobupN1DSbekA0N6N
 PV4Q==
X-Gm-Message-State: AOAM530AsmfswEjVTKvi/1h7Eeof+h5L5xhiX67TRC72S+JaM4X9EYg2
 84HvubxPFuIwOn9R0AntIOMNba+xmYCT0g==
X-Google-Smtp-Source: ABdhPJwsGY5bbPgjp6Z2beq7Wy5FYiyWFqxlFd9Z8sOD8KS2/ylcOxRC30ISSWWh5AGOTBlvg8B/eg==
X-Received: by 2002:a05:6a00:1596:b029:19d:96b8:6eab with SMTP id
 u22-20020a056a001596b029019d96b86eabmr7188996pfk.38.1607151506911; 
 Fri, 04 Dec 2020 22:58:26 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([1.129.145.238])
 by smtp.gmail.com with ESMTPSA id a14sm1110848pfl.141.2020.12.04.22.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 22:58:26 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v9 08/12] x86: inline huge vmap supported functions
Date: Sat,  5 Dec 2020 16:57:21 +1000
Message-Id: <20201205065725.1286370-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201205065725.1286370-1-npiggin@gmail.com>
References: <20201205065725.1286370-1-npiggin@gmail.com>
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
 Thomas Gleixner <tglx@linutronix.de>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
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

