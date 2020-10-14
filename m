Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2BA28DEC7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 12:18:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB7fT1Hv8zDqWx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 21:18:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sfwo52CP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB7cn6cpzzDqYM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 21:16:57 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09EA2KED127165; Wed, 14 Oct 2020 06:16:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=b7knItebmpDrZGI+BOnxc1QOzQhGDQnMQiEWSg89u3A=;
 b=sfwo52CPwNuhPd+03rdJ66mZxpyD5EFTJILWCQQapl0J5cVBdimoNVuLCMwVQ13THpJU
 Ew8uCaw7xFWTYmy8AoLIMZ/96GJbELobT4WjUYrD3i7XHgIrUDLkO5LZQQzcm1+J+zur
 iVKei9PU8GWQxqqAdGZx4dd171alwIWAT5T9NZkqEuHSLYZ0vuAnb/+WfX6oKR9x/IBd
 AeHITacPFqAjfZ1g2Mdm5Kvdxy5M+zizFWV+21ahU1Vn1I4EAQL3WgVHHQowaqNPuD/6
 sbn2ycTJZof6+cLKpMRRceynnPRwaFoYLstgviknQ/RZNIZ4fnUNP2UIpFNCLuU5JRCC 3A== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 345y2sh1s0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 06:16:49 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09EADFnS021075;
 Wed, 14 Oct 2020 10:16:47 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 34347h22rf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 10:16:47 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 09EAGiZG32702962
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Oct 2020 10:16:44 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFA8CA4054;
 Wed, 14 Oct 2020 10:16:44 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C117CA405B;
 Wed, 14 Oct 2020 10:16:43 +0000 (GMT)
Received: from Madhavan.com (unknown [9.85.85.77])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Oct 2020 10:16:43 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/perf: Fix Threshold Event Counter Multiplier width
 for P10
Date: Wed, 14 Oct 2020 15:46:31 +0530
Message-Id: <20201014101631.292445-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_06:2020-10-14,
 2020-10-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 mlxscore=0
 phishscore=0 suspectscore=0 bulkscore=0 mlxlogscore=603 adultscore=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010140069
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Threshold Event Counter Multiplier (TECM) is part of Monitor Mode
Control Register A (MMCRA). This field along with Threshold Event
Counter Exponent (TECE) is used to get threshould counter value.
ISA v3.1 has 7bit mantissa field for TECM, but in Power10, the
width of TECM field is increase to 8bits. Patch fixes the current
code to modify the MMCRA[TECM] extraction macro to handle this changes.

Fixes: 170a315f41c64 ('powerpc/perf: Support to export MMCRA[TEC*] field to userspace')
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v1:
- Fixed the commit message
- Fixed the condition check

 arch/powerpc/include/asm/reg.h    | 1 +
 arch/powerpc/perf/isa207-common.c | 3 +++
 arch/powerpc/perf/isa207-common.h | 4 ++++
 3 files changed, 8 insertions(+)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 88fb88491fe9..a1bb0ebb3a46 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1355,6 +1355,7 @@
 #define PVR_POWER9	0x004E
 #define PVR_BE		0x0070
 #define PVR_PA6T	0x0090
+#define PVR_POWER10	0x0080
 
 /* "Logical" PVR values defined in PAPR, representing architecture levels */
 #define PVR_ARCH_204	0x0f000001
diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 964437adec18..480bbe525904 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -247,6 +247,9 @@ void isa207_get_mem_weight(u64 *weight)
 	u64 sier = mfspr(SPRN_SIER);
 	u64 val = (sier & ISA207_SIER_TYPE_MASK) >> ISA207_SIER_TYPE_SHIFT;
 
+	if (pvr_version_is(PVR_POWER10))
+		mantissa = P10_MMCRA_THR_CTR_MANT(mmcra);
+
 	if (val == 0 || val == 7)
 		*weight = 0;
 	else
diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
index 044de65e96b9..71380e854f48 100644
--- a/arch/powerpc/perf/isa207-common.h
+++ b/arch/powerpc/perf/isa207-common.h
@@ -219,6 +219,10 @@
 #define MMCRA_THR_CTR_EXP(v)		(((v) >> MMCRA_THR_CTR_EXP_SHIFT) &\
 						MMCRA_THR_CTR_EXP_MASK)
 
+#define P10_MMCRA_THR_CTR_MANT_MASK	0xFFul
+#define P10_MMCRA_THR_CTR_MANT(v)	(((v) >> MMCRA_THR_CTR_MANT_SHIFT) &\
+						P10_MMCRA_THR_CTR_MANT_MASK)
+
 /* MMCRA Threshold Compare bit constant for power9 */
 #define p9_MMCRA_THR_CMP_SHIFT	45
 
-- 
2.26.2

