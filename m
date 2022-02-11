Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B464B208A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 09:49:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jw6jT6PqYz3cPf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 19:49:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jw6j35m1rz3bTP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 19:48:36 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Jw6hx4vY8z9sSM;
 Fri, 11 Feb 2022 09:48:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id klDIzGqmxZ6I; Fri, 11 Feb 2022 09:48:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Jw6hx4Bhzz9sSL;
 Fri, 11 Feb 2022 09:48:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7ED5A8B77D;
 Fri, 11 Feb 2022 09:48:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rtRKHQ_BcwTx; Fri, 11 Feb 2022 09:48:33 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.91])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 36EBB8B764;
 Fri, 11 Feb 2022 09:48:33 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21B8mNGc936763
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 09:48:23 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21B8mMRd936762;
 Fri, 11 Feb 2022 09:48:22 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH] net: Remove branch in csum_shift()
Date: Fri, 11 Feb 2022 09:48:16 +0100
Message-Id: <efeeb0b9979b0377cd313311ad29cf0ac060ae4b.1644569106.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1644569294; l=1792; s=20211009;
 h=from:subject:message-id; bh=bn4qVlTEECkFmk/D3ReBpu/1ueTQNT/DDGPwdR54bMw=;
 b=YfWOLv3f7QPdV7JOLEvppeShwBCfk+aGgbZur22GW+m9WX6XeuSeUHvizGFhnuzg3csBcc4Zfcbu
 MOrUk6ZGDv8PKhpkllz2TJosNNk2sqMNIrrXLeIPI0EXjv6RY/gs
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Today's implementation of csum_shift() leads to branching based on
parity of 'offset'

	000002f8 <csum_block_add>:
	     2f8:	70 a5 00 01 	andi.   r5,r5,1
	     2fc:	41 a2 00 08 	beq     304 <csum_block_add+0xc>
	     300:	54 84 c0 3e 	rotlwi  r4,r4,24
	     304:	7c 63 20 14 	addc    r3,r3,r4
	     308:	7c 63 01 94 	addze   r3,r3
	     30c:	4e 80 00 20 	blr

Use first bit of 'offset' directly as input of the rotation instead of
branching.

	000002f8 <csum_block_add>:
	     2f8:	54 a5 1f 38 	rlwinm  r5,r5,3,28,28
	     2fc:	20 a5 00 20 	subfic  r5,r5,32
	     300:	5c 84 28 3e 	rotlw   r4,r4,r5
	     304:	7c 63 20 14 	addc    r3,r3,r4
	     308:	7c 63 01 94 	addze   r3,r3
	     30c:	4e 80 00 20 	blr

And change to left shift instead of right shift to skip one more
instruction. This has no impact on the final sum.

	000002f8 <csum_block_add>:
	     2f8:	54 a5 1f 38 	rlwinm  r5,r5,3,28,28
	     2fc:	5c 84 28 3e 	rotlw   r4,r4,r5
	     300:	7c 63 20 14 	addc    r3,r3,r4
	     304:	7c 63 01 94 	addze   r3,r3
	     308:	4e 80 00 20 	blr

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 include/net/checksum.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/net/checksum.h b/include/net/checksum.h
index 5218041e5c8f..9badcd5532ef 100644
--- a/include/net/checksum.h
+++ b/include/net/checksum.h
@@ -83,9 +83,7 @@ static inline __sum16 csum16_sub(__sum16 csum, __be16 addend)
 static inline __wsum csum_shift(__wsum sum, int offset)
 {
 	/* rotate sum to align it with a 16b boundary */
-	if (offset & 1)
-		return (__force __wsum)ror32((__force u32)sum, 8);
-	return sum;
+	return (__force __wsum)rol32((__force u32)sum, (offset & 1) << 3);
 }
 
 static inline __wsum
-- 
2.34.1

