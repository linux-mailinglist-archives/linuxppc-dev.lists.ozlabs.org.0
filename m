Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73747568CBB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 17:28:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdNj92vPzz3bvX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 01:28:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sQVw7bPX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sQVw7bPX;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdNc85MXXz3bjX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 01:23:52 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 266E0Ep4028260;
	Wed, 6 Jul 2022 15:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NBIWYiw/5g00/YDjObXVt+G0rnq9mc/abggeTCGYK6Q=;
 b=sQVw7bPX+BMJCCuAWjNy3uERCxy3e8YHfCNXFFMaL2ylsmoDIZ9n7MA25Eyzwms0MZbM
 DGsIUYnjnXwuENYgaocTJZQZ9gJfiVmo2B1+VGx3nD5JbwcUmtyLB2Z9+kMKlZkNKixL
 PzKjIUclwVQPsJd7mogcHwiGPGjy+fmErKrwRChPcbuZ7GUK2qkT8gSDeliwIKOx4pD7
 3zy5JtKWFPT5V7Au7mMfzv13ZgyhwRDKVq31dm2oabLAeeleCSOY2gn9V+sE+5A1Ia7X
 /J8pnhDsjAinQ4lcGfDibZfiyWmkM7327/5PK1BtqU4FETvWxpW4Dpa3c/Ow39/MHiu+ +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h5a7ynby0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Jul 2022 15:23:40 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 266EeZf5011380;
	Wed, 6 Jul 2022 15:23:40 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h5a7ynbxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Jul 2022 15:23:40 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 266FLNev002881;
	Wed, 6 Jul 2022 15:23:39 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma01wdc.us.ibm.com with ESMTP id 3h4ud1n803-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Jul 2022 15:23:39 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 266FNdnS64487904
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 Jul 2022 15:23:39 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7D1F112061;
	Wed,  6 Jul 2022 15:23:38 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBF06112064;
	Wed,  6 Jul 2022 15:23:38 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
	Wed,  6 Jul 2022 15:23:38 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: kexec@lists.infradead.org, devicetree@vger.kernel.org,
        linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 5/6] of: kexec: Refactor IMA buffer related functions to make them reusable
Date: Wed,  6 Jul 2022 11:23:28 -0400
Message-Id: <20220706152329.665636-6-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706152329.665636-1-stefanb@linux.ibm.com>
References: <20220706152329.665636-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nmdvic0LiCuBgXpTBFZGhPcW_73vaCWr
X-Proofpoint-ORIG-GUID: R2sXZDmaLvfzl3TeB1qBUmU-hfDK1SoF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-06_09,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207060060
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
Cc: nayna@linux.ibm.com, Mimi Zohar <zohar@linux.ibm.com>, Rob Herring <robh+dt@kernel.org>, nasastry@in.ibm.com, Frank Rowand <frowand.list@gmail.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Refactor IMA buffer related functions to make them reusable for carrying
TPM logs across kexec.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>

---
v5:
 - Rebased on Jonathan McDowell's commit "b69a2afd5afc x86/kexec: Carry
   forward IMA measurement log on kexec"
v4:
 - Move debug output into setup_buffer()
---
 drivers/of/kexec.c | 125 ++++++++++++++++++++++++++-------------------
 1 file changed, 73 insertions(+), 52 deletions(-)

diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index 548dd5b1b5c1..404a86bb3978 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -117,45 +117,56 @@ static int do_get_kexec_buffer(const void *prop, int len, unsigned long *addr,
 }
 
 #ifdef CONFIG_HAVE_IMA_KEXEC
-/**
- * ima_get_kexec_buffer - get IMA buffer from the previous kernel
- * @addr:	On successful return, set to point to the buffer contents.
- * @size:	On successful return, set to the buffer size.
- *
- * Return: 0 on success, negative errno on error.
- */
-int __init ima_get_kexec_buffer(void **addr, size_t *size)
+static int get_kexec_buffer(const char *name, unsigned long *addr, size_t *size)
 {
 	int ret, len;
-	unsigned long tmp_addr;
 	unsigned long start_pfn, end_pfn;
-	size_t tmp_size;
 	const void *prop;
 
-	prop = of_get_property(of_chosen, "linux,ima-kexec-buffer", &len);
+	prop = of_get_property(of_chosen, name, &len);
 	if (!prop)
 		return -ENOENT;
 
-	ret = do_get_kexec_buffer(prop, len, &tmp_addr, &tmp_size);
+	ret = do_get_kexec_buffer(prop, len, addr, size);
 	if (ret)
 		return ret;
 
-	/* Do some sanity on the returned size for the ima-kexec buffer */
-	if (!tmp_size)
+	/* Do some sanity on the returned size for the kexec buffer */
+	if (!*size)
 		return -ENOENT;
 
 	/*
 	 * Calculate the PFNs for the buffer and ensure
 	 * they are with in addressable memory.
 	 */
-	start_pfn = PHYS_PFN(tmp_addr);
-	end_pfn = PHYS_PFN(tmp_addr + tmp_size - 1);
+	start_pfn = PHYS_PFN(*addr);
+	end_pfn = PHYS_PFN(*addr + *size - 1);
 	if (!page_is_ram(start_pfn) || !page_is_ram(end_pfn)) {
-		pr_warn("IMA buffer at 0x%lx, size = 0x%zx beyond memory\n",
-			tmp_addr, tmp_size);
+		pr_warn("%s buffer at 0x%lx, size = 0x%zx beyond memory\n",
+			name, *addr, *size);
 		return -EINVAL;
 	}
 
+	return 0;
+}
+
+/**
+ * ima_get_kexec_buffer - get IMA buffer from the previous kernel
+ * @addr:	On successful return, set to point to the buffer contents.
+ * @size:	On successful return, set to the buffer size.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int __init ima_get_kexec_buffer(void **addr, size_t *size)
+{
+	int ret;
+	unsigned long tmp_addr;
+	size_t tmp_size;
+
+	ret = get_kexec_buffer("linux,ima-kexec-buffer", &tmp_addr, &tmp_size);
+	if (ret)
+		return ret;
+
 	*addr = __va(tmp_addr);
 	*size = tmp_size;
 
@@ -188,72 +199,82 @@ int __init ima_free_kexec_buffer(void)
 }
 #endif
 
-/**
- * remove_ima_buffer - remove the IMA buffer property and reservation from @fdt
- *
- * @fdt: Flattened Device Tree to update
- * @chosen_node: Offset to the chosen node in the device tree
- *
- * The IMA measurement buffer is of no use to a subsequent kernel, so we always
- * remove it from the device tree.
- */
-static void remove_ima_buffer(void *fdt, int chosen_node)
+static int remove_buffer(void *fdt, int chosen_node, const char *name)
 {
 	int ret, len;
 	unsigned long addr;
 	size_t size;
 	const void *prop;
 
-	if (!IS_ENABLED(CONFIG_HAVE_IMA_KEXEC))
-		return;
-
-	prop = fdt_getprop(fdt, chosen_node, "linux,ima-kexec-buffer", &len);
+	prop = fdt_getprop(fdt, chosen_node, name, &len);
 	if (!prop)
-		return;
+		return -ENOENT;
 
 	ret = do_get_kexec_buffer(prop, len, &addr, &size);
-	fdt_delprop(fdt, chosen_node, "linux,ima-kexec-buffer");
+	fdt_delprop(fdt, chosen_node, name);
 	if (ret)
-		return;
+		return ret;
 
 	ret = fdt_find_and_del_mem_rsv(fdt, addr, size);
 	if (!ret)
-		pr_debug("Removed old IMA buffer reservation.\n");
+		pr_debug("Remove old %s buffer reserveration", name);
+	return ret;
 }
 
-#ifdef CONFIG_IMA_KEXEC
 /**
- * setup_ima_buffer - add IMA buffer information to the fdt
- * @image:		kexec image being loaded.
- * @fdt:		Flattened device tree for the next kernel.
- * @chosen_node:	Offset to the chosen node.
+ * remove_ima_buffer - remove the IMA buffer property and reservation from @fdt
  *
- * Return: 0 on success, or negative errno on error.
+ * @fdt: Flattened Device Tree to update
+ * @chosen_node: Offset to the chosen node in the device tree
+ *
+ * The IMA measurement buffer is of no use to a subsequent kernel, so we always
+ * remove it from the device tree.
  */
-static int setup_ima_buffer(const struct kimage *image, void *fdt,
-			    int chosen_node)
+static void remove_ima_buffer(void *fdt, int chosen_node)
+{
+	if (!IS_ENABLED(CONFIG_HAVE_IMA_KEXEC))
+		return;
+
+	remove_buffer(fdt, chosen_node, "linux,ima-kexec-buffer");
+}
+
+#ifdef CONFIG_IMA_KEXEC
+static int setup_buffer(void *fdt, int chosen_node, const char *name,
+			phys_addr_t addr, size_t size)
 {
 	int ret;
 
-	if (!image->ima_buffer_size)
+	if (!size)
 		return 0;
 
 	ret = fdt_appendprop_addrrange(fdt, 0, chosen_node,
-				       "linux,ima-kexec-buffer",
-				       image->ima_buffer_addr,
-				       image->ima_buffer_size);
+				       name, addr, size);
 	if (ret < 0)
 		return -EINVAL;
 
-	ret = fdt_add_mem_rsv(fdt, image->ima_buffer_addr,
-			      image->ima_buffer_size);
+	ret = fdt_add_mem_rsv(fdt, addr, size);
 	if (ret)
 		return -EINVAL;
 
-	pr_debug("IMA buffer at 0x%pa, size = 0x%zx\n",
-		 &image->ima_buffer_addr, image->ima_buffer_size);
+	pr_debug("%s at 0x%pa, size = 0x%zx\n", name, &addr, size);
 
 	return 0;
+
+}
+
+/**
+ * setup_ima_buffer - add IMA buffer information to the fdt
+ * @image:		kexec image being loaded.
+ * @fdt:		Flattened device tree for the next kernel.
+ * @chosen_node:	Offset to the chosen node.
+ *
+ * Return: 0 on success, or negative errno on error.
+ */
+static int setup_ima_buffer(const struct kimage *image, void *fdt,
+			    int chosen_node)
+{
+	return setup_buffer(fdt, chosen_node, "linux,ima-kexec-buffer",
+			    image->ima_buffer_addr, image->ima_buffer_size);
 }
 #else /* CONFIG_IMA_KEXEC */
 static inline int setup_ima_buffer(const struct kimage *image, void *fdt,
-- 
2.35.1

