Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EE3311CFA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 12:52:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXrHV2D8VzDwnP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 22:52:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXrBK4j1qzDqPF
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 22:47:32 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DXrB80TZKz9v3fP;
 Sat,  6 Feb 2021 12:47:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6n-_fvxlguK5; Sat,  6 Feb 2021 12:47:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DXrB76mmmz9v3fL;
 Sat,  6 Feb 2021 12:47:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 215A78B784;
 Sat,  6 Feb 2021 12:47:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QwgWBI2baW2T; Sat,  6 Feb 2021 12:47:29 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DDCB78B766;
 Sat,  6 Feb 2021 12:47:28 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B0DA4672EC; Sat,  6 Feb 2021 11:47:28 +0000 (UTC)
Message-Id: <9baed0ff9d76723ec90f1b567ddd4ac1ecc7a190.1612612022.git.christophe.leroy@csgroup.eu>
In-Reply-To: <72c7b9879e2e2e6f5c27dadda6486386c2b50f23.1612612022.git.christophe.leroy@csgroup.eu>
References: <72c7b9879e2e2e6f5c27dadda6486386c2b50f23.1612612022.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 3/3] powerpc/32s: Allow constant folding in mtsr()/mfsr()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sat,  6 Feb 2021 11:47:28 +0000 (UTC)
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

On the same way as we did in wrtee(), add an alternative
using mtsr/mfsr instructions instead of mtsrin/mfsrin
when the segment register can be determined at compile time.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/reg.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index eeab7e7dc699..da103e92c112 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1418,14 +1418,20 @@ static inline u32 mfsr(u32 idx)
 {
 	u32 val;
 
-	asm volatile("mfsrin %0, %1" : "=r" (val): "r" (idx));
+	if (__builtin_constant_p(idx))
+		asm volatile("mfsr %0, %1" : "=r" (val): "i" (idx >> 28));
+	else
+		asm volatile("mfsrin %0, %1" : "=r" (val): "r" (idx));
 
 	return val;
 }
 
 static inline void mtsr(u32 val, u32 idx)
 {
-	asm volatile("mtsrin %0, %1" : : "r" (val), "r" (idx));
+	if (__builtin_constant_p(idx))
+		asm volatile("mtsr %1, %0" : : "r" (val), "i" (idx >> 28));
+	else
+		asm volatile("mtsrin %0, %1" : : "r" (val), "r" (idx));
 }
 #endif
 
-- 
2.25.0

