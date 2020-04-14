Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 634DD1A7213
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 06:00:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491Wwp4gwkzDqVs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 14:00:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491W831GNYzDqGM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 13:25:06 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03E33aii130584
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 23:25:05 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30cvwv3x1q-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 23:25:04 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Tue, 14 Apr 2020 04:24:24 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 Apr 2020 04:24:19 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03E3Oup119726396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Apr 2020 03:24:56 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D7945204E;
 Tue, 14 Apr 2020 03:24:56 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.60.157])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 353B25205A;
 Tue, 14 Apr 2020 03:24:23 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v3 16/16] powerpc/watchpoint/xmon: Support 2nd dawr
Date: Tue, 14 Apr 2020 08:46:59 +0530
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200414031659.58875-1-ravi.bangoria@linux.ibm.com>
References: <20200414031659.58875-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20041403-0020-0000-0000-000003C76146
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041403-0021-0000-0000-00002220396D
Message-Id: <20200414031659.58875-17-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-13_11:2020-04-13,
 2020-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2 spamscore=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004140024
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
Cc: apopple@linux.ibm.com, ravi.bangoria@linux.ibm.com, peterz@infradead.org,
 fweisbec@gmail.com, oleg@redhat.com, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, jolsa@kernel.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for 2nd DAWR in xmon. With this, we can have two
simultaneous breakpoints from xmon.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/xmon/xmon.c | 101 ++++++++++++++++++++++++++-------------
 1 file changed, 69 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 99e9138661e4..01da49b666db 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -111,7 +111,7 @@ struct bpt {
 
 #define NBPTS	256
 static struct bpt bpts[NBPTS];
-static struct bpt dabr;
+static struct bpt dabr[HBP_NUM_MAX];
 static struct bpt *iabr;
 static unsigned bpinstr = 0x7fe00008;	/* trap */
 
@@ -787,10 +787,17 @@ static int xmon_sstep(struct pt_regs *regs)
 
 static int xmon_break_match(struct pt_regs *regs)
 {
+	int i;
+
 	if ((regs->msr & (MSR_IR|MSR_PR|MSR_64BIT)) != (MSR_IR|MSR_64BIT))
 		return 0;
-	if (dabr.enabled == 0)
-		return 0;
+	for (i = 0; i < nr_wp_slots(); i++) {
+		if (dabr[i].enabled)
+			goto found;
+	}
+	return 0;
+
+found:
 	xmon_core(regs, 0);
 	return 1;
 }
@@ -929,13 +936,16 @@ static void insert_bpts(void)
 
 static void insert_cpu_bpts(void)
 {
+	int i;
 	struct arch_hw_breakpoint brk;
 
-	if (dabr.enabled) {
-		brk.address = dabr.address;
-		brk.type = (dabr.enabled & HW_BRK_TYPE_DABR) | HW_BRK_TYPE_PRIV_ALL;
-		brk.len = DABR_MAX_LEN;
-		__set_breakpoint(0, &brk);
+	for (i = 0; i < nr_wp_slots(); i++) {
+		if (dabr[i].enabled) {
+			brk.address = dabr[i].address;
+			brk.type = (dabr[i].enabled & HW_BRK_TYPE_DABR) | HW_BRK_TYPE_PRIV_ALL;
+			brk.len = 8;
+			__set_breakpoint(i, &brk);
+		}
 	}
 
 	if (iabr)
@@ -1349,6 +1359,35 @@ static long check_bp_loc(unsigned long addr)
 	return 1;
 }
 
+static int find_free_data_bpt(void)
+{
+	int i;
+
+	for (i = 0; i < nr_wp_slots(); i++) {
+		if (!dabr[i].enabled)
+			return i;
+	}
+	printf("Couldn't find free breakpoint register\n");
+	return -1;
+}
+
+static void print_data_bpts(void)
+{
+	int i;
+
+	for (i = 0; i < nr_wp_slots(); i++) {
+		if (!dabr[i].enabled)
+			continue;
+
+		printf("   data   "REG"  [", dabr[i].address);
+		if (dabr[i].enabled & 1)
+			printf("r");
+		if (dabr[i].enabled & 2)
+			printf("w");
+		printf("]\n");
+	}
+}
+
 static char *breakpoint_help_string =
     "Breakpoint command usage:\n"
     "b                show breakpoints\n"
@@ -1382,10 +1421,9 @@ bpt_cmds(void)
 			printf("Hardware data breakpoint not supported on this cpu\n");
 			break;
 		}
-		if (dabr.enabled) {
-			printf("Couldn't find free breakpoint register\n");
+		i = find_free_data_bpt();
+		if (i < 0)
 			break;
-		}
 		mode = 7;
 		cmd = inchar();
 		if (cmd == 'r')
@@ -1394,15 +1432,15 @@ bpt_cmds(void)
 			mode = 6;
 		else
 			termch = cmd;
-		dabr.address = 0;
-		dabr.enabled = 0;
-		if (scanhex(&dabr.address)) {
-			if (!is_kernel_addr(dabr.address)) {
+		dabr[i].address = 0;
+		dabr[i].enabled = 0;
+		if (scanhex(&dabr[i].address)) {
+			if (!is_kernel_addr(dabr[i].address)) {
 				printf(badaddr);
 				break;
 			}
-			dabr.address &= ~HW_BRK_TYPE_DABR;
-			dabr.enabled = mode | BP_DABR;
+			dabr[i].address &= ~HW_BRK_TYPE_DABR;
+			dabr[i].enabled = mode | BP_DABR;
 		}
 
 		force_enable_xmon();
@@ -1441,7 +1479,9 @@ bpt_cmds(void)
 			for (i = 0; i < NBPTS; ++i)
 				bpts[i].enabled = 0;
 			iabr = NULL;
-			dabr.enabled = 0;
+			for (i = 0; i < nr_wp_slots(); i++)
+				dabr[i].enabled = 0;
+
 			printf("All breakpoints cleared\n");
 			break;
 		}
@@ -1475,14 +1515,7 @@ bpt_cmds(void)
 		if (xmon_is_ro || !scanhex(&a)) {
 			/* print all breakpoints */
 			printf("   type            address\n");
-			if (dabr.enabled) {
-				printf("   data   "REG"  [", dabr.address);
-				if (dabr.enabled & 1)
-					printf("r");
-				if (dabr.enabled & 2)
-					printf("w");
-				printf("]\n");
-			}
+			print_data_bpts();
 			for (bp = bpts; bp < &bpts[NBPTS]; ++bp) {
 				if (!bp->enabled)
 					continue;
@@ -1942,8 +1975,13 @@ static void dump_207_sprs(void)
 
 	printf("hfscr  = %.16lx  dhdes = %.16lx rpr    = %.16lx\n",
 		mfspr(SPRN_HFSCR), mfspr(SPRN_DHDES), mfspr(SPRN_RPR));
-	printf("dawr   = %.16lx  dawrx = %.16lx ciabr  = %.16lx\n",
-		mfspr(SPRN_DAWR0), mfspr(SPRN_DAWRX0), mfspr(SPRN_CIABR));
+	printf("dawr0  = %.16lx dawrx0 = %.16lx\n",
+	       mfspr(SPRN_DAWR0), mfspr(SPRN_DAWRX0));
+	if (nr_wp_slots() > 1) {
+		printf("dawr1  = %.16lx dawrx1 = %.16lx\n",
+		       mfspr(SPRN_DAWR1), mfspr(SPRN_DAWRX1));
+	}
+	printf("ciabr  = %.16lx\n", mfspr(SPRN_CIABR));
 #endif
 }
 
@@ -3873,10 +3911,9 @@ static void clear_all_bpt(void)
 		bpts[i].enabled = 0;
 
 	/* Clear any data or iabr breakpoints */
-	if (iabr || dabr.enabled) {
-		iabr = NULL;
-		dabr.enabled = 0;
-	}
+	iabr = NULL;
+	for (i = 0; i < nr_wp_slots(); i++)
+		dabr[i].enabled = 0;
 }
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.21.1

