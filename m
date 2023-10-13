Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0BB7C8F31
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 23:34:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X9HCvyOQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6fs64vNxz3vYf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 08:34:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X9HCvyOQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6fqD5Zvbz30hj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 08:32:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EBD58CE3289;
	Fri, 13 Oct 2023 21:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E98AC43395;
	Fri, 13 Oct 2023 21:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697232741;
	bh=rKBayCArcNg8lZTaG31OSaJdRRe2l56fXkDKNxC1Q/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X9HCvyOQ3tX+MhpSUX80EFxzsuEwQ5d6P7P4l8ekSCQEEovaeK4A0XqM2EQWFiSzr
	 yBFp8MZnmO2MaiDHmSrd2mZhXXp+VCkXtKsRbORzCRlGcCBx4DAFqlJmwnIT4sSYil
	 cTqS8dqiRtC8Ocz6RNzkgmqNochi/KtX3fKNryvJxALLZ5OLvuKuyWSmzWzPbdKaMd
	 A/WqItkp04EOTJ5C85bPSaLbb42pJ+S1J/wM6Wk7MfiM494ewbTwK1n8JgL34KicYF
	 LC4y2TsxQhJqJWR+KulbcwKGLaIs1/db/f2idh4GSpdEaR8RvsbrjZA++EheTVy7kA
	 tDxo7R+wStS+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AEACDB486;
	Fri, 13 Oct 2023 21:32:21 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 13 Oct 2023 16:32:10 -0500
Subject: [PATCH v2 3/7] powerpc/rtas: serialize ibm,get-vpd service with
 papr-vpd sequences
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231013-papr-sys_rtas-vs-lockdown-v2-3-ead01ce01722@linux.ibm.com>
References:  <20231013-papr-sys_rtas-vs-lockdown-v2-0-ead01ce01722@linux.ibm.com>
In-Reply-To:  <20231013-papr-sys_rtas-vs-lockdown-v2-0-ead01ce01722@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697232739; l=2480;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=TLQEPvXfc9R9GBYp7+/JmWBLObxsGORpqehfwb/txZ8=;
 b=i3bcUeSKxL9/UlcMdyFjYxPugonaqh2DQAgqHjoTqSm16KknG1c/KdrMExlRJ+GNzuN/5w0+z
 yf21B4QpePODNpzhAKug7vvRYEaca7S8/QOI8D8Mls6Hg/fDwpkOF5i
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Take the papr-vpd driver's internal mutex when sys_rtas performs
ibm,get-vpd calls. This prevents sys_rtas(ibm,get-vpd) calls from
interleaving with sequences performed by the driver, ensuring that
such sequences are not disrupted.

However, it cannot prevent the driver from interleaving with sequences
that are initiated via sys_rtas, since control returns to user space
with each sys_rtas(ibm,get-vpd) call.

Emit a notice on first use of sys_rtas(ibm,get-vpd) encouraging users
to migrate to /dev/papr-vpd.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index eddc031c4b95..70ae118d2a13 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -37,6 +37,7 @@
 #include <asm/machdep.h>
 #include <asm/mmu.h>
 #include <asm/page.h>
+#include <asm/papr-vpd.h>
 #include <asm/rtas-work-area.h>
 #include <asm/rtas.h>
 #include <asm/time.h>
@@ -1861,6 +1862,28 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 		goto copy_return;
 	}
 
+	if (token == rtas_function_token(RTAS_FN_IBM_GET_VPD)) {
+		/*
+		 * ibm,get-vpd potentially needs to be invoked
+		 * multiple times to obtain complete results.
+		 * Interleaved ibm,get-vpd sequences disrupt each
+		 * other.
+		 *
+		 * /dev/papr-vpd doesn't have this problem and users
+		 * do not need to be aware of each other to use it
+		 * safely.
+		 *
+		 * We can prevent this call from disrupting a
+		 * /dev/papr-vpd-initiated sequence in progress by
+		 * reaching into the driver to take its internal
+		 * lock. Unfortunately there is no way to prevent
+		 * interference in the other direction without
+		 * resorting to even worse hacks.
+		 */
+		pr_notice_once("Calling ibm,get-vpd via sys_rtas is allowed but deprecated. Use /dev/papr-vpd instead.\n");
+		papr_vpd_mutex_lock();
+	}
+
 	buff_copy = get_errorlog_buffer();
 
 	raw_spin_lock_irqsave(&rtas_lock, flags);
@@ -1870,6 +1893,9 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	do_enter_rtas(&rtas_args);
 	args = rtas_args;
 
+	if (token == rtas_function_token(RTAS_FN_IBM_GET_VPD))
+		papr_vpd_mutex_unlock();
+
 	/* A -1 return code indicates that the last command couldn't
 	   be completed due to a hardware error. */
 	if (be32_to_cpu(args.rets[0]) == -1)

-- 
2.41.0

