Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C54D817D94E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Mar 2020 07:31:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48bSzb3w9szDr4d
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Mar 2020 17:31:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48bSt61PcwzDqQX
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Mar 2020 17:26:37 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0296LX1B101335
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Mar 2020 02:26:35 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ym5e1kwk3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2020 02:26:35 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <kjain@linux.ibm.com>;
 Mon, 9 Mar 2020 06:26:33 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 9 Mar 2020 06:26:28 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0296QQ6a13238530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Mar 2020 06:26:26 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFBBBA405C;
 Mon,  9 Mar 2020 06:26:26 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79A34A4054;
 Mon,  9 Mar 2020 06:26:20 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.44.242])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  9 Mar 2020 06:26:20 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 sukadev@linux.vnet.ibm.com
Subject: [PATCH v4 2/8] powerpc/hv-24x7: Add rtas call in hv-24x7 driver to
 get processor details
Date: Mon,  9 Mar 2020 11:55:46 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200309062552.29911-1-kjain@linux.ibm.com>
References: <20200309062552.29911-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030906-0012-0000-0000-0000038E71CD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030906-0013-0000-0000-000021CB3886
Message-Id: <20200309062552.29911-3-kjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-09_01:2020-03-06,
 2020-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 suspectscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=377 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2003090046
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

