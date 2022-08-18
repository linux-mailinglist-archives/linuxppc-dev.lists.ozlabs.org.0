Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B00C6598A74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 19:32:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7sQT3kKVz3drl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 03:32:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7sQ15QnWz2xHC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 03:31:51 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4M7sPv4Jg5z9sgY;
	Thu, 18 Aug 2022 19:31:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zZe8s5pfT7-t; Thu, 18 Aug 2022 19:31:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4M7sPv35YDz9sgX;
	Thu, 18 Aug 2022 19:31:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5ADAF8B767;
	Thu, 18 Aug 2022 19:31:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Xc826FIAeJiJ; Thu, 18 Aug 2022 19:31:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.236])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 24DD68B763;
	Thu, 18 Aug 2022 19:31:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 27IHVbbt2052476
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 19:31:37 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 27IHVZd02052471;
	Thu, 18 Aug 2022 19:31:35 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/vdso: Don't map VDSO at a fixed address on PPC32
Date: Thu, 18 Aug 2022 19:31:25 +0200
Message-Id: <cba76f5a5b01fcc49415e632d92c11c1c5998cab.1660843877.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1660843884; l=2296; s=20211009; h=from:subject:message-id; bh=hyN+Cekjwhv6w4forXDxgFeHYyRixzXym2N4NX5o8kY=; b=X0mS0tn9tr2VkijrzyuEzAy5sxXf3adu47I90pPCErAtd+yhL5ssrp0+u4Vco7ibWTR+EfZlNWuD x8fwBgkqAn3wxHv7vpk8lvlFVgmvgcctTzngRc8GIiBq7NwbQbgM
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

PPC64 removed default mapping address from VDSO in
commit 30d0b3682887 ("powerpc: Move 64bit VDSO to improve context
switch performance").

Do like PPC64 and let get_unmapped_area() place the VDSO mapping
at the address it wants, don't force a default address.

This allows randomisation of VDSO address.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/vdso.h |  3 ---
 arch/powerpc/kernel/vdso.c      | 13 ++-----------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso.h b/arch/powerpc/include/asm/vdso.h
index 8542e9bbeead..7650b6ce14c8 100644
--- a/arch/powerpc/include/asm/vdso.h
+++ b/arch/powerpc/include/asm/vdso.h
@@ -2,9 +2,6 @@
 #ifndef _ASM_POWERPC_VDSO_H
 #define _ASM_POWERPC_VDSO_H
 
-/* Default map addresses for 32bit vDSO */
-#define VDSO32_MBASE	0x100000
-
 #define VDSO_VERSION_STRING	LINUX_2.6.15
 
 #ifndef __ASSEMBLY__
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 0da287544054..bf9574ec26ce 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -200,28 +200,19 @@ static int __arch_setup_additional_pages(struct linux_binprm *bprm, int uses_int
 	if (is_32bit_task()) {
 		vdso_spec = &vdso32_spec;
 		vdso_size = &vdso32_end - &vdso32_start;
-		vdso_base = VDSO32_MBASE;
 	} else {
 		vdso_spec = &vdso64_spec;
 		vdso_size = &vdso64_end - &vdso64_start;
-		/*
-		 * On 64bit we don't have a preferred map address. This
-		 * allows get_unmapped_area to find an area near other mmaps
-		 * and most likely share a SLB entry.
-		 */
-		vdso_base = 0;
 	}
 
 	mappings_size = vdso_size + vvar_size;
 	mappings_size += (VDSO_ALIGNMENT - 1) & PAGE_MASK;
 
 	/*
-	 * pick a base address for the vDSO in process space. We try to put it
-	 * at vdso_base which is the "natural" base for it, but we might fail
-	 * and end up putting it elsewhere.
+	 * Pick a base address for the vDSO in process space.
 	 * Add enough to the size so that the result can be aligned.
 	 */
-	vdso_base = get_unmapped_area(NULL, vdso_base, mappings_size, 0, 0);
+	vdso_base = get_unmapped_area(NULL, 0, mappings_size, 0, 0);
 	if (IS_ERR_VALUE(vdso_base))
 		return vdso_base;
 
-- 
2.37.1

