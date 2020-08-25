Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C08251C32
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 17:22:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbXln6DdhzDq6B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 01:21:57 +1000 (AEST)
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
 header.s=20161025 header.b=uDNHH8Kh; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbXDr3xQSzDqMr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 00:58:36 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id v15so6995459pgh.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 07:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l67Z2dzho9T2ly5R7eUcCIHpsBNVy2xJSWIdCCUuaqc=;
 b=uDNHH8KhZtI7x0oo3/DGvUVgj15j0EFWeWkpDYBKCLJKsOMtuQ1xtfIlg3G2AhdBIn
 CYJgB2BvAfJMB4LL/pc1kFgvcDgNgqiXBYeStk8noBxkFGfXHwcn8jVawe4QiICKcdN1
 T4XRPdl431VQo65ffcLocq0P2XPLAjeYshZGsAuExgdni/73Sg156xvcwRekGlVWJE2o
 AznQRe/Gzv5OMNjMBjT2abU3ehYKwFcnsxjKAURf/zpJ51iHpE+VyEuioFKDyhFwybyk
 ICUmDfnanBvbNsP5GjLLst5UsdUPbiQXprIPBIH4QHAFO1CzLtHvj7cNT80JD+I/PVED
 g5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l67Z2dzho9T2ly5R7eUcCIHpsBNVy2xJSWIdCCUuaqc=;
 b=NTG66lgRXLvHpz+Cz9+4G2L3H3XwH7bPL52puxOeH1nnXd/kvGT1d/7q7ITnvXrTn6
 iRC7MYXEGcoJeoNrdv3bc7XUZc6cjgNjmZy3Q9Fteh/FF5YjyXhw7GWTB66l3YxUvsTt
 G4KTk5vMlA+6g0VvOFwtzdMsnvSjlM2gP3wFC7f2SjSjrVd5W4ZQOgDIRVeYawEf9oxO
 Oeh/8Ys0JM0i+tmoYYAGhA8Ife3rpgoGxDMgU04Tm4Nd3cUPibYGTsT5tfGjfVfmNLr4
 zPZTCbTDgIsoqic+62xUP2Kzl1ay3eVmyzs92NTvDmVAxaLQ8D0pj8ba++TJu4d2Hh/+
 byEw==
X-Gm-Message-State: AOAM530I3d+fUWZnA0NxkGtryfyCiqdk+oYZ6/x2R2yo8zlZILvkDyU8
 +nMpotjf4Up1kdEMjqjLE24=
X-Google-Smtp-Source: ABdhPJzLMJzy9eSMALAieo2xYeCw4xNiaeoXz3Fa/uIpayqK5UpBelchAC7yK+azH4/CJat9OKGjQg==
X-Received: by 2002:a17:902:407:: with SMTP id 7mr8173396ple.167.1598367513105; 
 Tue, 25 Aug 2020 07:58:33 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id e29sm15755956pfj.92.2020.08.25.07.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 07:58:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 06/12] powerpc: inline huge vmap supported functions
Date: Wed, 26 Aug 2020 00:57:47 +1000
Message-Id: <20200825145753.529284-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200825145753.529284-1-npiggin@gmail.com>
References: <20200825145753.529284-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Zefan Li <lizefan@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This allows unsupported levels to be constant folded away, and so
p4d_free_pud_page can be removed because it's no longer linked to.

Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

Ack or objection if this goes via the -mm tree? 

 arch/powerpc/include/asm/vmalloc.h       | 19 ++++++++++++++++---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 21 ---------------------
 2 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/vmalloc.h b/arch/powerpc/include/asm/vmalloc.h
index 105abb73f075..3f0c153befb0 100644
--- a/arch/powerpc/include/asm/vmalloc.h
+++ b/arch/powerpc/include/asm/vmalloc.h
@@ -1,12 +1,25 @@
 #ifndef _ASM_POWERPC_VMALLOC_H
 #define _ASM_POWERPC_VMALLOC_H
 
+#include <asm/mmu.h>
 #include <asm/page.h>
 
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
+	/* HPT does not cope with large pages in the vmalloc area */
+	return radix_enabled();
+}
+
+static inline bool arch_vmap_pmd_supported(pgprot_t prot)
+{
+	return radix_enabled();
+}
 #endif
 
 #endif /* _ASM_POWERPC_VMALLOC_H */
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index eca83a50bf2e..27f5837cf145 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1134,22 +1134,6 @@ void radix__ptep_modify_prot_commit(struct vm_area_struct *vma,
 	set_pte_at(mm, addr, ptep, pte);
 }
 
-bool arch_vmap_pud_supported(pgprot_t prot)
-{
-	/* HPT does not cope with large pages in the vmalloc area */
-	return radix_enabled();
-}
-
-bool arch_vmap_pmd_supported(pgprot_t prot)
-{
-	return radix_enabled();
-}
-
-int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
-{
-	return 0;
-}
-
 int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
 {
 	pte_t *ptep = (pte_t *)pud;
@@ -1233,8 +1217,3 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 
 	return 1;
 }
-
-bool arch_vmap_p4d_supported(pgprot_t prot)
-{
-	return false;
-}
-- 
2.23.0

