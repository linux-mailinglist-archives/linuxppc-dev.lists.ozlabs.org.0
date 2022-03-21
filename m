Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8985E4E21B2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 09:06:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMRyP2YgSz3bgT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 19:06:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iHvVX1vX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMRwx10Pzz3036
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:04:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iHvVX1vX; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KMRwx0v3Zz4xc5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:04:49 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KMRwx0s43z4xd6; Mon, 21 Mar 2022 19:04:49 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iHvVX1vX; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KMRww52KDz4xc5
 for <linuxppc-dev@ozlabs.org>; Mon, 21 Mar 2022 19:04:48 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22L6Mg4m008467; 
 Mon, 21 Mar 2022 08:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Q/MLI94ewdAp51v+1DVEFOc7UBC/FqvRt4cgMy2UaRc=;
 b=iHvVX1vXVHa1V08GTCfHly2Su4sXaHlK1bIM4IBh+lSbORIPYPMrrN8OoEaXogSJdgoa
 /ByiGeF7PsbU7w/1ewfd7rFlILtk3oMdGsciwQZ6sahE3y1sH3zXxCFbx+8nCwBTOYVs
 pxOtYuYl0+i09YaTD+ug+rbSoFKcul5I7vaJKcRdnYD6w3HtJdtZJWTjZriV5g21rSqG
 R4e+wXED2BAiMu2eWUJWhYCv7e3KbsRC8ZbwzDknQX6A4EPmBjZcQkFBSavTmWSM2OXM
 rjQjR9pmN2tnCPQTQuRV8di0/OoagXfz94FVeo0cMSOojEldgcAaL5U1qYzVHYemjwP6 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3exm1tt1kg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 08:04:33 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22L7vtBR002830;
 Mon, 21 Mar 2022 08:04:33 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3exm1tt1k1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 08:04:33 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22L84RE9003968;
 Mon, 21 Mar 2022 08:04:31 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3ew6t8uad2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 08:04:31 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22L84W8q34734576
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 08:04:32 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38C9252050;
 Mon, 21 Mar 2022 08:04:29 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.117.210])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id CC2E452051;
 Mon, 21 Mar 2022 08:04:26 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [RFC v3 PATCH 1/5] powerpc/kexec: make update_cpus_node non-static
Date: Mon, 21 Mar 2022 13:34:18 +0530
Message-Id: <20220321080422.56255-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
References: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: t2TEqLnkQcUTNm1KWk0tH3QQ7tvapzLZ
X-Proofpoint-ORIG-GUID: jis3Vo8udT_yK2PVqgHxQCDFH-M1w8YS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_02,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203210049
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
Cc: mahesh@linux.vnet.ibm.com, eric.devolder@oracle.com,
 kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make the update_cpus_node function non-static and export it for
usage in other kexec components.

The update_cpus_node definition is moved to core_64.c so that it
can be used with both kexec_load and kexec_file_load system calls.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/kexec.h  |  1 +
 arch/powerpc/kexec/core_64.c      | 88 +++++++++++++++++++++++++++++++
 arch/powerpc/kexec/file_load_64.c | 87 ------------------------------
 3 files changed, 89 insertions(+), 87 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 8ebdd23d987c..e1288826e22e 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -127,6 +127,7 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image);
 int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 			unsigned long initrd_load_addr,
 			unsigned long initrd_len, const char *cmdline);
+int update_cpus_node(void *fdt);
 #endif /* CONFIG_PPC64 */
 
 #endif /* CONFIG_KEXEC_FILE */
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 635b5fc30b53..249d2632526d 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/cpu.h>
 #include <linux/hardirq.h>
+#include <linux/libfdt.h>
 
 #include <asm/page.h>
 #include <asm/current.h>
@@ -378,6 +379,93 @@ void default_machine_kexec(struct kimage *image)
 	/* NOTREACHED */
 }
 
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
+
 #ifdef CONFIG_PPC_64S_HASH_MMU
 /* Values we need to export to the second kernel via the device tree. */
 static unsigned long htab_base;
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 07da6bf1cf24..57f991b0a9da 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -951,93 +951,6 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
 	return (unsigned int)(usm_entries * sizeof(u64));
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
 /**
  * setup_new_fdt_ppc64 - Update the flattend device-tree of the kernel
  *                       being loaded.
-- 
2.35.1

