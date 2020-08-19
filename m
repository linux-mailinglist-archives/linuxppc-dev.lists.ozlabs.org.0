Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 716092492CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 04:16:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWWbc3XL2zDqg8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 12:15:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWWBT5rbwzDqsH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 11:57:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Qsugssrh; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BWWBT4P90z9sTh; Wed, 19 Aug 2020 11:57:37 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BWWBT0zNlz9sPf; Wed, 19 Aug 2020 11:57:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597802257;
 bh=wQVf180SAG/haX0ejh2PElSNXUqrQP+wmdT4eoX+kjo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Qsugssrh2oXeOeMuUSwKYM2fi9wxGM6AucjJwLpsc5Q19qW2nZZqxlZ02KBJToVo7
 vKHNUUFWaWx6u161/qBl/Vlut4kcdqVd8kTH51mmIx7Uh/pk1iWWn8UJ8clHST8Oki
 lZwR+xvJu9mMFmHPVg7ufZ2TCU5lYuToJbkHxeJ2cwODxGPkjvxMk8L+5ku8oTzDgt
 Y0azj1uPtgV5XeC7S8hsn27xH9O3b99Ai+CYsV7pdQ/ujdQIi8JXEjvYLJRXBCg25G
 DetcuZ4u4qNKTU5ftMFiZQV91ywuzdVgsqqQ1bSX5DxPLOft9/ADWA6qSLJtD1wJD+
 rxLIm4qaoFDAQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 6/9] selftests/powerpc: Skip security tests on older CPUs
Date: Wed, 19 Aug 2020 11:57:24 +1000
Message-Id: <20200819015727.1977134-6-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200819015727.1977134-1-mpe@ellerman.id.au>
References: <20200819015727.1977134-1-mpe@ellerman.id.au>
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

Both these tests use PMU events that only work on newer CPUs, so skip
them on older CPUs.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/security/rfi_flush.c  | 3 +++
 tools/testing/selftests/powerpc/security/spectre_v2.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/tools/testing/selftests/powerpc/security/rfi_flush.c b/tools/testing/selftests/powerpc/security/rfi_flush.c
index fd37ff9b1c45..93a65bd1f231 100644
--- a/tools/testing/selftests/powerpc/security/rfi_flush.c
+++ b/tools/testing/selftests/powerpc/security/rfi_flush.c
@@ -89,6 +89,9 @@ int rfi_flush_test(void)
 
 	SKIP_IF(geteuid() != 0);
 
+	// The PMU event we use only works on Power7 or later
+	SKIP_IF(!have_hwcap(PPC_FEATURE_ARCH_2_06));
+
 	if (read_debugfs_file("powerpc/rfi_flush", &rfi_flush_org)) {
 		perror("Unable to read powerpc/rfi_flush debugfs file");
 		SKIP_IF(1);
diff --git a/tools/testing/selftests/powerpc/security/spectre_v2.c b/tools/testing/selftests/powerpc/security/spectre_v2.c
index c8d82b784102..adc2b7294e5f 100644
--- a/tools/testing/selftests/powerpc/security/spectre_v2.c
+++ b/tools/testing/selftests/powerpc/security/spectre_v2.c
@@ -134,6 +134,9 @@ int spectre_v2_test(void)
 	s64 miss_percent;
 	bool is_p9;
 
+	// The PMU events we use only work on Power8 or later
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_2_07));
+
 	state = get_sysfs_state();
 	if (state == UNKNOWN) {
 		printf("Error: couldn't determine spectre_v2 mitigation state?\n");
-- 
2.25.1

