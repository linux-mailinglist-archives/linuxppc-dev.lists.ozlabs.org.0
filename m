Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F328BCD3B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 13:59:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ovDRCObK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY0Ly2nP2z3cR1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 21:59:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ovDRCObK;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY0LD5qTfz30Sx
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 21:58:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1714996724;
	bh=jX/mUszE+S1VDJa81j1IS6jhEDVmJabjLYtSxdg26Xs=;
	h=From:To:Cc:Subject:Date:From;
	b=ovDRCObKSqHo0kyqfy86RBUTQxmTVAylxZXmr7EHGt6/BNqosEaLk8ddTDV2gM0P1
	 vzXprSZpq3YYqbMjobcjPFfimAAv6uzQ2bfBR2t8Q/FAZ6wh2ewPLft4PabLSyZ4jg
	 UCQ4rFVc7RxrbDDewspYdX6sco6vEI8lNe0N3NrRii4BwKUYlFPovT7HcooAYVFS5+
	 ei0QTifk6ykOlDzAmj7IpuFj93F2VfU1HBF7H8g89WVl42E/76ZNd5cvdeUPeDV6YD
	 IbTgR+RFlr2VThHcptPYgDTPAz1y8AtAbncHsPG/s+fEKwhG6gSCS0O4zgDFHxafC3
	 441QJzFarMTmQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VY0LD1Py9z4wnv;
	Mon,  6 May 2024 21:58:44 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <akpm@linux-foundation.org>
Subject: [PATCH] selftests/mm: Fix powerpc ARCH check
Date: Mon,  6 May 2024 21:58:25 +1000
Message-ID: <20240506115825.66415-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.0
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
Cc: linux-mm@kvack.org, broonie@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In commit 0518dbe97fe6 ("selftests/mm: fix cross compilation with LLVM")
the logic to detect the machine architecture in the Makefile was
changed to use ARCH, and only fallback to uname -m if ARCH is unset.
However the tests of ARCH were not updated to account for the fact that
ARCH is "powerpc" for powerpc builds, not "ppc64".

Fix it by changing the checks to look for "powerpc", and change the
uname -m logic to convert "ppc64.*" into "powerpc".

With that fixed the following tests now build for powerpc again:
 * protection_keys
 * va_high_addr_switch
 * virtual_address_range
 * write_to_hugetlbfs

Fixes: 0518dbe97fe6 ("selftests/mm: fix cross compilation with LLVM")
Cc: stable@vger.kernel.org # v6.4+
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/mm/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index eb5f39a2668b..410495e0a611 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -12,7 +12,7 @@ uname_M := $(shell uname -m 2>/dev/null || echo not)
 else
 uname_M := $(shell echo $(CROSS_COMPILE) | grep -o '^[a-z0-9]\+')
 endif
-ARCH ?= $(shell echo $(uname_M) | sed -e 's/aarch64.*/arm64/' -e 's/ppc64.*/ppc64/')
+ARCH ?= $(shell echo $(uname_M) | sed -e 's/aarch64.*/arm64/' -e 's/ppc64.*/powerpc/')
 endif
 
 # Without this, failed build products remain, with up-to-date timestamps,
@@ -98,13 +98,13 @@ TEST_GEN_FILES += $(BINARIES_64)
 endif
 else
 
-ifneq (,$(findstring $(ARCH),ppc64))
+ifneq (,$(findstring $(ARCH),powerpc))
 TEST_GEN_FILES += protection_keys
 endif
 
 endif
 
-ifneq (,$(filter $(ARCH),arm64 ia64 mips64 parisc64 ppc64 riscv64 s390x sparc64 x86_64))
+ifneq (,$(filter $(ARCH),arm64 ia64 mips64 parisc64 powerpc riscv64 s390x sparc64 x86_64))
 TEST_GEN_FILES += va_high_addr_switch
 TEST_GEN_FILES += virtual_address_range
 TEST_GEN_FILES += write_to_hugetlbfs
-- 
2.45.0

