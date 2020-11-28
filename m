Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AC42C6FC8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 16:34:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjwXl0WqqzDrbv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 02:34:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=A3gGRu5d; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjwN706HPzDrRX
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 02:26:42 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id b63so7020675pfg.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 07:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HiUfAFVtYQfdJFI+mGar/loPm26LbyhdUt8nmYytWQQ=;
 b=A3gGRu5dqYV4wlZ1HSMJuyRU2KVVwSna1s3allWsCrZSZpCden2jSG3fkW0rG9vz/j
 OtwCPxKAT8km/uQ1MKkUTu+QQDOSRZz9Hzvlp84CtqVqt2QaW3W+BXA8nw8oS42FCk3D
 Azmf7mgnir2eebHu/lAGtKDiTTWUG2syQoNQrH+d1khykwyjooZsbc2r3TF2hSyHQIhm
 3tDJdb7yepKfdD5AnW43ThT9SNKtq6CeOzsAebOHgQdq/JsCqQdfzhZHOEQjmjzL0m9l
 c+psqyyU7shRB1jTsu/aoB1FFHlHZ8Dg+vWnnloIJjBpih1pKn8m0l3vYMnDVyWGh9bl
 jWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HiUfAFVtYQfdJFI+mGar/loPm26LbyhdUt8nmYytWQQ=;
 b=ApkSBWDVwKjH4sHRmvLPAXx3Xd7e7QFd0zKLxkjISaSIl1rJO9qpS4TJ+JQzT+1jAP
 pz1KR+/wm1SSXjIyJMssF7NZGx/54sIvyi7FT3344dUSQnB819FMynq4vLliD2jlemF2
 mBMKJ3AYLxitgkNpMAr2RoC8FJPHCwjLxuOINlGwJTGTmrQsGQTXmERK4gnfJEsoYa17
 HHiUXYf2rjQykKD6lU3Bxcb+Cz+I3QenlhxkJPR28JoyZDmpqqUW8AogOXkn13O7gRbK
 5IJV+GNuQAdjYI5VPaJdmYe1Zo7za+sWsRFAY09x5xeT0YY3XfFmeFaV4QAT2cRcepbx
 cYqg==
X-Gm-Message-State: AOAM5303u2OdpTKMdTDSpe7bZJ2jpO6SX5/M/PfyoF9MQxJPLdaXLDZZ
 iQRvJNy4/xjuPaL8wJ67hzc=
X-Google-Smtp-Source: ABdhPJyehobbdhtJfrsGlBn/msduPYZSxJp3aAhhQmtc5CYMrltqWkZrPiWvHMpKGy2rAjgf56PwLA==
X-Received: by 2002:a17:90a:a781:: with SMTP id
 f1mr17051655pjq.50.1606577199740; 
 Sat, 28 Nov 2020 07:26:39 -0800 (PST)
Received: from bobo.ibm.com (193-116-103-132.tpgi.com.au. [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id d22sm15500173pjw.11.2020.11.28.07.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 07:26:39 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 06/12] powerpc: inline huge vmap supported functions
Date: Sun, 29 Nov 2020 01:25:53 +1000
Message-Id: <20201128152559.999540-7-npiggin@gmail.com>
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
index ab426fc0cd4b..de6b558dc187 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1121,22 +1121,6 @@ void radix__ptep_modify_prot_commit(struct vm_area_struct *vma,
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
@@ -1220,8 +1204,3 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 
 	return 1;
 }
-
-bool arch_vmap_p4d_supported(pgprot_t prot)
-{
-	return false;
-}
-- 
2.23.0

