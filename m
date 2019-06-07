Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3147638446
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 08:24:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Kstw3X35zDqBN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 16:24:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qpgwmo+B"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Ksq23R0PzDqFC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 16:21:02 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id u17so583737pfn.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2019 23:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4NWOIK8RqXV1Z0c7HGWMQUem4tMfyzTDAbk6azU2yDQ=;
 b=qpgwmo+BIs/bGAo5yGs7Vy3+OrBeNzagzzWW2BikffRheBPPDCCfHabLIexgm94atJ
 smJuAle58NHWLPxvwOy7AQqoYguL/b2iOhvLDtAdYzsZ0OUa5mz9HvAeBpXexYLTj8Pr
 tTbJY6Rt9cTesXkGFYWpgsxmvVokXF8aVnv8R6wVC4T0/3ZyIBzMWg292sJg9rO5NF95
 vAs5P5hLDxq1fgXhD77wT4ZJcBS2xNrgo50b6EV6OHGJMqaqYAyFdRAERrJ21abV6JgX
 +K3/NFV2TMr0mh1LkvjRkpNcu+jq2gIgfmoxTODdQmBN5OTvpn4Jlcn9flTc9N/QFqzq
 SpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4NWOIK8RqXV1Z0c7HGWMQUem4tMfyzTDAbk6azU2yDQ=;
 b=lC4d2W/Pn5Je7oNcN679VUBJqBu383v7rR9frM3F/yS5bRRhZGFe8wBvG4f4dFqcRM
 8Gpjwo9ujjapiTLTbrQmZ/QpRqveVIg5bk0MEsvrTWXOlUB1f3xh1tSGW4T7bUTwA1bT
 bnlakDhk6lNd+KX+OkggXc+gBGkQI/ACI28WuWR8asLlUfNNo3sOJpCkrwt5hv8F6jdp
 bpYOr5hwKyhWLro7Z1HxupKWdAn62+opx+gJMLy6cW/QOSioMdLrIF/+SRrghvd0e57Z
 1ELZaJPtiZpOrZUCewTrcM4DH9Pqpfzb76fHDkiaWSCR1Cr/fOBA0lOjADhMeyDqh13U
 stNA==
X-Gm-Message-State: APjAAAV8rOS34w79hR8gBoIhMkhNTpWsn0TtOop9cfy8pU9ctC6fgzOu
 JwiJbHYN53PagJN0z8EwbmL1zKgmmZ8=
X-Google-Smtp-Source: APXvYqxj0nA5IQj9uPHlNHvKkqClaseXd1V13X2OXTJVTYqacs9EVUjAt0ilyMEbfjj0B/vbZUd/9w==
X-Received: by 2002:a62:2643:: with SMTP id m64mr55308775pfm.46.1559888459969; 
 Thu, 06 Jun 2019 23:20:59 -0700 (PDT)
Received: from bobo.local0.net ([202.125.30.143])
 by smtp.gmail.com with ESMTPSA id w24sm1215748pga.90.2019.06.06.23.20.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 23:20:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64s/radix: ioremap use huge page mappings
Date: Fri,  7 Jun 2019 16:19:22 +1000
Message-Id: <20190607061922.20542-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190607061922.20542-1-npiggin@gmail.com>
References: <20190607061922.20542-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc/64s does not use ioremap_page_range, so it does not get huge
vmap iomap mappings automatically. The radix kernel mapping function
already allows larger page mappings that work with huge vmap, so wire
that up to allow huge pages to be used for ioremap mappings.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h |  8 +++
 arch/powerpc/mm/pgtable_64.c                 | 58 ++++++++++++++++++--
 include/linux/io.h                           |  1 +
 lib/ioremap.c                                |  2 +-
 4 files changed, 62 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index ccf00a8b98c6..d7a4f2d80598 100644
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
index d2d976ff8a0e..cf02b67eee55 100644
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
 
@@ -120,6 +120,54 @@ void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_
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
+		if (unlikely(ioremap_huge_disabled))
+			goto use_small_page;
+
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
+use_small_page:
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
@@ -129,11 +177,9 @@ void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_
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
diff --git a/include/linux/io.h b/include/linux/io.h
index 32e30e8fb9db..423c4294aaa3 100644
--- a/include/linux/io.h
+++ b/include/linux/io.h
@@ -44,6 +44,7 @@ static inline int ioremap_page_range(unsigned long addr, unsigned long end,
 #endif
 
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
+extern int ioremap_huge_disabled;
 void __init ioremap_huge_init(void);
 int arch_ioremap_pud_supported(void);
 int arch_ioremap_pmd_supported(void);
diff --git a/lib/ioremap.c b/lib/ioremap.c
index 063213685563..386ff956755f 100644
--- a/lib/ioremap.c
+++ b/lib/ioremap.c
@@ -18,7 +18,7 @@
 static int __read_mostly ioremap_p4d_capable;
 static int __read_mostly ioremap_pud_capable;
 static int __read_mostly ioremap_pmd_capable;
-static int __read_mostly ioremap_huge_disabled;
+int __read_mostly ioremap_huge_disabled;
 
 static int __init set_nohugeiomap(char *str)
 {
-- 
2.20.1

