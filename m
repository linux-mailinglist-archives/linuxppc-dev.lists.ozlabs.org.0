Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1098A1E0C18
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 12:48:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Vv2s33wRzDqQ3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 20:48:37 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Vtx80h83zDqPm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 May 2020 20:43:39 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04PAcEEX049731; Mon, 25 May 2020 06:43:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 318ajs353j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 May 2020 06:43:30 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04PAcGh0050022;
 Mon, 25 May 2020 06:43:30 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 318ajs352w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 May 2020 06:43:30 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04PAfN97015405;
 Mon, 25 May 2020 10:43:28 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 316uf8hjv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 May 2020 10:43:28 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04PAhPeC45219926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 May 2020 10:43:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A85F11C04C;
 Mon, 25 May 2020 10:43:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6875011C04A;
 Mon, 25 May 2020 10:43:21 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.38.13])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 25 May 2020 10:43:21 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, suka@us.ibm.com,
 nathanl@linux.ibm.com
Subject: [PATCH v10 2/5] powerpc/hv-24x7: Add rtas call in hv-24x7 driver to
 get processor details
Date: Mon, 25 May 2020 16:13:04 +0530
Message-Id: <20200525104308.9814-3-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200525104308.9814-1-kjain@linux.ibm.com>
References: <20200525104308.9814-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-25_04:2020-05-25,
 2020-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005250077
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
Cc: ravi.bangoria@linux.ibm.com, maddy@linux.vnet.ibm.com, mpetlan@redhat.com,
 peterz@infradead.org, gregkh@linuxfoundation.org,
 alexander.shishkin@linux.intel.com, anju@linux.vnet.ibm.com,
 mamatha4@linux.vnet.ibm.com, jmario@redhat.com, namhyung@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For hv_24x7 socket/chip level events, specific chip-id to which
the data requested should be added as part of pmu events.
But number of chips/socket in the system details are not exposed.

Patch implements read_24x7_sys_info() to get system
parameter values like number of sockets, cores per chip and
chips per socket. Rtas_call with token "PROCESSOR_MODULE_INFO"
is used to get these values.

Sub-sequent patch exports these values via sysfs.

Patch also make these parameters default to 1

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h |  6 ++++
 arch/powerpc/perf/hv-24x7.c     | 64 +++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 3c1887351c71..7ef81b3e33f6 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -483,5 +483,11 @@ static inline void rtas_initialize(void) { };
 
 extern int call_rtas(const char *, int, int, unsigned long *, ...);
 
+#ifdef CONFIG_HV_PERF_CTRS
+void read_24x7_sys_info(void);
+#else
+static inline void read_24x7_sys_info(void) { }
+#endif
+
 #endif /* __KERNEL__ */
 #endif /* _POWERPC_RTAS_H */
diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index 48e8f4b17b91..5cd954af5445 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -20,6 +20,7 @@
 #include <asm/io.h>
 #include <linux/byteorder/generic.h>
 
+#include <asm/rtas.h>
 #include "hv-24x7.h"
 #include "hv-24x7-catalog.h"
 #include "hv-common.h"
@@ -57,6 +58,67 @@ static bool is_physical_domain(unsigned domain)
 	}
 }
 
+/*
+ * The Processor Module Information system parameter allows transferring
+ * of certain processor module information from the platform to the OS.
+ * Refer PAPR+ document to get parameter token value as '43'.
+ */
+
+#define PROCESSOR_MODULE_INFO   43
+
+static u32 phys_sockets;	/* Physical sockets */
+static u32 phys_chipspersocket;	/* Physical chips per socket*/
+static u32 phys_coresperchip; /* Physical cores per chip */
+
+/*
+ * read_24x7_sys_info()
+ * Retrieve the number of sockets and chips per socket and cores per
+ * chip details through the get-system-parameter rtas call.
+ */
+void read_24x7_sys_info(void)
+{
+	int call_status, len, ntypes;
+
+	spin_lock(&rtas_data_buf_lock);
+
+	/*
+	 * Making system parameter: chips and sockets and cores per chip
+	 * default to 1.
+	 */
+	phys_sockets = 1;
+	phys_chipspersocket = 1;
+	phys_coresperchip = 1;
+
+	call_status = rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
+				NULL,
+				PROCESSOR_MODULE_INFO,
+				__pa(rtas_data_buf),
+				RTAS_DATA_BUF_SIZE);
+
+	rtas_data_buf[RTAS_DATA_BUF_SIZE - 1] = '\0';
+
+	if (call_status != 0) {
+		pr_err("Error calling get-system-parameter %d\n",
+		       call_status);
+	} else {
+		len = be16_to_cpup((__be16 *)&rtas_data_buf[0]);
+		if (len < 8)
+			goto out;
+
+		ntypes = be16_to_cpup((__be16 *)&rtas_data_buf[2]);
+
+		if (!ntypes)
+			goto out;
+
+		phys_sockets = be16_to_cpup((__be16 *)&rtas_data_buf[4]);
+		phys_chipspersocket = be16_to_cpup((__be16 *)&rtas_data_buf[6]);
+		phys_coresperchip = be16_to_cpup((__be16 *)&rtas_data_buf[8]);
+	}
+
+out:
+	spin_unlock(&rtas_data_buf_lock);
+}
+
 /* Domains for which more than one result element are returned for each event. */
 static bool domain_needs_aggregation(unsigned int domain)
 {
@@ -1605,6 +1667,8 @@ static int hv_24x7_init(void)
 	if (r)
 		return r;
 
+	read_24x7_sys_info();
+
 	return 0;
 }
 
-- 
2.18.2

