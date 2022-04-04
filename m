Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B859B4F19BF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 20:22:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXJzL4x5jz2yMK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 04:22:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mmacbYA5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mmacbYA5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXJyd3gHbz2xnP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Apr 2022 04:22:00 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 234FndOf007397; 
 Mon, 4 Apr 2022 18:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=JrZ1TsI9qZTrPXFc7Vht/uLXHGHAt4DbEpR2CUadFjs=;
 b=mmacbYA5GOGf25Rfllr74Brjg1d7Wq5fZeAI8gVxrTHCULiQs3dGdaHsTVgNoc3I8wvp
 ooa4hIpg59Ydt5FNgilqjh2z08Zvrrq1Fay/JpHVhgbhgxsL4v6qMyQsPTk3KD9M7a1x
 Zik8FbgESb/t8Gn1AgzTdfNg2ZcffpXICd2+AePYs3o4LZUjgZboLCfhx/bmCW86nJpL
 VfCJXnjE6WoylGKFATQGDTQwu+lb7IK6bgEO67DRayV/+Eqg8GMCdgFj5CqQL55vAH8U
 BqwI1YCmmicZzMPcy/QGDd5RuHKCyeh9HfrMmiLkloCnVS+f+XuZ5VCYWQOpUilDqaGT Ig== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f6yupdyn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 18:21:51 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 234IHMXq014469;
 Mon, 4 Apr 2022 18:21:50 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3f6drhm52f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 18:21:49 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 234ILrf239059846
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Apr 2022 18:21:53 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 778D24C046;
 Mon,  4 Apr 2022 18:21:46 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6ACCE4C040;
 Mon,  4 Apr 2022 18:21:44 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.domain.name (unknown
 [9.211.158.82])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 Apr 2022 18:21:43 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/fadump: save CPU reg data in vmcore when PHYP
 terminates LPAR
Date: Mon,  4 Apr 2022 23:51:37 +0530
Message-Id: <20220404182137.59231-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bdUVvmwPrtRwU8qhFMkdeb8EYrKp6AlN
X-Proofpoint-ORIG-GUID: bdUVvmwPrtRwU8qhFMkdeb8EYrKp6AlN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-04_06,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1011 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204040103
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
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

An LPAR can be terminated by the POWER Hypervisor (PHYP) for various
reasons. If FADump was configured when PHYP terminates the LPAR,
platform-assisted dump is initiated to save the kernel dump. But CPU
register data would not be processed/saved in the vmcore in such case
because CPU mask is set in crash_fadump() at the time of kernel crash
and it remains unset in this case with LPAR being terminated by PHYP
abruptly.

To get around the problem, initialize cpu_mask to cpu_possible_mask
so as to ensure all possible CPUs' register data is processed for the
vmcore generated on PHYP terminated LPAR. Also, rename the crash info
member variable from online_mask to cpu_mask as it doesn't necessarily
have to be online CPU mask always.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/include/asm/fadump-internal.h   | 2 +-
 arch/powerpc/kernel/fadump.c                 | 7 ++++++-
 arch/powerpc/platforms/pseries/rtas-fadump.c | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index 81bcb9abb371..27f9e11eda28 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -50,7 +50,7 @@ struct fadump_crash_info_header {
 	u64		elfcorehdr_addr;
 	u32		crashing_cpu;
 	struct pt_regs	regs;
-	struct cpumask	online_mask;
+	struct cpumask	cpu_mask;
 };
 
 struct fadump_memory_range {
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 65562c4a0a69..8343c0b14277 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -728,7 +728,7 @@ void crash_fadump(struct pt_regs *regs, const char *str)
 	else
 		ppc_save_regs(&fdh->regs);
 
-	fdh->online_mask = *cpu_online_mask;
+	fdh->cpu_mask = *cpu_online_mask;
 
 	/*
 	 * If we came in via system reset, wait a while for the secondary
@@ -1164,6 +1164,11 @@ static unsigned long init_fadump_header(unsigned long addr)
 	fdh->elfcorehdr_addr = addr;
 	/* We will set the crashing cpu id in crash_fadump() during crash. */
 	fdh->crashing_cpu = FADUMP_CPU_UNKNOWN;
+	/*
+	 * When LPAR is terminated by PYHP, ensure all possible CPUs'
+	 * register data is processed while exporting the vmcore.
+	 */
+	fdh->cpu_mask = *cpu_possible_mask;
 
 	return addr;
 }
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index 35f9cb602c30..617c0f3b1f4f 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -351,7 +351,7 @@ static int __init rtas_fadump_build_cpu_notes(struct fw_dump *fadump_conf)
 		/* Lower 4 bytes of reg_value contains logical cpu id */
 		cpu = (be64_to_cpu(reg_entry->reg_value) &
 		       RTAS_FADUMP_CPU_ID_MASK);
-		if (fdh && !cpumask_test_cpu(cpu, &fdh->online_mask)) {
+		if (fdh && !cpumask_test_cpu(cpu, &fdh->cpu_mask)) {
 			RTAS_FADUMP_SKIP_TO_NEXT_CPU(reg_entry);
 			continue;
 		}
-- 
2.35.1

