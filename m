Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BC36925C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:51:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PD2s20Y7mz3f58
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 05:51:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h4guq2rV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h4guq2rV;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD2dx1fWQz3f3g
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 05:42:13 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C570A61E8D;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96A1EC433A4;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676054528;
	bh=7sHcklS3JvxNy8+b2cy0PAyfTZ+gELKlvycd7lZAN08=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h4guq2rV44l4uVqvRjMSMQOfsC1h8kNFMGDaaSN+pjZ2B9Fclq3l22ncd7TlO9q/j
	 RpNiPeoM+wa0G0tv5fZmNN4W+NXqAH1Cr9gGVLt8EVHhmiCRAdXKN1Nx4U+sbr5lLF
	 1OMI7n9j4/oI2bOBiMjKvr+01D9qypD3tiFZDP20adlGvvV/rUbbFxsuJIuc6i/3mK
	 nMGfqlxRSZfK1UKUAG5g6uP/reLZ0HgHgQPGswgNi7YPWjb/qjvWJ7qSug8Lm0+hel
	 qgvESrpCd82NiRsxDPodxo406x3AkvzZu7qK7KWRba48MuYNWTVGFOrhCGpNH+HRHO
	 M2HQGlsHBJ4aQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85604C05027;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 10 Feb 2023 12:42:05 -0600
Subject: [PATCH v3 17/20] powerpc/pseries/hv-24x7: convert to papr_sysparm
 API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-b4-powerpc-rtas-queue-v3-17-26929c8cce78@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676054526; l=2846;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=lmBcfoH0lj/2CvQfdz+MmavuamXOYSbQQ5ghGV+grHI=;
 b=AOT/fhTgdkVHkIWKvOZC5Ni5yMFdl1W6U4lgA9sqfSjU4iiW2691zewTZTBqwqsm3EQgtg7qy
 sn+1uW5C/Z0B2hYKvMVRx4BxMl6LAuANBhAF1isqoFVQfUIFzDjj3t+
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

The new papr_sysparm API handles the details of system parameter
retrieval. Use that instead of open-coding the RTAS call, work area
management, and retries.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/perf/hv-24x7.c | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index fcfebf5bd378..f388b984a336 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -18,6 +18,7 @@
 #include <asm/firmware.h>
 #include <asm/hvcall.h>
 #include <asm/io.h>
+#include <asm/papr-sysparm.h>
 #include <linux/byteorder/generic.h>
 
 #include <asm/rtas.h>
@@ -66,8 +67,6 @@ static bool is_physical_domain(unsigned int domain)
  * Refer PAPR+ document to get parameter token value as '43'.
  */
 
-#define PROCESSOR_MODULE_INFO   43
-
 static u32 phys_sockets;	/* Physical sockets */
 static u32 phys_chipspersocket;	/* Physical chips per socket*/
 static u32 phys_coresperchip; /* Physical cores per chip */
@@ -79,8 +78,7 @@ static u32 phys_coresperchip; /* Physical cores per chip */
  */
 void read_24x7_sys_info(void)
 {
-	const s32 token = rtas_token("ibm,get-system-parameter");
-	int call_status;
+	struct papr_sysparm_buf *buf;
 
 	/*
 	 * Making system parameter: chips and sockets and cores per chip
@@ -90,27 +88,22 @@ void read_24x7_sys_info(void)
 	phys_chipspersocket = 1;
 	phys_coresperchip = 1;
 
-	do {
-		spin_lock(&rtas_data_buf_lock);
-		call_status = rtas_call(token, 3, 1, NULL, PROCESSOR_MODULE_INFO,
-					__pa(rtas_data_buf), RTAS_DATA_BUF_SIZE);
-		if (call_status == 0) {
-			int ntypes = be16_to_cpup((__be16 *)&rtas_data_buf[2]);
-			int len = be16_to_cpup((__be16 *)&rtas_data_buf[0]);
+	buf = papr_sysparm_buf_alloc();
+	if (!buf)
+		return;
 
-			if (len >= 8 && ntypes != 0) {
-				phys_sockets = be16_to_cpup((__be16 *)&rtas_data_buf[4]);
-				phys_chipspersocket = be16_to_cpup((__be16 *)&rtas_data_buf[6]);
-				phys_coresperchip = be16_to_cpup((__be16 *)&rtas_data_buf[8]);
-			}
+	if (!papr_sysparm_get(PAPR_SYSPARM_PROC_MODULE_INFO, buf)) {
+		int ntypes = be16_to_cpup((__be16 *)&buf->val[0]);
+		int len = be16_to_cpu(buf->len);
+
+		if (len >= 8 && ntypes != 0) {
+			phys_sockets = be16_to_cpup((__be16 *)&buf->val[2]);
+			phys_chipspersocket = be16_to_cpup((__be16 *)&buf->val[4]);
+			phys_coresperchip = be16_to_cpup((__be16 *)&buf->val[6]);
 		}
-		spin_unlock(&rtas_data_buf_lock);
-	} while (rtas_busy_delay(call_status));
-
-	if (call_status != 0) {
-		pr_err("Error calling get-system-parameter %d\n",
-		       call_status);
 	}
+
+	papr_sysparm_buf_free(buf);
 }
 
 /* Domains for which more than one result element are returned for each event. */

-- 
2.39.1

