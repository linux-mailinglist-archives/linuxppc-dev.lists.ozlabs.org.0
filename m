Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E5527A058
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 11:48:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bzgns0rzkzDqn5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 19:48:33 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg521cwfzDqQH
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:38 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg4t5kynz9vCy6;
 Sun, 27 Sep 2020 11:16:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QvLWqxH2Duhc; Sun, 27 Sep 2020 11:16:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg4t50Ffz9vCxw;
 Sun, 27 Sep 2020 11:16:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 25FCE8B771;
 Sun, 27 Sep 2020 11:16:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NfSfdl7Ue1Hx; Sun, 27 Sep 2020 11:16:35 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CC4628B75B;
 Sun, 27 Sep 2020 11:16:34 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A216065DE8; Sun, 27 Sep 2020 09:16:34 +0000 (UTC)
Message-Id: <2954526981859ca1ccfcfc7a7c4263920e9ddfcb.1601197618.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1601197618.git.christophe.leroy@csgroup.eu>
References: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 17/30] powerpc/vdso: Use builtin symbols to locate fixup
 section
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:34 +0000 (UTC)
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

Add builtin symbols to locate fixup section and use them
instead of locating sections through elf headers at runtime.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso.c              | 55 +++++++------------------
 arch/powerpc/kernel/vdso32/vdso32.lds.S |  8 ++++
 arch/powerpc/kernel/vdso64/vdso64.lds.S |  8 ++++
 3 files changed, 30 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 7042e9edfb96..ba2b935a67f6 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -437,6 +437,12 @@ static int __init vdso_do_func_patch64(struct lib32_elfinfo *v32,
 
 #endif /* CONFIG_PPC64 */
 
+#define VDSO_DO_FIXUPS(type, value, bits, sec) do {					\
+	void *__start = (void *)VDSO##bits##_SYMBOL(&vdso##bits##_start, sec##_start);	\
+	void *__end = (void *)VDSO##bits##_SYMBOL(&vdso##bits##_start, sec##_end);	\
+											\
+	do_##type##_fixups((value), __start, __end);					\
+} while (0)
 
 static __init int vdso_do_find_sections(struct lib32_elfinfo *v32,
 					struct lib64_elfinfo *v64)
@@ -533,53 +539,20 @@ static __init int vdso_fixup_datapage(struct lib32_elfinfo *v32,
 static __init int vdso_fixup_features(struct lib32_elfinfo *v32,
 				      struct lib64_elfinfo *v64)
 {
-	unsigned long size;
-	void *start;
-
 #ifdef CONFIG_PPC64
-	start = find_section64(v64->hdr, "__ftr_fixup", &size);
-	if (start)
-		do_feature_fixups(cur_cpu_spec->cpu_features,
-				  start, start + size);
-
-	start = find_section64(v64->hdr, "__mmu_ftr_fixup", &size);
-	if (start)
-		do_feature_fixups(cur_cpu_spec->mmu_features,
-				  start, start + size);
-
-	start = find_section64(v64->hdr, "__fw_ftr_fixup", &size);
-	if (start)
-		do_feature_fixups(powerpc_firmware_features,
-				  start, start + size);
-
-	start = find_section64(v64->hdr, "__lwsync_fixup", &size);
-	if (start)
-		do_lwsync_fixups(cur_cpu_spec->cpu_features,
-				 start, start + size);
+	VDSO_DO_FIXUPS(feature, cur_cpu_spec->cpu_features, 64, ftr_fixup);
+	VDSO_DO_FIXUPS(feature, cur_cpu_spec->mmu_features, 64, mmu_ftr_fixup);
+	VDSO_DO_FIXUPS(feature, powerpc_firmware_features, 64, fw_ftr_fixup);
+	VDSO_DO_FIXUPS(lwsync, cur_cpu_spec->cpu_features, 64, lwsync_fixup);
 #endif /* CONFIG_PPC64 */
 
 #ifdef CONFIG_VDSO32
-	start = find_section32(v32->hdr, "__ftr_fixup", &size);
-	if (start)
-		do_feature_fixups(cur_cpu_spec->cpu_features,
-				  start, start + size);
-
-	start = find_section32(v32->hdr, "__mmu_ftr_fixup", &size);
-	if (start)
-		do_feature_fixups(cur_cpu_spec->mmu_features,
-				  start, start + size);
-
+	VDSO_DO_FIXUPS(feature, cur_cpu_spec->cpu_features, 32, ftr_fixup);
+	VDSO_DO_FIXUPS(feature, cur_cpu_spec->mmu_features, 32, mmu_ftr_fixup);
 #ifdef CONFIG_PPC64
-	start = find_section32(v32->hdr, "__fw_ftr_fixup", &size);
-	if (start)
-		do_feature_fixups(powerpc_firmware_features,
-				  start, start + size);
+	VDSO_DO_FIXUPS(feature, powerpc_firmware_features, 32, fw_ftr_fixup);
 #endif /* CONFIG_PPC64 */
-
-	start = find_section32(v32->hdr, "__lwsync_fixup", &size);
-	if (start)
-		do_lwsync_fixups(cur_cpu_spec->cpu_features,
-				 start, start + size);
+	VDSO_DO_FIXUPS(lwsync, cur_cpu_spec->cpu_features, 32, lwsync_fixup);
 #endif
 
 	return 0;
diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
index a4494a998f58..dd9f262e07c6 100644
--- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
@@ -38,17 +38,25 @@ SECTIONS
 	PROVIDE(etext = .);
 
 	. = ALIGN(8);
+	VDSO_ftr_fixup_start = .;
 	__ftr_fixup	: { *(__ftr_fixup) }
+	VDSO_ftr_fixup_end = .;
 
 	. = ALIGN(8);
+	VDSO_mmu_ftr_fixup_start = .;
 	__mmu_ftr_fixup	: { *(__mmu_ftr_fixup) }
+	VDSO_mmu_ftr_fixup_end = .;
 
 	. = ALIGN(8);
+	VDSO_lwsync_fixup_start = .;
 	__lwsync_fixup	: { *(__lwsync_fixup) }
+	VDSO_lwsync_fixup_end = .;
 
 #ifdef CONFIG_PPC64
 	. = ALIGN(8);
+	VDSO_fw_ftr_fixup_start = .;
 	__fw_ftr_fixup	: { *(__fw_ftr_fixup) }
+	VDSO_fw_ftr_fixup_end = .;
 #endif
 
 	/*
diff --git a/arch/powerpc/kernel/vdso64/vdso64.lds.S b/arch/powerpc/kernel/vdso64/vdso64.lds.S
index 2113bf79ccda..e950bf68783a 100644
--- a/arch/powerpc/kernel/vdso64/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso64/vdso64.lds.S
@@ -39,16 +39,24 @@ SECTIONS
 	PROVIDE(etext = .);
 
 	. = ALIGN(8);
+	VDSO_ftr_fixup_start = .;
 	__ftr_fixup	: { *(__ftr_fixup) }
+	VDSO_ftr_fixup_end = .;
 
 	. = ALIGN(8);
+	VDSO_mmu_ftr_fixup_start = .;
 	__mmu_ftr_fixup	: { *(__mmu_ftr_fixup) }
+	VDSO_mmu_ftr_fixup_end = .;
 
 	. = ALIGN(8);
+	VDSO_lwsync_fixup_start = .;
 	__lwsync_fixup	: { *(__lwsync_fixup) }
+	VDSO_lwsync_fixup_end = .;
 
 	. = ALIGN(8);
+	VDSO_fw_ftr_fixup_start = .;
 	__fw_ftr_fixup	: { *(__fw_ftr_fixup) }
+	VDSO_fw_ftr_fixup_end = .;
 
 	/*
 	 * Other stuff is appended to the text segment:
-- 
2.25.0

