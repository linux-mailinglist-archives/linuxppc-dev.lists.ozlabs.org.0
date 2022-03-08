Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4DC4D1CE4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 17:13:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCgNG5hNNz3bZs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 03:13:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCgMp3Xydz2xvV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 03:12:35 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KCgMj1QdKz9sSX;
 Tue,  8 Mar 2022 17:12:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3AGF3ZVhpE6X; Tue,  8 Mar 2022 17:12:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KCgMj0ZHVz9sRy;
 Tue,  8 Mar 2022 17:12:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 02F8D8B77C;
 Tue,  8 Mar 2022 17:12:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id kMIHpHcLx_Hg; Tue,  8 Mar 2022 17:12:32 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.9])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AED908B763;
 Tue,  8 Mar 2022 17:12:32 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 228GCNRo3539464
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 8 Mar 2022 17:12:23 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 228GCLr63539461;
 Tue, 8 Mar 2022 17:12:21 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH net-next v2] powerpc/net: Implement powerpc specific
 csum_shift() to remove branch
Date: Tue,  8 Mar 2022 17:12:10 +0100
Message-Id: <1e1a0f38f3f0ab61283ccfb69626104a897f3551.1646755813.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1646755929; l=2873; s=20211009;
 h=from:subject:message-id; bh=tWGuMHcVZQut1adKSyNowkDKryK0uGnRw4Glaoa8o/E=;
 b=dBxnwVCqd96k6w95KD5W6WY/Ic1u/Nc0CHXVlTcbJFqo4TeyNXkonGM7W+R5H34Ch5m8ol1cYEgm
 EbW3lY/VC9h5MFBxeqmLYr0/GEASkeeAXQ8171FqbEHeXEX1vQF4
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

Seems like only powerpc benefits from a branchless implementation.
Other main architectures like ARM or X86 get better code with
the generic implementation and its branch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/checksum.h | 7 +++++++
 include/net/checksum.h              | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/arch/powerpc/include/asm/checksum.h b/arch/powerpc/include/asm/checksum.h
index 19eaa2b6d043..8321f6053a67 100644
--- a/arch/powerpc/include/asm/checksum.h
+++ b/arch/powerpc/include/asm/checksum.h
@@ -111,6 +111,13 @@ static __always_inline __wsum csum_add(__wsum csum, __wsum addend)
 #endif
 }
 
+#define HAVE_ARCH_CSUM_SHIFT
+static __always_inline __wsum csum_shift(__wsum sum, int offset)
+{
+	/* rotate sum to align it with a 16b boundary */
+	return (__force __wsum)rol32((__force u32)sum, (offset & 1) << 3);
+}
+
 /*
  * This is a version of ip_compute_csum() optimized for IP headers,
  * which always checksum on 4 octet boundaries.  ihl is the number
diff --git a/include/net/checksum.h b/include/net/checksum.h
index 79c67f14c448..6bc783b7a06c 100644
--- a/include/net/checksum.h
+++ b/include/net/checksum.h
@@ -80,6 +80,7 @@ static __always_inline __sum16 csum16_sub(__sum16 csum, __be16 addend)
 	return csum16_add(csum, ~addend);
 }
 
+#ifndef HAVE_ARCH_CSUM_SHIFT
 static __always_inline __wsum csum_shift(__wsum sum, int offset)
 {
 	/* rotate sum to align it with a 16b boundary */
@@ -87,6 +88,7 @@ static __always_inline __wsum csum_shift(__wsum sum, int offset)
 		return (__force __wsum)ror32((__force u32)sum, 8);
 	return sum;
 }
+#endif
 
 static __always_inline __wsum
 csum_block_add(__wsum csum, __wsum csum2, int offset)
-- 
2.34.1

