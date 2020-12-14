Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7922D980D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 13:35:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvgpG40q6zDqMG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 23:35:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cvghg49NdzDqTL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 23:30:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bFTQNsHk; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4Cvghc396Bz9sRR; Mon, 14 Dec 2020 23:30:24 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CvghZ3prpz9sT6; Mon, 14 Dec 2020 23:30:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607949023;
 bh=Pcp8CQ3saOB/lz9NladwYQSJkYip6TSDZbkF5BAUHq4=;
 h=From:To:Subject:Date:From;
 b=bFTQNsHkOiobl89vPWIUh+NO//OlLf2X8+aC36xOE2qk560IFtMNzHdcSucTTh8NE
 d1IgMQrQqH2lS47xc4j+wsaRnwpkd15H1LFeMlLVCFBx9HI0MF8ohJ6+4SEntk06dV
 sA1eziJA3qmK2kMF+CSXPb8idEiu949Bo9o8Ftgs0qbml9t6GxlDm5W6vk1feFBH/A
 gJEhP2UEX+EMb9VIKJbW4NPh1SPElZvV11Tl3A+FZcDuw0WDJ6D/1ptAnHSOkQK1R7
 eflAlXBGsAs9AZUj0V/XB68mN/QB6k2Six/YvTlDKxq3aTPlWMkOJBcq3apxormJ10
 fxXIotdufWrjQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc: Inline setup_kup()
Date: Mon, 14 Dec 2020 23:30:11 +1100
Message-Id: <20201214123011.311024-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

setup_kup() is used by both 64-bit and 32-bit code. However on 64-bit
it must not be __init, because it's used for CPU hotplug, whereas on
32-bit it should be __init because it calls setup_kuap/kuep() which
are __init.

We worked around that problem in the past by marking it __ref, see
commit 67d53f30e23e ("powerpc/mm: fix section mismatch for
setup_kup()").

Marking it __ref basically just omits it from section mismatch
checking, which can lead to bugs, and in fact it did, see commit
44b4c4450f8d ("powerpc/64s: Mark the kuap/kuep functions non __init")

We can avoid all these problems by just making it static inline.
Because all it does is call other functions, making it inline actually
shrinks the 32-bit vmlinux by ~76 bytes.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/kup.h | 8 ++++++--
 arch/powerpc/mm/init-common.c  | 6 ------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 5a9820c54da9..46b12c6dc728 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -49,8 +49,6 @@ extern bool disable_kuap;
 
 #include <linux/pgtable.h>
 
-void setup_kup(void);
-
 #ifdef CONFIG_PPC_KUEP
 void setup_kuep(bool disabled);
 #else
@@ -85,6 +83,12 @@ static inline void restore_user_access(unsigned long flags) { }
 #endif /* CONFIG_PPC_BOOK3S_64 */
 #endif /* CONFIG_PPC_KUAP */
 
+static inline void setup_kup(void)
+{
+	setup_kuep(disable_kuep);
+	setup_kuap(disable_kuap);
+}
+
 static inline void allow_read_from_user(const void __user *from, unsigned long size)
 {
 	allow_user_access(NULL, from, size, KUAP_READ);
diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index afdebb95bcae..3a82f89827a5 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -47,12 +47,6 @@ static int __init parse_nosmap(char *p)
 }
 early_param("nosmap", parse_nosmap);
 
-void __ref setup_kup(void)
-{
-	setup_kuep(disable_kuep);
-	setup_kuap(disable_kuap);
-}
-
 #define CTOR(shift) static void ctor_##shift(void *addr) \
 {							\
 	memset(addr, 0, sizeof(void *) << (shift));	\
-- 
2.25.1

