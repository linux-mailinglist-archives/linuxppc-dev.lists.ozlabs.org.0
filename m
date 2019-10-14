Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CF8D6419
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 15:29:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sKCH4pbszDq9D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 00:28:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ravi.bangoria@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sJg26dZszDqlm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 00:04:30 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9ED2Adg060905
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 09:04:28 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vms6es1ye-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 09:04:28 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Mon, 14 Oct 2019 14:04:23 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 14 Oct 2019 14:04:21 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9ED4KSh34603298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Oct 2019 13:04:20 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AD9F4C063;
 Mon, 14 Oct 2019 13:04:20 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6A444C040;
 Mon, 14 Oct 2019 13:04:16 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.59.28])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Oct 2019 13:04:16 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: christophe.leroy@c-s.fr, mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v5 7/7] Powerpc/Watchpoint: Support for 8xx in
 ptrace-hwbreak.c selftest
Date: Mon, 14 Oct 2019 18:33:46 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191014130346.22660-1-ravi.bangoria@linux.ibm.com>
References: <20191014130346.22660-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19101413-0028-0000-0000-000003A9EBCA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101413-0029-0000-0000-0000246BFDFD
Message-Id: <20191014130346.22660-8-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-14_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910140126
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On the 8xx, signals are generated after executing the instruction.
So no need to manually single-step on 8xx. Also, 8xx __set_dabr()
currently ignores length and hardcodes the length to 8 bytes. So
all unaligned and 512 byte testcase will fail on 8xx. Ignore those
testcases on 8xx.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 .../selftests/powerpc/ptrace/ptrace-hwbreak.c | 32 +++++++++++++------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
index 916e97f5f8b1..7deedbc16b0b 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
@@ -22,6 +22,11 @@
 #include <sys/wait.h>
 #include "ptrace.h"
 
+#define SPRN_PVR	0x11F
+#define PVR_8xx		0x00500000
+
+bool is_8xx;
+
 /*
  * Use volatile on all global var so that compiler doesn't
  * optimise their load/stores. Otherwise selftest can fail.
@@ -205,13 +210,15 @@ static void check_success(pid_t child_pid, const char *name, const char *type,
 
 	printf("%s, %s, len: %d: Ok\n", name, type, len);
 
-	/*
-	 * For ptrace registered watchpoint, signal is generated
-	 * before executing load/store. Singlestep the instruction
-	 * and then continue the test.
-	 */
-	ptrace(PTRACE_SINGLESTEP, child_pid, NULL, 0);
-	wait(NULL);
+	if (!is_8xx) {
+		/*
+		 * For ptrace registered watchpoint, signal is generated
+		 * before executing load/store. Singlestep the instruction
+		 * and then continue the test.
+		 */
+		ptrace(PTRACE_SINGLESTEP, child_pid, NULL, 0);
+		wait(NULL);
+	}
 }
 
 static void ptrace_set_debugreg(pid_t child_pid, unsigned long wp_addr)
@@ -447,8 +454,10 @@ run_tests(pid_t child_pid, struct ppc_debug_info *dbginfo, bool dawr)
 	test_set_debugreg(child_pid);
 	if (dbginfo->features & PPC_DEBUG_FEATURE_DATA_BP_RANGE) {
 		test_sethwdebug_exact(child_pid);
-		test_sethwdebug_range_aligned(child_pid);
-		if (dawr) {
+
+		if (!is_8xx)
+			test_sethwdebug_range_aligned(child_pid);
+		if (dawr && !is_8xx) {
 			test_sethwdebug_range_unaligned(child_pid);
 			test_sethwdebug_range_unaligned_dar(child_pid);
 			test_sethwdebug_dawr_max_range(child_pid);
@@ -489,5 +498,10 @@ static int ptrace_hwbreak(void)
 
 int main(int argc, char **argv, char **envp)
 {
+	int pvr = 0;
+	asm __volatile__ ("mfspr %0,%1" : "=r"(pvr) : "i"(SPRN_PVR));
+	if (pvr == PVR_8xx)
+		is_8xx = true;
+
 	return test_harness(ptrace_hwbreak, "ptrace-hwbreak");
 }
-- 
2.21.0

