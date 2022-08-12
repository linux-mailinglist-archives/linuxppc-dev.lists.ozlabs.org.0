Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8238A591430
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 18:46:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M48hC34BLz3cdv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Aug 2022 02:46:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZpSwVUtQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZpSwVUtQ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M48dL1DpMz3blS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Aug 2022 02:43:49 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27CGdYfk017663;
	Fri, 12 Aug 2022 16:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kZYHbZ9Pn5Z8IL5WRwrP+uOE619iJp8vvXfL5+FLseI=;
 b=ZpSwVUtQuWE/8txJVykYK/7iC4ynKY6JRzfPZ5rTC1Eql41Rtk+IkSKuIbh9Upa2Fhbu
 9PFUiuBSKtjqWY+DnItoude2oVj69M6lbO4JJOH/5yxPZxdNFq376TtCm/VrbpxptA9d
 8Eb54bKeyobj0yruZX4Std1XvD8+8eSxVuTcnlieU8G8MmlEFp6CPm/xfKMAjNYHMR/H
 uXHb0AqFXVKHLlYaLDWyrv0XrkaY0sxklvYIb2p5LlNlOeWb1eET61FRfl/nCIuEXNjT
 8LjTHcg1stOiIjHSjA6G0KzQCLKD7n72TzIXSyXzS+aumamQiAa1i70AzYvd0jEb328+ /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwtd20kuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Aug 2022 16:43:33 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27CGeSt8024837;
	Fri, 12 Aug 2022 16:43:26 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwtd20ka6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Aug 2022 16:43:26 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27CGZ8r3029766;
	Fri, 12 Aug 2022 16:43:12 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma02dal.us.ibm.com with ESMTP id 3hvkjhehyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Aug 2022 16:43:12 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27CGhBL8524806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Aug 2022 16:43:11 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C096328058;
	Fri, 12 Aug 2022 16:43:11 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD18E28064;
	Fri, 12 Aug 2022 16:43:11 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
	Fri, 12 Aug 2022 16:43:11 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: kexec@lists.infradead.org, devicetree@vger.kernel.org,
        linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 5/6] of: kexec: Refactor IMA buffer related functions to make them reusable
Date: Fri, 12 Aug 2022 12:43:04 -0400
Message-Id: <20220812164305.2056641-6-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812164305.2056641-1-stefanb@linux.ibm.com>
References: <20220812164305.2056641-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9IZ8TvcagnVUasvZtgNKaAV7AR8yeBiH
X-Proofpoint-GUID: CTNOq0xRJeapnA58kou4a7UhnvmsasrM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_10,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208120044
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
Cc: Rob Herring <robh@kernel.org>, Nageswara R Sastry <rnsastry@linux.ibm.com>, nayna@linux.ibm.com, Mimi Zohar <zohar@linux.ibm.com>, Rob Herring <robh+dt@kernel.org>, nasastry@in.ibm.com, Frank Rowand <frowand.list@gmail.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Refactor IMA buffer related functions to make them reusable for carrying
TPM logs across kexec.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>

---
v6:
 - Add __init to get_kexec_buffer as suggested by Jonathan

v5:
 - Rebased on Jonathan McDowell's commit "b69a2afd5afc x86/kexec: Carry
   forward IMA measurement log on kexec"
v4:
 - Move debug output into setup_buffer()
---
 drivers/of/kexec.c | 126 ++++++++++++++++++++++++++-------------------
 1 file changed, 74 insertions(+), 52 deletions(-)

diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index 548dd5b1b5c1..15a82b574f36 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -117,45 +117,57 @@ static int do_get_kexec_buffer(const void *prop, int len, unsigned long *addr,
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
+static int __init get_kexec_buffer(const char *name, unsigned long *addr,
+				   size_t *size)
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
 
@@ -188,72 +200,82 @@ int __init ima_free_kexec_buffer(void)
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

