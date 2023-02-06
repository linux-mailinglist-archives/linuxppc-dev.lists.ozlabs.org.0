Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9FC68C669
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 20:06:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9bN23wq1z3f86
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 06:06:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aJ6QIlv2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aJ6QIlv2;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9b600Qpkz3bTS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 05:54:32 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 66A6360FF6;
	Mon,  6 Feb 2023 18:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAD2EC433B0;
	Mon,  6 Feb 2023 18:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675709665;
	bh=kluKoIczw34WtunaYaUtA36347KUQvDDKVv6qDA/vuU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aJ6QIlv2OcVz8Prt8nYZyZycm3u+6jyCUMV9+rPa3GgDpF+coQJPqf1rCvdx4A/Bq
	 V9V3fSIBWdk/XqcN3JFuQv0cHfwYyY+Nj6yKyNlZufNmSqxr2CYqPDoUklMyD6kk/e
	 4ULuLMOGMhp6h7i9rCElVpAR8xf2hI9KT3ZBIP3TJdanditRvhQcg1HYtv77oCapln
	 JfPIDAluu9hfywVKCIil2GWKeR+of/GDABbsT9we5JbRPYxiIz/uUsoTnz8ZSgMTeQ
	 w52g30AbZq9Xpb7Nhcwhbms1DXtSweZWMlUTK+26F6FURN630/dgoHk5KW9QOMUanM
	 GwEfdD8OC1vVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA900C636D3;
	Mon,  6 Feb 2023 18:54:25 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Feb 2023 12:54:30 -0600
Subject: [PATCH v2 14/19] powerpc/pseries: convert CMO probe to
 papr_sysparm API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-b4-powerpc-rtas-queue-v2-14-9aa6bd058063@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675709663; l=2134;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=wgP5ZTThR3IKKt3zP//ktPHmiyHjfPLomTgdKwAbQNo=;
 b=10X5+/bu59ydOVlRz84QvTlOQTdP/Af+KYekNiR+pmfiFunrH3qtGr5QafteST2n1boJwR+jy
 BOk1GdLfMQcBWQwZYAdU9qcc3trF0z4iI05lpF++ptrKdN2d8op82Xb
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=6daubz/ymoaMF+8voz7UHwnhluEsmDZuqygIIMWpQQY=
X-Endpoint-Received:  by B4 Submission Endpoint for nathanl@linux.ibm.com/20230206 with auth_id=27
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Convert the direct invocation of the ibm,get-system-parameter RTAS
function to papr_sysparm_get().

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/setup.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 74e50b6b28d4..420a2fa48292 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -57,6 +57,7 @@
 #include <asm/pmc.h>
 #include <asm/xics.h>
 #include <asm/xive.h>
+#include <asm/papr-sysparm.h>
 #include <asm/ppc-pci.h>
 #include <asm/i8259.h>
 #include <asm/udbg.h>
@@ -941,32 +942,21 @@ void pSeries_coalesce_init(void)
  */
 static void __init pSeries_cmo_feature_init(void)
 {
-	const s32 token = rtas_token("ibm,get-system-parameter");
+	static struct papr_sysparm_buf buf __initdata;
+	static_assert(sizeof(buf.val) >= CMO_MAXLENGTH);
 	char *ptr, *key, *value, *end;
-	int call_status;
 	int page_order = IOMMU_PAGE_SHIFT_4K;
 
 	pr_debug(" -> fw_cmo_feature_init()\n");
 
-	do {
-		spin_lock(&rtas_data_buf_lock);
-		call_status = rtas_call(token, 3, 1, NULL,
-					CMO_CHARACTERISTICS_TOKEN,
-					__pa(rtas_data_buf),
-					RTAS_DATA_BUF_SIZE);
-		if (call_status == 0)
-			break;
-		spin_unlock(&rtas_data_buf_lock);
-	} while (rtas_busy_delay(call_status));
-
-	if (call_status != 0) {
+	if (papr_sysparm_get(PAPR_SYSPARM_COOP_MEM_OVERCOMMIT_ATTRS, &buf)) {
 		pr_debug("CMO not available\n");
 		pr_debug(" <- fw_cmo_feature_init()\n");
 		return;
 	}
 
-	end = rtas_data_buf + CMO_MAXLENGTH - 2;
-	ptr = rtas_data_buf + 2;	/* step over strlen value */
+	end = &buf.val[CMO_MAXLENGTH];
+	ptr = &buf.val[0];
 	key = value = ptr;
 
 	while (*ptr && (ptr <= end)) {
@@ -1012,7 +1002,6 @@ static void __init pSeries_cmo_feature_init(void)
 	} else
 		pr_debug("CMO not enabled, PrPSP=%d, SecPSP=%d\n", CMO_PrPSP,
 		         CMO_SecPSP);
-	spin_unlock(&rtas_data_buf_lock);
 	pr_debug(" <- fw_cmo_feature_init()\n");
 }
 

-- 
2.39.1

