Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3167165B10
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 11:03:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NVXs0m4bzDqVn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 21:03:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NVQx3GtCzDqPk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 20:58:33 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01K9sWmR104482
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 04:58:31 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8uchnbn7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 04:58:31 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Thu, 20 Feb 2020 09:58:29 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Feb 2020 09:58:27 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01K9wO2J43647152
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 09:58:24 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D3F5A4055;
 Thu, 20 Feb 2020 09:58:24 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0392DA4040;
 Thu, 20 Feb 2020 09:58:22 +0000 (GMT)
Received: from vajain21.in.ibm.com.com (unknown [9.199.53.128])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 Feb 2020 09:58:21 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/8] powerpc: Add asm header 'papr_scm.h' describing the
 papr-scm interface
Date: Thu, 20 Feb 2020 15:27:58 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200220095805.197229-1-vaibhav@linux.ibm.com>
References: <20200220095805.197229-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022009-0008-0000-0000-00000354B1B4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022009-0009-0000-0000-00004A75C10C
Message-Id: <20200220095805.197229-2-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_02:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 suspectscore=1 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002200073
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 Michael Ellerman <ellerman@au1.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Alastair D'Silva <alastair@au1.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a new powerpc specific asm header named 'papr-scm.h' that descibes
the interface between PHYP and guest kernel running as an LPAR.

The HCALLs specific to managing SCM are descibed in Ref[1]. The asm
header introduced by this patch however describes the data structures
exchanged between PHYP and kernel during those HCALLs.

Future patches will use these structures to provide support for
retriving nvdimm health and performance stats in papr_scm kernel
module.

[1]: commit 58b278f568f0 ("powerpc: Provide initial documentation for
PAPR hcalls")

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/include/asm/papr_scm.h | 68 +++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 arch/powerpc/include/asm/papr_scm.h

diff --git a/arch/powerpc/include/asm/papr_scm.h b/arch/powerpc/include/asm/papr_scm.h
new file mode 100644
index 000000000000..d893621063f3
--- /dev/null
+++ b/arch/powerpc/include/asm/papr_scm.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Structures and defines needed to manage nvdimms for spapr guests.
+ */
+#ifndef _ASM_POWERPC_PAPR_SCM_H_
+#define _ASM_POWERPC_PAPR_SCM_H_
+
+#include <linux/types.h>
+#include <asm/bitsperlong.h>
+#include <linux/stringify.h>
+
+/* DIMM health bitmap bitmap indicators */
+/* SCM device is unable to persist memory contents */
+#define PAPR_SCM_DIMM_UNARMED			PPC_BIT(0)
+/* SCM device failed to persist memory contents */
+#define PAPR_SCM_DIMM_SHUTDOWN_DIRTY		PPC_BIT(1)
+/* SCM device contents are persisted from previous IPL */
+#define PAPR_SCM_DIMM_SHUTDOWN_CLEAN		PPC_BIT(2)
+/* SCM device contents are not persisted from previous IPL */
+#define PAPR_SCM_DIMM_EMPTY			PPC_BIT(3)
+/* SCM device memory life remaining is critically low */
+#define PAPR_SCM_DIMM_HEALTH_CRITICAL		PPC_BIT(4)
+/* SCM device will be garded off next IPL due to failure */
+#define PAPR_SCM_DIMM_HEALTH_FATAL		PPC_BIT(5)
+/* SCM contents cannot persist due to current platform health status */
+#define PAPR_SCM_DIMM_HEALTH_UNHEALTHY		PPC_BIT(6)
+/* SCM device is unable to persist memory contents in certain conditions */
+#define PAPR_SCM_DIMM_HEALTH_NON_CRITICAL	PPC_BIT(7)
+/* SCM device is encrypted */
+#define PAPR_SCM_DIMM_ENCRYPTED			PPC_BIT(8)
+/* SCM device has been scrubbed and locked */
+#define PAPR_SCM_DIMM_SCRUBBED_AND_LOCKED	PPC_BIT(9)
+
+/* Bits status indicators for health bitmap indicating unarmed dimm */
+#define PAPR_SCM_DIMM_UNARMED_MASK (PAPR_SCM_DIMM_UNARMED |	\
+					PAPR_SCM_DIMM_HEALTH_UNHEALTHY | \
+					PAPR_SCM_DIMM_HEALTH_NON_CRITICAL)
+
+/* Bits status indicators for health bitmap indicating unflushed dimm */
+#define PAPR_SCM_DIMM_BAD_SHUTDOWN_MASK (PAPR_SCM_DIMM_SHUTDOWN_DIRTY)
+
+/* Bits status indicators for health bitmap indicating unrestored dimm */
+#define PAPR_SCM_DIMM_BAD_RESTORE_MASK  (PAPR_SCM_DIMM_EMPTY)
+
+/* Bit status indicators for smart event notification */
+#define PAPR_SCM_DIMM_SMART_EVENT_MASK (PAPR_SCM_DIMM_HEALTH_CRITICAL | \
+					   PAPR_SCM_DIMM_HEALTH_FATAL | \
+					   PAPR_SCM_DIMM_HEALTH_UNHEALTHY | \
+					   PAPR_SCM_DIMM_HEALTH_NON_CRITICAL)
+
+#define PAPR_SCM_PERF_STATS_EYECATCHER __stringify(SCMSTATS)
+
+/* Struct holding a single performance metric */
+struct papr_scm_perf_stat {
+	__be64 statistic_id;
+	__be64 statistic_value;
+};
+
+/* Struct exchanged between kernel and ndctl reporting drc perf stats */
+struct papr_scm_perf_stats {
+	uint8_t eye_catcher[8];
+	__be32 stats_version;		/* Should be 0x01 */
+	__be32 num_statistics;		/* Number of stats following */
+	/* zero or more performance matrics */
+	struct papr_scm_perf_stat scm_statistics[];
+} __packed;
+
+#endif
-- 
2.24.1

