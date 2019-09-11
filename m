Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4919B00B4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 18:00:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T66x0XqwzF3Qx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 02:00:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4gv3fY2zF0n4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:55:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4gv23Rhz8vjV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:55:07 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4gv12L2z9s4Y; Thu, 12 Sep 2019 00:55:07 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46T4gt2WDrz9sDB
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:55:05 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEgrZN065681
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:55:03 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uxcvepf60-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:55:02 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:54:58 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:54:55 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEsrMS52232440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:54:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63E9842041;
 Wed, 11 Sep 2019 14:54:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F1C842042;
 Wed, 11 Sep 2019 14:54:51 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:54:51 +0000 (GMT)
Subject: [PATCH v6 25/36] powernv/fadump: process architected register state
 data provided by firmware
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:24:50 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0008-0000-0000-000003146C18
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0009-0000-0000-00004A32D84C
Message-Id: <156821367702.5656.5546683836236508389.stgit@hbathini.in.ibm.com>
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

Firmware provides architected register state data at the time of crash.
Process this data and build CPU notes to append to ELF core. In case
this data is missing or in unsupported format, at least append crashing
CPU's register data, to have something to work with in the vmcore file.

Signed-off-by: Hari Bathini <hbathini@linux.vnet.ibm.com>
Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
---

Changes in v6:
  * Do not error out right away but warn, sanity check & proceed for CPU data
    format version mismatch.
  * Use kernel types and also update comments.


 arch/powerpc/include/asm/fadump-internal.h   |    4 
 arch/powerpc/platforms/powernv/opal-fadump.c |  209 +++++++++++++++++++++++++-
 arch/powerpc/platforms/powernv/opal-fadump.h |   41 +++++
 3 files changed, 247 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index 0c2c4f5..2c72685 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -88,6 +88,10 @@ struct fw_dump {
 	unsigned long	reserve_bootvar;
 
 	unsigned long	cpu_state_data_size;
+	u64		cpu_state_dest_vaddr;
+	u32		cpu_state_data_version;
+	u32		cpu_state_entry_size;
+
 	unsigned long	hpte_region_size;
 
 	unsigned long	boot_memory_size;
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index ef6fb1f..ad4c18b 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -21,6 +21,7 @@
 #include "opal-fadump.h"
 
 static const struct opal_fadump_mem_struct *opal_fdm_active;
+static const struct opal_mpipl_fadump *opal_cpu_metadata;
 static struct opal_fadump_mem_struct *opal_fdm;
 
 static int opal_fadump_unregister(struct fw_dump *fadump_conf);
@@ -276,28 +277,207 @@ static void opal_fadump_cleanup(struct fw_dump *fadump_conf)
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
+	struct hdat_fadump_reg_entry *reg_entry;
+	int i;
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
+/*
+ * Verify if CPU state data is available. If available, do a bit of sanity
+ * checking before processing this data.
+ */
+static bool __init is_opal_fadump_cpu_data_valid(struct fw_dump *fadump_conf)
+{
+	if (!opal_cpu_metadata)
+		return false;
+
+	fadump_conf->cpu_state_data_version =
+		be32_to_cpu(opal_cpu_metadata->cpu_data_version);
+	fadump_conf->cpu_state_entry_size =
+		be32_to_cpu(opal_cpu_metadata->cpu_data_size);
+	fadump_conf->cpu_state_dest_vaddr =
+		(u64)__va(be64_to_cpu(opal_cpu_metadata->region[0].dest));
+	fadump_conf->cpu_state_data_size =
+		be64_to_cpu(opal_cpu_metadata->region[0].size);
+
+	if (fadump_conf->cpu_state_data_version != HDAT_FADUMP_CPU_DATA_VER) {
+		pr_warn("Supported CPU state data version: %u, found: %d!\n",
+			HDAT_FADUMP_CPU_DATA_VER,
+			fadump_conf->cpu_state_data_version);
+		pr_warn("WARNING: F/W using newer CPU state data format!!\n");
+	}
+
+	if ((fadump_conf->cpu_state_dest_vaddr == 0) ||
+	    (fadump_conf->cpu_state_entry_size == 0) ||
+	    (fadump_conf->cpu_state_entry_size >
+	     fadump_conf->cpu_state_data_size)) {
+		pr_err("CPU state data is invalid. Ignoring!\n");
+		return false;
+	}
+
+	return true;
+}
+
 /*
  * Convert CPU state data saved at the time of crash into ELF notes.
  *
- * Append crashing CPU's register data saved by the kernel in the PT_NOTE.
+ * While the crashing CPU's register data is saved by the kernel, CPU state
+ * data for all CPUs is saved by f/w. In CPU state data provided by f/w,
+ * each register entry is of 16 bytes, a numerical identifier along with
+ * a GPR/SPR flag in the first 8 bytes and the register value in the next
+ * 8 bytes. For more details refer to F/W documentation. If this data is
+ * missing or in unsupported format, append crashing CPU's register data
+ * saved by the kernel in the PT_NOTE, to have something to work with in
+ * the vmcore file.
  */
 static int __init
 opal_fadump_build_cpu_notes(struct fw_dump *fadump_conf,
 			    struct fadump_crash_info_header *fdh)
 {
+	u32 thread_pir, size_per_thread, regs_offset, regs_cnt, reg_esize;
+	struct hdat_fadump_thread_hdr *thdr;
+	bool is_cpu_data_valid = false;
 	u32 num_cpus = 1, *note_buf;
-	int rc;
-
-	if (fdh->crashing_cpu == FADUMP_CPU_UNKNOWN)
-		return -ENODEV;
+	struct pt_regs regs;
+	char *bufp;
+	int rc, i;
+
+	if (is_opal_fadump_cpu_data_valid(fadump_conf)) {
+		size_per_thread = fadump_conf->cpu_state_entry_size;
+		num_cpus = (fadump_conf->cpu_state_data_size / size_per_thread);
+		bufp = __va(fadump_conf->cpu_state_dest_vaddr);
+		is_cpu_data_valid = true;
+	}
 
-	/* Allocate CPU notes buffer to hold crashing cpu notes. */
 	rc = fadump_setup_cpu_notes_buf(num_cpus);
 	if (rc != 0)
 		return rc;
 
 	note_buf = (u32 *)fadump_conf->cpu_notes_buf_vaddr;
-	note_buf = fadump_regs_to_elf_notes(note_buf, &(fdh->regs));
+	if (!is_cpu_data_valid)
+		goto out;
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
+	pr_debug("NumCpus     : %u\n", num_cpus);
+	pr_debug("\tOffset: %u, Entry size: %u, Cnt: %u\n",
+		 regs_offset, reg_esize, regs_cnt);
+
+	for (i = 0; i < num_cpus; i++, bufp += size_per_thread) {
+		thdr = (struct hdat_fadump_thread_hdr *)bufp;
+
+		thread_pir = be32_to_cpu(thdr->pir);
+		pr_debug("[%04d] PIR: 0x%x, core state: 0x%02x\n",
+			 i, thread_pir, thdr->core_state);
+
+		/*
+		 * If this is kernel initiated crash, crashing_cpu would be set
+		 * appropriately and register data of the crashing CPU saved by
+		 * crashing kernel. Add this saved register data of crashing CPU
+		 * to elf notes and populate the pt_regs for the remaining CPUs
+		 * from register state data provided by firmware.
+		 */
+		if (fdh->crashing_cpu == thread_pir) {
+			note_buf = fadump_regs_to_elf_notes(note_buf,
+							    &fdh->regs);
+			pr_debug("Crashing CPU PIR: 0x%x - R1 : 0x%lx, NIP : 0x%lx\n",
+				 fdh->crashing_cpu, fdh->regs.gpr[1],
+				 fdh->regs.nip);
+			continue;
+		}
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
+				      reg_esize, &regs);
+		note_buf = fadump_regs_to_elf_notes(note_buf, &regs);
+		pr_debug("CPU PIR: 0x%x - R1 : 0x%lx, NIP : 0x%lx\n",
+			 thread_pir, regs.gpr[1], regs.nip);
+	}
+
+out:
+	/*
+	 * CPU state data is invalid/unsupported. Try appending crashing CPU's
+	 * register data, if it is saved by the kernel.
+	 */
+	if (fadump_conf->cpu_notes_buf_vaddr == (u64)note_buf) {
+		if (fdh->crashing_cpu == FADUMP_CPU_UNKNOWN) {
+			fadump_free_cpu_notes_buf();
+			return -ENODEV;
+		}
+
+		pr_warn("WARNING: appending only crashing CPU's register data\n");
+		note_buf = fadump_regs_to_elf_notes(note_buf, &(fdh->regs));
+	}
+
 	final_note(note_buf);
 
 	pr_debug("Updating elfcore header (%llx) with cpu notes\n",
@@ -374,6 +554,14 @@ static void opal_fadump_trigger(struct fadump_crash_info_header *fdh,
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
@@ -450,6 +638,13 @@ void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
 		return;
 	}
 
+	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_CPU, &addr);
+	if (addr) {
+		addr = be64_to_cpu(addr);
+		pr_debug("CPU metadata addr: %llx\n", addr);
+		opal_cpu_metadata = __va(addr);
+	}
+
 	pr_info("Firmware-assisted dump is active.\n");
 	fadump_conf->dump_active = 1;
 	opal_fadump_get_config(fadump_conf, opal_fdm_active);
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.h b/arch/powerpc/platforms/powernv/opal-fadump.h
index 0b83d89..c0b5d6e 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.h
+++ b/arch/powerpc/platforms/powernv/opal-fadump.h
@@ -36,4 +36,45 @@ struct opal_fadump_mem_struct {
 	struct opal_mpipl_region	rgn[OPAL_FADUMP_MAX_MEM_REGS];
 } __packed;
 
+/*
+ * CPU state data
+ *
+ * CPU state data information is provided by f/w. The format for this data
+ * is defined in the HDAT spec. Version is used to keep a tab on the changes
+ * in this CPU state data format. Changes to this format are unlikely, but
+ * if there are any changes, please refer to latest HDAT specification.
+ */
+#define HDAT_FADUMP_CPU_DATA_VER		1
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
+} __packed;
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
+} __packed;
+
 #endif /* _POWERNV_OPAL_FADUMP_H */

