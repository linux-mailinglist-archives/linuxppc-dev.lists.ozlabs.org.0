Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BFE35152C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 15:31:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB3wv63scz3c0P
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 00:31:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB3wT5DTBz30GD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 00:30:47 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FB3wM1j4Dz9twjW;
 Thu,  1 Apr 2021 15:30:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id orJzLC6qpMu6; Thu,  1 Apr 2021 15:30:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FB3wL6NvHz9twjT;
 Thu,  1 Apr 2021 15:30:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E035D8B99D;
 Thu,  1 Apr 2021 15:30:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id iVfC5c5VWB6i; Thu,  1 Apr 2021 15:30:42 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 929A38B991;
 Thu,  1 Apr 2021 15:30:42 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6F70A67646; Thu,  1 Apr 2021 13:30:42 +0000 (UTC)
Message-Id: <a225606d5b3a8bc53fe612ad52c855c60b0a0a58.1617283827.git.christophe.leroy@csgroup.eu>
In-Reply-To: <0c3d5cb8a4dfdf6ca1b8aeb385c01470d6628d55.1617283827.git.christophe.leroy@csgroup.eu>
References: <0c3d5cb8a4dfdf6ca1b8aeb385c01470d6628d55.1617283827.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/3] powerpc/8xx: Define a MODULE area below kernel text
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 jniethe5@gmail.com
Date: Thu,  1 Apr 2021 13:30:42 +0000 (UTC)
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

On the 8xx, TASK_SIZE is 0x80000000. The space between TASK_SIZE
and PAGE_OFFSET is not used.

In order to benefit from the powerpc specific module_alloc()
function which allocate modules with 32 Mbytes from
end of kernel text, define MODULES_VADDR and MODULES_END.

Set a 256Mb area just below PAGE_OFFSET, like book3s/32.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
index 478249959baa..6e4faa0a9b35 100644
--- a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
@@ -172,6 +172,9 @@
 
 #define mmu_linear_psize	MMU_PAGE_8M
 
+#define MODULES_VADDR	(PAGE_OFFSET - SZ_256M)
+#define MODULES_END	PAGE_OFFSET
+
 #ifndef __ASSEMBLY__
 
 #include <linux/mmdebug.h>
-- 
2.25.0

