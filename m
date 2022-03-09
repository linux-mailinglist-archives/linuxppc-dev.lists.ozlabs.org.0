Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 879CB4D2A12
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 08:57:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KD4KS24r3z3bV2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 18:57:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KD4Jz6th8z2xMQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 18:56:33 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KD4Jv4lzXz9sSV;
 Wed,  9 Mar 2022 08:56:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qLx4faVm02P8; Wed,  9 Mar 2022 08:56:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KD4Jv40v5z9sSR;
 Wed,  9 Mar 2022 08:56:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 76C848B77D;
 Wed,  9 Mar 2022 08:56:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WlMku7kl4AUb; Wed,  9 Mar 2022 08:56:31 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.3])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2A0278B763;
 Wed,  9 Mar 2022 08:56:31 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2297uI323593930
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 9 Mar 2022 08:56:18 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2297uGok3593929;
 Wed, 9 Mar 2022 08:56:16 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: Use rol32() instead of opencoding in csum_fold()
Date: Wed,  9 Mar 2022 08:56:14 +0100
Message-Id: <794337eff7bb803d2c4e67d9eee635390c4c48fe.1646812553.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1646812573; l=1384; s=20211009;
 h=from:subject:message-id; bh=KDkVF9PqMt4cDBy6twCvMX/grto3ncphU+ZUsJSR6IA=;
 b=RHvXwbEHlO+1j8HBQrsBzcN7RyHmiKhQDWO+jKCyUQ/MU9Oq0s9c9mzE5EhM8Q2UNfaAumg9TIt1
 ZkNP1gIcC713W+IjC+xio7Ol4Twoiz712ZOMJiiCO3/N1T8fa48g
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

rol32(x, 16) will do the rotate using rlwinm.

No need to open code using inline assembly.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/checksum.h | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/checksum.h b/arch/powerpc/include/asm/checksum.h
index 8321f6053a67..4b573a3b7e17 100644
--- a/arch/powerpc/include/asm/checksum.h
+++ b/arch/powerpc/include/asm/checksum.h
@@ -38,14 +38,15 @@ extern __wsum csum_and_copy_to_user(const void *src, void __user *dst,
  */
 static inline __sum16 csum_fold(__wsum sum)
 {
-	unsigned int tmp;
-
-	/* swap the two 16-bit halves of sum */
-	__asm__("rlwinm %0,%1,16,0,31" : "=r" (tmp) : "r" (sum));
-	/* if there is a carry from adding the two 16-bit halves,
-	   it will carry from the lower half into the upper half,
-	   giving us the correct sum in the upper half. */
-	return (__force __sum16)(~((__force u32)sum + tmp) >> 16);
+	u32 tmp = (__force u32)sum;
+
+	/*
+	 * swap the two 16-bit halves of sum
+	 * if there is a carry from adding the two 16-bit halves,
+	 * it will carry from the lower half into the upper half,
+	 * giving us the correct sum in the upper half.
+	 */
+	return (__force __sum16)(~(tmp + rol32(tmp, 16)) >> 16);
 }
 
 static inline u32 from64to32(u64 x)
-- 
2.34.1

