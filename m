Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D1B1A99F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 12:08:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492J2Z6C8gzDqtW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 20:08:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=DymTGaOS; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492J0S4ngCzDqpv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 20:06:15 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 492J0L1h7rz9tyL2;
 Wed, 15 Apr 2020 12:06:10 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=DymTGaOS; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 7JeZM0syd1tt; Wed, 15 Apr 2020 12:06:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 492J0K6Xg5z9tyKn;
 Wed, 15 Apr 2020 12:06:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586945169; bh=hkKFu8sRpCUMXlHi4pfwxQk9xCM6GrmMLh79FA+H4VM=;
 h=From:Subject:To:Cc:Date:From;
 b=DymTGaOSUGHMez5hZSMw2s+fHEnCnX98xDcqO2/KRXf0+LGRlkpmXwGY0LwJ+wmzT
 s0O2Jz2fO0puohDRUAJ4JE8BGK/gpME8CN8M0ncam5zX2FtU7fwA/5ycw1lp6/1Eru
 r0NIG4xUrZvyrwW9vS6gB22meZXOz4YZqlzupRC8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 19ACA8B977;
 Wed, 15 Apr 2020 12:06:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5lJGUnSjmWgq; Wed, 15 Apr 2020 12:06:11 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9FBB18B978;
 Wed, 15 Apr 2020 12:06:10 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E158B65789; Wed, 15 Apr 2020 10:06:09 +0000 (UTC)
Message-Id: <57425c33dd72f292b1a23570244b81419072a7aa.1586945153.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/8xx: Reduce time spent in allow_user_access() and
 friends
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 15 Apr 2020 10:06:09 +0000 (UTC)
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

To enable/disable kernel access to user space, the 8xx has to
modify the properties of access group 1. This is done by writing
predefined values into SPRN_Mx_AP registers.

As of today, a __put_user() gives:

00000d64 <my_test>:
 d64:	3d 20 4f ff 	lis     r9,20479
 d68:	61 29 ff ff 	ori     r9,r9,65535
 d6c:	7d 3a c3 a6 	mtspr   794,r9
 d70:	39 20 00 00 	li      r9,0
 d74:	90 83 00 00 	stw     r4,0(r3)
 d78:	3d 20 6f ff 	lis     r9,28671
 d7c:	61 29 ff ff 	ori     r9,r9,65535
 d80:	7d 3a c3 a6 	mtspr   794,r9
 d84:	4e 80 00 20 	blr

Because only groups 0 and 1 are used, the definition of
groups 2 to 15 doesn't matter.
By setting unused bits to 0 instead on 1, one instruction is
removed for each lock and unlock action:

00000d5c <my_test>:
 d5c:	3d 20 40 00 	lis     r9,16384
 d60:	7d 3a c3 a6 	mtspr   794,r9
 d64:	39 20 00 00 	li      r9,0
 d68:	90 83 00 00 	stw     r4,0(r3)
 d6c:	3d 20 60 00 	lis     r9,24576
 d70:	7d 3a c3 a6 	mtspr   794,r9
 d74:	4e 80 00 20 	blr

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
index 76af5b0cb16e..6aa3464a88ed 100644
--- a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
@@ -37,16 +37,16 @@
  * Therefore, we define 2 APG groups. lsb is _PMD_USER
  * 0 => Kernel => 01 (all accesses performed according to page definition)
  * 1 => User => 00 (all accesses performed as supervisor iaw page definition)
- * 2-16 => NA => 11 (all accesses performed as user iaw page definition)
+ * 2-15 => Not Used
  */
-#define MI_APG_INIT	0x4fffffff
+#define MI_APG_INIT	0x40000000
 
 /*
  * 0 => Kernel => 01 (all accesses performed according to page definition)
  * 1 => User => 10 (all accesses performed according to swaped page definition)
- * 2-16 => NA => 11 (all accesses performed as user iaw page definition)
+ * 2-15 => Not Used
  */
-#define MI_APG_KUEP	0x6fffffff
+#define MI_APG_KUEP	0x60000000
 
 /* The effective page number register.  When read, contains the information
  * about the last instruction TLB miss.  When MI_RPN is written, bits in
@@ -117,16 +117,16 @@
  * Therefore, we define 2 APG groups. lsb is _PMD_USER
  * 0 => Kernel => 01 (all accesses performed according to page definition)
  * 1 => User => 00 (all accesses performed as supervisor iaw page definition)
- * 2-16 => NA => 11 (all accesses performed as user iaw page definition)
+ * 2-15 => Not Used
  */
-#define MD_APG_INIT	0x4fffffff
+#define MD_APG_INIT	0x40000000
 
 /*
  * 0 => No user => 01 (all accesses performed according to page definition)
  * 1 => User => 10 (all accesses performed according to swaped page definition)
- * 2-16 => NA => 11 (all accesses performed as user iaw page definition)
+ * 2-15 => Not Used
  */
-#define MD_APG_KUAP	0x6fffffff
+#define MD_APG_KUAP	0x60000000
 
 /* The effective page number register.  When read, contains the information
  * about the last instruction TLB miss.  When MD_RPN is written, bits in
-- 
2.25.0

