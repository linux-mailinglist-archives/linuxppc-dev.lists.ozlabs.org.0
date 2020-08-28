Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8997C255430
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 08:04:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bd8Dd3TCSzDqLS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 16:04:01 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bd86h339dzDqf5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 15:58:52 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bd86b6sG7z9v46T;
 Fri, 28 Aug 2020 07:58:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id N2zTwtrXUBOf; Fri, 28 Aug 2020 07:58:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bd86b60XYz9v1yg;
 Fri, 28 Aug 2020 07:58:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9ECA48B783;
 Fri, 28 Aug 2020 07:58:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LKWOeX7HJ7le; Fri, 28 Aug 2020 07:58:48 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7B8548B769;
 Fri, 28 Aug 2020 07:58:48 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7600A65D47; Fri, 28 Aug 2020 05:58:48 +0000 (UTC)
Message-Id: <c93f4cfaf56fd8fbb6fb1b8c4befd6699de604cd.1598594308.git.christophe.leroy@csgroup.eu>
In-Reply-To: <0f65bb24a2519e5e6c33089016cb249a7c1b1e35.1598594308.git.christophe.leroy@csgroup.eu>
References: <0f65bb24a2519e5e6c33089016cb249a7c1b1e35.1598594308.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 3/5] powerpc/vdso: Initialise vdso32_kbase at compile time
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 28 Aug 2020 05:58:48 +0000 (UTC)
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

Initialise vdso32_kbase at compile time like vdso64_kbase.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vdso.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 8f245e988a8a..fb393266b9cb 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -37,13 +37,12 @@
 /* The alignment of the vDSO */
 #define VDSO_ALIGNMENT	(1 << 16)
 
+extern char vdso32_start, vdso32_end;
 static unsigned int vdso32_pages;
-static void *vdso32_kbase;
+static void *vdso32_kbase = &vdso32_start;
 unsigned long vdso32_sigtramp;
 unsigned long vdso32_rt_sigtramp;
 
-extern char vdso32_start, vdso32_end;
-
 extern char vdso64_start, vdso64_end;
 static void *vdso64_kbase = &vdso64_start;
 static unsigned int vdso64_pages;
@@ -689,8 +688,6 @@ static int __init vdso_init(void)
 	 */
 	vdso64_pages = (&vdso64_end - &vdso64_start) >> PAGE_SHIFT;
 
-	vdso32_kbase = &vdso32_start;
-
 	/*
 	 * Calculate the size of the 32 bits vDSO
 	 */
-- 
2.25.0

