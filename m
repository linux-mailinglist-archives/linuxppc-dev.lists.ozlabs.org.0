Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E800369B91D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 10:29:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJk0Z5XzTz3c3W
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 20:29:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJk022rd0z3c3N
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 20:29:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4PJjzx3JR0z9sbd;
	Sat, 18 Feb 2023 10:29:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1yBzKFv13ba2; Sat, 18 Feb 2023 10:29:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4PJjzx2ZJ4z9sWY;
	Sat, 18 Feb 2023 10:29:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 451668B768;
	Sat, 18 Feb 2023 10:29:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id O_BMGtLZa0IN; Sat, 18 Feb 2023 10:29:01 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.7.180])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0E1C48B764;
	Sat, 18 Feb 2023 10:29:01 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 31I9Sq3d644371
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 18 Feb 2023 10:28:53 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 31I9SpLa644369;
	Sat, 18 Feb 2023 10:28:51 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/e500: Add missing prototype for 'relocate_init'
Date: Sat, 18 Feb 2023 10:28:50 +0100
Message-Id: <ac9107acf24135e1a07e8f84d2090572d43e3fe4.1676712510.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676712516; l=1217; s=20211009; h=from:subject:message-id; bh=pfVj+fGo1djC+tVecmlDArzordscRtCM4E2ms3R4K3U=; b=6OT4l93tyj8545rUYFu1CCuXDkDFOIwBCZTCy572l5zArzVPKJ6mFf5Lqe9Re/2q/QrmdRsKj5FV vPDMZSG/Af+/o+whdbcQrRI3MfiBcIWFAJsTfLU7EYX/2EJy9hn4
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kernel test robot reports:

 arch/powerpc/mm/nohash/e500.c:314:21: warning: no previous prototype for 'relocate_init' [-Wmissing-prototypes]
     314 | notrace void __init relocate_init(u64 dt_ptr, phys_addr_t start)
         |                     ^~~~~~~~~~~~~

Add it in mm/mmu_decl.h, close to associated is_second_reloc
variable declaration.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202302181136.wgyCKUcs-lkp@intel.com/
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/mmu_decl.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index bd9784f77f2e..c6dccb4f06dc 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -120,6 +120,7 @@ extern int switch_to_as1(void);
 extern void restore_to_as0(int esel, int offset, void *dt_ptr, int bootcpu);
 void create_kaslr_tlb_entry(int entry, unsigned long virt, phys_addr_t phys);
 void reloc_kernel_entry(void *fdt, int addr);
+void relocate_init(u64 dt_ptr, phys_addr_t start);
 extern int is_second_reloc;
 #endif
 extern void loadcam_entry(unsigned int index);
-- 
2.39.1

