Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C3D96053
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 15:41:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CX4T5sjyzDqKb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 23:40:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CV1R3fY1zDqYW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:08:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46CV1Q5rLJz8tFS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:08:10 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46CV1Q4PfBz9sBF; Tue, 20 Aug 2019 22:08:10 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46CV1Q00k5z9s3Z
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 22:08:09 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7KC7hGa005146
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:08:07 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ugefpww2e-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:08:07 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 20 Aug 2019 13:08:05 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 20 Aug 2019 13:08:02 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7KC80Ta14745642
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 12:08:00 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1E2511C04A;
 Tue, 20 Aug 2019 12:08:00 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D53E11C054;
 Tue, 20 Aug 2019 12:07:59 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Aug 2019 12:07:58 +0000 (GMT)
Subject: [PATCH v5 31/31] powernv/fadump: support holes in kernel boot
 memory area
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 20 Aug 2019 17:37:58 +0530
In-Reply-To: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19082012-0012-0000-0000-00000340AF1A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082012-0013-0000-0000-0000217AD2FD
Message-Id: <156630287840.8896.5230849753710260996.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200129
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
 arch/powerpc/kernel/fadump-common.c          |   15 ++
 arch/powerpc/kernel/fadump-common.h          |   12 ++
 arch/powerpc/kernel/fadump.c                 |  178 ++++++++++++++++++++++----
 arch/powerpc/platforms/powernv/opal-fadump.c |   56 ++++----
 arch/powerpc/platforms/powernv/opal-fadump.h |    5 -
 arch/powerpc/platforms/pseries/rtas-fadump.c |   14 ++
 arch/powerpc/platforms/pseries/rtas-fadump.h |    5 +
 7 files changed, 222 insertions(+), 63 deletions(-)

diff --git a/arch/powerpc/kernel/fadump-common.c b/arch/powerpc/kernel/fadump-common.c
index 7f39e4f..82862de 100644
--- a/arch/powerpc/kernel/fadump-common.c
+++ b/arch/powerpc/kernel/fadump-common.c
@@ -121,10 +121,19 @@ static int is_fadump_memory_area_contiguous(unsigned long d_start,
  */
 int is_fadump_boot_mem_contiguous(struct fw_dump *fadump_conf)
 {
-	unsigned long d_start = RMA_START;
-	unsigned long d_end   = RMA_START + fadump_conf->boot_memory_size;
+	int i, ret = 0;
+	unsigned long d_start, d_end;
 
-	return is_fadump_memory_area_contiguous(d_start, d_end);
+	for (i = 0; i < fadump_conf->boot_mem_regs_cnt; i++) {
+		d_start = fadump_conf->boot_mem_addr[i];
+		d_end   = d_start + fadump_conf->boot_mem_sz[i];
+
+		ret = is_fadump_memory_area_contiguous(d_start, d_end);
+		if (!ret)
+			break;
+	}
+
+	return ret;
 }
 
 /*
diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
index 55e4f25..8da8900 100644
--- a/arch/powerpc/kernel/fadump-common.h
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -12,6 +12,9 @@
 #ifndef __PPC64_FA_DUMP_INTERNAL_H__
 #define __PPC64_FA_DUMP_INTERNAL_H__
 
+/* Maximum number of memory regions kernel supports */
+#define FADUMP_MAX_MEM_REGS			128
+
 #ifndef CONFIG_PRESERVE_FA_DUMP
 /*
  * The RMA region will be saved for later dumping when kernel crashes.
@@ -106,12 +109,21 @@ struct fw_dump {
 	unsigned long	hpte_region_size;
 
 	unsigned long	boot_mem_dest_addr;
+	unsigned long	boot_mem_addr[FADUMP_MAX_MEM_REGS];
+	unsigned long	boot_mem_sz[FADUMP_MAX_MEM_REGS];
+	unsigned long	boot_mem_regs_cnt;
+	unsigned long	boot_mem_top;
 	unsigned long	boot_memory_size;
 
 	unsigned long	fadumphdr_addr;
 	unsigned long	cpu_notes_buf;
 	unsigned long	cpu_notes_buf_size;
 
+	/*
+	 * Maximum size supported by firmware to copy from source to
+	 * destination address per entry.
+	 */
+	unsigned long	max_copy_size;
 	u64		kernel_metadata;
 
 	int		ibm_configure_kernel_dump;
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4b168c4..4b1bb3c 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -129,6 +129,7 @@ int is_fadump_memory_area(u64 addr, ulong size)
 {
 	u64 d_start = fw_dump.reserve_dump_area_start;
 	u64 d_end = d_start + fw_dump.reserve_dump_area_size;
+	u64 b_end = fw_dump.boot_mem_top;
 
 	if (!fw_dump.dump_registered)
 		return 0;
@@ -136,7 +137,7 @@ int is_fadump_memory_area(u64 addr, ulong size)
 	if (((addr + size) > d_start) && (addr <= d_end))
 		return 1;
 
-	return (addr + size) > RMA_START && addr <= fw_dump.boot_memory_size;
+	return (((addr + size) > RMA_START) && (addr <= b_end));
 }
 
 int should_fadump_crash(void)
@@ -154,6 +155,8 @@ int is_fadump_active(void)
 /* Print firmware assisted dump configurations for debugging purpose. */
 static void fadump_show_config(void)
 {
+	int i;
+
 	pr_debug("Support for firmware-assisted dump (fadump): %s\n",
 			(fw_dump.fadump_supported ? "present" : "no support"));
 
@@ -167,7 +170,13 @@ static void fadump_show_config(void)
 	pr_debug("Dump section sizes:\n");
 	pr_debug("    CPU state data size: %lx\n", fw_dump.cpu_state_data_size);
 	pr_debug("    HPTE region size   : %lx\n", fw_dump.hpte_region_size);
-	pr_debug("Boot memory size  : %lx\n", fw_dump.boot_memory_size);
+	pr_debug("    Boot memory size   : %lx\n", fw_dump.boot_memory_size);
+	pr_debug("    Boot memory top    : %lx\n", fw_dump.boot_mem_top);
+	pr_debug("Boot meory regions count : %lx\n", fw_dump.boot_mem_regs_cnt);
+	for (i = 0; i < fw_dump.boot_mem_regs_cnt; i++) {
+		pr_debug("%d. base = %lx, size = %lx\n", (i+1),
+			 fw_dump.boot_mem_addr[i], fw_dump.boot_mem_sz[i]);
+	}
 }
 
 /**
@@ -266,6 +275,88 @@ static unsigned long get_fadump_area_size(void)
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
+	int ret = 1;
+	struct memblock_region *reg;
+	unsigned long base, size, cur_size, hole_size, last_end;
+	unsigned long mem_size = fw_dump.boot_memory_size;
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
+	fw_dump.boot_mem_top = fw_dump.boot_memory_size + hole_size;
+
+	return ret;
+}
+
 int __init fadump_reserve_mem(void)
 {
 	int ret = 1;
@@ -300,6 +391,11 @@ int __init fadump_reserve_mem(void)
 			       fw_dump.ops->fadump_get_bootmem_min());
 			goto error_out;
 		}
+
+		if (!fadump_get_boot_mem_regions()) {
+			pr_err("Too many holes in boot memory area to enable fadump\n");
+			goto error_out;
+		}
 	}
 
 	/*
@@ -323,7 +419,8 @@ int __init fadump_reserve_mem(void)
 	else
 		memory_boundary = memblock_end_of_DRAM();
 
-	base = fw_dump.boot_memory_size;
+	base = fw_dump.boot_mem_top;
+	base = PAGE_ALIGN(base);
 	size = get_fadump_area_size();
 	fw_dump.reserve_dump_area_size = size;
 	if (fw_dump.dump_active) {
@@ -625,37 +722,39 @@ static int fadump_init_elfcore_header(char *bufp)
 static int fadump_setup_crash_memory_ranges(void)
 {
 	struct memblock_region *reg;
-	unsigned long long start, end;
-	int ret;
+	unsigned long long start, end, offset;
+	int i, ret;
 
 	pr_debug("Setup crash memory ranges.\n");
 	crash_mrange_info.mem_range_cnt = 0;
+	offset = fw_dump.boot_mem_top;
 
 	/*
-	 * add the first memory chunk (RMA_START through boot_memory_size) as
-	 * a separate memory chunk. The reason is, at the time crash firmware
-	 * will move the content of this memory chunk to different location
-	 * specified during fadump registration. We need to create a separate
-	 * program header for this chunk with the correct offset.
+	 * Boot memory region(s) registered with firmware are moved to
+	 * a different location at the time of crash. Create separate program
+	 * header(s) for this memory chunk(s) with the correct offset.
 	 */
-	ret = fadump_add_mem_range(&crash_mrange_info,
-				   RMA_START, fw_dump.boot_memory_size);
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
 		start = (unsigned long long)reg->base;
 		end = start + (unsigned long long)reg->size;
 
 		/*
-		 * skip the first memory chunk that is already added (RMA_START
+		 * Skip the first memory chunk that is already added (RMA_START
 		 * through boot_memory_size). This logic needs a relook if and
 		 * when RMA_START changes to a non-zero value.
 		 */
 		BUILD_BUG_ON(RMA_START != 0);
-		if (start < fw_dump.boot_memory_size) {
-			if (end > fw_dump.boot_memory_size)
-				start = fw_dump.boot_memory_size;
+		if (start < offset) {
+			if (end > offset)
+				start = offset;
 			else
 				continue;
 		}
@@ -676,17 +775,35 @@ static int fadump_setup_crash_memory_ranges(void)
  */
 static inline unsigned long fadump_relocate(unsigned long paddr)
 {
-	if (paddr > RMA_START && paddr < fw_dump.boot_memory_size)
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
 	struct elfhdr *elf;
 	struct elf_phdr *phdr;
-	int i;
+	unsigned long long raddr, offset;
+	int i, j;
 
 	fadump_init_elfcore_header(bufp);
 	elf = (struct elfhdr *)bufp;
@@ -729,7 +846,9 @@ static int fadump_create_elfcore_headers(char *bufp)
 	(elf->e_phnum)++;
 
 	/* setup PT_LOAD sections. */
-
+	j = 0;
+	offset = 0;
+	raddr = fw_dump.boot_mem_addr[0];
 	for (i = 0; i < crash_mrange_info.mem_range_cnt; i++) {
 		unsigned long long mbase, msize;
 		mbase = crash_mrange_info.mem_ranges[i].base;
@@ -744,13 +863,17 @@ static int fadump_create_elfcore_headers(char *bufp)
 		phdr->p_flags	= PF_R|PF_W|PF_X;
 		phdr->p_offset	= mbase;
 
-		if (mbase == RMA_START) {
+		if (mbase == raddr) {
 			/*
 			 * The entire RMA region will be moved by firmware
 			 * to the specified destination_address. Hence set
 			 * the correct offset.
 			 */
-			phdr->p_offset = fw_dump.boot_mem_dest_addr;
+			phdr->p_offset = fw_dump.boot_mem_dest_addr + offset;
+			if (j < (fw_dump.boot_mem_regs_cnt - 1)) {
+				offset += fw_dump.boot_mem_sz[j];
+				raddr = fw_dump.boot_mem_addr[++j];
+			}
 		}
 
 		phdr->p_paddr = mbase;
@@ -1033,7 +1156,8 @@ static void fadump_invalidate_release_mem(void)
 	fadump_cleanup();
 	mutex_unlock(&fadump_mutex);
 
-	fadump_release_memory(fw_dump.boot_memory_size, memblock_end_of_DRAM());
+	fadump_release_memory(PAGE_ALIGN(fw_dump.boot_mem_top),
+			      memblock_end_of_DRAM());
 	if (fw_dump.cpu_notes_buf) {
 		fadump_cpu_notes_buf_free(
 				(unsigned long)__va(fw_dump.cpu_notes_buf),
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index 50cf9e6..593da18 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -120,19 +120,29 @@ static void opal_fadump_update_config(struct fw_dump *fadump_conf,
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
+		pr_debug("\t%d. base: 0x%lx, size: 0x%lx\n",
+			 (i + 1), base, size);
 
-		fadump_conf->boot_memory_size += fdm->rgn[i].size;
+		fadump_conf->boot_mem_addr[i] = base;
+		fadump_conf->boot_mem_sz[i] = size;
+		fadump_conf->boot_memory_size += size;
+		hole_size += (base - last_end);
+
+		last_end = base + size;
 	}
 
 	/*
@@ -165,6 +175,8 @@ static void opal_fadump_get_config(struct fw_dump *fadump_conf,
 		pr_warn("  But the sanity of the '/proc/vmcore' file depends on whether the above region(s) have any kernel pages or not.\n");
 	}
 
+	fadump_conf->boot_mem_top = (fadump_conf->boot_memory_size + hole_size);
+	fadump_conf->boot_mem_regs_cnt = fdm->region_cnt;
 	opal_fadump_update_config(fadump_conf, fdm);
 }
 
@@ -179,34 +191,20 @@ static void opal_fadump_init_metadata(struct opal_fadump_mem_struct *fdm)
 
 static ulong opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 {
-	ulong src_addr, dest_addr;
-	int max_copy_size, cur_size, size;
+	ulong addr = fadump_conf->reserve_dump_area_start;
+	int i;
 
 	opal_fdm = __va(fadump_conf->kernel_metadata);
 	opal_fadump_init_metadata(opal_fdm);
 
-	/*
-	 * Firmware currently supports only 32-bit value for size,
-	 * align it to pagesize and request firmware to copy multiple
-	 * kernel boot memory regions.
-	 */
-	max_copy_size = _ALIGN_DOWN(U32_MAX, PAGE_SIZE);
-
 	/* Boot memory regions */
-	src_addr = RMA_START;
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
@@ -218,7 +216,7 @@ static ulong opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 
 	opal_fadump_update_config(fadump_conf, opal_fdm);
 
-	return dest_addr;
+	return addr;
 }
 
 static ulong opal_fadump_get_metadata_size(void)
@@ -263,7 +261,7 @@ static int opal_fadump_setup_metadata(struct fw_dump *fadump_conf)
 	 * by a kernel that intends to preserve crash'ed kernel's memory.
 	 */
 	ret = opal_mpipl_register_tag(OPAL_MPIPL_TAG_BOOT_MEM,
-				      fadump_conf->boot_memory_size);
+				      fadump_conf->boot_mem_top);
 	if (ret != OPAL_SUCCESS) {
 		pr_err("Failed to set boot memory tag!\n");
 		err = -EPERM;
@@ -649,6 +647,12 @@ int __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
 	fadump_conf->fadump_supported	= 1;
 
 	/*
+	 * Firmware currently supports only 32-bit value for size,
+	 * align it to pagesize.
+	 */
+	fadump_conf->max_copy_size = _ALIGN_DOWN(U32_MAX, PAGE_SIZE);
+
+	/*
 	 * Check if dump has been initiated on last reboot.
 	 */
 	prop = of_get_flat_dt_prop(dn, "mpipl-boot", NULL);
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.h b/arch/powerpc/platforms/powernv/opal-fadump.h
index ae71a16..3b0c4fb 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.h
+++ b/arch/powerpc/platforms/powernv/opal-fadump.h
@@ -21,9 +21,6 @@
 /* OPAL FADump structure format version */
 #define OPAL_FADUMP_VERSION			0x1
 
-/* Maximum number of memory regions kernel supports */
-#define OPAL_FADUMP_MAX_MEM_REGS		128
-
 /*
  * FADump memory structure for storing kernel metadata needed to
  * register-for/process crash dump. The address of this structure will
@@ -36,7 +33,7 @@ struct opal_fadump_mem_struct {
 	u16	region_cnt;		/* number of regions */
 	u16	registered_regions;	/* Regions registered for MPIPL */
 	u64	fadumphdr_addr;
-	struct opal_mpipl_region	rgn[OPAL_FADUMP_MAX_MEM_REGS];
+	struct opal_mpipl_region	rgn[FADUMP_MAX_MEM_REGS];
 } __attribute__((packed));
 
 /*
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index 7dee6d0..5ea8360 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -46,7 +46,13 @@ static void rtas_fadump_update_config(struct fw_dump *fadump_conf,
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
@@ -111,8 +117,7 @@ static ulong rtas_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 	fdm.rmr_region.source_data_type =
 		cpu_to_be16(RTAS_FADUMP_REAL_MODE_REGION);
 	fdm.rmr_region.source_address = cpu_to_be64(RMA_START);
-	fdm.rmr_region.source_len =
-		cpu_to_be64(fadump_conf->boot_memory_size);
+	fdm.rmr_region.source_len = cpu_to_be64(fadump_conf->boot_memory_size);
 	fdm.rmr_region.destination_address = cpu_to_be64(addr);
 	addr += fadump_conf->boot_memory_size;
 
@@ -541,6 +546,9 @@ int __init rtas_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
 	fadump_conf->ops		= &rtas_fadump_ops;
 	fadump_conf->fadump_supported	= 1;
 
+	/* Firmware supports 64-bit value for size, align it to pagesize. */
+	fadump_conf->max_copy_size = _ALIGN_DOWN(U64_MAX, PAGE_SIZE);
+
 	/*
 	 * The 'ibm,kernel-dump' rtas node is present only if there is
 	 * dump data waiting for us.
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.h b/arch/powerpc/platforms/pseries/rtas-fadump.h
index feaeb75..fad87b3 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.h
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.h
@@ -72,6 +72,11 @@ struct rtas_fadump_mem_struct {
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
 

