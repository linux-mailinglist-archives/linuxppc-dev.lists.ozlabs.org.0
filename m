Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0785D231DBF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 13:58:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGsWw4WS3zDqg5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 21:58:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGsBD0JgJzDqsd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 21:43:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BGsBB5C68z8tSY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 21:43:30 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BGsBB4d5vz9sTH; Wed, 29 Jul 2020 21:43:30 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BGsBB0wCZz9sRN
 for <linuxppc-dev@ozlabs.org>; Wed, 29 Jul 2020 21:43:29 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06TBX0S6050392; Wed, 29 Jul 2020 07:43:24 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32k72ba4u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 07:43:24 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06TBY6gg054581;
 Wed, 29 Jul 2020 07:43:24 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32k72ba4tn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 07:43:23 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06TBewjC020068;
 Wed, 29 Jul 2020 11:43:22 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 32gcqk31tr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 11:43:22 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06TBfsdP64618898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jul 2020 11:41:54 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47345AE045;
 Wed, 29 Jul 2020 11:43:19 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D56BEAE055;
 Wed, 29 Jul 2020 11:43:15 +0000 (GMT)
Received: from [192.168.0.8] (unknown [9.79.217.86])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jul 2020 11:43:15 +0000 (GMT)
Subject: [PATCH v6 08/11] ppc64/kexec_file: prepare elfcore header for
 crashing kernel
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 29 Jul 2020 17:13:14 +0530
Message-ID: <159602298855.575379.15819225623219909517.stgit@hbathini>
In-Reply-To: <159602259854.575379.16910915605574571585.stgit@hbathini>
References: <159602259854.575379.16910915605574571585.stgit@hbathini>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_04:2020-07-29,
 2020-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=2 impostorscore=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007290071
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
 Mimi Zohar <zohar@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
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
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---

v5 -> v6:
* Unchanged.

v4 -> v5:
* Unchanged. Added Reviewed-by tag from Thiago.

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
index f9514ebeffaa..fe885bc3127e 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -108,12 +108,18 @@ struct kimage_arch {
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
index 76e2fc7e6dc3..d0e459bb2f05 100644
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
index 38439aba27d7..d52c09729edd 100644
--- a/arch/powerpc/kexec/file_load.c
+++ b/arch/powerpc/kexec/file_load.c
@@ -18,10 +18,45 @@
 #include <linux/kexec.h>
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
+#include <asm/setup.h>
 #include <asm/ima.h>
 
 #define SLAVE_CODE_SIZE		256	/* First 0x100 bytes */
 
+/**
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
 /**
  * setup_purgatory - initialize the purgatory's global variables
  * @image:		kexec image.
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
index a81bffb72cc5..0d280d097cd6 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -128,6 +128,83 @@ static int get_usable_memory_ranges(struct crash_mem **mem_ranges)
 	return ret;
 }
 
+/**
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
 /**
  * __locate_mem_hole_top_down - Looks top down for a large enough memory hole
  *                              in the memory regions between buf_min & buf_max
@@ -647,6 +724,81 @@ static int load_backup_segment(struct kimage *image, struct kexec_buf *kbuf)
 	return 0;
 }
 
+/**
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
 /**
  * load_crashdump_segments_ppc64 - Initialize the additional segements needed
  *                                 to load kdump kernel.
@@ -668,6 +820,15 @@ int load_crashdump_segments_ppc64(struct kimage *image,
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
 
@@ -887,5 +1048,9 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	vfree(image->arch.backup_buf);
 	image->arch.backup_buf = NULL;
 
+	vfree(image->arch.elf_headers);
+	image->arch.elf_headers = NULL;
+	image->arch.elf_headers_sz = 0;
+
 	return kexec_image_post_load_cleanup_default(image);
 }


