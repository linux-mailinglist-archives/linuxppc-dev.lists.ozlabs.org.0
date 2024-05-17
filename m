Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 612C48C8C69
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 21:01:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgxC56mQQz30fm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2024 05:01:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
X-Greylist: delayed 60 seconds by postgrey-1.37 at boromir; Sat, 18 May 2024 05:01:12 AEST
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgxBc56CNz30TL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2024 05:01:12 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Vgx9S1gxkz9t5l;
	Fri, 17 May 2024 21:00:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4cIGKIGNK9z9; Fri, 17 May 2024 21:00:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Vgx9M672Bz9syj;
	Fri, 17 May 2024 21:00:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CD4458B766;
	Fri, 17 May 2024 21:00:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ioM59iiRK_y8; Fri, 17 May 2024 21:00:07 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.121])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 479FE8B783;
	Fri, 17 May 2024 21:00:07 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC PATCH v2 08/20] powerpc/8xx: Simplify struct mmu_psize_def
Date: Fri, 17 May 2024 21:00:02 +0200
Message-ID: <ca2d232f07adfd7b3ed56d339a6071155cc9bcb7.1715971869.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1715971869.git.christophe.leroy@csgroup.eu>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715972396; l=1285; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=EKXFvixH1QDRMdDwLAcDFjoK2t9maiUDKOftRAhE8M8=; b=nX2X6vEpdK44UnfhG3HKWABTDQWPK0OwmzarT+5JSy8AVJaSKAikMUF3Rybc/nYF0xa9AiYQb w8VI07De5zHDDN3sYCq674/uu4dnjwSQUFkrAM6P02f/hMw3ZRsgD1m
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8xx, only the shift field is used in struct mmu_psize_def

Remove other fields and related macros.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
index 141d82e249a8..a756a1e59c54 100644
--- a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
@@ -189,19 +189,14 @@ typedef struct {
 
 #define PHYS_IMMR_BASE (mfspr(SPRN_IMMR) & 0xfff80000)
 
-/* Page size definitions, common between 32 and 64-bit
+/*
+ * Page size definitions for 8xx
  *
  *    shift : is the "PAGE_SHIFT" value for that page size
- *    penc  : is the pte encoding mask
  *
  */
 struct mmu_psize_def {
 	unsigned int	shift;	/* number of bits */
-	unsigned int	enc;	/* PTE encoding */
-	unsigned int    ind;    /* Corresponding indirect page size shift */
-	unsigned int	flags;
-#define MMU_PAGE_SIZE_DIRECT	0x1	/* Supported as a direct size */
-#define MMU_PAGE_SIZE_INDIRECT	0x2	/* Supported as an indirect size */
 };
 
 extern struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT];
-- 
2.44.0

