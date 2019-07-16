Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F506A891
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 14:20:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nzxW09H0zDqQ1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 22:20:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nywz2jqwzDqZ3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:34:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45nywy59W3z8t9P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:34:42 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45nywy4Zw2z9sN4; Tue, 16 Jul 2019 21:34:42 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45nywy0MC1z9s7T
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 21:34:41 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GBN8V7066393
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:34:40 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tscphb0fs-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:34:39 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 16 Jul 2019 12:34:38 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 12:34:35 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6GBYKP740304952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 11:34:20 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AEF55204E;
 Tue, 16 Jul 2019 11:34:33 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DE2F55204F;
 Tue, 16 Jul 2019 11:34:31 +0000 (GMT)
Subject: [PATCH v4 21/25] powernv/opalcore: export /sys/firmware/opal/core
 for analysing opal crashes
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 16 Jul 2019 17:04:31 +0530
In-Reply-To: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19071611-0016-0000-0000-00000292FE96
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071611-0017-0000-0000-000032F0CEF0
Message-Id: <156327687115.27462.5787131000179599219.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160145
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Stewart Smith <stewart@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Hari Bathini <hbathini@linux.vnet.ibm.com>

Export /sys/firmware/opal/core file to analyze opal crashes. Since OPAL
core can be generated independent of CONFIG_FA_DUMP support in kernel,
add this support under a new kernel config option CONFIG_OPAL_CORE.
Also, avoid code duplication by moving common code used while exporting
/proc/vmcore and/or /sys/firmware/opal/core file(s).

Signed-off-by: Hari Bathini <hbathini@linux.vnet.ibm.com>
---
 arch/powerpc/Kconfig                         |    9 
 arch/powerpc/platforms/powernv/Makefile      |    1 
 arch/powerpc/platforms/powernv/opal-core.c   |  599 ++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/opal-fadump.c |   84 +---
 arch/powerpc/platforms/powernv/opal-fadump.h |   71 +++
 5 files changed, 697 insertions(+), 67 deletions(-)
 create mode 100644 arch/powerpc/platforms/powernv/opal-core.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 7c44a8b..0afe0db 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -589,6 +589,15 @@ config PRESERVE_FA_DUMP
 	  memory preserving kernel boot would process this crash data.
 	  Petitboot kernel is the typical usecase for this option.
 
+config OPAL_CORE
+	bool "Export OPAL memory as /sys/firmware/opal/core"
+	depends on PPC64 && PPC_POWERNV
+	help
+	  This option uses the MPIPL support in firmware to provide an
+	  ELF core of OPAL memory after a crash. The ELF core is exported
+	  as /sys/firmware/opal/core file which is helpful in debugging
+	  OPAL crashes using GDB.
+
 config IRQ_ALL_CPUS
 	bool "Distribute interrupts on all CPUs by default"
 	depends on SMP
diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
index b4a8022..e659afd 100644
--- a/arch/powerpc/platforms/powernv/Makefile
+++ b/arch/powerpc/platforms/powernv/Makefile
@@ -8,6 +8,7 @@ obj-y			+= opal-kmsg.o opal-powercap.o opal-psr.o opal-sensor-groups.o
 obj-$(CONFIG_SMP)	+= smp.o subcore.o subcore-asm.o
 obj-$(CONFIG_FA_DUMP)	+= opal-fadump.o
 obj-$(CONFIG_PRESERVE_FA_DUMP)	+= opal-fadump.o
+obj-$(CONFIG_OPAL_CORE)	+= opal-core.o
 obj-$(CONFIG_PCI)	+= pci.o pci-ioda.o npu-dma.o pci-ioda-tce.o
 obj-$(CONFIG_CXL_BASE)	+= pci-cxl.o
 obj-$(CONFIG_EEH)	+= eeh-powernv.o
diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
new file mode 100644
index 0000000..55bea53
--- /dev/null
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -0,0 +1,599 @@
+/*
+ * Interface for exporting the OPAL ELF core.
+ * Heavily inspired from fs/proc/vmcore.c
+ *
+ * Copyright 2019, IBM Corp.
+ * Author: Hari Bathini <hbathini@linux.ibm.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#undef DEBUG
+#define pr_fmt(fmt) "opalcore: " fmt
+
+#include <linux/memblock.h>
+#include <linux/uaccess.h>
+#include <linux/proc_fs.h>
+#include <linux/elf.h>
+#include <linux/elfcore.h>
+#include <linux/slab.h>
+#include <linux/crash_core.h>
+#include <linux/of.h>
+
+#include <asm/page.h>
+#include <asm/opal.h>
+
+#include "../../kernel/fadump-common.h"
+#include "opal-fadump.h"
+
+#define MAX_PT_LOAD_CNT		8
+
+/* NT_AUXV note related info */
+#define AUXV_CNT		1
+#define AUXV_DESC_SZ		(((2 * AUXV_CNT) + 1) * sizeof(Elf64_Off))
+
+struct opalcore_config {
+	unsigned int		num_cpus;
+	/* PIR value of crashing CPU */
+	unsigned int		crashing_cpu;
+
+	/* CPU state data info from F/W */
+	unsigned long		cpu_state_destination_addr;
+	unsigned long		cpu_state_data_size;
+	unsigned long		cpu_state_entry_size;
+
+	/* OPAL memory to be exported as PT_LOAD segments */
+	unsigned long		ptload_addr[MAX_PT_LOAD_CNT];
+	unsigned long		ptload_size[MAX_PT_LOAD_CNT];
+	unsigned long		ptload_cnt;
+
+	/* Pointer to the first PT_LOAD in the ELF core file */
+	Elf64_Phdr		*ptload_phdr;
+
+	/* Total size of opalcore file. */
+	size_t			opalcore_size;
+
+	/* Buffer for all the ELF core headers and the PT_NOTE */
+	size_t			opalcorebuf_sz;
+	char			*opalcorebuf;
+
+	/* NT_AUXV buffer */
+	char			auxv_buf[AUXV_DESC_SZ];
+};
+
+struct opalcore {
+	struct list_head list;
+	unsigned long long paddr;
+	unsigned long long size;
+	loff_t offset;
+};
+
+static LIST_HEAD(opalcore_list);
+static struct opalcore_config *oc_conf;
+static const struct opal_mpipl_fadump *opalc_metadata;
+static const struct opal_mpipl_fadump *opalc_cpu_metadata;
+
+/*
+ * Set crashing CPU's signal to SIGUSR1. if the kernel is triggered
+ * by kernel, SIGTERM otherwise.
+ */
+bool kernel_initiated;
+
+static struct opalcore * __init get_new_element(void)
+{
+	return kzalloc(sizeof(struct opalcore), GFP_KERNEL);
+}
+
+static inline int is_opalcore_usable(void)
+{
+	return (oc_conf && oc_conf->opalcorebuf != NULL) ? 1 : 0;
+}
+
+static Elf64_Word *append_elf64_note(Elf64_Word *buf, char *name,
+				     unsigned int type, void *data,
+				     size_t data_len)
+{
+	Elf64_Nhdr *note = (Elf64_Nhdr *)buf;
+	Elf64_Word namesz = strlen(name) + 1;
+
+	note->n_namesz = cpu_to_be32(namesz);
+	note->n_descsz = cpu_to_be32(data_len);
+	note->n_type   = cpu_to_be32(type);
+	buf += DIV_ROUND_UP(sizeof(*note), sizeof(Elf64_Word));
+	memcpy(buf, name, namesz);
+	buf += DIV_ROUND_UP(namesz, sizeof(Elf64_Word));
+	memcpy(buf, data, data_len);
+	buf += DIV_ROUND_UP(data_len, sizeof(Elf64_Word));
+
+	return buf;
+}
+
+static void fill_prstatus(struct elf_prstatus *prstatus, int pir,
+			  struct pt_regs *regs)
+{
+	memset(prstatus, 0, sizeof(struct elf_prstatus));
+	elf_core_copy_kernel_regs(&(prstatus->pr_reg), regs);
+
+	/*
+	 * Overload PID with PIR value.
+	 * As a PIR value could also be '0', add an offset of '100'
+	 * to every PIR to avoid misinterpretations in GDB.
+	 */
+	prstatus->pr_pid  = cpu_to_be32(100 + pir);
+	prstatus->pr_ppid = cpu_to_be32(1);
+
+	/*
+	 * Indicate SIGUSR1 for crash initiated from kernel.
+	 * SIGTERM otherwise.
+	 */
+	if (pir == oc_conf->crashing_cpu) {
+		short sig;
+
+		sig = kernel_initiated ? SIGUSR1 : SIGTERM;
+		prstatus->pr_cursig = cpu_to_be16(sig);
+	}
+}
+
+static Elf64_Word *auxv_to_elf64_notes(Elf64_Word *buf,
+				       uint64_t opal_boot_entry)
+{
+	int idx = 0;
+	Elf64_Off *bufp = (Elf64_Off *)oc_conf->auxv_buf;
+
+	memset(bufp, 0, AUXV_DESC_SZ);
+
+	/* Entry point of OPAL */
+	bufp[idx++] = cpu_to_be64(AT_ENTRY);
+	bufp[idx++] = cpu_to_be64(opal_boot_entry);
+
+	/* end of vector */
+	bufp[idx++] = cpu_to_be64(AT_NULL);
+
+	buf = append_elf64_note(buf, CRASH_CORE_NOTE_NAME, NT_AUXV,
+				oc_conf->auxv_buf, AUXV_DESC_SZ);
+	return buf;
+}
+
+/*
+ * Read from the ELF header and then the crash dump.
+ * Returns number of bytes read on success, -errno on failure.
+ */
+static ssize_t read_opalcore(struct file *file, struct kobject *kobj,
+			     struct bin_attribute *bin_attr, char *to,
+			     loff_t pos, size_t count)
+{
+	struct opalcore *m;
+	ssize_t tsz, avail;
+	loff_t tpos = pos;
+
+	if (pos >= oc_conf->opalcore_size)
+		return 0;
+
+	/* Adjust count if it goes beyond opalcore size */
+	avail = oc_conf->opalcore_size - pos;
+	if (count > avail)
+		count = avail;
+
+	if (count == 0)
+		return 0;
+
+	/* Read ELF core header and/or PT_NOTE segment */
+	if (tpos < oc_conf->opalcorebuf_sz) {
+		tsz = min_t(size_t, oc_conf->opalcorebuf_sz - tpos, count);
+		memcpy(to, oc_conf->opalcorebuf + tpos, tsz);
+		to += tsz;
+		tpos += tsz;
+		count -= tsz;
+	}
+
+	list_for_each_entry(m, &opalcore_list, list) {
+		/* nothing more to read here */
+		if (count == 0)
+			break;
+
+		if (tpos < m->offset + m->size) {
+			void *addr;
+
+			tsz = min_t(size_t, m->offset + m->size - tpos, count);
+			addr = (void *)(m->paddr + tpos - m->offset);
+			memcpy(to, __va(addr), tsz);
+			to += tsz;
+			tpos += tsz;
+			count -= tsz;
+		}
+	}
+
+	return (tpos - pos);
+}
+
+static struct bin_attribute opal_core_attr = {
+	.attr = {.name = "core", .mode = 0400},
+	.read = read_opalcore
+};
+
+/*
+ * Read CPU state dump data and convert it into ELF notes.
+ *
+ * Each register entry is of 16 bytes, A numerical identifier along with
+ * a GPR/SPR flag in the first 8 bytes and the register value in the next
+ * 8 bytes. For more details refer to F/W documentation.
+ */
+static Elf64_Word * __init opalcore_append_cpu_notes(Elf64_Word *buf)
+{
+	struct hdat_fadump_thread_hdr *thdr;
+	unsigned long addr;
+	u32 thread_pir;
+	char *bufp;
+	Elf64_Word *first_cpu_note;
+	struct pt_regs regs;
+	struct elf_prstatus prstatus;
+	unsigned int size_of_each_thread;
+	unsigned int regs_offset, regs_cnt, reg_esize;
+	int i;
+
+	size_of_each_thread = oc_conf->cpu_state_entry_size;
+
+	addr = oc_conf->cpu_state_destination_addr;
+	bufp = __va(addr);
+
+	/*
+	 * Offset for register entries, entry size and registers count is
+	 * duplicated in every thread header in keeping with HDAT format.
+	 * Use these values from the first thread header.
+	 */
+	thdr = (struct hdat_fadump_thread_hdr *)bufp;
+	regs_offset = (offsetof(struct hdat_fadump_thread_hdr, offset) +
+		       be32_to_cpu(thdr->offset));
+	reg_esize = be32_to_cpu(thdr->esize);
+	regs_cnt  = be32_to_cpu(thdr->ecnt);
+
+	pr_debug("--------CPU State Data------------\n");
+	pr_debug("NumCpus     : %u\n", oc_conf->num_cpus);
+	pr_debug("\tOffset: %u, Entry size: %u, Cnt: %u\n",
+		 regs_offset, reg_esize, regs_cnt);
+
+	/*
+	 * Skip past the first CPU note. Fill this note with the
+	 * crashing CPU's prstatus.
+	 */
+	first_cpu_note = buf;
+	buf = append_elf64_note(buf, CRASH_CORE_NOTE_NAME, NT_PRSTATUS,
+				&prstatus, sizeof(prstatus));
+
+	for (i = 0; i < oc_conf->num_cpus; i++, bufp += size_of_each_thread) {
+		thdr = (struct hdat_fadump_thread_hdr *)bufp;
+		thread_pir = be32_to_cpu(thdr->pir);
+
+		pr_debug("%04d) PIR: 0x%x, core state: 0x%02x\n",
+			 (i + 1), thread_pir, thdr->core_state);
+
+		/*
+		 * Register state data of MAX cores is provided by firmware,
+		 * but some of this cores may not be active. So, while
+		 * processing register state data, check core state and
+		 * skip threads that belong to inactive cores.
+		 */
+		if (is_thread_core_inactive(thdr->core_state))
+			continue;
+
+		opal_fadump_read_regs((bufp + regs_offset), regs_cnt,
+				      reg_esize, false, &regs);
+
+		pr_debug("PIR 0x%x - R1 : 0x%llx, NIP : 0x%llx\n", thread_pir,
+			 be64_to_cpu(regs.gpr[1]), be64_to_cpu(regs.nip));
+		fill_prstatus(&prstatus, thread_pir, &regs);
+
+		if (thread_pir != oc_conf->crashing_cpu) {
+			buf = append_elf64_note(buf, CRASH_CORE_NOTE_NAME,
+						NT_PRSTATUS, &prstatus,
+						sizeof(prstatus));
+		} else {
+			/*
+			 * Add crashing CPU as the first NT_PRSTATUS note for
+			 * GDB to process the core file appropriately.
+			 */
+			append_elf64_note(first_cpu_note, CRASH_CORE_NOTE_NAME,
+					  NT_PRSTATUS, &prstatus,
+					  sizeof(prstatus));
+		}
+	}
+
+	return buf;
+}
+
+static int __init create_opalcore(void)
+{
+	int hdr_size, cpu_notes_size, order, count;
+	int i, ret;
+	unsigned int numcpus;
+	unsigned long paddr;
+	Elf64_Ehdr *elf;
+	Elf64_Phdr *phdr;
+	loff_t opalcore_off;
+	struct opalcore *new;
+	struct page *page;
+	char *bufp;
+	struct device_node *dn;
+	uint64_t opal_base_addr;
+	uint64_t opal_boot_entry;
+
+
+	if ((oc_conf->ptload_cnt == 0) ||
+	    (oc_conf->ptload_cnt > MAX_PT_LOAD_CNT)) {
+		pr_err("Invalid PT_LOAD count: %lu\n", oc_conf->ptload_cnt);
+		return -EINVAL;
+	}
+
+	numcpus = oc_conf->num_cpus;
+	hdr_size = (sizeof(Elf64_Ehdr) +
+		    ((oc_conf->ptload_cnt + 1) * sizeof(Elf64_Phdr)));
+	cpu_notes_size = ((numcpus * (CRASH_CORE_NOTE_HEAD_BYTES +
+			  CRASH_CORE_NOTE_NAME_BYTES +
+			  CRASH_CORE_NOTE_DESC_BYTES)) +
+			  (CRASH_CORE_NOTE_HEAD_BYTES +
+			  CRASH_CORE_NOTE_NAME_BYTES + AUXV_DESC_SZ));
+	oc_conf->opalcorebuf_sz = (hdr_size + cpu_notes_size);
+	order = get_order(oc_conf->opalcorebuf_sz);
+	oc_conf->opalcorebuf =
+		(char *)__get_free_pages(GFP_KERNEL|__GFP_ZERO, order);
+	if (!oc_conf->opalcorebuf) {
+		pr_err("Not enough memory to setup opalcore (size: %lu)\n",
+		       oc_conf->opalcorebuf_sz);
+		oc_conf->opalcorebuf_sz = 0;
+		return -ENOMEM;
+	}
+
+	pr_debug("opalcorebuf = 0x%lx\n", (unsigned long)oc_conf->opalcorebuf);
+
+	count = 1 << order;
+	page = virt_to_page(oc_conf->opalcorebuf);
+	for (i = 0; i < count; i++)
+		SetPageReserved(page + i);
+
+	/* Read OPAL related device-tree entries */
+	dn = of_find_node_by_name(NULL, "ibm,opal");
+	if (dn) {
+		ret = of_property_read_u64(dn, "opal-base-address",
+					   &opal_base_addr);
+		pr_debug("opal-base-address: %llx\n", opal_base_addr);
+		ret |= of_property_read_u64(dn, "opal-boot-address",
+					    &opal_boot_entry);
+		pr_debug("opal-boot-address: %llx\n", opal_boot_entry);
+	}
+	if (!dn || ret)
+		pr_warn("WARNING: Failed to read OPAL base & entry values\n");
+
+	/* Use count to keep track of the program headers */
+	count = 0;
+
+	bufp = oc_conf->opalcorebuf;
+	elf = (Elf64_Ehdr *)bufp;
+	bufp += sizeof(Elf64_Ehdr);
+	memcpy(elf->e_ident, ELFMAG, SELFMAG);
+	elf->e_ident[EI_CLASS] = ELF_CLASS;
+	elf->e_ident[EI_DATA] = ELFDATA2MSB;
+	elf->e_ident[EI_VERSION] = EV_CURRENT;
+	elf->e_ident[EI_OSABI] = ELF_OSABI;
+	memset(elf->e_ident+EI_PAD, 0, EI_NIDENT-EI_PAD);
+	elf->e_type = cpu_to_be16(ET_CORE);
+	elf->e_machine = cpu_to_be16(ELF_ARCH);
+	elf->e_version = cpu_to_be32(EV_CURRENT);
+	elf->e_entry = 0;
+	elf->e_phoff = cpu_to_be64(sizeof(Elf64_Ehdr));
+	elf->e_shoff = 0;
+	elf->e_flags = 0;
+
+	elf->e_ehsize = cpu_to_be16(sizeof(Elf64_Ehdr));
+	elf->e_phentsize = cpu_to_be16(sizeof(Elf64_Phdr));
+	elf->e_phnum = 0;
+	elf->e_shentsize = 0;
+	elf->e_shnum = 0;
+	elf->e_shstrndx = 0;
+
+	phdr = (Elf64_Phdr *)bufp;
+	bufp += sizeof(Elf64_Phdr);
+	phdr->p_type	= cpu_to_be32(PT_NOTE);
+	phdr->p_flags	= 0;
+	phdr->p_align	= 0;
+	phdr->p_paddr	= phdr->p_vaddr = 0;
+	phdr->p_offset	= cpu_to_be64(hdr_size);
+	phdr->p_filesz	= phdr->p_memsz = cpu_to_be64(cpu_notes_size);
+	count++;
+
+	opalcore_off = oc_conf->opalcorebuf_sz;
+	oc_conf->ptload_phdr  = (Elf64_Phdr *)bufp;
+	paddr = 0;
+	for (i = 0; i < oc_conf->ptload_cnt; i++) {
+		phdr = (Elf64_Phdr *)bufp;
+		bufp += sizeof(Elf64_Phdr);
+		phdr->p_type	= cpu_to_be32(PT_LOAD);
+		phdr->p_flags	= cpu_to_be32(PF_R|PF_W|PF_X);
+		phdr->p_align	= 0;
+
+		new = get_new_element();
+		if (!new)
+			return -ENOMEM;
+		new->paddr  = oc_conf->ptload_addr[i];
+		new->size   = oc_conf->ptload_size[i];
+		new->offset = opalcore_off;
+		list_add_tail(&new->list, &opalcore_list);
+
+		phdr->p_paddr	= cpu_to_be64(paddr);
+		phdr->p_vaddr	= cpu_to_be64(opal_base_addr + paddr);
+		phdr->p_filesz	= phdr->p_memsz  =
+			cpu_to_be64(oc_conf->ptload_size[i]);
+		phdr->p_offset	= cpu_to_be64(opalcore_off);
+
+		count++;
+		opalcore_off += oc_conf->ptload_size[i];
+		paddr += oc_conf->ptload_size[i];
+	}
+
+	elf->e_phnum = cpu_to_be16(count);
+
+	bufp = (char *)opalcore_append_cpu_notes((Elf64_Word *)bufp);
+	bufp = (char *)auxv_to_elf64_notes((Elf64_Word *)bufp, opal_boot_entry);
+
+	oc_conf->opalcore_size = opalcore_off;
+	return 0;
+}
+
+static void __init opalcore_config_init(void)
+{
+	struct device_node *np;
+	const __be32 *prop;
+	uint64_t addr = 0;
+	uint32_t idx, cpu_data_version;
+	int i, ret;
+
+
+	np = of_find_node_by_path("/ibm,opal/dump");
+	if (np == NULL)
+		return;
+
+	if (!of_device_is_compatible(np, "ibm,opal-dump")) {
+		pr_err("Support missing for this f/w version!\n");
+		return;
+	}
+
+	/*
+	 * Check if dump has been initiated on last reboot.
+	 */
+	prop = of_get_property(np, "mpipl-boot", NULL);
+	if (!prop)
+		goto out;
+
+	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_OPAL, &addr);
+	if ((ret != OPAL_SUCCESS) || !addr) {
+		pr_err("Failed to get OPAL metadata (%d)\n", ret);
+		goto out;
+	}
+
+	addr = be64_to_cpu(addr);
+	pr_debug("OPAL metadata addr: %llx\n", addr);
+	opalc_metadata = __va(addr);
+	if (opalc_metadata->version != MPIPL_FADUMP_VERSION) {
+		pr_err("OPAL metadata version (%u) not supported by kernel!\n",
+		       opalc_metadata->version);
+		goto out;
+	}
+
+	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_CPU, &addr);
+	if ((ret != OPAL_SUCCESS) || !addr) {
+		pr_err("Failed to get OPAL CPU metadata (%d)\n", ret);
+		goto out;
+	}
+
+	addr = be64_to_cpu(addr);
+	pr_debug("CPU metadata addr: %llx\n", addr);
+	opalc_cpu_metadata = __va(addr);
+	cpu_data_version = be32_to_cpu(opalc_cpu_metadata->cpu_data_version);
+	if (cpu_data_version != HDAT_FADUMP_CPU_DATA_VERSION) {
+		pr_err("CPU data version (%u) not supported by kernel!\n",
+		       cpu_data_version);
+		goto out;
+	}
+
+	oc_conf = kzalloc(sizeof(struct opalcore_config), GFP_KERNEL);
+	if (oc_conf == NULL)
+		goto out;
+
+	oc_conf->ptload_cnt = 0;
+	idx = be32_to_cpu(opalc_metadata->region_cnt);
+	if (idx > MAX_PT_LOAD_CNT) {
+		pr_warn("OPAL regions count (%d) adjusted to limit (%d)",
+			MAX_PT_LOAD_CNT, idx);
+		idx = MAX_PT_LOAD_CNT;
+	}
+	for (i = 0; i < idx; i++) {
+		oc_conf->ptload_addr[oc_conf->ptload_cnt] =
+				be64_to_cpu(opalc_metadata->region[i].dest);
+		oc_conf->ptload_size[oc_conf->ptload_cnt++] =
+				be64_to_cpu(opalc_metadata->region[i].size);
+	}
+	oc_conf->ptload_cnt = i;
+	oc_conf->crashing_cpu = be32_to_cpu(opalc_metadata->crashing_pir);
+
+	oc_conf->cpu_state_destination_addr =
+			be64_to_cpu(opalc_cpu_metadata->region[0].dest);
+	oc_conf->cpu_state_data_size =
+			be64_to_cpu(opalc_cpu_metadata->region[0].size);
+	oc_conf->cpu_state_entry_size =
+			be32_to_cpu(opalc_cpu_metadata->cpu_data_size);
+
+	oc_conf->num_cpus = (oc_conf->cpu_state_data_size /
+			     oc_conf->cpu_state_entry_size);
+
+out:
+	of_node_put(np);
+}
+
+/* Cleanup function for opalcore module. */
+static void opalcore_cleanup(void)
+{
+	unsigned long order, count, i;
+	struct page *page;
+
+	if (oc_conf == NULL)
+		return;
+
+	sysfs_remove_bin_file(opal_kobj, &opal_core_attr);
+	oc_conf->ptload_phdr = NULL;
+	oc_conf->ptload_cnt = 0;
+
+	/* free core buffer */
+	if ((oc_conf->opalcorebuf != NULL) && (oc_conf->opalcorebuf_sz != 0)) {
+		order = get_order(oc_conf->opalcorebuf_sz);
+		count = 1 << order;
+		page = virt_to_page(oc_conf->opalcorebuf);
+		for (i = 0; i < count; i++)
+			ClearPageReserved(page + i);
+		__free_pages(page, order);
+
+		oc_conf->opalcorebuf = NULL;
+		oc_conf->opalcorebuf_sz = 0;
+	}
+
+	kfree(oc_conf);
+	oc_conf = NULL;
+}
+__exitcall(opalcore_cleanup);
+
+/* Init function for opalcore module. */
+static int __init opalcore_init(void)
+{
+	int rc = -1;
+
+	opalcore_config_init();
+
+	if (oc_conf == NULL)
+		return rc;
+
+	create_opalcore();
+
+	/*
+	 * If oc_conf->opalcorebuf= is set in the 2nd kernel,
+	 * then capture the dump.
+	 */
+	if (!(is_opalcore_usable())) {
+		pr_err("Failed to export /sys/firmware/opal/core\n");
+		opalcore_cleanup();
+		return rc;
+	}
+
+	/* Set opal core size */
+	opal_core_attr.size = oc_conf->opalcore_size;
+
+	rc = sysfs_create_bin_file(opal_kobj, &opal_core_attr);
+	if (rc != 0) {
+		pr_err("Failed to export /sys/firmware/opal/core\n");
+		opalcore_cleanup();
+		return rc;
+	}
+
+	return 0;
+}
+fs_initcall(opalcore_init);
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index 31dc7a5..b55f25c 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -77,6 +77,10 @@ static const struct opal_fadump_mem_struct *opal_fdm_active;
 static const struct opal_mpipl_fadump *opal_cpu_metadata;
 static struct opal_fadump_mem_struct *opal_fdm;
 
+#ifdef CONFIG_OPAL_CORE
+extern bool kernel_initiated;
+#endif
+
 static void opal_fadump_update_config(struct fw_dump *fadump_conf,
 				      const struct opal_fadump_mem_struct *fdm)
 {
@@ -292,72 +296,6 @@ static int opal_fadump_invalidate_fadump(struct fw_dump *fadump_conf)
 	return 0;
 }
 
-static inline void opal_fadump_set_regval_regnum(struct pt_regs *regs,
-						 u32 reg_type, u32 reg_num,
-						 u64 reg_val)
-{
-	if (reg_type == HDAT_FADUMP_REG_TYPE_GPR) {
-		if (reg_num < 32)
-			regs->gpr[reg_num] = reg_val;
-		return;
-	}
-
-	switch (reg_num) {
-	case SPRN_CTR:
-		regs->ctr = reg_val;
-		break;
-	case SPRN_LR:
-		regs->link = reg_val;
-		break;
-	case SPRN_XER:
-		regs->xer = reg_val;
-		break;
-	case SPRN_DAR:
-		regs->dar = reg_val;
-		break;
-	case SPRN_DSISR:
-		regs->dsisr = reg_val;
-		break;
-	case HDAT_FADUMP_REG_ID_NIP:
-		regs->nip = reg_val;
-		break;
-	case HDAT_FADUMP_REG_ID_MSR:
-		regs->msr = reg_val;
-		break;
-	case HDAT_FADUMP_REG_ID_CCR:
-		regs->ccr = reg_val;
-		break;
-	}
-}
-
-static inline void opal_fadump_read_regs(char *bufp, unsigned int regs_cnt,
-					 unsigned int reg_entry_size,
-					 struct pt_regs *regs)
-{
-	int i;
-	struct hdat_fadump_reg_entry *reg_entry;
-
-	memset(regs, 0, sizeof(struct pt_regs));
-
-	for (i = 0; i < regs_cnt; i++, bufp += reg_entry_size) {
-		reg_entry = (struct hdat_fadump_reg_entry *)bufp;
-		opal_fadump_set_regval_regnum(regs,
-					      be32_to_cpu(reg_entry->reg_type),
-					      be32_to_cpu(reg_entry->reg_num),
-					      be64_to_cpu(reg_entry->reg_val));
-	}
-}
-
-static inline bool __init is_thread_core_inactive(u8 core_state)
-{
-	bool is_inactive = false;
-
-	if (core_state == HDAT_FADUMP_CORE_INACTIVE)
-		is_inactive = true;
-
-	return is_inactive;
-}
-
 /*
  * Convert CPU state data saved at the time of crash into ELF notes.
  *
@@ -457,7 +395,7 @@ static int __init opal_fadump_build_cpu_notes(struct fw_dump *fadump_conf)
 		}
 
 		opal_fadump_read_regs((bufp + regs_offset), regs_cnt,
-				      reg_esize, &regs);
+				      reg_esize, true, &regs);
 
 		note_buf = fadump_regs_to_elf_notes(note_buf, &regs);
 		pr_debug("CPU PIR: 0x%x - R1 : 0x%lx, NIP : 0x%lx\n",
@@ -491,6 +429,18 @@ static int __init opal_fadump_process_fadump(struct fw_dump *fadump_conf)
 		return -EINVAL;
 	}
 
+#ifdef CONFIG_OPAL_CORE
+	/*
+	 * If this is a kernel initiated crash, crashing_cpu would be set
+	 * appropriately and register data of the crashing CPU saved by
+	 * crashing kernel. Add this saved register data of crashing CPU
+	 * to elf notes and populate the pt_regs for the remaining CPUs
+	 * from register state data provided by firmware.
+	 */
+	if (fdh->crashing_cpu != FADUMP_CPU_UNKNOWN)
+		kernel_initiated = true;
+#endif
+
 	rc = opal_fadump_build_cpu_notes(fadump_conf);
 	if (rc)
 		return rc;
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.h b/arch/powerpc/platforms/powernv/opal-fadump.h
index ebe8ed1..c833725 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.h
+++ b/arch/powerpc/platforms/powernv/opal-fadump.h
@@ -14,6 +14,7 @@
 #define __PPC64_OPAL_FA_DUMP_H__
 
 #ifndef CONFIG_PRESERVE_FA_DUMP
+#include <asm/reg.h>
 
 /* OPAL FADump structure format version */
 #define OPAL_FADUMP_VERSION			0x1
@@ -73,4 +74,74 @@ struct hdat_fadump_reg_entry {
 	__be64		reg_val;
 } __attribute__((packed));
 
+static inline bool __init is_thread_core_inactive(u8 core_state)
+{
+	bool is_inactive = false;
+
+	if (core_state == HDAT_FADUMP_CORE_INACTIVE)
+		is_inactive = true;
+
+	return is_inactive;
+}
+
+static inline void opal_fadump_set_regval_regnum(struct pt_regs *regs,
+						 u32 reg_type, u32 reg_num,
+						 u64 reg_val)
+{
+	if (reg_type == HDAT_FADUMP_REG_TYPE_GPR) {
+		if (reg_num < 32)
+			regs->gpr[reg_num] = reg_val;
+		return;
+	}
+
+	switch (reg_num) {
+	case SPRN_CTR:
+		regs->ctr = reg_val;
+		break;
+	case SPRN_LR:
+		regs->link = reg_val;
+		break;
+	case SPRN_XER:
+		regs->xer = reg_val;
+		break;
+	case SPRN_DAR:
+		regs->dar = reg_val;
+		break;
+	case SPRN_DSISR:
+		regs->dsisr = reg_val;
+		break;
+	case HDAT_FADUMP_REG_ID_NIP:
+		regs->nip = reg_val;
+		break;
+	case HDAT_FADUMP_REG_ID_MSR:
+		regs->msr = reg_val;
+		break;
+	case HDAT_FADUMP_REG_ID_CCR:
+		regs->ccr = reg_val;
+		break;
+	}
+}
+
+static inline void opal_fadump_read_regs(char *bufp, unsigned int regs_cnt,
+					 unsigned int reg_entry_size,
+					 bool cpu_endian,
+					 struct pt_regs *regs)
+{
+	int i;
+	u64 val;
+	struct hdat_fadump_reg_entry *reg_entry;
+
+	memset(regs, 0, sizeof(struct pt_regs));
+
+	for (i = 0; i < regs_cnt; i++, bufp += reg_entry_size) {
+		reg_entry = (struct hdat_fadump_reg_entry *)bufp;
+		val = (cpu_endian ? be64_to_cpu(reg_entry->reg_val) :
+		       reg_entry->reg_val);
+		opal_fadump_set_regval_regnum(regs,
+					      be32_to_cpu(reg_entry->reg_type),
+					      be32_to_cpu(reg_entry->reg_num),
+					      val);
+	}
+}
+
 #endif /* __PPC64_OPAL_FA_DUMP_H__ */

