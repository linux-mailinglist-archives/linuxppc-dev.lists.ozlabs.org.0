Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C157303396
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 06:00:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPvg44KMfzDqSC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 16:00:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=W4RA86kL; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPvLy2dNKzDqnw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 15:46:02 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id i7so10767809pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 20:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6FRU9caWwWjvnrqszVqRsss5Upxnc33B3OfV8qLPoO8=;
 b=W4RA86kLnjWTiuxUVbhONI6Bm+cKfU0zTwzeNm5Bh2PbwqcffIaLtWkSkMYi9d74KQ
 YEw21XNE3s/6pt6oWrl33dPhznWfHD9G0D36P7KyBrgUXzdxHUgr7slPtOfwICeSOtfK
 bGdsVWUXp6Xdbr4MtOOiC7eleBcaVYUzllWgVMgPFJ56fuV1J3PXJ64m5CEhUV/Iz/l1
 RzTxY0RCEAQ+DMUXEM+Gzn26nxeLSgMQZ8q6edNT4k8ioRm5dw+igsdP+aErr8FOPKf0
 3KpLEgbCEQHzq+Gn0Q4K0EmZW589YkLiZVc4Sjp4qewZX1RlbqdDBRTv8Dv9skqCbZ+Q
 XJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6FRU9caWwWjvnrqszVqRsss5Upxnc33B3OfV8qLPoO8=;
 b=pVw/A0wZCDMiYRcZZEke5YtHU3i0U9I3rSi6PtL7O5h2ec7gq6L9/49irAHHZsg252
 GiE/7p0TqvrskEJelt9DAhjyVkJAadpSds9n0mBRc/HS/l7VAs8M0GpvSmsYOEWLEsx2
 W8jkRtbbQxmmTUQHHwzEZe4AMArNVMqLG1tMYyfnsqscKT/AUM6jq3SYSrimMCtotsOK
 M7oitxXgAvb/y0tOTduJboQRbioesMe1YUAP50JG/ikthD6ur4XrML2UqA4BtoqxFjJJ
 utXSaBBIdL4UoEPNWmb0Tme/9zVDbcngXjhXVEgK982ZIPaOGqgzWCzLdhKIBLc8A5Ys
 Cf1w==
X-Gm-Message-State: AOAM532NfG8rEFM/mxYVfYg9dLuqShmpPj+iGE77UFbq8ejIi0dx0NxM
 A6CyFiN/nUi8eyVHenMcr4U=
X-Google-Smtp-Source: ABdhPJwh8Tjq5Jl4agwd7Q0coDWv3fX5SZ4w1pL9yRhmvQDkl3nOUH6J4NwYY7EEGKRaZEhSNooRCA==
X-Received: by 2002:a63:505d:: with SMTP id q29mr3910504pgl.241.1611636357203; 
 Mon, 25 Jan 2021 20:45:57 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id 68sm19272293pfg.90.2021.01.25.20.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 20:45:56 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v11 06/13] powerpc: inline huge vmap supported functions
Date: Tue, 26 Jan 2021 14:45:03 +1000
Message-Id: <20210126044510.2491820-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210126044510.2491820-1-npiggin@gmail.com>
References: <20210126044510.2491820-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Christoph Hellwig <hch@infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This allows unsupported levels to be constant folded away, and so
p4d_free_pud_page can be removed because it's no longer linked to.

Cc: linuxppc-dev@lists.ozlabs.org
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
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
index 743807fc210f..8da62afccee5 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1082,22 +1082,6 @@ void radix__ptep_modify_prot_commit(struct vm_area_struct *vma,
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
@@ -1181,8 +1165,3 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 
 	return 1;
 }
-
-bool arch_vmap_p4d_supported(pgprot_t prot)
-{
-	return false;
-}
-- 
2.23.0

