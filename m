Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56809222253
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 14:24:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6tj61dm3zDqxc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 22:24:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6tfK44HyzDqKN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:21:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=q35X4nHY; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4B6tfK29xqz9sSt; Thu, 16 Jul 2020 22:21:45 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6tfK0whDz9sT6; Thu, 16 Jul 2020 22:21:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594902105;
 bh=60RrPK2aNaQucsqp2EqE5F8O+RE8ske4b9xZ023f6Ic=;
 h=From:To:Subject:Date:From;
 b=q35X4nHY2J5+ZAylPEjDzjoJpoe1wPlJStTx8WOHJrHJR1a5PdgP0NDDkk3ZmeKAT
 Vagh2iB7qT4Y5fB/2tkNY7glfhdUazwfb39D4ZAeJElDpROg3cpFxOph1ZX21hiX0j
 +37uTTJK+2CO3s7gwkWd9cUeE+m6QP81/k59BsI4xdxORitsTHf7N/PCHZP2s3KLNx
 8Iqi3iDPLTNME9eXJWF9pcxXu8Il4J/CKjAk8pEei3ennEfLRcZ4qFo0pVcpKpjGQO
 Sf20L5ohOiWqD4vTTG9Fs/e9kVZ3eFJTgtQSK6OV7JMRxHvczKbRoo927jwrazbO5g
 QcsLY5y5CCr7A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] selftests/powerpc: Run per_event_excludes test on Power8 or
 later
Date: Thu, 16 Jul 2020 22:21:42 +1000
Message-Id: <20200716122142.3776261-1-mpe@ellerman.id.au>
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

The per_event_excludes test wants to run on Power8 or later. But
currently it checks that AT_BASE_PLATFORM *equals* power8, which means
it only runs on Power8.

Fix it to check for the ISA 2.07 feature, which will be set on Power8
and later CPUs.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/pmu/per_event_excludes.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/powerpc/pmu/per_event_excludes.c b/tools/testing/selftests/powerpc/pmu/per_event_excludes.c
index 2756fe2efdc5..2d37942bf72b 100644
--- a/tools/testing/selftests/powerpc/pmu/per_event_excludes.c
+++ b/tools/testing/selftests/powerpc/pmu/per_event_excludes.c
@@ -12,6 +12,8 @@
 #include <string.h>
 #include <sys/prctl.h>
 
+#include <asm/cputable.h>
+
 #include "event.h"
 #include "lib.h"
 #include "utils.h"
@@ -23,12 +25,9 @@
 static int per_event_excludes(void)
 {
 	struct event *e, events[4];
-	char *platform;
 	int i;
 
-	platform = (char *)get_auxv_entry(AT_BASE_PLATFORM);
-	FAIL_IF(!platform);
-	SKIP_IF(strcmp(platform, "power8") != 0);
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_2_07));
 
 	/*
 	 * We need to create the events disabled, otherwise the running/enabled
-- 
2.25.1

