Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6EEF0E1B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 06:13:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477F6h2pg5zDrBB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 16:13:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477F4h0t8ZzF5Tk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 16:11:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="IfelZvNS"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 477F4g6cLBz9sP6; Wed,  6 Nov 2019 16:11:31 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 477F4g5jTTz9sPF; Wed,  6 Nov 2019 16:11:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1573017091;
 bh=yaFRbODd6evAd6Y3udSB+MsRM3sE3HHJPK3UOIOkojg=;
 h=From:To:Cc:Subject:Date:From;
 b=IfelZvNSLWRwd8o4THUOSEuDPgQToGQC8TcNkAyLg+N/Fe2HANDUeNNRNh3PA0gq6
 S/q9ehr/fHAzztJ8eUswjONGri28xAxqSmDeaHdjSm5UpLx0HcdO2UseCz+R3kIuXq
 P/zBK/Q7U/9VoCGqGywmWkfoYJYg+cSN+5TSTMFWxrl+dcVv5lwnUsw8NH0KXSa6Oh
 WkMrzZf6WSeVok4TXO7Qt/jAXLz0cEI2oCT4E2KykDb3igszoB6BVpXGoBcDdYeCOB
 qeFuIJQ8IWpOLSmcLIn95z7zJPgMqlEApeHXTOQgT2bGVA76Qd68o+gAKUkXA0SQJu
 KJmRpZDKrA4JQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/64s: Always disable branch profiling for prom_init.o
Date: Wed,  6 Nov 2019 16:11:29 +1100
Message-Id: <20191106051129.7626-1-mpe@ellerman.id.au>
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

Otherwise the build fails because prom_init is calling symbols it's
not allowed to, eg:

  Error: External symbol 'ftrace_likely_update' referenced from prom_init.c
  make[3]: *** [arch/powerpc/kernel/Makefile:197: arch/powerpc/kernel/prom_init_check] Error 1

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 4fdd8a3e775b..717b52b65d62 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -22,6 +22,7 @@ CFLAGS_btext.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
 CFLAGS_prom.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
 
 CFLAGS_prom_init.o += $(call cc-option, -fno-stack-protector)
+CFLAGS_prom_init.o += -DDISABLE_BRANCH_PROFILING
 
 ifdef CONFIG_FUNCTION_TRACER
 # Do not trace early boot code
@@ -39,7 +40,6 @@ KASAN_SANITIZE_btext.o := n
 ifdef CONFIG_KASAN
 CFLAGS_early_32.o += -DDISABLE_BRANCH_PROFILING
 CFLAGS_cputable.o += -DDISABLE_BRANCH_PROFILING
-CFLAGS_prom_init.o += -DDISABLE_BRANCH_PROFILING
 CFLAGS_btext.o += -DDISABLE_BRANCH_PROFILING
 endif
 
-- 
2.21.0

