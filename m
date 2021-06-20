Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B003ADF15
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 16:46:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7FqD3lTTz308R
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 00:46:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nn7TFD36;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nn7TFD36; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7Fpk0hpxz2yjY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 00:46:21 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15KEYcoi115392; Sun, 20 Jun 2021 10:46:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=cZ66bcfp2Kw0MBlU+noPqqi9NpdlM06FUhufTHIqZ2I=;
 b=nn7TFD36huOMBzJUtq+CHle420MnHKmsHRkk+oWPjuV5jGRDT7cXAXgBbTXAE4m+pPq/
 9ucT1qmcI3fVAnvLF/D4722q9wGCqty+ftulRd//FhF1WtDPVcfCCLK/42uhvaEwsrSF
 o/f5SZ3F5eFUGgZOZPLI6yjU5w1uen9HEn1TstQ6xQiuuKTixadYFpYqgnhD4kBIy2xc
 hJu5HnwspoACwLRoOQaMirB3QWABsq3q8KHz6JCsfWEaEZDWpWfPC4EijWtKZfNi7d+d
 JSJd6tAY+XjRHNBaNK3OZBHI9jHIMlCznL+sesFG3ZvDYxOrr5nnuVwc+b8VFRaJNDq6 Iw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39a67gscah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Jun 2021 10:46:13 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15KEihub026688;
 Sun, 20 Jun 2021 14:46:11 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3998788f8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Jun 2021 14:46:11 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15KEk8ra32309702
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 20 Jun 2021 14:46:08 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C2F74C04A;
 Sun, 20 Jun 2021 14:46:08 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F9BB4C044;
 Sun, 20 Jun 2021 14:46:06 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.183.154])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 20 Jun 2021 14:46:06 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, acme@kernel.org, jolsa@kernel.org
Subject: [PATCH 2/2] tools/perf: Add perf tools support to expose instruction
 and data address registers as part of extended regs
Date: Sun, 20 Jun 2021 10:46:00 -0400
Message-Id: <1624200360-1429-3-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624200360-1429-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1624200360-1429-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8cifa8Fm7hh8b-flxLGI3ygPR6rhmss9
X-Proofpoint-GUID: 8cifa8Fm7hh8b-flxLGI3ygPR6rhmss9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-20_07:2021-06-20,
 2021-06-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106200105
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch enables presenting of Sampled Instruction Address Register (SIAR)
and Sampled Data Address Register (SDAR) SPRs as part of extended regsiters
for perf tool. Add these SPR's to sample_reg_mask in the tool side (to use
with -I? option).

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/arch/powerpc/include/uapi/asm/perf_regs.h | 12 +++++++-----
 tools/perf/arch/powerpc/include/perf_regs.h     |  2 ++
 tools/perf/arch/powerpc/util/perf_regs.c        |  2 ++
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/tools/arch/powerpc/include/uapi/asm/perf_regs.h b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
index 578b3ee..cf5eee5 100644
--- a/tools/arch/powerpc/include/uapi/asm/perf_regs.h
+++ b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
@@ -61,6 +61,8 @@ enum perf_event_powerpc_regs {
 	PERF_REG_POWERPC_PMC4,
 	PERF_REG_POWERPC_PMC5,
 	PERF_REG_POWERPC_PMC6,
+	PERF_REG_POWERPC_SDAR,
+	PERF_REG_POWERPC_SIAR,
 	/* Max regs without the extended regs */
 	PERF_REG_POWERPC_MAX = PERF_REG_POWERPC_MMCRA + 1,
 };
@@ -72,16 +74,16 @@ enum perf_event_powerpc_regs {
 
 /*
  * PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300
- * includes 9 SPRS from MMCR0 to PMC6 excluding the
+ * includes 11 SPRS from MMCR0 to SIAR excluding the
  * unsupported SPRS in PERF_EXCLUDE_REG_EXT_300.
  */
-#define PERF_REG_PMU_MASK_300   ((0xfffULL << PERF_REG_POWERPC_MMCR0) - PERF_EXCLUDE_REG_EXT_300)
+#define PERF_REG_PMU_MASK_300   ((0x3fffULL << PERF_REG_POWERPC_MMCR0) - PERF_EXCLUDE_REG_EXT_300)
 
 /*
  * PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31
- * includes 12 SPRs from MMCR0 to PMC6.
+ * includes 14 SPRs from MMCR0 to SIAR.
  */
-#define PERF_REG_PMU_MASK_31   (0xfffULL << PERF_REG_POWERPC_MMCR0)
+#define PERF_REG_PMU_MASK_31   (0x3fffULL << PERF_REG_POWERPC_MMCR0)
 
-#define PERF_REG_EXTENDED_MAX  (PERF_REG_POWERPC_PMC6 + 1)
+#define PERF_REG_EXTENDED_MAX  (PERF_REG_POWERPC_SIAR + 1)
 #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
diff --git a/tools/perf/arch/powerpc/include/perf_regs.h b/tools/perf/arch/powerpc/include/perf_regs.h
index 04e5dc0..93339d1 100644
--- a/tools/perf/arch/powerpc/include/perf_regs.h
+++ b/tools/perf/arch/powerpc/include/perf_regs.h
@@ -77,6 +77,8 @@
 	[PERF_REG_POWERPC_PMC4] = "pmc4",
 	[PERF_REG_POWERPC_PMC5] = "pmc5",
 	[PERF_REG_POWERPC_PMC6] = "pmc6",
+	[PERF_REG_POWERPC_SDAR] = "sdar",
+	[PERF_REG_POWERPC_SIAR] = "siar",
 };
 
 static inline const char *__perf_reg_name(int id)
diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arch/powerpc/util/perf_regs.c
index 8116a25..8d07a78 100644
--- a/tools/perf/arch/powerpc/util/perf_regs.c
+++ b/tools/perf/arch/powerpc/util/perf_regs.c
@@ -74,6 +74,8 @@
 	SMPL_REG(pmc4, PERF_REG_POWERPC_PMC4),
 	SMPL_REG(pmc5, PERF_REG_POWERPC_PMC5),
 	SMPL_REG(pmc6, PERF_REG_POWERPC_PMC6),
+	SMPL_REG(sdar, PERF_REG_POWERPC_SDAR),
+	SMPL_REG(siar, PERF_REG_POWERPC_SIAR),
 	SMPL_REG_END
 };
 
-- 
1.8.3.1

