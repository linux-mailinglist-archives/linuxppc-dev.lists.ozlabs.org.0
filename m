Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 815F141D9BD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 14:24:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKsr02vt5z3cP7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 22:24:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h/rYFI5t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h/rYFI5t; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKsmT2qsNz301N
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 22:21:29 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18UC1Ejd012781; 
 Thu, 30 Sep 2021 08:21:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pZdnDJZ33qIPZPrKP6DFHGr+TPg2Al86jmkiRqyi54k=;
 b=h/rYFI5tvb7t8sLPIkyskvxzxmy1uwdCz0wPI2H/qOuWhOuhz0kwFQfv+UwXbNcYOWV4
 tU22OOXQc/4KsfHmzZcjA/gEQfDX89108BEdw5Nfsz1MwK9LZih2268s682PFFx1iNTV
 Q9ZmJD6QHk3zLmTLoKi2m511EDPOum5lhbxQ2xs/CAZ2YVr7f0s47viieokAxdVV+Q0e
 J5IYKqyT0TmNN53waIZkrRjIjl3yo6zUEYEJxXlAykvRSvqgdvGh8eZyxKuOVNzUFIS8
 vjvpwD8oZK3lV6/mEfsmIsnWZQ/87DoultCzsNLWB9suJnT4SYfU89/ivQLvUcuSYQ1B 0w== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bdcv80erb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 08:21:12 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18UCHHUO007317;
 Thu, 30 Sep 2021 12:21:10 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3b9u1k3fxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 12:21:10 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 18UCG13O54526430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Sep 2021 12:16:01 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15383A4060;
 Thu, 30 Sep 2021 12:21:07 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48517A406D;
 Thu, 30 Sep 2021 12:21:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.207.39])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 30 Sep 2021 12:21:05 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au, acme@kernel.org, jolsa@kernel.org
Subject: [V2 3/4] powerpc/perf: Expose instruction and data address registers
 as part of extended regs
Date: Thu, 30 Sep 2021 17:50:54 +0530
Message-Id: <20210930122055.1390-4-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210930122055.1390-1-atrajeev@linux.vnet.ibm.com>
References: <20210930122055.1390-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WlNV2x5WA-0V1eDUHtkZNjNO6dDHSdcO
X-Proofpoint-ORIG-GUID: WlNV2x5WA-0V1eDUHtkZNjNO6dDHSdcO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_03,2021-09-30_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 mlxlogscore=785 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Patch adds support to include Sampled Instruction Address Register
(SIAR) and Sampled Data Address Register (SDAR) SPRs as part of extended
registers. Update the definition of PERF_REG_PMU_MASK_300/31 and
PERF_REG_EXTENDED_MAX to include these SPR's.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/include/uapi/asm/perf_regs.h | 11 +++++++----
 arch/powerpc/perf/perf_regs.c             |  4 ++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/uapi/asm/perf_regs.h b/arch/powerpc/include/uapi/asm/perf_regs.h
index fb1d8a9b4393..e2917710fdab 100644
--- a/arch/powerpc/include/uapi/asm/perf_regs.h
+++ b/arch/powerpc/include/uapi/asm/perf_regs.h
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
diff --git a/arch/powerpc/perf/perf_regs.c b/arch/powerpc/perf/perf_regs.c
index b931eed482c9..51d31b65e423 100644
--- a/arch/powerpc/perf/perf_regs.c
+++ b/arch/powerpc/perf/perf_regs.c
@@ -90,7 +90,11 @@ static u64 get_ext_regs_value(int idx)
 		return mfspr(SPRN_SIER2);
 	case PERF_REG_POWERPC_SIER3:
 		return mfspr(SPRN_SIER3);
+	case PERF_REG_POWERPC_SDAR:
+		return mfspr(SPRN_SDAR);
 #endif
+	case PERF_REG_POWERPC_SIAR:
+		return mfspr(SPRN_SIAR);
 	default: return 0;
 	}
 }
-- 
2.30.1 (Apple Git-130)

