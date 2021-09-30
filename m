Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BC241D9B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 14:23:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKspV06Cfz305V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 22:23:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZRlEe3jq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZRlEe3jq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKsmM4lLhz306D
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 22:21:23 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18UCBlMF015703; 
 Thu, 30 Sep 2021 08:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qSZelsGIfwWNIrWqAvHsotQkK93fkJizsKm44V97DSg=;
 b=ZRlEe3jqC0+KAR5Edu/29hxDXEmspw3xGcjRXAfHxPSzlRqHWLT7pQQ5gDnqho8mviTY
 CDgMjDGOZ00q+jVixt9ej/OneBwgTwsi5SCbiq3LVHfoOnDi+AWE1HwrwcYqM/jY3uyV
 prO9sYMWlhbNdTONZPWghoTxTWaRTQEEDOCqdtlyMfAQlLY8FRclKna6PszilbhqGFDl
 R6rLcCZhxjEWfwiIVChWw5dFtE8OaJUsmaTT8aekXb6TpcrWiNZNa01gL6MFolhn3WW/
 PrK1rL0/wwUMuamPiTdVdbB1MpXQ0DvLiD12YAcqBItbIMtLZRx2PhZk/brvFn5hW7J8 QQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bdd1a86wy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 08:21:15 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18UCHWlM032754;
 Thu, 30 Sep 2021 12:21:13 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3b9uda8ksx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 12:21:12 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18UCL9bP5767776
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Sep 2021 12:21:09 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75619A4054;
 Thu, 30 Sep 2021 12:21:09 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BE53A4064;
 Thu, 30 Sep 2021 12:21:07 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.207.39])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 30 Sep 2021 12:21:07 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, acme@kernel.org, jolsa@kernel.org
Subject: [V2 4/4] tools/perf: Add perf tools support to expose instruction and
 data address registers as part of extended regs
Date: Thu, 30 Sep 2021 17:50:55 +0530
Message-Id: <20210930122055.1390-5-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210930122055.1390-1-atrajeev@linux.vnet.ibm.com>
References: <20210930122055.1390-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eoyAaSIvDpLjJlPTGS_mwQQki2AoIwFS
X-Proofpoint-GUID: eoyAaSIvDpLjJlPTGS_mwQQki2AoIwFS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_04,2021-09-30_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 clxscore=1015 mlxlogscore=923 lowpriorityscore=0
 spamscore=0 mlxscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109300076
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch enables presenting of Sampled Instruction Address Register (SIAR)
and Sampled Data Address Register (SDAR) SPRs as part of extended regsiters
for perf tool. Add these SPR's to sample_reg_mask in the tool side (to use
with -I? option).

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/arch/powerpc/include/uapi/asm/perf_regs.h | 11 +++++++----
 tools/perf/arch/powerpc/include/perf_regs.h     |  2 ++
 tools/perf/arch/powerpc/util/perf_regs.c        |  2 ++
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/tools/arch/powerpc/include/uapi/asm/perf_regs.h b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
index fb1d8a9b4393..e2917710fdab 100644
--- a/tools/arch/powerpc/include/uapi/asm/perf_regs.h
+++ b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
@@ -61,17 +61,19 @@ enum perf_event_powerpc_regs {
 	PERF_REG_POWERPC_PMC4,
 	PERF_REG_POWERPC_PMC5,
 	PERF_REG_POWERPC_PMC6,
+	PERF_REG_POWERPC_SDAR,
+	PERF_REG_POWERPC_SIAR,
 	/* Max mask value for interrupt regs w/o extended regs */
 	PERF_REG_POWERPC_MAX = PERF_REG_POWERPC_MMCRA + 1,
 	/* Max mask value for interrupt regs including extended regs */
-	PERF_REG_EXTENDED_MAX = PERF_REG_POWERPC_PMC6 + 1,
+	PERF_REG_EXTENDED_MAX = PERF_REG_POWERPC_SIAR + 1,
 };
 
 #define PERF_REG_PMU_MASK	((1ULL << PERF_REG_POWERPC_MAX) - 1)
 
 /*
  * PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300
- * includes 9 SPRS from MMCR0 to PMC6 excluding the
+ * includes 11 SPRS from MMCR0 to SIAR excluding the
  * unsupported SPRS MMCR3, SIER2 and SIER3.
  */
 #define PERF_REG_PMU_MASK_300	\
@@ -79,11 +81,12 @@ enum perf_event_powerpc_regs {
 	(1ul << PERF_REG_POWERPC_MMCR2) | (1ul << PERF_REG_POWERPC_PMC1) | \
 	(1ul << PERF_REG_POWERPC_PMC2) | (1ul << PERF_REG_POWERPC_PMC3) | \
 	(1ul << PERF_REG_POWERPC_PMC4) | (1ul << PERF_REG_POWERPC_PMC5) | \
-	(1ul << PERF_REG_POWERPC_PMC6))
+	(1ul << PERF_REG_POWERPC_PMC6) | (1ul << PERF_REG_POWERPC_SDAR) | \
+	(1ul << PERF_REG_POWERPC_SIAR))
 
 /*
  * PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31
- * includes 12 SPRs from MMCR0 to PMC6.
+ * includes 14 SPRs from MMCR0 to SIAR.
  */
 #define PERF_REG_PMU_MASK_31	\
 	(PERF_REG_PMU_MASK_300 | (1ul << PERF_REG_POWERPC_MMCR3) | \
diff --git a/tools/perf/arch/powerpc/include/perf_regs.h b/tools/perf/arch/powerpc/include/perf_regs.h
index 04e5dc07e93f..93339d17acc4 100644
--- a/tools/perf/arch/powerpc/include/perf_regs.h
+++ b/tools/perf/arch/powerpc/include/perf_regs.h
@@ -77,6 +77,8 @@ static const char *reg_names[] = {
 	[PERF_REG_POWERPC_PMC4] = "pmc4",
 	[PERF_REG_POWERPC_PMC5] = "pmc5",
 	[PERF_REG_POWERPC_PMC6] = "pmc6",
+	[PERF_REG_POWERPC_SDAR] = "sdar",
+	[PERF_REG_POWERPC_SIAR] = "siar",
 };
 
 static inline const char *__perf_reg_name(int id)
diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arch/powerpc/util/perf_regs.c
index 8116a253f91f..8d07a78e742a 100644
--- a/tools/perf/arch/powerpc/util/perf_regs.c
+++ b/tools/perf/arch/powerpc/util/perf_regs.c
@@ -74,6 +74,8 @@ const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG(pmc4, PERF_REG_POWERPC_PMC4),
 	SMPL_REG(pmc5, PERF_REG_POWERPC_PMC5),
 	SMPL_REG(pmc6, PERF_REG_POWERPC_PMC6),
+	SMPL_REG(sdar, PERF_REG_POWERPC_SDAR),
+	SMPL_REG(siar, PERF_REG_POWERPC_SIAR),
 	SMPL_REG_END
 };
 
-- 
2.30.1 (Apple Git-130)

