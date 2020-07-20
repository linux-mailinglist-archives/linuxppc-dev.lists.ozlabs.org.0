Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3C52260E1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 15:26:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9Mv94MPbzDqMv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 23:26:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9MBh5j4YzDqN1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 22:54:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B9MBg3MP2z8tQV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 22:54:51 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B9MBg0pkcz9sRk; Mon, 20 Jul 2020 22:54:51 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B9MBc6bp5z9sRW
 for <linuxppc-dev@ozlabs.org>; Mon, 20 Jul 2020 22:54:48 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06KCXpEm062371; Mon, 20 Jul 2020 08:54:41 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5h7kn2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 08:54:40 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06KCYLL4065005;
 Mon, 20 Jul 2020 08:54:40 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5h7kn18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 08:54:40 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06KCo7ke017746;
 Mon, 20 Jul 2020 12:54:37 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 32brq7tqkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 12:54:37 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06KCsYUY14877002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 12:54:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C14AA405C;
 Mon, 20 Jul 2020 12:54:34 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 679E2A4066;
 Mon, 20 Jul 2020 12:54:31 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.85.112.199])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Jul 2020 12:54:31 +0000 (GMT)
Subject: [PATCH v4 10/12] ppc64/kexec_file: prepare elfcore header for
 crashing kernel
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 20 Jul 2020 18:24:30 +0530
Message-ID: <159524966309.20855.15216784717419378243.stgit@hbathini.in.ibm.com>
In-Reply-To: <159524918900.20855.17709718993097359220.stgit@hbathini.in.ibm.com>
References: <159524918900.20855.17709718993097359220.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_07:2020-07-20,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015 mlxscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=2
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007200086
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
Cc: Pingfan Liu <piliu@redhat.com>, Kexec-ml <kexec@lists.infradead.org>,
 Nayna Jain <nayna@linux.ibm.com>, Petr Tesarik <ptesarik@suse.cz>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Prepare elf headers for the crashing kernel's core file using
crash_prepare_elf64_headers() and pass on this info to kdump
kernel by updating its command line with elfcorehdr parameter.
Also, add elfcorehdr location to reserve map to avoid it from
being stomped on while booting.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Tested-by: Pingfan Liu <piliu@redhat.com>
---

v3 -> v4:
* Added a FIXME tag to indicate issue in adding opal/rtas regions to
  core image.
* Folded prepare_elf_headers() function into load_elfcorehdr_segment().

v2 -> v3:
* Unchanged. Added Tested-by tag from Pingfan.

v1 -> v2:
* Tried merging adjacent memory ranges on hitting maximum ranges limit
  to reduce reallocations for memory ranges and also, minimize PT_LOAD
  segments for elfcore.
* Updated add_rtas_mem_range() & add_opal_mem_range() callsites based on
  the new prototype for these functions.


 arch/powerpc/include/asm/kexec.h  |    6 +
 arch/powerpc/kexec/elf_64.c       |   12 +++
 arch/powerpc/kexec/file_load.c    |   49 +++++++++++
 arch/powerpc/kexec/file_load_64.c |  165 +++++++++++++++++++++++++++++++++++++
 4 files changed, 232 insertions(+)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index c069f76..6f6317f 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -112,12 +112,18 @@ struct kimage_arch {
 	unsigned long backup_start;
 	void *backup_buf;
 
+	unsigned long elfcorehdr_addr;
+	unsigned long elf_headers_sz;
+	void *elf_headers;
+
 #ifdef CONFIG_IMA_KEXEC
 	phys_addr_t ima_buffer_addr;
 	size_t ima_buffer_size;
 #endif
 };
 
+char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
+			  unsigned long cmdline_len);
 int setup_purgatory(struct kimage *image, const void *slave_code,
 		    const void *fdt, unsigned long kernel_load_addr,
 		    unsigned long fdt_load_addr);
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 0ecd88f..be38f72 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -35,6 +35,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	void *fdt;
 	const void *slave_code;
 	struct elfhdr ehdr;
+	char *modified_cmdline = NULL;
 	struct kexec_elf_info elf_info;
 	struct kexec_buf kbuf = { .image = image, .buf_min = 0,
 				  .buf_max = ppc64_rma_size };
@@ -75,6 +76,16 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 			pr_err("Failed to load kdump kernel segments\n");
 			goto out;
 		}
+
+		/* Setup cmdline for kdump kernel case */
+		modified_cmdline = setup_kdump_cmdline(image, cmdline,
+						       cmdline_len);
+		if (!modified_cmdline) {
+			pr_err("Setting up cmdline for kdump kernel failed\n");
+			ret = -EINVAL;
+			goto out;
+		}
+		cmdline = modified_cmdline;
 	}
 
 	if (initrd != NULL) {
@@ -131,6 +142,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 		pr_err("Error setting up the purgatory.\n");
 
 out:
+	kfree(modified_cmdline);
 	kexec_free_elf_info(&elf_info);
 
 	/* Make kimage_file_post_load_cleanup free the fdt buffer for us. */
diff --git a/arch/powerpc/kexec/file_load.c b/arch/powerpc/kexec/file_load.c
index 38439ab..d52c097 100644
--- a/arch/powerpc/kexec/file_load.c
+++ b/arch/powerpc/kexec/file_load.c
@@ -18,11 +18,46 @@
 #include <linux/kexec.h>
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
+#include <asm/setup.h>
 #include <asm/ima.h>
 
 #define SLAVE_CODE_SIZE		256	/* First 0x100 bytes */
 
 /**
+ * setup_kdump_cmdline - Prepend "elfcorehdr=<addr> " to command line
+ *                       of kdump kernel for exporting the core.
+ * @image:               Kexec image
+ * @cmdline:             Command line parameters to update.
+ * @cmdline_len:         Length of the cmdline parameters.
+ *
+ * kdump segment must be setup before calling this function.
+ *
+ * Returns new cmdline buffer for kdump kernel on success, NULL otherwise.
+ */
+char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
+			  unsigned long cmdline_len)
+{
+	int elfcorehdr_strlen;
+	char *cmdline_ptr;
+
+	cmdline_ptr = kzalloc(COMMAND_LINE_SIZE, GFP_KERNEL);
+	if (!cmdline_ptr)
+		return NULL;
+
+	elfcorehdr_strlen = sprintf(cmdline_ptr, "elfcorehdr=0x%lx ",
+				    image->arch.elfcorehdr_addr);
+
+	if (elfcorehdr_strlen + cmdline_len > COMMAND_LINE_SIZE) {
+		pr_err("Appending elfcorehdr=<addr> exceeds cmdline size\n");
+		kfree(cmdline_ptr);
+		return NULL;
+	}
+
+	memcpy(cmdline_ptr + elfcorehdr_strlen, cmdline, cmdline_len);
+	return cmdline_ptr;
+}
+
+/**
  * setup_purgatory - initialize the purgatory's global variables
  * @image:		kexec image.
  * @slave_code:		Slave code for the purgatory.
@@ -221,6 +256,20 @@ int setup_new_fdt(const struct kimage *image, void *fdt,
 		}
 	}
 
+	if (image->type == KEXEC_TYPE_CRASH) {
+		/*
+		 * Avoid elfcorehdr from being stomped on in kdump kernel by
+		 * setting up memory reserve map.
+		 */
+		ret = fdt_add_mem_rsv(fdt, image->arch.elfcorehdr_addr,
+				      image->arch.elf_headers_sz);
+		if (ret) {
+			pr_err("Error reserving elfcorehdr memory: %s\n",
+			       fdt_strerror(ret));
+			goto err;
+		}
+	}
+
 	ret = setup_ima_buffer(image, fdt, chosen_node);
 	if (ret) {
 		pr_err("Error setting up the new device tree.\n");
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 41d748c..6840ddc 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -126,6 +126,83 @@ static int get_usable_memory_ranges(struct crash_mem **mem_ranges)
 }
 
 /**
+ * get_crash_memory_ranges - Get crash memory ranges. This list includes
+ *                           first/crashing kernel's memory regions that
+ *                           would be exported via an elfcore.
+ * @mem_ranges:              Range list to add the memory ranges to.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int get_crash_memory_ranges(struct crash_mem **mem_ranges)
+{
+	struct memblock_region *reg;
+	struct crash_mem *tmem;
+	int ret;
+
+	for_each_memblock(memory, reg) {
+		u64 base, size;
+
+		base = (u64)reg->base;
+		size = (u64)reg->size;
+
+		/* Skip backup memory region, which needs a separate entry */
+		if (base == BACKUP_SRC_START) {
+			if (size > BACKUP_SRC_SIZE) {
+				base = BACKUP_SRC_END + 1;
+				size -= BACKUP_SRC_SIZE;
+			} else
+				continue;
+		}
+
+		ret = add_mem_range(mem_ranges, base, size);
+		if (ret)
+			goto out;
+
+		/* Try merging adjacent ranges before reallocation attempt */
+		if ((*mem_ranges)->nr_ranges == (*mem_ranges)->max_nr_ranges)
+			sort_memory_ranges(*mem_ranges, true);
+	}
+
+	/* Reallocate memory ranges if there is no space to split ranges */
+	tmem = *mem_ranges;
+	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
+		tmem = realloc_mem_ranges(mem_ranges);
+		if (!tmem)
+			goto out;
+	}
+
+	/* Exclude crashkernel region */
+	ret = crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);
+	if (ret)
+		goto out;
+
+	/*
+	 * FIXME: For now, stay in parity with kexec-tools but if RTAS/OPAL
+	 *        regions are exported to save their context at the time of
+	 *        crash, they should actually be backed up just like the
+	 *        first 64K bytes of memory.
+	 */
+	ret = add_rtas_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_opal_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	/* create a separate program header for the backup region */
+	ret = add_mem_range(mem_ranges, BACKUP_SRC_START, BACKUP_SRC_SIZE);
+	if (ret)
+		goto out;
+
+	sort_memory_ranges(*mem_ranges, false);
+out:
+	if (ret)
+		pr_err("Failed to setup crash memory ranges\n");
+	return ret;
+}
+
+/**
  * __locate_mem_hole_top_down - Looks top down for a large enough memory hole
  *                              in the memory regions between buf_min & buf_max
  *                              for the buffer. If found, sets kbuf->mem.
@@ -972,6 +1049,81 @@ static int load_backup_segment(struct kimage *image, struct kexec_buf *kbuf)
 }
 
 /**
+ * update_backup_region_phdr - Update backup region's offset for the core to
+ *                             export the region appropriately.
+ * @image:                     Kexec image.
+ * @ehdr:                      ELF core header.
+ *
+ * Assumes an exclusive program header is setup for the backup region
+ * in the ELF headers
+ *
+ * Returns nothing.
+ */
+static void update_backup_region_phdr(struct kimage *image, Elf64_Ehdr *ehdr)
+{
+	Elf64_Phdr *phdr;
+	unsigned int i;
+
+	phdr = (Elf64_Phdr *)(ehdr + 1);
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		if (phdr->p_paddr == BACKUP_SRC_START) {
+			phdr->p_offset = image->arch.backup_start;
+			pr_debug("Backup region offset updated to 0x%lx\n",
+				 image->arch.backup_start);
+			return;
+		}
+	}
+}
+
+/**
+ * load_elfcorehdr_segment - Setup crash memory ranges and initialize elfcorehdr
+ *                           segment needed to load kdump kernel.
+ * @image:                   Kexec image.
+ * @kbuf:                    Buffer contents and memory parameters.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
+{
+	struct crash_mem *cmem = NULL;
+	unsigned long headers_sz;
+	void *headers = NULL;
+	int ret;
+
+	ret = get_crash_memory_ranges(&cmem);
+	if (ret)
+		goto out;
+
+	/* Setup elfcorehdr segment */
+	ret = crash_prepare_elf64_headers(cmem, false, &headers, &headers_sz);
+	if (ret) {
+		pr_err("Failed to prepare elf headers for the core\n");
+		goto out;
+	}
+
+	/* Fix the offset for backup region in the ELF header */
+	update_backup_region_phdr(image, headers);
+
+	kbuf->buffer = headers;
+	kbuf->mem = KEXEC_BUF_MEM_UNKNOWN;
+	kbuf->bufsz = kbuf->memsz = headers_sz;
+	kbuf->top_down = false;
+
+	ret = kexec_add_buffer(kbuf);
+	if (ret) {
+		vfree(headers);
+		goto out;
+	}
+
+	image->arch.elfcorehdr_addr = kbuf->mem;
+	image->arch.elf_headers_sz = headers_sz;
+	image->arch.elf_headers = headers;
+out:
+	kfree(cmem);
+	return ret;
+}
+
+/**
  * load_crashdump_segments_ppc64 - Initialize the additional segements needed
  *                                 to load kdump kernel.
  * @image:                         Kexec image.
@@ -992,6 +1144,15 @@ int load_crashdump_segments_ppc64(struct kimage *image,
 	}
 	pr_debug("Loaded the backup region at 0x%lx\n", kbuf->mem);
 
+	/* Load elfcorehdr segment - to export crashing kernel's vmcore */
+	ret = load_elfcorehdr_segment(image, kbuf);
+	if (ret) {
+		pr_err("Failed to load elfcorehdr segment\n");
+		return ret;
+	}
+	pr_debug("Loaded elf core header at 0x%lx, bufsz=0x%lx memsz=0x%lx\n",
+		 image->arch.elfcorehdr_addr, kbuf->bufsz, kbuf->memsz);
+
 	return 0;
 }
 
@@ -1342,5 +1503,9 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	vfree(image->arch.backup_buf);
 	image->arch.backup_buf = NULL;
 
+	vfree(image->arch.elf_headers);
+	image->arch.elf_headers = NULL;
+	image->arch.elf_headers_sz = 0;
+
 	return kexec_image_post_load_cleanup_default(image);
 }

