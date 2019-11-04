Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED0DEF1F0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 01:28:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476Vqw679CzDrCj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 11:27:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476Vnv6FQjzF3T4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 11:26:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="aG/o4kHD"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 476Vnv2Bzgz9sPK; Tue,  5 Nov 2019 11:26:11 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 476Vnt53rWz9sPL; Tue,  5 Nov 2019 11:26:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1572913570;
 bh=4vQw8TFcfhpZmzAMEYsiE+e2CdNpLcvkZpaqh7Pdm7c=;
 h=From:To:Subject:Date:From;
 b=aG/o4kHD15XJb8q7J2iy8RnZvY38UacpQP4gUn2Ouy7QvB+ijOuh2oMFmtBGiJ/x6
 w88YGMWY+QFmtv595Y00ANkoU3SEN+17peutuVsUR3ANRZupg4n4CTZEkfcnTIm6xq
 WGrOJQraJXT4LaKWqDsoGAIjXTmgf93hwnpki7VwV1ABSCCPIbLfzqAZbHiGFckuw3
 mHPgr2lpmwcJqRHJgeRmcjMNBnY6z8/2NSK0Ou114uKOGHLhFWqjuHroxLTm7dTvEu
 f+Y87T+LZVcXYDs7QrdnlTPYlz9eaD2dTe10hNewHWS1F3fvftjenwLi46aEY+kYn0
 vtVFrzRQHTwyw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] selftests/powerpc: Skip tm-signal-sigreturn-nt if TM not
 available
Date: Tue,  5 Nov 2019 10:35:24 +1100
Message-Id: <20191104233524.24348-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On systems where TM (Transactional Memory) is disabled the
tm-signal-sigreturn-nt test causes a SIGILL:

  test: tm_signal_sigreturn_nt
  tags: git_version:7c202575ef63
  !! child died by signal 4
  failure: tm_signal_sigreturn_nt

We should skip the test if TM is not available.

Fixes: 34642d70ac7e ("selftests/powerpc: Add checks for transactional sigreturn")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c b/tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c
index 56fbf9f6bbf3..07c388147b75 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c
@@ -10,10 +10,12 @@
  */
 
 #define _GNU_SOURCE
+#include <stdio.h>
 #include <stdlib.h>
 #include <signal.h>
 
 #include "utils.h"
+#include "tm.h"
 
 void trap_signal_handler(int signo, siginfo_t *si, void *uc)
 {
@@ -29,6 +31,8 @@ int tm_signal_sigreturn_nt(void)
 {
 	struct sigaction trap_sa;
 
+	SKIP_IF(!have_htm());
+
 	trap_sa.sa_flags = SA_SIGINFO;
 	trap_sa.sa_sigaction = trap_signal_handler;
 
-- 
2.21.0

