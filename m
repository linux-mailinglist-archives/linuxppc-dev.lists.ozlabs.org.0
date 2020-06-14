Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B7F1F89C7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jun 2020 19:09:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lLXb1ZSZzDqQS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 03:09:03 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lLVd3w4lzDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 03:07:18 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49lLVM2GGjzB09bL;
 Sun, 14 Jun 2020 19:07:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id fFXltivinHFx; Sun, 14 Jun 2020 19:07:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49lLVM1QrWzB09b0;
 Sun, 14 Jun 2020 19:07:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EC3C18B76A;
 Sun, 14 Jun 2020 19:07:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JN9iOU_Lvrkr; Sun, 14 Jun 2020 19:07:11 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B3CF58B75F;
 Sun, 14 Jun 2020 19:07:11 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6C40565AF2; Sun, 14 Jun 2020 17:07:11 +0000 (UTC)
Message-Id: <a356625c9aa1b5d711e320c39779e0c713f204cb.1592154127.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] SUNRPC: Add missing asm/cacheflush.h
To: Chuck Lever <chuck.lever@oracle.com>,
 "J. Bruce Fields" <bfields@fieldses.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Sun, 14 Jun 2020 17:07:11 +0000 (UTC)
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
Cc: netdev@vger.kernel.org, linux-nfs@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Even if that's only a warning, not including asm/cacheflush.h
leads to svc_flush_bvec() being empty allthough powerpc defines
ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE.

  CC      net/sunrpc/svcsock.o
net/sunrpc/svcsock.c:227:5: warning: "ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE" is not defined [-Wundef]
 #if ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE
     ^

Fixes: ca07eda33e01 ("SUNRPC: Refactor svc_recvfrom()")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 I detected this on linux-next on June 4th and warned Chuck. Seems like it went into mainline anyway.

 net/sunrpc/svcsock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/sunrpc/svcsock.c b/net/sunrpc/svcsock.c
index 5c4ec9386f81..d9e99cb09aab 100644
--- a/net/sunrpc/svcsock.c
+++ b/net/sunrpc/svcsock.c
@@ -45,6 +45,7 @@
 #include <net/tcp_states.h>
 #include <linux/uaccess.h>
 #include <asm/ioctls.h>
+#include <asm/cacheflush.h>
 
 #include <linux/sunrpc/types.h>
 #include <linux/sunrpc/clnt.h>
-- 
2.25.0

