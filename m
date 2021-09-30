Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCBE41D9BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 14:23:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKsqD6Npxz3cJl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 22:23:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XSophB1B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XSophB1B; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKsmN6q9tz307W
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 22:21:24 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18UBChDV026041; 
 Thu, 30 Sep 2021 08:21:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UWzFQjIC+mYSOIgoaL2CFeaxMnXBYfJAMEbF3DvUJiw=;
 b=XSophB1BvXdMZ02Ldo3UXV9gnfnd0wVp3FkGnLZcfh3sF7f9mBy/nasavTaSrhSi0jQs
 +Pv2NsS7id0iOBdr5Y4lSVXBAGYrzQOQx9F8qfdx8Rm0ZA+ene008g8ghHD2HBqqnQ08
 5j2QCuL4riqzmbQevMKp8qurGaD1190B0MlKplwJXC+vTbJzN4A6nZ/f3wBbhuClamZY
 9RnxEvu/Ui7ZzsGQU99keV0e0kidLXNsEIH/jijn4VzZy+oD2eKiapMR1S87SNpYxBS1
 QtHJ7VjevgKg5qL3bfd5JdftXfVQ0h93yNQNdLVvkg80riL6DusmdFUTKcjt2Mut4JFW SQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bdc5kseka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 08:21:10 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18UCHG1N000396;
 Thu, 30 Sep 2021 12:21:08 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3b9udabb57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 12:21:08 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18UCL4GV59572696
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Sep 2021 12:21:05 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4D00A405C;
 Thu, 30 Sep 2021 12:21:04 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA99CA4054;
 Thu, 30 Sep 2021 12:21:02 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.207.39])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 30 Sep 2021 12:21:02 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, acme@kernel.org, jolsa@kernel.org
Subject: [V2 2/4] tools/perf: Refactor the code definition of perf reg
 extended mask in tools side header file
Date: Thu, 30 Sep 2021 17:50:53 +0530
Message-Id: <20210930122055.1390-3-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210930122055.1390-1-atrajeev@linux.vnet.ibm.com>
References: <20210930122055.1390-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YpkEnMKUwe3oFyUFuOMA2JAy8ybHRkgE
X-Proofpoint-ORIG-GUID: YpkEnMKUwe3oFyUFuOMA2JAy8ybHRkgE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_03,2021-09-30_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=911 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109300076
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

PERF_REG_PMU_MASK_300 and PERF_REG_PMU_MASK_31 defines the mask
value for extended registers. Current definition of these mask values
uses hex constant and does not use registers by name, making it less
readable. Patch refactor the macro values in perf tools side header file
by or'ing together the actual register value constants.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../arch/powerpc/include/uapi/asm/perf_regs.h | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/tools/arch/powerpc/include/uapi/asm/perf_regs.h b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
index 578b3ee86105..fb1d8a9b4393 100644
--- a/tools/arch/powerpc/include/uapi/asm/perf_regs.h
+++ b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
@@ -61,27 +61,32 @@ enum perf_event_powerpc_regs {
 	PERF_REG_POWERPC_PMC4,
 	PERF_REG_POWERPC_PMC5,
 	PERF_REG_POWERPC_PMC6,
-	/* Max regs without the extended regs */
+	/* Max mask value for interrupt regs w/o extended regs */
 	PERF_REG_POWERPC_MAX = PERF_REG_POWERPC_MMCRA + 1,
+	/* Max mask value for interrupt regs including extended regs */
+	PERF_REG_EXTENDED_MAX = PERF_REG_POWERPC_PMC6 + 1,
 };
 
 #define PERF_REG_PMU_MASK	((1ULL << PERF_REG_POWERPC_MAX) - 1)
 
-/* Exclude MMCR3, SIER2, SIER3 for CPU_FTR_ARCH_300 */
-#define	PERF_EXCLUDE_REG_EXT_300	(7ULL << PERF_REG_POWERPC_MMCR3)
-
 /*
  * PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300
  * includes 9 SPRS from MMCR0 to PMC6 excluding the
- * unsupported SPRS in PERF_EXCLUDE_REG_EXT_300.
+ * unsupported SPRS MMCR3, SIER2 and SIER3.
  */
-#define PERF_REG_PMU_MASK_300   ((0xfffULL << PERF_REG_POWERPC_MMCR0) - PERF_EXCLUDE_REG_EXT_300)
+#define PERF_REG_PMU_MASK_300	\
+	((1ul << PERF_REG_POWERPC_MMCR0) | (1ul << PERF_REG_POWERPC_MMCR1) | \
+	(1ul << PERF_REG_POWERPC_MMCR2) | (1ul << PERF_REG_POWERPC_PMC1) | \
+	(1ul << PERF_REG_POWERPC_PMC2) | (1ul << PERF_REG_POWERPC_PMC3) | \
+	(1ul << PERF_REG_POWERPC_PMC4) | (1ul << PERF_REG_POWERPC_PMC5) | \
+	(1ul << PERF_REG_POWERPC_PMC6))
 
 /*
  * PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31
  * includes 12 SPRs from MMCR0 to PMC6.
  */
-#define PERF_REG_PMU_MASK_31   (0xfffULL << PERF_REG_POWERPC_MMCR0)
+#define PERF_REG_PMU_MASK_31	\
+	(PERF_REG_PMU_MASK_300 | (1ul << PERF_REG_POWERPC_MMCR3) | \
+	(1ul << PERF_REG_POWERPC_SIER2) | (1ul << PERF_REG_POWERPC_SIER3))
 
-#define PERF_REG_EXTENDED_MAX  (PERF_REG_POWERPC_PMC6 + 1)
 #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
-- 
2.30.1 (Apple Git-130)

