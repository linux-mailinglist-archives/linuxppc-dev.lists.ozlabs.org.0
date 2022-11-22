Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4260F633592
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 08:00:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGZrq0zxMz3f3c
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 18:00:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IFdqcmgL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IFdqcmgL;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGZpv1bDbz2y84
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 17:58:30 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM6CON7003244;
	Tue, 22 Nov 2022 06:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BMKNvTh02cobOQWOt7/mH/g7CloO39YcqJUKPgMvjb0=;
 b=IFdqcmgLHJQg7krt2HDYfoIuRSS80UWP4OEKCj+x3pIn9geCj9k5EvNMFkoLbEGVrWur
 QXSYAks7xMoCuzsCnsTtb64o3DZ40jOG9WNWJDpKGAuvtNcg2HSbGfLhdMtU3vIMpHNY
 /GVN2VRiMtfY5E1V/jj/bRXf/vxkuZJ3NLBkjOjG13bTh6vdWm5c869JlPEKGXL8KPSW
 mPDyghLVFhvHRytUXicTyXypd4wyxqXf5kPzxg+Xovs5P2Xw3iAxgBQ30h9rkUGyQ/1h
 tpydM+NHOPyqGPWl9yC/BnvzUfXDcWg7E8YLgMu1GSrR59kvPyozv/D/r4vBdodnBvGq Tg== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0rxprx6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 06:58:28 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AM6oObf003989;
	Tue, 22 Nov 2022 06:58:26 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma01fra.de.ibm.com with ESMTP id 3kxps92r2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 06:58:26 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AM6wN5t7930418
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 06:58:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A4F6A4055;
	Tue, 22 Nov 2022 06:58:23 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 809FBA4053;
	Tue, 22 Nov 2022 06:58:22 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 22 Nov 2022 06:58:22 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (unknown [9.177.66.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6EDF76032A;
	Tue, 22 Nov 2022 17:58:17 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 1/7] selftests/powerpc: Use mfspr/mtspr macros
Date: Tue, 22 Nov 2022 17:57:20 +1100
Message-Id: <20221122065726.100111-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122065726.100111-1-bgray@linux.ibm.com>
References: <20221122065726.100111-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dS9KriPgC0t3-VREzG7n_TBJm3STggp6
X-Proofpoint-GUID: dS9KriPgC0t3-VREzG7n_TBJm3STggp6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 mlxlogscore=951 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220047
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
Cc: Benjamin Gray <bgray@linux.ibm.com>, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No need to write inline asm for mtspr/mfspr, we have macros for this
in reg.h
---
 tools/testing/selftests/powerpc/dscr/dscr.h     | 17 +++++------------
 .../selftests/powerpc/ptrace/ptrace-hwbreak.c   |  6 ++----
 tools/testing/selftests/powerpc/ptrace/ptrace.h |  5 +----
 .../selftests/powerpc/security/flush_utils.c    |  3 ++-
 4 files changed, 10 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/powerpc/dscr/dscr.h b/tools/testing/selftests/powerpc/dscr/dscr.h
index 13e9b9e28e2c..b703714e7d98 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr.h
+++ b/tools/testing/selftests/powerpc/dscr/dscr.h
@@ -23,6 +23,7 @@
 #include <sys/stat.h>
 #include <sys/wait.h>
 
+#include "reg.h"
 #include "utils.h"
 
 #define THREADS		100	/* Max threads */
@@ -41,31 +42,23 @@
 /* Prilvilege state DSCR access */
 inline unsigned long get_dscr(void)
 {
-	unsigned long ret;
-
-	asm volatile("mfspr %0,%1" : "=r" (ret) : "i" (SPRN_DSCR_PRIV));
-
-	return ret;
+	return mfspr(SPRN_DSCR_PRIV);
 }
 
 inline void set_dscr(unsigned long val)
 {
-	asm volatile("mtspr %1,%0" : : "r" (val), "i" (SPRN_DSCR_PRIV));
+	mtspr(SPRN_DSCR_PRIV, val);
 }
 
 /* Problem state DSCR access */
 inline unsigned long get_dscr_usr(void)
 {
-	unsigned long ret;
-
-	asm volatile("mfspr %0,%1" : "=r" (ret) : "i" (SPRN_DSCR));
-
-	return ret;
+	return mfspr(SPRN_DSCR);
 }
 
 inline void set_dscr_usr(unsigned long val)
 {
-	asm volatile("mtspr %1,%0" : : "r" (val), "i" (SPRN_DSCR));
+	mtspr(SPRN_DSCR, val);
 }
 
 /* Default DSCR access */
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
index a0635a3819aa..1345e9b9af0f 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
@@ -23,6 +23,7 @@
 #include <sys/syscall.h>
 #include <linux/limits.h>
 #include "ptrace.h"
+#include "reg.h"
 
 #define SPRN_PVR	0x11F
 #define PVR_8xx		0x00500000
@@ -620,10 +621,7 @@ static int ptrace_hwbreak(void)
 
 int main(int argc, char **argv, char **envp)
 {
-	int pvr = 0;
-	asm __volatile__ ("mfspr %0,%1" : "=r"(pvr) : "i"(SPRN_PVR));
-	if (pvr == PVR_8xx)
-		is_8xx = true;
+	is_8xx = mfspr(SPRN_PVR) == PVR_8xx;
 
 	return test_harness(ptrace_hwbreak, "ptrace-hwbreak");
 }
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace.h b/tools/testing/selftests/powerpc/ptrace/ptrace.h
index 4e0233c0f2b3..04788e5fc504 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace.h
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace.h
@@ -745,10 +745,7 @@ int show_tm_spr(pid_t child, struct tm_spr_regs *out)
 /* Analyse TEXASR after TM failure */
 inline unsigned long get_tfiar(void)
 {
-	unsigned long ret;
-
-	asm volatile("mfspr %0,%1" : "=r" (ret) : "i" (SPRN_TFIAR));
-	return ret;
+	return mfspr(SPRN_TFIAR);
 }
 
 void analyse_texasr(unsigned long texasr)
diff --git a/tools/testing/selftests/powerpc/security/flush_utils.c b/tools/testing/selftests/powerpc/security/flush_utils.c
index 4d95965cb751..9c5c00e04f63 100644
--- a/tools/testing/selftests/powerpc/security/flush_utils.c
+++ b/tools/testing/selftests/powerpc/security/flush_utils.c
@@ -14,6 +14,7 @@
 #include <string.h>
 #include <stdio.h>
 #include <sys/utsname.h>
+#include "reg.h"
 #include "utils.h"
 #include "flush_utils.h"
 
@@ -79,5 +80,5 @@ void set_dscr(unsigned long val)
 		init = 1;
 	}
 
-	asm volatile("mtspr %1,%0" : : "r" (val), "i" (SPRN_DSCR));
+	mtspr(SPRN_DSCR, val);
 }
-- 
2.38.1

