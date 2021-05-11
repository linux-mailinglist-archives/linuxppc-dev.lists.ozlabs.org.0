Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDA4379F8B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 08:08:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfSCh216sz302c
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 16:08:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfSCL5320z2xfy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 16:08:10 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FfSCC6tq1z9sdc;
 Tue, 11 May 2021 08:08:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yc6tN5eH3jks; Tue, 11 May 2021 08:08:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FfSCC5vYHz9sdb;
 Tue, 11 May 2021 08:08:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A6C1E8B7A0;
 Tue, 11 May 2021 08:08:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CSUn8zOMSxbO; Tue, 11 May 2021 08:08:07 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2DFC28B766;
 Tue, 11 May 2021 08:08:07 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E5E386492B; Tue, 11 May 2021 06:08:06 +0000 (UTC)
Message-Id: <f7f4d4e364de6e473da874468b903da6e5d97adc.1620713272.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: Force inlining of csum_add()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 11 May 2021 06:08:06 +0000 (UTC)
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

Commit 328e7e487a46 ("powerpc: force inlining of csum_partial() to
avoid multiple csum_partial() with GCC10") inlined csum_partial().

Now that csum_partial() is inlined, GCC outlines csum_add() when
called by csum_partial().

c064fb28 <csum_add>:
c064fb28:	7c 63 20 14 	addc    r3,r3,r4
c064fb2c:	7c 63 01 94 	addze   r3,r3
c064fb30:	4e 80 00 20 	blr

c0665fb8 <csum_add>:
c0665fb8:	7c 63 20 14 	addc    r3,r3,r4
c0665fbc:	7c 63 01 94 	addze   r3,r3
c0665fc0:	4e 80 00 20 	blr

c066719c:	7c 9a c0 2e 	lwzx    r4,r26,r24
c06671a0:	38 60 00 00 	li      r3,0
c06671a4:	7f 1a c2 14 	add     r24,r26,r24
c06671a8:	4b ff ee 11 	bl      c0665fb8 <csum_add>
c06671ac:	80 98 00 04 	lwz     r4,4(r24)
c06671b0:	4b ff ee 09 	bl      c0665fb8 <csum_add>
c06671b4:	80 98 00 08 	lwz     r4,8(r24)
c06671b8:	4b ff ee 01 	bl      c0665fb8 <csum_add>
c06671bc:	a0 98 00 0c 	lhz     r4,12(r24)
c06671c0:	4b ff ed f9 	bl      c0665fb8 <csum_add>
c06671c4:	7c 63 18 f8 	not     r3,r3
c06671c8:	81 3f 00 68 	lwz     r9,104(r31)
c06671cc:	81 5f 00 a0 	lwz     r10,160(r31)
c06671d0:	7d 29 18 14 	addc    r9,r9,r3
c06671d4:	7d 29 01 94 	addze   r9,r9
c06671d8:	91 3f 00 68 	stw     r9,104(r31)
c06671dc:	7d 1a 50 50 	subf    r8,r26,r10
c06671e0:	83 01 00 10 	lwz     r24,16(r1)
c06671e4:	83 41 00 18 	lwz     r26,24(r1)

The sum with 0 is useless, should have been skipped.
And there is even one completely unused instance of csum_add().

In file included from ./include/net/checksum.h:22,
                 from ./include/linux/skbuff.h:28,
                 from ./include/linux/icmp.h:16,
                 from net/ipv6/ip6_tunnel.c:23:
./arch/powerpc/include/asm/checksum.h: In function '__ip6_tnl_rcv':
./arch/powerpc/include/asm/checksum.h:94:22: warning: inlining failed in call to 'csum_add': call is unlikely and code size would grow [-Winline]
   94 | static inline __wsum csum_add(__wsum csum, __wsum addend)
      |                      ^~~~~~~~
./arch/powerpc/include/asm/checksum.h:172:31: note: called from here
  172 |                         sum = csum_add(sum, (__force __wsum)*(const u32 *)buff);
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./arch/powerpc/include/asm/checksum.h:94:22: warning: inlining failed in call to 'csum_add': call is unlikely and code size would grow [-Winline]
   94 | static inline __wsum csum_add(__wsum csum, __wsum addend)
      |                      ^~~~~~~~
./arch/powerpc/include/asm/checksum.h:177:31: note: called from here
  177 |                         sum = csum_add(sum, (__force __wsum)
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  178 |                                             *(const u32 *)(buff + 4));
      |                                             ~~~~~~~~~~~~~~~~~~~~~~~~~
./arch/powerpc/include/asm/checksum.h:94:22: warning: inlining failed in call to 'csum_add': call is unlikely and code size would grow [-Winline]
   94 | static inline __wsum csum_add(__wsum csum, __wsum addend)
      |                      ^~~~~~~~
./arch/powerpc/include/asm/checksum.h:183:31: note: called from here
  183 |                         sum = csum_add(sum, (__force __wsum)
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  184 |                                             *(const u32 *)(buff + 8));
      |                                             ~~~~~~~~~~~~~~~~~~~~~~~~~
./arch/powerpc/include/asm/checksum.h:94:22: warning: inlining failed in call to 'csum_add': call is unlikely and code size would grow [-Winline]
   94 | static inline __wsum csum_add(__wsum csum, __wsum addend)
      |                      ^~~~~~~~
./arch/powerpc/include/asm/checksum.h:186:31: note: called from here
  186 |                         sum = csum_add(sum, (__force __wsum)
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  187 |                                             *(const u16 *)(buff + 12));
      |                                             ~~~~~~~~~~~~~~~~~~~~~~~~~~

Force inlining of csum_add().

     94c:	80 df 00 a0 	lwz     r6,160(r31)
     950:	7d 28 50 2e 	lwzx    r9,r8,r10
     954:	7d 48 52 14 	add     r10,r8,r10
     958:	80 aa 00 04 	lwz     r5,4(r10)
     95c:	80 ff 00 68 	lwz     r7,104(r31)
     960:	7d 29 28 14 	addc    r9,r9,r5
     964:	7d 29 01 94 	addze   r9,r9
     968:	7d 08 30 50 	subf    r8,r8,r6
     96c:	80 aa 00 08 	lwz     r5,8(r10)
     970:	a1 4a 00 0c 	lhz     r10,12(r10)
     974:	7d 29 28 14 	addc    r9,r9,r5
     978:	7d 29 01 94 	addze   r9,r9
     97c:	7d 29 50 14 	addc    r9,r9,r10
     980:	7d 29 01 94 	addze   r9,r9
     984:	7d 29 48 f8 	not     r9,r9
     988:	7c e7 48 14 	addc    r7,r7,r9
     98c:	7c e7 01 94 	addze   r7,r7
     990:	90 ff 00 68 	stw     r7,104(r31)

In the non-inlined version, the first sum with 0 was performed.
Here it is skipped.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/checksum.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/checksum.h b/arch/powerpc/include/asm/checksum.h
index d5da7ddbf0fc..350de8f90250 100644
--- a/arch/powerpc/include/asm/checksum.h
+++ b/arch/powerpc/include/asm/checksum.h
@@ -91,7 +91,7 @@ static inline __sum16 csum_tcpudp_magic(__be32 saddr, __be32 daddr, __u32 len,
 }
 
 #define HAVE_ARCH_CSUM_ADD
-static inline __wsum csum_add(__wsum csum, __wsum addend)
+static __always_inline __wsum csum_add(__wsum csum, __wsum addend)
 {
 #ifdef __powerpc64__
 	u64 res = (__force u64)csum;
-- 
2.25.0

