Return-Path: <linuxppc-dev+bounces-3036-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8229C1884
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 09:55:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlCSm0xWnz3bsY;
	Fri,  8 Nov 2024 19:55:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731056120;
	cv=none; b=QPDg04jcRDTM+o5ev2cYj9+LJsRKJDLz2FuBcQpRTbX/wVFsAmXEm7GK6IuTZWo+HaYSu5qmA9LYbkfczhgm9NIq3Q8kMAKWysZunqaSfL9GPfRXsr4+1RRDSBm4Kk6NsJkYL0pOoqE9eCfDAW6EYcYEz9raef8fLqKaCGTGjgV7hQLrv2OYZ1ltL1pW7ZEiAdk+UPH8IWWQgha7uxHkEGagYRUpGCTfxgAf2YMBdC3THXtkebESAAvRK94JGGIEhq6mUILfGJabjuGrA+vXEvwqLs8SGG0ypBCa0KFsb0iCwfYlbR/QKzQRHwLh8rRVOMgubGRQZXRsY259EJqNaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731056120; c=relaxed/relaxed;
	bh=VtQJmD+1+BoGjJFdDmnjU3yAVzvMU4gkRfxJpUpmJVI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mp2DnsBe3C1m5h1fbTFYs3GCCY4+V72r5IrhlTopd7FbzSgweNvuuytJd6wKQp80kZbTI2bcP2QiolsDgcGJIZ5urQ59/UqtsNOWvGQuEUt+fGoVoc/YmRBugYNpXZ/NXZYWHJzBDXdZ/TZVoNen9HNgR/ijxx0YRJDZ5p/v1gtbSbejOCFUpH2LVB2WQb8JzhLrGPI5bNbuHtHmd3DOPixhiu/yKM82Wvl9PFHIqtZHr9UStfwHZErYVcSbfS69qn4R+/RUw1JkHlisqWfNHG0otVn3WhW4nbfVg/UAIuh1kzDCYp9U/aRCRy4geIbRNVViiyEH5O7T4v3HoxfQKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlCSl0w9Pz2yVD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 19:55:18 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF5DC1063;
	Fri,  8 Nov 2024 00:55:17 -0800 (PST)
Received: from udebian.localdomain (unknown [10.57.26.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1BC93F66E;
	Fri,  8 Nov 2024 00:54:45 -0800 (PST)
From: Yury Khrustalev <yury.khrustalev@arm.com>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sandipan Das <sandipan@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	nd@arm.com,
	Yury Khrustalev <yury.khrustalev@arm.com>
Subject: [PATCH v4 2/3] selftests/mm: Use PKEY_UNRESTRICTED macro
Date: Fri,  8 Nov 2024 08:53:57 +0000
Message-Id: <20241108085358.777687-3-yury.khrustalev@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108085358.777687-1-yury.khrustalev@arm.com>
References: <20241108085358.777687-1-yury.khrustalev@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Replace literal 0 with macro PKEY_UNRESTRICTED where pkey_*() functions
are used in mm selftests for memory protection keys.

Signed-off-by: Yury Khrustalev <yury.khrustalev@arm.com>
Suggested-by: Joey Gouly <joey.gouly@arm.com>
---
 tools/testing/selftests/mm/mseal_test.c            | 6 +++---
 tools/testing/selftests/mm/pkey-helpers.h          | 3 ++-
 tools/testing/selftests/mm/pkey_sighandler_tests.c | 4 ++--
 tools/testing/selftests/mm/protection_keys.c       | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/mm/mseal_test.c b/tools/testing/selftests/mm/mseal_test.c
index 01675c412b2a..30ea37e8ecf8 100644
--- a/tools/testing/selftests/mm/mseal_test.c
+++ b/tools/testing/selftests/mm/mseal_test.c
@@ -218,7 +218,7 @@ bool seal_support(void)
 bool pkey_supported(void)
 {
 #if defined(__i386__) || defined(__x86_64__) /* arch */
-	int pkey = sys_pkey_alloc(0, 0);
+	int pkey = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 
 	if (pkey > 0)
 		return true;
@@ -1671,7 +1671,7 @@ static void test_seal_discard_ro_anon_on_pkey(bool seal)
 	setup_single_address_rw(size, &ptr);
 	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
 
-	pkey = sys_pkey_alloc(0, 0);
+	pkey = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 	FAIL_TEST_IF_FALSE(pkey > 0);
 
 	ret = sys_mprotect_pkey((void *)ptr, size, PROT_READ | PROT_WRITE, pkey);
@@ -1683,7 +1683,7 @@ static void test_seal_discard_ro_anon_on_pkey(bool seal)
 	}
 
 	/* sealing doesn't take effect if PKRU allow write. */
-	set_pkey(pkey, 0);
+	set_pkey(pkey, PKEY_UNRESTRICTED);
 	ret = sys_madvise(ptr, size, MADV_DONTNEED);
 	FAIL_TEST_IF_FALSE(!ret);
 
diff --git a/tools/testing/selftests/mm/pkey-helpers.h b/tools/testing/selftests/mm/pkey-helpers.h
index 9ab6a3ee153b..e7fb0fcfcb05 100644
--- a/tools/testing/selftests/mm/pkey-helpers.h
+++ b/tools/testing/selftests/mm/pkey-helpers.h
@@ -12,6 +12,7 @@
 #include <stdlib.h>
 #include <ucontext.h>
 #include <sys/mman.h>
+#include <linux/mman.h>
 
 #include "../kselftest.h"
 
@@ -217,7 +218,7 @@ static inline u32 *siginfo_get_pkey_ptr(siginfo_t *si)
 static inline int kernel_has_pkeys(void)
 {
 	/* try allocating a key and see if it succeeds */
-	int ret = sys_pkey_alloc(0, 0);
+	int ret = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 	if (ret <= 0) {
 		return 0;
 	}
diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
index a8088b645ad6..76e85d2cf698 100644
--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
+++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -260,7 +260,7 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
 	__write_pkey_reg(0x55555550);
 
 	/* Protect the new stack with MPK 1 */
-	pkey = pkey_alloc(0, 0);
+	pkey = pkey_alloc(0, PKEY_UNRESTRICTED);
 	pkey_mprotect(stack, STACK_SIZE, PROT_READ | PROT_WRITE, pkey);
 
 	/* Set up alternate signal stack that will use the default MPK */
@@ -421,7 +421,7 @@ static void test_pkru_sigreturn(void)
 	__write_pkey_reg(0x55555544);
 
 	/* Protect the stack with MPK 2 */
-	pkey = pkey_alloc(0, 0);
+	pkey = pkey_alloc(0, PKEY_UNRESTRICTED);
 	pkey_mprotect(stack, STACK_SIZE, PROT_READ | PROT_WRITE, pkey);
 
 	/* Set up alternate signal stack that will use the default MPK */
diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
index 4990f7ab4cb7..cca7435a7bc5 100644
--- a/tools/testing/selftests/mm/protection_keys.c
+++ b/tools/testing/selftests/mm/protection_keys.c
@@ -491,7 +491,7 @@ int sys_pkey_alloc(unsigned long flags, unsigned long init_val)
 int alloc_pkey(void)
 {
 	int ret;
-	unsigned long init_val = 0x0;
+	unsigned long init_val = PKEY_UNRESTRICTED;
 
 	dprintf1("%s()::%d, pkey_reg: 0x%016llx shadow: %016llx\n",
 			__func__, __LINE__, __read_pkey_reg(), shadow_pkey_reg);
-- 
2.39.5


