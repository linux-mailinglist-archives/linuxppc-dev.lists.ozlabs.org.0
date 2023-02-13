Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1118F695097
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 20:25:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFvRr0m1Dz3c7s
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 06:24:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qxa9vOI4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qxa9vOI4;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFvQs5Lrnz3c16
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 06:24:05 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B88BE61210;
	Mon, 13 Feb 2023 19:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29DA1C433D2;
	Mon, 13 Feb 2023 19:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676316242;
	bh=N2q4Yr1egbB89n2iF6ldwNY4NM1E3aAf9LEmso0qefI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Qxa9vOI4rqaALs1MYeqrXyWJUGtSoeNFD02u717Le5UaLucWZ9UqaY6Ti1o9zpguk
	 87fhxu/3CABeXm65lqtM70fAdC8Pgn5hc/L1CRqTj2/JOGHuRNiX3bCnI/+Qjn9ne3
	 lZphh/Y9FxPkHtZAW9ixRPOV9OsSvybSlOo//0pUHvvbvGYsGlhUMF1NgXIqmvk9JK
	 sa1bGOpN334B/nFmjbenhOVPiPkoDfg+oB8npfPrKsBScRNzpy0qs4804hbfzB5EBm
	 y1LzbLP+pV0dMZJhSakir8+F1/CfGJt6FubBzOhSwSLnq9sIXPLkpup4kVs/yo4hkd
	 okIsXMMe3EA2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C86C636CC;
	Mon, 13 Feb 2023 19:24:02 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 13 Feb 2023 13:23:51 -0600
Subject: [PATCH v2] powerpc/machdep: warn when machine_is() used too early
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: =?utf-8?q?=3C20230210-warn-on-machine-is-before-probe-machine-v2?=
 =?utf-8?q?-1-b57f8243c51c=40linux=2Eibm=2Ecom=3E?=
X-B4-Tracking: v=1; b=H4sIAEaO6mMC/5WOwQ6CMBBEf4X07BJaJCSe/A/DoVu3som0ZIuII
 fy7hYN3j28meTOrSiRMSV2KVQnNnDiGDOZUKNfb8CDge2ZlKlNXRlfwthIgBhis6znkOgGSj0I
 wSkT65XXb6Aa1P9eIKtvQJgIUG1y/+wabJpK9GIU8L8eFW5e55zRF+RyPZr2n/4/PGjT4yqFtW
 m0aj9cnh9dSMg6li4Pqtm37Am6AbAj7AAAA
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676316241; l=2389;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=U3ysgvX48P2OhQ8+xTLXW5puL0334RlB2L8QsGv/IKE=;
 b=xj6L8LjBONdygVBMhBaA2rb/K/eyTrNwMkG341NO9eCEME4hEsTrMAZSivJXcUOs4uP9AIc3k
 68arfJ7oESyBaEXqktpv7uDs6Uwra5cdA/HLJRftQWa6j7uzqt9tBBs
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
run. Warn when it's used too early in boot, placing the WARN_ON() in a
helper function so the reported file:line indicates exactly what went
wrong.

checkpatch complains about __attribute__((weak)) in the patch, so
change that to __weak, and align the line continuations as well.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
Prompted by my attempts to do some pseries-specific setup during
rtas_initialize() and being puzzled for a while that it wasn't
working.

Changes in v2:
- Use WARN_ON(), not WARN().
- Introduce __machine_is() helper function so the line reported is
  accurate.
- Update __attribute__((weak)) to __weak for checkpatch's sake.
- Link to v1: https://lore.kernel.org/r/20230210-warn-on-machine-is-before-probe-machine-v1-1-f0cba57125fb@linux.ibm.com
---
 arch/powerpc/include/asm/machdep.h | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 378b8d5836a7..459736d5e511 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -3,6 +3,7 @@
 #define _ASM_POWERPC_MACHDEP_H
 #ifdef __KERNEL__
 
+#include <linux/compiler.h>
 #include <linux/seq_file.h>
 #include <linux/init.h>
 #include <linux/dma-mapping.h>
@@ -220,11 +221,16 @@ extern struct machdep_calls *machine_id;
 	EXPORT_SYMBOL(mach_##name);				\
 	struct machdep_calls mach_##name __machine_desc =
 
-#define machine_is(name) \
-	({ \
-		extern struct machdep_calls mach_##name \
-			__attribute__((weak));		 \
-		machine_id == &mach_##name; \
+static inline bool __machine_is(const struct machdep_calls *md)
+{
+	WARN_ON(!machine_id); // complain if used before probe_machine()
+	return machine_id == md;
+}
+
+#define machine_is(name)                                        \
+	({                                                      \
+		extern struct machdep_calls mach_##name __weak; \
+		__machine_is(&mach_##name);                     \
 	})
 
 static inline void log_error(char *buf, unsigned int err_type, int fatal)

---
base-commit: 0bfb97203f5f300777624a2ad6f8f84aea3e8658
change-id: 20230210-warn-on-machine-is-before-probe-machine-37515b1f43bb

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>

