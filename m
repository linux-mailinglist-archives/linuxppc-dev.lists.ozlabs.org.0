Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA8C7EB57E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 18:26:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lOsBQRC2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVCrG4Dl9z3dSl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 04:26:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lOsBQRC2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVCmN4jFNz30fM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 04:22:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1FF6DB81637;
	Tue, 14 Nov 2023 17:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D9EAC433CA;
	Tue, 14 Nov 2023 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699982561;
	bh=rzl4kEf5FcYNvVnk5Smgj39eAPoxpt+bfYjrj/5bK6M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lOsBQRC20MnJGGZp9TJAImd0oMCAH9jMcqQwXI1Cqhae8FgdCTuCR+re6lsYslRDK
	 4IvpkfrCpf1hB1bWssN8V9MBvouOcIezDcHYdeGISXDKB3iUDKMhtLkIfUO6QSNRKH
	 0zK0fIYmKY2/uhz6iGztGqZqIM7yem6IcvwuoM8gs/UbtpDE60IkSo+A1aPZoFVV0l
	 8ontJ9xO4YhL6mFB5yFX1jHdERJ2LVuXeNB8yXDGKbxwARF56PpILh1i1GePenj8PT
	 Pos9KKjro4xc8xNYvBBEZjxsQ4eAFxCmb8eq5CWVYINcIUH/Ielza+L4K4cCkjR4ag
	 m+NNaext8yyzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587E8C4332F;
	Tue, 14 Nov 2023 17:22:41 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Tue, 14 Nov 2023 11:22:27 -0600
Subject: [PATCH v2 3/5] powerpc/rtas: Move post_mobility_fixup()
 declaration to pseries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231114-rtas-trivial-v2-3-59cbab208d57@linux.ibm.com>
References: <20231114-rtas-trivial-v2-0-59cbab208d57@linux.ibm.com>
In-Reply-To: <20231114-rtas-trivial-v2-0-59cbab208d57@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699982560; l=2032;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=h/8tPPiIjitb/+VzF8lSVFUByA0wcuUdyaagJFN8WDE=;
 b=LSylu9PpeBUy6NL2msK8eRE5i8/qz8eg8QtQdPhfRHzRfVK2DQC4fA5i2ID6PGDj3zrtyhyY8
 7OKrbEW7wl4Bpl37cnIrctHNhSryb92SjHJnSxPDh5DsYY8JtKTPJaf
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

This is a pseries-specific function declaration that doesn't belong in
rtas.h. Move it to the pseries platform code and adjust
pseries/suspend.c accordingly.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h          | 1 -
 arch/powerpc/platforms/pseries/pseries.h | 1 +
 arch/powerpc/platforms/pseries/suspend.c | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index c6568a647cd0..2365668fc13e 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -444,7 +444,6 @@ extern void pSeries_log_error(char *buf, unsigned int err_type, int fatal);
 #ifdef CONFIG_PPC_PSERIES
 extern time64_t last_rtas_event;
 extern int clobbering_unread_rtas_event(void);
-extern void post_mobility_fixup(void);
 int rtas_syscall_dispatch_ibm_suspend_me(u64 handle);
 #else
 static inline int clobbering_unread_rtas_event(void) { return 0; }
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 8376f03f932a..1c2d736f600d 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -55,6 +55,7 @@ extern int dlpar_detach_node(struct device_node *);
 extern int dlpar_acquire_drc(u32 drc_index);
 extern int dlpar_release_drc(u32 drc_index);
 extern int dlpar_unisolate_drc(u32 drc_index);
+void post_mobility_fixup(void);
 
 void queue_hotplug_event(struct pseries_hp_errorlog *hp_errlog);
 int handle_dlpar_errorlog(struct pseries_hp_errorlog *hp_errlog);
diff --git a/arch/powerpc/platforms/pseries/suspend.c b/arch/powerpc/platforms/pseries/suspend.c
index 5c43435472cc..382003dfdb9a 100644
--- a/arch/powerpc/platforms/pseries/suspend.c
+++ b/arch/powerpc/platforms/pseries/suspend.c
@@ -13,6 +13,7 @@
 #include <asm/mmu.h>
 #include <asm/rtas.h>
 #include <asm/topology.h>
+#include "pseries.h"
 
 static struct device suspend_dev;
 

-- 
2.41.0

