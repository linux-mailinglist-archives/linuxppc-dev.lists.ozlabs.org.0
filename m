Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0A02E1A9A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 10:43:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D17Yh1wlczDqWF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 20:43:20 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D17Sc6HZCzDqS6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 20:38:53 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4D17SR5lPbz9v1yW;
 Wed, 23 Dec 2020 10:38:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OC_puzyC6wkF; Wed, 23 Dec 2020 10:38:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4D17SR4yK4z9v1yS;
 Wed, 23 Dec 2020 10:38:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CBFCB8B81D;
 Wed, 23 Dec 2020 10:38:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9vIGHNpHhzSF; Wed, 23 Dec 2020 10:38:48 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 89C468B75F;
 Wed, 23 Dec 2020 10:38:48 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 654A26696F; Wed, 23 Dec 2020 09:38:48 +0000 (UTC)
Message-Id: <b0607f1113d1558e73476bb06db0ee16d31a6e5b.1608716197.git.christophe.leroy@csgroup.eu>
In-Reply-To: <e4471bf81089252470efb3eed735d71a5b32adbd.1608716197.git.christophe.leroy@csgroup.eu>
References: <e4471bf81089252470efb3eed735d71a5b32adbd.1608716197.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/xmon: Enable breakpoints on 8xx
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 23 Dec 2020 09:38:48 +0000 (UTC)
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

Since commit 4ad8622dc548 ("powerpc/8xx: Implement hw_breakpoint"),
8xx has breakpoints so there is no reason to opt breakpoint logic
out of xmon for the 8xx.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Fixes: 4ad8622dc548 ("powerpc/8xx: Implement hw_breakpoint")
---
 arch/powerpc/xmon/xmon.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index dcd817ca2edf..cec432eb9189 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1383,7 +1383,6 @@ static long check_bp_loc(unsigned long addr)
 	return 1;
 }
 
-#ifndef CONFIG_PPC_8xx
 static int find_free_data_bpt(void)
 {
 	int i;
@@ -1395,7 +1394,6 @@ static int find_free_data_bpt(void)
 	printf("Couldn't find free breakpoint register\n");
 	return -1;
 }
-#endif
 
 static void print_data_bpts(void)
 {
@@ -1435,7 +1433,6 @@ bpt_cmds(void)
 	cmd = inchar();
 
 	switch (cmd) {
-#ifndef CONFIG_PPC_8xx
 	static const char badaddr[] = "Only kernel addresses are permitted for breakpoints\n";
 	int mode;
 	case 'd':	/* bd - hardware data breakpoint */
@@ -1497,7 +1494,6 @@ bpt_cmds(void)
 			force_enable_xmon();
 		}
 		break;
-#endif
 
 	case 'c':
 		if (!scanhex(&a)) {
-- 
2.25.0

