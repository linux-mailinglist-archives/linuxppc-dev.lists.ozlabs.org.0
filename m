Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E1F2AE82F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 06:36:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWD4h3M6JzDqRm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 16:36:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LCDyhymO; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWD2v5XlfzDqFH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 16:35:18 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AB4X7r0136731; Tue, 10 Nov 2020 23:33:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=eBbFy9UQ2V1qXQhIB5KU2YzgbsBtpsXSq/rlISUBSHk=;
 b=LCDyhymOXC9mZV0szKlmsaVz73x/I/pvpfq2o/NbVKmCnq6cYok5U2180u6YaKewqExh
 c6ZvG8gLc5SsKbcCpk32FV91EVYejJXDegOShpbqlTQ1q24tez/9FvkJJHHimNInWcnb
 I/kZn4mokMKFkvzEiX21M38NxcDKPlh99qaNrHaZiSKzLTSwazOumnGpFcuZfmll/5JU
 fqef6W8E9htV2lP4KQoV3phCqxkvYEh3GhVbEW6Ra8LKb2edpQgb022z1VEhRHkZ7PLm
 X72Zt6Abkf8TJ5JHZWLKAC8dw3lbMB2iRxuAVzF7NhU3E5i7PbgbZvS86GpxUj7Dkj+N 4Q== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34qpsnycgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 23:33:19 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AB4WLQ9023975;
 Wed, 11 Nov 2020 04:33:18 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 34njuh3u31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Nov 2020 04:33:17 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AB4XFLx59048402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Nov 2020 04:33:15 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A51974C059;
 Wed, 11 Nov 2020 04:33:15 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74C444C044;
 Wed, 11 Nov 2020 04:33:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.242.115])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Nov 2020 04:33:14 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 2/4] powerpc/perf: Update the PMU group constraints for l2l3
 and threshold events in power10
Date: Tue, 10 Nov 2020 23:33:07 -0500
Message-Id: <1605069189-2740-3-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1605069189-2740-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1605069189-2740-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-11_01:2020-11-10,
 2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=1 impostorscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011110022
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
Cc: mikey@neuling.org, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In Power9, L2/L3 bus events are always available as a
"bank" of 4 events. To obtain the counts for any of the
l2/l3 bus events in a given bank, the user will have to
program PMC4 with corresponding l2/l3 bus event for that
bank.

Commit 59029136d750 ("powerpc/perf: Add constraints for power9 l2/l3 bus events")
enforced this rule in Power9. But this is not valid for
Power10, since in Power10 Monitor Mode Control Register2
(MMCR2) has bits to configure l2/l3 event bits. Hence remove
this PMC4 constraint check from power10.

Since the l2/l3 bits in MMCR2 are not per-pmc, patch handles
group constrints checks for l2/l3 bits in MMCR2.
Patch also updates constraints for threshold events in power10.

Fixes: a64e697cef23 ("powerpc/perf: power10 Performance Monitoring support")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/isa207-common.c | 15 +++++++++++----
 arch/powerpc/perf/isa207-common.h |  3 +++
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index f57f54f..0f4983e 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -311,9 +311,11 @@ int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp)
 	}
 
 	if (unit >= 6 && unit <= 9) {
-		if (cpu_has_feature(CPU_FTR_ARCH_31) && (unit == 6)) {
-			mask |= CNST_L2L3_GROUP_MASK;
-			value |= CNST_L2L3_GROUP_VAL(event >> p10_L2L3_EVENT_SHIFT);
+		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+			if (unit == 6) {
+				mask |= CNST_L2L3_GROUP_MASK;
+				value |= CNST_L2L3_GROUP_VAL(event >> p10_L2L3_EVENT_SHIFT);
+			}
 		} else if (cpu_has_feature(CPU_FTR_ARCH_300)) {
 			mask  |= CNST_CACHE_GROUP_MASK;
 			value |= CNST_CACHE_GROUP_VAL(event & 0xff);
@@ -349,7 +351,12 @@ int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp)
 		value |= CNST_SAMPLE_VAL(event >> EVENT_SAMPLE_SHIFT);
 	}
 
-	if (cpu_has_feature(CPU_FTR_ARCH_300))  {
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		if (event_is_threshold(event)) {
+			mask  |= CNST_THRESH_CTL_SEL_MASK;
+			value |= CNST_THRESH_CTL_SEL_VAL(event >> EVENT_THRESH_SHIFT);
+		}
+	} else if (cpu_has_feature(CPU_FTR_ARCH_300))  {
 		if (event_is_threshold(event) && is_thresh_cmp_valid(event)) {
 			mask  |= CNST_THRESH_MASK;
 			value |= CNST_THRESH_VAL(event >> EVENT_THRESH_SHIFT);
diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
index dc9c3d2..4208764 100644
--- a/arch/powerpc/perf/isa207-common.h
+++ b/arch/powerpc/perf/isa207-common.h
@@ -149,6 +149,9 @@
 #define CNST_THRESH_VAL(v)	(((v) & EVENT_THRESH_MASK) << 32)
 #define CNST_THRESH_MASK	CNST_THRESH_VAL(EVENT_THRESH_MASK)
 
+#define CNST_THRESH_CTL_SEL_VAL(v)	(((v) & 0x7ffull) << 32)
+#define CNST_THRESH_CTL_SEL_MASK	CNST_THRESH_CTL_SEL_VAL(0x7ff)
+
 #define CNST_EBB_VAL(v)		(((v) & EVENT_EBB_MASK) << 24)
 #define CNST_EBB_MASK		CNST_EBB_VAL(EVENT_EBB_MASK)
 
-- 
1.8.3.1

