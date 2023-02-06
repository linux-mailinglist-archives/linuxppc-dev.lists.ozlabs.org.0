Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 312D968C657
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 20:00:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9bDy0Xnkz3cdW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 06:00:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eXG6OtfQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eXG6OtfQ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9b5y0JPcz3cMR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 05:54:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1BC7360FD9;
	Mon,  6 Feb 2023 18:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50F01C433A0;
	Mon,  6 Feb 2023 18:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675709665;
	bh=ycQ96BzackDTRZGmQb8J0lyOcRX5Paqyv5Jdo4fdg24=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eXG6OtfQZJl/gYHg4olMZJcvPPPxDnCBR9WIMUS/uIO0OAvCybPofNcR7dpsyRrqg
	 cN1t4W72yjDAB9EytlNTjMWT0OicrqX0nVe51nOIHPrQsk9pj/ZwKxMVU62qVfc4iX
	 fbbpR7GZPRjKpDiv4BtHnCKIoJelK4FoavJv0AhMraKI1568t/3X8O2z/9UmR2eGmD
	 SPLwa5MS9/xnslAaMd/PqfWhgDf8bUsnrm0JRvLsZIHVZaxrd0vihJaLnkibK09hgi
	 dxYLR1joiSFCibI5V5bMuWcdfnGPOfRJnBLZXV2eJbVrPCSe14lXqi92aG1XBHmKqY
	 xOh8Dbw4c2/6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC14C6379F;
	Mon,  6 Feb 2023 18:54:25 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Feb 2023 12:54:21 -0600
Subject: [PATCH v2 05/19] powerpc/pseries/setup: add missing RTAS retry
 status handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-b4-powerpc-rtas-queue-v2-5-9aa6bd058063@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675709663; l=1829;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=aH9kPV3aFPMqcCE52OuDxtWD73a59nhFm3joQpSLnP0=;
 b=4xJnuF+DRuHTPnwNSeX13rmXo2I4fZMm32MIiqANcRo948gDLxKAaTVvPklLGd0CRztxhyIpc
 gIqq73IpYOhCgP7k+4lg7gEqXU/zu/rx3c0ntlNunyPyem6ODNaYXRL
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

The ibm,get-system-parameter RTAS function may return -2 or 990x,
which indicate that the caller should try again.

pSeries_cmo_feature_init() ignores this, making it possible to fail to
detect cooperative memory overcommit capabilities during boot.

Move the RTAS call into a conventional rtas_busy_delay()-based
loop, dropping unnecessary clearing of rtas_data_buf.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/setup.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 8ef3270515a9..74e50b6b28d4 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -941,21 +941,25 @@ void pSeries_coalesce_init(void)
  */
 static void __init pSeries_cmo_feature_init(void)
 {
+	const s32 token = rtas_token("ibm,get-system-parameter");
 	char *ptr, *key, *value, *end;
 	int call_status;
 	int page_order = IOMMU_PAGE_SHIFT_4K;
 
 	pr_debug(" -> fw_cmo_feature_init()\n");
-	spin_lock(&rtas_data_buf_lock);
-	memset(rtas_data_buf, 0, RTAS_DATA_BUF_SIZE);
-	call_status = rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
-				NULL,
-				CMO_CHARACTERISTICS_TOKEN,
-				__pa(rtas_data_buf),
-				RTAS_DATA_BUF_SIZE);
 
-	if (call_status != 0) {
+	do {
+		spin_lock(&rtas_data_buf_lock);
+		call_status = rtas_call(token, 3, 1, NULL,
+					CMO_CHARACTERISTICS_TOKEN,
+					__pa(rtas_data_buf),
+					RTAS_DATA_BUF_SIZE);
+		if (call_status == 0)
+			break;
 		spin_unlock(&rtas_data_buf_lock);
+	} while (rtas_busy_delay(call_status));
+
+	if (call_status != 0) {
 		pr_debug("CMO not available\n");
 		pr_debug(" <- fw_cmo_feature_init()\n");
 		return;

-- 
2.39.1

