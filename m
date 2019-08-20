Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDF195451
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 04:24:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CF4528bVzDqpd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 12:24:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CDr04wyMzDqlW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 12:14:08 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7K2Cn0d059013; Mon, 19 Aug 2019 22:14:03 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ug12adx4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2019 22:14:03 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7K2DbXf066182;
 Mon, 19 Aug 2019 22:14:02 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ug12adx48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2019 22:14:02 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7K29nnI018689;
 Tue, 20 Aug 2019 02:14:01 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 2ue976j2w9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Aug 2019 02:14:01 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7K2Dxgx45416738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 02:13:59 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5F8FC6057;
 Tue, 20 Aug 2019 02:13:59 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAA09C605B;
 Tue, 20 Aug 2019 02:13:56 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.220.248])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 20 Aug 2019 02:13:56 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 04/16] powerpc/prom_init: Add the ESM call to prom_init
Date: Mon, 19 Aug 2019 23:13:14 -0300
Message-Id: <20190820021326.6884-5-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820021326.6884-1-bauerman@linux.ibm.com>
References: <20190820021326.6884-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200018
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ram Pai <linuxram@us.ibm.com>

Make the Enter-Secure-Mode (ESM) ultravisor call to switch the VM to secure
mode. Pass kernel base address and FDT address so that the Ultravisor is
able to verify the integrity of the VM using information from the ESM blob.

Add "svm=" command line option to turn on switching to secure mode.

Signed-off-by: Ram Pai <linuxram@us.ibm.com>
[ andmike: Generate an RTAS os-term hcall when the ESM ucall fails. ]
Signed-off-by: Michael Anderson <andmike@linux.ibm.com>
[ bauerman: Cleaned up the code a bit. ]
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 .../admin-guide/kernel-parameters.txt         |  5 +
 arch/powerpc/include/asm/ultravisor-api.h     |  3 +
 arch/powerpc/kernel/prom_init.c               | 96 +++++++++++++++++++
 3 files changed, 104 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 7ccd158b3894..231a008b7961 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4620,6 +4620,11 @@
 			/sys/power/pm_test). Only available when CONFIG_PM_DEBUG
 			is set. Default value is 5.
 
+	svm=		[PPC]
+			Format: { on | off | y | n | 1 | 0 }
+			This parameter controls use of the Protected
+			Execution Facility on pSeries.
+
 	swapaccount=[0|1]
 			[KNL] Enable accounting of swap in memory resource
 			controller if no parameter or 1 is given or disable
diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/include/asm/ultravisor-api.h
index 88ffa78f9d61..d3503d1f447e 100644
--- a/arch/powerpc/include/asm/ultravisor-api.h
+++ b/arch/powerpc/include/asm/ultravisor-api.h
@@ -20,4 +20,7 @@
 #define U_PARAMETER		H_PARAMETER
 #define U_SUCCESS		H_SUCCESS
 
+/* opcodes */
+#define UV_ESM				0xF110
+
 #endif /* _ASM_POWERPC_ULTRAVISOR_API_H */
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 514707ef6779..74f70f90eff0 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -40,6 +40,7 @@
 #include <asm/sections.h>
 #include <asm/machdep.h>
 #include <asm/asm-prototypes.h>
+#include <asm/ultravisor-api.h>
 
 #include <linux/linux_logo.h>
 
@@ -171,6 +172,10 @@ static bool __prombss prom_radix_disable;
 static bool __prombss prom_xive_disable;
 #endif
 
+#ifdef CONFIG_PPC_SVM
+static bool __prombss prom_svm_enable;
+#endif
+
 struct platform_support {
 	bool hash_mmu;
 	bool radix_mmu;
@@ -812,6 +817,17 @@ static void __init early_cmdline_parse(void)
 		prom_debug("XIVE disabled from cmdline\n");
 	}
 #endif /* CONFIG_PPC_PSERIES */
+
+#ifdef CONFIG_PPC_SVM
+	opt = prom_strstr(prom_cmd_line, "svm=");
+	if (opt) {
+		bool val;
+
+		opt += sizeof("svm=") - 1;
+		if (!prom_strtobool(opt, &val))
+			prom_svm_enable = val;
+	}
+#endif /* CONFIG_PPC_SVM */
 }
 
 #ifdef CONFIG_PPC_PSERIES
@@ -1712,6 +1728,43 @@ static void __init prom_close_stdin(void)
 	}
 }
 
+#ifdef CONFIG_PPC_SVM
+static int prom_rtas_hcall(uint64_t args)
+{
+	register uint64_t arg1 asm("r3") = H_RTAS;
+	register uint64_t arg2 asm("r4") = args;
+
+	asm volatile("sc 1\n" : "=r" (arg1) :
+			"r" (arg1),
+			"r" (arg2) :);
+	return arg1;
+}
+
+static struct rtas_args __prombss os_term_args;
+
+static void __init prom_rtas_os_term(char *str)
+{
+	phandle rtas_node;
+	__be32 val;
+	u32 token;
+
+	prom_debug("%s: start...\n", __func__);
+	rtas_node = call_prom("finddevice", 1, 1, ADDR("/rtas"));
+	prom_debug("rtas_node: %x\n", rtas_node);
+	if (!PHANDLE_VALID(rtas_node))
+		return;
+
+	val = 0;
+	prom_getprop(rtas_node, "ibm,os-term", &val, sizeof(val));
+	token = be32_to_cpu(val);
+	prom_debug("ibm,os-term: %x\n", token);
+	if (token == 0)
+		prom_panic("Could not get token for ibm,os-term\n");
+	os_term_args.token = cpu_to_be32(token);
+	prom_rtas_hcall((uint64_t)&os_term_args);
+}
+#endif /* CONFIG_PPC_SVM */
+
 /*
  * Allocate room for and instantiate RTAS
  */
@@ -3168,6 +3221,46 @@ static void unreloc_toc(void)
 #endif
 #endif
 
+#ifdef CONFIG_PPC_SVM
+/*
+ * Perform the Enter Secure Mode ultracall.
+ */
+static int enter_secure_mode(unsigned long kbase, unsigned long fdt)
+{
+	register unsigned long r3 asm("r3") = UV_ESM;
+	register unsigned long r4 asm("r4") = kbase;
+	register unsigned long r5 asm("r5") = fdt;
+
+	asm volatile("sc 2" : "+r"(r3) : "r"(r4), "r"(r5));
+
+	return r3;
+}
+
+/*
+ * Call the Ultravisor to transfer us to secure memory if we have an ESM blob.
+ */
+static void setup_secure_guest(unsigned long kbase, unsigned long fdt)
+{
+	int ret;
+
+	if (!prom_svm_enable)
+		return;
+
+	/* Switch to secure mode. */
+	prom_printf("Switching to secure mode.\n");
+
+	ret = enter_secure_mode(kbase, fdt);
+	if (ret != U_SUCCESS) {
+		prom_printf("Returned %d from switching to secure mode.\n", ret);
+		prom_rtas_os_term("Switch to secure mode failed.\n");
+	}
+}
+#else
+static void setup_secure_guest(unsigned long kbase, unsigned long fdt)
+{
+}
+#endif /* CONFIG_PPC_SVM */
+
 /*
  * We enter here early on, when the Open Firmware prom is still
  * handling exceptions and the MMU hash table for us.
@@ -3366,6 +3459,9 @@ unsigned long __init prom_init(unsigned long r3, unsigned long r4,
 	unreloc_toc();
 #endif
 
+	/* Move to secure memory if we're supposed to be secure guests. */
+	setup_secure_guest(kbase, hdr);
+
 	__start(hdr, kbase, 0, 0, 0, 0, 0);
 
 	return 0;
