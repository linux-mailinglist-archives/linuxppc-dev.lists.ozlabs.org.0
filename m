Return-Path: <linuxppc-dev+bounces-3845-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 621DC9E6FAD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2024 14:57:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y4Xqy0jmQz30W9;
	Sat,  7 Dec 2024 00:57:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733493422;
	cv=none; b=Vdw3voAZxPQDnp79b3ZzutsngcdtrW+TLBa1SOGpECEnb+FE6KQ4DIsXMUg6zjSYinWsjmbuNPUJpBVb4b6rVfORrArZ5DCBb0iegDvBsSoaf1kwiM/dSRAPde7lkTSwHz6n1g03HmNWKLiDbAw5XgCZnNusjzIC65i08IeJioC7VCIsGX+zs7fbxXrf3rga1D3Oo/38v1Z8QxulAWZ7CauE0L56YM2uZvXVe07kW38PoIayz92IdOVVnrKWV9hlt/xvZyOLqVrnjhQc3WLzY/FRbrKqxAG3t7B0BrBP770h3W/Dg9lIWE3CeXCXmKnMj+cIGpYof2n+u4I4XAQ/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733493422; c=relaxed/relaxed;
	bh=2VvAnUtmxhMMk6F7O3XnWBwviVIumRpdGIrNiXkcOoc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QxCas4zTDlbZEnhJhkSmTBvneWAVJOj1edSWYHLvlFOJI+AOWu+I8Qt+d6fddKSgh/zKgb0TqWi6wBmVlOCOPN/BPn0JYAhE0TWCAb56iSCiZ8EJJPNbATd3p5VZEVEVHMt4Xfj5bSzUXmLSaPh64Y/4cYw9WIl+eeHLDghxfbv7rifjlUgJKeHytu6CCUcjiyEXEM5PNaqaRVqBLZQ+LoXtQUOPX6hZUcGqEFnQmTpz5Ir2z9+kvcrgUD1UC7CSTwTUV5/49m4b/phqPAjiktH+SbLEGQLveQ2Hc67MVP9UwEPpjMfUuh32lEZFNkwTzxEerYmR5TUdnHm0VqtQdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I623HFBA; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I623HFBA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y4Xqx06Mrz2y71
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2024 00:57:00 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B67UY7n000771;
	Fri, 6 Dec 2024 13:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=2VvAnUtmxhMMk6F7O3XnWBwviVIumRpdGIrNiXkcO
	oc=; b=I623HFBA1AeMiaayZmTj3kjVU75tzgchmJyHFXca7xaTnKmDHskpEBLvV
	c2i88/0hhkAr7ARLArq/VpYkdRtcfisqha4S7o3bkFhj+tUaQVinUauwW0lV709U
	HVlL9wmBP2r0gJ2OPcWVjNmwUiBcUOlIGRoHqqc9V3yUWq70+utNQlicga15Uz2L
	O18SDU564YBHegGR0ZMwuFQybgq0sVeLwcmlJbExQG2miDZbPLeXJ+JGiqmdkXaP
	TmF5f/X5HBuExPLCc8Zeae5edyy9tkugJTxFv3wdljRp5x6qF+ERbDsbMYTFHJR3
	IoV23UaBBxLVj72RwKXbUAFlt8oWA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43bvxksgrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 13:56:52 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B6DupYG007143;
	Fri, 6 Dec 2024 13:56:51 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43bvxksgrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 13:56:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B69mwY9007467;
	Fri, 6 Dec 2024 13:56:51 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 438f8jxrtu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 13:56:51 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B6Dulmm31654516
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Dec 2024 13:56:47 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83BDA20043;
	Fri,  6 Dec 2024 13:56:47 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5AEC20040;
	Fri,  6 Dec 2024 13:56:41 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.245.143])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Dec 2024 13:56:41 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Subject: [PATCH] tools/perf/arch/powerpc: Add register mask for power11 PVR in extended regs
Date: Fri,  6 Dec 2024 19:26:37 +0530
Message-Id: <20241206135637.36166-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0DRLT-rEuHGmPWYrKzBJijAP1s6fxZfy
X-Proofpoint-ORIG-GUID: dhBZ0ROkcyuB7GAbcfJlCqU6k1RPxCLP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060102
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Perf tools side uses extended mask to display the platform
supported register names (with -I? option) to the user
and also send this mask to the kernel to capture the extended registers
as part of each sample. This mask value is decided based on
the processor version ( from PVR ).

Add PVR value for power11 to enable capturing the extended regs
as part of sample in power11.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---

 tools/perf/arch/powerpc/util/perf_regs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arch/powerpc/util/perf_regs.c
index e8e6e6fc6f17..bd36cfd420a2 100644
--- a/tools/perf/arch/powerpc/util/perf_regs.c
+++ b/tools/perf/arch/powerpc/util/perf_regs.c
@@ -16,6 +16,7 @@
 
 #define PVR_POWER9		0x004E
 #define PVR_POWER10		0x0080
+#define PVR_POWER11		0x0082
 
 static const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG(r0, PERF_REG_POWERPC_R0),
@@ -207,7 +208,7 @@ uint64_t arch__intr_reg_mask(void)
 	version = (((mfspr(SPRN_PVR)) >>  16) & 0xFFFF);
 	if (version == PVR_POWER9)
 		extended_mask = PERF_REG_PMU_MASK_300;
-	else if (version == PVR_POWER10)
+	else if ((version == PVR_POWER10) || (version == PVR_POWER11))
 		extended_mask = PERF_REG_PMU_MASK_31;
 	else
 		return mask;
-- 
2.43.5


