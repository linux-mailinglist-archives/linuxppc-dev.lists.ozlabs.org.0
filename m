Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD085692590
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:43:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PD2gr4kMpz3f66
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 05:43:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pUkrua1h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pUkrua1h;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD2dt2H7fz3cF7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 05:42:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1B00C61E61;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DEF0CC4339B;
	Fri, 10 Feb 2023 18:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676054527;
	bh=r1eQqhKZSl4UUD5ZJMWVS9r6akstVTuHLGgXYRuh0yE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pUkrua1hsjegwyyPqp8h8FtYlTcNMaFLdKj8XLKcVvfWxYY9js0kLOnUlZLuzvq4t
	 NgeWr2gWZV53RKt6781m0HGYWxY0s+xOlMZyzwKM8Nhuo1dFM7CoLMPsNgQkUybAyx
	 1F1YyIjIHFpCS4SHMHfkg1IK7YZgAFYtFRyIV7IWwTMx9urdFL8WohfzGYVe9acPtz
	 x+MLxTm0kW7Nvjvc9qWelSb0Thi+sUgClNGGBOnGiFGZwu0FaUdFLbq2IvACsLhwdX
	 AX3w75//dl+xjqaFQiCgJz0xrLKPdrPCjqJ5UChxf67Bam1d991UUXW7I4o8ojG7Jz
	 2eWqwkVPH6lQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBF4C636CD;
	Fri, 10 Feb 2023 18:42:07 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 10 Feb 2023 12:41:52 -0600
Subject: [PATCH v3 04/20] powerpc/pseries/lparcfg: add missing RTAS retry
 status handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-b4-powerpc-rtas-queue-v3-4-26929c8cce78@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676054526; l=2058;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=1ITl3Z2O0SNdDjf1w6RDljex3C6yBpzEURic1f6Fwjc=;
 b=4ygV2SW1lToOv2Zk1Tc1vrBFtsnw0Hq/lVU1E58R8o26S+uH+zSM5E9vIWrEVWe8hv2z8uMQM
 YakJUv3HJyXB8RULa+ewemrvOOiXRdt+GnkojsqHgI2Z8jrN3D9SrY0
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

lparcfg's parse_system_parameter_string() ignores this, making it
possible to intermittently report incorrect SPLPAR characteristics.

Move the RTAS call into a coventional rtas_busy_delay()-based loop.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
---
 arch/powerpc/platforms/pseries/lparcfg.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index 63fd925ccbb8..cd33d5800763 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -408,6 +408,7 @@ static void read_lpar_name(struct seq_file *m)
  */
 static void parse_system_parameter_string(struct seq_file *m)
 {
+	const s32 token = rtas_token("ibm,get-system-parameter");
 	int call_status;
 
 	unsigned char *local_buffer = kmalloc(SPLPAR_MAXLENGTH, GFP_KERNEL);
@@ -417,16 +418,15 @@ static void parse_system_parameter_string(struct seq_file *m)
 		return;
 	}
 
-	spin_lock(&rtas_data_buf_lock);
-	memset(rtas_data_buf, 0, SPLPAR_MAXLENGTH);
-	call_status = rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
-				NULL,
-				SPLPAR_CHARACTERISTICS_TOKEN,
-				__pa(rtas_data_buf),
-				RTAS_DATA_BUF_SIZE);
-	memcpy(local_buffer, rtas_data_buf, SPLPAR_MAXLENGTH);
-	local_buffer[SPLPAR_MAXLENGTH - 1] = '\0';
-	spin_unlock(&rtas_data_buf_lock);
+	do {
+		spin_lock(&rtas_data_buf_lock);
+		memset(rtas_data_buf, 0, SPLPAR_MAXLENGTH);
+		call_status = rtas_call(token, 3, 1, NULL, SPLPAR_CHARACTERISTICS_TOKEN,
+					__pa(rtas_data_buf), RTAS_DATA_BUF_SIZE);
+		memcpy(local_buffer, rtas_data_buf, SPLPAR_MAXLENGTH);
+		local_buffer[SPLPAR_MAXLENGTH - 1] = '\0';
+		spin_unlock(&rtas_data_buf_lock);
+	} while (rtas_busy_delay(call_status));
 
 	if (call_status != 0) {
 		printk(KERN_INFO

-- 
2.39.1

