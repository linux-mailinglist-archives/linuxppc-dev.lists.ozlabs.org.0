Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEE05AA93F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 09:58:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJqyt1kp9z3bY5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 17:57:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJqyQ5BJRz2y6M
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 17:57:32 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MJqyH4LY4z9sld;
	Fri,  2 Sep 2022 09:57:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id egxSLJOecBhG; Fri,  2 Sep 2022 09:57:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MJqyH3Y3fz9slD;
	Fri,  2 Sep 2022 09:57:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 69A528B786;
	Fri,  2 Sep 2022 09:57:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 5F1jFIdX3c_t; Fri,  2 Sep 2022 09:57:27 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.39])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 285438B764;
	Fri,  2 Sep 2022 09:57:27 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2827vFUZ2087537
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 2 Sep 2022 09:57:16 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2827vEmo2087532;
	Fri, 2 Sep 2022 09:57:14 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/vdso: link with -z noexecstack
Date: Fri,  2 Sep 2022 09:57:09 +0200
Message-Id: <24daf2ae379597b8d5dff41e4f7cebdca9db2d9d.1662105421.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662105428; l=2854; s=20211009; h=from:subject:message-id; bh=4je2IPtBOUkkvQQU234Vx8lnLidiGcAfki042ic7QVE=; b=zUXL5Kcv3xh4MsDlXA8hP1kHNQXHVAYG8V2A7SERteqNZfjtQESoZZWuXQ49N9x9iji2a/hsB9XZ 5TwTvbA/AVj/LthdmbXkpazX71z2VFU7TxWpoNUcSsEBxh5DK878
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

With recent binutils, the following warning appears:

  VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
/opt/gcc-12.2.0-nolibc/powerpc64-linux/bin/../lib/gcc/powerpc64-linux/12.2.0/../../../../powerpc64-linux/bin/ld: warning: arch/powerpc/kernel/vdso/getcpu-32.o: missing .note.GNU-stack section implies executable stack
/opt/gcc-12.2.0-nolibc/powerpc64-linux/bin/../lib/gcc/powerpc64-linux/12.2.0/../../../../powerpc64-linux/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker

To avoid that, explicitely tell the linker we don't
want executable stack.

For more explanations, see commit ffcf9c5700e4 ("x86: link vdso
and boot with -z noexecstack --no-warn-rwx-segments")

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/Makefile      | 3 ++-
 arch/powerpc/kernel/vdso/Makefile | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 06d2d1f78f71..b071e15dd574 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -128,7 +128,8 @@ extra-y				+= vmlinux.lds
 
 obj-$(CONFIG_RELOCATABLE)	+= reloc_$(BITS).o
 
-obj-$(CONFIG_PPC32)		+= entry_32.o setup_32.o early_32.o static_call.o
+obj-$(CONFIG_PPC32)		+= entry_32.o setup_32.o early_32.o
+obj-$(CONFIG_HAVE_STATIC_CALL)	+= static_call.o
 obj-$(CONFIG_PPC64)		+= dma-iommu.o iommu.o
 obj-$(CONFIG_KGDB)		+= kgdb.o
 obj-$(CONFIG_BOOTX_TEXT)	+= btext.o
diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 096b0bf1335f..a2e7b0ce5b19 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -92,13 +92,13 @@ include/generated/vdso64-offsets.h: $(obj)/vdso64.so.dbg FORCE
 
 # actual build commands
 quiet_cmd_vdso32ld_and_check = VDSO32L $@
-      cmd_vdso32ld_and_check = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) ; $(cmd_vdso_check)
+      cmd_vdso32ld_and_check = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
 quiet_cmd_vdso32as = VDSO32A $@
       cmd_vdso32as = $(VDSOCC) $(a_flags) $(CC32FLAGS) $(AS32FLAGS) -c -o $@ $<
 quiet_cmd_vdso32cc = VDSO32C $@
       cmd_vdso32cc = $(VDSOCC) $(c_flags) $(CC32FLAGS) -c -o $@ $<
 
 quiet_cmd_vdso64ld_and_check = VDSO64L $@
-      cmd_vdso64ld_and_check = $(VDSOCC) $(c_flags) $(CC64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) ; $(cmd_vdso_check)
+      cmd_vdso64ld_and_check = $(VDSOCC) $(c_flags) $(CC64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
 quiet_cmd_vdso64as = VDSO64A $@
       cmd_vdso64as = $(VDSOCC) $(a_flags) $(CC64FLAGS) $(AS64FLAGS) -c -o $@ $<
-- 
2.37.1

