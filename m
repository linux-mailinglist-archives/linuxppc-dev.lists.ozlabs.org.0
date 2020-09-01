Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C69258E93
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 14:50:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgn3z06GzzDqJL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 22:50:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bgmzh3dQwzDqX7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 22:46:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=fcnMIXF8; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4Bgmzh2NS4z9sTN; Tue,  1 Sep 2020 22:46:56 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Bgmzh134Pz9sTd; Tue,  1 Sep 2020 22:46:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1598964416;
 bh=sHQQ8gA+UHwQq+MyBgwgVZp2vjXDjTPVUFuW9SEtE8w=;
 h=From:To:Subject:Date:From;
 b=fcnMIXF8MzXZRvCdgUgYUTZdpHMTekSaX6q3v9gMxI2Xl3M8VCHp7N7hBd1RVl4O6
 qtUl5BfXUDYN1dDpBbWUAZl6sDVhhiThavNI07iNU6ywXIKAymfK55Slu1EL7U0bwP
 ASa/VkSp514hOgwrPMN/lH2oKBNp8jE74xuhkTgKTbXnHExjQtdCGS/wzWvwNmp2eO
 StzVC8nYIFnWT1p9P6IROcrAAcgyUxXOaJx0swhu+MGplr//2KYKguSBCMGXL8DNix
 UOFqYo+wtvAGdx9WxF29Y1H5+daUqc8IXPRmPPV5jH8ZYDLAty5A3FlJb4kTiXEpUW
 QKnn6NkLK60uw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] selftests/powerpc: Skip PROT_SAO test in guests/LPARS
Date: Tue,  1 Sep 2020 22:46:53 +1000
Message-Id: <20200901124653.523182-1-mpe@ellerman.id.au>
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

In commit 9b725a90a8f1 ("powerpc/64s: Disallow PROT_SAO in LPARs by
default") PROT_SAO was disabled in guests/LPARs by default. So skip
the test if we are running in a guest to avoid a spurious failure.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/mm/prot_sao.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/mm/prot_sao.c b/tools/testing/selftests/powerpc/mm/prot_sao.c
index e0cf8ebbf8cd..30b71b1d78d5 100644
--- a/tools/testing/selftests/powerpc/mm/prot_sao.c
+++ b/tools/testing/selftests/powerpc/mm/prot_sao.c
@@ -7,6 +7,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <sys/mman.h>
+#include <unistd.h>
 
 #include <asm/cputable.h>
 
@@ -18,9 +19,13 @@ int test_prot_sao(void)
 {
 	char *p;
 
-	/* SAO was introduced in 2.06 and removed in 3.1 */
+	/*
+	 * SAO was introduced in 2.06 and removed in 3.1. It's disabled in
+	 * guests/LPARs by default, so also skip if we are running in a guest.
+	 */
 	SKIP_IF(!have_hwcap(PPC_FEATURE_ARCH_2_06) ||
-		have_hwcap2(PPC_FEATURE2_ARCH_3_1));
+		have_hwcap2(PPC_FEATURE2_ARCH_3_1) ||
+		access("/proc/device-tree/rtas/ibm,hypertas-functions", F_OK) == 0);
 
 	/*
 	 * Ensure we can ask for PROT_SAO.
-- 
2.25.1

