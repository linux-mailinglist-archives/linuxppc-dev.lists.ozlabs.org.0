Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0088F6ED2F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2019 03:31:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45r9MK1Y9MzDqwt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2019 11:31:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 45r9Js4zDtzDqwL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jul 2019 11:29:33 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 506A6AE807F9;
 Fri, 19 Jul 2019 21:29:25 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel RFC 2/2] powerpc/pseries: Kexec style ibm,
 client-architecture-support support
Date: Sat, 20 Jul 2019 11:29:19 +1000
Message-Id: <20190720012919.14417-3-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190720012919.14417-1-aik@ozlabs.ru>
References: <20190720012919.14417-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This checks the FDT for "/chosen/qemu,h_cas" and calls H_CAS when present.
The H_CAS hcall is implemented in QEMU for ages and currently returns
an FDT with a diff to the initial FDT which SLOF updates and returns to
the OS. For this patch to work, QEMU needs to provide the full tree
instead, so when QEMU is run with the "-machine pseries,bios=no",
it reads the existing FDT from the OS, updats it and writes back on top.

This changes prom_check_platform_support() not to call the client
interface's prom_getproplen() as the kexec-style boot does not provide
the client interface services.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kernel/prom_init.c | 12 ++++++----
 arch/powerpc/kernel/setup_64.c  | 41 +++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 514707ef6779..6d8e35cb3c57 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -1261,7 +1261,7 @@ static void __init prom_parse_platform_support(u8 index, u8 val,
 	}
 }
 
-static void __init prom_check_platform_support(void)
+struct ibm_arch_vec __init *prom_check_platform_support(int prop_len)
 {
 	struct platform_support supported = {
 		.hash_mmu = false,
@@ -1269,8 +1269,6 @@ static void __init prom_check_platform_support(void)
 		.radix_gtse = false,
 		.xive = false
 	};
-	int prop_len = prom_getproplen(prom.chosen,
-				       "ibm,arch-vec-5-platform-support");
 
 	/*
 	 * First copy the architecture vec template
@@ -1319,7 +1317,12 @@ static void __init prom_check_platform_support(void)
 		prom_debug("Asking for XIVE\n");
 		ibm_architecture_vec.vec5.intarch = OV5_FEAT(OV5_XIVE_EXPLOIT);
 	}
+
+	ibm_architecture_vec.vec5.max_cpus = cpu_to_be32(NR_CPUS);
+
+	return &ibm_architecture_vec;
 }
+EXPORT_SYMBOL_GPL(prom_check_platform_support);
 
 static void __init prom_send_capabilities(void)
 {
@@ -1328,7 +1331,8 @@ static void __init prom_send_capabilities(void)
 	u32 cores;
 
 	/* Check ibm,arch-vec-5-platform-support and fixup vec5 if required */
-	prom_check_platform_support();
+	prom_check_platform_support(prom_getproplen(prom.chosen,
+				"ibm,arch-vec-5-platform-support"));
 
 	root = call_prom("open", 1, 1, ADDR("/"));
 	if (root != 0) {
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 44b4c432a273..6fa384278180 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -284,12 +284,53 @@ void __init record_spr_defaults(void)
  * device-tree is not accessible via normal means at this point.
  */
 
+/*
+ * The architecture vector has an array of PVR mask/value pairs,
+ * followed by # option vectors - 1, followed by the option vectors.
+ *
+ * See prom.h for the definition of the bits specified in the
+ * architecture vector.
+ */
+
+extern struct ibm_arch_vec __init *prom_check_platform_support(
+		int vec5_prop_len);
+
+int __init early_init_dt_scan_chosen_h_cas(unsigned long node,
+		const char *uname, int depth, void *data)
+{
+	int l;
+	const char *p;
+
+	if (depth != 1 || !data ||
+	    (strcmp(uname, "chosen") != 0 && strcmp(uname, "chosen@0") != 0))
+		return 0;
+	p = of_get_flat_dt_prop(node, "qemu,h_cas", &l);
+	if (p != NULL && l > 0)
+		*(bool *) data = be32_to_cpu(*(uint32_t *) p) != 0;
+
+	return 1;
+}
+
 void __init early_setup(unsigned long dt_ptr)
 {
 	static __initdata struct paca_struct boot_paca;
+	struct ibm_arch_vec *vec = prom_check_platform_support(0);
 
 	/* -------- printk is _NOT_ safe to use here ! ------- */
 
+	/* ibm,client-architecture-support support */
+#define KVMPPC_HCALL_BASE       0xf000
+#define KVMPPC_H_CAS            (KVMPPC_HCALL_BASE + 0x2)
+#define FDT_MAX_SIZE 0x100000
+	bool do_h_cas = false;
+
+	if (early_init_dt_verify(__va(dt_ptr))) {
+		of_scan_flat_dt(early_init_dt_scan_chosen_h_cas, &do_h_cas);
+		if (do_h_cas)
+			plpar_hcall_norets(KVMPPC_H_CAS, vec, dt_ptr,
+					FDT_MAX_SIZE);
+	}
+
 	/* Try new device tree based feature discovery ... */
 	if (!dt_cpu_ftrs_init(__va(dt_ptr)))
 		/* Otherwise use the old style CPU table */
-- 
2.17.1

