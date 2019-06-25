Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A11559B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 23:08:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YJfm0rlxzDq9C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 07:08:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YJB811lczDqSr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:47:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45YJB71qtXz8vt7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:47:11 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45YJB71TJWz9s3l; Wed, 26 Jun 2019 06:47:11 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45YJB65kcfz9s5c
 for <linuxppc-dev@ozlabs.org>; Wed, 26 Jun 2019 06:47:10 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PKl26R064381
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:47:09 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tbs7jm4xa-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:47:09 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 25 Jun 2019 21:47:06 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 21:47:03 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5PKl2I946989520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 20:47:02 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B073AE051;
 Tue, 25 Jun 2019 20:47:02 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B75DAE045;
 Tue, 25 Jun 2019 20:47:00 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.0.234])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jun 2019 20:46:59 +0000 (GMT)
Subject: [PATCH v3 09/16] powernv/fadump: process architected register state
 data provided by firmware
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 26 Jun 2019 02:16:59 +0530
In-Reply-To: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
References: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19062520-4275-0000-0000-000003463667
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062520-4276-0000-0000-0000385638F3
Message-Id: <156149561898.9094.8304860886073992321.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250158
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

Firmware provides architected register state data at the time of crash.
Process this data and build CPU notes to append to ELF core.

Signed-off-by: Hari Bathini <hbathini@linux.vnet.ibm.com>
Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/opal-api.h          |   31 ++++
 arch/powerpc/kernel/fadump-common.h          |    3 
 arch/powerpc/platforms/powernv/opal-fadump.c |  197 ++++++++++++++++++++++++--
 arch/powerpc/platforms/powernv/opal-fadump.h |    2 
 4 files changed, 221 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index 1762b1e..a60b09f 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -984,6 +984,37 @@ struct opal_sg_list {
  * Firmware-Assisted Dump (FADump)
  */
 
+#define CPU_STATE_DATA_VERSION		1
+
+/* FADump thread header for register entries */
+struct opal_fadump_thread_hdr {
+	__be32  pir;
+	/* 0x00 - 0x0F - The corresponding stop state of the core */
+	u8      core_state;
+	u8      reserved[3];
+
+	__be32	offset;	/* Offset to Register Entries array */
+	__be32	ecnt;	/* Number of entries */
+	__be32	esize;	/* Alloc size of each array entry in bytes */
+	__be32	eactsz;	/* Actual size of each array entry in bytes */
+} __attribute__((packed));
+
+/* Register types populated by f/w */
+#define OPAL_REG_TYPE_GPR		0x01
+#define OPAL_REG_TYPE_SPR		0x02
+
+/* ID numbers used by f/w while populating certain registers */
+#define REG_ID_NIP			0x7D0
+#define REG_ID_MSR			0x7D1
+#define REG_ID_CCR			0x7D2
+
+/* FADump register entry. */
+struct opal_fadump_reg_entry {
+	__be32		reg_type;
+	__be32		reg_num;
+	__be64		reg_val;
+} __attribute__((packed));
+
 /* The maximum number of dump sections supported by OPAL */
 #define OPAL_FADUMP_NR_SECTIONS			64
 
diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
index 555230e..ebebe4d 100644
--- a/arch/powerpc/kernel/fadump-common.h
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -117,6 +117,9 @@ struct fadump_memory_range {
 
 /* Firmware-assisted dump configuration details. */
 struct fw_dump {
+	unsigned long	cpu_state_destination_addr;
+	unsigned long	cpu_state_data_version;
+	unsigned long	cpu_state_entry_size;
 	unsigned long	cpu_state_data_size;
 	unsigned long	hpte_region_size;
 	unsigned long	boot_memory_size;
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index 7e6c46a..ed3c35b 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -29,6 +29,7 @@
 #include "opal-fadump.h"
 
 static const struct opal_fadump_mem_struct *opal_fdm_active;
+static const struct opal_mpipl_fadump *opal_cpu_metadata;
 static struct opal_fadump_mem_struct *opal_fdm;
 
 static void opal_set_preserv_area_start(struct fw_dump *fadump_conf)
@@ -229,6 +230,75 @@ static int opal_invalidate_fadump(struct fw_dump *fadump_conf)
 	return 0;
 }
 
+static inline void fadump_set_regval_regnum(struct pt_regs *regs, u32 reg_type,
+					    u32 reg_num, u64 reg_val)
+{
+	if (reg_type == OPAL_REG_TYPE_GPR) {
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
+	case REG_ID_NIP:
+		regs->nip = reg_val;
+		break;
+	case REG_ID_MSR:
+		regs->msr = reg_val;
+		break;
+	case REG_ID_CCR:
+		regs->ccr = reg_val;
+		break;
+	}
+}
+
+static inline void fadump_read_registers(char *bufp, unsigned int regs_cnt,
+					 unsigned int reg_entry_size,
+					 struct pt_regs *regs)
+{
+	int i;
+	struct opal_fadump_reg_entry *reg_entry;
+
+	memset(regs, 0, sizeof(struct pt_regs));
+
+	for (i = 0; i < regs_cnt; i++, bufp += reg_entry_size) {
+		reg_entry = (struct opal_fadump_reg_entry *)bufp;
+		fadump_set_regval_regnum(regs,
+					 be32_to_cpu(reg_entry->reg_type),
+					 be32_to_cpu(reg_entry->reg_num),
+					 be64_to_cpu(reg_entry->reg_val));
+	}
+}
+
+static inline bool __init is_thread_core_inactive(u8 core_state)
+{
+	bool is_inactive = false;
+
+	/*
+	 * TODO: Check what each state value means and implement accordingly.
+	 *       Also, make sure F/W is updating this field appropriately.
+	 */
+	if (core_state == CORE_STATE_INACTIVE)
+		is_inactive = true;
+
+	return is_inactive;
+}
+
 /*
  * Read CPU state dump data and convert it into ELF notes.
  *
@@ -240,8 +310,38 @@ static int __init fadump_build_cpu_notes(struct fw_dump *fadump_conf)
 {
 	u32 num_cpus, *note_buf;
 	struct fadump_crash_info_header *fdh = NULL;
+	struct opal_fadump_thread_hdr *thdr;
+	unsigned long addr;
+	u32 thread_pir;
+	char *bufp;
+	struct pt_regs regs;
+	unsigned int size_of_each_thread;
+	unsigned int regs_offset, regs_cnt, reg_esize;
+	int i;
+
+	if ((fadump_conf->cpu_state_destination_addr == 0) ||
+	    (fadump_conf->cpu_state_entry_size == 0)) {
+		pr_err("CPU state data not available for processing!\n");
+		return -ENODEV;
+	}
+
+	size_of_each_thread = fadump_conf->cpu_state_entry_size;
+	num_cpus = (fadump_conf->cpu_state_data_size / size_of_each_thread);
+
+	addr = fadump_conf->cpu_state_destination_addr;
+	bufp = __va(addr);
+
+	/*
+	 * Offset for register entries, entry size and registers count is
+	 * duplicated in every thread header in keeping with HDAT format.
+	 * Use these values from the first thread header.
+	 */
+	thdr = (struct opal_fadump_thread_hdr *)bufp;
+	regs_offset = (offsetof(struct opal_fadump_thread_hdr, offset) +
+		       be32_to_cpu(thdr->offset));
+	reg_esize = be32_to_cpu(thdr->esize);
+	regs_cnt  = be32_to_cpu(thdr->ecnt);
 
-	num_cpus = 1;
 	/* Allocate buffer to hold cpu crash notes. */
 	fadump_conf->cpu_notes_buf_size = num_cpus * sizeof(note_buf_t);
 	fadump_conf->cpu_notes_buf_size =
@@ -260,10 +360,53 @@ static int __init fadump_build_cpu_notes(struct fw_dump *fadump_conf)
 	if (fadump_conf->fadumphdr_addr)
 		fdh = __va(fadump_conf->fadumphdr_addr);
 
-	if (fdh && (fdh->crashing_cpu != CPU_UNKNOWN)) {
-		note_buf = fadump_regs_to_elf_notes(note_buf, &(fdh->regs));
-		final_note(note_buf);
+	pr_debug("--------CPU State Data------------\n");
+	pr_debug("NumCpus     : %u\n", num_cpus);
+	pr_debug("\tOffset: %u, Entry size: %u, Cnt: %u\n",
+		 regs_offset, reg_esize, regs_cnt);
+
+	for (i = 0; i < num_cpus; i++, bufp += size_of_each_thread) {
+		thdr = (struct opal_fadump_thread_hdr *)bufp;
+
+		thread_pir = be32_to_cpu(thdr->pir);
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
+		/*
+		 * If this is kernel initiated crash, crashing_cpu would be set
+		 * appropriately and register data of the crashing CPU saved by
+		 * crashing kernel. Add this saved register data of crashing CPU
+		 * to elf notes and populate the pt_regs for the remaining CPUs
+		 * from register state data provided by firmware.
+		 */
+		if (fdh && (fdh->crashing_cpu == thread_pir)) {
+			note_buf = fadump_regs_to_elf_notes(note_buf,
+							    &fdh->regs);
+			pr_debug("Crashing CPU PIR: 0x%x - R1 : 0x%lx, NIP : 0x%lx\n",
+				 fdh->crashing_cpu, fdh->regs.gpr[1],
+				 fdh->regs.nip);
+			continue;
+		}
+
+		fadump_read_registers((bufp + regs_offset), regs_cnt,
+				      reg_esize, &regs);
+
+		note_buf = fadump_regs_to_elf_notes(note_buf, &regs);
+		pr_debug("CPU PIR: 0x%x - R1 : 0x%lx, NIP : 0x%lx\n",
+			 thread_pir, regs.gpr[1], regs.nip);
+	}
+	final_note(note_buf);
 
+	if (fdh) {
 		pr_debug("Updating elfcore header (%llx) with cpu notes\n",
 			 fdh->elfcorehdr_addr);
 		fadump_update_elfcore_header(fadump_conf,
@@ -278,7 +421,8 @@ static int __init opal_process_fadump(struct fw_dump *fadump_conf)
 	struct fadump_crash_info_header *fdh;
 	int rc = 0;
 
-	if (!opal_fdm_active || !fadump_conf->fadumphdr_addr)
+	if (!opal_fdm_active || !opal_cpu_metadata ||
+	    !fadump_conf->fadumphdr_addr)
 		return -EINVAL;
 
 	/* Validate the fadump crash info header */
@@ -288,13 +432,6 @@ static int __init opal_process_fadump(struct fw_dump *fadump_conf)
 		return -EINVAL;
 	}
 
-	/*
-	 * TODO: To build cpu notes, find a way to map PIR to logical id.
-	 *       Also, we may need different method for pseries and powernv.
-	 *       The currently booted kernel could have a different PIR to
-	 *       logical id mapping. So, try saving info of previous kernel's
-	 *       paca to get the right PIR to logical id mapping.
-	 */
 	rc = fadump_build_cpu_notes(fadump_conf);
 	if (rc)
 		return rc;
@@ -343,6 +480,14 @@ static void opal_crash_fadump(struct fadump_crash_info_header *fdh,
 {
 	int rc;
 
+	/*
+	 * Unlike on pseries platform, logical CPU number is not provided
+	 * with architected register state data. So, store the crashing
+	 * CPU's PIR instead to plug the appropriate register data for
+	 * crashing CPU in the vmcore file.
+	 */
+	fdh->crashing_cpu = (u32)mfspr(SPRN_PIR);
+
 	rc = opal_cec_reboot2(OPAL_REBOOT_OS_ERROR, msg);
 	if (rc == OPAL_UNSUPPORTED) {
 		pr_emerg("Reboot type %d not supported.\n",
@@ -403,6 +548,7 @@ int __init opal_dt_scan_fadump(struct fw_dump *fadump_conf, ulong node)
 		u64 addr = 0;
 		s64 ret;
 		const struct opal_fadump_mem_struct *r_opal_fdm_active;
+		const struct opal_mpipl_fadump *r_opal_cpu_metadata;
 
 		do {
 			ret = opal_mpipl_query_tag(idx, &addr);
@@ -412,6 +558,9 @@ int __init opal_dt_scan_fadump(struct fw_dump *fadump_conf, ulong node)
 			addr = be64_to_cpu(addr);
 			type = *((u8 *)addr);
 			switch (type) {
+			case MPIPL_FADUMP_TYPE_CPU:
+				opal_cpu_metadata = __va(addr);
+				break;
 			case MPIPL_FADUMP_TYPE_KERNEL:
 				opal_fdm_active = __va(addr);
 				break;
@@ -434,6 +583,30 @@ int __init opal_dt_scan_fadump(struct fw_dump *fadump_conf, ulong node)
 			return 1;
 		}
 
+		if (opal_cpu_metadata == NULL) {
+			pr_err("CPU metadata not found!\n");
+			return 1;
+		}
+
+		r_opal_cpu_metadata = (void *)__pa(opal_cpu_metadata);
+		fadump_conf->cpu_state_data_version =
+			be32_to_cpu(r_opal_cpu_metadata->cpu_data_version);
+		if (fadump_conf->cpu_state_data_version !=
+						CPU_STATE_DATA_VERSION) {
+			pr_err("CPU state data format version mismatch!\n");
+			pr_err("Kernel: %u, OPAL: %lu\n",
+			       CPU_STATE_DATA_VERSION,
+			       fadump_conf->cpu_state_data_version);
+			return 1;
+		}
+		fadump_conf->cpu_state_entry_size =
+			be32_to_cpu(r_opal_cpu_metadata->cpu_data_size);
+		fadump_conf->cpu_state_destination_addr =
+			be64_to_cpu(r_opal_cpu_metadata->region[0].dest);
+		fadump_conf->cpu_state_data_size =
+			be64_to_cpu(r_opal_cpu_metadata->region[0].size);
+
+
 		pr_info("Firmware-assisted dump is active.\n");
 		fadump_conf->dump_active = 1;
 		update_fadump_config(fadump_conf, r_opal_fdm_active);
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.h b/arch/powerpc/platforms/powernv/opal-fadump.h
index a0ffad5..34a5e49 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.h
+++ b/arch/powerpc/platforms/powernv/opal-fadump.h
@@ -31,4 +31,6 @@ struct opal_fadump_mem_struct {
 	struct opal_fadump_region	rgn[MAX_REAL_MEM_REGIONS];
 };
 
+#define CORE_STATE_INACTIVE		(0x0F)
+
 #endif /* __PPC64_OPAL_FA_DUMP_H__ */

