Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B733AD79
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 05:14:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45MdWs6dFDzDqQ5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 13:14:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DaQ5CAXD"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45MdS95JdXzDqGM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 13:10:48 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id d30so4218878pgm.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Jun 2019 20:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m+xWqHV2mVkA5vVhYFjy67EH9UCf4KFVKtPULrOWtBU=;
 b=DaQ5CAXDLCHqbJcMocMIiHpV9Xwlpnuc+Gr0gxUeGyTtjDS5/CsFa5LbxtGra7U9Uq
 I8vnLk57j87h8BbsJNS51Uz0ToCELkLsVXiGbQeFDyibcqY9A2I5eK7CM95C2qIxwSQa
 Tv3ESKIRXhCAbNI1SWw+MktyDsVexJuaSbX36ZgpW6s3SNDs88aZzjzbvFpg6dZO1ozO
 t+7yglMOmIp6rUXGcBOKQNuexHhHSiyBJ24kcsLgSt4wCwaDTyxxV4Zu+iNxAwe7SiaP
 DIx40ahP0Z4M6hSeFK+1cR6TRodTrLnEh2NPM+Qtzgw9oAeNvrQK26ctF1053f1SUHPW
 UFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m+xWqHV2mVkA5vVhYFjy67EH9UCf4KFVKtPULrOWtBU=;
 b=GZozD77NwCNx96GCWMM/tlHOVDM/qRz5VksxLbhWgqMQBaKoDjP5QxAuQPlpC+C8+I
 cTyLgMAmdltvz5TQ9dx2H/5iKBsmOAI4CcyeS9Hc+EbQwWdNmm3+LdLvhwTJKLTZLHRv
 ELJS1t7nh69K84hhC0I9v1reazie2NpBjVgWqyPiBklJ3Z+amOJa78pttGOOyHDCSqaw
 0xeUDi53BC4m8uAA8Oj4InPkdpUTU22lMeW6qoAmBLXUC+X4aLDmyJPl2RsJ5CGxpjte
 SRTv1fJtFb7uNsGMN6+mgEk6WxoZ2Bld8nNZelaypOCr/gSmQwI5HH7ooa9eUAznbJi8
 h+WA==
X-Gm-Message-State: APjAAAVJfazG2TQGCScBbBvt8jSled9u7cC0hcN2M+8cRv7DMha0yjZZ
 fTYz7bJtE3k71a6MGtWIOOEi5mWz
X-Google-Smtp-Source: APXvYqwd+xqBHoGVNgV5t4hZodER0AicTnZN8pimQviC73tHQAfrNKRCYEKIxKmzekHWkEgcU3lnIQ==
X-Received: by 2002:a62:fb0a:: with SMTP id x10mr49501632pfm.224.1560136245928; 
 Sun, 09 Jun 2019 20:10:45 -0700 (PDT)
Received: from bobo.local0.net (60-241-56-246.tpgi.com.au. [60.241.56.246])
 by smtp.gmail.com with ESMTPSA id w1sm11118865pfg.51.2019.06.09.20.10.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 20:10:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/64s/radix: ioremap use ioremap_page_range
Date: Mon, 10 Jun 2019 13:08:17 +1000
Message-Id: <20190610030818.17965-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190610030818.17965-1-npiggin@gmail.com>
References: <20190610030818.17965-1-npiggin@gmail.com>
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

Radix can use ioremap_page_range for ioremap, after slab is available.
This makes it possible to enable huge ioremap mapping support.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/radix.h |  3 +++
 arch/powerpc/mm/book3s64/pgtable.c         | 21 +++++++++++++++++++++
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 21 +++++++++++++++++++++
 arch/powerpc/mm/pgtable_64.c               |  2 +-
 4 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index 574eca33f893..e04a839cb5b9 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -266,6 +266,9 @@ extern void radix__vmemmap_remove_mapping(unsigned long start,
 extern int radix__map_kernel_page(unsigned long ea, unsigned long pa,
 				 pgprot_t flags, unsigned int psz);
 
+extern int radix__ioremap_range(unsigned long ea, phys_addr_t pa,
+				unsigned long size, pgprot_t prot, int nid);
+
 static inline unsigned long radix__get_tree_size(void)
 {
 	unsigned long rts_field;
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index ff98b663c83e..953850a602f7 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -450,3 +450,24 @@ int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
 
 	return true;
 }
+
+int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot, int nid)
+{
+	unsigned long i;
+
+	if (radix_enabled())
+		return radix__ioremap_range(ea, pa, size, prot, nid);
+
+	for (i = 0; i < size; i += PAGE_SIZE) {
+		int err = map_kernel_page(ea + i, pa + i, prot);
+		if (err) {
+			if (slab_is_available())
+				unmap_kernel_range(ea, size);
+			else
+				WARN_ON_ONCE(1); /* Should clean up */
+			return err;
+		}
+	}
+
+	return 0;
+}
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index c9bcf428dd2b..db993bc1aef3 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -11,6 +11,7 @@
 
 #define pr_fmt(fmt) "radix-mmu: " fmt
 
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/sched/mm.h>
 #include <linux/memblock.h>
@@ -1122,3 +1123,23 @@ void radix__ptep_modify_prot_commit(struct vm_area_struct *vma,
 
 	set_pte_at(mm, addr, ptep, pte);
 }
+
+int radix__ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size,
+			pgprot_t prot, int nid)
+{
+	if (likely(slab_is_available())) {
+		int err = ioremap_page_range(ea, ea + size, pa, prot);
+		if (err)
+			unmap_kernel_range(ea, size);
+		return err;
+	} else {
+		unsigned long i;
+
+		for (i = 0; i < size; i += PAGE_SIZE) {
+			int err = map_kernel_page(ea + i, pa + i, prot);
+			if (WARN_ON_ONCE(err)) /* Should clean up */
+				return err;
+		}
+		return 0;
+	}
+}
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 6bd3660388aa..63cd81130643 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -108,7 +108,7 @@ unsigned long ioremap_bot;
 unsigned long ioremap_bot = IOREMAP_BASE;
 #endif
 
-static int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot, int nid)
+int __weak ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size, pgprot_t prot, int nid)
 {
 	unsigned long i;
 
-- 
2.20.1

