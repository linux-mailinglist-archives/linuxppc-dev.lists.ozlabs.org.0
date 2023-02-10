Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F00C86925EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:59:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PD32N5c3Bz3fS5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 05:59:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QElS0CRg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QElS0CRg;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD2f435FKz3f5R
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 05:42:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CEB0561E9E;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0D4BC433A1;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676054528;
	bh=1zbdqUpy6BUFEiR9Bo+02sqP9AkuCO90UU3OZwA81eM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QElS0CRgXdY9qEbwWewoqUdBGOtOoxXejYfGw/4Wy6bOGjrd8vFAlL5EZ8j6TrbZF
	 h4TRgRgkMgYsmvglBAFx2b2Uc53DQY0iszEQa+FoOyJLogMl9cQp0fybb5DWWhw3rU
	 J1xaYh2t08uS3sdUNFuO0bbKrj4M1pK2lLXZJFNbW/UEoHv/gtMzRXUSofC/IsUUBu
	 4KiCUzLTFFo6qsBtqziheufY+SvICMy5FzqMGX8HJLMvvfenxRbTwMIj1r+/D1Q3bQ
	 y0WS+n0rfUt0wexotoD7h6HtT9Y4+PaKtS7GW8XNDPnihb3NWYItrbCmBVk4dyEl+V
	 jzK/dj9eyo64w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F29C64ED8;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 10 Feb 2023 12:42:06 -0600
Subject: [PATCH v3 18/20] powerpc/pseries/lpar: convert to papr_sysparm API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-b4-powerpc-rtas-queue-v3-18-26929c8cce78@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676054526; l=3125;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=aaR7aumIxEJSYWOkDTaOL4g2oJrS4KScc2sc8zj694c=;
 b=fOO7qDl0hoxTDfxlP2d7MZ1E/zJL12TlqF+CB2PR9+7BDmewCiM0sbV6EhCQNdYVL2i88lmws
 HneYSNqUEKPA2iSxAmwNl8r/S8ZO9Jloy5Lp+uHWieqOkpIl5GFgCJx
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

Convert the TLB block invalidate characteristics discovery to the new
papr_sysparm API. This occurs too early in boot to use
papr_sysparm_buf_alloc(), so use a static buffer.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 37 +++++++++--------------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 6597b2126ebb..2eab323f6970 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -32,6 +32,7 @@
 #include <asm/iommu.h>
 #include <asm/tlb.h>
 #include <asm/cputable.h>
+#include <asm/papr-sysparm.h>
 #include <asm/udbg.h>
 #include <asm/smp.h>
 #include <asm/trace.h>
@@ -1469,8 +1470,6 @@ static inline void __init check_lp_set_hblkrm(unsigned int lp,
 	}
 }
 
-#define SPLPAR_TLB_BIC_TOKEN		50
-
 /*
  * The size of the TLB Block Invalidate Characteristics is variable. But at the
  * maximum it will be the number of possible page sizes *2 + 10 bytes.
@@ -1481,42 +1480,24 @@ static inline void __init check_lp_set_hblkrm(unsigned int lp,
 
 void __init pseries_lpar_read_hblkrm_characteristics(void)
 {
-	const s32 token = rtas_token("ibm,get-system-parameter");
-	unsigned char local_buffer[SPLPAR_TLB_BIC_MAXLENGTH];
-	int call_status, len, idx, bpsize;
+	static struct papr_sysparm_buf buf __initdata;
+	int len, idx, bpsize;
 
 	if (!firmware_has_feature(FW_FEATURE_BLOCK_REMOVE))
 		return;
 
-	do {
-		spin_lock(&rtas_data_buf_lock);
-		memset(rtas_data_buf, 0, RTAS_DATA_BUF_SIZE);
-		call_status = rtas_call(token, 3, 1, NULL, SPLPAR_TLB_BIC_TOKEN,
-					__pa(rtas_data_buf), RTAS_DATA_BUF_SIZE);
-		memcpy(local_buffer, rtas_data_buf, SPLPAR_TLB_BIC_MAXLENGTH);
-		local_buffer[SPLPAR_TLB_BIC_MAXLENGTH - 1] = '\0';
-		spin_unlock(&rtas_data_buf_lock);
-	} while (rtas_busy_delay(call_status));
-
-	if (call_status != 0) {
-		pr_warn("%s %s Error calling get-system-parameter (0x%x)\n",
-			__FILE__, __func__, call_status);
+	if (papr_sysparm_get(PAPR_SYSPARM_TLB_BLOCK_INVALIDATE_ATTRS, &buf))
 		return;
-	}
 
-	/*
-	 * The first two (2) bytes of the data in the buffer are the length of
-	 * the returned data, not counting these first two (2) bytes.
-	 */
-	len = be16_to_cpu(*((u16 *)local_buffer)) + 2;
+	len = be16_to_cpu(buf.len);
 	if (len > SPLPAR_TLB_BIC_MAXLENGTH) {
 		pr_warn("%s too large returned buffer %d", __func__, len);
 		return;
 	}
 
-	idx = 2;
+	idx = 0;
 	while (idx < len) {
-		u8 block_shift = local_buffer[idx++];
+		u8 block_shift = buf.val[idx++];
 		u32 block_size;
 		unsigned int npsize;
 
@@ -1525,9 +1506,9 @@ void __init pseries_lpar_read_hblkrm_characteristics(void)
 
 		block_size = 1 << block_shift;
 
-		for (npsize = local_buffer[idx++];
+		for (npsize = buf.val[idx++];
 		     npsize > 0 && idx < len; npsize--)
-			check_lp_set_hblkrm((unsigned int) local_buffer[idx++],
+			check_lp_set_hblkrm((unsigned int)buf.val[idx++],
 					    block_size);
 	}
 

-- 
2.39.1

