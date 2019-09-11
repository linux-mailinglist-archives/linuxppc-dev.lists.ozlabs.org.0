Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF800B0081
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 17:48:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T5st42ddzF3WB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 01:48:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4cX4jQnzF3CS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:52:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4cX30mnz8swG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:52:12 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4cX1GjCz9sNF; Thu, 12 Sep 2019 00:52:12 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46T4cW5841z9sDB
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:52:11 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEgviI101596
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:52:10 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uy0uj5fue-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:52:09 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:52:07 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:52:04 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEq2h743974772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:52:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC8445204E;
 Wed, 11 Sep 2019 14:52:02 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C5CF652052;
 Wed, 11 Sep 2019 14:52:00 +0000 (GMT)
Subject: [PATCH v6 20/36] powernv/fadump: process the crashdump by exporting
 it as /proc/vmcore
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:21:59 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0020-0000-0000-0000036B0E02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0021-0000-0000-000021C09B41
Message-Id: <156821351482.5656.6255805804744333073.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
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

Add support in the kernel to process the crash'ed kernel's memory
preserved during MPIPL and export it as /proc/vmcore file for the
userland scripts to filter and analyze it later.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v6:
  * Drop the TODO that is anyway removed later in this patch series.
  * Make mpipl-boot node processing code unindented.
  * Avoid using r_ variables as platform takes care of them in real mode anyway.


 arch/powerpc/platforms/powernv/opal-fadump.c |  147 ++++++++++++++++++++++++++
 1 file changed, 145 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index a4b96a7..5ace7c4 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -12,6 +12,7 @@
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
 #include <linux/mm.h>
+#include <linux/crash_dump.h>
 
 #include <asm/page.h>
 #include <asm/opal.h>
@@ -19,6 +20,7 @@
 
 #include "opal-fadump.h"
 
+static const struct opal_fadump_mem_struct *opal_fdm_active;
 static struct opal_fadump_mem_struct *opal_fdm;
 
 static int opal_fadump_unregister(struct fw_dump *fadump_conf);
@@ -39,6 +41,37 @@ static void opal_fadump_update_config(struct fw_dump *fadump_conf,
 	fadump_conf->fadumphdr_addr = fdm->fadumphdr_addr;
 }
 
+/*
+ * This function is called in the capture kernel to get configuration details
+ * from metadata setup by the first kernel.
+ */
+static void opal_fadump_get_config(struct fw_dump *fadump_conf,
+				   const struct opal_fadump_mem_struct *fdm)
+{
+	int i;
+
+	if (!fadump_conf->dump_active)
+		return;
+
+	fadump_conf->boot_memory_size = 0;
+
+	pr_debug("Boot memory regions:\n");
+	for (i = 0; i < fdm->region_cnt; i++) {
+		pr_debug("\t%d. base: 0x%llx, size: 0x%llx\n",
+			 (i + 1), fdm->rgn[i].src, fdm->rgn[i].size);
+
+		fadump_conf->boot_memory_size += fdm->rgn[i].size;
+	}
+
+	/*
+	 * Start address of reserve dump area (permanent reservation) for
+	 * re-registering FADump after dump capture.
+	 */
+	fadump_conf->reserve_dump_area_start = fdm->rgn[0].dest;
+
+	opal_fadump_update_config(fadump_conf, fdm);
+}
+
 /* Initialize kernel metadata */
 static void opal_fadump_init_metadata(struct opal_fadump_mem_struct *fdm)
 {
@@ -209,24 +242,97 @@ static void opal_fadump_cleanup(struct fw_dump *fadump_conf)
 		pr_warn("Could not reset (%llu) kernel metadata tag!\n", ret);
 }
 
+/*
+ * Convert CPU state data saved at the time of crash into ELF notes.
+ *
+ * Append crashing CPU's register data saved by the kernel in the PT_NOTE.
+ */
+static int __init
+opal_fadump_build_cpu_notes(struct fw_dump *fadump_conf,
+			    struct fadump_crash_info_header *fdh)
+{
+	u32 num_cpus = 1, *note_buf;
+	int rc;
+
+	if (fdh->crashing_cpu == FADUMP_CPU_UNKNOWN)
+		return -ENODEV;
+
+	/* Allocate CPU notes buffer to hold crashing cpu notes. */
+	rc = fadump_setup_cpu_notes_buf(num_cpus);
+	if (rc != 0)
+		return rc;
+
+	note_buf = (u32 *)fadump_conf->cpu_notes_buf_vaddr;
+	note_buf = fadump_regs_to_elf_notes(note_buf, &(fdh->regs));
+	final_note(note_buf);
+
+	pr_debug("Updating elfcore header (%llx) with cpu notes\n",
+		 fdh->elfcorehdr_addr);
+	fadump_update_elfcore_header(__va(fdh->elfcorehdr_addr));
+	return 0;
+}
+
 static int __init opal_fadump_process(struct fw_dump *fadump_conf)
 {
-	return -EINVAL;
+	struct fadump_crash_info_header *fdh;
+	int rc = -EINVAL;
+
+	if (!opal_fdm_active || !fadump_conf->fadumphdr_addr)
+		return rc;
+
+	/* Validate the fadump crash info header */
+	fdh = __va(fadump_conf->fadumphdr_addr);
+	if (fdh->magic_number != FADUMP_CRASH_INFO_MAGIC) {
+		pr_err("Crash info header is not valid.\n");
+		return rc;
+	}
+
+	rc = opal_fadump_build_cpu_notes(fadump_conf, fdh);
+	if (rc)
+		return rc;
+
+	/*
+	 * We are done validating dump info and elfcore header is now ready
+	 * to be exported. set elfcorehdr_addr so that vmcore module will
+	 * export the elfcore header through '/proc/vmcore'.
+	 */
+	elfcorehdr_addr = fdh->elfcorehdr_addr;
+
+	return rc;
 }
 
 static void opal_fadump_region_show(struct fw_dump *fadump_conf,
 				    struct seq_file *m)
 {
-	const struct opal_fadump_mem_struct *fdm_ptr = opal_fdm;
+	const struct opal_fadump_mem_struct *fdm_ptr;
 	u64 dumped_bytes = 0;
 	int i;
 
+	if (fadump_conf->dump_active)
+		fdm_ptr = opal_fdm_active;
+	else
+		fdm_ptr = opal_fdm;
+
 	for (i = 0; i < fdm_ptr->region_cnt; i++) {
+		/*
+		 * Only regions that are registered for MPIPL
+		 * would have dump data.
+		 */
+		if ((fadump_conf->dump_active) &&
+		    (i < fdm_ptr->registered_regions))
+			dumped_bytes = fdm_ptr->rgn[i].size;
+
 		seq_printf(m, "DUMP: Src: %#016llx, Dest: %#016llx, ",
 			   fdm_ptr->rgn[i].src, fdm_ptr->rgn[i].dest);
 		seq_printf(m, "Size: %#llx, Dumped: %#llx bytes\n",
 			   fdm_ptr->rgn[i].size, dumped_bytes);
 	}
+
+	/* Dump is active. Show reserved area start address. */
+	if (fadump_conf->dump_active) {
+		seq_printf(m, "\nMemory above %#016lx is reserved for saving crash dump\n",
+			   fadump_conf->reserve_dump_area_start);
+	}
 }
 
 static void opal_fadump_trigger(struct fadump_crash_info_header *fdh,
@@ -257,7 +363,11 @@ static struct fadump_ops opal_fadump_ops = {
 
 void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
 {
+	const __be32 *prop;
 	unsigned long dn;
+	u64 addr = 0;
+	s64 ret;
+
 
 	/*
 	 * Check if Firmware-Assisted Dump is supported. if yes, check
@@ -276,4 +386,37 @@ void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
 
 	fadump_conf->ops		= &opal_fadump_ops;
 	fadump_conf->fadump_supported	= 1;
+
+	/*
+	 * Check if dump has been initiated on last reboot.
+	 */
+	prop = of_get_flat_dt_prop(dn, "mpipl-boot", NULL);
+	if (!prop)
+		return;
+
+	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_KERNEL, &addr);
+	if ((ret != OPAL_SUCCESS) || !addr) {
+		pr_err("Failed to get Kernel metadata (%lld)\n", ret);
+		return;
+	}
+
+	addr = be64_to_cpu(addr);
+	pr_debug("Kernel metadata addr: %llx\n", addr);
+
+	opal_fdm_active = __va(addr);
+	if (opal_fdm_active->version != OPAL_FADUMP_VERSION) {
+		pr_warn("Supported kernel metadata version: %u, found: %d!\n",
+			OPAL_FADUMP_VERSION, opal_fdm_active->version);
+		pr_warn("WARNING: Kernel metadata format mismatch identified! Core file maybe corrupted..\n");
+	}
+
+	/* Kernel regions not registered with f/w for MPIPL */
+	if (opal_fdm_active->registered_regions == 0) {
+		opal_fdm_active = NULL;
+		return;
+	}
+
+	pr_info("Firmware-assisted dump is active.\n");
+	fadump_conf->dump_active = 1;
+	opal_fadump_get_config(fadump_conf, opal_fdm_active);
 }

