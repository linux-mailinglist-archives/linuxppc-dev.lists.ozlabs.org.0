Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A12D27A06D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 12:06:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BzhC2008dzDqG1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 20:06:53 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg5H5KLWzDq9D
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:51 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg580Kyyz9vCyG;
 Sun, 27 Sep 2020 11:16:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zQB8bIUdlbXe; Sun, 27 Sep 2020 11:16:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg576jntz9vCxw;
 Sun, 27 Sep 2020 11:16:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7ECAC8B771;
 Sun, 27 Sep 2020 11:16:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id kUbUusiT4hHC; Sun, 27 Sep 2020 11:16:48 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 42CE08B75B;
 Sun, 27 Sep 2020 11:16:48 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 260B765DE8; Sun, 27 Sep 2020 09:16:48 +0000 (UTC)
Message-Id: <9902590d410cd1c2afa48b83b277faf0711f07b2.1601197618.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1601197618.git.christophe.leroy@csgroup.eu>
References: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 30/30] powerpc/vdso: Cleanup vdso.h
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:48 +0000 (UTC)
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

Rename the guard define to _ASM_POWERPC_VDSO_H

And remove useless #ifdef __KERNEL__

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/vdso.h | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso.h b/arch/powerpc/include/asm/vdso.h
index 2448419cb3e5..8542e9bbeead 100644
--- a/arch/powerpc/include/asm/vdso.h
+++ b/arch/powerpc/include/asm/vdso.h
@@ -1,8 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __PPC64_VDSO_H__
-#define __PPC64_VDSO_H__
-
-#ifdef __KERNEL__
+#ifndef _ASM_POWERPC_VDSO_H
+#define _ASM_POWERPC_VDSO_H
 
 /* Default map addresses for 32bit vDSO */
 #define VDSO32_MBASE	0x100000
@@ -54,6 +52,4 @@ int vdso_getcpu_init(void);
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __KERNEL__ */
-
-#endif /* __PPC64_VDSO_H__ */
+#endif /* _ASM_POWERPC_VDSO_H */
-- 
2.25.0

