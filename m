Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62002678C0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 08:08:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lzrN2ddKzDqxB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 16:08:52 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lzgD2yHmzDqv1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 16:00:56 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6D5uORt011852
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 02:00:54 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tq1q2vrqb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 02:00:54 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Sat, 13 Jul 2019 07:00:53 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 13 Jul 2019 07:00:51 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6D60njk58392966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2019 06:00:49 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EEABCC6059;
 Sat, 13 Jul 2019 06:00:48 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1870CC6057;
 Sat, 13 Jul 2019 06:00:46 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.135.203])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 13 Jul 2019 06:00:45 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 03/13] powerpc/prom_init: Add the ESM call to prom_init
Date: Sat, 13 Jul 2019 03:00:13 -0300
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190713060023.8479-1-bauerman@linux.ibm.com>
References: <20190713060023.8479-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19071306-0004-0000-0000-00001526F176
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011419; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01231433; UDB=6.00648705; IPR=6.01012726; 
 MB=3.00027699; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-13 06:00:53
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071306-0005-0000-0000-00008C6EF4D3
Message-Id: <20190713060023.8479-4-bauerman@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-13_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907130070
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
mode. Add "svm=" command line option to turn on switching to secure mode.

Signed-off-by: Ram Pai <linuxram@us.ibm.com>
[ andmike: Generate an RTAS os-term hcall when the ESM ucall fails. ]
Signed-off-by: Michael Anderson <andmike@linux.ibm.com>
[ bauerman: Cleaned up the code a bit. ]
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 .../admin-guide/kernel-parameters.txt         |  5 +
 arch/powerpc/include/asm/ultravisor-api.h     |  1 +
 arch/powerpc/kernel/prom_init.c               | 99 +++++++++++++++++++
 3 files changed, 105 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 7b15abf7db21..c611891b5992 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4585,6 +4585,11 @@
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
index c8180427fa01..fe9a0d8d7673 100644
--- a/arch/powerpc/include/asm/ultravisor-api.h
+++ b/arch/powerpc/include/asm/ultravisor-api.h
@@ -19,6 +19,7 @@
 
 /* opcodes */
 #define UV_WRITE_PATE			0xF104
+#define UV_ESM				0xF110
 #define UV_RETURN			0xF11C
 #define UV_REGISTER_MEM_SLOT		0xF120
 #define UV_UNREGISTER_MEM_SLOT		0xF124
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index a3fb90bb5a39..6389a992451b 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -44,6 +44,7 @@
 #include <asm/sections.h>
 #include <asm/machdep.h>
 #include <asm/asm-prototypes.h>
+#include <asm/ultravisor-api.h>
 
 #include <linux/linux_logo.h>
 
@@ -175,6 +176,10 @@ static bool __prombss prom_radix_disable;
 static bool __prombss prom_xive_disable;
 #endif
 
+#ifdef CONFIG_PPC_SVM
+static bool __prombss prom_svm_enable;
+#endif
+
 struct platform_support {
 	bool hash_mmu;
 	bool radix_mmu;
@@ -816,6 +821,17 @@ static void __init early_cmdline_parse(void)
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
@@ -1716,6 +1732,43 @@ static void __init prom_close_stdin(void)
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
@@ -3172,6 +3225,49 @@ static void unreloc_toc(void)
 #endif
 #endif
 
+#ifdef CONFIG_PPC_SVM
+/*
+ * Perform the Enter Secure Mode ultracall.
+ */
+static int enter_secure_mode(unsigned long kbase, unsigned long fdt)
+{
+	register uint64_t func asm("r3") = UV_ESM;
+	register uint64_t arg1 asm("r4") = (uint64_t)kbase;
+	register uint64_t arg2 asm("r5") = (uint64_t)fdt;
+
+	asm volatile("sc 2\n"
+		     : "=r"(func)
+		     : "0"(func), "r"(arg1), "r"(arg2)
+		     :);
+
+	return (int)func;
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
@@ -3370,6 +3466,9 @@ unsigned long __init prom_init(unsigned long r3, unsigned long r4,
 	unreloc_toc();
 #endif
 
+	/* Move to secure memory if we're supposed to be secure guests. */
+	setup_secure_guest(kbase, hdr);
+
 	__start(hdr, kbase, 0, 0, 0, 0, 0);
 
 	return 0;

