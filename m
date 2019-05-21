Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD2E24726
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 06:57:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457Nm36NnzzDqN3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 14:57:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457Nf34QHvzDqFD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 14:51:55 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4L4lElo115617
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 00:51:53 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sm8ygb9ud-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 00:51:52 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Tue, 21 May 2019 05:51:52 +0100
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 21 May 2019 05:51:49 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4L4pmFk62128206
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 May 2019 04:51:48 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E91C8C6057;
 Tue, 21 May 2019 04:51:47 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C72DFC605B;
 Tue, 21 May 2019 04:51:37 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.80.203.157])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 21 May 2019 04:51:37 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 03/12] powerpc/prom_init: Add the ESM call to prom_init
Date: Tue, 21 May 2019 01:49:03 -0300
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521044912.1375-1-bauerman@linux.ibm.com>
References: <20190521044912.1375-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19052104-0016-0000-0000-000009B70A0C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011134; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01206342; UDB=6.00633450; IPR=6.00987310; 
 MB=3.00026980; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-21 04:51:51
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052104-0017-0000-0000-0000434D4B5C
Message-Id: <20190521044912.1375-4-bauerman@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905210030
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
mode. Add "svm=" command line option to turn off switching to secure mode.
Introduce CONFIG_PPC_SVM to control support for secure guests.

Signed-off-by: Ram Pai <linuxram@us.ibm.com>
[ Generate an RTAS os-term hcall when the ESM ucall fails. ]
Signed-off-by: Michael Anderson <andmike@linux.ibm.com>
[ Cleaned up the code a bit. ]
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 .../admin-guide/kernel-parameters.txt         |   5 +
 arch/powerpc/include/asm/ultravisor-api.h     |   1 +
 arch/powerpc/kernel/prom_init.c               | 124 ++++++++++++++++++
 3 files changed, 130 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c45a19d654f3..7237d86b25c6 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4501,6 +4501,11 @@
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
index 15e6ce77a131..0e8b72081718 100644
--- a/arch/powerpc/include/asm/ultravisor-api.h
+++ b/arch/powerpc/include/asm/ultravisor-api.h
@@ -19,6 +19,7 @@
 
 /* opcodes */
 #define UV_WRITE_PATE			0xF104
+#define UV_ESM				0xF110
 #define UV_RETURN			0xF11C
 
 #endif /* _ASM_POWERPC_ULTRAVISOR_API_H */
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 523bb99d7676..5d8a3efb54f2 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -44,6 +44,7 @@
 #include <asm/sections.h>
 #include <asm/machdep.h>
 #include <asm/asm-prototypes.h>
+#include <asm/ultravisor-api.h>
 
 #include <linux/linux_logo.h>
 
@@ -174,6 +175,10 @@ static unsigned long __prombss prom_tce_alloc_end;
 static bool __prombss prom_radix_disable;
 #endif
 
+#ifdef CONFIG_PPC_SVM
+static bool __prombss prom_svm_disable;
+#endif
+
 struct platform_support {
 	bool hash_mmu;
 	bool radix_mmu;
@@ -809,6 +814,17 @@ static void __init early_cmdline_parse(void)
 	if (prom_radix_disable)
 		prom_debug("Radix disabled from cmdline\n");
 #endif /* CONFIG_PPC_PSERIES */
+
+#ifdef CONFIG_PPC_SVM
+	opt = prom_strstr(prom_cmd_line, "svm=");
+	if (opt) {
+		bool val;
+
+		opt += sizeof("svm=") - 1;
+		if (!prom_strtobool(opt, &val))
+			prom_svm_disable = !val;
+	}
+#endif /* CONFIG_PPC_SVM */
 }
 
 #ifdef CONFIG_PPC_PSERIES
@@ -1707,6 +1723,43 @@ static void __init prom_close_stdin(void)
 	}
 }
 
+#ifdef CONFIG_PPC_SVM
+static int prom_rtas_os_term_hcall(uint64_t args)
+{
+	register uint64_t arg1 asm("r3") = 0xf000;
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
+	prom_printf("%s: start...\n", __func__);
+	rtas_node = call_prom("finddevice", 1, 1, ADDR("/rtas"));
+	prom_printf("rtas_node: %x\n", rtas_node);
+	if (!PHANDLE_VALID(rtas_node))
+		return;
+
+	val = 0;
+	prom_getprop(rtas_node, "ibm,os-term", &val, sizeof(val));
+	token = be32_to_cpu(val);
+	prom_printf("ibm,os-term: %x\n", token);
+	if (token == 0)
+		prom_panic("Could not get token for ibm,os-term\n");
+	os_term_args.token = cpu_to_be32(token);
+	prom_rtas_os_term_hcall((uint64_t)&os_term_args);
+}
+#endif /* CONFIG_PPC_SVM */
+
 /*
  * Allocate room for and instantiate RTAS
  */
@@ -3162,6 +3215,74 @@ static void unreloc_toc(void)
 #endif
 #endif
 
+#ifdef CONFIG_PPC_SVM
+/*
+ * The ESM blob is a data structure with information needed by the Ultravisor to
+ * validate the integrity of the secure guest.
+ */
+static void *get_esm_blob(void)
+{
+	/*
+	 * FIXME: We are still finalizing the details on how prom_init will grab
+	 * the ESM blob. When that is done, this function will be updated.
+	 */
+	return (void *)0xdeadbeef;
+}
+
+/*
+ * Perform the Enter Secure Mode ultracall.
+ */
+static int enter_secure_mode(void *esm_blob, void *retaddr, void *fdt)
+{
+	register uint64_t func asm("r0") = UV_ESM;
+	register uint64_t arg1 asm("r3") = (uint64_t)esm_blob;
+	register uint64_t arg2 asm("r4") = (uint64_t)retaddr;
+	register uint64_t arg3 asm("r5") = (uint64_t)fdt;
+
+	asm volatile("sc 2\n"
+		     : "=r"(arg1)
+		     : "r"(func), "0"(arg1), "r"(arg2), "r"(arg3)
+		     :);
+
+	return (int)arg1;
+}
+
+/*
+ * Call the Ultravisor to transfer us to secure memory if we have an ESM blob.
+ */
+static void setup_secure_guest(void *fdt)
+{
+	void *esm_blob;
+	int ret;
+
+	if (prom_svm_disable) {
+		prom_printf("Secure mode is OFF\n");
+		return;
+	}
+
+	esm_blob = get_esm_blob();
+	if (esm_blob == NULL)
+		/*
+		 * Absence of an ESM blob isn't an error, it just means we
+		 * shouldn't switch to secure mode.
+		 */
+		return;
+
+	/* Switch to secure mode. */
+	prom_printf("Switching to secure mode.\n");
+
+	ret = enter_secure_mode(esm_blob, NULL, fdt);
+	if (ret != U_SUCCESS) {
+		prom_printf("Returned %d from switching to secure mode.\n", ret);
+		prom_rtas_os_term("Switch to secure mode failed.\n");
+	}
+}
+#else
+static void setup_secure_guest(void *fdt)
+{
+}
+#endif /* CONFIG_PPC_SVM */
+
 /*
  * We enter here early on, when the Open Firmware prom is still
  * handling exceptions and the MMU hash table for us.
@@ -3360,6 +3481,9 @@ unsigned long __init prom_init(unsigned long r3, unsigned long r4,
 	unreloc_toc();
 #endif
 
+	/* Move to secure memory if we're supposed to be secure guests. */
+	setup_secure_guest((void *)hdr);
+
 	__start(hdr, kbase, 0, 0, 0, 0, 0);
 
 	return 0;

