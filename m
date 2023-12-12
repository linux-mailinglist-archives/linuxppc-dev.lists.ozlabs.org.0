Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B5080F402
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 18:06:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GJ509m7L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqQ504S5Vz3dRs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 04:06:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GJ509m7L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqPzc2yyfz2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 04:02:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F1610618E1;
	Tue, 12 Dec 2023 17:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63603C433CC;
	Tue, 12 Dec 2023 17:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702400520;
	bh=IwxclI4wsCmE1ANpwai8qi1muSS6ZB21bW8sFJIR7iY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GJ509m7LiVZgUaLa23q+aFn3I4BEbVFyy4Qh0YHF9ncK13fz4nMYI1nic86EWfFwK
	 pXrCuYXTwL0lDtQKZZp8VHuKWIFyE+TGRb4ej8+/VNt5ix7Jvxqj8eo7MVmr4Dhnp1
	 gtbNLSwokQJrOupdcGD152Fm3DQuuY2SdZX8mRN0qG0g3ErHIUtIe85RX7Ul1Wq7EM
	 mUMBxY+g6LabMGWNgjBab0jEZV431hEHDn05R9OjNZ+ugcVSzLexsRL7MylOrr9tEP
	 Nmn60Hm4LDjwbe+Z3N1ChTPDS4Ou+Ew0gvaGEMpMrOMCspi7HqhVZb1UzmruBk2W2l
	 g62ojsVdbVxpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498BBC35274;
	Tue, 12 Dec 2023 17:02:00 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Tue, 12 Dec 2023 11:01:51 -0600
Subject: [PATCH v6 04/13] powerpc/rtas: Add function return status
 constants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231212-papr-sys_rtas-vs-lockdown-v6-4-e9eafd0c8c6c@linux.ibm.com>
References:  <20231212-papr-sys_rtas-vs-lockdown-v6-0-e9eafd0c8c6c@linux.ibm.com>
In-Reply-To:  <20231212-papr-sys_rtas-vs-lockdown-v6-0-e9eafd0c8c6c@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702400518; l=2372;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=kCuJERDzmYgBzIZZ4Ubp2I3CxXEFkU4/FSvd3ux6m2U=;
 b=/mQxR+SCfy9UGffS35M1O6Op1mRYFpUyzbwU16Me21B79U9claW/fyc4Y26+Bza10+MC3y3nc
 5snQfvXqBH/C+03O0WaXH6jzhHF9y41BBooAIfV0ZCUdwmh9PTETlEh
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, gcwilson@linux.ibm.com, "Aneesh Kumar K.V \(IBM\)" <aneesh.kumar@kernel.org>, =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Not all of the generic RTAS function statuses specified in PAPR have
symbolic constants and descriptions in rtas.h. Fix this, providing a
little more background, slightly updating the existing wording, and
improving the formatting.

Reviewed-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index a7110ed52e25..08d19e6904f7 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -201,12 +201,25 @@ typedef struct {
 /* Memory set aside for sys_rtas to use with calls that need a work area. */
 #define RTAS_USER_REGION_SIZE (64 * 1024)
 
-/* RTAS return status codes */
-#define RTAS_HARDWARE_ERROR	-1    /* Hardware Error */
-#define RTAS_BUSY		-2    /* RTAS Busy */
-#define RTAS_INVALID_PARAMETER	-3    /* Invalid indicator/domain/sensor etc. */
-#define RTAS_EXTENDED_DELAY_MIN	9900
-#define RTAS_EXTENDED_DELAY_MAX	9905
+/*
+ * Common RTAS function return values, derived from the table "RTAS
+ * Status Word Values" in PAPR+ v2.13 7.2.8: "Return Codes". If a
+ * function can return a value in this table then generally it has the
+ * meaning listed here. More extended commentary in the documentation
+ * for rtas_call().
+ *
+ * RTAS functions may use negative and positive numbers not in this
+ * set for function-specific error and success conditions,
+ * respectively.
+ */
+#define RTAS_SUCCESS                     0 /* Success. */
+#define RTAS_HARDWARE_ERROR             -1 /* Hardware or other unspecified error. */
+#define RTAS_BUSY                       -2 /* Retry immediately. */
+#define RTAS_INVALID_PARAMETER          -3 /* Invalid indicator/domain/sensor etc. */
+#define RTAS_UNEXPECTED_STATE_CHANGE    -7 /* Seems limited to EEH and slot reset. */
+#define RTAS_EXTENDED_DELAY_MIN       9900 /* Retry after delaying for ~1ms. */
+#define RTAS_EXTENDED_DELAY_MAX       9905 /* Retry after delaying for ~100s. */
+#define RTAS_ML_ISOLATION_ERROR      -9000 /* Multi-level isolation error. */
 
 /* statuses specific to ibm,suspend-me */
 #define RTAS_SUSPEND_ABORTED     9000 /* Suspension aborted */

-- 
2.41.0

