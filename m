Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E45263FFBDA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 10:25:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H19p269bvz3c7F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 18:24:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H19mq5NYdz2yxv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 18:23:55 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H19mm5Rvzz9sT9;
 Fri,  3 Sep 2021 10:23:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZBvMU4xRnA_L; Fri,  3 Sep 2021 10:23:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H19mm4Vpxz9sSn;
 Fri,  3 Sep 2021 10:23:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FF878B764;
 Fri,  3 Sep 2021 10:23:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id csxmlrTjs1x2; Fri,  3 Sep 2021 10:23:52 +0200 (CEST)
Received: from po18078vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 495848B8CD;
 Fri,  3 Sep 2021 10:23:52 +0200 (CEST)
Received: by po18078vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 137916BCC3; Fri,  3 Sep 2021 08:23:52 +0000 (UTC)
Message-Id: <b2e52934e5a500f149e6d94db3cfa0569bc35081.1630657402.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/powermac: Remove stale declaration of pmac_md
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri,  3 Sep 2021 08:23:52 +0000 (UTC)
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

pmac_md doesn't exist anymore, remove stall declaration.

Fixes: e8222502ee61 ("[PATCH] powerpc: Kill _machine and hard-coded platform numbers")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/powermac/setup.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index 86aee3f2483f..13e8a8a9841c 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -79,8 +79,6 @@ int pmac_newworld;
 
 static int current_root_goodness = -1;
 
-extern struct machdep_calls pmac_md;
-
 #define DEFAULT_ROOT_DEVICE Root_SDA1	/* sda1 - slightly silly choice */
 
 #ifdef CONFIG_PPC64
-- 
2.25.0

