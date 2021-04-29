Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D39A736E462
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 07:02:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW3KX5rGgz30DR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 15:02:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T2bC8xyg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=T2bC8xyg; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW3K43MZwz2xZ0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 15:02:31 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13T4XrC0003298; Thu, 29 Apr 2021 01:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=aVO0Wp0hK6gKgPsOrSe2ML/pbSxiY1eFrO1tSGdYdJA=;
 b=T2bC8xygNUoXzhWnWfOEA29fZWA3cy6kSULSMQl6FEvDSNjvPClwEJotDmBt5ErJgqLC
 3IXYrQBvwjj+HMcgIY0me0DRAkqwzwHT7elB64VD3duzrP2cS03GUovB7GzoB2a2OuOf
 r8NQj5u5+wsG+JqgpJYWeKzVlNTMZh+r1V6iiTIUoHWf4xCnGE/dWnuM78G0yZzsqGcx
 4gqeQDOy0M+nUMwzCAXTlxzWc23Lv/5rbApSuDJJUbOU7wv7sp0KkitAJlWo++Sj5aL/
 Q8I9fwuTw03sD8yvKHLAB8oECQ5eRhHfagCZ0OYlV+Mc+G6xkIzjMgfNzRWuHeb1Im62 lg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 387n00shxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 01:02:24 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13T52GXk016425;
 Thu, 29 Apr 2021 05:02:22 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 384ay897sh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 05:02:22 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13T52ICm45941218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Apr 2021 05:02:18 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 781D311C058;
 Thu, 29 Apr 2021 05:02:18 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C752B11C052;
 Thu, 29 Apr 2021 05:02:16 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.85.133.23])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 29 Apr 2021 05:02:16 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Update MMCR2 to support event exclude_idle
Date: Thu, 29 Apr 2021 10:32:08 +0530
Message-Id: <20210429050208.266619-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3Boe55v3wVz09JdYBsA1E6KqyDdA0Swz
X-Proofpoint-GUID: 3Boe55v3wVz09JdYBsA1E6KqyDdA0Swz
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_02:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1011 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290033
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

struct perf_event_attr supports exclude counting of idle task.
This is sent to kernel via perf_event_attr.exclude_idle and
in perf tool, user can use ":I" event modifier to enable this
for specific event.

Monitor Mode Control Register 2 (MMCR2) SPR has control bits
for each PMCs to freeze counting based on the Control Register
CTRL[RUN] state. CTRL[RUN] is not set when idle task is
running. Patch adds a check for event attr.exclude_idle to
set MMCR2[FCnWAIT] bit.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/perf/isa207-common.c | 3 +++
 arch/powerpc/perf/isa207-common.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index e4f577da33d8..5e05f90dd7df 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -587,6 +587,9 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
 				mmcr2 |= MMCR2_FCS(pmc);
 		}
 
+		if (pevents[i]->attr.exclude_idle)
+			mmcr2 |= MMCR2_FCWAIT(pmc);
+
 		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
 			if (pmc <= 4) {
 				val = (event[i] >> p10_EVENT_MMCR3_SHIFT) &
diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
index 1af0e8c97ac7..a95a810fa832 100644
--- a/arch/powerpc/perf/isa207-common.h
+++ b/arch/powerpc/perf/isa207-common.h
@@ -248,6 +248,7 @@
 /* Bits in MMCR2 for PowerISA v2.07 */
 #define MMCR2_FCS(pmc)			(1ull << (63 - (((pmc) - 1) * 9)))
 #define MMCR2_FCP(pmc)			(1ull << (62 - (((pmc) - 1) * 9)))
+#define MMCR2_FCWAIT(pmc)		(1ull << (58 - (((pmc) - 1) * 9)))
 #define MMCR2_FCH(pmc)			(1ull << (57 - (((pmc) - 1) * 9)))
 
 #define MAX_ALT				2
-- 
2.26.2

