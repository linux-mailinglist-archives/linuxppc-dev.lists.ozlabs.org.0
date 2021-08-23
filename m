Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B11613F4DA0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 17:37:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gtbw341hvz3cD6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 01:37:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gtbtc0bpSz2xtk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 01:36:08 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GtbtM3Y7gz9sWt;
 Mon, 23 Aug 2021 17:35:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jHYq65ia1aAv; Mon, 23 Aug 2021 17:35:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GtbtL4yHqz9sWm;
 Mon, 23 Aug 2021 17:35:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F62E8B7AF;
 Mon, 23 Aug 2021 17:35:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HlAq6WByRKMp; Mon, 23 Aug 2021 17:35:54 +0200 (CEST)
Received: from po18078vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6CA438B7AD;
 Mon, 23 Aug 2021 17:35:54 +0200 (CEST)
Received: by po18078vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 654E26BC7C; Mon, 23 Aug 2021 15:35:54 +0000 (UTC)
Message-Id: <ba0ea6e1fdb49d241a8be7d14fd5c13f76e2b7c8.1629732940.git.christophe.leroy@csgroup.eu>
In-Reply-To: <fd7938d94008711d441551c06b25a033669a0618.1629732940.git.christophe.leroy@csgroup.eu>
References: <fd7938d94008711d441551c06b25a033669a0618.1629732940.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 4/5] powerpc/uaccess: Add unsafe_clear_user()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 23 Aug 2021 15:35:54 +0000 (UTC)
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

Implement unsafe_clear_user() for powerpc.
It's a copy/paste of unsafe_copy_to_user() with value 0 as source.

It may be improved in a later patch by using 'dcbz' instruction
to zeroize full cache lines at once.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/uaccess.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 22c79ab40006..962b675485ff 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -467,6 +467,26 @@ do {									\
 		unsafe_put_user(*(u8*)(_src + _i), (u8 __user *)(_dst + _i), e); \
 } while (0)
 
+#define unsafe_clear_user(d, l, e)					\
+do {									\
+	u8 __user *_dst = (u8 __user *)(d);				\
+	size_t _len = (l);						\
+	int _i;								\
+									\
+	for (_i = 0; _i < (_len & ~(sizeof(u64) - 1)); _i += sizeof(u64)) \
+		unsafe_put_user(0, (u64 __user *)(_dst + _i), e);	\
+	if (_len & 4) {							\
+		unsafe_put_user(0, (u32 __user *)(_dst + _i), e);	\
+		_i += 4;						\
+	}								\
+	if (_len & 2) {							\
+		unsafe_put_user(0, (u16 __user *)(_dst + _i), e);	\
+		_i += 2;						\
+	}								\
+	if (_len & 1)							\
+		unsafe_put_user(0, (u8 __user *)(_dst + _i), e);	\
+} while (0)
+
 #define HAVE_GET_KERNEL_NOFAULT
 
 #define __get_kernel_nofault(dst, src, type, err_label)			\
-- 
2.25.0

