Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD4D3B91CA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 14:50:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFykP52jyz3bYK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 22:50:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VoKnAQoc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VoKnAQoc; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFyk06zS9z2ypn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 22:50:32 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GFyjz6Ljjz9sX5; Thu,  1 Jul 2021 22:50:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1625143831;
 bh=tbYJ2am5iPPSCxKGbyTzZbv5ZR6aV1TXfixQcYpWFIg=;
 h=From:To:Cc:Subject:Date:From;
 b=VoKnAQockLt4SLhwY8+5+WJ1mFsh1vGh0ZWWuB4CXEnFMY0tTMRNlJEtyMaQaSDxm
 kDeHB6l1CHV3WUgmhTYjgHLwP78BtqqKWltej+rqOGJM3o4pKAuZYyrrCbydQklcZT
 TPUiJmly4/1I9TgQpu43fHzQnHxyFnoYZKfJbtxFrcdgKawRpQR66680/3lLI57BXH
 CZR1x/0uv1uGfsW6x+jYCpJt7TP6tp+aT2KemskpnMvvR5XMx5Rs93PX2CgRNr9zG9
 pUkQxdDPPMmti5pSm9f5UpnVaRjusqSzO9Bd0NTqRVqBcfj6f5WEPu3aji8u9sHZm7
 BiXGO4D6AiqcA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Only build restart_table.c for 64s
Date: Thu,  1 Jul 2021 22:50:26 +1000
Message-Id: <20210701125026.292224-1-mpe@ellerman.id.au>
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 9b69d48c7516 ("powerpc/64e: remove implicit soft-masking and
interrupt exit restart logic") limited the implicit soft masking and
restart logic to 64-bit Book3S only. However we are still building
restart_table.c for all 64-bit, ie. Book3E also.

There's no need to build it for 64e, and it also causes missing
prototype warnings for 64e builds, because the prototype is already
behind an #ifdef PPC_BOOK3S_64.

Fixes: 9b69d48c7516 ("powerpc/64e: remove implicit soft-masking and interrupt exit restart logic")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/lib/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 4c92c80454f3..99a7c9132422 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -39,10 +39,10 @@ extra-$(CONFIG_PPC64)	+= crtsavres.o
 endif
 
 obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
-			       memcpy_power7.o
+			       memcpy_power7.o restart_table.o
 
 obj64-y	+= copypage_64.o copyuser_64.o mem_64.o hweight_64.o \
-	   memcpy_64.o copy_mc_64.o restart_table.o
+	   memcpy_64.o copy_mc_64.o
 
 ifndef CONFIG_PPC_QUEUED_SPINLOCKS
 obj64-$(CONFIG_SMP)	+= locks.o
-- 
2.25.1

