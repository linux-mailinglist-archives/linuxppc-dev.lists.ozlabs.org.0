Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1AC5628E9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 04:28:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYzdf0qw3z3f2N
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 12:28:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sUdwaIwl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sUdwaIwl;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYzbT4vTVz3cgL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 12:26:29 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2612LuiU025744;
	Fri, 1 Jul 2022 02:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dIdXQZdo5KwMwPNWkIfO2JY+sK4witcJwgvGsssZydo=;
 b=sUdwaIwlkY6St4XxUspUACiSTy0+V7GEGXZAMrDfolASTd+Z7936ls2C4O4LHIQGVPYQ
 PtbuPl0X6b3IB7h2kAqzZH6O+dF/i83W5U5J4xzvOYTwcCNPf0sP8L4uNzjtkBwRcHd2
 OZJusteIJ6vFeqaI7/tNc90wBe1sIrBnZJ9ejGZ+yup0yaA1sq24n+V5ojaweNyc+jFF
 al2WlLgkMReJJekuFhe/F2MY3Pgia8O7YM/yizCBLrUEiDcruHAmUZFaUP0Tflnm5hBo
 Tbs9Qnul9T+6DQqdIoH/F588N2OVHy0gSawunHRzLNJg/xm8KD4N7dNZYOjoxGosQDYb AA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h1r2rr1rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Jul 2022 02:26:17 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2612NxBY029211;
	Fri, 1 Jul 2022 02:26:16 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h1r2rr1r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Jul 2022 02:26:16 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2612LM3w018485;
	Fri, 1 Jul 2022 02:26:15 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma01dal.us.ibm.com with ESMTP id 3gwt09m8c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Jul 2022 02:26:15 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2612QELH46203364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Jul 2022 02:26:14 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA31C124052;
	Fri,  1 Jul 2022 02:26:14 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 82EE2124055;
	Fri,  1 Jul 2022 02:26:14 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
	Fri,  1 Jul 2022 02:26:14 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: kexec@lists.infradead.org, devicetree@vger.kernel.org,
        linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 5/5] tpm/kexec: Duplicate TPM measurement log in of-tree for kexec
Date: Thu, 30 Jun 2022 22:26:03 -0400
Message-Id: <20220701022603.31076-6-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701022603.31076-1-stefanb@linux.ibm.com>
References: <20220701022603.31076-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9_bvSXQygvPBz1jNdeAj2syC8c5W0P9j
X-Proofpoint-ORIG-GUID: fEJTTPB0BtwyrDuzsgqXxotdMQTv6KdC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-01_01,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207010003
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
Cc: nayna@linux.ibm.com, Rob Herring <robh+dt@kernel.org>, nasastry@in.ibm.com, Eric Biederman <ebiederm@xmission.com>, Frank Rowand <frowand.list@gmail.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The memory area of the TPM measurement log is currently not properly
duplicated for carrying it across kexec when an Open Firmware
Devicetree is used. Therefore, the contents of the log get corrupted.
Fix this for the kexec_file_load() syscall by allocating a buffer and
copying the contents of the existing log into it. The new buffer is
preserved across the kexec and a pointer to it is available when the new
kernel is started. To achieve this, store the allocated buffer's address
in the flattened device tree (fdt) under the name linux,tpm-kexec-buffer
and search for this entry early in the kernel startup before the TPM
subsystem starts up. Adjust the pointer in the of-tree stored under
linux,sml-base to point to this buffer holding the preserved log. The TPM
driver can then read the base address from this entry when making the log
available. Invalidate the log by removing 'linux,sml-base' from the
devicetree if anything goes wrong with updating the buffer.

Use subsys_initcall() to call the function to restore the buffer even if
the TPM subsystem or driver are not used. This allows the buffer to be
carried across the next kexec without involvement of the TPM subsystem
and ensures a valid buffer pointed to by the of-tree.

Use the subsys_initcall(), rather than an ealier initcall, since
page_is_ram() in get_kexec_buffer() only starts working at this stage.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Eric Biederman <ebiederm@xmission.com>

---
v4:
 - Added #include <linux/vmalloc.h> due to parisc
 - Use phys_addr_t for physical address rather than void *
 - Remove linux,sml-base if the buffer cannot be updated after a kexec
 - Added __init to functions where possible
---
 drivers/of/kexec.c    | 214 +++++++++++++++++++++++++++++++++++++++++-
 include/linux/kexec.h |   6 ++
 include/linux/of.h    |   8 +-
 kernel/kexec_file.c   |   6 ++
 4 files changed, 232 insertions(+), 2 deletions(-)

diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index 0710703acfb0..6d1eac0e2e3c 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -18,6 +18,8 @@
 #include <linux/random.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/tpm.h>
+#include <linux/vmalloc.h>
 
 #define RNG_SEED_SIZE		128
 
@@ -241,7 +243,6 @@ static void remove_ima_buffer(void *fdt, int chosen_node)
 	remove_buffer(fdt, chosen_node, "linux,ima-kexec-buffer");
 }
 
-#ifdef CONFIG_IMA_KEXEC
 static int setup_buffer(void *fdt, int chosen_node, const char *name,
 			phys_addr_t addr, size_t size)
 {
@@ -265,6 +266,7 @@ static int setup_buffer(void *fdt, int chosen_node, const char *name,
 
 }
 
+#ifdef CONFIG_IMA_KEXEC
 /**
  * setup_ima_buffer - add IMA buffer information to the fdt
  * @image:		kexec image being loaded.
@@ -287,6 +289,213 @@ static inline int setup_ima_buffer(const struct kimage *image, void *fdt,
 }
 #endif /* CONFIG_IMA_KEXEC */
 
+/**
+ * tpm_get_kexec_buffer - get TPM log buffer from the previous kernel
+ * @phyaddr:	On successful return, set to physical address of buffer
+ * @size:	On successful return, set to the buffer size.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+static int __init tpm_get_kexec_buffer(phys_addr_t *phyaddr, size_t *size)
+{
+	unsigned long tmp_addr;
+	size_t tmp_size;
+	int ret;
+
+	ret = get_kexec_buffer("linux,tpm-kexec-buffer", &tmp_addr, &tmp_size);
+	if (ret)
+		return ret;
+
+	*phyaddr = (phys_addr_t)tmp_addr;
+	*size = tmp_size;
+
+	return 0;
+}
+
+/**
+ * tpm_of_remove_kexec_buffer - remove the linux,tpm-kexec-buffer node
+ */
+static int __init tpm_of_remove_kexec_buffer(void)
+{
+	struct property *prop;
+
+	prop = of_find_property(of_chosen, "linux,tpm-kexec-buffer", NULL);
+	if (!prop)
+		return -ENOENT;
+
+	return of_remove_property(of_chosen, prop);
+}
+
+/**
+ * remove_tpm_buffer - remove the TPM log buffer property and reservation from @fdt
+ *
+ * @fdt: Flattened Device Tree to update
+ * @chosen_node: Offset to the chosen node in the device tree
+ *
+ * The TPM log measurement buffer is of no use to a subsequent kernel, so we always
+ * remove it from the device tree.
+ */
+static void remove_tpm_buffer(void *fdt, int chosen_node)
+{
+	if (!IS_ENABLED(CONFIG_PPC64))
+		return;
+
+	remove_buffer(fdt, chosen_node, "linux,tpm-kexec-buffer");
+}
+
+/**
+ * setup_tpm_buffer - add TPM measurement log buffer information to the fdt
+ * @image:		kexec image being loaded.
+ * @fdt:		Flattened device tree for the next kernel.
+ * @chosen_node:	Offset to the chosen node.
+ *
+ * Return: 0 on success, or negative errno on error.
+ */
+static int setup_tpm_buffer(const struct kimage *image, void *fdt,
+			    int chosen_node)
+{
+	if (!IS_ENABLED(CONFIG_PPC64))
+		return 0;
+
+	return setup_buffer(fdt, chosen_node, "linux,tpm-kexec-buffer",
+			    image->tpm_buffer_addr, image->tpm_buffer_size);
+}
+
+void tpm_add_kexec_buffer(struct kimage *image)
+{
+	struct kexec_buf kbuf = { .image = image, .buf_align = 1,
+				  .buf_min = 0, .buf_max = ULONG_MAX,
+				  .top_down = true };
+	struct device_node *np;
+	void *buffer;
+	u32 size;
+	u64 base;
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_PPC64))
+		return;
+
+	np = of_find_node_by_name(NULL, "vtpm");
+	if (!np)
+		return;
+
+	if (of_tpm_get_sml_parameters(np, &base, &size) < 0)
+		return;
+
+	buffer = vmalloc(size);
+	if (!buffer)
+		return;
+	memcpy(buffer, __va(base), size);
+
+	kbuf.buffer = buffer;
+	kbuf.bufsz = size;
+	kbuf.memsz = size;
+	ret = kexec_add_buffer(&kbuf);
+	if (ret) {
+		pr_err("Error passing over kexec TPM measurement log buffer: %d\n",
+		       ret);
+		return;
+	}
+
+	image->tpm_buffer = buffer;
+	image->tpm_buffer_addr = kbuf.mem;
+	image->tpm_buffer_size = size;
+}
+
+/**
+ * tpm_post_kexec - Make stored TPM log buffer available in of-tree
+ */
+static int __init tpm_post_kexec(void)
+{
+	struct property *newprop, *p;
+	struct device_node *np;
+	phys_addr_t phyaddr;
+	u32 oflogsize;
+	size_t size;
+	u64 unused;
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_PPC64))
+		return 0;
+
+	np = of_find_node_by_name(NULL, "vtpm");
+	if (!np)
+		return 0;
+
+	if (!of_get_property(of_chosen, "linux,tpm-kexec-buffer", NULL)) {
+		/*
+		 * linux,tpm-kexec-buffer may be missing on initial boot
+		 * or if previous kernel didn't pass a buffer.
+		 */
+		if (of_get_property(of_chosen, "linux,booted-from-kexec", NULL)) {
+			/* no buffer but kexec'd: remove 'linux,sml-base' */
+			ret = -EINVAL;
+			goto err_remove_sml_base;
+		}
+		return 0;
+	}
+
+	/*
+	 * If any one of the following steps fails we remove linux,sml-base
+	 * to invalidate the TPM log.
+	 */
+	ret = tpm_get_kexec_buffer(&phyaddr, &size);
+	if (ret)
+		goto err_remove_kexec_buffer;
+
+	/* logsize must not have changed */
+	ret = of_tpm_get_sml_parameters(np, &unused, &oflogsize);
+	if (ret < 0)
+		goto err_free_memblock;
+	ret = -EINVAL;
+	if (oflogsize != size)
+		goto err_free_memblock;
+
+	/* replace linux,sml-base with new physical address of buffer */
+	ret = -ENOMEM;
+	newprop = kzalloc(sizeof(*newprop), GFP_KERNEL);
+	if (!newprop)
+		goto err_free_memblock;
+
+	newprop->name = kstrdup("linux,sml-base", GFP_KERNEL);
+	newprop->length = sizeof(phyaddr);
+	newprop->value = kmalloc(sizeof(phyaddr), GFP_KERNEL);
+	if (!newprop->name || !newprop->value)
+		goto err_free_newprop_struct;
+
+	if (of_property_match_string(np, "compatible", "IBM,vtpm") < 0 &&
+	    of_property_match_string(np, "compatible", "IBM,vtpm20") < 0) {
+		ret = -ENODEV;
+		goto err_free_newprop_struct;
+	} else {
+		*(phys_addr_t *)newprop->value = phyaddr;
+	}
+
+	ret = of_update_property(np, newprop);
+	if (ret) {
+		pr_err("Could not update linux,sml-base with new address");
+		goto err_free_newprop_struct;
+	}
+
+	return 0;
+
+err_free_newprop_struct:
+	kfree(newprop->value);
+	kfree(newprop->name);
+	kfree(newprop);
+err_free_memblock:
+	memblock_phys_free((phys_addr_t)phyaddr, size);
+err_remove_kexec_buffer:
+	tpm_of_remove_kexec_buffer();
+err_remove_sml_base:
+	p = of_find_property(np, "linux,sml-base", NULL);
+	if (p)
+		of_remove_property(np, p);
+
+	return ret;
+}
+subsys_initcall(tpm_post_kexec);
+
 /*
  * of_kexec_alloc_and_setup_fdt - Alloc and setup a new Flattened Device Tree
  *
@@ -485,6 +694,9 @@ void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
 	remove_ima_buffer(fdt, chosen_node);
 	ret = setup_ima_buffer(image, fdt, fdt_path_offset(fdt, "/chosen"));
 
+	remove_tpm_buffer(fdt, chosen_node);
+	ret = setup_tpm_buffer(image, fdt, fdt_path_offset(fdt, "/chosen"));
+
 out:
 	if (ret) {
 		kvfree(fdt);
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index ce6536f1d269..f0940396c3d4 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -349,6 +349,12 @@ struct kimage {
 	void *elf_headers;
 	unsigned long elf_headers_sz;
 	unsigned long elf_load_addr;
+
+	/* Virtual address of TPM log buffer for kexec syscall */
+	void *tpm_buffer;
+
+	phys_addr_t tpm_buffer_addr;
+	size_t tpm_buffer_size;
 };
 
 /* kexec interface functions */
diff --git a/include/linux/of.h b/include/linux/of.h
index f0a5d6b10c5a..d95f3fc2eccf 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -100,6 +100,8 @@ struct of_reconfig_data {
 	struct property		*old_prop;
 };
 
+struct kimage;
+
 /* initialize a node */
 extern struct kobj_type of_node_ktype;
 extern const struct fwnode_operations of_fwnode_ops;
@@ -436,13 +438,13 @@ int of_map_id(struct device_node *np, u32 id,
 
 phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
 
-struct kimage;
 void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
 				   unsigned long initrd_load_addr,
 				   unsigned long initrd_len,
 				   const char *cmdline, size_t extra_fdt_size);
 int ima_get_kexec_buffer(void **addr, size_t *size);
 int ima_free_kexec_buffer(void);
+void tpm_add_kexec_buffer(struct kimage *image);
 #else /* CONFIG_OF */
 
 static inline void of_core_init(void)
@@ -844,6 +846,10 @@ static inline phys_addr_t of_dma_get_max_cpu_address(struct device_node *np)
 	return PHYS_ADDR_MAX;
 }
 
+static inline void tpm_add_kexec_buffer(struct kimage *image)
+{
+}
+
 #define of_match_ptr(_ptr)	NULL
 #define of_match_node(_matches, _node)	NULL
 #endif /* CONFIG_OF */
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 145321a5e798..d2e0751852dc 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -27,6 +27,7 @@
 #include <linux/kernel_read_file.h>
 #include <linux/syscalls.h>
 #include <linux/vmalloc.h>
+#include <linux/of.h>
 #include "kexec_internal.h"
 
 static int kexec_calculate_store_digests(struct kimage *image);
@@ -137,6 +138,9 @@ void kimage_file_post_load_cleanup(struct kimage *image)
 	image->ima_buffer = NULL;
 #endif /* CONFIG_IMA_KEXEC */
 
+	vfree(image->tpm_buffer);
+	image->tpm_buffer = NULL;
+
 	/* See if architecture has anything to cleanup post load */
 	arch_kimage_file_post_load_cleanup(image);
 
@@ -243,6 +247,8 @@ kimage_file_prepare_segments(struct kimage *image, int kernel_fd, int initrd_fd,
 
 	/* IMA needs to pass the measurement list to the next kernel. */
 	ima_add_kexec_buffer(image);
+	/* Pass the TPM measurement log to next kernel */
+	tpm_add_kexec_buffer(image);
 
 	/* Call arch image load handlers */
 	ldata = arch_kexec_kernel_image_load(image);
-- 
2.35.1

