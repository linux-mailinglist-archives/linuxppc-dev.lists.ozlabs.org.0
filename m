Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 559762C59AD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 17:58:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChkVH6bCgzDrNd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 03:58:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cUxjjPzO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChkQL62bCzDrNY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 03:55:06 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQGWDvH182953; Thu, 26 Nov 2020 11:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=NwrrRi/6sL+znTQfwy6WBI4fgOfbf0sfOiN1VQkKtkw=;
 b=cUxjjPzO+EClVRveqhlZltE+NkelztzA78QkkfqzmoHqnBFH4dt/40EXfjZznecpFVV6
 2xmHq/MKGQRE2oT05XT1EOe7mN77o5fZ/2P+KqKwpnN0kd9apgvvujDR21CYDQuSDk7n
 v5bmW/Cx2r1rwejAqETv6MpCKuMUKu9vFSzUwuZ6sWjPTLvyk7fw1gdqGEDt4ifzrGcT
 lhh6gEX2A03hFWsbvdmf31GhVjFZiIVOSjOEi+FZbrPLrXF5tywhX1g96dsb6eSp+LOY
 6GJlifWMOrx85PtMOjZk5oWcn/R4ROti9dNepDotjyMY8d5y5ItXD1r+M5aCi4Q3JD2+ UA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352971cr29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 11:55:02 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQGrTfr014594;
 Thu, 26 Nov 2020 16:54:59 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 352drkg2y7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 16:54:59 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AQGsuB054395140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 16:54:57 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E08514C044;
 Thu, 26 Nov 2020 16:54:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E31064C046;
 Thu, 26 Nov 2020 16:54:55 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.231.24])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 16:54:55 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 2/7] powerpc/perf: Update the PMU group constraints for
 l2l3 events in power10
Date: Thu, 26 Nov 2020 11:54:39 -0500
Message-Id: <1606409684-1589-3-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606409684-1589-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1606409684-1589-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_06:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 suspectscore=1 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260097
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
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

Fixes: a64e697cef23 ("powerpc/perf: power10 Performance Monitoring support")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/isa207-common.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index f57f54f..38ed450c 100644
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
-- 
1.8.3.1

