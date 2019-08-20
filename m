Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7CD95F79
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 15:07:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CWLM34yhzDqjT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 23:07:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CV005TsNzDqvx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:06:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46CTzz2BVLz8t86
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:06:55 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46CTzy69X2z9sDQ; Tue, 20 Aug 2019 22:06:54 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46CTzy0YYBz9sBF
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 22:06:53 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7KC2CwQ073297
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:06:52 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ugf4c48hd-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:06:51 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 20 Aug 2019 13:06:50 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 20 Aug 2019 13:06:46 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7KC6i9o36307232
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 12:06:44 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D05F111C05B;
 Tue, 20 Aug 2019 12:06:44 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3979611C04A;
 Tue, 20 Aug 2019 12:06:43 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Aug 2019 12:06:43 +0000 (GMT)
Subject: [PATCH v5 21/31] powernv/fadump: process architected register state
 data provided by firmware
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 20 Aug 2019 17:36:42 +0530
In-Reply-To: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19082012-0020-0000-0000-00000361AE11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082012-0021-0000-0000-000021B6DEDD
Message-Id: <156630280239.8896.11769233860624935762.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200128
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

Firmware provides architected register state data at the time of crash.
Process this data and build CPU notes to append to ELF core.

Signed-off-by: Hari Bathini <hbathini@linux.vnet.ibm.com>
Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/fadump-common.h          |    4 +
 arch/powerpc/platforms/powernv/opal-fadump.c |  198 ++++++++++++++++++++++++--
 arch/powerpc/platforms/powernv/opal-fadump.h |   39 +++++
 3 files changed, 229 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
index 7107cf2..fc408b0 100644
--- a/arch/powerpc/kernel/fadump-common.h
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -98,7 +98,11 @@ struct fw_dump {
 	/* cmd line option during boot */
 	unsigned long	reserve_bootvar;
 
+	unsigned long	cpu_state_destination_addr;
+	unsigned long	cpu_state_data_version;
+	unsigned long	cpu_state_entry_size;
 	unsigned long	cpu_state_data_size;
+
 	unsigned long	hpte_region_size;
 
 	unsigned long	boot_mem_dest_addr;
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index f75b861..9a32a7f 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -23,6 +23,7 @@
 #include "opal-fadump.h"
 
 static const struct opal_fadump_mem_struct *opal_fdm_active;
+static const struct opal_mpipl_fadump *opal_cpu_metadata;
 static struct opal_fadump_mem_struct *opal_fdm;
 
 static int opal_fadump_unregister(struct fw_dump *fadump_conf);
@@ -282,15 +283,122 @@ static void opal_fadump_cleanup(struct fw_dump *fadump_conf)
 		pr_warn("Could not reset (%llu) kernel metadata tag!\n", ret);
 }
 
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
+					 struct pt_regs *regs)
+{
+	int i;
+	struct hdat_fadump_reg_entry *reg_entry;
+
+	memset(regs, 0, sizeof(struct pt_regs));
+
+	for (i = 0; i < regs_cnt; i++, bufp += reg_entry_size) {
+		reg_entry = (struct hdat_fadump_reg_entry *)bufp;
+		opal_fadump_set_regval_regnum(regs,
+					      be32_to_cpu(reg_entry->reg_type),
+					      be32_to_cpu(reg_entry->reg_num),
+					      be64_to_cpu(reg_entry->reg_val));
+	}
+}
+
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
 /*
  * Convert CPU state data saved at the time of crash into ELF notes.
+ *
+ * Each register entry is of 16 bytes, A numerical identifier along with
+ * a GPR/SPR flag in the first 8 bytes and the register value in the next
+ * 8 bytes. For more details refer to F/W documentation.
  */
 static int __init opal_fadump_build_cpu_notes(struct fw_dump *fadump_conf)
 {
 	u32 num_cpus, *note_buf;
 	struct fadump_crash_info_header *fdh = NULL;
+	struct hdat_fadump_thread_hdr *thdr;
+	unsigned long addr;
+	u32 thread_pir;
+	char *bufp;
+	struct pt_regs regs;
+	unsigned int size_of_each_thread;
+	unsigned int regs_offset, regs_cnt, reg_esize;
+	int i;
+
+	fadump_conf->cpu_state_entry_size =
+			be32_to_cpu(opal_cpu_metadata->cpu_data_size);
+	fadump_conf->cpu_state_destination_addr =
+			be64_to_cpu(opal_cpu_metadata->region[0].dest);
+	fadump_conf->cpu_state_data_size =
+			be64_to_cpu(opal_cpu_metadata->region[0].size);
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
+	thdr = (struct hdat_fadump_thread_hdr *)bufp;
+	regs_offset = (offsetof(struct hdat_fadump_thread_hdr, offset) +
+		       be32_to_cpu(thdr->offset));
+	reg_esize = be32_to_cpu(thdr->esize);
+	regs_cnt  = be32_to_cpu(thdr->ecnt);
 
-	num_cpus = 1;
 	/* Allocate buffer to hold cpu crash notes. */
 	fadump_conf->cpu_notes_buf_size = num_cpus * sizeof(note_buf_t);
 	fadump_conf->cpu_notes_buf_size =
@@ -309,10 +417,53 @@ static int __init opal_fadump_build_cpu_notes(struct fw_dump *fadump_conf)
 	if (fadump_conf->fadumphdr_addr)
 		fdh = __va(fadump_conf->fadumphdr_addr);
 
-	if (fdh && (fdh->crashing_cpu != FADUMP_CPU_UNKNOWN)) {
-		note_buf = fadump_regs_to_elf_notes(note_buf, &(fdh->regs));
-		final_note(note_buf);
+	pr_debug("--------CPU State Data------------\n");
+	pr_debug("NumCpus     : %u\n", num_cpus);
+	pr_debug("\tOffset: %u, Entry size: %u, Cnt: %u\n",
+		 regs_offset, reg_esize, regs_cnt);
+
+	for (i = 0; i < num_cpus; i++, bufp += size_of_each_thread) {
+		thdr = (struct hdat_fadump_thread_hdr *)bufp;
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
+		opal_fadump_read_regs((bufp + regs_offset), regs_cnt,
+				      reg_esize, &regs);
 
+		note_buf = fadump_regs_to_elf_notes(note_buf, &regs);
+		pr_debug("CPU PIR: 0x%x - R1 : 0x%lx, NIP : 0x%lx\n",
+			 thread_pir, regs.gpr[1], regs.nip);
+	}
+	final_note(note_buf);
+
+	if (fdh) {
 		pr_debug("Updating elfcore header (%llx) with cpu notes\n",
 			 fdh->elfcorehdr_addr);
 		fadump_update_elfcore_header(fadump_conf,
@@ -327,7 +478,8 @@ static int __init opal_fadump_process(struct fw_dump *fadump_conf)
 	struct fadump_crash_info_header *fdh;
 	int rc = 0;
 
-	if (!opal_fdm_active || !fadump_conf->fadumphdr_addr)
+	if (!opal_fdm_active || !opal_cpu_metadata ||
+	    !fadump_conf->fadumphdr_addr)
 		return -EINVAL;
 
 	/* Validate the fadump crash info header */
@@ -337,13 +489,6 @@ static int __init opal_fadump_process(struct fw_dump *fadump_conf)
 		return -EINVAL;
 	}
 
-	/*
-	 * TODO: To build cpu notes, find a way to map PIR to logical id.
-	 *       Also, we may need different method for pseries and powernv.
-	 *       The currently booted kernel could have a different PIR to
-	 *       logical id mapping. So, try saving info of previous kernel's
-	 *       paca to get the right PIR to logical id mapping.
-	 */
 	rc = opal_fadump_build_cpu_notes(fadump_conf);
 	if (rc)
 		return rc;
@@ -397,6 +542,14 @@ static void opal_fadump_trigger(struct fadump_crash_info_header *fdh,
 {
 	int rc;
 
+	/*
+	 * Unlike on pSeries platform, logical CPU number is not provided
+	 * with architected register state data. So, store the crashing
+	 * CPU's PIR instead to plug the appropriate register data for
+	 * crashing CPU in the vmcore file.
+	 */
+	fdh->crashing_cpu = (u32)mfspr(SPRN_PIR);
+
 	rc = opal_cec_reboot2(OPAL_REBOOT_MPIPL, msg);
 	if (rc == OPAL_UNSUPPORTED) {
 		pr_emerg("Reboot type %d not supported.\n",
@@ -449,6 +602,7 @@ int __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
 		u64 addr = 0;
 		s64 ret;
 		const struct opal_fadump_mem_struct *r_opal_fdm_active;
+		const struct opal_mpipl_fadump *r_opal_cpu_metadata;
 
 		ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_KERNEL, &addr);
 		if ((ret != OPAL_SUCCESS) || !addr) {
@@ -473,6 +627,26 @@ int __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
 			return 1;
 		}
 
+		ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_CPU, &addr);
+		if ((ret != OPAL_SUCCESS) || !addr) {
+			pr_err("Failed to get CPU metadata (%lld)\n", ret);
+			return 1;
+		}
+
+		addr = be64_to_cpu(addr);
+		pr_debug("CPU metadata addr: %llx\n", addr);
+
+		opal_cpu_metadata = __va(addr);
+		r_opal_cpu_metadata = (void *)addr;
+		fadump_conf->cpu_state_data_version =
+			be32_to_cpu(r_opal_cpu_metadata->cpu_data_version);
+		if (fadump_conf->cpu_state_data_version !=
+		    HDAT_FADUMP_CPU_DATA_VERSION) {
+			pr_err("CPU data format version (%lu) mismatch!\n",
+			       fadump_conf->cpu_state_data_version);
+			return 1;
+		}
+
 		pr_info("Firmware-assisted dump is active.\n");
 		fadump_conf->dump_active = 1;
 		opal_fadump_get_config(fadump_conf, r_opal_fdm_active);
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.h b/arch/powerpc/platforms/powernv/opal-fadump.h
index 19cac1f..ce4c522 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.h
+++ b/arch/powerpc/platforms/powernv/opal-fadump.h
@@ -30,4 +30,43 @@ struct opal_fadump_mem_struct {
 	struct opal_mpipl_region	rgn[OPAL_FADUMP_MAX_MEM_REGS];
 } __attribute__((packed));
 
+/*
+ * CPU state data is provided by f/w. Below are the definitions
+ * provided in HDAT spec. Refer to latest HDAT specification for
+ * any update to this format.
+ */
+
+#define HDAT_FADUMP_CPU_DATA_VERSION		1
+
+#define HDAT_FADUMP_CORE_INACTIVE		(0x0F)
+
+/* HDAT thread header for register entries */
+struct hdat_fadump_thread_hdr {
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
+#define HDAT_FADUMP_REG_TYPE_GPR		0x01
+#define HDAT_FADUMP_REG_TYPE_SPR		0x02
+
+/* ID numbers used by f/w while populating certain registers */
+#define HDAT_FADUMP_REG_ID_NIP			0x7D0
+#define HDAT_FADUMP_REG_ID_MSR			0x7D1
+#define HDAT_FADUMP_REG_ID_CCR			0x7D2
+
+/* HDAT register entry. */
+struct hdat_fadump_reg_entry {
+	__be32		reg_type;
+	__be32		reg_num;
+	__be64		reg_val;
+} __attribute__((packed));
+
 #endif /* __PPC64_OPAL_FA_DUMP_H__ */

