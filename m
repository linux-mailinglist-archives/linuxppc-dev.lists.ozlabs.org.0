Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303D7374EB5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 06:51:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbLkY0R87z3btv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 14:51:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=m3DdyG4/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=m3DdyG4/; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbLjX48yqz2xfn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 14:50:08 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FbLjR191Dz9sTD; Thu,  6 May 2021 14:50:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1620276603;
 bh=qhpY2BY+QX9A1410ys11Iwo7/8DobTa8WjgBucSxkvI=;
 h=From:To:Cc:Subject:Date:From;
 b=m3DdyG4/bhPNzIC+ab8iuMbuEZM5B3ea4DQA4ac5cto9EpMKDOYC3hSHWqk8Li09x
 AUsCyYdz9Rwojx9fVryLYrYKqkfsn3Pr99hkhcrIgYs78ZuwU05HJSTZC3diVCCBlX
 ZRRp43/rgtMlEztWrub4jiuD2qUzCWFvoUoQi1fjs07Hk6nQSgGI1yEwEO0Mw75TIr
 w9gn/Wo0FOuxGd9f6ZNCLvSmR9pK25N7MP6wfvuI5Jrr6SGfY5TIkRAvds9IW4fzef
 euNDiCT0NTyzeG2h9namjxAITZsAiLD8vvm1Qi/0oUNHmS7DLjQLoJg3PyRyFoUv4N
 fehcQJIQ+sGnA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] powerpc/64s: Fix crashes when toggling stf barrier
Date: Thu,  6 May 2021 14:49:58 +1000
Message-Id: <20210506044959.1298123-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: nathanl@linux.ibm.com, anton@samba.org, npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The STF (store-to-load forwarding) barrier mitigation can be
enabled/disabled at runtime via a debugfs file (stf_barrier), which
causes the kernel to patch itself to enable/disable the relevant
mitigations.

However depending on which mitigation we're using, it may not be safe to
do that patching while other CPUs are active. For example the following
crash:

  User access of kernel address (c00000003fff5af0) - exploit attempt? (uid: 0)
  segfault (11) at c00000003fff5af0 nip 7fff8ad12198 lr 7fff8ad121f8 code 1
  code: 40820128 e93c00d0 e9290058 7c292840 40810058 38600000 4bfd9a81 e8410018
  code: 2c030006 41810154 3860ffb6 e9210098 <e94d8ff0> 7d295279 39400000 40820a3c

Shows that we returned to userspace without restoring the user r13
value, due to executing the partially patched STF exit code.

Fix it by doing the patching under stop machine. The CPUs that aren't
doing the patching will be spinning in the core of the stop machine
logic. That is currently sufficient for our purposes, because none of
the patching we do is to that code or anywhere in the vicinity.

Fixes: a048a07d7f45 ("powerpc/64s: Add support for a store forwarding barrier at kernel entry/exit")
Cc: stable@vger.kernel.org # v4.17+
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/lib/feature-fixups.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

v2: Fix the bugs.
    Pass a pointer to types, rather than wedging into the void *.
    Use stop_machine().

diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index 1fd31b4b0e13..10083add8b33 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -14,6 +14,7 @@
 #include <linux/string.h>
 #include <linux/init.h>
 #include <linux/sched/mm.h>
+#include <linux/stop_machine.h>
 #include <asm/cputable.h>
 #include <asm/code-patching.h>
 #include <asm/page.h>
@@ -227,11 +228,25 @@ static void do_stf_exit_barrier_fixups(enum stf_barrier_type types)
 		                                           : "unknown");
 }
 
+static int __do_stf_barrier_fixups(void *data)
+{
+	enum stf_barrier_type *types = data;
+
+	do_stf_entry_barrier_fixups(*types);
+	do_stf_exit_barrier_fixups(*types);
+
+	return 0;
+}
 
 void do_stf_barrier_fixups(enum stf_barrier_type types)
 {
-	do_stf_entry_barrier_fixups(types);
-	do_stf_exit_barrier_fixups(types);
+	/*
+	 * The call to the fallback entry flush, and the fallback/sync-ori exit
+	 * flush can not be safely patched in/out while other CPUs are executing
+	 * them. So call __do_stf_barrier_fixups() on one CPU while all other CPUs
+	 * spin in the stop machine core with interrupts hard disabled.
+	 */
+	stop_machine(__do_stf_barrier_fixups, &types, NULL);
 }
 
 void do_uaccess_flush_fixups(enum l1d_flush_type types)
-- 
2.25.1

