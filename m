Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B88C288BA17
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 06:58:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c3tevonb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3fHM3yB3z3vh6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 16:58:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c3tevonb;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3fDF61SRz3d28
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 16:55:41 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4V3fDF5WVvz4wqN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 16:55:41 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4V3fDF5SyDz4wyQ; Tue, 26 Mar 2024 16:55:41 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c3tevonb;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4V3fDF2TtSz4wqN
	for <linuxppc-dev@ozlabs.org>; Tue, 26 Mar 2024 16:55:41 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42Q2qpFN028970;
	Tue, 26 Mar 2024 05:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DU2rJ0WYnHl61Qm5m8BG7gkJfeQx/PqILRYGe9Ogsk4=;
 b=c3tevonb0Vd/aJoMbYTfQXQ43yILZY+Ozm4LyqrMUayc4C68GFLIKJ2yE4cM0uqsbdqn
 5rjuOqu1wRqPI4u0u3CZvFynk61YcBzonFkZZDH6x2oOY25TiHFjuIKLv56O5d8GR4+T
 9HWuPwTaIEZ4FbgLOf060r23JV8guZLXarYrC7Ekz5RGLwJxSVz3Z6aYTj6uiFGn7Ez7
 vis66thRw6x5w2hjKzpPlkf4jtCbnN/WjSZdMFk5KyoQMhLI1b6gna9IMNTzKfWCfrc7
 7+FXXExCtMVzQb74YtcCSlA/08LhivnUV2AtIcZcBwfV+PR4no6hO/IL+sVTrd4WM3bQ lg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x3ny98ccf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 05:55:14 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42Q5tDoc007258;
	Tue, 26 Mar 2024 05:55:13 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x3ny98ccb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 05:55:13 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42Q3Kkdo025558;
	Tue, 26 Mar 2024 05:55:12 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x2awmnr5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 05:55:12 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42Q5t7d742861028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Mar 2024 05:55:09 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DBD12004B;
	Tue, 26 Mar 2024 05:55:07 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F120620040;
	Tue, 26 Mar 2024 05:54:59 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.19.10])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 26 Mar 2024 05:54:59 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v18 4/6] PowerPC/kexec: make the update_cpus_node() function public
Date: Tue, 26 Mar 2024 11:24:11 +0530
Message-ID: <20240326055413.186534-5-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240326055413.186534-1-sourabhjain@linux.ibm.com>
References: <20240326055413.186534-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Vps0vufvVW4IJTioHys0oJ6ENZqE8iGj
X-Proofpoint-GUID: A9d3lgbjNtHRbPZx0pn9Wl9rO84qE86f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_02,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403260037
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the update_cpus_node() from kexec/{file_load_64.c => core_64.c}
to allow other kexec components to use it.

Later in the series, this function is used for in-kernel updates
to the kdump image during CPU/memory hotplug or online/offline events for
both kexec_load and kexec_file_load syscalls.

No functional changes are intended.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Acked-by: Hari Bathini <hbathini@linux.ibm.com>
Cc: Akhil Raj <lf32.dev@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Baoquan He <bhe@redhat.com>
Cc: Borislav Petkov (AMD) <bp@alien8.de>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Dufour <laurent.dufour@fr.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mimi Zohar <zohar@linux.ibm.com>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: kexec@lists.infradead.org
Cc: x86@kernel.org
---
* No changes in v18

 arch/powerpc/include/asm/kexec.h  |  4 ++
 arch/powerpc/kexec/core_64.c      | 91 +++++++++++++++++++++++++++++++
 arch/powerpc/kexec/file_load_64.c | 87 -----------------------------
 3 files changed, 95 insertions(+), 87 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index fdb90e24dc74..d9ff4d0e392d 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -185,6 +185,10 @@ static inline void crash_send_ipi(void (*crash_ipi_callback)(struct pt_regs *))
 
 #endif /* CONFIG_CRASH_DUMP */
 
+#if defined(CONFIG_KEXEC_FILE) || defined(CONFIG_CRASH_DUMP)
+int update_cpus_node(void *fdt);
+#endif
+
 #ifdef CONFIG_PPC_BOOK3S_64
 #include <asm/book3s/64/kexec.h>
 #endif
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 762e4d09aacf..85050be08a23 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -17,6 +17,7 @@
 #include <linux/cpu.h>
 #include <linux/hardirq.h>
 #include <linux/of.h>
+#include <linux/libfdt.h>
 
 #include <asm/page.h>
 #include <asm/current.h>
@@ -30,6 +31,7 @@
 #include <asm/hw_breakpoint.h>
 #include <asm/svm.h>
 #include <asm/ultravisor.h>
+#include <asm/crashdump-ppc64.h>
 
 int machine_kexec_prepare(struct kimage *image)
 {
@@ -419,3 +421,92 @@ static int __init export_htab_values(void)
 }
 late_initcall(export_htab_values);
 #endif /* CONFIG_PPC_64S_HASH_MMU */
+
+#if defined(CONFIG_KEXEC_FILE) || defined(CONFIG_CRASH_DUMP)
+/**
+ * add_node_props - Reads node properties from device node structure and add
+ *                  them to fdt.
+ * @fdt:            Flattened device tree of the kernel
+ * @node_offset:    offset of the node to add a property at
+ * @dn:             device node pointer
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int add_node_props(void *fdt, int node_offset, const struct device_node *dn)
+{
+	int ret = 0;
+	struct property *pp;
+
+	if (!dn)
+		return -EINVAL;
+
+	for_each_property_of_node(dn, pp) {
+		ret = fdt_setprop(fdt, node_offset, pp->name, pp->value, pp->length);
+		if (ret < 0) {
+			pr_err("Unable to add %s property: %s\n", pp->name, fdt_strerror(ret));
+			return ret;
+		}
+	}
+	return ret;
+}
+
+/**
+ * update_cpus_node - Update cpus node of flattened device tree using of_root
+ *                    device node.
+ * @fdt:              Flattened device tree of the kernel.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int update_cpus_node(void *fdt)
+{
+	struct device_node *cpus_node, *dn;
+	int cpus_offset, cpus_subnode_offset, ret = 0;
+
+	cpus_offset = fdt_path_offset(fdt, "/cpus");
+	if (cpus_offset < 0 && cpus_offset != -FDT_ERR_NOTFOUND) {
+		pr_err("Malformed device tree: error reading /cpus node: %s\n",
+		       fdt_strerror(cpus_offset));
+		return cpus_offset;
+	}
+
+	if (cpus_offset > 0) {
+		ret = fdt_del_node(fdt, cpus_offset);
+		if (ret < 0) {
+			pr_err("Error deleting /cpus node: %s\n", fdt_strerror(ret));
+			return -EINVAL;
+		}
+	}
+
+	/* Add cpus node to fdt */
+	cpus_offset = fdt_add_subnode(fdt, fdt_path_offset(fdt, "/"), "cpus");
+	if (cpus_offset < 0) {
+		pr_err("Error creating /cpus node: %s\n", fdt_strerror(cpus_offset));
+		return -EINVAL;
+	}
+
+	/* Add cpus node properties */
+	cpus_node = of_find_node_by_path("/cpus");
+	ret = add_node_props(fdt, cpus_offset, cpus_node);
+	of_node_put(cpus_node);
+	if (ret < 0)
+		return ret;
+
+	/* Loop through all subnodes of cpus and add them to fdt */
+	for_each_node_by_type(dn, "cpu") {
+		cpus_subnode_offset = fdt_add_subnode(fdt, cpus_offset, dn->full_name);
+		if (cpus_subnode_offset < 0) {
+			pr_err("Unable to add %s subnode: %s\n", dn->full_name,
+			       fdt_strerror(cpus_subnode_offset));
+			ret = cpus_subnode_offset;
+			goto out;
+		}
+
+		ret = add_node_props(fdt, cpus_subnode_offset, dn);
+		if (ret < 0)
+			goto out;
+	}
+out:
+	of_node_put(dn);
+	return ret;
+}
+#endif /* CONFIG_KEXEC_FILE || CONFIG_CRASH_DUMP */
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 6a01f62b8fcf..4b94c31e3172 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -838,93 +838,6 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
 	return extra_size + kdump_extra_fdt_size_ppc64(image);
 }
 
-/**
- * add_node_props - Reads node properties from device node structure and add
- *                  them to fdt.
- * @fdt:            Flattened device tree of the kernel
- * @node_offset:    offset of the node to add a property at
- * @dn:             device node pointer
- *
- * Returns 0 on success, negative errno on error.
- */
-static int add_node_props(void *fdt, int node_offset, const struct device_node *dn)
-{
-	int ret = 0;
-	struct property *pp;
-
-	if (!dn)
-		return -EINVAL;
-
-	for_each_property_of_node(dn, pp) {
-		ret = fdt_setprop(fdt, node_offset, pp->name, pp->value, pp->length);
-		if (ret < 0) {
-			pr_err("Unable to add %s property: %s\n", pp->name, fdt_strerror(ret));
-			return ret;
-		}
-	}
-	return ret;
-}
-
-/**
- * update_cpus_node - Update cpus node of flattened device tree using of_root
- *                    device node.
- * @fdt:              Flattened device tree of the kernel.
- *
- * Returns 0 on success, negative errno on error.
- */
-static int update_cpus_node(void *fdt)
-{
-	struct device_node *cpus_node, *dn;
-	int cpus_offset, cpus_subnode_offset, ret = 0;
-
-	cpus_offset = fdt_path_offset(fdt, "/cpus");
-	if (cpus_offset < 0 && cpus_offset != -FDT_ERR_NOTFOUND) {
-		pr_err("Malformed device tree: error reading /cpus node: %s\n",
-		       fdt_strerror(cpus_offset));
-		return cpus_offset;
-	}
-
-	if (cpus_offset > 0) {
-		ret = fdt_del_node(fdt, cpus_offset);
-		if (ret < 0) {
-			pr_err("Error deleting /cpus node: %s\n", fdt_strerror(ret));
-			return -EINVAL;
-		}
-	}
-
-	/* Add cpus node to fdt */
-	cpus_offset = fdt_add_subnode(fdt, fdt_path_offset(fdt, "/"), "cpus");
-	if (cpus_offset < 0) {
-		pr_err("Error creating /cpus node: %s\n", fdt_strerror(cpus_offset));
-		return -EINVAL;
-	}
-
-	/* Add cpus node properties */
-	cpus_node = of_find_node_by_path("/cpus");
-	ret = add_node_props(fdt, cpus_offset, cpus_node);
-	of_node_put(cpus_node);
-	if (ret < 0)
-		return ret;
-
-	/* Loop through all subnodes of cpus and add them to fdt */
-	for_each_node_by_type(dn, "cpu") {
-		cpus_subnode_offset = fdt_add_subnode(fdt, cpus_offset, dn->full_name);
-		if (cpus_subnode_offset < 0) {
-			pr_err("Unable to add %s subnode: %s\n", dn->full_name,
-			       fdt_strerror(cpus_subnode_offset));
-			ret = cpus_subnode_offset;
-			goto out;
-		}
-
-		ret = add_node_props(fdt, cpus_subnode_offset, dn);
-		if (ret < 0)
-			goto out;
-	}
-out:
-	of_node_put(dn);
-	return ret;
-}
-
 static int copy_property(void *fdt, int node_offset, const struct device_node *dn,
 			 const char *propname)
 {
-- 
2.43.0

