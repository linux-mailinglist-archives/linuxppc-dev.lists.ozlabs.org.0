Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6568A417639
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 15:50:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HGD1c1rYqz3cCC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 23:50:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HGD0l3xtKz2xXd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 23:49:27 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HGD0Y47q2z9sVq;
 Fri, 24 Sep 2021 15:49:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id krbLmx9VvChi; Fri, 24 Sep 2021 15:49:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HGD0X4wkCz9sVr;
 Fri, 24 Sep 2021 15:49:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9058C8B763;
 Fri, 24 Sep 2021 15:49:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5fsNzTpJz1Rp; Fri, 24 Sep 2021 15:49:16 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.215])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4DC6A8B77E;
 Fri, 24 Sep 2021 15:49:16 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 18ODn5oF1293060
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 15:49:05 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 18ODn5sM1293059;
 Fri, 24 Sep 2021 15:49:05 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>, arnd@arndb.de
Subject: [PATCH 2/3] powerpc: Use generic version of
 arch_is_kernel_initmem_freed()
Date: Fri, 24 Sep 2021 15:48:46 +0200
Message-Id: <50c7401490926f8e9301a21bc04a640401a85372.1632491308.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <0b55650058a5bf64f7d74781871a1ada2298c8b4.1632491308.git.christophe.leroy@csgroup.eu>
References: <0b55650058a5bf64f7d74781871a1ada2298c8b4.1632491308.git.christophe.leroy@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Generic version of arch_is_kernel_initmem_freed() now does the same
as powerpc version.

Remove the powerpc version.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/sections.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index 6e4af4492a14..79cb7a25a5fb 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -6,21 +6,8 @@
 #include <linux/elf.h>
 #include <linux/uaccess.h>
 
-#define arch_is_kernel_initmem_freed arch_is_kernel_initmem_freed
-
 #include <asm-generic/sections.h>
 
-extern bool init_mem_is_free;
-
-static inline int arch_is_kernel_initmem_freed(unsigned long addr)
-{
-	if (!init_mem_is_free)
-		return 0;
-
-	return addr >= (unsigned long)__init_begin &&
-		addr < (unsigned long)__init_end;
-}
-
 extern char __head_end[];
 
 #ifdef __powerpc64__
-- 
2.31.1

