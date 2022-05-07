Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C08AE51E4F8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 08:56:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwJ9q5BK0z3cDJ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 16:55:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwJ180lQGz3dsD
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 16:48:27 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KwHzh1LsSz9sWL;
 Sat,  7 May 2022 08:47:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CDYpqlOeHOPS; Sat,  7 May 2022 08:47:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KwHzF3Nv9z9sWP;
 Sat,  7 May 2022 08:46:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 684BD8B770;
 Sat,  7 May 2022 08:46:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zrMZarL3zrno; Sat,  7 May 2022 08:46:49 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 36E238B7AA;
 Sat,  7 May 2022 08:46:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2476kdgK1320502
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 7 May 2022 08:46:39 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2476kdNR1320501;
 Sat, 7 May 2022 08:46:39 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
Subject: [PATCH v2 08/25] powerpc: Add CONFIG_PPC64_ELF_ABI_V1 and
 CONFIG_PPC64_ELF_ABI_V2
Date: Sat,  7 May 2022 08:46:10 +0200
Message-Id: <1eca1addbc550167da9841c7340a010d0c4b2200.1651905939.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651905939.git.christophe.leroy@csgroup.eu>
References: <cover.1651905939.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1651905980; l=2625; s=20211009;
 h=from:subject:message-id; bh=NBoBcjsTO1tovFFuP2hBDk2AHE9R2iPK5NfoSRq7M98=;
 b=DZh2pV1ifDmBcrlI497pyoU09c1q7aHPs55ChkN7kxFO9dRv2OnanUGY9WjjPKtidXyiEmCGvUFt
 +fmiHcW+BaJSMm8dLwBOcMHRFSVAnIv6Uv2302eSyw42uPeousfg
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At the time being, we use CONFIG_CPU_LITTLE_ENDIAN and
CONFIG_CPU_BIG_ENDIAN to pass -mabi=elfv1 or elfv2 to
compiler, then define a PPC64_ELF_ABI_v1 or PPC64_ELF_ABI_v2
macro in asm/types.h based on _CALL_ELF define set by the compiler.

Make it more straight forward with a CONFIG option that
is directly usable.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Makefile                  | 10 +++++-----
 arch/powerpc/boot/Makefile             |  2 ++
 arch/powerpc/platforms/Kconfig.cputype |  6 ++++++
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index eb541e730d3c..1ba98be84101 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -89,10 +89,10 @@ endif
 
 ifdef CONFIG_PPC64
 ifndef CONFIG_CC_IS_CLANG
-cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
-cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mcall-aixdesc)
-aflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
-aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mabi=elfv2
+cflags-$(CONFIG_PPC64_ELF_ABI_V1)	+= $(call cc-option,-mabi=elfv1)
+cflags-$(CONFIG_PPC64_ELF_ABI_V1)	+= $(call cc-option,-mcall-aixdesc)
+aflags-$(CONFIG_PPC64_ELF_ABI_V1)	+= $(call cc-option,-mabi=elfv1)
+aflags-$(CONFIG_PPC64_ELF_ABI_V2)	+= -mabi=elfv2
 endif
 endif
 
@@ -141,7 +141,7 @@ endif
 
 CFLAGS-$(CONFIG_PPC64)	:= $(call cc-option,-mtraceback=no)
 ifndef CONFIG_CC_IS_CLANG
-ifdef CONFIG_CPU_LITTLE_ENDIAN
+ifdef CONFIG_PPC64_ELF_ABI_V2
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2,$(call cc-option,-mcall-aixdesc))
 AFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2)
 else
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 4b4827c475c6..b6d4fe04c594 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -49,6 +49,8 @@ ifdef CONFIG_CPU_BIG_ENDIAN
 BOOTCFLAGS	+= -mbig-endian
 else
 BOOTCFLAGS	+= -mlittle-endian
+endif
+ifdef CONFIG_PPC64_ELF_ABI_V2
 BOOTCFLAGS	+= $(call cc-option,-mabi=elfv2)
 endif
 
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index e2e1fec91c6e..9bfcf972d21d 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -556,6 +556,12 @@ config CPU_LITTLE_ENDIAN
 
 endchoice
 
+config PPC64_ELF_ABI_V1
+	def_bool PPC64 && CPU_BIG_ENDIAN
+
+config PPC64_ELF_ABI_V2
+	def_bool PPC64 && CPU_LITTLE_ENDIAN
+
 config PPC64_BOOT_WRAPPER
 	def_bool n
 	depends on CPU_LITTLE_ENDIAN
-- 
2.35.1

