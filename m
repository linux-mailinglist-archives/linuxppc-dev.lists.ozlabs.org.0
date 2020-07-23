Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE6522A9B6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 09:34:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC3xQ3Mx2zDrFd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 17:34:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC3vl5pSnzDqv1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 17:32:51 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06N7W2aD018454; Thu, 23 Jul 2020 03:32:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32f1pp6m2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 03:32:45 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06N7W62s018736;
 Thu, 23 Jul 2020 03:32:45 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32f1pp6m25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 03:32:44 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06N7VO0E005539;
 Thu, 23 Jul 2020 07:32:43 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 32brq7nwab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 07:32:43 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06N7Wfej31981656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 07:32:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F16D54C046;
 Thu, 23 Jul 2020 07:32:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB6DE4C04A;
 Thu, 23 Jul 2020 07:32:38 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.85.127.236])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Jul 2020 07:32:38 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [v4] powerpc/perf: Initialize power10 PMU registers in cpu setup
 routine
Date: Thu, 23 Jul 2020 03:32:37 -0400
Message-Id: <1595489557-2047-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_02:2020-07-22,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=800 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230053
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
Cc: jniethe5@gmail.com, mikey@neuling.org, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Initialize Monitor Mode Control Register 3 (MMCR3)
SPR which is new in power10. For PowerISA v3.1, BHRB disable
is controlled via Monitor Mode Control Register A (MMCRA) bit,
namely "BHRB Recording Disable (BHRBRD)". This patch also initializes
MMCRA BHRBRD to disable BHRB feature at boot for power10.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Dependency:
- On power10 PMU base enablement series V3:
  https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=190462

Changes from v3 -> v4
- Addressed review comments from Jordan and Michael Ellerman.
  This patch was initially part of Power10 PMU base enablement
  series. Moving this as separate patch as suggested by Michael
  Ellerman. Hence dependency of initial series Patch 7 which defines
  MMCRA_BHRB_DISABLE. Addressed review comments from Jordan to make
  sure existing PMU function (__INIT_PMU) will not overwrite ISA 3.1
  updates

Changes from v2 -> v3
- Addressed review comment from Michael Ellerman to
  call PMU init from __setup_cpu_power10

 arch/powerpc/kernel/cpu_setup_power.S | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kernel/cpu_setup_power.S
index efdcfa7..3fa6eef 100644
--- a/arch/powerpc/kernel/cpu_setup_power.S
+++ b/arch/powerpc/kernel/cpu_setup_power.S
@@ -94,13 +94,15 @@ _GLOBAL(__restore_cpu_power8)
 _GLOBAL(__setup_cpu_power10)
 	mflr	r11
 	bl	__init_FSCR_power10
+	bl	__init_PMU
+	bl	__init_PMU_ISA31
 	b	1f
 
 _GLOBAL(__setup_cpu_power9)
 	mflr	r11
 	bl	__init_FSCR
-1:	bl	__init_PMU
-	bl	__init_hvmode_206
+	bl	__init_PMU
+1:	bl	__init_hvmode_206
 	mtlr	r11
 	beqlr
 	li	r0,0
@@ -124,13 +126,15 @@ _GLOBAL(__setup_cpu_power9)
 _GLOBAL(__restore_cpu_power10)
 	mflr	r11
 	bl	__init_FSCR_power10
+	bl	__init_PMU
+	bl	__init_PMU_ISA31
 	b	1f
 
 _GLOBAL(__restore_cpu_power9)
 	mflr	r11
 	bl	__init_FSCR
-1:	bl	__init_PMU
-	mfmsr	r3
+	bl	__init_PMU
+1:	mfmsr	r3
 	rldicl.	r0,r3,4,63
 	mtlr	r11
 	beqlr
@@ -233,3 +237,10 @@ __init_PMU_ISA207:
 	li	r5,0
 	mtspr	SPRN_MMCRS,r5
 	blr
+
+__init_PMU_ISA31:
+	li	r5,0
+	mtspr	SPRN_MMCR3,r5
+	LOAD_REG_IMMEDIATE(r5, MMCRA_BHRB_DISABLE)
+	mtspr	SPRN_MMCRA,r5
+	blr
-- 
1.8.3.1

