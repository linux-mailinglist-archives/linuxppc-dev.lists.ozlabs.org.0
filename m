Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2489F634AF0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 00:14:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NH0TN0SFkz3f69
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 10:14:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RVVip42u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RVVip42u;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NH0QH67x1z3bjf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 10:12:07 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AMLcjvs010187;
	Tue, 22 Nov 2022 23:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9MDIjUjYuVxLTXyvL105DMlhJktJe/t9XHzMWtIoyJE=;
 b=RVVip42u49BUnJDk6Yc4mBas2T9HAH06ywOZetlNFMJzxBZGQYibtmOD/W/Ds5pto/rJ
 qtIefBAprjNPot7hth8kVID2or3zPAgqTdz4UZgBb+L0hFfBPp0YzQcyLyfNwLAn2M7J
 3uOycrXEeiV7fYRYpDe3IK199lxjBgGLSuaP/PyTo7Lbtc9rs1HaJDBfC9OE68Yff6P6
 kgCN8aXExZO8IDSkDIX6jhpT74tXHUpmqWn2zhTe8RHMs9nkEc81d0Bl9szVLv7TAh+T
 W6HJ/4vFj2l33X5c9T5C38CYtbITrPYlrsGUO9vzsUuQjtKO3DNNqr/2hv6GPRc/fgNZ Iw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m10bkuk2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 23:12:04 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AMN4agF015008;
	Tue, 22 Nov 2022 23:12:02 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma05fra.de.ibm.com with ESMTP id 3kxps8khxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 23:12:02 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AMNCfAh44957974
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 23:12:41 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 03E4942045;
	Tue, 22 Nov 2022 23:12:00 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 597F14203F;
	Tue, 22 Nov 2022 23:11:59 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 22 Nov 2022 23:11:59 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AE39F6040B;
	Wed, 23 Nov 2022 10:11:56 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/7] selftests/powerpc: Use mfspr/mtspr macros
Date: Wed, 23 Nov 2022 10:10:57 +1100
Message-Id: <20221122231103.15829-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122231103.15829-1-bgray@linux.ibm.com>
References: <20221122231103.15829-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: szsVDAAjHb1-7fRh35AOK8I1axdwViIk
X-Proofpoint-GUID: szsVDAAjHb1-7fRh35AOK8I1axdwViIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211220174
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

base-commit: 247f34f7b80357943234f93f247a1ae6b6c3a740
-- 
2.38.1

