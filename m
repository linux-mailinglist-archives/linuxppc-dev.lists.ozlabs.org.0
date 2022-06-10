Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C1A54700C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 01:37:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKcnd2DtRz3cB3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 09:37:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WX+rCHJ8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WX+rCHJ8;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKclg432hz2yyh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 09:35:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654904143; x=1686440143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ERLwkkEZpG4vAVBowWhSWiEDw3prKfNk8Uv0IINg8GY=;
  b=WX+rCHJ8T17ccRs67MMlFE+gKNULayHb+A1OVyWk0joHn1BV59SgpyqE
   r6GFHASp57j99Q+IRRAZ7i7be0Eb6v/8wF8XaIRLUOWJgbz0DsudXllWO
   AroDeLgHN8UOtwNnexEe5ppVwciCr21URkSZj9iMw83ODC4b9HqR5ANcO
   m4bYO0LvqfvmtWdefBjojsFEm5SUr5dyWrcpb1LxE8X74UMwHUb66hDwv
   ap7clIDkYUXt2UpFkwlJtFh4FZiLeA2DXcpTu7H+JyvaYjE1lMcxD9czR
   /pRFd6u7VXgVn+Yz07mq5Yf2HTnVdWPg4P/jTtsS4X9vvK9QZ1r8DBDkw
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="278909244"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="278909244"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 16:35:36 -0700
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; 
   d="scan'208";a="760716836"
Received: from pleung-mobl1.amr.corp.intel.com (HELO localhost) ([10.212.33.34])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 16:35:36 -0700
From: ira.weiny@intel.com
To: linux-api@vger.kernel.org
Subject: [RFC PATCH 1/6] testing/pkeys: Add command line options
Date: Fri, 10 Jun 2022 16:35:28 -0700
Message-Id: <20220610233533.3649584-2-ira.weiny@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610233533.3649584-1-ira.weiny@intel.com>
References: <20220610233533.3649584-1-ira.weiny@intel.com>
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
Cc: x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, Sohil Mehta <sohil.mehta@intel.com>, Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

It is more convenient to use command line options for debug and
iterations vs changing the code and recompiling.

Add command line options for debug level and number of iterations.

$ ./protection_keys_64 -h
Usage: ./protection_keys_64 [-h,-d,-i <iter>]
        --help,-h   This help
	--debug,-d  Increase debug level for each -d
	--iterations,-i <iter>  repeate test <iter> times
		default: 22

Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 tools/testing/selftests/vm/pkey-helpers.h    |  7 +--
 tools/testing/selftests/vm/protection_keys.c | 59 +++++++++++++++++---
 2 files changed, 55 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/vm/pkey-helpers.h b/tools/testing/selftests/vm/pkey-helpers.h
index 92f3be3dd8e5..7aaac1c8ebca 100644
--- a/tools/testing/selftests/vm/pkey-helpers.h
+++ b/tools/testing/selftests/vm/pkey-helpers.h
@@ -23,9 +23,8 @@
 
 #define PTR_ERR_ENOTSUP ((void *)-ENOTSUP)
 
-#ifndef DEBUG_LEVEL
-#define DEBUG_LEVEL 0
-#endif
+extern int debug_level;
+
 #define DPRINT_IN_SIGNAL_BUF_SIZE 4096
 extern int dprint_in_signal;
 extern char dprint_in_signal_buffer[DPRINT_IN_SIGNAL_BUF_SIZE];
@@ -58,7 +57,7 @@ static inline void sigsafe_printf(const char *format, ...)
 	}
 }
 #define dprintf_level(level, args...) do {	\
-	if (level <= DEBUG_LEVEL)		\
+	if (level <= debug_level)		\
 		sigsafe_printf(args);		\
 } while (0)
 #define dprintf0(args...) dprintf_level(0, args)
diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
index 291bc1e07842..d0183c381859 100644
--- a/tools/testing/selftests/vm/protection_keys.c
+++ b/tools/testing/selftests/vm/protection_keys.c
@@ -44,9 +44,13 @@
 #include <unistd.h>
 #include <sys/ptrace.h>
 #include <setjmp.h>
+#include <getopt.h>
 
 #include "pkey-helpers.h"
 
+#define DEFAULT_ITERATIONS 22
+
+int debug_level;
 int iteration_nr = 1;
 int test_nr;
 
@@ -361,7 +365,7 @@ void signal_handler(int signum, siginfo_t *si, void *vucontext)
 	 * here.
 	 */
 	dprintf1("pkey_reg_xstate_offset: %d\n", pkey_reg_xstate_offset());
-	if (DEBUG_LEVEL > 4)
+	if (debug_level > 4)
 		dump_mem(pkey_reg_ptr - 128, 256);
 	pkey_assert(*pkey_reg_ptr);
 #endif /* arch */
@@ -480,7 +484,7 @@ int sys_mprotect_pkey(void *ptr, size_t size, unsigned long orig_prot,
 		dprintf2("SYS_mprotect_key sret: %d\n", sret);
 		dprintf2("SYS_mprotect_key prot: 0x%lx\n", orig_prot);
 		dprintf2("SYS_mprotect_key failed, errno: %d\n", errno);
-		if (DEBUG_LEVEL >= 2)
+		if (debug_level >= 2)
 			perror("SYS_mprotect_pkey");
 	}
 	return sret;
@@ -1116,7 +1120,7 @@ void test_kernel_write_of_write_disabled_region(int *ptr, u16 pkey)
 	pkey_write_deny(pkey);
 	ret = read(test_fd, ptr, 100);
 	dprintf1("read ret: %d\n", ret);
-	if (ret < 0 && (DEBUG_LEVEL > 0))
+	if (ret < 0 && (debug_level > 0))
 		perror("verbose read result (OK for this to be bad)");
 	pkey_assert(ret);
 }
@@ -1155,7 +1159,7 @@ void test_kernel_gup_write_to_write_disabled_region(int *ptr, u16 pkey)
 	pkey_write_deny(pkey);
 	futex_ret = syscall(SYS_futex, ptr, FUTEX_WAIT, some_int-1, NULL,
 			&ignored, ignored);
-	if (DEBUG_LEVEL > 0)
+	if (debug_level > 0)
 		perror("futex");
 	dprintf1("futex() ret: %d\n", futex_ret);
 }
@@ -1626,11 +1630,52 @@ void pkey_setup_shadow(void)
 	shadow_pkey_reg = __read_pkey_reg();
 }
 
-int main(void)
+static void print_help_and_exit(char *argv0)
+{
+	printf("Usage: %s [-h,-d,-i <iter>]\n", argv0);
+	printf("	--help,-h   This help\n");
+	printf("	--debug,-d  Increase debug level for each -d\n");
+	printf("	--iterations,-i <iter>  repeate test <iter> times\n");
+	printf("		default: %d\n", DEFAULT_ITERATIONS);
+	printf("\n");
+}
+
+int main(int argc, char *argv[])
 {
-	int nr_iterations = 22;
-	int pkeys_supported = is_pkeys_supported();
+	int nr_iterations = DEFAULT_ITERATIONS;
+	int pkeys_supported;
+
+	while (1) {
+		static struct option long_options[] = {
+			{"help",	no_argument,		0,	'h' },
+			{"debug",	no_argument,		0,	'd' },
+			{"iterations",	required_argument,	0,	'i' },
+			{0,		0,			0,	0 }
+		};
+		int option_index = 0;
+		int c;
+
+		c = getopt_long(argc, argv, "hdi:", long_options, &option_index);
+		if (c == -1)
+			break;
+
+		switch (c) {
+		case 'h':
+			print_help_and_exit(argv[0]);
+			return 0;
+		case 'd':
+			debug_level++;
+			break;
+		case 'i':
+			nr_iterations = strtoul(optarg, NULL, 0);
+			break;
+		default:
+			print_help_and_exit(argv[0]);
+			exit(-1);
+		}
+	}
 
+	pkeys_supported = is_pkeys_supported();
 	srand((unsigned int)time(NULL));
 
 	setup_handlers();
-- 
2.35.1

