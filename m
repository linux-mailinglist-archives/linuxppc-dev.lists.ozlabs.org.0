Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C09396E32
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 09:48:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvPRp3gFDz308Y
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 17:48:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e033TguT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=e033TguT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvPRG6hmSz2yhf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jun 2021 17:48:26 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1517WdAA009622; Tue, 1 Jun 2021 03:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=iM783haSZaIYfHEG+lWIxRQUMnR+HuHO+/Vj7DNrVBQ=;
 b=e033TguTsYpxTWCkpgQRlYkccJqMuzda3Ubf84t8pCaFhIG+3Tefx/X07HNJUsEpI3kL
 Qi3/g/qds1819Z9CO6gWc16HE7ReQqP8DovU6wLvSVPCheFQglnqhqdbjtSDjc+ZUnje
 O/TQlTLjMv+QbrdDoVsZ9exIceJ3XKg/8myhFd+p+m510d/fn29QJBiewDSs+AFxxppI
 MCsCucA1yCpGa9EcyLXxG2YtZ4eBEaIU2/4z4ohOwL5WzOEeeLn4gAw0fu6Zaio2J6Mm
 gZpG56hDsNgy8ufC6R2UcKT3TJNZvNgoEtRRoIv46WQ+2Idmrd6rTLL/jcuwXQbNrMfc Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38wg31hbfq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 03:48:18 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1517XlcZ012751;
 Tue, 1 Jun 2021 03:48:17 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38wg31hbf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 03:48:17 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1517TcRS028099;
 Tue, 1 Jun 2021 07:48:15 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 38ud880tp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 07:48:15 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1517mDbY28901648
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Jun 2021 07:48:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46BF14C044;
 Tue,  1 Jun 2021 07:48:13 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7209B4C040;
 Tue,  1 Jun 2021 07:48:11 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.85.73.71])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Jun 2021 07:48:10 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/xmon: Add support for running a command on all cpus
 in xmon
Date: Tue,  1 Jun 2021 13:18:01 +0530
Message-Id: <20210601074801.617363-1-naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1BA_PcKhkABfcNrb7DAZKIg-60HAwVil
X-Proofpoint-ORIG-GUID: T2_dkWhDpYGABeLY9NLhWlYaIMkT-68H
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_03:2021-05-31,
 2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106010051
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is sometimes desirable to run a command on all cpus in xmon. A
typical scenario is to obtain the backtrace from all cpus in xmon if
there is a soft lockup. Add rudimentary support for the same. The
command to be run on all cpus should be prefixed with 'c#'. As an
example, 'c#t' will run 't' command and produce a backtrace on all cpus
in xmon.

Since many xmon commands are not sensible for running in this manner, we
only allow a predefined list of commands -- 'r', 'S' and 't' for now.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/xmon/xmon.c | 148 +++++++++++++++++++++++++++++++++------
 1 file changed, 126 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index c8173e92f19d7b..a178b6654e3aec 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -70,6 +70,9 @@ static cpumask_t cpus_in_xmon = CPU_MASK_NONE;
 static unsigned long xmon_taken = 1;
 static int xmon_owner;
 static int xmon_gate;
+static int xmon_batch;
+static unsigned long xmon_batch_start_cpu;
+static cpumask_t xmon_batch_cpus = CPU_MASK_NONE;
 #else
 #define xmon_owner 0
 #endif /* CONFIG_SMP */
@@ -133,6 +136,12 @@ static void prdump(unsigned long, long);
 static int ppc_inst_dump(unsigned long, long, int);
 static void dump_log_buf(void);
 
+#ifdef CONFIG_SMP
+static int xmon_switch_cpu(unsigned long);
+static int xmon_batch_next_cpu(void);
+static int batch_cmds(struct pt_regs *);
+#endif
+
 #ifdef CONFIG_PPC_POWERNV
 static void dump_opal_msglog(void);
 #else
@@ -216,7 +225,8 @@ Commands:\n\
 #ifdef CONFIG_SMP
   "\
   c	print cpus stopped in xmon\n\
-  c#	try to switch to cpu number h (in hex)\n"
+  c#	try to switch to cpu number h (in hex)\n\
+  c# $	run command '$' (one of 'r','S' or 't') on all cpus in xmon\n"
 #endif
   "\
   C	checksum\n\
@@ -644,7 +654,12 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 			spin_cpu_relax();
 			touch_nmi_watchdog();
 		} else {
-			if (!locked_down)
+			cmd = 1;
+#ifdef CONFIG_SMP
+			if (xmon_batch)
+				cmd = batch_cmds(regs);
+#endif
+			if (!locked_down && cmd)
 				cmd = cmds(regs);
 			if (locked_down || cmd != 0) {
 				/* exiting xmon */
@@ -1243,11 +1258,112 @@ static void bootcmds(void)
 	}
 }
 
+#ifdef CONFIG_SMP
+static int xmon_switch_cpu(unsigned long cpu)
+{
+	int timeout;
+
+	xmon_taken = 0;
+	mb();
+	xmon_owner = cpu;
+	timeout = 10000000;
+	while (!xmon_taken) {
+		if (--timeout == 0) {
+			if (test_and_set_bit(0, &xmon_taken))
+				break;
+			/* take control back */
+			mb();
+			xmon_owner = smp_processor_id();
+			printf("cpu 0x%lx didn't take control\n", cpu);
+			return 0;
+		}
+		barrier();
+	}
+	return 1;
+}
+
+static int xmon_batch_next_cpu(void)
+{
+	unsigned long cpu;
+
+	while (!cpumask_empty(&xmon_batch_cpus)) {
+		cpu = cpumask_next_wrap(smp_processor_id(), &xmon_batch_cpus,
+					xmon_batch_start_cpu, true);
+		if (cpu == nr_cpumask_bits)
+			break;
+		if (xmon_batch_start_cpu == -1)
+			xmon_batch_start_cpu = cpu;
+		if (xmon_switch_cpu(cpu))
+			return 0;
+		cpumask_clear_cpu(cpu, &xmon_batch_cpus);
+	}
+
+	xmon_batch = 0;
+	printf("%x:mon> \n", smp_processor_id());
+	return 1;
+}
+
+static int batch_cmds(struct pt_regs *excp)
+{
+	int cmd;
+
+	/* simulate command entry */
+	cmd = xmon_batch;
+	termch = '\n';
+
+	last_cmd = NULL;
+	xmon_regs = excp;
+
+	printf("%x:", smp_processor_id());
+	printf("mon> ");
+	printf("%c\n", (char)cmd);
+
+	switch (cmd) {
+	case 'r':
+		prregs(excp);	/* print regs */
+		break;
+	case 'S':
+		super_regs();
+		break;
+	case 't':
+		backtrace(excp);
+		break;
+	}
+
+	cpumask_clear_cpu(smp_processor_id(), &xmon_batch_cpus);
+
+	return xmon_batch_next_cpu();
+}
+
 static int cpu_cmd(void)
 {
-#ifdef CONFIG_SMP
 	unsigned long cpu, first_cpu, last_cpu;
-	int timeout;
+
+	cpu = skipbl();
+	if (cpu == '#') {
+		xmon_batch = skipbl();
+		if (xmon_batch) {
+			switch (xmon_batch) {
+			case 'r':
+			case 'S':
+			case 't':
+				cpumask_copy(&xmon_batch_cpus, &cpus_in_xmon);
+				if (cpumask_weight(&xmon_batch_cpus) <= 1) {
+					printf("There are no other cpus in xmon\n");
+					break;
+				}
+				xmon_batch_start_cpu = -1;
+				if (!xmon_batch_next_cpu())
+					return 1;
+				break;
+			default:
+				printf("c# only supports 'r', 'S' and 't' commands\n");
+			}
+			xmon_batch = 0;
+			return 0;
+		}
+	}
+	termch = cpu;
 
 	if (!scanhex(&cpu)) {
 		/* print cpus waiting or in xmon */
@@ -1279,27 +1395,15 @@ static int cpu_cmd(void)
 #endif
 		return 0;
 	}
-	xmon_taken = 0;
-	mb();
-	xmon_owner = cpu;
-	timeout = 10000000;
-	while (!xmon_taken) {
-		if (--timeout == 0) {
-			if (test_and_set_bit(0, &xmon_taken))
-				break;
-			/* take control back */
-			mb();
-			xmon_owner = smp_processor_id();
-			printf("cpu 0x%lx didn't take control\n", cpu);
-			return 0;
-		}
-		barrier();
-	}
-	return 1;
+
+	return xmon_switch_cpu(cpu);
+}
 #else
+static int cpu_cmd(void)
+{
 	return 0;
-#endif /* CONFIG_SMP */
 }
+#endif /* CONFIG_SMP */
 
 static unsigned short fcstab[256] = {
 	0x0000, 0x1189, 0x2312, 0x329b, 0x4624, 0x57ad, 0x6536, 0x74bf,

base-commit: 112f47a1484ddca610b70cbe4a99f0d0f1701daf
-- 
2.31.1

