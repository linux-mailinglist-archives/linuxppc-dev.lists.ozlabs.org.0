Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5461C6E0373
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 03:03:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxhCv1WPZz3fRV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 11:03:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inspur.com (client-ip=210.51.26.146; helo=unicom146.biz-email.net; envelope-from=wangdeming@inspur.com; receiver=<UNKNOWN>)
Received: from unicom146.biz-email.net (unicom146.biz-email.net [210.51.26.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxhCL12S2z3f5Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 11:03:02 +1000 (AEST)
Received: from unicom146.biz-email.net
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id IVP00149;
        Thu, 13 Apr 2023 09:02:49 +0800
Received: from localhost.localdomain.com (10.200.104.82) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server id
 15.1.2507.21; Thu, 13 Apr 2023 09:02:52 +0800
From: Deming Wang <wangdeming@inspur.com>
To: <mpe@ellerman.id.au>, <shuah@kernel.org>
Subject: [PATCH] selftests/powerpc: Replace obsolete memalign() with posix_memalign()
Date: Wed, 12 Apr 2023 21:02:50 -0400
Message-ID: <20230413010250.4254-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.200.104.82]
tUid: 20234130902494f5cc0be4c7a12b8b3835e93dee5f208
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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
Cc: Deming Wang <wangdeming@inspur.com>, linux-kernel@vger.kernel.org, npiggin@gmail.com, linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

memalign() is obsolete according to its manpage.

Replace memalign() with posix_memalign() and remove malloc.h include
that was there for memalign().

As a pointer is passed into posix_memalign(), initialize *s to NULL
to silence a warning about the function's return value being used as
uninitialized (which is not valid anyway because the error is properly
checked before s is returned).

Signed-off-by: Deming Wang <wangdeming@inspur.com>
---
 tools/testing/selftests/powerpc/stringloops/strlen.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/powerpc/stringloops/strlen.c b/tools/testing/selftests/powerpc/stringloops/strlen.c
index 9055ebc484d0..f9c1f9cc2d32 100644
--- a/tools/testing/selftests/powerpc/stringloops/strlen.c
+++ b/tools/testing/selftests/powerpc/stringloops/strlen.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <malloc.h>
 #include <stdlib.h>
 #include <string.h>
 #include <time.h>
@@ -51,10 +50,11 @@ static void bench_test(char *s)
 static int testcase(void)
 {
 	char *s;
+	int ret;
 	unsigned long i;
 
-	s = memalign(128, SIZE);
-	if (!s) {
+	ret = posix_memalign((void **)&s, 128, SIZE);
+	if (ret < 0) {
 		perror("memalign");
 		exit(1);
 	}
-- 
2.27.0

