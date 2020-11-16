Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 286D72B49FE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 16:55:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZYZ81PMczDqLt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 02:55:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZYWj6dc1zDqJS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 02:53:19 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CZYWV3dJPz9vDFd;
 Mon, 16 Nov 2020 16:53:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sGzDoelWa-y4; Mon, 16 Nov 2020 16:53:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CZYWV2dLgz9vDFc;
 Mon, 16 Nov 2020 16:53:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C49868B7A3;
 Mon, 16 Nov 2020 16:53:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id bAOojbTm9FSk; Mon, 16 Nov 2020 16:53:15 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 17D318B7AC;
 Mon, 16 Nov 2020 16:53:15 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B694366885; Mon, 16 Nov 2020 15:53:14 +0000 (UTC)
Message-Id: <b89b269642bdae953c2b6eeba7ffe17c09caeb6d.1605541983.git.christophe.leroy@csgroup.eu>
In-Reply-To: <40ae19c2bf013e3815a6ae0d6016963fdb0f51b7.1605541983.git.christophe.leroy@csgroup.eu>
References: <40ae19c2bf013e3815a6ae0d6016963fdb0f51b7.1605541983.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 2/5] powerpc/fault: Unnest definition of
 page_fault_is_write() and page_fault_is_bad()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 16 Nov 2020 15:53:14 +0000 (UTC)
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

To make it more readable, separate page_fault_is_write() and page_fault_is_bad()
to avoir several levels of #ifdefs

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/fault.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 72e1b51beb10..17665ff97469 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -363,17 +363,19 @@ static void sanity_check_fault(bool is_write, bool is_user,
  */
 #if (defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
 #define page_fault_is_write(__err)	((__err) & ESR_DST)
-#define page_fault_is_bad(__err)	(0)
 #else
 #define page_fault_is_write(__err)	((__err) & DSISR_ISSTORE)
-#if defined(CONFIG_PPC_8xx)
+#endif
+
+#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
+#define page_fault_is_bad(__err)	(0)
+#elif defined(CONFIG_PPC_8xx)
 #define page_fault_is_bad(__err)	((__err) & DSISR_NOEXEC_OR_G)
 #elif defined(CONFIG_PPC64)
 #define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_64S)
 #else
 #define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_32S)
 #endif
-#endif
 
 /*
  * For 600- and 800-family processors, the error_code parameter is DSISR
-- 
2.25.0

