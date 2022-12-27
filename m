Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D423656F6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Dec 2022 21:45:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NhRVM3q8Qz3fHW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Dec 2022 07:44:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RcVSzcGx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RcVSzcGx;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NhRHg2HcKz3cFD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Dec 2022 07:35:43 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4287561242;
	Tue, 27 Dec 2022 20:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0FBC433EF;
	Tue, 27 Dec 2022 20:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672173341;
	bh=yQp9gey/p9XrE0TJ4o/A319/sCYc9ly1bfKqcGAOxg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RcVSzcGxGYnh+8PFjqAO7p5/BZUh8YpyLdJ4c/7N+mNq2BC3Yxn2yufC/MzWS3dWH
	 Mm92KUD4wNP5uFRS/1vjY/pgCmQZuGH/5dTdJ6bWTvaD29Eyk7rPxW6g8xlD7xp5T8
	 a7fuOJWQ4GGjqFesZc2UHW+jwh0+vzbHZ/7CLFoZMiuPsMiny+OhVNv0VsvuK0xCQD
	 RbvjViBrHkc948GU1+0nRIDpbRWGn1nXxsMbiiF3YSTxxT1b7hCXvtj2sQv2NLQFyY
	 BRV/UcidaqmtyJ0GR+Heh+iYtvGlchLMji8mvWd2hz+kkNeI86uv2+DamnnxyHjvZi
	 lzSwMIxOjwg4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 3/7] powerpc/rtas: avoid device tree lookups in rtas_os_term()
Date: Tue, 27 Dec 2022 15:35:28 -0500
Message-Id: <20221227203534.1214640-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227203534.1214640-1-sashal@kernel.org>
References: <20221227203534.1214640-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Sasha Levin <sashal@kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, sourabhjain@linux.ibm.com, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

[ Upstream commit ed2213bfb192ab51f09f12e9b49b5d482c6493f3 ]

rtas_os_term() is called during panic. Its behavior depends on a couple
of conditions in the /rtas node of the device tree, the traversal of
which entails locking and local IRQ state changes. If the kernel panics
while devtree_lock is held, rtas_os_term() as currently written could
hang.

Instead of discovering the relevant characteristics at panic time,
cache them in file-static variables at boot. Note the lookup for
"ibm,extended-os-term" is converted to of_property_read_bool() since it
is a boolean property, not an RTAS function token.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
[mpe: Incorporate suggested change from Nick]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20221118150751.469393-4-nathanl@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/rtas.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 35e246e39705..8ec69ea81fb4 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -714,6 +714,7 @@ void __noreturn rtas_halt(void)
 
 /* Must be in the RMO region, so we place it here */
 static char rtas_os_term_buf[2048];
+static s32 ibm_os_term_token = RTAS_UNKNOWN_SERVICE;
 
 void rtas_os_term(char *str)
 {
@@ -725,14 +726,13 @@ void rtas_os_term(char *str)
 	 * this property may terminate the partition which we want to avoid
 	 * since it interferes with panic_timeout.
 	 */
-	if (RTAS_UNKNOWN_SERVICE == rtas_token("ibm,os-term") ||
-	    RTAS_UNKNOWN_SERVICE == rtas_token("ibm,extended-os-term"))
+	if (ibm_os_term_token == RTAS_UNKNOWN_SERVICE)
 		return;
 
 	snprintf(rtas_os_term_buf, 2048, "OS panic: %s", str);
 
 	do {
-		status = rtas_call(rtas_token("ibm,os-term"), 1, 1, NULL,
+		status = rtas_call(ibm_os_term_token, 1, 1, NULL,
 				   __pa(rtas_os_term_buf));
 	} while (rtas_busy_delay(status));
 
@@ -1215,6 +1215,13 @@ void __init rtas_initialize(void)
 	no_entry = of_property_read_u32(rtas.dev, "linux,rtas-entry", &entry);
 	rtas.entry = no_entry ? rtas.base : entry;
 
+	/*
+	 * Discover these now to avoid device tree lookups in the
+	 * panic path.
+	 */
+	if (of_property_read_bool(rtas.dev, "ibm,extended-os-term"))
+		ibm_os_term_token = rtas_token("ibm,os-term");
+
 	/* If RTAS was found, allocate the RMO buffer for it and look for
 	 * the stop-self token if any
 	 */
-- 
2.35.1

