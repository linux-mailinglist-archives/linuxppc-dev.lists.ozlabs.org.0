Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CA022BB15
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 02:42:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCVlz14vzzDrgG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 10:42:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCVkM04MjzDrRn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 10:41:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=o3XEDany; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BCVkL46ssz9sPB; Fri, 24 Jul 2020 10:41:14 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCVkL3GDQz9sR4; Fri, 24 Jul 2020 10:41:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595551274;
 bh=luM56U6Zv4RVrBAdMAb0tgdgUvVgj660JUFrkp++zYI=;
 h=From:To:Subject:Date:From;
 b=o3XEDanysIeCcRQ+OZCz3C/jlXy5iqdqLao9ll+r0nL2MTgrok9KjNHjpcbROVKt3
 045LelzcJ1DcIO3v87WH378f/19KNNcf0T7E//3BRGYHOLjCttM5JwncQ4dm7VuHDs
 nmAlgWio6GMTQlGZxobKHsEpNtqSIsqYesaOIk0JtRgc2Y+pFcruDfjZ9O26BmNafO
 B/48BmuaBOkiyU661LB2bmXcV3/dZ0++7ZD8lmDDoAz8cnmKuBuUbWSyFONqCPUqHN
 9CZvQ6CBnsHfLMtfMebiQZ0DW1YY/1pPSIOdLjKXoDtY76zxknbHkqIlAFQL3z7Q/j
 ZoIvDgQzizRlg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/test_emulate_sstep: Fix build error
Date: Fri, 24 Jul 2020 10:41:09 +1000
Message-Id: <20200724004109.1461709-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ppc64_book3e_allmodconfig fails with:

  arch/powerpc/lib/test_emulate_step.c: In function 'test_pld':
  arch/powerpc/lib/test_emulate_step.c:113:7: error: implicit declaration of function 'cpu_has_feature'
    113 |  if (!cpu_has_feature(CPU_FTR_ARCH_31)) {
        |       ^~~~~~~~~~~~~~~

Add an include of cpu_has_feature.h to fix it.

Fixes: b6b54b42722a ("powerpc/sstep: Add tests for prefixed integer load/stores")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/lib/test_emulate_step.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 081b05480c47..d242e9f72e0c 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt) "emulate_step_test: " fmt
 
 #include <linux/ptrace.h>
+#include <asm/cpu_has_feature.h>
 #include <asm/sstep.h>
 #include <asm/ppc-opcode.h>
 #include <asm/code-patching.h>
-- 
2.25.1

