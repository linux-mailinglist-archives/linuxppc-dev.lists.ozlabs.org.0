Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F68A1879B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 07:33:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hNfF0ZDTzDqcN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 17:33:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hNSX205xzDqT7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 17:25:00 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02H6OI4U100040
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 02:24:56 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ytgkv0aem-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 02:24:56 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <kjain@linux.ibm.com>;
 Tue, 17 Mar 2020 06:24:54 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Mar 2020 06:24:48 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02H6Nkrg25559366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 06:23:46 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D5F111C06C;
 Tue, 17 Mar 2020 06:24:46 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D94D11C05E;
 Tue, 17 Mar 2020 06:24:37 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.63.85])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Mar 2020 06:24:37 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 sukadev@linux.vnet.ibm.com
Subject: [PATCH v5 04/11] powerpc/hv-24x7: Add rtas call in hv-24x7 driver to
 get processor details
Date: Tue, 17 Mar 2020 11:53:26 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200317062333.14555-1-kjain@linux.ibm.com>
References: <20200317062333.14555-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20031706-0028-0000-0000-000003E613F8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031706-0029-0000-0000-000024AB676C
Message-Id: <20200317062333.14555-5-kjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-17_01:2020-03-12,
 2020-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=371
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003170024
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 yao.jin@linux.intel.com, mingo@kernel.org, kan.liang@linux.intel.com,
 ak@linux.intel.com, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 ravi.bangoria@linux.ibm.com, kjain@linux.ibm.com, jmario@redhat.com,
 namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For hv_24x7 socket/chip level events, specific chip-id to which
the data requested should be added as part of pmu events.
But number of chips/socket in the system details are not exposed.

Patch implements read_sys_info_pseries() to get system
parameter values like number of sockets and chips per socket.
Rtas_call with token "PROCESSOR_MODULE_INFO"
is used to get these values.

Sub-sequent patch exports these values via sysfs.

Patch also make these parameters default to 1.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-24x7.c              | 72 ++++++++++++++++++++++++
 arch/powerpc/platforms/pseries/pseries.h |  3 +
 2 files changed, 75 insertions(+)

diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index 48e8f4b17b91..9ae00f29bd21 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -20,6 +20,11 @@
 #include <asm/io.h>
 #include <linux/byteorder/generic.h>
 
+#ifdef CONFIG_PPC_RTAS
+#include <asm/rtas.h>
+#include <../../platforms/pseries/pseries.h>
+#endif
+
 #include "hv-24x7.h"
 #include "hv-24x7-catalog.h"
 #include "hv-common.h"
@@ -57,6 +62,69 @@ static bool is_physical_domain(unsigned domain)
 	}
 }
 
+#ifdef CONFIG_PPC_RTAS
+#define PROCESSOR_MODULE_INFO   43
+#define PROCESSOR_MAX_LENGTH	(8 * 1024)
+
+static int strbe16toh(const char *buf, int offset)
+{
+	return (buf[offset] << 8) + buf[offset + 1];
+}
+
+static u32		physsockets;	/* Physical sockets */
+static u32		physchips;	/* Physical chips */
+
+/*
+ * Function read_sys_info_pseries() make a rtas_call which require
+ * data buffer of size 8K. As standard 'rtas_data_buf' is of size
+ * 4K, we are adding new local buffer 'rtas_local_data_buf'.
+ */
+char rtas_local_data_buf[PROCESSOR_MAX_LENGTH] __cacheline_aligned;
+
+/*
+ * read_sys_info_pseries()
+ * Retrieve the number of sockets and chips per socket details
+ * through the get-system-parameter rtas call.
+ */
+void read_sys_info_pseries(void)
+{
+	int call_status, len, ntypes;
+
+	/*
+	 * Making system parameter: chips and sockets default to 1.
+	 */
+	physsockets = 1;
+	physchips = 1;
+	memset(rtas_local_data_buf, 0, PROCESSOR_MAX_LENGTH);
+	spin_lock(&rtas_data_buf_lock);
+
+	call_status = rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
+				NULL,
+				PROCESSOR_MODULE_INFO,
+				__pa(rtas_local_data_buf),
+				PROCESSOR_MAX_LENGTH);
+
+	spin_unlock(&rtas_data_buf_lock);
+
+	if (call_status != 0) {
+		pr_info("%s %s Error calling get-system-parameter (0x%x)\n",
+			__FILE__, __func__, call_status);
+	} else {
+		rtas_local_data_buf[PROCESSOR_MAX_LENGTH - 1] = '\0';
+		len = strbe16toh(rtas_local_data_buf, 0);
+		if (len < 6)
+			return;
+
+		ntypes = strbe16toh(rtas_local_data_buf, 2);
+
+		if (!ntypes)
+			return;
+		physsockets = strbe16toh(rtas_local_data_buf, 4);
+		physchips = strbe16toh(rtas_local_data_buf, 6);
+	}
+}
+#endif /* CONFIG_PPC_RTAS */
+
 /* Domains for which more than one result element are returned for each event. */
 static bool domain_needs_aggregation(unsigned int domain)
 {
@@ -1605,6 +1673,10 @@ static int hv_24x7_init(void)
 	if (r)
 		return r;
 
+#ifdef CONFIG_PPC_RTAS
+	read_sys_info_pseries();
+#endif
+
 	return 0;
 }
 
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 13fa370a87e4..1727559ce304 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -19,6 +19,9 @@ extern void request_event_sources_irqs(struct device_node *np,
 struct pt_regs;
 
 extern int pSeries_system_reset_exception(struct pt_regs *regs);
+#ifdef CONFIG_PPC_RTAS
+extern void read_sys_info_pseries(void);
+#endif
 extern int pSeries_machine_check_exception(struct pt_regs *regs);
 extern long pseries_machine_check_realmode(struct pt_regs *regs);
 
-- 
2.18.1

