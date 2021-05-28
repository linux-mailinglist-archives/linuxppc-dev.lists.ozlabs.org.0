Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC1F393B1C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 03:38:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrnQW0MG6z2yss
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:38:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=bPQK6f9g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=r.bolshakov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=bPQK6f9g; dkim-atps=neutral
X-Greylist: delayed 496 seconds by postgrey-1.36 at boromir;
 Fri, 28 May 2021 11:38:15 AEST
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrnPz1NbNz307W
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 11:38:14 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 9F6E041319;
 Fri, 28 May 2021 01:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1622165395; x=
 1623979796; bh=l5WIiBz2759Ce4tmaO9TSfEOtVvDNp1wIVB46uYGKLY=; b=b
 PQK6f9gWCVuzSZHlOo7ZMXmmd3A4ivlBDJ0Xj80L8JuyINf/LM0HD5KBkzw8kDxE
 JkqRvYA0HLuGffQSyY2rSCJNzWu3I8TS6RsSdgiAOh3A9dbZZxBL9etvWDVISTuB
 KpIobEcVK58gScINBJQktrfxVsC76dQGP8Y7f1lpyQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BPGWXwyZgHh8; Fri, 28 May 2021 04:29:55 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id BCEA7411D9;
 Fri, 28 May 2021 04:29:54 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 28
 May 2021 04:29:54 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
 <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] Revert "powerpc: Switch to relative jump labels"
Date: Fri, 28 May 2021 04:29:43 +0300
Message-ID: <20210528012943.23192-1-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Anastasia Kovaleva <a.kovaleva@yadro.com>, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit b0b3b2c78ec075cec4721986a95abbbac8c3da4f.

Otherwise, direct kernel boot with initramfs no longer works in QEMU.
It's broken in some bizarre way because a valid initramfs is not
recognized anymore:

  Found initrd at 0xc000000001f70000:0xc000000003d61d64
  rootfs image is not initramfs (XZ-compressed data is corrupt); looks like an initrd

The issue is observed on v5.13-rc3 if the kernel is built with
defconfig, GCC 7.5.0 and GNU ld 2.32.0.

Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Reported-by: Anastasia Kovaleva <a.kovaleva@yadro.com>
Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 arch/powerpc/Kconfig                  |  1 -
 arch/powerpc/include/asm/jump_label.h | 21 +++++++++++++++------
 arch/powerpc/kernel/jump_label.c      |  4 ++--
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 088dd2afcfe4..59e0d55ee01d 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -189,7 +189,6 @@ config PPC
 	select HAVE_ARCH_HUGE_VMALLOC		if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
 	select HAVE_ARCH_JUMP_LABEL
-	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
 	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <= 14
 	select HAVE_ARCH_KFENCE			if PPC32
diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
index 2d5c6bec2b4f..09297ec9fa52 100644
--- a/arch/powerpc/include/asm/jump_label.h
+++ b/arch/powerpc/include/asm/jump_label.h
@@ -20,8 +20,7 @@ static __always_inline bool arch_static_branch(struct static_key *key, bool bran
 	asm_volatile_goto("1:\n\t"
 		 "nop # arch_static_branch\n\t"
 		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".long 1b - ., %l[l_yes] - .\n\t"
-		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
+		 JUMP_ENTRY_TYPE "1b, %l[l_yes], %c0\n\t"
 		 ".popsection \n\t"
 		 : :  "i" (&((char *)key)[branch]) : : l_yes);
 
@@ -35,8 +34,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key, bool
 	asm_volatile_goto("1:\n\t"
 		 "b %l[l_yes] # arch_static_branch_jump\n\t"
 		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".long 1b - ., %l[l_yes] - .\n\t"
-		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
+		 JUMP_ENTRY_TYPE "1b, %l[l_yes], %c0\n\t"
 		 ".popsection \n\t"
 		 : :  "i" (&((char *)key)[branch]) : : l_yes);
 
@@ -45,12 +43,23 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key, bool
 	return true;
 }
 
+#ifdef CONFIG_PPC64
+typedef u64 jump_label_t;
+#else
+typedef u32 jump_label_t;
+#endif
+
+struct jump_entry {
+	jump_label_t code;
+	jump_label_t target;
+	jump_label_t key;
+};
+
 #else
 #define ARCH_STATIC_BRANCH(LABEL, KEY)		\
 1098:	nop;					\
 	.pushsection __jump_table, "aw";	\
-	.long 1098b - ., LABEL - .;		\
-	FTR_ENTRY_LONG KEY;			\
+	FTR_ENTRY_LONG 1098b, LABEL, KEY;	\
 	.popsection
 #endif
 
diff --git a/arch/powerpc/kernel/jump_label.c b/arch/powerpc/kernel/jump_label.c
index ce87dc5ea23c..144858027fa3 100644
--- a/arch/powerpc/kernel/jump_label.c
+++ b/arch/powerpc/kernel/jump_label.c
@@ -11,10 +11,10 @@
 void arch_jump_label_transform(struct jump_entry *entry,
 			       enum jump_label_type type)
 {
-	struct ppc_inst *addr = (struct ppc_inst *)jump_entry_code(entry);
+	struct ppc_inst *addr = (struct ppc_inst *)(unsigned long)entry->code;
 
 	if (type == JUMP_LABEL_JMP)
-		patch_branch(addr, jump_entry_target(entry), 0);
+		patch_branch(addr, entry->target, 0);
 	else
 		patch_instruction(addr, ppc_inst(PPC_INST_NOP));
 }
-- 
2.31.1

