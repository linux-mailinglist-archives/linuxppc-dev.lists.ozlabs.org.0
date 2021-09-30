Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C667041D8C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 13:27:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKrZ850bmz3c6B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 21:27:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKrXS5q00z305j
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 21:26:00 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HKrX903MTz9sX5;
 Thu, 30 Sep 2021 13:25:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id obKTeRCmPpU8; Thu, 30 Sep 2021 13:25:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HKrX64PLsz9sX3;
 Thu, 30 Sep 2021 13:25:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7F71E8B773;
 Thu, 30 Sep 2021 13:25:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fnYy186E_2Gs; Thu, 30 Sep 2021 13:25:42 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.149])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 36CA78B763;
 Thu, 30 Sep 2021 13:25:42 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 18UBO9SS1558831
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 13:24:09 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 18UBO9XY1558830;
 Thu, 30 Sep 2021 13:24:09 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>, arnd@arndb.de
Subject: [PATCH v3 4/4] s390: Use generic version of
 arch_is_kernel_initmem_freed()
Date: Thu, 30 Sep 2021 13:23:46 +0200
Message-Id: <b6feb5dfe611a322de482762fc2df3a9eece70c7.1633001016.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <9ecfdee7dd4d741d172cb93ff1d87f1c58127c9a.1633001016.git.christophe.leroy@csgroup.eu>
References: <9ecfdee7dd4d741d172cb93ff1d87f1c58127c9a.1633001016.git.christophe.leroy@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Heiko Carstens <hca@linux.ibm.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Generic version of arch_is_kernel_initmem_freed() now does the same
as s390 version.

Remove the s390 version.

Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Acked-by: Heiko Carstens <hca@linux.ibm.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: No change
v2: No change
---
 arch/s390/include/asm/sections.h | 12 ------------
 arch/s390/mm/init.c              |  3 ---
 2 files changed, 15 deletions(-)

diff --git a/arch/s390/include/asm/sections.h b/arch/s390/include/asm/sections.h
index 85881dd48022..3fecaa4e8b74 100644
--- a/arch/s390/include/asm/sections.h
+++ b/arch/s390/include/asm/sections.h
@@ -2,20 +2,8 @@
 #ifndef _S390_SECTIONS_H
 #define _S390_SECTIONS_H
 
-#define arch_is_kernel_initmem_freed arch_is_kernel_initmem_freed
-
 #include <asm-generic/sections.h>
 
-extern bool initmem_freed;
-
-static inline int arch_is_kernel_initmem_freed(unsigned long addr)
-{
-	if (!initmem_freed)
-		return 0;
-	return addr >= (unsigned long)__init_begin &&
-	       addr < (unsigned long)__init_end;
-}
-
 /*
  * .boot.data section contains variables "shared" between the decompressor and
  * the decompressed kernel. The decompressor will store values in them, and
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index a04faf49001a..8c6f258a6183 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -58,8 +58,6 @@ unsigned long empty_zero_page, zero_page_mask;
 EXPORT_SYMBOL(empty_zero_page);
 EXPORT_SYMBOL(zero_page_mask);
 
-bool initmem_freed;
-
 static void __init setup_zero_pages(void)
 {
 	unsigned int order;
@@ -214,7 +212,6 @@ void __init mem_init(void)
 
 void free_initmem(void)
 {
-	initmem_freed = true;
 	__set_memory((unsigned long)_sinittext,
 		     (unsigned long)(_einittext - _sinittext) >> PAGE_SHIFT,
 		     SET_MEMORY_RW | SET_MEMORY_NX);
-- 
2.31.1

