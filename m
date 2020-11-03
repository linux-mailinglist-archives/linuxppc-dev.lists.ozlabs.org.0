Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A622A4DE4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 19:09:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQd8v3ZhvzDqgV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 05:09:35 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQd6G5MC7zDqg7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 05:07:17 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CQd681Hv0z9v1YY;
 Tue,  3 Nov 2020 19:07:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id onygEN-zwiKy; Tue,  3 Nov 2020 19:07:12 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CQd675Hwbz9v1YS;
 Tue,  3 Nov 2020 19:07:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8DF0F8B7DC;
 Tue,  3 Nov 2020 19:07:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nyfe8n40bfUi; Tue,  3 Nov 2020 19:07:13 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A2238B7D4;
 Tue,  3 Nov 2020 19:07:13 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 30A5C66860; Tue,  3 Nov 2020 18:07:13 +0000 (UTC)
Message-Id: <08ffecd31403b3c692f25f97b07a378ba784873e.1604426550.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1604426550.git.christophe.leroy@csgroup.eu>
References: <cover.1604426550.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v13 2/8] powerpc/feature: Use CONFIG_PPC64 instead of
 __powerpc64__ to define possible features
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 nathanl@linux.ibm.com, anton@ozlabs.org
Date: Tue,  3 Nov 2020 18:07:13 +0000 (UTC)
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to build VDSO32 for PPC64, we need to have CPU_FTRS_POSSIBLE
and CPU_FTRS_ALWAYS independant of whether we are building the
32 bits VDSO or the 64 bits VDSO.

Use #ifdef CONFIG_PPC64 instead of #ifdef __powerpc64__

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v13: new
---
 arch/powerpc/include/asm/cputable.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 5e31960a56a9..e069a2d9f7c1 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -488,7 +488,7 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_PURR | CPU_FTR_REAL_LE | CPU_FTR_DABRX)
 #define CPU_FTRS_COMPATIBLE	(CPU_FTR_PPCAS_ARCH_V2)
 
-#ifdef __powerpc64__
+#ifdef CONFIG_PPC64
 #ifdef CONFIG_PPC_BOOK3E
 #define CPU_FTRS_POSSIBLE	(CPU_FTRS_E6500 | CPU_FTRS_E5500)
 #else
@@ -545,7 +545,7 @@ enum {
 };
 #endif /* __powerpc64__ */
 
-#ifdef __powerpc64__
+#ifdef CONFIG_PPC64
 #ifdef CONFIG_PPC_BOOK3E
 #define CPU_FTRS_ALWAYS		(CPU_FTRS_E6500 & CPU_FTRS_E5500)
 #else
-- 
2.25.0

