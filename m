Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE82C8ACE62
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 15:36:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RYB2LdTM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNR9J4Wb8z3dK1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 23:36:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RYB2LdTM;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNR7r59X6z3cV9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 23:35:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713792901;
	bh=lGYy+DAVhn//1uZq7YadoT8Fb/965/RcmDnVpIaZqMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RYB2LdTM3NUQeFa8c6X2LY5m6vt+VZz2etXJhJpH33eh9JWjYbGxjmZdB0fSWn+db
	 JIKuBbdw5Fs1CAEajXk3QP3V0NrTfYtM5tOD0tsEa6fz3xl6e6XQJLH9hZZrAWqaSS
	 FZeJFvscxxW5PzzYFQLbpp7d7nN/Sdubw25k+24iqkacDfnqy3mF9At8IaMcz8BTWz
	 5fwUzOtI3pFeyKL1DOzpnU79iY+dkdy4Sb08GWN5e+LxoSfUpf9WExlkRzh++nm7DC
	 4TFSUd2DfvfBH18blY/rSx5PaI11uIP53SWnntgB6KFWYrohZ2qevVHd+jt2myzvU1
	 C0p+vqpaGpaDg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VNR7n2sdTz4wcF;
	Mon, 22 Apr 2024 23:35:01 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 2/2] selftests/powerpc: Install tests in sub-directories
Date: Mon, 22 Apr 2024 23:34:53 +1000
Message-ID: <20240422133453.1793988-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240422133453.1793988-1-mpe@ellerman.id.au>
References: <20240422133453.1793988-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: spoorthy@linux.ibm.com, maddy@linux.ibm.com, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The sources for the powerpc selftests are arranged into sub-directories.
However when the tests are built and installed, the sub-directories are
squashed, losing the structure.

For example, with the current code the result of installing the selftests is:

  $ tree tools/testing/selftests/kselftest_install
  tools/testing/selftests/kselftest_install
  ├── kselftest
  │   ├── ktap_helpers.sh
  │   ├── module.sh
  │   ├── prefix.pl
  │   └── runner.sh
  ├── kselftest-list.txt
  ├── powerpc
  │   ├── alignment_handler
  │   ├── attr_test
  │   ├── back_to_back_ebbs_test
  │   ├── bad_accesses
  │   ├── bhrb_filter_map_test
  │   ├── bhrb_no_crash_wo_pmu_test
  │   ├── blacklisted_events_test
  │   ├── cache_shape
  │   ├── close_clears_pmcc_test
  │   ├── context_switch
  │   ├── copy_first_unaligned
  ...
  │   ├── settings
  ...
  │   └── wild_bctr
  └── run_kselftest.sh

All the powerpc tests are squashed into the single powerpc directory. In
particular, note that there is a single `settings` file, even though
there are multiple settings files in the powerpc selftest sources. One
of the settings files ends up installed, depending on install order,
even if they have different contents.

Similarly if there were two tests with the same name in different
sub-directories they would clobber each other.

Fix it by replicating the directory structure of the source tree into
the install directory. The result being for example:

  $ tree tools/testing/selftests/kselftest_install
  tools/testing/selftests/kselftest_install
  ├── kselftest
  │   ├── ktap_helpers.sh
  │   ├── module.sh
  │   ├── prefix.pl
  │   └── runner.sh
  ├── kselftest-list.txt
  ├── powerpc
  │   ├── alignment
  │   │   ├── alignment_handler
  │   │   └── copy_first_unaligned
  │   ├── benchmarks
  │   │   ├── context_switch
  │   │   ├── exec_target
  │   │   ├── fork
  │   │   ├── futex_bench
  │   │   ├── gettimeofday
  │   │   ├── mmap_bench
  │   │   ├── null_syscall
  │   │   └── settings
  ...
  │   ├── eeh
  │   │   ├── eeh-basic.sh
  │   │   ├── eeh-functions.sh
  │   │   └── settings
  ...
  │   └── vphn
  │       └── test-vphn
  └── run_kselftest.sh

Note multiple settings files in different sub-directories.

This change also has the effect of changing the names of the tests from
the point of view of the kselftest runner. Before the tests are named
eg:

  powerpc:copy_first_unaligned
  powerpc:cache_shape
  powerpc:reg_access_test

After, the test collection names include the sub-directory:

  powerpc/alignment:copy_first_unaligned
  powerpc/cache_shape:cache_shape
  powerpc/pmu/ebb:reg_access_test

That means whereas previously all powerpc tests could be run with:

  $ ./run_kselftest.sh -c powerpc

After the change it's necessary to pass a regex that matches all powerpc
entries, eg:

  $ ./run_kselftest.sh -c "powerpc.*"

The latter form also works before and after the change.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/Makefile     | 4 ++--
 tools/testing/selftests/powerpc/pmu/Makefile | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

v2: Unchanged.

diff --git a/tools/testing/selftests/powerpc/Makefile b/tools/testing/selftests/powerpc/Makefile
index 2f299fd04d2d..b175e94e1901 100644
--- a/tools/testing/selftests/powerpc/Makefile
+++ b/tools/testing/selftests/powerpc/Makefile
@@ -52,14 +52,14 @@ endef
 override define INSTALL_RULE
 	+@for TARGET in $(SUB_DIRS); do \
 		BUILD_TARGET=$(OUTPUT)/$$TARGET;	\
-		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET install;\
+		$(MAKE) OUTPUT=$$BUILD_TARGET INSTALL_PATH=$$INSTALL_PATH/$$TARGET -C $$TARGET install;\
 	done;
 endef
 
 emit_tests:
 	+@for TARGET in $(SUB_DIRS); do \
 		BUILD_TARGET=$(OUTPUT)/$$TARGET;	\
-		$(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET $@;\
+		$(MAKE) OUTPUT=$$BUILD_TARGET COLLECTION=$(COLLECTION)/$$TARGET -s -C $$TARGET $@;\
 	done;
 
 override define CLEAN
diff --git a/tools/testing/selftests/powerpc/pmu/Makefile b/tools/testing/selftests/powerpc/pmu/Makefile
index 773933e5180e..7e9dbf3d0d09 100644
--- a/tools/testing/selftests/powerpc/pmu/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/Makefile
@@ -44,7 +44,7 @@ emit_tests:
 	done
 	+@for TARGET in $(SUB_DIRS); do \
 		BUILD_TARGET=$(OUTPUT)/$$TARGET; \
-		$(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET emit_tests; \
+		$(MAKE) OUTPUT=$$BUILD_TARGET COLLECTION=$(COLLECTION)/$$TARGET -s -C $$TARGET emit_tests; \
 	done;
 
 DEFAULT_INSTALL_RULE := $(INSTALL_RULE)
@@ -52,7 +52,7 @@ override define INSTALL_RULE
 	$(DEFAULT_INSTALL_RULE)
 	+@for TARGET in $(SUB_DIRS); do \
 		BUILD_TARGET=$(OUTPUT)/$$TARGET; \
-		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET install; \
+		$(MAKE) OUTPUT=$$BUILD_TARGET INSTALL_PATH=$$INSTALL_PATH/$$TARGET -C $$TARGET install; \
 	done;
 endef
 
-- 
2.44.0

