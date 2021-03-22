Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4141934485A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 15:58:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3yL627jyz30FP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 01:58:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=agKT+D9x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=agKT+D9x; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3yKg5W3Lz2xg5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 01:57:59 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12MEXUsq159650; Mon, 22 Mar 2021 10:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=JroW8II15PpaJ6PfT0kKEEbPRxDsswedl5u16nUjcbY=;
 b=agKT+D9xdUDjzoumTkhkxlag5XH6CHHorY5jAaRzuYLoxIb01WG6l2cw6YP8cLP9+jDB
 ui3++yxupjMPFxRC+PCOYJkRDsqYsU+uYfoTzHgWncS20HAgWOkcKw6Y/i8yyqAjcru4
 UIVE9bUOaZlD1+LDlCItMzpCdAi7LZzFGOxwddAUEWQ1MQzIxTmQd3CQKekW4rMgdTtG
 c+c9Qh/YPBH9WGaJbIWS+jEGQxaBNJc995y9S1CwJ4DBZsCocTtJzq1pEQjGKwH5oYcU
 zTOv/etj+l+3P2iiCWeIlqmlM9Kv24Fhzniv9Js8RXW2mu8XwWE86Ojyfe4QrXpyuiCs kA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37e03f25fk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 10:57:47 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12MEgweY011362;
 Mon, 22 Mar 2021 14:57:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 37d9by98vh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 14:57:45 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12MEvgS89699824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Mar 2021 14:57:42 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A3814C052;
 Mon, 22 Mar 2021 14:57:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB1DB4C04E;
 Mon, 22 Mar 2021 14:57:39 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.124.209.79])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 22 Mar 2021 14:57:39 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, mpe@ellerman.id.au, acme@kernel.org,
 jolsa@kernel.org
Subject: [PATCH V2 3/5] tools/perf: Add powerpc support for
 PERF_SAMPLE_WEIGHT_STRUCT
Date: Mon, 22 Mar 2021 10:57:25 -0400
Message-Id: <1616425047-1666-4-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_07:2021-03-22,
 2021-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103220107
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
Cc: kan.liang@linux.intel.com, ravi.bangoria@linux.ibm.com,
 peterz@infradead.org, maddy@linux.ibm.com, kjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add arch specific arch_evsel__set_sample_weight() to set the new
sample type for powerpc.

Add arch specific arch_perf_parse_sample_weight() to store the
sample->weight values depending on the sample type applied.
if the new sample type (PERF_SAMPLE_WEIGHT_STRUCT) is applied,
store only the lower 32 bits to sample->weight. If sample type
is 'PERF_SAMPLE_WEIGHT', store the full 64-bit to sample->weight.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/arch/powerpc/util/Build   |  2 ++
 tools/perf/arch/powerpc/util/event.c | 32 ++++++++++++++++++++++++++++++++
 tools/perf/arch/powerpc/util/evsel.c |  8 ++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 tools/perf/arch/powerpc/util/event.c
 create mode 100644 tools/perf/arch/powerpc/util/evsel.c

diff --git a/tools/perf/arch/powerpc/util/Build b/tools/perf/arch/powerpc/util/Build
index b7945e5a543b..8a79c4126e5b 100644
--- a/tools/perf/arch/powerpc/util/Build
+++ b/tools/perf/arch/powerpc/util/Build
@@ -4,6 +4,8 @@ perf-y += kvm-stat.o
 perf-y += perf_regs.o
 perf-y += mem-events.o
 perf-y += sym-handling.o
+perf-y += evsel.o
+perf-y += event.o
 
 perf-$(CONFIG_DWARF) += dwarf-regs.o
 perf-$(CONFIG_DWARF) += skip-callchain-idx.o
diff --git a/tools/perf/arch/powerpc/util/event.c b/tools/perf/arch/powerpc/util/event.c
new file mode 100644
index 000000000000..f49d32c2c8ae
--- /dev/null
+++ b/tools/perf/arch/powerpc/util/event.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/types.h>
+#include <linux/string.h>
+#include <linux/zalloc.h>
+
+#include "../../../util/event.h"
+#include "../../../util/synthetic-events.h"
+#include "../../../util/machine.h"
+#include "../../../util/tool.h"
+#include "../../../util/map.h"
+#include "../../../util/debug.h"
+
+void arch_perf_parse_sample_weight(struct perf_sample *data,
+				   const __u64 *array, u64 type)
+{
+	union perf_sample_weight weight;
+
+	weight.full = *array;
+	if (type & PERF_SAMPLE_WEIGHT)
+		data->weight = weight.full;
+	else
+		data->weight = weight.var1_dw;
+}
+
+void arch_perf_synthesize_sample_weight(const struct perf_sample *data,
+					__u64 *array, u64 type)
+{
+	*array = data->weight;
+
+	if (type & PERF_SAMPLE_WEIGHT_STRUCT)
+		*array &= 0xffffffff;
+}
diff --git a/tools/perf/arch/powerpc/util/evsel.c b/tools/perf/arch/powerpc/util/evsel.c
new file mode 100644
index 000000000000..2f733cdc8dbb
--- /dev/null
+++ b/tools/perf/arch/powerpc/util/evsel.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <stdio.h>
+#include "util/evsel.h"
+
+void arch_evsel__set_sample_weight(struct evsel *evsel)
+{
+	evsel__set_sample_bit(evsel, WEIGHT_STRUCT);
+}
-- 
1.8.3.1

