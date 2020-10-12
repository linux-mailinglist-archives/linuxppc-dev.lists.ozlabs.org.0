Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA74828B246
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 12:33:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8w4q4f8bzDqg3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 21:33:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tWHLov0c; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8w2z4p4dzDqmq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Oct 2020 21:31:55 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09CADvO5179671; Mon, 12 Oct 2020 06:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Wc0IAiIxNr30cA1nXrWSq+IkxKZov4iUoMljSASi0Ug=;
 b=tWHLov0cNbROURRptFIk8RLbBM7b1Wk2MIw6yjkNMXPsQBVTlMmPL7Xq7hC39+ek/Aml
 fSYT4siSefRI2uYOsYTAW/p2j46R9aeh7MA+5my+ZeZ0QILSEnrJxT00DksbSwOUoQC7
 KRUoGaO6yaU/A79B/v1u7ysiuS51CDJyaVKpf6v/Av2tHdyDK5udMpW7ofwJukkUDek7
 N7d9nyW+z1Gu5GKUxDWzp2Cj8BB4s4JPm61ddFiFmR5aM9siLm4aFCpmurYIHKkd+mi1
 4E8xY+c+kIl4C8i48/kLNR6aVp9i9fEjv0GBU1uKJy7c/ClSYu3F7vbkykan37fhhZol jQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 344n6y0esy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 06:31:46 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09CAVjSQ000902;
 Mon, 12 Oct 2020 10:31:45 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3434k7swxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 10:31:45 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09CAVhhj29950244
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Oct 2020 10:31:43 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCB8E5205A;
 Mon, 12 Oct 2020 10:31:42 +0000 (GMT)
Received: from Madhavan.com (unknown [9.102.26.211])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id AF2A75204E;
 Mon, 12 Oct 2020 10:31:41 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: fix Threshold Event CounterMultiplier width for
 P10
Date: Mon, 12 Oct 2020 16:01:28 +0530
Message-Id: <20201012103128.53243-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-12_08:2020-10-12,
 2020-10-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 clxscore=1011
 phishscore=0 impostorscore=0 mlxlogscore=547 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010120083
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

Power9 and isa v3.1 has 7bit mantissa field for Threshold Event Counter
Multiplier (TECM). TECM is part of Monitor Mode Control Register A (MMCRA).
This field along with Threshold Event Counter Exponent (TECE) is used to
get threshould counter value. In Power10, the width of TECM field is
increase to 8bits. Patch fixes the current code to modify the MMCRA[TECM]
extraction macro to handling this changes.

Fixes: 170a315f41c64 ('powerpc/perf: Support to export MMCRA[TEC*] field to userspace')
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/perf/isa207-common.c | 3 +++
 arch/powerpc/perf/isa207-common.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 964437adec18..5fe129f02290 100644
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

