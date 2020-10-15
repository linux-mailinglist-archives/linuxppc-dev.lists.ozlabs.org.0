Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1002B28F065
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 12:53:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBmNs1zFrzDqWH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 21:53:49 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBmMN1KcFzDqTd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 21:52:26 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CBmM90Gq1zB09ZT;
 Thu, 15 Oct 2020 12:52:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SbMnJxog58-1; Thu, 15 Oct 2020 12:52:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CBmM85vf7zB09ZS;
 Thu, 15 Oct 2020 12:52:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1251D8B809;
 Thu, 15 Oct 2020 12:52:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OFAG28YBprpN; Thu, 15 Oct 2020 12:52:21 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 960618B7FF;
 Thu, 15 Oct 2020 12:52:21 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BC4976646A; Thu, 15 Oct 2020 10:52:20 +0000 (UTC)
Message-Id: <a1d31f84ddb0926813b17fcd5cc7f3fa7b4deac2.1602759123.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: force inlining of csum_partial() to avoid multiple
 csum_partial() with GCC10
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 15 Oct 2020 10:52:20 +0000 (UTC)
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

	ppc-linux-objdump -d vmlinux | grep -e "<csum_partial>" -e "<__csum_partial>"

With gcc9 I get:

	c0017ef8 <__csum_partial>:
	c00182fc:	4b ff fb fd 	bl      c0017ef8 <__csum_partial>
	c0018478:	4b ff fa 80 	b       c0017ef8 <__csum_partial>
	c03e8458:	4b c2 fa a0 	b       c0017ef8 <__csum_partial>
	c03e8518:	4b c2 f9 e1 	bl      c0017ef8 <__csum_partial>
	c03ef410:	4b c2 8a e9 	bl      c0017ef8 <__csum_partial>
	c03f0b24:	4b c2 73 d5 	bl      c0017ef8 <__csum_partial>
	c04279a4:	4b bf 05 55 	bl      c0017ef8 <__csum_partial>
	c0429820:	4b be e6 d9 	bl      c0017ef8 <__csum_partial>
	c0429944:	4b be e5 b5 	bl      c0017ef8 <__csum_partial>
	c042b478:	4b be ca 81 	bl      c0017ef8 <__csum_partial>
	c042b554:	4b be c9 a5 	bl      c0017ef8 <__csum_partial>
	c045f15c:	4b bb 8d 9d 	bl      c0017ef8 <__csum_partial>
	c0492190:	4b b8 5d 69 	bl      c0017ef8 <__csum_partial>
	c0492310:	4b b8 5b e9 	bl      c0017ef8 <__csum_partial>
	c0495594:	4b b8 29 65 	bl      c0017ef8 <__csum_partial>
	c049c420:	4b b7 ba d9 	bl      c0017ef8 <__csum_partial>
	c049c870:	4b b7 b6 89 	bl      c0017ef8 <__csum_partial>
	c049c930:	4b b7 b5 c9 	bl      c0017ef8 <__csum_partial>
	c04a9ca0:	4b b6 e2 59 	bl      c0017ef8 <__csum_partial>
	c04bdde4:	4b b5 a1 15 	bl      c0017ef8 <__csum_partial>
	c04be480:	4b b5 9a 79 	bl      c0017ef8 <__csum_partial>
	c04be710:	4b b5 97 e9 	bl      c0017ef8 <__csum_partial>
	c04c969c:	4b b4 e8 5d 	bl      c0017ef8 <__csum_partial>
	c04ca2fc:	4b b4 db fd 	bl      c0017ef8 <__csum_partial>
	c04cf5bc:	4b b4 89 3d 	bl      c0017ef8 <__csum_partial>
	c04d0440:	4b b4 7a b9 	bl      c0017ef8 <__csum_partial>

With gcc10 I get:

	c0018d08 <__csum_partial>:
	c0019020 <csum_partial>:
	c0019020:	4b ff fc e8 	b       c0018d08 <__csum_partial>
	c001914c:	4b ff fe d4 	b       c0019020 <csum_partial>
	c0019250:	4b ff fd d1 	bl      c0019020 <csum_partial>
	c03e404c <csum_partial>:
	c03e404c:	4b c3 4c bc 	b       c0018d08 <__csum_partial>
	c03e4050:	4b ff ff fc 	b       c03e404c <csum_partial>
	c03e40fc:	4b ff ff 51 	bl      c03e404c <csum_partial>
	c03e6680:	4b ff d9 cd 	bl      c03e404c <csum_partial>
	c03e68c4:	4b ff d7 89 	bl      c03e404c <csum_partial>
	c03e7934:	4b ff c7 19 	bl      c03e404c <csum_partial>
	c03e7bf8:	4b ff c4 55 	bl      c03e404c <csum_partial>
	c03eb148:	4b ff 8f 05 	bl      c03e404c <csum_partial>
	c03ecf68:	4b c2 bd a1 	bl      c0018d08 <__csum_partial>
	c04275b8 <csum_partial>:
	c04275b8:	4b bf 17 50 	b       c0018d08 <__csum_partial>
	c0427884:	4b ff fd 35 	bl      c04275b8 <csum_partial>
	c0427b18:	4b ff fa a1 	bl      c04275b8 <csum_partial>
	c0427bd8:	4b ff f9 e1 	bl      c04275b8 <csum_partial>
	c0427cd4:	4b ff f8 e5 	bl      c04275b8 <csum_partial>
	c0427e34:	4b ff f7 85 	bl      c04275b8 <csum_partial>
	c045a1c0:	4b bb eb 49 	bl      c0018d08 <__csum_partial>
	c0489464 <csum_partial>:
	c0489464:	4b b8 f8 a4 	b       c0018d08 <__csum_partial>
	c04896b0:	4b ff fd b5 	bl      c0489464 <csum_partial>
	c048982c:	4b ff fc 39 	bl      c0489464 <csum_partial>
	c0490158:	4b b8 8b b1 	bl      c0018d08 <__csum_partial>
	c0492f0c <csum_partial>:
	c0492f0c:	4b b8 5d fc 	b       c0018d08 <__csum_partial>
	c049326c:	4b ff fc a1 	bl      c0492f0c <csum_partial>
	c049333c:	4b ff fb d1 	bl      c0492f0c <csum_partial>
	c0493b18:	4b ff f3 f5 	bl      c0492f0c <csum_partial>
	c0493f50:	4b ff ef bd 	bl      c0492f0c <csum_partial>
	c0493ffc:	4b ff ef 11 	bl      c0492f0c <csum_partial>
	c04a0f78:	4b b7 7d 91 	bl      c0018d08 <__csum_partial>
	c04b3e3c:	4b b6 4e cd 	bl      c0018d08 <__csum_partial>
	c04b40d0 <csum_partial>:
	c04b40d0:	4b b6 4c 38 	b       c0018d08 <__csum_partial>
	c04b4448:	4b ff fc 89 	bl      c04b40d0 <csum_partial>
	c04b46f4:	4b ff f9 dd 	bl      c04b40d0 <csum_partial>
	c04bf448:	4b b5 98 c0 	b       c0018d08 <__csum_partial>
	c04c5264:	4b b5 3a a5 	bl      c0018d08 <__csum_partial>
	c04c61e4:	4b b5 2b 25 	bl      c0018d08 <__csum_partial>

gcc10 defines multiple versions of csum_partial() which are just
an unconditionnal branch to __csum_partial().

To enforce inlining of that branch to __csum_partial(),
mark csum_partial() as __always_inline.

With this patch with gcc10:

	c0018d08 <__csum_partial>:
	c0019148:	4b ff fb c0 	b       c0018d08 <__csum_partial>
	c001924c:	4b ff fa bd 	bl      c0018d08 <__csum_partial>
	c03e40ec:	4b c3 4c 1d 	bl      c0018d08 <__csum_partial>
	c03e4120:	4b c3 4b e8 	b       c0018d08 <__csum_partial>
	c03eb004:	4b c2 dd 05 	bl      c0018d08 <__csum_partial>
	c03ecef4:	4b c2 be 15 	bl      c0018d08 <__csum_partial>
	c0427558:	4b bf 17 b1 	bl      c0018d08 <__csum_partial>
	c04286e4:	4b bf 06 25 	bl      c0018d08 <__csum_partial>
	c0428cd8:	4b bf 00 31 	bl      c0018d08 <__csum_partial>
	c0428d84:	4b be ff 85 	bl      c0018d08 <__csum_partial>
	c045a17c:	4b bb eb 8d 	bl      c0018d08 <__csum_partial>
	c0489450:	4b b8 f8 b9 	bl      c0018d08 <__csum_partial>
	c0491860:	4b b8 74 a9 	bl      c0018d08 <__csum_partial>
	c0492eec:	4b b8 5e 1d 	bl      c0018d08 <__csum_partial>
	c04a0eac:	4b b7 7e 5d 	bl      c0018d08 <__csum_partial>
	c04b3e34:	4b b6 4e d5 	bl      c0018d08 <__csum_partial>
	c04b426c:	4b b6 4a 9d 	bl      c0018d08 <__csum_partial>
	c04b463c:	4b b6 46 cd 	bl      c0018d08 <__csum_partial>
	c04c004c:	4b b5 8c bd 	bl      c0018d08 <__csum_partial>
	c04c0368:	4b b5 89 a1 	bl      c0018d08 <__csum_partial>
	c04c5254:	4b b5 3a b5 	bl      c0018d08 <__csum_partial>
	c04c60d4:	4b b5 2c 35 	bl      c0018d08 <__csum_partial>

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/checksum.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/checksum.h b/arch/powerpc/include/asm/checksum.h
index 9cce06194dcc..cab8fec60005 100644
--- a/arch/powerpc/include/asm/checksum.h
+++ b/arch/powerpc/include/asm/checksum.h
@@ -164,7 +164,7 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
  */
 __wsum __csum_partial(const void *buff, int len, __wsum sum);
 
-static inline __wsum csum_partial(const void *buff, int len, __wsum sum)
+static __always_inline __wsum csum_partial(const void *buff, int len, __wsum sum)
 {
 	if (__builtin_constant_p(len) && len <= 16 && (len & 1) == 0) {
 		if (len == 2)
-- 
2.25.0

