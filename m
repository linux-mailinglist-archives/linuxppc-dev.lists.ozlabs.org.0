Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB1D199B35
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 18:18:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sDyv5jxpzDqvp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 03:18:31 +1100 (AEDT)
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
 header.s=mail header.b=wHDzmtI3; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sDdq6lTszDqbk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 03:03:43 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48sDdl1NYYz9twdZ;
 Tue, 31 Mar 2020 18:03:39 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=wHDzmtI3; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RUXVmZQCXCTh; Tue, 31 Mar 2020 18:03:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48sDdl0MQbz9twdT;
 Tue, 31 Mar 2020 18:03:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585670619; bh=6dnGmEP9kaYDu3frjLwq4tVxGR7ljMwwBq0u7Py+ixo=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=wHDzmtI3V9cWHr3qGCm13i2VIkk8rPqqIdSzI4Lk2Gwqr+2ewxYhwIXQgpFTAO9Ue
 E9tb1oI+RAypim8lEbsIQMPfwQgKIXmVbekJrQ833H5EiosPy45ZQEvQgOcUfa0LSr
 xH6W1ranwAOD+QrKNapFZfg0RNJFggXEA8y8S57A=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AC9D18B868;
 Tue, 31 Mar 2020 18:03:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cwxwwFWIHa4z; Tue, 31 Mar 2020 18:03:40 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6FFC38B752;
 Tue, 31 Mar 2020 18:03:40 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 60447656AC; Tue, 31 Mar 2020 16:03:40 +0000 (UTC)
Message-Id: <eaab3bff961c3bfe149f1d0bd3593291ef939dcc.1585670437.git.christophe.leroy@c-s.fr>
In-Reply-To: <1ae02b6637b87fc5aaa1d5012c3e2cb30e62b4a3.1585670437.git.christophe.leroy@c-s.fr>
References: <1ae02b6637b87fc5aaa1d5012c3e2cb30e62b4a3.1585670437.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 05/12] powerpc/mem: Blacklist flush_dcache_icache_phys()
 for kprobe
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com
Date: Tue, 31 Mar 2020 16:03:40 +0000 (UTC)
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

kprobe does not handle events happening in real mode, all
functions running with MMU disabled have to be blacklisted.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/mm/mem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 9b4f5fb719e0..bcb6af6ba29a 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -32,6 +32,7 @@
 #include <linux/vmalloc.h>
 #include <linux/memremap.h>
 #include <linux/dma-direct.h>
+#include <linux/kprobes.h>
 
 #include <asm/pgalloc.h>
 #include <asm/prom.h>
@@ -466,6 +467,7 @@ static void flush_dcache_icache_phys(unsigned long physaddr)
 		: "r" (nb), "r" (msr), "i" (bytes), "r" (msr0)
 		: "ctr", "memory");
 }
+NOKPROBE_SYMBOL(flush_dcache_icache_phys)
 #endif // !defined(CONFIG_PPC_8xx) && !defined(CONFIG_PPC64)
 
 /*
-- 
2.25.0

