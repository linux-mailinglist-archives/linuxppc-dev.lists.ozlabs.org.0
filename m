Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0636B140068
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 01:02:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zLq62PLyzDrFp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 11:02:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gustavold@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zJFc6mTNzDrB8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 09:07:00 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00GM3ODh045072; Thu, 16 Jan 2020 17:06:58 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xhff12t20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2020 17:06:57 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00GM5Gi8023368;
 Thu, 16 Jan 2020 22:06:56 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 2xhjdvc4km-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2020 22:06:56 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00GM6tbq62128598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jan 2020 22:06:55 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 748F9BE397;
 Thu, 16 Jan 2020 22:06:55 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F992BE394;
 Thu, 16 Jan 2020 22:06:54 +0000 (GMT)
Received: from moss.ibm.com (unknown [9.85.132.38])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jan 2020 22:06:53 +0000 (GMT)
From: Gustavo Luiz Duarte <gustavold@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] selftests/powerpc: Don't rely on segfault to rerun the
 test
Date: Thu, 16 Jan 2020 19:05:31 -0300
Message-Id: <20200116220531.4715-3-gustavold@linux.ibm.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200116220531.4715-1-gustavold@linux.ibm.com>
References: <20200116220531.4715-1-gustavold@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-16_05:2020-01-16,
 2020-01-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 mlxlogscore=922 clxscore=1015
 suspectscore=1 malwarescore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001160175
X-Mailman-Approved-At: Fri, 17 Jan 2020 10:53:19 +1100
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
Cc: mikey@neuling.org, Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The test case tm-signal-context-force-tm expects a segfault to happen on
returning from signal handler, and then does a setcontext() to run the test
again. However, the test doesn't always segfault, causing the test to run a
single time.

This patch fixes the test by putting it within a loop and jumping, via
setcontext, just prior to the loop in case it segfaults. This way we get the
desired behavior (run the test COUNT_MAX times) regardless if it segfaults or
not. This also reduces the use of setcontext for control flow logic, keeping it
only in the segfault handler.

Also, since 'count' is changed within the signal handler, it is declared as
volatile to prevent any compiler optimization getting confused with
asynchronous changes.

Signed-off-by: Gustavo Luiz Duarte <gustavold@linux.ibm.com>
---
 .../powerpc/tm/tm-signal-context-force-tm.c   | 79 +++++++++----------
 1 file changed, 37 insertions(+), 42 deletions(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c b/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c
index 31717625f318..9ff7bdb6d47a 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-context-force-tm.c
@@ -42,9 +42,10 @@
 #endif
 
 /* Setting contexts because the test will crash and we want to recover */
-ucontext_t init_context, main_context;
+ucontext_t init_context;
 
-static int count, first_time;
+/* count is changed in the signal handler, so it must be volatile */
+static volatile int count;
 
 void usr_signal_handler(int signo, siginfo_t *si, void *uc)
 {
@@ -98,11 +99,6 @@ void usr_signal_handler(int signo, siginfo_t *si, void *uc)
 
 void seg_signal_handler(int signo, siginfo_t *si, void *uc)
 {
-	if (count == COUNT_MAX) {
-		/* Return to tm_signal_force_msr() and exit */
-		setcontext(&main_context);
-	}
-
 	count++;
 
 	/* Reexecute the test */
@@ -126,37 +122,40 @@ void tm_trap_test(void)
 	 */
 	getcontext(&init_context);
 
-	/* Allocated an alternative signal stack area */
-	ss.ss_sp = mmap(NULL, SIGSTKSZ, PROT_READ | PROT_WRITE,
-			MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
-	ss.ss_size = SIGSTKSZ;
-	ss.ss_flags = 0;
-
-	if (ss.ss_sp == (void *)-1) {
-		perror("mmap error\n");
-		exit(-1);
-	}
-
-	/* Force the allocation through a page fault */
-	if (madvise(ss.ss_sp, SIGSTKSZ, MADV_DONTNEED)) {
-		perror("madvise\n");
-		exit(-1);
-	}
-
-	/* Setting an alternative stack to generate a page fault when
-	 * the signal is raised.
-	 */
-	if (sigaltstack(&ss, NULL)) {
-		perror("sigaltstack\n");
-		exit(-1);
+	while (count < COUNT_MAX) {
+		/* Allocated an alternative signal stack area */
+		ss.ss_sp = mmap(NULL, SIGSTKSZ, PROT_READ | PROT_WRITE,
+				MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
+		ss.ss_size = SIGSTKSZ;
+		ss.ss_flags = 0;
+
+		if (ss.ss_sp == (void *)-1) {
+			perror("mmap error\n");
+			exit(-1);
+		}
+
+		/* Force the allocation through a page fault */
+		if (madvise(ss.ss_sp, SIGSTKSZ, MADV_DONTNEED)) {
+			perror("madvise\n");
+			exit(-1);
+		}
+
+		/* Setting an alternative stack to generate a page fault when
+		 * the signal is raised.
+		 */
+		if (sigaltstack(&ss, NULL)) {
+			perror("sigaltstack\n");
+			exit(-1);
+		}
+
+		/* The signal handler will enable MSR_TS */
+		sigaction(SIGUSR1, &usr_sa, NULL);
+		/* If it does not crash, it might segfault, avoid it to retest */
+		sigaction(SIGSEGV, &seg_sa, NULL);
+
+		raise(SIGUSR1);
+		count++;
 	}
-
-	/* The signal handler will enable MSR_TS */
-	sigaction(SIGUSR1, &usr_sa, NULL);
-	/* If it does not crash, it will segfault, avoid it to retest */
-	sigaction(SIGSEGV, &seg_sa, NULL);
-
-	raise(SIGUSR1);
 }
 
 int tm_signal_context_force_tm(void)
@@ -169,11 +168,7 @@ int tm_signal_context_force_tm(void)
 	 */
 	SKIP_IF(!is_ppc64le());
 
-	/* Will get back here after COUNT_MAX interactions */
-	getcontext(&main_context);
-
-	if (!first_time++)
-		tm_trap_test();
+	tm_trap_test();
 
 	return EXIT_SUCCESS;
 }
-- 
2.21.0

