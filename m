Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AF177F8D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 16:26:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRS4F03NGz3cGJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 00:26:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=csgroup.eu (client-ip=90.115.179.12; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (unknown [90.115.179.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRS3m0KyKz3bWQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 00:26:10 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RRS3g3hSxz9wrn;
	Thu, 17 Aug 2023 16:26:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KUkmeh0sFkNs; Thu, 17 Aug 2023 16:26:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RRS3g2sr1z9wrl;
	Thu, 17 Aug 2023 16:26:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5F07D8B76C;
	Thu, 17 Aug 2023 16:26:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id hQ_dsETZXfsT; Thu, 17 Aug 2023 16:26:07 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.19.54.59])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E4208B763;
	Thu, 17 Aug 2023 16:26:07 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37HEQ206445864
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 16:26:02 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37HEPt0q445818;
	Thu, 17 Aug 2023 16:25:55 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/47x: Add prototype for mmu_init_secondary()
Date: Thu, 17 Aug 2023 16:25:49 +0200
Message-ID: <e89d9927c926044e54fd056a849785f526c6414f.1692282340.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692282348; l=1005; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=y4MtXxcU/CLYY/EtZYOAASD5LB5BrZFf3sfN3Cc+IB0=; b=EiYYpSO+gQkYlnYN6efHgQZWyYz6PTS17/ghX4U8eDhBEXY/XuAExALjYn3RCfiCIHKIvzshj vNckpfsTqjLC9AvgdCVo49MKntTWmiaBGnOeVsrMHfs79NDafRL+EJA
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
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A W=1 build of 44x/iss476-smp_defconfig gives:

arch/powerpc/mm/nohash/44x.c:220:13: error: no previous prototype for 'mmu_init_secondary' [-Werror=missing-prototypes]
  220 | void __init mmu_init_secondary(int cpu)
      |             ^~~~~~~~~~~~~~~~~~

That function is called from head_4xx.S

Add a prototype in mmu_decl.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/mm/mmu_decl.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index c6dccb4f06dc..7f9ff0640124 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -110,6 +110,7 @@ extern void MMU_init_hw(void);
 void MMU_init_hw_patch(void);
 unsigned long mmu_mapin_ram(unsigned long base, unsigned long top);
 #endif
+void mmu_init_secondary(int cpu);
 
 #ifdef CONFIG_PPC_E500
 extern unsigned long map_mem_in_cams(unsigned long ram, int max_cam_idx,
-- 
2.41.0

