Return-Path: <linuxppc-dev+bounces-5175-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB02A0BE52
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 18:07:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWzG06Tyrz3ckk;
	Tue, 14 Jan 2025 04:07:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736788040;
	cv=none; b=b5yxtiv8caNMz1dZsM5owCs8rykn/89PkAPqW/52U4eTwv8ymnwV8X89tmEvRVQo0owbyjj4HH7Tm8UeAoCbks6itSXHo270W/Ut6nsImP3lLtRnMtZO9PUh/ZL4BO5RZ9UcITkxNsOmDqHsqXrkH9gZSfpNDjNdxTRHHPX8BSWEZWKol7IOJP4+Thru7kBxrU70rPJGIbGzpuWP8Jc4PFy68iMwQl1qgwxrlqcPyVJTaKe35nwbeCnE5IIj2OL1q3wZahbBcc6Kk7rQBUk19hhoYGpH7/1jMSWs7xmMOwEVyZCtiZ+N4Qw7h1Y5tH3KWF8VZy/ADgKO0T3lGt9uEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736788040; c=relaxed/relaxed;
	bh=+b1vwyUt9X+x+fq4vNsQWkXSJqfTlOBMiVr4yBA8vrE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ELiipQ0d5W7FzTccm67Ey9DI+DNpEzIJJ0LbMzCxLMb19jCkrRwU9Ql4O6Z+0pl2zjc7bS7cVJ9SApZBzhIFLGk3s4tPjj8GbW60dUrcHjmllt7qRk3RPjsXHppWhhXxezLcdDEwac7ZfvBAJNoAVc4ofQd1kGvWcaczBRot/24MlFEiIhaQFNHIbYOUGr85m7i/T2XETup91zdUWvgEPi2JNM1s5w8l91jwZMzN/cCGKBmE1lNCRmxs37xWsQByz2Tn/l3psZ0wqQ3oHtUz4ft0IeRbmwXy5O/b1/nEU/cdcj2aSHqqiJmgNlt8Ai7x/Mta6ogdOM5Jfa3WKAIzAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWzFz4phXz3cgt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 04:07:19 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA6671A25;
	Mon, 13 Jan 2025 09:07:16 -0800 (PST)
Received: from udebian.localdomain (unknown [10.1.25.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D4483F673;
	Mon, 13 Jan 2025 09:06:46 -0800 (PST)
From: Yury Khrustalev <yury.khrustalev@arm.com>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sandipan Das <sandipan@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	nd@arm.com,
	Yury Khrustalev <yury.khrustalev@arm.com>
Subject: [RESEND v4 2/3] selftests/mm: Use PKEY_UNRESTRICTED macro
Date: Mon, 13 Jan 2025 17:06:18 +0000
Message-Id: <20250113170619.484698-3-yury.khrustalev@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250113170619.484698-1-yury.khrustalev@arm.com>
References: <20250113170619.484698-1-yury.khrustalev@arm.com>
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
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
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
index f7cfe163b0ff..10fa3ca9b05b 100644
--- a/tools/testing/selftests/mm/pkey-helpers.h
+++ b/tools/testing/selftests/mm/pkey-helpers.h
@@ -12,6 +12,7 @@
 #include <stdlib.h>
 #include <ucontext.h>
 #include <sys/mman.h>
+#include <linux/mman.h>
 
 #include "../kselftest.h"
 
@@ -224,7 +225,7 @@ static inline u32 *siginfo_get_pkey_ptr(siginfo_t *si)
 static inline int kernel_has_pkeys(void)
 {
 	/* try allocating a key and see if it succeeds */
-	int ret = sys_pkey_alloc(0, 0);
+	int ret = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 	if (ret <= 0) {
 		return 0;
 	}
diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
index c593a426341c..2015ed7e0928 100644
--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
+++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -314,7 +314,7 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
 	__write_pkey_reg(pkey_reg);
 
 	/* Protect the new stack with MPK 1 */
-	pkey = pkey_alloc(0, 0);
+	pkey = pkey_alloc(0, PKEY_UNRESTRICTED);
 	pkey_mprotect(stack, STACK_SIZE, PROT_READ | PROT_WRITE, pkey);
 
 	/* Set up alternate signal stack that will use the default MPK */
@@ -487,7 +487,7 @@ static void test_pkru_sigreturn(void)
 	__write_pkey_reg(pkey_reg);
 
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


