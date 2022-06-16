Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8363254DB37
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 09:07:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNtXy2gv6z3bwQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 17:07:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e2C8wnyg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNtXJ6PtPz3bYl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 17:07:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e2C8wnyg;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LNtXH3Rhpz4xXg;
	Thu, 16 Jun 2022 17:07:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1655363231;
	bh=RE8YclOxiovr2xXzTEFelTyaTXCfAt8RyHNZwbL9g+Y=;
	h=From:To:Subject:Date:From;
	b=e2C8wnygnJTWntla5HrZuQUxE3yoLFoginSgrXu6A0T1HShaKM5mAaxOHSVF7PS/7
	 cgeWrVl6d3W4nvOy5yibsdIEwF3O5qA8wGritNrj5bmIRhmgtvb4/2pNls00rP0ATR
	 LQGgBHqoIoyAAM4Ri2oHAFKS2A6n+ecnmMXAqK/6Km+GXFDrDcaKoQt349mgc9RZ1a
	 k2bOhdvgC4WDX8ZLCdnN6WDWyDIYCCV3y58kyv0C1a0qHza4lEiWRz8M1t1agWIc+p
	 906RiFvvoXoeqpWmf0pMax/wcibp2l8wfjHIRB4WzqfQsDSx1jOZBdIhDLd7cip2+l
	 le/oDSbsPHiHw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] selftests/powerpc: Add missing files to .gitignores
Date: Thu, 16 Jun 2022 17:07:05 +1000
Message-Id: <20220616070705.1941829-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These were missed when the respective tests were added, add them now.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/math/.gitignore     | 1 +
 tools/testing/selftests/powerpc/mce/.gitignore      | 1 +
 tools/testing/selftests/powerpc/pmu/ebb/.gitignore  | 1 +
 tools/testing/selftests/powerpc/security/.gitignore | 1 +
 4 files changed, 4 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/mce/.gitignore

diff --git a/tools/testing/selftests/powerpc/math/.gitignore b/tools/testing/selftests/powerpc/math/.gitignore
index d0c23b2e4b60..07b4893ef7af 100644
--- a/tools/testing/selftests/powerpc/math/.gitignore
+++ b/tools/testing/selftests/powerpc/math/.gitignore
@@ -7,3 +7,4 @@ fpu_signal
 vmx_signal
 vsx_preempt
 fpu_denormal
+mma
diff --git a/tools/testing/selftests/powerpc/mce/.gitignore b/tools/testing/selftests/powerpc/mce/.gitignore
new file mode 100644
index 000000000000..f5921462a495
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mce/.gitignore
@@ -0,0 +1 @@
+inject-ra-err
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/.gitignore b/tools/testing/selftests/powerpc/pmu/ebb/.gitignore
index 2920fb39439b..64d8dfdac74a 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/.gitignore
+++ b/tools/testing/selftests/powerpc/pmu/ebb/.gitignore
@@ -21,3 +21,4 @@ back_to_back_ebbs_test
 lost_exception_test
 no_handler_test
 cycles_with_mmcr2_test
+regs_access_pmccext_test
diff --git a/tools/testing/selftests/powerpc/security/.gitignore b/tools/testing/selftests/powerpc/security/.gitignore
index 93614b125ded..9357b186b13c 100644
--- a/tools/testing/selftests/powerpc/security/.gitignore
+++ b/tools/testing/selftests/powerpc/security/.gitignore
@@ -2,3 +2,4 @@
 rfi_flush
 entry_flush
 spectre_v2
+uaccess_flush
-- 
2.35.3

