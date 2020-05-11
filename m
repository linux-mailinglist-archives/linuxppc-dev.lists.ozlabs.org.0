Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B76C31CDB54
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 15:37:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LMRf6DGnzDqGB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 23:37:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LJXZ5TkYzDqgN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 21:26:06 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49LJXN67bmz9ty3h;
 Mon, 11 May 2020 13:25:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id FMgpJPev0u1O; Mon, 11 May 2020 13:25:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49LJXN5GRCz9ty3g;
 Mon, 11 May 2020 13:25:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6CD078B7B1;
 Mon, 11 May 2020 13:26:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9u1V3hauYpeT; Mon, 11 May 2020 13:26:03 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 313398B7AD;
 Mon, 11 May 2020 13:26:03 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 155AE65A09; Mon, 11 May 2020 11:26:03 +0000 (UTC)
Message-Id: <907ff427c28e765d031687ef4eaf5667d73ea622.1589196133.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1589196133.git.christophe.leroy@csgroup.eu>
References: <cover.1589196133.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 36/45] powerpc/mm: Don't be too strict with _etext
 alignment on PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 11 May 2020 11:26:03 +0000 (UTC)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Similar to PPC64, accept to map RO data as ROX as a trade off between
between security and memory usage.

Having RO data executable is not a high risk as RO data can't be
modified to forge an exploit.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig              | 26 --------------------------
 arch/powerpc/kernel/vmlinux.lds.S |  3 +--
 2 files changed, 1 insertion(+), 28 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index f552726c9de2..970a5802850f 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -777,32 +777,6 @@ config THREAD_SHIFT
 	  Used to define the stack size. The default is almost always what you
 	  want. Only change this if you know what you are doing.
 
-config ETEXT_SHIFT_BOOL
-	bool "Set custom etext alignment" if STRICT_KERNEL_RWX && \
-					     (PPC_BOOK3S_32 || PPC_8xx)
-	depends on ADVANCED_OPTIONS
-	help
-	  This option allows you to set the kernel end of text alignment. When
-	  RAM is mapped by blocks, the alignment needs to fit the size and
-	  number of possible blocks. The default should be OK for most configs.
-
-	  Say N here unless you know what you are doing.
-
-config ETEXT_SHIFT
-	int "_etext shift" if ETEXT_SHIFT_BOOL
-	range 17 28 if STRICT_KERNEL_RWX && PPC_BOOK3S_32
-	range 19 23 if STRICT_KERNEL_RWX && PPC_8xx
-	default 17 if STRICT_KERNEL_RWX && PPC_BOOK3S_32
-	default 19 if STRICT_KERNEL_RWX && PPC_8xx
-	default PPC_PAGE_SHIFT
-	help
-	  On Book3S 32 (603+), IBATs are used to map kernel text.
-	  Smaller is the alignment, greater is the number of necessary IBATs.
-
-	  On 8xx, large pages (512kb or 8M) are used to map kernel linear
-	  memory. Aligning to 8M reduces TLB misses as only 8M pages are used
-	  in that case.
-
 config DATA_SHIFT_BOOL
 	bool "Set custom data alignment" if STRICT_KERNEL_RWX && \
 					    (PPC_BOOK3S_32 || PPC_8xx)
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 31a0f201fb6f..54f23205c2b9 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -15,7 +15,6 @@
 #include <asm/thread_info.h>
 
 #define STRICT_ALIGN_SIZE	(1 << CONFIG_DATA_SHIFT)
-#define ETEXT_ALIGN_SIZE	(1 << CONFIG_ETEXT_SHIFT)
 
 ENTRY(_stext)
 
@@ -116,7 +115,7 @@ SECTIONS
 
 	} :text
 
-	. = ALIGN(ETEXT_ALIGN_SIZE);
+	. = ALIGN(PAGE_SIZE);
 	_etext = .;
 	PROVIDE32 (etext = .);
 
-- 
2.25.0

