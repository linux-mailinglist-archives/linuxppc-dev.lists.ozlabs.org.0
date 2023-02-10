Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E73DC692BAD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 00:57:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PD9dr6GJxz3f8H
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 10:57:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AhQSmYI+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AhQSmYI+;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD9cr6Z11z3f6g
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 10:56:44 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7FDC3B825C8;
	Fri, 10 Feb 2023 23:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 465CDC433EF;
	Fri, 10 Feb 2023 23:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676073399;
	bh=Cggc2PSjESmjJ4YtOYiHNZnLan2KNIa9wTRkNJbBETg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=AhQSmYI+nm+21P2GiOzOzRB8WocX7aBoGPA+riycH4yn/2Lil9l8DfmauH4nruFto
	 ysOhpufoAJiiv8wW9m77gRGXZAss8Cl3pVB/0UsVirKjPk/wspdyt2o1WSGeKC3y36
	 L2Q5hQ3YZWHkStLvOjfLoAxjrNE6gY3of1b1ffdKUPl8/+PFuOsAMqbdQoFtkfjUKd
	 Bee/3326Re8L/W8S22sN/AkTrx15rivKUq7s9EBdlOvFN+9jLHh5D2SHojCH/Q/fbW
	 mpYWnhJii7EoT88Qcn2VcXyz89Op2z/otX66Zkud9cTnmQLWYxnvLEYhhqMZXXCxGG
	 1qh3xKVOaxVCg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CDDC05027;
	Fri, 10 Feb 2023 23:56:39 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 10 Feb 2023 17:56:28 -0600
Subject: [PATCH] powerpc/machdep: warn when machine_is() used too early
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: =?utf-8?q?=3C20230210-warn-on-machine-is-before-probe-machine-v1?=
 =?utf-8?q?-1-f0cba57125fb=40linux=2Eibm=2Ecom=3E?=
X-B4-Tracking: v=1; b=H4sIAKvZ5mMC/z2OQQrCMBBFr1Jm7UCSWgSvIi5m4sRk0UmZiBVK7
 27qwuX7Dx5/gyZWpMF12MDkXVqp2sGfBoiZ9ClYHp0huDC64B2uZIpVcaaYi3bdkCVVE1yssvz
 38TL5iX06j8zQa0xNkI005qM3U3uJHWIxSeXzu3C77/sXMDRAapIAAAA=
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676073398; l=1645;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=+nyHN6/MED0UH3QD0vMZ7Uax/BGz0rKLjziCR5coDn4=;
 b=X6JG9xjRueGPp34qaW0+pNjdEnkRZnVpkuriT6oXvbLytM+DCQdowAvmDaymtSd2OpYi+/AsS
 P99hy4AUAUoCl6xxAdf1kM4LCIZfeaCZydWJr2DcX7OadRYYx+7oowA
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

machine_is() can't provide correct results before probe_machine() has
run. Warn when it's used too early in boot.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
Prompted by my attempts to do some pseries-specific setup during
rtas_initialize() and being puzzled for a while that it wasn't
working.
---
 arch/powerpc/include/asm/machdep.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 378b8d5836a7..8c0a799d18cd 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -220,11 +220,13 @@ extern struct machdep_calls *machine_id;
 	EXPORT_SYMBOL(mach_##name);				\
 	struct machdep_calls mach_##name __machine_desc =
 
-#define machine_is(name) \
-	({ \
-		extern struct machdep_calls mach_##name \
-			__attribute__((weak));		 \
-		machine_id == &mach_##name; \
+#define machine_is(name)                                            \
+	({                                                          \
+		extern struct machdep_calls mach_##name             \
+			__attribute__((weak));                      \
+		WARN(!machine_id,                                   \
+		     "machine_is() called before probe_machine()"); \
+		machine_id == &mach_##name;                         \
 	})
 
 static inline void log_error(char *buf, unsigned int err_type, int fatal)

---
base-commit: 0bfb97203f5f300777624a2ad6f8f84aea3e8658
change-id: 20230210-warn-on-machine-is-before-probe-machine-37515b1f43bb

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>

