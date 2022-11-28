Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5932863A08B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 05:23:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLC4q1j82z3fD9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 15:23:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZMze0eDf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZMze0eDf;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLC1s1rzSz3cJY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 15:20:32 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS2MZZ5016588;
	Mon, 28 Nov 2022 04:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tV/ZSbf6YsXyd9f1RIzDvuowKYXsiD/d3TFeujuftyk=;
 b=ZMze0eDfUfmYcOgfWqlpmC3keLgj8pXlSdLB2oSN8CCHzb4JzYsC+Eh3h0RKpSohFCDy
 R7YL3gvjitRR7ErFH3O5fK+tOJpuffP4MdgyF7bykffQhUEUmITXAmimh5v6eaeD+ADP
 OBdIeyBOypC3whijqzb9vp+lh4d/0is7ota0W/veyDAYXqKm1A9BocTd1RSlpuSt5PJX
 JL6cRvTbPeXlVxbNFZNlGW4Gbi6z6zdoGcZrS3yUSXtyrSaGn/PTgTMXSantBjlFyqxr
 RnjfLr5+UHUehh+MZ/31Np1lFfuV0dlWfJheTiZhp/8CjUQHEP2p8811dUKvoOmmwjsi vw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vmr587w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 04:20:30 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AS45SMY025479;
	Mon, 28 Nov 2022 04:20:28 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3m3ae99wq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 04:20:27 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AS4L8pD12845806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 04:21:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5C2A11C052;
	Mon, 28 Nov 2022 04:20:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0729E11C04A;
	Mon, 28 Nov 2022 04:20:25 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 04:20:24 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E7173600D5;
	Mon, 28 Nov 2022 15:20:22 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/7] selftests/powerpc: Use mfspr/mtspr macros
Date: Mon, 28 Nov 2022 15:19:42 +1100
Message-Id: <20221128041948.58339-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128041948.58339-1-bgray@linux.ibm.com>
References: <20221128041948.58339-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: to_PilLVVM3znbO-DyLAy7orIeUXJChc
X-Proofpoint-ORIG-GUID: to_PilLVVM3znbO-DyLAy7orIeUXJChc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_04,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 mlxscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211280026
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

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
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

