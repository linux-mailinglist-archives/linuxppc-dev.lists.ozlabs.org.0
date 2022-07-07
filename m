Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E5856A975
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 19:24:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lf3DM4Npcz3cd4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 03:24:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C5KJsH8e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C5KJsH8e;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lf38k28jsz3c62
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 03:20:54 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267GC08q017479;
	Thu, 7 Jul 2022 17:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0V3oyNUsStat6s14U+m0Zux2pehcHoAD4+wbYwBvJbk=;
 b=C5KJsH8e1F4BMwVf1mIiDlkTtZV9xJonfj5NWVS/hAjKzdRtbzuYEHtTIGoIztv0JJg5
 vlndRDU9bcFBjyfTz3XUiOh/4XmW/4l9Lt9pfwiL9Jrr6LMExXVuZQ5lFR5SNbk2Q0AE
 DPjRGqEbSrPSf4EL+edke7QbED5bq3WarFwRrvTs34rgQKfRiT18TvmtvhRUABBxAnjz
 B4d7m574bL4txdJH4nBq92d678PLQprwfp88CxJr1UDxIUTilQo5O729WRjDT8285jlM
 GjWBs/59eZQ0AHME0e8iJ/rin/dfTm1CL4fnYiaCrpBZ5uZg5lhZkjWbjxaFzsW+EVAp Yg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h62sy9yk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Jul 2022 17:20:45 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 267HCb6h010432;
	Thu, 7 Jul 2022 17:20:45 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h62sy9yjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Jul 2022 17:20:45 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 267H59ti024629;
	Thu, 7 Jul 2022 17:20:43 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma02wdc.us.ibm.com with ESMTP id 3h4ucxvue0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Jul 2022 17:20:43 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 267HKgO815401240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Jul 2022 17:20:42 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4F3B78068;
	Thu,  7 Jul 2022 17:20:42 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B7097805C;
	Thu,  7 Jul 2022 17:20:42 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu,  7 Jul 2022 17:20:41 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: kexec@lists.infradead.org, devicetree@vger.kernel.org,
        linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 6/6] tpm/kexec: Duplicate TPM measurement log in of-tree for kexec
Date: Thu,  7 Jul 2022 13:20:26 -0400
Message-Id: <20220707172026.831614-7-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707172026.831614-1-stefanb@linux.ibm.com>
References: <20220707172026.831614-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GbG5FreqIhArZdVRHqqX3hsWo1NUVAn4
X-Proofpoint-GUID: XCNzZhadcosAq5c79JknJuv9PzfV13Bt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_13,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207070068
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
v6:
 - Define prototype for tpm_add_kexec_buffer under same config options
   as drivers/of/kexec.c is compiled, provide inline function otherwise.
   (kernel test robot)

v4:
 - Added #include <linux/vmalloc.h> due to parisc
 - Use phys_addr_t for physical address rather than void *
 - Remove linux,sml-base if the buffer cannot be updated after a kexec
 - Added __init to functions where possible
---
 drivers/of/kexec.c    | 216 +++++++++++++++++++++++++++++++++++++++++-
 include/linux/kexec.h |   6 ++
 include/linux/of.h    |   9 +-
 kernel/kexec_file.c   |   6 ++
 4 files changed, 234 insertions(+), 3 deletions(-)

diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index 15a82b574f36..dd926e057215 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -19,6 +19,8 @@
 #include <linux/random.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/tpm.h>
+#include <linux/vmalloc.h>
 
 #define RNG_SEED_SIZE		128
 
@@ -116,7 +118,6 @@ static int do_get_kexec_buffer(const void *prop, int len, unsigned long *addr,
 	return 0;
 }
 
-#ifdef CONFIG_HAVE_IMA_KEXEC
 static int __init get_kexec_buffer(const char *name, unsigned long *addr,
 				   size_t *size)
 {
@@ -151,6 +152,7 @@ static int __init get_kexec_buffer(const char *name, unsigned long *addr,
 	return 0;
 }
 
+#ifdef CONFIG_HAVE_IMA_KEXEC
 /**
  * ima_get_kexec_buffer - get IMA buffer from the previous kernel
  * @addr:	On successful return, set to point to the buffer contents.
@@ -239,7 +241,6 @@ static void remove_ima_buffer(void *fdt, int chosen_node)
 	remove_buffer(fdt, chosen_node, "linux,ima-kexec-buffer");
 }
 
-#ifdef CONFIG_IMA_KEXEC
 static int setup_buffer(void *fdt, int chosen_node, const char *name,
 			phys_addr_t addr, size_t size)
 {
@@ -263,6 +264,7 @@ static int setup_buffer(void *fdt, int chosen_node, const char *name,
 
 }
 
+#ifdef CONFIG_IMA_KEXEC
 /**
  * setup_ima_buffer - add IMA buffer information to the fdt
  * @image:		kexec image being loaded.
@@ -285,6 +287,213 @@ static inline int setup_ima_buffer(const struct kimage *image, void *fdt,
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
@@ -483,6 +692,9 @@ void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
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
index 20a4e7cb7afe..03e0f0380b91 100644
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
@@ -436,7 +438,6 @@ int of_map_id(struct device_node *np, u32 id,
 
 phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
 
-struct kimage;
 void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
 				   unsigned long initrd_load_addr,
 				   unsigned long initrd_len,
@@ -1606,4 +1607,10 @@ static inline int of_overlay_notifier_unregister(struct notifier_block *nb)
 
 #endif
 
+#if defined(CONFIG_KEXEC_FILE) && defined(CONFIG_OF_FLATTREE)
+void tpm_add_kexec_buffer(struct kimage *image);
+#else
+static inline void tpm_add_kexec_buffer(struct kimage *image) { }
+#endif
+
 #endif /* _LINUX_OF_H */
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

