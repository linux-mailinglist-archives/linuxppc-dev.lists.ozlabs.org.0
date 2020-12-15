Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE372DA98A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 09:59:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwByb5nsDzDqGp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 19:59:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Z+1au8NL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwBwt29BKzDqCT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 19:57:49 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BF8YARp049395; Tue, 15 Dec 2020 03:57:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=AkVj1/9z7Djce2dKs9CvqZrYS0VdSMri8zBKp+Ho48I=;
 b=Z+1au8NL4gf6wNPEzPMMN/wGeoM+cX577z2z4KEfHm9n8tITjg/qhLJIYDThrIW4EIbq
 9K1zmJCj5yc2woEcMBnHqVhUxBIUFkLQP1hAsuYwNuB27mI6IDD5Hh7ztlY5syio/jpx
 Ijwa8klRJfJba4V4YNRHQbEVH6pcyQggOGudu+Ss+bq8pq7NRRZ3AIuPv3bvFB5Mlafw
 K7tNGmS+042HpboiWsWMpld0cohzLWQg8Ya0ggpSPtPt5wb3RvNEajpVToOiX4uqSZkE
 A4Byallz8s3UXnmtNZeB4YatiFdQFVfRY9kGVnKOuky/Wml0ot/8Xweju4op5UUjQ5Ph qA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35eq81cwtr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Dec 2020 03:57:44 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BF8r2Yl009873;
 Tue, 15 Dec 2020 08:57:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 35cng8ch65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Dec 2020 08:57:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BF8uOew30474602
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Dec 2020 08:56:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3037B4C040;
 Tue, 15 Dec 2020 08:56:24 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED33D4C052;
 Tue, 15 Dec 2020 08:56:22 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.251.221])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 15 Dec 2020 08:56:22 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3] powerpc/perf: Fix Threshold Event Counter Multiplier width
 for P10
Date: Tue, 15 Dec 2020 03:56:18 -0500
Message-Id: <1608022578-1532-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-15_04:2020-12-11,
 2020-12-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012150055
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

From: Madhavan Srinivasan <maddy@linux.ibm.com>

Threshold Event Counter Multiplier (TECM) is part of Monitor Mode
Control Register A (MMCRA). This field along with Threshold Event
Counter Exponent (TECE) is used to get threshould counter value.
In Power10, this is a 8bit field, so patch fixes the
current code to modify the MMCRA[TECM] extraction macro to
handle this change. ISA v3.1 says this is a 7 bit field but
POWER10 it's actually 8 bits which will hopefully be fixed
in ISA v3.1 update.

Fixes: 170a315f41c64 ('powerpc/perf: Support to export MMCRA[TEC*] field to userspace')
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog v2 -> v3:
- Since in POWER10 it's actually 8 bits which will hopefully be
  fixed in ISA3.1 update, bring back the cpu feature check which
  is the appropriate one.

Changelog v1 -> v2:
- Fixed the commit message
- Fixed the condition check to use PVR check for power10
  instead of ISA v3.1 cpu feature check.

 arch/powerpc/perf/isa207-common.c | 3 +++
 arch/powerpc/perf/isa207-common.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 24f0a90..6ab5b27 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -247,6 +247,9 @@ void isa207_get_mem_weight(u64 *weight)
 	u64 sier = mfspr(SPRN_SIER);
 	u64 val = (sier & ISA207_SIER_TYPE_MASK) >> ISA207_SIER_TYPE_SHIFT;
 
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		mantissa = P10_MMCRA_THR_CTR_MANT(mmcra);
+
 	if (val == 0 || val == 7)
 		*weight = 0;
 	else
diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
index 4208764..454b32c 100644
--- a/arch/powerpc/perf/isa207-common.h
+++ b/arch/powerpc/perf/isa207-common.h
@@ -231,6 +231,10 @@
 #define MMCRA_THR_CTR_EXP(v)		(((v) >> MMCRA_THR_CTR_EXP_SHIFT) &\
 						MMCRA_THR_CTR_EXP_MASK)
 
+#define P10_MMCRA_THR_CTR_MANT_MASK	0xFFul
+#define P10_MMCRA_THR_CTR_MANT(v)	(((v) >> MMCRA_THR_CTR_MANT_SHIFT) &\
+						P10_MMCRA_THR_CTR_MANT_MASK)
+
 /* MMCRA Threshold Compare bit constant for power9 */
 #define p9_MMCRA_THR_CMP_SHIFT	45
 
-- 
1.8.3.1

