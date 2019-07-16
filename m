Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EC56A79F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 13:45:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nz9p2Cj2zDqfq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 21:45:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nytq3rRQzDqY7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:32:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45nytp2s6rz8wGk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:32:50 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45nytp0nZSz9sNC; Tue, 16 Jul 2019 21:32:50 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45nytn3WMCz9sN4
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 21:32:49 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GBMH4s112957
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:32:47 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tsd0gj3qh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:32:47 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 16 Jul 2019 12:32:45 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 12:32:42 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6GBWeib48103432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 11:32:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9106FAE057;
 Tue, 16 Jul 2019 11:32:40 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E296CAE056;
 Tue, 16 Jul 2019 11:32:38 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 11:32:38 +0000 (GMT)
Subject: [PATCH v4 06/25] pseries/fadump: define register/un-register
 callback functions
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 16 Jul 2019 17:02:38 +0530
In-Reply-To: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19071611-0020-0000-0000-00000354051F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071611-0021-0000-0000-000021A7D101
Message-Id: <156327675811.27462.1334913873575448846.stgit@hbathini.in.ibm.com>
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

Make RTAS calls to register and un-register for FADump. Also, update
how fadump_region contents are diplayed to provide more information.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/fadump-common.h          |    2 
 arch/powerpc/kernel/fadump.c                 |  164 ++------------------------
 arch/powerpc/platforms/pseries/rtas-fadump.c |  163 +++++++++++++++++++++++++-
 3 files changed, 176 insertions(+), 153 deletions(-)

diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
index 020d582..273247d 100644
--- a/arch/powerpc/kernel/fadump-common.h
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -108,6 +108,8 @@ struct fw_dump {
 	unsigned long	cpu_notes_buf;
 	unsigned long	cpu_notes_buf_size;
 
+	unsigned long	boot_mem_dest_addr;
+
 	int		ibm_configure_kernel_dump;
 
 	unsigned long	fadump_enabled:1;
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index a901ca1..650ebf8 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -36,7 +36,6 @@
 #include "../platforms/pseries/rtas-fadump.h"
 
 static struct fw_dump fw_dump;
-static struct rtas_fadump_mem_struct fdm;
 static const struct rtas_fadump_mem_struct *fdm_active;
 
 static DEFINE_MUTEX(fadump_mutex);
@@ -179,61 +178,6 @@ static void fadump_show_config(void)
 	pr_debug("Boot memory size  : %lx\n", fw_dump.boot_memory_size);
 }
 
-static unsigned long init_fadump_mem_struct(struct rtas_fadump_mem_struct *fdm,
-				unsigned long addr)
-{
-	if (!fdm)
-		return 0;
-
-	memset(fdm, 0, sizeof(struct rtas_fadump_mem_struct));
-	addr = addr & PAGE_MASK;
-
-	fdm->header.dump_format_version = cpu_to_be32(0x00000001);
-	fdm->header.dump_num_sections = cpu_to_be16(3);
-	fdm->header.dump_status_flag = 0;
-	fdm->header.offset_first_dump_section =
-		cpu_to_be32((u32)offsetof(struct rtas_fadump_mem_struct, cpu_state_data));
-
-	/*
-	 * Fields for disk dump option.
-	 * We are not using disk dump option, hence set these fields to 0.
-	 */
-	fdm->header.dd_block_size = 0;
-	fdm->header.dd_block_offset = 0;
-	fdm->header.dd_num_blocks = 0;
-	fdm->header.dd_offset_disk_path = 0;
-
-	/* set 0 to disable an automatic dump-reboot. */
-	fdm->header.max_time_auto = 0;
-
-	/* Kernel dump sections */
-	/* cpu state data section. */
-	fdm->cpu_state_data.request_flag = cpu_to_be32(RTAS_FADUMP_REQUEST_FLAG);
-	fdm->cpu_state_data.source_data_type = cpu_to_be16(RTAS_FADUMP_CPU_STATE_DATA);
-	fdm->cpu_state_data.source_address = 0;
-	fdm->cpu_state_data.source_len = cpu_to_be64(fw_dump.cpu_state_data_size);
-	fdm->cpu_state_data.destination_address = cpu_to_be64(addr);
-	addr += fw_dump.cpu_state_data_size;
-
-	/* hpte region section */
-	fdm->hpte_region.request_flag = cpu_to_be32(RTAS_FADUMP_REQUEST_FLAG);
-	fdm->hpte_region.source_data_type = cpu_to_be16(RTAS_FADUMP_HPTE_REGION);
-	fdm->hpte_region.source_address = 0;
-	fdm->hpte_region.source_len = cpu_to_be64(fw_dump.hpte_region_size);
-	fdm->hpte_region.destination_address = cpu_to_be64(addr);
-	addr += fw_dump.hpte_region_size;
-
-	/* RMA region section */
-	fdm->rmr_region.request_flag = cpu_to_be32(RTAS_FADUMP_REQUEST_FLAG);
-	fdm->rmr_region.source_data_type = cpu_to_be16(RTAS_FADUMP_REAL_MODE_REGION);
-	fdm->rmr_region.source_address = cpu_to_be64(RMA_START);
-	fdm->rmr_region.source_len = cpu_to_be64(fw_dump.boot_memory_size);
-	fdm->rmr_region.destination_address = cpu_to_be64(addr);
-	addr += fw_dump.boot_memory_size;
-
-	return addr;
-}
-
 /**
  * fadump_calculate_reserve_size(): reserve variable boot area 5% of System RAM
  *
@@ -480,61 +424,6 @@ static int __init early_fadump_reserve_mem(char *p)
 }
 early_param("fadump_reserve_mem", early_fadump_reserve_mem);
 
-static int register_fw_dump(struct rtas_fadump_mem_struct *fdm)
-{
-	int rc, err;
-	unsigned int wait_time;
-
-	pr_debug("Registering for firmware-assisted kernel dump...\n");
-
-	/* TODO: Add upper time limit for the delay */
-	do {
-		rc = rtas_call(fw_dump.ibm_configure_kernel_dump, 3, 1, NULL,
-			FADUMP_REGISTER, fdm,
-			sizeof(struct rtas_fadump_mem_struct));
-
-		wait_time = rtas_busy_delay_time(rc);
-		if (wait_time)
-			mdelay(wait_time);
-
-	} while (wait_time);
-
-	err = -EIO;
-	switch (rc) {
-	default:
-		pr_err("Failed to register. Unknown Error(%d).\n", rc);
-		break;
-	case -1:
-		printk(KERN_ERR "Failed to register firmware-assisted kernel"
-			" dump. Hardware Error(%d).\n", rc);
-		break;
-	case -3:
-		if (!is_fadump_boot_mem_contiguous(&fw_dump))
-			pr_err("Can't have holes in boot memory area while registering fadump\n");
-		else if (!is_fadump_reserved_mem_contiguous(&fw_dump))
-			pr_err("Can't have holes in reserved memory area while"
-			       " registering fadump\n");
-
-		printk(KERN_ERR "Failed to register firmware-assisted kernel"
-			" dump. Parameter Error(%d).\n", rc);
-		err = -EINVAL;
-		break;
-	case -9:
-		printk(KERN_ERR "firmware-assisted kernel dump is already "
-			" registered.");
-		fw_dump.dump_registered = 1;
-		err = -EEXIST;
-		break;
-	case 0:
-		printk(KERN_INFO "firmware-assisted kernel dump registration"
-			" is successful\n");
-		fw_dump.dump_registered = 1;
-		err = 0;
-		break;
-	}
-	return err;
-}
-
 void crash_fadump(struct pt_regs *regs, const char *str)
 {
 	struct fadump_crash_info_header *fdh = NULL;
@@ -577,8 +466,7 @@ void crash_fadump(struct pt_regs *regs, const char *str)
 
 	fdh->online_mask = *cpu_online_mask;
 
-	/* Call ibm,os-term rtas call to trigger firmware assisted dump */
-	rtas_os_term((char *)str);
+	fw_dump.ops->fadump_trigger(fdh, str);
 }
 
 #define GPR_MASK	0xffffff0000000000
@@ -987,7 +875,7 @@ static int fadump_setup_crash_memory_ranges(void)
 static inline unsigned long fadump_relocate(unsigned long paddr)
 {
 	if (paddr > RMA_START && paddr < fw_dump.boot_memory_size)
-		return be64_to_cpu(fdm.rmr_region.destination_address) + paddr;
+		return fw_dump.boot_mem_dest_addr + paddr;
 	else
 		return paddr;
 }
@@ -1060,7 +948,7 @@ static int fadump_create_elfcore_headers(char *bufp)
 			 * to the specified destination_address. Hence set
 			 * the correct offset.
 			 */
-			phdr->p_offset = be64_to_cpu(fdm.rmr_region.destination_address);
+			phdr->p_offset = fw_dump.boot_mem_dest_addr;
 		}
 
 		phdr->p_paddr = mbase;
@@ -1112,7 +1000,8 @@ static int register_fadump(void)
 	if (ret)
 		return ret;
 
-	addr = be64_to_cpu(fdm.rmr_region.destination_address) + be64_to_cpu(fdm.rmr_region.source_len);
+	addr = fw_dump.fadumphdr_addr;
+
 	/* Initialize fadump crash info header. */
 	addr = init_fadump_header(addr);
 	vaddr = __va(addr);
@@ -1121,34 +1010,8 @@ static int register_fadump(void)
 	fadump_create_elfcore_headers(vaddr);
 
 	/* register the future kernel dump with firmware. */
-	return register_fw_dump(&fdm);
-}
-
-static int fadump_unregister_dump(struct rtas_fadump_mem_struct *fdm)
-{
-	int rc = 0;
-	unsigned int wait_time;
-
-	pr_debug("Un-register firmware-assisted dump\n");
-
-	/* TODO: Add upper time limit for the delay */
-	do {
-		rc = rtas_call(fw_dump.ibm_configure_kernel_dump, 3, 1, NULL,
-			FADUMP_UNREGISTER, fdm,
-			sizeof(struct rtas_fadump_mem_struct));
-
-		wait_time = rtas_busy_delay_time(rc);
-		if (wait_time)
-			mdelay(wait_time);
-	} while (wait_time);
-
-	if (rc) {
-		printk(KERN_ERR "Failed to un-register firmware-assisted dump."
-			" unexpected error(%d).\n", rc);
-		return rc;
-	}
-	fw_dump.dump_registered = 0;
-	return 0;
+	pr_debug("Registering for firmware-assisted kernel dump...\n");
+	return fw_dump.ops->register_fadump(&fw_dump);
 }
 
 static int fadump_invalidate_dump(const struct rtas_fadump_mem_struct *fdm)
@@ -1186,7 +1049,7 @@ void fadump_cleanup(void)
 		fadump_invalidate_dump(fdm_active);
 	} else if (fw_dump.dump_registered) {
 		/* Un-register Firmware-assisted dump if it was registered. */
-		fadump_unregister_dump(&fdm);
+		fw_dump.ops->unregister_fadump(&fw_dump);
 		free_crash_memory_ranges();
 	}
 }
@@ -1296,7 +1159,7 @@ static void fadump_invalidate_release_mem(void)
 		fw_dump.cpu_notes_buf_size = 0;
 	}
 	/* Initialize the kernel dump memory structure for FAD registration. */
-	init_fadump_mem_struct(&fdm, fw_dump.reserve_dump_area_start);
+	fw_dump.ops->init_fadump_mem_struct(&fw_dump);
 }
 
 static ssize_t fadump_release_memory_store(struct kobject *kobj,
@@ -1361,12 +1224,12 @@ static ssize_t fadump_register_store(struct kobject *kobj,
 			goto unlock_out;
 		}
 		/* Un-register Firmware-assisted dump */
-		fadump_unregister_dump(&fdm);
+		fw_dump.ops->unregister_fadump(&fw_dump);
 		break;
 	case 1:
 		if (fw_dump.dump_registered == 1) {
 			/* Un-register Firmware-assisted dump */
-			fadump_unregister_dump(&fdm);
+			fw_dump.ops->unregister_fadump(&fw_dump);
 		}
 		/* Register Firmware-assisted dump */
 		ret = register_fadump();
@@ -1393,7 +1256,8 @@ static int fadump_region_show(struct seq_file *m, void *private)
 		fdm_ptr = fdm_active;
 	else {
 		mutex_unlock(&fadump_mutex);
-		fdm_ptr = &fdm;
+		fw_dump.ops->fadump_region_show(&fw_dump, m);
+		return 0;
 	}
 
 	seq_printf(m,
@@ -1514,7 +1378,7 @@ int __init setup_fadump(void)
 	}
 	/* Initialize the kernel dump memory structure for FAD registration. */
 	else if (fw_dump.reserve_dump_area_size)
-		init_fadump_mem_struct(&fdm, fw_dump.reserve_dump_area_start);
+		fw_dump.ops->init_fadump_mem_struct(&fw_dump);
 	fadump_init_files();
 
 	return 1;
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index 9e7c9bf..790a37d 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -30,19 +30,152 @@
 #include "../../kernel/fadump-common.h"
 #include "rtas-fadump.h"
 
+static struct rtas_fadump_mem_struct fdm;
+
+static void rtas_fadump_update_config(struct fw_dump *fadump_conf,
+				      const struct rtas_fadump_mem_struct *fdm)
+{
+	fadump_conf->boot_mem_dest_addr =
+		be64_to_cpu(fdm->rmr_region.destination_address);
+
+	fadump_conf->fadumphdr_addr = (fadump_conf->boot_mem_dest_addr +
+				       fadump_conf->boot_memory_size);
+}
+
 static ulong rtas_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 {
-	return fadump_conf->reserve_dump_area_start;
+	ulong addr = fadump_conf->reserve_dump_area_start;
+
+	memset(&fdm, 0, sizeof(struct rtas_fadump_mem_struct));
+	addr = addr & PAGE_MASK;
+
+	fdm.header.dump_format_version = cpu_to_be32(0x00000001);
+	fdm.header.dump_num_sections = cpu_to_be16(3);
+	fdm.header.dump_status_flag = 0;
+	fdm.header.offset_first_dump_section =
+		cpu_to_be32((u32)offsetof(struct rtas_fadump_mem_struct,
+					  cpu_state_data));
+
+	/*
+	 * Fields for disk dump option.
+	 * We are not using disk dump option, hence set these fields to 0.
+	 */
+	fdm.header.dd_block_size = 0;
+	fdm.header.dd_block_offset = 0;
+	fdm.header.dd_num_blocks = 0;
+	fdm.header.dd_offset_disk_path = 0;
+
+	/* set 0 to disable an automatic dump-reboot. */
+	fdm.header.max_time_auto = 0;
+
+	/* Kernel dump sections */
+	/* cpu state data section. */
+	fdm.cpu_state_data.request_flag =
+		cpu_to_be32(RTAS_FADUMP_REQUEST_FLAG);
+	fdm.cpu_state_data.source_data_type =
+		cpu_to_be16(RTAS_FADUMP_CPU_STATE_DATA);
+	fdm.cpu_state_data.source_address = 0;
+	fdm.cpu_state_data.source_len =
+		cpu_to_be64(fadump_conf->cpu_state_data_size);
+	fdm.cpu_state_data.destination_address = cpu_to_be64(addr);
+	addr += fadump_conf->cpu_state_data_size;
+
+	/* hpte region section */
+	fdm.hpte_region.request_flag = cpu_to_be32(RTAS_FADUMP_REQUEST_FLAG);
+	fdm.hpte_region.source_data_type =
+		cpu_to_be16(RTAS_FADUMP_HPTE_REGION);
+	fdm.hpte_region.source_address = 0;
+	fdm.hpte_region.source_len =
+		cpu_to_be64(fadump_conf->hpte_region_size);
+	fdm.hpte_region.destination_address = cpu_to_be64(addr);
+	addr += fadump_conf->hpte_region_size;
+
+	/* RMA region section */
+	fdm.rmr_region.request_flag = cpu_to_be32(RTAS_FADUMP_REQUEST_FLAG);
+	fdm.rmr_region.source_data_type =
+		cpu_to_be16(RTAS_FADUMP_REAL_MODE_REGION);
+	fdm.rmr_region.source_address = cpu_to_be64(RMA_START);
+	fdm.rmr_region.source_len =
+		cpu_to_be64(fadump_conf->boot_memory_size);
+	fdm.rmr_region.destination_address = cpu_to_be64(addr);
+	addr += fadump_conf->boot_memory_size;
+
+	rtas_fadump_update_config(fadump_conf, &fdm);
+
+	return addr;
 }
 
 static int rtas_fadump_register_fadump(struct fw_dump *fadump_conf)
 {
-	return -EIO;
+	int rc, err = -EIO;
+	unsigned int wait_time;
+
+	/* TODO: Add upper time limit for the delay */
+	do {
+		rc =  rtas_call(fadump_conf->ibm_configure_kernel_dump, 3, 1,
+				NULL, FADUMP_REGISTER, &fdm,
+				sizeof(struct rtas_fadump_mem_struct));
+
+		wait_time = rtas_busy_delay_time(rc);
+		if (wait_time)
+			mdelay(wait_time);
+
+	} while (wait_time);
+
+	switch (rc) {
+	case 0:
+		pr_info("Registration is successful!\n");
+		fadump_conf->dump_registered = 1;
+		err = 0;
+		break;
+	case -1:
+		pr_err("Failed to register. Hardware Error(%d).\n", rc);
+		break;
+	case -3:
+		if (!is_fadump_boot_mem_contiguous(fadump_conf))
+			pr_err("Can't hot-remove boot memory area.\n");
+		else if (!is_fadump_reserved_mem_contiguous(fadump_conf))
+			pr_err("Can't hot-remove reserved memory area.\n");
+
+		pr_err("Failed to register. Parameter Error(%d).\n", rc);
+		err = -EINVAL;
+		break;
+	case -9:
+		pr_err("Already registered!\n");
+		fadump_conf->dump_registered = 1;
+		err = -EEXIST;
+		break;
+	default:
+		pr_err("Failed to register. Unknown Error(%d).\n", rc);
+		break;
+	}
+
+	return err;
 }
 
 static int rtas_fadump_unregister_fadump(struct fw_dump *fadump_conf)
 {
-	return -EIO;
+	int rc;
+	unsigned int wait_time;
+
+	/* TODO: Add upper time limit for the delay */
+	do {
+		rc =  rtas_call(fadump_conf->ibm_configure_kernel_dump, 3, 1,
+				NULL, FADUMP_UNREGISTER, &fdm,
+				sizeof(struct rtas_fadump_mem_struct));
+
+		wait_time = rtas_busy_delay_time(rc);
+		if (wait_time)
+			mdelay(wait_time);
+	} while (wait_time);
+
+	if (rc) {
+		pr_err("Failed to un-register - unexpected error(%d).\n", rc);
+		return -EIO;
+	}
+
+	fadump_conf->dump_registered = 0;
+	return 0;
 }
 
 static int rtas_fadump_invalidate_fadump(struct fw_dump *fadump_conf)
@@ -62,6 +195,30 @@ static int __init rtas_fadump_process_fadump(struct fw_dump *fadump_conf)
 static void rtas_fadump_region_show(struct fw_dump *fadump_conf,
 				    struct seq_file *m)
 {
+	const struct rtas_fadump_mem_struct *fdm_ptr = &fdm;
+	const struct rtas_fadump_section *cpu_data_section;
+
+	cpu_data_section = &(fdm_ptr->cpu_state_data);
+	seq_printf(m, "CPU :[%#016llx-%#016llx] %#llx bytes, Dumped: %#llx\n",
+		   be64_to_cpu(cpu_data_section->destination_address),
+		   be64_to_cpu(cpu_data_section->destination_address) +
+		   be64_to_cpu(cpu_data_section->source_len) - 1,
+		   be64_to_cpu(cpu_data_section->source_len),
+		   be64_to_cpu(cpu_data_section->bytes_dumped));
+
+	seq_printf(m, "HPTE:[%#016llx-%#016llx] %#llx bytes, Dumped: %#llx\n",
+		   be64_to_cpu(fdm_ptr->hpte_region.destination_address),
+		   be64_to_cpu(fdm_ptr->hpte_region.destination_address) +
+		   be64_to_cpu(fdm_ptr->hpte_region.source_len) - 1,
+		   be64_to_cpu(fdm_ptr->hpte_region.source_len),
+		   be64_to_cpu(fdm_ptr->hpte_region.bytes_dumped));
+
+	seq_printf(m, "DUMP: Src: %#016llx, Dest: %#016llx, ",
+		   be64_to_cpu(fdm_ptr->rmr_region.source_address),
+		   be64_to_cpu(fdm_ptr->rmr_region.destination_address));
+	seq_printf(m, "Size: %#llx, Dumped: %#llx bytes\n",
+		   be64_to_cpu(fdm_ptr->rmr_region.source_len),
+		   be64_to_cpu(fdm_ptr->rmr_region.bytes_dumped));
 }
 
 static void rtas_fadump_trigger(struct fadump_crash_info_header *fdh,

