Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B787A9208
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 09:27:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rr3oPnwn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrn6F5C9nz3cH4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 17:27:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rr3oPnwn;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrn5N2JkQz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 17:26:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1695281192;
	bh=DL8YQ5E8Zv2eZGMa34HZreA4MM1po6Pq4Ubem3mz4wk=;
	h=From:To:Cc:Subject:Date:From;
	b=rr3oPnwnGwBUfGBN0YhjJfwFk6yaDy62debC2Rb8kgDzD5hQnCoEvoPDP8eEL4C/H
	 J0eEjae3Kg4KwYax7kmerM4W6XHW0cKjSZpzGf3th//c7p0U0ELDjXkxlrl5wRhYvr
	 4fqEVlqGHReRHAHT1KDdC/UnKpxBoJWDJS18rFOlil0EEC669ao+UhlWVi5VW8EqQ3
	 mIQMkuuAclpMJ3psIN/fRG0Rq/mIWWPNF5FVkbOIMegAoPGZ6e+O8wQRFU+KZuiVFJ
	 /5tb5/E3uMPBCmcBWZhtSgvTRclT1x6n4a8BfZ+O/0C6p/Cfok3Gre1WI9WdoQ4rxC
	 jln558KihtYdQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rrn5M6TMFz4xPR;
	Thu, 21 Sep 2023 17:26:31 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] selftests/powerpc: Fix emit_tests to work with run_kselftest.sh
Date: Thu, 21 Sep 2023 17:26:10 +1000
Message-ID: <20230921072623.828772-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
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
Cc: keescook@chromium.org, linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to use run_kselftest.sh the list of tests must be emitted to
populate kselftest-list.txt.

The powerpc Makefile is written to use EMIT_TESTS. But support for
EMIT_TESTS was dropped in commit d4e59a536f50 ("selftests: Use runner.sh
for emit targets"). Although prior to that commit a548de0fe8e1
("selftests: lib.mk: add test execute bit check to EMIT_TESTS") had
already broken run_kselftest.sh for powerpc due to the executable check
using the wrong path.

It can be fixed by replacing the EMIT_TESTS definitions with actual
emit_tests rules in the powerpc Makefiles. This makes run_kselftest.sh
able to run powerpc tests:

  $ cd linux
  $ export ARCH=powerpc
  $ export CROSS_COMPILE=powerpc64le-linux-gnu-
  $ make headers
  $ make -j -C tools/testing/selftests install
  $ grep -c "^powerpc" tools/testing/selftests/kselftest_install/kselftest-list.txt
  182

Fixes: d4e59a536f50 ("selftests: Use runner.sh for emit targets")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/Makefile     |  7 +++----
 tools/testing/selftests/powerpc/pmu/Makefile | 11 ++++++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

I'll plan to merge this via the powerpc tree.

cheers

diff --git a/tools/testing/selftests/powerpc/Makefile b/tools/testing/selftests/powerpc/Makefile
index 49f2ad1793fd..7ea42fa02eab 100644
--- a/tools/testing/selftests/powerpc/Makefile
+++ b/tools/testing/selftests/powerpc/Makefile
@@ -59,12 +59,11 @@ override define INSTALL_RULE
 	done;
 endef
 
-override define EMIT_TESTS
+emit_tests:
 	+@for TARGET in $(SUB_DIRS); do \
 		BUILD_TARGET=$(OUTPUT)/$$TARGET;	\
-		$(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET emit_tests;\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET $@;\
 	done;
-endef
 
 override define CLEAN
 	+@for TARGET in $(SUB_DIRS); do \
@@ -77,4 +76,4 @@ endef
 tags:
 	find . -name '*.c' -o -name '*.h' | xargs ctags
 
-.PHONY: tags $(SUB_DIRS)
+.PHONY: tags $(SUB_DIRS) emit_tests
diff --git a/tools/testing/selftests/powerpc/pmu/Makefile b/tools/testing/selftests/powerpc/pmu/Makefile
index 2b95e44d20ff..a284fa874a9f 100644
--- a/tools/testing/selftests/powerpc/pmu/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/Makefile
@@ -30,13 +30,14 @@ override define RUN_TESTS
 	+TARGET=event_code_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET run_tests
 endef
 
-DEFAULT_EMIT_TESTS := $(EMIT_TESTS)
-override define EMIT_TESTS
-	$(DEFAULT_EMIT_TESTS)
+emit_tests:
+	for TEST in $(TEST_GEN_PROGS); do \
+		BASENAME_TEST=`basename $$TEST`;	\
+		echo "$(COLLECTION):$$BASENAME_TEST";	\
+	done
 	+TARGET=ebb; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET emit_tests
 	+TARGET=sampling_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET emit_tests
 	+TARGET=event_code_tests; BUILD_TARGET=$$OUTPUT/$$TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -s -C $$TARGET emit_tests
-endef
 
 DEFAULT_INSTALL_RULE := $(INSTALL_RULE)
 override define INSTALL_RULE
@@ -64,4 +65,4 @@ sampling_tests:
 event_code_tests:
 	TARGET=$@; BUILD_TARGET=$$OUTPUT/$$TARGET; mkdir -p $$BUILD_TARGET; $(MAKE) OUTPUT=$$BUILD_TARGET -k -C $$TARGET all
 
-.PHONY: all run_tests ebb sampling_tests event_code_tests
+.PHONY: all run_tests ebb sampling_tests event_code_tests emit_tests
-- 
2.41.0

