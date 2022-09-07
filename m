Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A32DA5B0097
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 11:36:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMxvr316Mz3chb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 19:36:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMxv61Wydz3bqT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 19:35:29 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MMxtv3njQz9sg4;
	Wed,  7 Sep 2022 11:35:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PdWygxaEbxp6; Wed,  7 Sep 2022 11:35:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MMxtt3Krlz9sj9;
	Wed,  7 Sep 2022 11:35:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 61EF98B78D;
	Wed,  7 Sep 2022 11:35:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id DUFADMmpvT9c; Wed,  7 Sep 2022 11:35:18 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3CF968B763;
	Wed,  7 Sep 2022 11:35:18 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2879Z8KU3152071
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 7 Sep 2022 11:35:08 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2879Z8ru3152070;
	Wed, 7 Sep 2022 11:35:08 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "linux-mm @ kvack . org" <linux-mm@kvack.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 2/2] powerpc: Rely on generic definition of hugepd_t and is_hugepd when unused
Date: Wed,  7 Sep 2022 11:34:45 +0200
Message-Id: <da81462d93069bb90fe5e762dd3283a644318937.1662543243.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <ae6aa7fce84f7abcbf67f534271a4a6dd7949b0d.1662543243.git.christophe.leroy@csgroup.eu>
References: <ae6aa7fce84f7abcbf67f534271a4a6dd7949b0d.1662543243.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662543257; l=3051; s=20211009; h=from:subject:message-id; bh=dwvDuzlvq8SONoorrKNa3VmFaR8M1glUWqk5WhAXBgo=; b=vDUAQ9zt8ZjKgw7JWG6OHZMPKGrg9wlKqPAq1rwSdhtsZp4W32W4E66xE+EkG62IH7nmh/UZratW 8tkhhJDoDEUpXX9Y4Hmh8iJumy/XhgKFMnvrlsLn+ykkPVaW0NLD
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CONFIG_ARCH_HAS_HUGEPD is used to tell core mm when huge page
directories are used.

When they are not used, no need to provide hugepd_t or is_hugepd(),
just rely on the core mm fallback definition.

For that, change core mm behaviour so that CONFIG_ARCH_HAS_HUGEPD
is used instead of indirect is_hugepd macro existence.

powerpc being the only user of huge page directories, there is no
impact on other architectures.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/page.h             | 5 -----
 arch/powerpc/include/asm/pgtable-be-types.h | 2 ++
 arch/powerpc/include/asm/pgtable-types.h    | 2 ++
 include/linux/hugetlb.h                     | 2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index c67eb9531a3f..7f20636d13ed 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -308,11 +308,6 @@ static inline bool pfn_valid(unsigned long pfn)
 #include <asm/pgtable-types.h>
 #endif
 
-
-#ifndef CONFIG_HUGETLB_PAGE
-#define is_hugepd(pdep)		(0)
-#endif /* CONFIG_HUGETLB_PAGE */
-
 struct page;
 extern void clear_user_page(void *page, unsigned long vaddr, struct page *pg);
 extern void copy_user_page(void *to, void *from, unsigned long vaddr,
diff --git a/arch/powerpc/include/asm/pgtable-be-types.h b/arch/powerpc/include/asm/pgtable-be-types.h
index b169bbf95fcb..82633200b500 100644
--- a/arch/powerpc/include/asm/pgtable-be-types.h
+++ b/arch/powerpc/include/asm/pgtable-be-types.h
@@ -101,6 +101,7 @@ static inline bool pmd_xchg(pmd_t *pmdp, pmd_t old, pmd_t new)
 	return pmd_raw(old) == prev;
 }
 
+#ifdef CONFIG_ARCH_HAS_HUGEPD
 typedef struct { __be64 pdbe; } hugepd_t;
 #define __hugepd(x) ((hugepd_t) { cpu_to_be64(x) })
 
@@ -108,5 +109,6 @@ static inline unsigned long hpd_val(hugepd_t x)
 {
 	return be64_to_cpu(x.pdbe);
 }
+#endif
 
 #endif /* _ASM_POWERPC_PGTABLE_BE_TYPES_H */
diff --git a/arch/powerpc/include/asm/pgtable-types.h b/arch/powerpc/include/asm/pgtable-types.h
index efed0db7b1db..082c85cc09b1 100644
--- a/arch/powerpc/include/asm/pgtable-types.h
+++ b/arch/powerpc/include/asm/pgtable-types.h
@@ -83,11 +83,13 @@ static inline bool pte_xchg(pte_t *ptep, pte_t old, pte_t new)
 }
 #endif
 
+#ifdef CONFIG_ARCH_HAS_HUGEPD
 typedef struct { unsigned long pd; } hugepd_t;
 #define __hugepd(x) ((hugepd_t) { (x) })
 static inline unsigned long hpd_val(hugepd_t x)
 {
 	return x.pd;
 }
+#endif
 
 #endif /* _ASM_POWERPC_PGTABLE_TYPES_H */
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 3ec981a0d8b3..1ec1535be04f 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -17,7 +17,7 @@ struct ctl_table;
 struct user_struct;
 struct mmu_gather;
 
-#ifndef is_hugepd
+#ifndef CONFIG_ARCH_HAS_HUGEPD
 typedef struct { unsigned long pd; } hugepd_t;
 #define is_hugepd(hugepd) (0)
 #define __hugepd(x) ((hugepd_t) { (x) })
-- 
2.37.1

