Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D13532291
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 07:42:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6jlW4JBHz3c8P
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 15:42:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6jl73Gd4z2yYd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 15:42:26 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4L6jl363bLz9tBD;
 Tue, 24 May 2022 07:42:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dt9v-DV4p2Gg; Tue, 24 May 2022 07:42:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4L6jl34xzbz9sYL;
 Tue, 24 May 2022 07:42:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9AE2A8B76E;
 Tue, 24 May 2022 07:42:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6Kppic0o54zn; Tue, 24 May 2022 07:42:23 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.153])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6306D8B764;
 Tue, 24 May 2022 07:42:23 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 24O5gDxt3809821
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 07:42:13 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 24O5gCYH3809820;
 Tue, 24 May 2022 07:42:12 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/64s: Only set HAVE_ARCH_UNMAPPED_AREA when
 CONFIG_PPC_64S_HASH_MMU is set
Date: Tue, 24 May 2022 07:42:05 +0200
Message-Id: <e438c6cc09f94085e56733ed2d6e84333c35292a.1653370913.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1653370924; l=1141; s=20211009;
 h=from:subject:message-id; bh=+MvKH4EEEQKd0h26LxT5/EnF+K33KN5AdwHuo6j+kHY=;
 b=/rFjdJ01tdWFB5KnlTWLqc4/WCQti8sBjBesltOc1soKnCVLSSnK52l3SnqUKnl9ECWgxM4iHLKG
 9qv+pl5xDxsD300sDIPnKy7VwyT/noZIVbk14LUNQDK+lS21I3/y
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When CONFIG_PPC_64S_HASH_MMU is not set, slice.c is not built and
arch_get_unmapped_area() and arch_get_unmapped_area_topdown() are
not provided because RADIX uses the generic ones.

Therefore, neither set HAVE_ARCH_UNMAPPED_AREA nor
HAVE_ARCH_UNMAPPED_AREA_TOPDOWN.

Reported-by: Laurent Dufour <ldufour@linux.ibm.com>
Fixes: ab57bd7570d4 ("powerpc/mm: Move get_unmapped_area functions to slice.c")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/64/slice.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/slice.h b/arch/powerpc/include/asm/book3s/64/slice.h
index b8eb4ad271b9..5fbe18544cbd 100644
--- a/arch/powerpc/include/asm/book3s/64/slice.h
+++ b/arch/powerpc/include/asm/book3s/64/slice.h
@@ -4,11 +4,13 @@
 
 #ifndef __ASSEMBLY__
 
+#ifdef CONFIG_PPC_64S_HASH_MMU
 #ifdef CONFIG_HUGETLB_PAGE
 #define HAVE_ARCH_HUGETLB_UNMAPPED_AREA
 #endif
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#endif
 
 #define SLICE_LOW_SHIFT		28
 #define SLICE_LOW_TOP		(0x100000000ul)
-- 
2.35.3

