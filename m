Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E082BB01A3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 18:27:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T6kt44LnzF3m1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 02:27:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4l51cg4zF3DY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:57:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4l45mBgz8sjs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:57:52 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4l44Y9Cz9sDB; Thu, 12 Sep 2019 00:57:52 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46T4l40SRsz9s4Y
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:57:51 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEgeq5103177
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:57:49 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uy1y032ws-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:57:49 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:57:47 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:57:44 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEvg7q44498952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:57:42 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9690942045;
 Wed, 11 Sep 2019 14:57:42 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FB074203F;
 Wed, 11 Sep 2019 14:57:40 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:57:40 +0000 (GMT)
Subject: [PATCH v6 36/36] powernv/fadump: support holes in kernel boot
 memory area
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:27:39 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0020-0000-0000-0000036B0E55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0021-0000-0000-000021C09B9A
Message-Id: <156821385448.5656.6124791213910877759.stgit@hbathini.in.ibm.com>
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

With support to copy multiple kernel boot memory regions owing to copy
size limitation, also handle holes in the memory area to be preserved.
Support as many as 128 kernel boot memory regions. This allows having
an adequate FADump capture kernel size for different scenarios.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

* No major changes in v6.


 arch/powerpc/include/asm/fadump-internal.h   |   12 ++
 arch/powerpc/kernel/fadump.c                 |  191 ++++++++++++++++++++++----
 arch/powerpc/platforms/powernv/opal-fadump.c |   54 ++++---
 arch/powerpc/platforms/powernv/opal-fadump.h |    5 -
 arch/powerpc/platforms/pseries/rtas-fadump.c |   11 +
 arch/powerpc/platforms/pseries/rtas-fadump.h |    5 +
 6 files changed, 219 insertions(+), 59 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index aec1515..c814a2b 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -9,6 +9,9 @@
 #ifndef _ASM_POWERPC_FADUMP_INTERNAL_H
 #define _ASM_POWERPC_FADUMP_INTERNAL_H
 
+/* Maximum number of memory regions kernel supports */
+#define FADUMP_MAX_MEM_REGS			128
+
 #ifndef CONFIG_PRESERVE_FA_DUMP
 
 /* The upper limit percentage for user specified boot memory size (25%) */
@@ -88,11 +91,20 @@ struct fw_dump {
 
 	unsigned long	boot_memory_size;
 	u64		boot_mem_dest_addr;
+	u64		boot_mem_addr[FADUMP_MAX_MEM_REGS];
+	u64		boot_mem_sz[FADUMP_MAX_MEM_REGS];
+	u64		boot_mem_top;
+	u64		boot_mem_regs_cnt;
 
 	unsigned long	fadumphdr_addr;
 	unsigned long	cpu_notes_buf_vaddr;
 	unsigned long	cpu_notes_buf_size;
 
+	/*
+	 * Maximum size supported by firmware to copy from source to
+	 * destination address per entry.
+	 */
+	u64		max_copy_size;
 	u64		kernel_metadata;
 
 	int		ibm_configure_kernel_dump;
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 2e13925..ed59855 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -143,7 +143,7 @@ int is_fadump_memory_area(u64 addr, unsigned long size)
 	if (((addr + size) > d_start) && (addr <= d_end))
 		return 1;
 
-	return (addr <= fw_dump.boot_memory_size);
+	return (addr <= fw_dump.boot_mem_top);
 }
 
 int should_fadump_crash(void)
@@ -194,7 +194,20 @@ static bool is_fadump_mem_area_contiguous(u64 d_start, u64 d_end)
  */
 bool is_fadump_boot_mem_contiguous(void)
 {
-	return is_fadump_mem_area_contiguous(0, fw_dump.boot_memory_size);
+	unsigned long d_start, d_end;
+	bool ret = false;
+	int i;
+
+	for (i = 0; i < fw_dump.boot_mem_regs_cnt; i++) {
+		d_start = fw_dump.boot_mem_addr[i];
+		d_end   = d_start + fw_dump.boot_mem_sz[i];
+
+		ret = is_fadump_mem_area_contiguous(d_start, d_end);
+		if (!ret)
+			break;
+	}
+
+	return ret;
 }
 
 /*
@@ -213,6 +226,8 @@ bool is_fadump_reserved_mem_contiguous(void)
 /* Print firmware assisted dump configurations for debugging purpose. */
 static void fadump_show_config(void)
 {
+	int i;
+
 	pr_debug("Support for firmware-assisted dump (fadump): %s\n",
 			(fw_dump.fadump_supported ? "present" : "no support"));
 
@@ -226,7 +241,13 @@ static void fadump_show_config(void)
 	pr_debug("Dump section sizes:\n");
 	pr_debug("    CPU state data size: %lx\n", fw_dump.cpu_state_data_size);
 	pr_debug("    HPTE region size   : %lx\n", fw_dump.hpte_region_size);
-	pr_debug("Boot memory size  : %lx\n", fw_dump.boot_memory_size);
+	pr_debug("    Boot memory size   : %lx\n", fw_dump.boot_memory_size);
+	pr_debug("    Boot memory top    : %llx\n", fw_dump.boot_mem_top);
+	pr_debug("Boot memory regions cnt: %llx\n", fw_dump.boot_mem_regs_cnt);
+	for (i = 0; i < fw_dump.boot_mem_regs_cnt; i++) {
+		pr_debug("[%03d] base = %llx, size = %llx\n", i,
+			 fw_dump.boot_mem_addr[i], fw_dump.boot_mem_sz[i]);
+	}
 }
 
 /**
@@ -326,6 +347,88 @@ static unsigned long get_fadump_area_size(void)
 	return size;
 }
 
+static int __init add_boot_mem_region(unsigned long rstart,
+				      unsigned long rsize)
+{
+	int i = fw_dump.boot_mem_regs_cnt++;
+
+	if (fw_dump.boot_mem_regs_cnt > FADUMP_MAX_MEM_REGS) {
+		fw_dump.boot_mem_regs_cnt = FADUMP_MAX_MEM_REGS;
+		return 0;
+	}
+
+	pr_debug("Added boot memory range[%d] [%#016lx-%#016lx)\n",
+		 i, rstart, (rstart + rsize));
+	fw_dump.boot_mem_addr[i] = rstart;
+	fw_dump.boot_mem_sz[i] = rsize;
+	return 1;
+}
+
+/*
+ * Firmware usually has a hard limit on the data it can copy per region.
+ * Honour that by splitting a memory range into multiple regions.
+ */
+static int __init add_boot_mem_regions(unsigned long mstart,
+				       unsigned long msize)
+{
+	unsigned long rstart, rsize, max_size;
+	int ret = 1;
+
+	rstart = mstart;
+	max_size = fw_dump.max_copy_size ? fw_dump.max_copy_size : msize;
+	while (msize) {
+		if (msize > max_size)
+			rsize = max_size;
+		else
+			rsize = msize;
+
+		ret = add_boot_mem_region(rstart, rsize);
+		if (!ret)
+			break;
+
+		msize -= rsize;
+		rstart += rsize;
+	}
+
+	return ret;
+}
+
+static int __init fadump_get_boot_mem_regions(void)
+{
+	unsigned long base, size, cur_size, hole_size, last_end;
+	unsigned long mem_size = fw_dump.boot_memory_size;
+	struct memblock_region *reg;
+	int ret = 1;
+
+	fw_dump.boot_mem_regs_cnt = 0;
+
+	last_end = 0;
+	hole_size = 0;
+	cur_size = 0;
+	for_each_memblock(memory, reg) {
+		base = reg->base;
+		size = reg->size;
+		hole_size += (base - last_end);
+
+		if ((cur_size + size) >= mem_size) {
+			size = (mem_size - cur_size);
+			ret = add_boot_mem_regions(base, size);
+			break;
+		}
+
+		mem_size -= size;
+		cur_size += size;
+		ret = add_boot_mem_regions(base, size);
+		if (!ret)
+			break;
+
+		last_end = base + size;
+	}
+	fw_dump.boot_mem_top = PAGE_ALIGN(fw_dump.boot_memory_size + hole_size);
+
+	return ret;
+}
+
 int __init fadump_reserve_mem(void)
 {
 	u64 base, size, mem_boundary, bootmem_min, align = PAGE_SIZE;
@@ -362,6 +465,11 @@ int __init fadump_reserve_mem(void)
 			       fw_dump.boot_memory_size, bootmem_min);
 			goto error_out;
 		}
+
+		if (!fadump_get_boot_mem_regions()) {
+			pr_err("Too many holes in boot memory area to enable fadump\n");
+			goto error_out;
+		}
 	}
 
 	/*
@@ -385,7 +493,7 @@ int __init fadump_reserve_mem(void)
 	else
 		mem_boundary = memblock_end_of_DRAM();
 
-	base = fw_dump.boot_memory_size;
+	base = fw_dump.boot_mem_top;
 	size = get_fadump_area_size();
 	fw_dump.reserve_dump_area_size = size;
 	if (fw_dump.dump_active) {
@@ -769,34 +877,35 @@ static int fadump_setup_crash_memory_ranges(void)
 {
 	struct memblock_region *reg;
 	u64 start, end;
-	int ret;
+	int i, ret;
 
 	pr_debug("Setup crash memory ranges.\n");
 	crash_mrange_info.mem_range_cnt = 0;
 
 	/*
-	 * add the first memory chunk (0 through boot_memory_size) as
-	 * a separate memory chunk. The reason is, at the time crash firmware
-	 * will move the content of this memory chunk to different location
-	 * specified during fadump registration. We need to create a separate
-	 * program header for this chunk with the correct offset.
+	 * Boot memory region(s) registered with firmware are moved to
+	 * different location at the time of crash. Create separate program
+	 * header(s) for this memory chunk(s) with the correct offset.
 	 */
-	ret = fadump_add_mem_range(&crash_mrange_info,
-				   0, fw_dump.boot_memory_size);
-	if (ret)
-		return ret;
+	for (i = 0; i < fw_dump.boot_mem_regs_cnt; i++) {
+		start = fw_dump.boot_mem_addr[i];
+		end = start + fw_dump.boot_mem_sz[i];
+		ret = fadump_add_mem_range(&crash_mrange_info, start, end);
+		if (ret)
+			return ret;
+	}
 
 	for_each_memblock(memory, reg) {
 		start = (u64)reg->base;
 		end = start + (u64)reg->size;
 
 		/*
-		 * skip the first memory chunk that is already added
-		 * (0 through boot_memory_size).
+		 * skip the memory chunk that is already added
+		 * (0 through boot_memory_top).
 		 */
-		if (start < fw_dump.boot_memory_size) {
-			if (end > fw_dump.boot_memory_size)
-				start = fw_dump.boot_memory_size;
+		if (start < fw_dump.boot_mem_top) {
+			if (end > fw_dump.boot_mem_top)
+				start = fw_dump.boot_mem_top;
 			else
 				continue;
 		}
@@ -817,17 +926,35 @@ static int fadump_setup_crash_memory_ranges(void)
  */
 static inline unsigned long fadump_relocate(unsigned long paddr)
 {
-	if ((paddr > 0) && (paddr < fw_dump.boot_memory_size))
-		return fw_dump.boot_mem_dest_addr + paddr;
-	else
-		return paddr;
+	unsigned long raddr, rstart, rend, rlast, hole_size;
+	int i;
+
+	hole_size = 0;
+	rlast = 0;
+	raddr = paddr;
+	for (i = 0; i < fw_dump.boot_mem_regs_cnt; i++) {
+		rstart = fw_dump.boot_mem_addr[i];
+		rend = rstart + fw_dump.boot_mem_sz[i];
+		hole_size += (rstart - rlast);
+
+		if (paddr >= rstart && paddr < rend) {
+			raddr += fw_dump.boot_mem_dest_addr - hole_size;
+			break;
+		}
+
+		rlast = rend;
+	}
+
+	pr_debug("vmcoreinfo: paddr = 0x%lx, raddr = 0x%lx\n", paddr, raddr);
+	return raddr;
 }
 
 static int fadump_create_elfcore_headers(char *bufp)
 {
-	struct elfhdr *elf;
+	unsigned long long raddr, offset;
 	struct elf_phdr *phdr;
-	int i;
+	struct elfhdr *elf;
+	int i, j;
 
 	fadump_init_elfcore_header(bufp);
 	elf = (struct elfhdr *)bufp;
@@ -870,7 +997,9 @@ static int fadump_create_elfcore_headers(char *bufp)
 	(elf->e_phnum)++;
 
 	/* setup PT_LOAD sections. */
-
+	j = 0;
+	offset = 0;
+	raddr = fw_dump.boot_mem_addr[0];
 	for (i = 0; i < crash_mrange_info.mem_range_cnt; i++) {
 		u64 mbase, msize;
 
@@ -885,13 +1014,17 @@ static int fadump_create_elfcore_headers(char *bufp)
 		phdr->p_flags	= PF_R|PF_W|PF_X;
 		phdr->p_offset	= mbase;
 
-		if (mbase == 0) {
+		if (mbase == raddr) {
 			/*
 			 * The entire real memory region will be moved by
 			 * firmware to the specified destination_address.
 			 * Hence set the correct offset.
 			 */
-			phdr->p_offset = fw_dump.boot_mem_dest_addr;
+			phdr->p_offset = fw_dump.boot_mem_dest_addr + offset;
+			if (j < (fw_dump.boot_mem_regs_cnt - 1)) {
+				offset += fw_dump.boot_mem_sz[j];
+				raddr = fw_dump.boot_mem_addr[++j];
+			}
 		}
 
 		phdr->p_paddr = mbase;
@@ -1177,7 +1310,7 @@ static void fadump_invalidate_release_mem(void)
 	fadump_cleanup();
 	mutex_unlock(&fadump_mutex);
 
-	fadump_release_memory(fw_dump.boot_memory_size, memblock_end_of_DRAM());
+	fadump_release_memory(fw_dump.boot_mem_top, memblock_end_of_DRAM());
 	fadump_free_cpu_notes_buf();
 
 	/*
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index 006648e..d361d37 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -115,19 +115,28 @@ static void opal_fadump_update_config(struct fw_dump *fadump_conf,
 static void opal_fadump_get_config(struct fw_dump *fadump_conf,
 				   const struct opal_fadump_mem_struct *fdm)
 {
+	unsigned long base, size, last_end, hole_size;
 	int i;
 
 	if (!fadump_conf->dump_active)
 		return;
 
+	last_end = 0;
+	hole_size = 0;
 	fadump_conf->boot_memory_size = 0;
 
 	pr_debug("Boot memory regions:\n");
 	for (i = 0; i < fdm->region_cnt; i++) {
-		pr_debug("\t%d. base: 0x%llx, size: 0x%llx\n",
-			 (i + 1), fdm->rgn[i].src, fdm->rgn[i].size);
+		base = fdm->rgn[i].src;
+		size = fdm->rgn[i].size;
+		pr_debug("\t[%03d] base: 0x%lx, size: 0x%lx\n", i, base, size);
 
-		fadump_conf->boot_memory_size += fdm->rgn[i].size;
+		fadump_conf->boot_mem_addr[i] = base;
+		fadump_conf->boot_mem_sz[i] = size;
+		fadump_conf->boot_memory_size += size;
+		hole_size += (base - last_end);
+
+		last_end = base + size;
 	}
 
 	/*
@@ -160,6 +169,8 @@ static void opal_fadump_get_config(struct fw_dump *fadump_conf,
 		pr_warn("WARNING: If the unsaved regions contain kernel pages, the vmcore will be corrupted.\n");
 	}
 
+	fadump_conf->boot_mem_top = (fadump_conf->boot_memory_size + hole_size);
+	fadump_conf->boot_mem_regs_cnt = fdm->region_cnt;
 	opal_fadump_update_config(fadump_conf, fdm);
 }
 
@@ -174,33 +185,20 @@ static void opal_fadump_init_metadata(struct opal_fadump_mem_struct *fdm)
 
 static u64 opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 {
-	int max_copy_size, cur_size, size;
-	u64 src_addr, dest_addr;
+	u64 addr = fadump_conf->reserve_dump_area_start;
+	int i;
 
 	opal_fdm = __va(fadump_conf->kernel_metadata);
 	opal_fadump_init_metadata(opal_fdm);
 
-	/*
-	 * Firmware supports 32-bit field for size. Align it to PAGE_SIZE
-	 * and request firmware to copy multiple kernel boot memory regions.
-	 */
-	max_copy_size = _ALIGN_DOWN(U32_MAX, PAGE_SIZE);
-
 	/* Boot memory regions */
-	src_addr = 0;
-	dest_addr = fadump_conf->reserve_dump_area_start;
-	size = fadump_conf->boot_memory_size;
-	while (size) {
-		cur_size = size > max_copy_size ? max_copy_size : size;
-
-		opal_fdm->rgn[opal_fdm->region_cnt].src  = src_addr;
-		opal_fdm->rgn[opal_fdm->region_cnt].dest = dest_addr;
-		opal_fdm->rgn[opal_fdm->region_cnt].size = cur_size;
+	for (i = 0; i < fadump_conf->boot_mem_regs_cnt; i++) {
+		opal_fdm->rgn[i].src	= fadump_conf->boot_mem_addr[i];
+		opal_fdm->rgn[i].dest	= addr;
+		opal_fdm->rgn[i].size	= fadump_conf->boot_mem_sz[i];
 
 		opal_fdm->region_cnt++;
-		dest_addr	+= cur_size;
-		src_addr	+= cur_size;
-		size		-= cur_size;
+		addr += fadump_conf->boot_mem_sz[i];
 	}
 
 	/*
@@ -212,7 +210,7 @@ static u64 opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 
 	opal_fadump_update_config(fadump_conf, opal_fdm);
 
-	return dest_addr;
+	return addr;
 }
 
 static u64 opal_fadump_get_metadata_size(void)
@@ -254,7 +252,7 @@ static int opal_fadump_setup_metadata(struct fw_dump *fadump_conf)
 	 * by a kernel that intends to preserve crash'ed kernel's memory.
 	 */
 	ret = opal_mpipl_register_tag(OPAL_MPIPL_TAG_BOOT_MEM,
-				      fadump_conf->boot_memory_size);
+				      fadump_conf->boot_mem_top);
 	if (ret != OPAL_SUCCESS) {
 		pr_err("Failed to set boot memory tag!\n");
 		err = -EPERM;
@@ -670,6 +668,12 @@ void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
 	fadump_conf->fadump_supported	= 1;
 
 	/*
+	 * Firmware supports 32-bit field for size. Align it to PAGE_SIZE
+	 * and request firmware to copy multiple kernel boot memory regions.
+	 */
+	fadump_conf->max_copy_size = _ALIGN_DOWN(U32_MAX, PAGE_SIZE);
+
+	/*
 	 * Check if dump has been initiated on last reboot.
 	 */
 	prop = of_get_flat_dt_prop(dn, "mpipl-boot", NULL);
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.h b/arch/powerpc/platforms/powernv/opal-fadump.h
index e630cb0..f1e9ecf 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.h
+++ b/arch/powerpc/platforms/powernv/opal-fadump.h
@@ -27,9 +27,6 @@
  */
 #define OPAL_FADUMP_VERSION			0x1
 
-/* Maximum number of memory regions kernel supports */
-#define OPAL_FADUMP_MAX_MEM_REGS		128
-
 /*
  * OPAL FADump kernel metadata
  *
@@ -42,7 +39,7 @@ struct opal_fadump_mem_struct {
 	u16	region_cnt;		/* number of regions */
 	u16	registered_regions;	/* Regions registered for MPIPL */
 	u64	fadumphdr_addr;
-	struct opal_mpipl_region	rgn[OPAL_FADUMP_MAX_MEM_REGS];
+	struct opal_mpipl_region	rgn[FADUMP_MAX_MEM_REGS];
 } __packed;
 
 /*
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index a525180..70c3013 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -42,7 +42,13 @@ static void rtas_fadump_update_config(struct fw_dump *fadump_conf,
 static void rtas_fadump_get_config(struct fw_dump *fadump_conf,
 				   const struct rtas_fadump_mem_struct *fdm)
 {
-	fadump_conf->boot_memory_size = be64_to_cpu(fdm->rmr_region.source_len);
+	fadump_conf->boot_mem_addr[0] =
+		be64_to_cpu(fdm->rmr_region.source_address);
+	fadump_conf->boot_mem_sz[0] = be64_to_cpu(fdm->rmr_region.source_len);
+	fadump_conf->boot_memory_size = fadump_conf->boot_mem_sz[0];
+
+	fadump_conf->boot_mem_top = fadump_conf->boot_memory_size;
+	fadump_conf->boot_mem_regs_cnt = 1;
 
 	/*
 	 * Start address of reserve dump area (permanent reservation) for
@@ -499,6 +505,9 @@ void __init rtas_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
 	fadump_conf->ops		= &rtas_fadump_ops;
 	fadump_conf->fadump_supported	= 1;
 
+	/* Firmware supports 64-bit value for size, align it to pagesize. */
+	fadump_conf->max_copy_size = _ALIGN_DOWN(U64_MAX, PAGE_SIZE);
+
 	/*
 	 * The 'ibm,kernel-dump' rtas node is present only if there is
 	 * dump data waiting for us.
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.h b/arch/powerpc/platforms/pseries/rtas-fadump.h
index 6602ff6..fd59bd7 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.h
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.h
@@ -69,6 +69,11 @@ struct rtas_fadump_mem_struct {
 	/* Kernel dump sections */
 	struct rtas_fadump_section		cpu_state_data;
 	struct rtas_fadump_section		hpte_region;
+
+	/*
+	 * TODO: Extend multiple boot memory regions support in the kernel
+	 *       for this platform.
+	 */
 	struct rtas_fadump_section		rmr_region;
 };
 

