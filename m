Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5307B431829
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 13:52:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXwGG6NSjz3cN5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 22:52:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d2mDlkRi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=d2mDlkRi; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXwF45x8Wz3c9s
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 22:51:04 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19IAlZM8005905; 
 Mon, 18 Oct 2021 07:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xj+Wf7OGCK79lp/6E5Y5GmCD6+UfXPW0PiJouirKKb8=;
 b=d2mDlkRi/Kps6guvpgHbX2qncaB3iB99pO4JWXKO48otTOtn5ewKNW0SCLRQAzvejHNG
 suRsCPaTD1c4yzgNX6CcbuJ3pOu7t507UBwUb9E/5QrP0Uxf9qJ+NGyahYe303dIztk8
 2JDY/xB894+kj7q5OtHr4G/HvIDeHRXyh9ArusIguFyYL3sVRI8tgPZb2IpjdUZ6Kj80
 f9vJ1kGWQklESrqNh3fdFf9XjjAK+mQLI90oO3FtKvKQiZpYK9+S8Muwczder/bM5ubq
 eYtO2ogHgdCH3Flt8rvbwAK/M0CUEjHds9PQkO4JXQYb4nP37bYa+Tnx8MbfYatnYzk6 Rg== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bs7fsh7rx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 07:50:58 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19IBm4cT028229;
 Mon, 18 Oct 2021 11:49:57 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3bqpc9mhkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 11:49:57 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 19IBi75Y61538770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Oct 2021 11:44:07 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D605E52059;
 Mon, 18 Oct 2021 11:49:53 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.190.48])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 16CC25204E;
 Mon, 18 Oct 2021 11:49:51 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org
Subject: [V4 1/2] tools/perf: Refactor the code definition of perf reg
 extended mask in tools side header file
Date: Mon, 18 Oct 2021 17:19:47 +0530
Message-Id: <20211018114948.16830-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211018114948.16830-1-atrajeev@linux.vnet.ibm.com>
References: <20211018114948.16830-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HSZTYJ1q-scBiFls9A75NdhjlQ1CIY9u
X-Proofpoint-ORIG-GUID: HSZTYJ1q-scBiFls9A75NdhjlQ1CIY9u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_03,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=940 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110180071
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
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
Reviewed-by: Kajol Jain<kjain@linux.ibm.com>
---
 .../arch/powerpc/include/uapi/asm/perf_regs.h | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/tools/arch/powerpc/include/uapi/asm/perf_regs.h b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
index 578b3ee86105..085094553f3b 100644
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
+	((1ULL << PERF_REG_POWERPC_MMCR0) | (1ULL << PERF_REG_POWERPC_MMCR1) | \
+	(1ULL << PERF_REG_POWERPC_MMCR2) | (1ULL << PERF_REG_POWERPC_PMC1) | \
+	(1ULL << PERF_REG_POWERPC_PMC2) | (1ULL << PERF_REG_POWERPC_PMC3) | \
+	(1ULL << PERF_REG_POWERPC_PMC4) | (1ULL << PERF_REG_POWERPC_PMC5) | \
+	(1ULL << PERF_REG_POWERPC_PMC6))
 
 /*
  * PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31
  * includes 12 SPRs from MMCR0 to PMC6.
  */
-#define PERF_REG_PMU_MASK_31   (0xfffULL << PERF_REG_POWERPC_MMCR0)
+#define PERF_REG_PMU_MASK_31	\
+	(PERF_REG_PMU_MASK_300 | (1ULL << PERF_REG_POWERPC_MMCR3) | \
+	(1ULL << PERF_REG_POWERPC_SIER2) | (1ULL << PERF_REG_POWERPC_SIER3))
 
-#define PERF_REG_EXTENDED_MAX  (PERF_REG_POWERPC_PMC6 + 1)
 #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
-- 
2.33.0

