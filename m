Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3B2B010B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 18:15:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T6S72ZCXzF395
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 02:15:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4jq4BbMzF3F7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:56:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4jp4xXFz8sjs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:56:46 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4jp4S0Vz9sNF; Thu, 12 Sep 2019 00:56:46 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46T4jp1Cd5z9s4Y
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:56:45 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEghqF089349
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:56:44 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uy2vk8mms-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:56:44 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:56:42 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:56:38 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8BEuaTM43385250
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:56:36 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70278A4040;
 Wed, 11 Sep 2019 14:56:36 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41404A405B;
 Wed, 11 Sep 2019 14:56:34 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:56:34 +0000 (GMT)
Subject: [PATCH v6 31/36] powernv/opalcore: export /sys/firmware/opal/core
 for analysing opal crashes
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:26:33 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0020-0000-0000-0000036B0E46
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0021-0000-0000-000021C09B8B
Message-Id: <156821378503.5656.3693769384945087756.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909110138
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
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
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

Changes in v6:
  * Do not error out but warn, sanity check & proceed for CPU data format
    version mismatch.


 arch/powerpc/Kconfig                         |    9 
 arch/powerpc/platforms/powernv/Makefile      |    1 
 arch/powerpc/platforms/powernv/opal-core.c   |  598 ++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/opal-fadump.c |   74 +--
 arch/powerpc/platforms/powernv/opal-fadump.h |   62 +++
 5 files changed, 687 insertions(+), 57 deletions(-)
 create mode 100644 arch/powerpc/platforms/powernv/opal-core.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2be9b96..d91460a 100644
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
index 0000000..6fa6b8a
--- /dev/null
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -0,0 +1,598 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Interface for exporting the OPAL ELF core.
+ * Heavily inspired from fs/proc/vmcore.c
+ *
+ * Copyright 2019, Hari Bathini, IBM Corporation.
+ */
+
+#define pr_fmt(fmt) "opal core: " fmt
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
+#include <asm/fadump-internal.h>
+
+#include "opal-fadump.h"
+
+#define MAX_PT_LOAD_CNT		8
+
+/* NT_AUXV note related info */
+#define AUXV_CNT		1
+#define AUXV_DESC_SZ		(((2 * AUXV_CNT) + 1) * sizeof(Elf64_Off))
+
+struct opalcore_config {
+	u32			num_cpus;
+	/* PIR value of crashing CPU */
+	u32			crashing_cpu;
+
+	/* CPU state data info from F/W */
+	u64			cpu_state_destination_vaddr;
+	u64			cpu_state_data_size;
+	u64			cpu_state_entry_size;
+
+	/* OPAL memory to be exported as PT_LOAD segments */
+	u64			ptload_addr[MAX_PT_LOAD_CNT];
+	u64			ptload_size[MAX_PT_LOAD_CNT];
+	u64			ptload_cnt;
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
+	struct list_head	list;
+	u64			paddr;
+	size_t			size;
+	loff_t			offset;
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
+				     u32 type, void *data,
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
+				       u64 opal_boot_entry)
+{
+	Elf64_Off *bufp = (Elf64_Off *)oc_conf->auxv_buf;
+	int idx = 0;
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
+	u32 thread_pir, size_per_thread, regs_offset, regs_cnt, reg_esize;
+	struct hdat_fadump_thread_hdr *thdr;
+	struct elf_prstatus prstatus;
+	Elf64_Word *first_cpu_note;
+	struct pt_regs regs;
+	char *bufp;
+	int i;
+
+	size_per_thread = oc_conf->cpu_state_entry_size;
+	bufp = __va(oc_conf->cpu_state_destination_vaddr);
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
+	for (i = 0; i < oc_conf->num_cpus; i++, bufp += size_per_thread) {
+		thdr = (struct hdat_fadump_thread_hdr *)bufp;
+		thread_pir = be32_to_cpu(thdr->pir);
+
+		pr_debug("[%04d] PIR: 0x%x, core state: 0x%02x\n",
+			 i, thread_pir, thdr->core_state);
+
+		/*
+		 * Register state data of MAX cores is provided by firmware,
+		 * but some of this cores may not be active. So, while
+		 * processing register state data, check core state and
+		 * skip threads that belong to inactive cores.
+		 */
+		if (thdr->core_state == HDAT_FADUMP_CORE_INACTIVE)
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
+	u64 opal_boot_entry, opal_base_addr, paddr;
+	u32 hdr_size, cpu_notes_size, count;
+	struct device_node *dn;
+	struct opalcore *new;
+	loff_t opalcore_off;
+	struct page *page;
+	Elf64_Phdr *phdr;
+	Elf64_Ehdr *elf;
+	int i, ret;
+	char *bufp;
+
+	/* Get size of header & CPU notes for OPAL core */
+	hdr_size = (sizeof(Elf64_Ehdr) +
+		    ((oc_conf->ptload_cnt + 1) * sizeof(Elf64_Phdr)));
+	cpu_notes_size = ((oc_conf->num_cpus * (CRASH_CORE_NOTE_HEAD_BYTES +
+			  CRASH_CORE_NOTE_NAME_BYTES +
+			  CRASH_CORE_NOTE_DESC_BYTES)) +
+			  (CRASH_CORE_NOTE_HEAD_BYTES +
+			  CRASH_CORE_NOTE_NAME_BYTES + AUXV_DESC_SZ));
+
+	/* Allocate buffer to setup OPAL core */
+	oc_conf->opalcorebuf_sz = PAGE_ALIGN(hdr_size + cpu_notes_size);
+	oc_conf->opalcorebuf = alloc_pages_exact(oc_conf->opalcorebuf_sz,
+						 GFP_KERNEL | __GFP_ZERO);
+	if (!oc_conf->opalcorebuf) {
+		pr_err("Not enough memory to setup OPAL core (size: %lu)\n",
+		       oc_conf->opalcorebuf_sz);
+		oc_conf->opalcorebuf_sz = 0;
+		return -ENOMEM;
+	}
+	count = oc_conf->opalcorebuf_sz / PAGE_SIZE;
+	page = virt_to_page(oc_conf->opalcorebuf);
+	for (i = 0; i < count; i++)
+		mark_page_reserved(page + i);
+
+	pr_debug("opalcorebuf = 0x%llx\n", (u64)oc_conf->opalcorebuf);
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
+static void opalcore_cleanup(void)
+{
+	if (oc_conf == NULL)
+		return;
+
+	/* Remove OPAL core sysfs file */
+	sysfs_remove_bin_file(opal_kobj, &opal_core_attr);
+	oc_conf->ptload_phdr = NULL;
+	oc_conf->ptload_cnt = 0;
+
+	/* free the buffer used for setting up OPAL core */
+	if (oc_conf->opalcorebuf) {
+		void *end = (void *)((u64)oc_conf->opalcorebuf +
+				     oc_conf->opalcorebuf_sz);
+
+		free_reserved_area(oc_conf->opalcorebuf, end, -1, NULL);
+		oc_conf->opalcorebuf = NULL;
+		oc_conf->opalcorebuf_sz = 0;
+	}
+
+	kfree(oc_conf);
+	oc_conf = NULL;
+}
+__exitcall(opalcore_cleanup);
+
+static void __init opalcore_config_init(void)
+{
+	u32 idx, cpu_data_version;
+	struct device_node *np;
+	const __be32 *prop;
+	u64 addr = 0;
+	int i, ret;
+
+	np = of_find_node_by_path("/ibm,opal/dump");
+	if (np == NULL)
+		return;
+
+	if (!of_device_is_compatible(np, "ibm,opal-dump")) {
+		pr_warn("Support missing for this f/w version!\n");
+		return;
+	}
+
+	/* Check if dump has been initiated on last reboot */
+	prop = of_get_property(np, "mpipl-boot", NULL);
+	if (!prop) {
+		of_node_put(np);
+		return;
+	}
+
+	/* Get OPAL metadata */
+	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_OPAL, &addr);
+	if ((ret != OPAL_SUCCESS) || !addr) {
+		pr_err("Failed to get OPAL metadata (%d)\n", ret);
+		goto error_out;
+	}
+
+	addr = be64_to_cpu(addr);
+	pr_debug("OPAL metadata addr: %llx\n", addr);
+	opalc_metadata = __va(addr);
+
+	/* Get OPAL CPU metadata */
+	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_CPU, &addr);
+	if ((ret != OPAL_SUCCESS) || !addr) {
+		pr_err("Failed to get OPAL CPU metadata (%d)\n", ret);
+		goto error_out;
+	}
+
+	addr = be64_to_cpu(addr);
+	pr_debug("CPU metadata addr: %llx\n", addr);
+	opalc_cpu_metadata = __va(addr);
+
+	/* Allocate memory for config buffer */
+	oc_conf = kzalloc(sizeof(struct opalcore_config), GFP_KERNEL);
+	if (oc_conf == NULL)
+		goto error_out;
+
+	/* Parse OPAL metadata */
+	if (opalc_metadata->version != OPAL_MPIPL_VERSION) {
+		pr_warn("Supported OPAL metadata version: %u, found: %u!\n",
+			OPAL_MPIPL_VERSION, opalc_metadata->version);
+		pr_warn("WARNING: F/W using newer OPAL metadata format!!\n");
+	}
+
+	oc_conf->ptload_cnt = 0;
+	idx = be32_to_cpu(opalc_metadata->region_cnt);
+	if (idx > MAX_PT_LOAD_CNT) {
+		pr_warn("WARNING: OPAL regions count (%d) adjusted to limit (%d)",
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
+	if (!oc_conf->ptload_cnt) {
+		pr_err("OPAL memory regions not found\n");
+		goto error_out;
+	}
+
+	/* Parse OPAL CPU metadata */
+	cpu_data_version = be32_to_cpu(opalc_cpu_metadata->cpu_data_version);
+	if (cpu_data_version != HDAT_FADUMP_CPU_DATA_VER) {
+		pr_warn("Supported CPU data version: %u, found: %u!\n",
+			HDAT_FADUMP_CPU_DATA_VER, cpu_data_version);
+		pr_warn("WARNING: F/W using newer CPU state data format!!\n");
+	}
+
+	addr = be64_to_cpu(opalc_cpu_metadata->region[0].dest);
+	if (!addr) {
+		pr_err("CPU state data not found!\n");
+		goto error_out;
+	}
+	oc_conf->cpu_state_destination_vaddr = (u64)__va(addr);
+
+	oc_conf->cpu_state_data_size =
+			be64_to_cpu(opalc_cpu_metadata->region[0].size);
+	oc_conf->cpu_state_entry_size =
+			be32_to_cpu(opalc_cpu_metadata->cpu_data_size);
+
+	if ((oc_conf->cpu_state_entry_size == 0) ||
+	    (oc_conf->cpu_state_entry_size > oc_conf->cpu_state_data_size)) {
+		pr_err("CPU state data is invalid.\n");
+		goto error_out;
+	}
+	oc_conf->num_cpus = (oc_conf->cpu_state_data_size /
+			     oc_conf->cpu_state_entry_size);
+
+	of_node_put(np);
+	return;
+
+error_out:
+	pr_err("Could not export /sys/firmware/opal/core\n");
+	opalcore_cleanup();
+	of_node_put(np);
+}
+
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
+	/* Set OPAL core file size */
+	opal_core_attr.size = oc_conf->opalcore_size;
+
+	/* Export OPAL core sysfs file */
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
index c66fa96..a89d3a0 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -85,6 +85,10 @@ static const struct opal_fadump_mem_struct *opal_fdm_active;
 static const struct opal_mpipl_fadump *opal_cpu_metadata;
 static struct opal_fadump_mem_struct *opal_fdm;
 
+#ifdef CONFIG_OPAL_CORE
+extern bool kernel_initiated;
+#endif
+
 static int opal_fadump_unregister(struct fw_dump *fadump_conf);
 
 static void opal_fadump_update_config(struct fw_dump *fadump_conf,
@@ -349,62 +353,6 @@ static void opal_fadump_cleanup(struct fw_dump *fadump_conf)
 		pr_warn("Could not reset (%llu) kernel metadata tag!\n", ret);
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
-	struct hdat_fadump_reg_entry *reg_entry;
-	int i;
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
 /*
  * Verify if CPU state data is available. If available, do a bit of sanity
  * checking before processing this data.
@@ -529,7 +477,7 @@ opal_fadump_build_cpu_notes(struct fw_dump *fadump_conf,
 			continue;
 
 		opal_fadump_read_regs((bufp + regs_offset), regs_cnt,
-				      reg_esize, &regs);
+				      reg_esize, true, &regs);
 		note_buf = fadump_regs_to_elf_notes(note_buf, &regs);
 		pr_debug("CPU PIR: 0x%x - R1 : 0x%lx, NIP : 0x%lx\n",
 			 thread_pir, regs.gpr[1], regs.nip);
@@ -573,6 +521,18 @@ static int __init opal_fadump_process(struct fw_dump *fadump_conf)
 		return rc;
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
 	rc = opal_fadump_build_cpu_notes(fadump_conf, fdh);
 	if (rc)
 		return rc;
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.h b/arch/powerpc/platforms/powernv/opal-fadump.h
index c0b5d6e..d0e17d6 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.h
+++ b/arch/powerpc/platforms/powernv/opal-fadump.h
@@ -8,6 +8,8 @@
 #ifndef _POWERNV_OPAL_FADUMP_H
 #define _POWERNV_OPAL_FADUMP_H
 
+#include <asm/reg.h>
+
 /*
  * OPAL FADump metadata structure format version
  *
@@ -77,4 +79,64 @@ struct hdat_fadump_reg_entry {
 	__be64		reg_val;
 } __packed;
 
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
+	struct hdat_fadump_reg_entry *reg_entry;
+	u64 val;
+	int i;
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
 #endif /* _POWERNV_OPAL_FADUMP_H */

