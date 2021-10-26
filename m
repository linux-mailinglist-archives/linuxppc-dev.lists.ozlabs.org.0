Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BBD43ABC9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 07:41:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdggH2sF2z3cZ7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 16:41:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdgf73hvPz2ygC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 16:40:47 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4Hdgdx05SXz9s2c;
 Tue, 26 Oct 2021 07:40:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nTdqXsaS_IFf; Tue, 26 Oct 2021 07:40:36 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by pegase1.c-s.fr (Postfix) with ESMTPS id 4Hdgdt4lNyz9s2Z;
 Tue, 26 Oct 2021 07:40:34 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19Q5eWDD009296
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 07:40:32 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19Q5dYDH009223;
 Tue, 26 Oct 2021 07:39:34 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 3/3] powerpc/fsl_booke: Fix setting of exec flag when setting
 TLBCAMs
Date: Tue, 26 Oct 2021 07:39:26 +0200
Message-Id: <91a0235e7f2a85308b84aa5b9efd8d022e2b899a.1635226743.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <922bdab3a220781bae2360ff3dd5adb7fe4d34f1.1635226743.git.christophe.leroy@csgroup.eu>
References: <922bdab3a220781bae2360ff3dd5adb7fe4d34f1.1635226743.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1635226765; l=2254; s=20211009;
 h=from:subject:message-id; bh=mlyzfvjRXxkYi+2e5tBzRwK0k4zoe1IKELEmwYcewh4=;
 b=VOr3lqCSDWdJgt8Vw5ctneuqorXwQBvtEGfT9dC9TLBpNUhFQewIMxGLljm+t7EJamhMCQVqEjsu
 cfY9b/VhDDJr2E1Rx3wUUt1IoM0m1ezUzqAI+mfnExa0ZP0FUFwW
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

Building tqm8541_defconfig results in:

	arch/powerpc/mm/nohash/fsl_book3e.c: In function 'settlbcam':
	arch/powerpc/mm/nohash/fsl_book3e.c:126:40: error: '_PAGE_BAP_SX' undeclared (first use in this function)
	  126 |         TLBCAM[index].MAS3 |= (flags & _PAGE_BAP_SX) ? MAS3_SX : 0;
	      |                                        ^~~~~~~~~~~~
	arch/powerpc/mm/nohash/fsl_book3e.c:126:40: note: each undeclared identifier is reported only once for each function it appears in
	make[3]: *** [scripts/Makefile.build:277: arch/powerpc/mm/nohash/fsl_book3e.o] Error 1
	make[2]: *** [scripts/Makefile.build:540: arch/powerpc/mm/nohash] Error 2
	make[1]: *** [scripts/Makefile.build:540: arch/powerpc/mm] Error 2
	make: *** [Makefile:1868: arch/powerpc] Error 2

This is because _PAGE_BAP_SX is not defined when using 32 bits PTE.

Now that _PAGE_EXEC contains both _PAGE_BAP_SX and _PAGE_BAP_UX, it can be used instead.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 01116e6e98b0 ("powerpc/fsl_booke: Take exec flag into account when setting TLBCAMs")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/nohash/fsl_book3e.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/nohash/fsl_book3e.c b/arch/powerpc/mm/nohash/fsl_book3e.c
index 978e0bcdfa2c..b231a54f540c 100644
--- a/arch/powerpc/mm/nohash/fsl_book3e.c
+++ b/arch/powerpc/mm/nohash/fsl_book3e.c
@@ -123,7 +123,6 @@ static void settlbcam(int index, unsigned long virt, phys_addr_t phys,
 	TLBCAM[index].MAS2 |= (flags & _PAGE_ENDIAN) ? MAS2_E : 0;
 
 	TLBCAM[index].MAS3 = (phys & MAS3_RPN) | MAS3_SR;
-	TLBCAM[index].MAS3 |= (flags & _PAGE_BAP_SX) ? MAS3_SX : 0;
 	TLBCAM[index].MAS3 |= (flags & _PAGE_RW) ? MAS3_SW : 0;
 	if (mmu_has_feature(MMU_FTR_BIG_PHYS))
 		TLBCAM[index].MAS7 = (u64)phys >> 32;
@@ -133,6 +132,8 @@ static void settlbcam(int index, unsigned long virt, phys_addr_t phys,
 		TLBCAM[index].MAS3 |= MAS3_UR;
 		TLBCAM[index].MAS3 |= (flags & _PAGE_EXEC) ? MAS3_UX : 0;
 		TLBCAM[index].MAS3 |= (flags & _PAGE_RW) ? MAS3_UW : 0;
+	} else {
+		TLBCAM[index].MAS3 |= (flags & _PAGE_EXEC) ? MAS3_SX : 0;
 	}
 
 	tlbcam_addrs[index].start = virt;
-- 
2.31.1

