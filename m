Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D191B385
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 12:01:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452bv40xMpzDqHW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 20:01:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="pSLMC7V2"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452bsf1yC2zDqG8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 20:00:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 452bsR61QVz9v1jP;
 Mon, 13 May 2019 12:00:11 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=pSLMC7V2; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id laj-TVpyDV73; Mon, 13 May 2019 12:00:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 452bsR47p3z9v1jF;
 Mon, 13 May 2019 12:00:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557741611; bh=7BTEEM+fWZP7D+ZAJLkxi+yNPxZ6hOf02JrDoJz+wok=;
 h=From:Subject:To:Cc:Date:From;
 b=pSLMC7V21X3M2Qjio/MFQS4XnWRy89zm8AxvXWHNx6u2phqBSCYHDo5PPhqKnZzGM
 WCK3IYSgGGeZ4nWRUm3h7MsiRd+wCz7ygUsdhD7Dv6RU7u07Pju3vo+jZV8gJpoKI5
 5VO3OycYEGFkyQJB2iNlmgQBXA7vkyH84W9b4X2Y=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BE5148B895;
 Mon, 13 May 2019 12:00:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nHk28pMR5pLm; Mon, 13 May 2019 12:00:15 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CC82B8B896;
 Mon, 13 May 2019 12:00:14 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 69A5567402; Mon, 13 May 2019 10:00:14 +0000 (UTC)
Message-Id: <7496da89e027e563cb8e62dc89548525cf53b57e.1557741292.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 1/2] powerpc/lib: fix redundant inclusion of quad.o
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 13 May 2019 10:00:14 +0000 (UTC)
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

quad.o is only for PPC64, and already included in obj64-y,
so it doesn't have to be in obj-y

Fixes: 31bfdb036f12 ("powerpc: Use instruction emulation infrastructure to handle alignment faults")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/lib/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index c55f9c27bf79..17fce3738d48 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -49,7 +49,7 @@ obj64-$(CONFIG_KPROBES_SANITY_TEST)	+= test_emulate_step.o \
 obj-y			+= checksum_$(BITS).o checksum_wrappers.o \
 			   string_$(BITS).o
 
-obj-y			+= sstep.o ldstfp.o quad.o
+obj-y			+= sstep.o ldstfp.o
 obj64-y			+= quad.o
 
 obj-$(CONFIG_PPC_LIB_RHEAP) += rheap.o
-- 
2.13.3

