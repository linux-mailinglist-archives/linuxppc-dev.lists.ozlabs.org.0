Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B75E0229029
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 07:54:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBPnB6mdJzDqwP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 15:54:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBPlL4rZPzDqLd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 15:53:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=l7d9EYRi; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BBPlL3dqtz9sPB; Wed, 22 Jul 2020 15:53:18 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BBPlL2rclz9sRN; Wed, 22 Jul 2020 15:53:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595397198;
 bh=J6Oyelo4ndRmF79lExjeI93zEWZs53TowxpRUWU0e1E=;
 h=From:To:Subject:Date:From;
 b=l7d9EYRi8LYBAEKp7v4jRcrqOBdkfqzMgELLv6jw1hbVTHLa6xHbV8rAmj1SyQiOr
 Li5vTmY6LgRd5u1XHWDHt4nalEUt5/9Mrhnw4O4qM+A1FMAP/HyzAIGdUc92HVZg3g
 o5ZVtC19Xmopt7SCCpVn2HsD9CBMX+XNgZHbwjM21oA9P5e1h3W7DRBoVWxGU42aPh
 yA7qNJDTjev9mDda3KOZSe/MlIPFiKB13POBz31zqZa7CWbJI/yTBbwTChm/7RZu9i
 PZwxT76kJWjo2mO7X3Rj3MkAbC2L+6FwSQ4gLz1t40oPg3L8mQhuTq9EXqQD+ZzJ8E
 S40MYj7WbuwuQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] selftests/powerpc: Add test of memcmp at end of page
Date: Wed, 22 Jul 2020 15:53:15 +1000
Message-Id: <20200722055315.962391-1-mpe@ellerman.id.au>
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

Update our memcmp selftest, to test the case where we're comparing up
to the end of a page and the subsequent page is not mapped. We have to
make sure we don't read off the end of the page and cause a fault.

We had a bug there in the past, fixed in commit
d9470757398a ("powerpc/64: Fix memcmp reading past the end of src/dest").

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../selftests/powerpc/stringloops/memcmp.c    | 40 ++++++++++---------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/powerpc/stringloops/memcmp.c b/tools/testing/selftests/powerpc/stringloops/memcmp.c
index b1fa7546957f..e4605ca850dc 100644
--- a/tools/testing/selftests/powerpc/stringloops/memcmp.c
+++ b/tools/testing/selftests/powerpc/stringloops/memcmp.c
@@ -2,6 +2,7 @@
 #include <malloc.h>
 #include <stdlib.h>
 #include <string.h>
+#include <sys/mman.h>
 #include <time.h>
 #include "utils.h"
 
@@ -13,6 +14,9 @@
 #define LARGE_MAX_OFFSET 32
 #define LARGE_SIZE_START 4096
 
+/* This is big enough to fit LARGE_SIZE and works on 4K & 64K kernels */
+#define MAP_SIZE (64 * 1024)
+
 #define MAX_OFFSET_DIFF_S1_S2 48
 
 int vmx_count;
@@ -68,25 +72,25 @@ static void test_one(char *s1, char *s2, unsigned long max_offset,
 
 static int testcase(bool islarge)
 {
-	char *s1;
-	char *s2;
-	unsigned long i;
-
-	unsigned long comp_size = (islarge ? LARGE_SIZE : SIZE);
-	unsigned long alloc_size = comp_size + MAX_OFFSET_DIFF_S1_S2;
-	int iterations = islarge ? LARGE_ITERATIONS : ITERATIONS;
-
-	s1 = memalign(128, alloc_size);
-	if (!s1) {
-		perror("memalign");
-		exit(1);
-	}
+	unsigned long i, comp_size, alloc_size;
+	char *p, *s1, *s2;
+	int iterations;
 
-	s2 = memalign(128, alloc_size);
-	if (!s2) {
-		perror("memalign");
-		exit(1);
-	}
+	comp_size = (islarge ? LARGE_SIZE : SIZE);
+	alloc_size = comp_size + MAX_OFFSET_DIFF_S1_S2;
+	iterations = islarge ? LARGE_ITERATIONS : ITERATIONS;
+
+	p = mmap(NULL, 4 * MAP_SIZE, PROT_READ | PROT_WRITE,
+		 MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	FAIL_IF(p == MAP_FAILED);
+
+	/* Put s1/s2 at the end of a page */
+	s1 = p + MAP_SIZE - alloc_size;
+	s2 = p + 3 * MAP_SIZE - alloc_size;
+
+	/* And unmap the subsequent page to force a fault if we overread */
+	munmap(p + MAP_SIZE, MAP_SIZE);
+	munmap(p + 3 * MAP_SIZE, MAP_SIZE);
 
 	srandom(time(0));
 
-- 
2.25.1

