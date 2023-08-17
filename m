Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6827C77FC03
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 18:24:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MciE3ukD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRVhR1cTmz3dTS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 02:24:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MciE3ukD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRVdf75FKz30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 02:22:14 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 452BE61D27;
	Thu, 17 Aug 2023 16:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6FE4C433CD;
	Thu, 17 Aug 2023 16:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692289330;
	bh=bEO96ljS1/o33mzXdKJWmUmmPUIU9/aI3Zh9UJ27ksI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MciE3ukDN5Ni+2/vDAZwZuKDL8/jzAaalk/+3dBcjWFherkHKJKkB2z+bN3kYUvSi
	 KqZdnCEBlxmeocTioNyWHAQuLOs1SMcDB4S2XU0QhM2hACAXFJ97h7U6ttHefsAH9Z
	 cELSpQ9f9p2Z+r5V5nIfTLwIKqZsiSz27w6sIV3wNj5XNSBJI9IRlm7DJvGYcKBCEt
	 /yb7s2wxwUUCPsJTiozNJhzRLb2JRuGRPMDy8f2gjat5cFbVXTt1qnkIesYzdkQgmb
	 MV2XE7OBfW7UTg6ukBXxaEZNOL8kwv3kyn4DpgwaLw/HQq/Yi9Oyx93gMdT5VJohs3
	 nvuBQK5aft70Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876C9C41513;
	Thu, 17 Aug 2023 16:22:10 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Thu, 17 Aug 2023 11:21:53 -0500
Subject: [PATCH 2/2] selftests/powerpc: add const qualification where
 possible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230817-powerpc-selftest-misc-v1-2-a84cc1ef78b2@linux.ibm.com>
References: <20230817-powerpc-selftest-misc-v1-0-a84cc1ef78b2@linux.ibm.com>
In-Reply-To: <20230817-powerpc-selftest-misc-v1-0-a84cc1ef78b2@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692289329; l=3437;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=cXmcYeJu/th0ypEBfTe/UbVon+xU8aryVUO4EdX1T54=;
 b=NAesJg3dtI9CrKNCcAOSr08g64hAHFOZ9K8mA/rEkuYfx7frMDT6tvhZPORJHhwV8ildyhEK9
 W996PvVj3fcC/PjtuYlj730F7uftSuOuyIzt5R1wAxcmYV0pBj0o114
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Various char * parameters in the common powerpc selftest APIs can be
const.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 tools/testing/selftests/powerpc/harness.c         |  4 ++--
 tools/testing/selftests/powerpc/include/subunit.h | 16 ++++++++--------
 tools/testing/selftests/powerpc/include/utils.h   |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/powerpc/harness.c b/tools/testing/selftests/powerpc/harness.c
index 0ad4f12b3d43..5876220d8ff2 100644
--- a/tools/testing/selftests/powerpc/harness.c
+++ b/tools/testing/selftests/powerpc/harness.c
@@ -24,7 +24,7 @@
 /* Setting timeout to -1 disables the alarm */
 static uint64_t timeout = 120;
 
-int run_test(int (test_function)(void), char *name)
+int run_test(int (test_function)(void), const char *name)
 {
 	bool terminated;
 	int rc, status;
@@ -101,7 +101,7 @@ void test_harness_set_timeout(uint64_t time)
 	timeout = time;
 }
 
-int test_harness(int (test_function)(void), char *name)
+int test_harness(int (test_function)(void), const char *name)
 {
 	int rc;
 
diff --git a/tools/testing/selftests/powerpc/include/subunit.h b/tools/testing/selftests/powerpc/include/subunit.h
index 068d55fdf80f..b0bb774617c9 100644
--- a/tools/testing/selftests/powerpc/include/subunit.h
+++ b/tools/testing/selftests/powerpc/include/subunit.h
@@ -6,37 +6,37 @@
 #ifndef _SELFTESTS_POWERPC_SUBUNIT_H
 #define _SELFTESTS_POWERPC_SUBUNIT_H
 
-static inline void test_start(char *name)
+static inline void test_start(const char *name)
 {
 	printf("test: %s\n", name);
 }
 
-static inline void test_failure_detail(char *name, char *detail)
+static inline void test_failure_detail(const char *name, const char *detail)
 {
 	printf("failure: %s [%s]\n", name, detail);
 }
 
-static inline void test_failure(char *name)
+static inline void test_failure(const char *name)
 {
 	printf("failure: %s\n", name);
 }
 
-static inline void test_error(char *name)
+static inline void test_error(const char *name)
 {
 	printf("error: %s\n", name);
 }
 
-static inline void test_skip(char *name)
+static inline void test_skip(const char *name)
 {
 	printf("skip: %s\n", name);
 }
 
-static inline void test_success(char *name)
+static inline void test_success(const char *name)
 {
 	printf("success: %s\n", name);
 }
 
-static inline void test_finish(char *name, int status)
+static inline void test_finish(const char *name, int status)
 {
 	if (status)
 		test_failure(name);
@@ -44,7 +44,7 @@ static inline void test_finish(char *name, int status)
 		test_success(name);
 }
 
-static inline void test_set_git_version(char *value)
+static inline void test_set_git_version(const char *value)
 {
 	printf("tags: git_version:%s\n", value);
 }
diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index 36c30c611457..66d7b2368dd4 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -32,7 +32,7 @@ typedef uint16_t u16;
 typedef uint8_t u8;
 
 void test_harness_set_timeout(uint64_t time);
-int test_harness(int (test_function)(void), char *name);
+int test_harness(int (test_function)(void), const char *name);
 
 int read_auxv(char *buf, ssize_t buf_size);
 void *find_auxv_entry(int type, char *auxv);

-- 
2.41.0

