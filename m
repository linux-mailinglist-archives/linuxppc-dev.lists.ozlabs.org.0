Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B4092474
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 15:14:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BvXQ2ty4zDq9y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 23:14:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="tD4TxXpJ"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BvMG5KrBzDqBb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 23:06:34 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46BvM607gxz9v0nX;
 Mon, 19 Aug 2019 15:06:26 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tD4TxXpJ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id TPrCIcSaTww6; Mon, 19 Aug 2019 15:06:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46BvM55lzyz9v0nR;
 Mon, 19 Aug 2019 15:06:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566219985; bh=1ZO5zqAneXUowhuu6Yq8tC+2kAR67+y8HpFt02utC2w=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=tD4TxXpJNMGnwglYQeKo8TMSAbZfAYsKXSYOWty8xyaNSUSiZYKB55E9j4WE/HAak
 qTgpVrBrOEo1XMBzMPXBqU1azVbF7sKyCXRhNM652l0pRY5yCLoZi4qBu8k6S6m3oS
 ZGdJV7WhN+QE42fW1HLQw2uv5Wp/ZMRKpuGoshuk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4BF7E8B7BA;
 Mon, 19 Aug 2019 15:06:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hpJV9Zd_5rQc; Mon, 19 Aug 2019 15:06:31 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2288A8B7B6;
 Mon, 19 Aug 2019 15:06:31 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2536F6B708; Mon, 19 Aug 2019 13:06:31 +0000 (UTC)
Message-Id: <20510ce03cc9463f1c9e743c1d93b939de501b53.1566219503.git.christophe.leroy@c-s.fr>
In-Reply-To: <a6781075192afe0c909ce7d091de7931183a5d93.1566219503.git.christophe.leroy@c-s.fr>
References: <a6781075192afe0c909ce7d091de7931183a5d93.1566219503.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 3/3] powerpc: use __builtin_trap() in BUG/WARN macros.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 segher@kernel.crashing.org
Date: Mon, 19 Aug 2019 13:06:31 +0000 (UTC)
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

The below exemples of use of WARN_ON() show that the result
is sub-optimal in regard of the capabilities of powerpc.

void test_warn1(unsigned long long a)
{
	WARN_ON(a);
}

void test_warn2(unsigned long a)
{
	WARN_ON(a);
}

void test_warn3(unsigned long a, unsigned long b)
{
	WARN_ON(a < b);
}

void test_warn4(unsigned long a, unsigned long b)
{
	WARN_ON(!a);
}

void test_warn5(unsigned long a, unsigned long b)
{
	WARN_ON(!a && b);
}

00000000 <test_warn1>:
   0:	7c 64 23 78 	or      r4,r3,r4
   4:	31 24 ff ff 	addic   r9,r4,-1
   8:	7c 89 21 10 	subfe   r4,r9,r4
   c:	0f 04 00 00 	twnei   r4,0
  10:	4e 80 00 20 	blr

00000014 <test_warn2>:
  14:	31 23 ff ff 	addic   r9,r3,-1
  18:	7c 69 19 10 	subfe   r3,r9,r3
  1c:	0f 03 00 00 	twnei   r3,0
  20:	4e 80 00 20 	blr

00000024 <test_warn3>:
  24:	7c 84 18 10 	subfc   r4,r4,r3
  28:	7d 29 49 10 	subfe   r9,r9,r9
  2c:	7d 29 00 d0 	neg     r9,r9
  30:	0f 09 00 00 	twnei   r9,0
  34:	4e 80 00 20 	blr

00000038 <test_warn4>:
  38:	7c 63 00 34 	cntlzw  r3,r3
  3c:	54 63 d9 7e 	rlwinm  r3,r3,27,5,31
  40:	0f 03 00 00 	twnei   r3,0
  44:	4e 80 00 20 	blr

00000048 <test_warn5>:
  48:	2f 83 00 00 	cmpwi   cr7,r3,0
  4c:	39 20 00 00 	li      r9,0
  50:	41 9e 00 0c 	beq     cr7,5c <test_warn5+0x14>
  54:	7c 84 00 34 	cntlzw  r4,r4
  58:	54 89 d9 7e 	rlwinm  r9,r4,27,5,31
  5c:	0f 09 00 00 	twnei   r9,0
  60:	4e 80 00 20 	blr

RELOCATION RECORDS FOR [__bug_table]:
OFFSET   TYPE              VALUE
00000000 R_PPC_ADDR32      .text+0x0000000c
0000000c R_PPC_ADDR32      .text+0x0000001c
00000018 R_PPC_ADDR32      .text+0x00000030
00000018 R_PPC_ADDR32      .text+0x00000030
00000024 R_PPC_ADDR32      .text+0x00000040
00000030 R_PPC_ADDR32      .text+0x0000005c

Using __builtin_trap() instead of inline assembly of twnei/tdnei
provides a far better result:

00000000 <test_warn1>:
   0:	7c 64 23 78 	or      r4,r3,r4
   4:	0f 04 00 00 	twnei   r4,0
   8:	4e 80 00 20 	blr

0000000c <test_warn2>:
   c:	0f 03 00 00 	twnei   r3,0
  10:	4e 80 00 20 	blr

00000014 <test_warn3>:
  14:	7c 43 20 08 	twllt   r3,r4
  18:	4e 80 00 20 	blr

0000001c <test_warn4>:
  1c:	0c 83 00 00 	tweqi   r3,0
  20:	4e 80 00 20 	blr

00000024 <test_warn5>:
  24:	2f 83 00 00 	cmpwi   cr7,r3,0
  28:	41 9e 00 08 	beq     cr7,30 <test_warn5+0xc>
  2c:	0c 84 00 00 	tweqi   r4,0
  30:	4e 80 00 20 	blr

RELOCATION RECORDS FOR [__bug_table]:
OFFSET   TYPE              VALUE
00000000 R_PPC_ADDR32      .text+0x00000004
0000000c R_PPC_ADDR32      .text+0x0000000c
00000018 R_PPC_ADDR32      .text+0x00000014
00000024 R_PPC_ADDR32      .text+0x0000001c
00000030 R_PPC_ADDR32      .text+0x0000002c

Note that we keep using an assembly text using "twi 31, 0, 0" for
inconditional traps because GCC drops all code after
__builtin_trap() when the condition is always true at build time.

In addition, this patch also fixes bugs in the BUG_ON(x) macro
which unlike WARN_ON(x) uses (x) directly as the condition by
forcing it to long instead of using !!(x). This leads to
upper part of an unsigned long long being ignored on PPC32 and
may produce bugs on PPC64 if (x) is a smaller type like an int.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/bug.h | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index dbf7da90f507..a229130ffcf9 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -44,14 +44,14 @@
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 #define _EMIT_BUG_ENTRY				\
 	".section __bug_table,\"aw\"\n"		\
-	"2:\t" PPC_LONG "1b, %0\n"		\
+	"2:\t" PPC_LONG "1b - 4, %0\n"		\
 	"\t.short %1, %2\n"			\
 	".org 2b+%3\n"				\
 	".previous\n"
 #else
 #define _EMIT_BUG_ENTRY				\
 	".section __bug_table,\"aw\"\n"		\
-	"2:\t" PPC_LONG "1b\n"			\
+	"2:\t" PPC_LONG "1b - 4\n"		\
 	"\t.short %2\n"				\
 	".org 2b+%3\n"				\
 	".previous\n"
@@ -59,7 +59,8 @@
 
 #define BUG_ENTRY(insn, flags, ...)			\
 	__asm__ __volatile__(				\
-		"1:	" insn "\n"			\
+		insn "\n"				\
+		"1:\n"					\
 		_EMIT_BUG_ENTRY				\
 		: : "i" (__FILE__), "i" (__LINE__),	\
 		  "i" (flags),				\
@@ -82,7 +83,9 @@
 		if (x)						\
 			BUG();					\
 	} else {						\
-		BUG_ENTRY(PPC_TLNEI " %4, 0", 0, "r" ((__force long)(x)));	\
+		if (x)						\
+			__builtin_trap();			\
+		BUG_ENTRY("", 0);				\
 	}							\
 } while (0)
 
@@ -94,9 +97,9 @@
 		if (__ret_warn_on)				\
 			__WARN_TAINT(TAINT_WARN);		\
 	} else {						\
-		BUG_ENTRY(PPC_TLNEI " %4, 0",			\
-			  BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
-			  "r" (__ret_warn_on));	\
+		if (__ret_warn_on)				\
+			__builtin_trap();			\
+		BUG_ENTRY("", BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN));	\
 	}							\
 	unlikely(__ret_warn_on);				\
 })
-- 
2.13.3

