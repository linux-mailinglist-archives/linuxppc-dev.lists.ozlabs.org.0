Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A97C3450051
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 09:53:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ht2zk4Z2lz307x
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 19:53:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ht2zJ3zNKz2xDM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Nov 2021 19:53:31 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Ht2zF0qR0z9sSH;
 Mon, 15 Nov 2021 09:53:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id whCArfjl7wVR; Mon, 15 Nov 2021 09:53:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Ht2zD726Yz9sSB;
 Mon, 15 Nov 2021 09:53:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D817C8B767;
 Mon, 15 Nov 2021 09:53:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id kuNXKDjQbMwa; Mon, 15 Nov 2021 09:53:28 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AB2368B763;
 Mon, 15 Nov 2021 09:53:28 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 1AF8rJTO135062
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 09:53:19 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 1AF8rDA2135046;
 Mon, 15 Nov 2021 09:53:13 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/signal32: Fix sigset_t copy
Date: Mon, 15 Nov 2021 09:52:55 +0100
Message-Id: <99ef38d61c0eb3f79c68942deb0c35995a93a777.1636966353.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1636966371; l=2320; s=20211009;
 h=from:subject:message-id; bh=fZPpiXO4Sl6nxpscgwKm8fGE1QxieiimfErqhQs2Q+0=;
 b=TT/pMU/Kq2uF3azjX28nUSpUIgSMS0xTw5bIAlmU6r8XXTX6cgtMMfJeiBoecUExwC+wtaPTO6QR
 ZcZmSuwmCCg5PGuf9U6ykT6ALCuF0Ceo3fSyyQ8fVhj/5gwRtMVM
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
Cc: Stan Johnson <userm57@yahoo.com>, Finn Thain <fthain@linux-m68k.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 "Christopher M . Riedl" <cmr@bluescreens.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The conversion from __copy_from_user() to __get_user() by
commit d3ccc9781560 ("powerpc/signal: Use __get_user() to copy
sigset_t") introduced a regression in __get_user_sigset() for
powerpc/32. The bug was subsequently moved into
unsafe_get_user_sigset().

The bug is due to the copied 64 bit value being truncated to
32 bits while being assigned to dst->sig[0]

The regression was reported by users of the Xorg packages distributed in
Debian/powerpc --

    "The symptoms are that the fb screen goes blank, with the backlight
    remaining on and no errors logged in /var/log; wdm (or startx) run
    with no effect (I tried logging in in the blind, with no effect).
    And they are hard to kill, requiring 'kill -KILL ...'"

Fix the regression by copying each word of the sigset, not only the
first one.

__get_user_sigset() was tentatively optimised to copy 64 bits at once
in order to minimise KUAP unlock/lock impact, but the unsafe variant
doesn't suffer that, so it can just copy words.

Cc: Christopher M. Riedl <cmr@bluescreens.de>
Fixes: 887f3ceb51cd ("powerpc/signal32: Convert do_setcontext[_tm]() to user access block")
Cc: stable@vger.kernel.org
Reported-by: Finn Thain <fthain@linux-m68k.org>
Reported-and-tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
index 1f07317964e4..618aeccdf691 100644
--- a/arch/powerpc/kernel/signal.h
+++ b/arch/powerpc/kernel/signal.h
@@ -25,8 +25,14 @@ static inline int __get_user_sigset(sigset_t *dst, const sigset_t __user *src)
 
 	return __get_user(dst->sig[0], (u64 __user *)&src->sig[0]);
 }
-#define unsafe_get_user_sigset(dst, src, label) \
-	unsafe_get_user((dst)->sig[0], (u64 __user *)&(src)->sig[0], label)
+#define unsafe_get_user_sigset(dst, src, label) do {			\
+	sigset_t *__dst = dst;						\
+	const sigset_t __user *__src = src;				\
+	int i;								\
+									\
+	for (i = 0; i < _NSIG_WORDS; i++)				\
+		unsafe_get_user(__dst->sig[i], &__src->sig[i], label);	\
+} while (0)
 
 #ifdef CONFIG_VSX
 extern unsigned long copy_vsx_to_user(void __user *to,
-- 
2.31.1

