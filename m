Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 055E24B230F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 11:26:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jw8sP4tQrz3cYt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 21:26:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jw8rS2TKcz3cC9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 21:25:12 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Jw8rK15wZz9sSL;
 Fri, 11 Feb 2022 11:25:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RVC_5M6K9gs6; Fri, 11 Feb 2022 11:25:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Jw8rJ088Lz9sSM;
 Fri, 11 Feb 2022 11:25:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E74F28B77E;
 Fri, 11 Feb 2022 11:25:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id avygUaqL76b8; Fri, 11 Feb 2022 11:25:03 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.91])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A38D28B764;
 Fri, 11 Feb 2022 11:25:03 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21BAOsOZ946508
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 11:24:54 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21BAOq8A946507;
 Fri, 11 Feb 2022 11:24:52 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 1/2] net: Allow csum_sub() to be provided in arch
Date: Fri, 11 Feb 2022 11:24:48 +0100
Message-Id: <0c8eaab8f0685d2a70d125cf876238c70afd4fb6.1644574987.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1644575088; l=989; s=20211009;
 h=from:subject:message-id; bh=RUCXz7rcwV3vtRjuwGPzOWG1MqwEYlRVJE5g+0Z10T0=;
 b=eADc4aCLdklo7HvFbLsm7mGATs8mPnBrP4sXzi8ylYEqFq0APBPHpYUY+C3ha30J+ZcvLukGCpHz
 n6af84NTDAWj2ByZb/YbwA6p1bUFrsK2r9w+YrLcIqegfq86tYCK
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

In the same spirit as commit 07064c6e022b ("net: Allow csum_add to be
provided in arch"), allow csum_sub() to be provided by arch.

The generic implementation of csum_sub() call csum_add() with the
complement of the addendum.

Some architectures can do it directly.

This will also avoid getting several copies of csum_sub() outlined
when building with -Os.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 include/net/checksum.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/net/checksum.h b/include/net/checksum.h
index 9badcd5532ef..735d98724145 100644
--- a/include/net/checksum.h
+++ b/include/net/checksum.h
@@ -62,10 +62,12 @@ static inline __wsum csum_add(__wsum csum, __wsum addend)
 }
 #endif
 
+#ifndef HAVE_ARCH_CSUM_SUB
 static inline __wsum csum_sub(__wsum csum, __wsum addend)
 {
 	return csum_add(csum, ~addend);
 }
+#endif
 
 static inline __sum16 csum16_add(__sum16 csum, __be16 addend)
 {
-- 
2.34.1

