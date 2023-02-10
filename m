Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 641F56925D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:55:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PD2x71QzVz3fCv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 05:55:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NypG1bGn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NypG1bGn;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD2dy73DBz3f4W
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 05:42:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 90F3961E9B;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6396EC433EF;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676054528;
	bh=2+/C62Cj5XqTy3lANqwGh0Jri9G4x9c4zdUvAqRA8eE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NypG1bGnac0YAMNA4enTRdwZg1tOjm05sS2maoqCTdzgpDsPxWJXOExXIuelgaVq4
	 JslUPsiSbSem5AI3BO/RDzMa5Y3zta/sDycAOmlZPitR+MBGQRjXZlQP9spoNt33+V
	 IlqrbXzViPOS5O2C/RJ+aWDlLWYzmFEnpylwvqAwBFIyiyB+6uQmhturHI3MBqOU4m
	 kS1pXBQLWA7b/ffR2n/A2ls2Ww+hcxYZxF3912t77QAPjHlm5EUyK22QmIT3GrQUHb
	 74gWpDCsk1YpG3V9Lb0kYFbaItYsS1RyeHD/D+fYtKy6iR/3wmqwQw0C+LgfxgKoyk
	 20/+ungAjD7Jw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C85C64ED8;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 10 Feb 2023 12:42:01 -0600
Subject: [PATCH v3 13/20] powerpc/pseries/dlpar: use RTAS work area API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-b4-powerpc-rtas-queue-v3-13-26929c8cce78@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676054526; l=2354;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=9dtec63TyTAEuoicCzxLzqqe0gY/Ou+fcqwMt3OKZi4=;
 b=YD66kU9Advyx02iLmlCYkkham2OWIeq62hfDLZ/2L0I67RZST86wzXK8HiOCSXou5yNtmvSkw
 KjstpJMqr3wAmvFnTVU5M3NbcOZha7x9FQ9O7cY9h9dlk4L+MOTqqxj
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

Hold a work area object for the duration of the RTAS
ibm,configure-connector sequence, eliminating locking and copying
around each RTAS call.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/dlpar.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 498d6efcb5ae..9b65b50a5456 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -22,6 +22,7 @@
 #include <asm/machdep.h>
 #include <linux/uaccess.h>
 #include <asm/rtas.h>
+#include <asm/rtas-work-area.h>
 
 static struct workqueue_struct *pseries_hp_wq;
 
@@ -137,6 +138,7 @@ struct device_node *dlpar_configure_connector(__be32 drc_index,
 	struct property *property;
 	struct property *last_property = NULL;
 	struct cc_workarea *ccwa;
+	struct rtas_work_area *work_area;
 	char *data_buf;
 	int cc_token;
 	int rc = -1;
@@ -145,29 +147,18 @@ struct device_node *dlpar_configure_connector(__be32 drc_index,
 	if (cc_token == RTAS_UNKNOWN_SERVICE)
 		return NULL;
 
-	data_buf = kzalloc(RTAS_DATA_BUF_SIZE, GFP_KERNEL);
-	if (!data_buf)
-		return NULL;
+	work_area = rtas_work_area_alloc(SZ_4K);
+	data_buf = rtas_work_area_raw_buf(work_area);
 
 	ccwa = (struct cc_workarea *)&data_buf[0];
 	ccwa->drc_index = drc_index;
 	ccwa->zero = 0;
 
 	do {
-		/* Since we release the rtas_data_buf lock between configure
-		 * connector calls we want to re-populate the rtas_data_buffer
-		 * with the contents of the previous call.
-		 */
-		spin_lock(&rtas_data_buf_lock);
-
-		memcpy(rtas_data_buf, data_buf, RTAS_DATA_BUF_SIZE);
-		rc = rtas_call(cc_token, 2, 1, NULL, rtas_data_buf, NULL);
-		memcpy(data_buf, rtas_data_buf, RTAS_DATA_BUF_SIZE);
-
-		spin_unlock(&rtas_data_buf_lock);
-
-		if (rtas_busy_delay(rc))
-			continue;
+		do {
+			rc = rtas_call(cc_token, 2, 1, NULL,
+				       rtas_work_area_phys(work_area), NULL);
+		} while (rtas_busy_delay(rc));
 
 		switch (rc) {
 		case COMPLETE:
@@ -227,7 +218,7 @@ struct device_node *dlpar_configure_connector(__be32 drc_index,
 	} while (rc);
 
 cc_error:
-	kfree(data_buf);
+	rtas_work_area_free(work_area);
 
 	if (rc) {
 		if (first_dn)

-- 
2.39.1

