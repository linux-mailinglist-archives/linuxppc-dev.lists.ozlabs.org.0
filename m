Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E25734633CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 13:05:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3LX75xpZz3cZJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 23:05:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3LWf442Zz3096
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 23:05:17 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J3LWZ3f49z9sSh;
 Tue, 30 Nov 2021 13:05:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKcoTWm5tK1Q; Tue, 30 Nov 2021 13:05:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J3LWZ2sMFz9sSc;
 Tue, 30 Nov 2021 13:05:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5234F8B77A;
 Tue, 30 Nov 2021 13:05:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 36Xau2wfNXcp; Tue, 30 Nov 2021 13:05:14 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.93])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1897E8B779;
 Tue, 30 Nov 2021 13:05:14 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1AUC4xKW213784
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 13:04:59 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1AUC4ttM213782;
 Tue, 30 Nov 2021 13:04:55 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/2] powerpc/32: Remove remaining .stabs annotations
Date: Tue, 30 Nov 2021 13:04:49 +0100
Message-Id: <68932ec2ba6b868d35006b96e90f0890f3da3c05.1638273868.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1638273888; l=2086; s=20211009;
 h=from:subject:message-id; bh=v+6AZUUAIkm1K1ji4BPI7+k/pYtl39F3bINLpb4mnRU=;
 b=HrX/aG4xs2klbJH/bh2DRpHnYQsvR55tEM05r6+vIMslXtUGY93tlHCuDY9O/GPsCKLNc4M+eIKo
 FKqcNbKIB2qxPw7sJVTm/WVMQDZ9tnhjEa+rSdy9NPa50Tw1SKKO
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

STABS debug format has been superseded long time ago by DWARF.

Remove the few remaining .stabs annotations from old 32 bits code.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc_asm.h   | 1 -
 arch/powerpc/kernel/head_book3s_32.S | 3 ---
 arch/powerpc/lib/checksum_32.S       | 3 ---
 arch/powerpc/lib/copy_32.S           | 3 ---
 4 files changed, 10 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 7be24048b8d1..35544ba93352 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -197,7 +197,6 @@ GLUE(.,name):
 n:
 
 #define _GLOBAL(n)	\
-	.stabs __stringify(n:F-1),N_FUN,0,0,n;\
 	.globl n;	\
 n:
 
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 68e5c0a7e99d..dae813539851 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -50,9 +50,6 @@
 	mtspr	SPRN_DBAT##n##L,RB
 
 	__HEAD
-	.stabs	"arch/powerpc/kernel/",N_SO,0,0,0f
-	.stabs	"head_book3s_32.S",N_SO,0,0,0f
-0:
 _ENTRY(_stext);
 
 /*
diff --git a/arch/powerpc/lib/checksum_32.S b/arch/powerpc/lib/checksum_32.S
index 27d9070617df..4541e8e29467 100644
--- a/arch/powerpc/lib/checksum_32.S
+++ b/arch/powerpc/lib/checksum_32.S
@@ -116,9 +116,6 @@ EXPORT_SYMBOL(__csum_partial)
 	EX_TABLE(8 ## n ## 7b, fault);
 
 	.text
-	.stabs	"arch/powerpc/lib/",N_SO,0,0,0f
-	.stabs	"checksum_32.S",N_SO,0,0,0f
-0:
 
 CACHELINE_BYTES = L1_CACHE_BYTES
 LG_CACHELINE_BYTES = L1_CACHE_SHIFT
diff --git a/arch/powerpc/lib/copy_32.S b/arch/powerpc/lib/copy_32.S
index a3bcf4786e4a..3e9c27c46331 100644
--- a/arch/powerpc/lib/copy_32.S
+++ b/arch/powerpc/lib/copy_32.S
@@ -57,9 +57,6 @@
 	EX_TABLE(8 ## n ## 7b,9 ## n ## 1b)
 
 	.text
-	.stabs	"arch/powerpc/lib/",N_SO,0,0,0f
-	.stabs	"copy_32.S",N_SO,0,0,0f
-0:
 
 CACHELINE_BYTES = L1_CACHE_BYTES
 LG_CACHELINE_BYTES = L1_CACHE_SHIFT
-- 
2.33.1

