Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A59FF424D92
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 08:56:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ2DT4LRRz3c4w
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 17:56:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LIUZVJ6q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LIUZVJ6q; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ2Bz4r9wz2yNW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 17:55:23 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19764Nf6040011; 
 Thu, 7 Oct 2021 02:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ck5DrFJSiadCCl+z6qNAS9TIZJ5tX1uE4gF/WvCw40k=;
 b=LIUZVJ6qeTXJd7eJqWRsiE2Jggz3YDpMwMJFW3r+oYcGm905kT50W4GUlh7n1hZkx93J
 BiqRs6FLKMc0Qs0SG5PZA3Ca+1I5MpJFbKl9F6TZ5YdSkzKjvBRhpFVr6tnARo4DJxHP
 ouZis5/oiHYhYMVtvkCE9PEZm/rQyEChLTao3GKksgO6/CzbEhEYszbvGhexNtZ+q06v
 yNZ8UAJV3sKjENTbjgbIzUQlc/lfonFcUqMW/g9NjvRxJbgKqcskL1P2/t4YjsSPF25C
 gETnNFqlxOtblOPzf2dBAsH+1BdWN9WSGiEiTDJxC/LtQQLmSUt08VHzeK8b5hQibU+B 3g== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bhu9h901c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 02:55:17 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1976rQxP007811;
 Thu, 7 Oct 2021 06:55:15 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3bef2amjmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 06:55:14 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1976noAe57344490
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Oct 2021 06:49:50 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2956452050;
 Thu,  7 Oct 2021 06:55:11 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.78.197.54])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 61F7952051;
 Thu,  7 Oct 2021 06:55:09 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, acme@kernel.org, jolsa@kernel.org
Subject: [V3 1/4] powerpc/perf: Refactor the code definition of perf reg
 extended mask
Date: Thu,  7 Oct 2021 12:25:02 +0530
Message-Id: <20211007065505.27809-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20211007065505.27809-1-atrajeev@linux.vnet.ibm.com>
References: <20211007065505.27809-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EsHe65gTKTfYOVmcG3OCHVbCssukCHRk
X-Proofpoint-GUID: EsHe65gTKTfYOVmcG3OCHVbCssukCHRk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-06_04,2021-10-07_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0
 mlxlogscore=817 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110070043
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
readable. Patch refactor the macro values by or'ing together the actual
register value constants. Also include PERF_REG_EXTENDED_MAX as
part of enum definition.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/include/uapi/asm/perf_regs.h | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/uapi/asm/perf_regs.h b/arch/powerpc/include/uapi/asm/perf_regs.h
index 578b3ee86105..085094553f3b 100644
--- a/arch/powerpc/include/uapi/asm/perf_regs.h
+++ b/arch/powerpc/include/uapi/asm/perf_regs.h
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
2.30.1 (Apple Git-130)

