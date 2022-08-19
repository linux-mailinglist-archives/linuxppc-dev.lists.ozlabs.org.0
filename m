Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E01599D70
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 16:27:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8PGy22gCz3dtV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 00:27:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8PGZ0lztz2xJN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 00:27:17 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4M8PGT4wqQz9shj;
	Fri, 19 Aug 2022 16:27:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HSF6PGJSbxdw; Fri, 19 Aug 2022 16:27:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4M8PGT3vmVz9shX;
	Fri, 19 Aug 2022 16:27:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6CA168B77C;
	Fri, 19 Aug 2022 16:27:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id VR3B-w3mshBH; Fri, 19 Aug 2022 16:27:13 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.4.22])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 363C28B763;
	Fri, 19 Aug 2022 16:27:13 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 27JER0s52215678
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 16:27:00 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 27JER07u2215676;
	Fri, 19 Aug 2022 16:27:00 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/fsl_booke: Make calc_cam_sz() static
Date: Fri, 19 Aug 2022 16:26:49 +0200
Message-Id: <a7469848371b2cf5e8f654ec79800e209d88595e.1660919200.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1660919208; l=1525; s=20211009; h=from:subject:message-id; bh=L++ineN4VN9rQJojH00UC9wJeQDuvg5jehPZxtCRR14=; b=44Ckq1p6dYPBPH9yh/gW7H9Bedd744QkOwzzcd3CYSxrEL6+7gS/yQbuz3WlTrewkshhvRouORv4 WjTlGF2rAN2YQrcVzO/5RMnqklqKz1fh7JxnjZ8HSDRHqaVsQPBL
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

calc_cam_sz() is used only in fsl_book3e.c, make it static.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/mmu_decl.h          | 2 --
 arch/powerpc/mm/nohash/fsl_book3e.c | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 8f5afad1b6af..6dd4744cc56a 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -122,8 +122,6 @@ unsigned long mmu_mapin_ram(unsigned long base, unsigned long top);
 #ifdef CONFIG_PPC_FSL_BOOK3E
 extern unsigned long map_mem_in_cams(unsigned long ram, int max_cam_idx,
 				     bool dryrun, bool init);
-extern unsigned long calc_cam_sz(unsigned long ram, unsigned long virt,
-				 phys_addr_t phys);
 #ifdef CONFIG_PPC32
 extern void adjust_total_lowmem(void);
 extern int switch_to_as1(void);
diff --git a/arch/powerpc/mm/nohash/fsl_book3e.c b/arch/powerpc/mm/nohash/fsl_book3e.c
index b8ae6c08c06f..c1ad173de318 100644
--- a/arch/powerpc/mm/nohash/fsl_book3e.c
+++ b/arch/powerpc/mm/nohash/fsl_book3e.c
@@ -135,8 +135,8 @@ static void settlbcam(int index, unsigned long virt, phys_addr_t phys,
 	tlbcam_addrs[index].phys = phys;
 }
 
-unsigned long calc_cam_sz(unsigned long ram, unsigned long virt,
-			  phys_addr_t phys)
+static unsigned long calc_cam_sz(unsigned long ram, unsigned long virt,
+				 phys_addr_t phys)
 {
 	unsigned int camsize = __ilog2(ram);
 	unsigned int align = __ffs(virt | phys);
-- 
2.37.1

