Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 530BE7E25FF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 14:47:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hFx6bebY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPCMm1rcyz3dFB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 00:47:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hFx6bebY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPCHD5f41z3by8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 00:43:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CF8D6CE0B7B;
	Mon,  6 Nov 2023 13:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4E1DC433CD;
	Mon,  6 Nov 2023 13:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699278209;
	bh=KApmDUJluDTKF8zdjFTn4X7liOUZgH0TeJ7n7lmcaNU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hFx6bebY4nmpDpHJMreF/jaUSV+nkzTFyWPIpk944J/VRj2CrMzOr3zUNY9bIbCGU
	 YCZ7t+OKW9QPLNfsl7NyKg8tlXuwtGw84LRQxE12QSrc6t+zu2WvrMhrgc8tlSVAvH
	 s1oHA3yNk7OKWrV2DEFy3wZsMtl5YRhTEywnOaQ2tMqs4laYYpPQ+tWSU/rEoRVB73
	 E6DACbrJ+2APZ9OJ8mgcfQnnm2YQ1aybU23oB8P1nNk5/uxYiFU965iMG5pFEiQP+b
	 MjTjaygrbKp9Gh7ALxEjW34Nw0Lx40QDx7bu63S1ASUiPsI6nfWmAzJo1rBNXkNrSf
	 WyonQwwT13srA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54CCC41535;
	Mon,  6 Nov 2023 13:43:29 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Nov 2023 07:42:58 -0600
Subject: [PATCH 6/7] powerpc/rtas: Remove trailing space
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231106-rtas-trivial-v1-6-61847655c51f@linux.ibm.com>
References: <20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com>
In-Reply-To: <20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699278208; l=3543;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=mCITXmD+N9HQngnQowzT5n4gL5xQdpCJhgKeeEHHVks=;
 b=W1wYzR4ZGaBW5VY/IVzrj0J5Q8KYgySIhd2rYJvfNfC8buILM7xGddr8ZAjKrN/Rv8jYSA8jV
 ycHv+LE0hEjBXNqOSvUnBjoGxEGHRNL+q5vSC1s8iY25CbA9Eljnxsb
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
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

Use scripts/cleanfile to remove instances of trailing space in the
core RTAS code and header.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h |  6 +++---
 arch/powerpc/kernel/rtas.c      | 18 +++++++++---------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 2365668fc13e..1bed6be8ada3 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -268,7 +268,7 @@ typedef struct {
 #define RTAS_TYPE_DEALLOC		0xE3
 #define RTAS_TYPE_DUMP			0xE4
 #define RTAS_TYPE_HOTPLUG		0xE5
-/* I don't add PowerMGM events right now, this is a different topic */ 
+/* I don't add PowerMGM events right now, this is a different topic */
 #define RTAS_TYPE_PMGM_POWER_SW_ON	0x60
 #define RTAS_TYPE_PMGM_POWER_SW_OFF	0x61
 #define RTAS_TYPE_PMGM_LID_OPEN		0x62
@@ -461,7 +461,7 @@ static inline void rtas_cancel_event_scan(void) { }
 
 /* Error types logged.  */
 #define ERR_FLAG_ALREADY_LOGGED	0x0
-#define ERR_FLAG_BOOT		0x1 	/* log was pulled from NVRAM on boot */
+#define ERR_FLAG_BOOT		0x1	/* log was pulled from NVRAM on boot */
 #define ERR_TYPE_RTAS_LOG	0x2	/* from rtas event-scan */
 #define ERR_TYPE_KERNEL_PANIC	0x4	/* from die()/panic() */
 #define ERR_TYPE_KERNEL_PANIC_GZ 0x8	/* ditto, compressed */
@@ -471,7 +471,7 @@ static inline void rtas_cancel_event_scan(void) { }
 	(ERR_TYPE_RTAS_LOG | ERR_TYPE_KERNEL_PANIC | ERR_TYPE_KERNEL_PANIC_GZ)
 
 #define RTAS_DEBUG KERN_DEBUG "RTAS: "
- 
+
 #define RTAS_ERROR_LOG_MAX 2048
 
 /*
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index b5b340a91157..c49f078382a9 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -670,7 +670,7 @@ static void call_rtas_display_status_delay(char c)
 	static int pending_newline = 0;  /* did last write end with unprinted newline? */
 	static int width = 16;
 
-	if (c == '\n') {	
+	if (c == '\n') {
 		while (width-- > 0)
 			call_rtas_display_status(' ');
 		width = 16;
@@ -680,7 +680,7 @@ static void call_rtas_display_status_delay(char c)
 		if (pending_newline) {
 			call_rtas_display_status('\r');
 			call_rtas_display_status('\n');
-		} 
+		}
 		pending_newline = 0;
 		if (width--) {
 			call_rtas_display_status(c);
@@ -820,7 +820,7 @@ void rtas_progress(char *s, unsigned short hex)
 		else
 			rtas_call(display_character, 1, 1, NULL, '\r');
 	}
- 
+
 	if (row_width)
 		width = row_width[current_line];
 	else
@@ -840,9 +840,9 @@ void rtas_progress(char *s, unsigned short hex)
 				spin_unlock(&progress_lock);
 				return;
 			}
- 
+
 			/* RTAS wants CR-LF, not just LF */
- 
+
 			if (*os == '\n') {
 				rtas_call(display_character, 1, 1, NULL, '\r');
 				rtas_call(display_character, 1, 1, NULL, '\n');
@@ -852,7 +852,7 @@ void rtas_progress(char *s, unsigned short hex)
 				 */
 				rtas_call(display_character, 1, 1, NULL, *os);
 			}
- 
+
 			if (row_width)
 				width = row_width[current_line];
 			else
@@ -861,15 +861,15 @@ void rtas_progress(char *s, unsigned short hex)
 			width--;
 			rtas_call(display_character, 1, 1, NULL, *os);
 		}
- 
+
 		os++;
- 
+
 		/* if we overwrite the screen length */
 		if (width <= 0)
 			while ((*os != 0) && (*os != '\n') && (*os != '\r'))
 				os++;
 	}
- 
+
 	spin_unlock(&progress_lock);
 }
 EXPORT_SYMBOL_GPL(rtas_progress);		/* needed by rtas_flash module */

-- 
2.41.0

