Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A314A4676E8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 12:58:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5BDV3Rs2z3c6s
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 22:58:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nurLRZSr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5BCt1lwsz2xgb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Dec 2021 22:58:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nurLRZSr; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J5BCm6qd7z4xcb;
 Fri,  3 Dec 2021 22:57:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1638532677;
 bh=xyZx4/DF0Sity4wnykA89j4KdJ/FnKNFjU79VJ9Haf4=;
 h=From:To:Subject:Date:From;
 b=nurLRZSru9xQ0YhxSppXpzYDUb2Ygy5JLXvlRQ5Ff0ZHGWkErotk+D/EQGD+EQLR0
 0t9SaGfEYNtjC48UOqLcl4++2jhJBXYNBMVye6uPJE/jOg1GOifi7z2Hlm9gYVTKQH
 l1zhe0VaciCku/WAL6ejixgZg11agPf0Hp9YAOdYURb9ng5KQNwt/hHY/1z+vQHQmk
 YqWYYF7Pc0U1aPE+yTc/3csttWd2urKqcrjpP3bfwshv1Au9qETFwgDATWgetJQVQA
 mSIYNa/e1FF5Gf0K68jVjUOaz+v1g45orEGP634mzfG8Dkq5Rd7IkOcBDUMuCcfBhU
 RxmeYaXzcyrag==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Drop unused CONFIG_PPC_HAS_FEATURE_CALLS
Date: Fri,  3 Dec 2021 22:57:55 +1100
Message-Id: <20211203115755.2906587-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since ~2002 we have had CONFIG_PPC_HAS_FEATURE_CALLS defined as a faux
CONFIG symbol, firstly in include/asm-ppc/machdep.h, and then later
copied over to powerpc when ppc and ppc64 were merged.

The last in-tree usage was removed in 2005 in commit
7bbd827750e6 ("[PATCH] ppc64: very basic desktop g5 sound support").

I haven't been able to find any meaningful references to it anywhere
else, so I suspect it has been unused for many years. It confuses
scripts/checkkconfigsymbols.py, and seems to serve no purpose, so drop
it.

Note that it's not in a uapi header, ie. it could only be used by
out-of-tree kernel modules, not general userspace code.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---

If anything does use it, just let us know.
---
 arch/powerpc/include/asm/machdep.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index e821037f74f0..75687e1f994a 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -10,11 +10,6 @@
 
 #include <asm/setup.h>
 
-/* We export this macro for external modules like Alsa to know if
- * ppc_md.feature_call is implemented or not
- */
-#define CONFIG_PPC_HAS_FEATURE_CALLS
-
 struct pt_regs;
 struct pci_bus;	
 struct device_node;
-- 
2.31.1

