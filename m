Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6DE651DB0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 10:42:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nbs6p1NYKz3fHT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 20:42:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nbs5G0qWhz3bYS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Dec 2022 20:40:49 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Nbs510XP4z9t3x;
	Tue, 20 Dec 2022 10:40:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32pkwqY0LbxU; Tue, 20 Dec 2022 10:40:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Nbs4n6ZpLz9t43;
	Tue, 20 Dec 2022 10:40:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DA0F68B774;
	Tue, 20 Dec 2022 10:40:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id DDd5Y44QPcws; Tue, 20 Dec 2022 10:40:25 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.18])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A65488B763;
	Tue, 20 Dec 2022 10:40:25 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2BJIkGtg1709629
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Dec 2022 19:46:17 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2BJIkGYK1709627;
	Mon, 19 Dec 2022 19:46:16 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        jbglaw@lug-owl.de
Subject: [PATCH v1 4/5] powerpc: Remove cpu-as-y completely
Date: Mon, 19 Dec 2022 19:45:59 +0100
Message-Id: <9e43ad8b173c2fdb540e2555a8ba3e375419f3cf.1671475543.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <38a8d765ed9149bc6b5484a7142e3bc59ffa3b1a.1671475543.git.christophe.leroy@csgroup.eu>
References: <38a8d765ed9149bc6b5484a7142e3bc59ffa3b1a.1671475543.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1671475558; l=1858; s=20211009; h=from:subject:message-id; bh=TbbVpgGjGpLM0aKHipGO6N97h2hzS9n0S3TlNDngFWw=; b=B0po3xQxGGSdn4RspbZEbUrEo9FNFc3y4DvnyAfGr2hOYLM+vUmb6LgdPp+LoPiEddN3DZqv3tnm Y0zig3wEDcrYUrDFso6GCnE+RiMwfPkoLLwNsUblj3p9Jx6gi9w1
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

cpu-as-y is there to force assembler building options.
But there is no need for that. Gcc is passed the necessary
options and it automatically pass the appropriate option to
GAS.

GCC is given -maltivec when relevant, so no need
for -Wa,-maltivec in addition

And -Wa,-many is wrong as it will hide innapropriate
instructions. Better to detect them and handle them on a
case by case basis.
-Wa,-many was added by commit 960e30029863 ("powerpc/Makefile:
Fix PPC_BOOK3S_64 ASFLAGS") in order to fix an issue with
clang and the passed -Wa,-mpower4 option. But we have now
removed it expecting the compiler to automatically pass the
proper options and instructions based on -mcpu=power4

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Makefile | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 0f9f291895cb..7e67f939a243 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -201,18 +201,6 @@ KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
 # often slow when they are implemented at all
 KBUILD_CFLAGS		+= $(call cc-option,-mno-string)
 
-cpu-as-$(CONFIG_ALTIVEC)	+= $(call as-option,-Wa$(comma)-maltivec)
-
-# When using '-many -mpower4' gas will first try and find a matching power4
-# mnemonic and failing that it will allow any valid mnemonic that GAS knows
-# about. GCC will pass -many to GAS when assembling, clang does not.
-# LLVM IAS doesn't understand either flag: https://github.com/ClangBuiltLinux/linux/issues/675
-# but LLVM IAS only supports ISA >= 2.06 for Book3S 64 anyway...
-cpu-as-$(CONFIG_PPC_BOOK3S_64)	+= $(call as-option,-Wa$(comma)-many)
-
-KBUILD_AFLAGS += $(cpu-as-y)
-KBUILD_CFLAGS += $(cpu-as-y)
-
 KBUILD_AFLAGS += $(aflags-y)
 KBUILD_CFLAGS += $(cflags-y)
 
-- 
2.38.1

