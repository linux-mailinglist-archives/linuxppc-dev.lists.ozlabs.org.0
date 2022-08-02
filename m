Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 736A5587AC1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 12:31:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxrrL2yNzz3c7D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 20:31:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lxrqs40Jxz2xJX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 20:31:02 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Lxrqk6BQ2z9sj9;
	Tue,  2 Aug 2022 12:30:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UkjpvLsEMlqe; Tue,  2 Aug 2022 12:30:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Lxrqk5TZRz9sj8;
	Tue,  2 Aug 2022 12:30:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AC53A8B774;
	Tue,  2 Aug 2022 12:30:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id hS7Kwt6VBiCs; Tue,  2 Aug 2022 12:30:58 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.234.100])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7F5E88B76D;
	Tue,  2 Aug 2022 12:30:58 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 272AUn2L2286835
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 2 Aug 2022 12:30:49 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 272AUlTO2286788;
	Tue, 2 Aug 2022 12:30:47 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: linux-edac@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] EDAC/ppc_4xx: Include required of_irq header directly
Date: Tue,  2 Aug 2022 12:30:38 +0200
Message-Id: <993f5a7da371458cb819b5f3f569073c78523b01.1659436180.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1659436218; l=905; s=20211009; h=from:subject:message-id; bh=cKpEoB+cofUpoNAq/M/B3Dp8umJsSlsnWcCGFfflJZk=; b=maWXA7spO7ssoHS3X+jZ3jVuxKdR9ZNtix08JrXhYGlvQIxvLuwO9XyN8ZbBwxxTIdKZuMY2fjR8 b/CRzA8VCYUFqrw3lSwjdmp+Sl+YZp78oX/fgNYDRKcsM4QBYEf2
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 4d5c5bad5193 ("powerpc: Remove asm/prom.h from asm/mpc52xx.h
and asm/pci.h") that cleans up powerpc's asm/prom.h leads to build
errors in ppc4xx_edac.c due to missing header. Include required
header directly to avoid the build failure.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 4d5c5bad5193 ("powerpc: Remove asm/prom.h from asm/mpc52xx.h and asm/pci.h")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/edac/ppc4xx_edac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/edac/ppc4xx_edac.c b/drivers/edac/ppc4xx_edac.c
index 6793f6d799e7..0bc670778c99 100644
--- a/drivers/edac/ppc4xx_edac.c
+++ b/drivers/edac/ppc4xx_edac.c
@@ -11,6 +11,7 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/types.h>
 
-- 
2.36.1

