Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CB61031DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 04:06:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hnf31RJCzDqc3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 14:06:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Hn2m4FtWzDqWm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 13:39:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="Yn8LrFN5"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 47Hn2l5fkfz9sPK; Wed, 20 Nov 2019 13:39:27 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47Hn2l4QV2z9sPf; Wed, 20 Nov 2019 13:39:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1574217567;
 bh=R13lQDuBUR2OEy8NEOLEIjk5ZrkEfScjE68tSvyNq7w=;
 h=From:To:Subject:Date:From;
 b=Yn8LrFN5mfwNrsvwswsbI+h5fywbB0a5MTw80RgPbRtcLwF65BOsz190NVx2KS4o8
 ugSWE65/fGrWMx+WLzCQcw/QfOvgl7M5q7r2UkiwqyyIeC2LCr7AtghyJ/lc8g/vRt
 ra6VjXNCzCaoAqebNSlBsD0ovBZkaxVSzg9eY8qzcl9eGSMs4TLfRtRaHvrvEs8Yqc
 VdIXH1kGMOao/c12xj2hescJApc6kbI+K/dpoxcN+RQhwGhKlz9vA3Aa6E8DdeLaW7
 xxX5AHA2+OAmwiqebvJPtgbNaizes+epI56cTNf2o3jRCBpGzx4wCuGIMMXdaidrc7
 OHCn0JsgyEv6w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] selftests/powerpc: spectre_v2 test must be built 64-bit
Date: Wed, 20 Nov 2019 13:39:24 +1100
Message-Id: <20191120023924.13130-1-mpe@ellerman.id.au>
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

The spectre_v2 test must be built 64-bit, it includes hand-written asm
that is 64-bit only, and segfaults if built 32-bit.

Fixes: c790c3d2b0ec ("selftests/powerpc: Add a test of spectre_v2 mitigations")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/security/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/powerpc/security/Makefile b/tools/testing/selftests/powerpc/security/Makefile
index d68e6031695c..eadbbff50be6 100644
--- a/tools/testing/selftests/powerpc/security/Makefile
+++ b/tools/testing/selftests/powerpc/security/Makefile
@@ -8,4 +8,6 @@ CFLAGS += -I../../../../../usr/include
 include ../../lib.mk
 
 $(TEST_GEN_PROGS): ../harness.c ../utils.c
+
+$(OUTPUT)/spectre_v2: CFLAGS += -m64
 $(OUTPUT)/spectre_v2: ../pmu/event.c branch_loops.S
-- 
2.21.0

