Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C821F594
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 15:30:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453wQq2p9GzDqQs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 23:30:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EnXZgfrE"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453wDq2LHNzDqVc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 23:21:31 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id t87so1375782pfa.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 06:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F56UeRM9+QYDMfaKmt6HoAUehngERsrruwV76IERiz0=;
 b=EnXZgfrE9ptE7/0LNjdYsc/YDM7sqSD5aCEtxoZtJAZIW1hcwtm+ySiloTvErKAw8p
 vNyxIyyextQQsrHNEWttfI5X89lSErLIXLUjqUWJCJLAVrFHgOjoZAT4d4sK38Rb/XFX
 UhtKIcbSwDiFN63UIGX3zTIzT4QbS75CPXH26G4v7nnPxahaYQ4x7cERq1rC8Qq5c0Ug
 4ojA+2GvmOfLYBD1KltINcBxdKEvsTR3ZVlJZ7JZjEXO0psx4akGXcApVJJC5ffkAlo7
 e7MmTH6kllp+sE4y/9oUaoqHK7oTrD1uQYZjt6C77QNYAB46orbIVcVNQxHxCWQ1B4S2
 l6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F56UeRM9+QYDMfaKmt6HoAUehngERsrruwV76IERiz0=;
 b=Ufg//pPHAxwfY2/VM0m9+ri81Ua0CL0zPL1XJjY4iN005PtAOuLr7JE59tffi7fB/Q
 RdFC9V6w2ImQpwOhDkHlCn3YjUurmTczScSOcWmAWFD+j01RUKE5aBNR9M0IYUbazagn
 Lgq61Y7stTWU1pb8EL7UHW9Gj13uJ5f6QB5HH4V6Ta7UYj167+FJVj6M/W7Xsi+M7XwD
 OBaSBu+mgrITggBR5/VyVlbnP9skKh7zMVwOLGwTUWy+hJ1jqcPhyDbawwXdyZZImPRn
 CeotYaTELMjm9a/9Y3FEzoG+7fwHVuohaFjtqH3zucrGeEl8rpA5RqZvOy/qdBShYW2p
 xXQg==
X-Gm-Message-State: APjAAAVcnIwcwPUzn79axEEFeedrpt2Yji3NDWels7H54BSEw3xETPiY
 6j8+nELs/w4PlKHQQQRP0FbLQvql
X-Google-Smtp-Source: APXvYqx9pRh7/Lft1BW35lbNk8d/eVJJbgQXZdep4WpYEIJ5ohMJcto076tmYlbXhID7nMQmyogIrg==
X-Received: by 2002:a65:478a:: with SMTP id e10mr44277114pgs.310.1557926488724; 
 Wed, 15 May 2019 06:21:28 -0700 (PDT)
Received: from bobo.local0.net (115-64-240-98.tpgi.com.au. [115.64.240.98])
 by smtp.gmail.com with ESMTPSA id a19sm2784459pgm.46.2019.05.15.06.21.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 06:21:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 5/5] powerpc/64s/radix: iomap use huge page mappings
Date: Wed, 15 May 2019 23:19:44 +1000
Message-Id: <20190515131944.12489-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190515131944.12489-1-npiggin@gmail.com>
References: <20190515131944.12489-1-npiggin@gmail.com>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h |  8 +++
 arch/powerpc/mm/pgtable_64.c                 | 54 +++++++++++++++++---
 2 files changed, 56 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 7dede2e34b70..93b8a99df88e 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -274,6 +274,14 @@ extern unsigned long __vmalloc_end;
 #define VMALLOC_START	__vmalloc_start
 #define VMALLOC_END	__vmalloc_end
 
+static inline unsigned int ioremap_max_order(void)
+{
+	if (radix_enabled())
+		return PUD_SHIFT;
+	return 7 + PAGE_SHIFT; /* default from linux/vmalloc.h */
+}
+#define IOREMAP_MAX_ORDER ({ ioremap_max_order();})
+
 extern unsigned long __kernel_virt_start;
 extern unsigned long __kernel_virt_size;
 extern unsigned long __kernel_io_start;
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index d2d976ff8a0e..f660116251e6 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -112,7 +112,7 @@ unsigned long ioremap_bot = IOREMAP_BASE;
  * __ioremap_at - Low level function to establish the page tables
  *                for an IO mapping
  */
-void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_t prot)
+static void __iomem * hash__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_t prot)
 {
 	unsigned long i;
 
@@ -120,6 +120,50 @@ void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_
 	if (pgprot_val(prot) & H_PAGE_4K_PFN)
 		return NULL;
 
+	for (i = 0; i < size; i += PAGE_SIZE)
+		if (map_kernel_page((unsigned long)ea + i, pa + i, prot))
+			return NULL;
+
+	return (void __iomem *)ea;
+}
+
+static int radix__ioremap_page_range(unsigned long addr, unsigned long end,
+		       phys_addr_t phys_addr, pgprot_t prot)
+{
+	while (addr != end) {
+		if (!(addr & ~PUD_MASK) && !(phys_addr & ~PUD_MASK) &&
+				end - addr >= PUD_SIZE) {
+			if (radix__map_kernel_page(addr, phys_addr, prot, PUD_SIZE))
+				return -ENOMEM;
+			addr += PUD_SIZE;
+			phys_addr += PUD_SIZE;
+
+		} else if (!(addr & ~PMD_MASK) && !(phys_addr & ~PMD_MASK) &&
+				end - addr >= PMD_SIZE) {
+			if (radix__map_kernel_page(addr, phys_addr, prot, PMD_SIZE))
+				return -ENOMEM;
+			addr += PMD_SIZE;
+			phys_addr += PMD_SIZE;
+
+		} else {
+			if (radix__map_kernel_page(addr, phys_addr, prot, PAGE_SIZE))
+				return -ENOMEM;
+			addr += PAGE_SIZE;
+			phys_addr += PAGE_SIZE;
+		}
+	}
+	return 0;
+}
+
+static void __iomem * radix__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_t prot)
+{
+	if (radix__ioremap_page_range((unsigned long)ea, (unsigned long)ea + size, pa, prot))
+		return NULL;
+	return ea;
+}
+
+void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_t prot)
+{
 	if ((ea + size) >= (void *)IOREMAP_END) {
 		pr_warn("Outside the supported range\n");
 		return NULL;
@@ -129,11 +173,9 @@ void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_
 	WARN_ON(((unsigned long)ea) & ~PAGE_MASK);
 	WARN_ON(size & ~PAGE_MASK);
 
-	for (i = 0; i < size; i += PAGE_SIZE)
-		if (map_kernel_page((unsigned long)ea + i, pa + i, prot))
-			return NULL;
-
-	return (void __iomem *)ea;
+	if (radix_enabled())
+		return radix__ioremap_at(pa, ea, size, prot);
+	return hash__ioremap_at(pa, ea, size, prot);
 }
 
 /**
-- 
2.20.1

