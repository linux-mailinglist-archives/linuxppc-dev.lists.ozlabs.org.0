Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4316A7CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 13:58:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nzRt50bDzDqYM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 21:58:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nyvp30PbzDq61
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:33:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45nyvp00wsz8t9P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:33:42 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45nyvn6Wvrz9sN4; Tue, 16 Jul 2019 21:33:41 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45nyvn2dBgz9s8m
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 21:33:41 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GBMai6080283
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:33:39 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tsbp5dfjw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:33:39 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 16 Jul 2019 12:33:37 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 12:33:34 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6GBXXcg59637824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 11:33:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1281211C04A;
 Tue, 16 Jul 2019 11:33:33 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AB4711C050;
 Tue, 16 Jul 2019 11:33:31 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 11:33:31 +0000 (GMT)
Subject: [PATCH v4 13/25] powernv/fadump: support copying multiple kernel
 memory regions
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 16 Jul 2019 17:03:30 +0530
In-Reply-To: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19071611-4275-0000-0000-0000034D6AD1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071611-4276-0000-0000-0000385D7C92
Message-Id: <156327681058.27462.16887222537196117647.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
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

Firmware uses 32-bit field for region size while copying/backing-up
memory during MPIPL. So, the maximum copy size for a region would
be a page less than 4GB (aligned to pagesize) but FADump capture
kernel usually needs more memory than that to be preserved to avoid
running into out of memory errors.

So, request firmware to copy multiple kernel memory regions instead
of just one (which worked fine for pseries as 64-bit field was used
for size there). With support to copy multiple kernel memory regions,
also handle holes in the memory area to be preserved. Support as many
as 128 kernel memory regions. This allows having an adequate FADump
capture kernel size for different scenarios.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/fadump-common.c          |   15 ++
 arch/powerpc/kernel/fadump-common.h          |   16 ++
 arch/powerpc/kernel/fadump.c                 |  173 ++++++++++++++++++++++----
 arch/powerpc/platforms/powernv/opal-fadump.c |   25 +++-
 arch/powerpc/platforms/powernv/opal-fadump.h |    5 -
 arch/powerpc/platforms/pseries/rtas-fadump.c |   12 ++
 arch/powerpc/platforms/pseries/rtas-fadump.h |    5 +
 7 files changed, 211 insertions(+), 40 deletions(-)

diff --git a/arch/powerpc/kernel/fadump-common.c b/arch/powerpc/kernel/fadump-common.c
index 76c1233..731b929 100644
--- a/arch/powerpc/kernel/fadump-common.c
+++ b/arch/powerpc/kernel/fadump-common.c
@@ -125,10 +125,19 @@ static int is_fadump_memory_area_contiguous(unsigned long d_start,
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
+		d_end   = d_start + fadump_conf->boot_mem_size[i];
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
index 89b8916..06d9ecf 100644
--- a/arch/powerpc/kernel/fadump-common.h
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -94,6 +94,9 @@ struct fad_crash_memory_ranges {
 /* Platform specific callback functions */
 struct fadump_ops;
 
+/* Maximum number of memory regions kernel supports */
+#define FADUMP_MAX_MEM_REGS			128
+
 /* Firmware-assisted dump configuration details. */
 struct fw_dump {
 	unsigned long	reserve_dump_area_start;
@@ -109,14 +112,23 @@ struct fw_dump {
 
 	unsigned long	cpu_state_data_size;
 	unsigned long	hpte_region_size;
+
 	unsigned long	boot_memory_size;
+	unsigned long	boot_mem_dest_addr;
+	unsigned long	boot_mem_regs_cnt;
+	unsigned long	boot_mem_addr[FADUMP_MAX_MEM_REGS];
+	unsigned long	boot_mem_size[FADUMP_MAX_MEM_REGS];
+	unsigned long	boot_mem_top;
 
 	unsigned long	fadumphdr_addr;
 	unsigned long	cpu_notes_buf;
 	unsigned long	cpu_notes_buf_size;
 
-	unsigned long	boot_mem_dest_addr;
-
+	/*
+	 * Maximum size supported by firmware to copy from source to
+	 * destination address per entry.
+	 */
+	unsigned long	max_copy_size;
 	u64		kernel_metadata;
 
 	int		ibm_configure_kernel_dump;
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4dd8037..abf4f334 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -128,6 +128,7 @@ int is_fadump_memory_area(u64 addr, ulong size)
 {
 	u64 d_start = fw_dump.reserve_dump_area_start;
 	u64 d_end = d_start + fw_dump.reserve_dump_area_size;
+	u64 b_end = fw_dump.boot_mem_top;
 
 	if (!fw_dump.dump_registered)
 		return 0;
@@ -135,7 +136,7 @@ int is_fadump_memory_area(u64 addr, ulong size)
 	if (((addr + size) > d_start) && (addr <= d_end))
 		return 1;
 
-	return (addr + size) > RMA_START && addr <= fw_dump.boot_memory_size;
+	return (((addr + size) > RMA_START) && (addr <= b_end));
 }
 
 int should_fadump_crash(void)
@@ -153,6 +154,8 @@ int is_fadump_active(void)
 /* Print firmware assisted dump configurations for debugging purpose. */
 static void fadump_show_config(void)
 {
+	int i;
+
 	pr_debug("Support for firmware-assisted dump (fadump): %s\n",
 			(fw_dump.fadump_supported ? "present" : "no support"));
 
@@ -166,7 +169,13 @@ static void fadump_show_config(void)
 	pr_debug("Dump section sizes:\n");
 	pr_debug("    CPU state data size: %lx\n", fw_dump.cpu_state_data_size);
 	pr_debug("    HPTE region size   : %lx\n", fw_dump.hpte_region_size);
-	pr_debug("Boot memory size  : %lx\n", fw_dump.boot_memory_size);
+	pr_debug("    Boot memory size   : %lx\n", fw_dump.boot_memory_size);
+	pr_debug("    Boot memory top    : %lx\n", fw_dump.boot_mem_top);
+	pr_debug("Boot meory regions count : %lx\n", fw_dump.boot_mem_regs_cnt);
+	for (i = 0; i < fw_dump.boot_mem_regs_cnt; i++) {
+		pr_debug("%d. base = %lx, size = %lx\n", (i+1),
+			 fw_dump.boot_mem_addr[i], fw_dump.boot_mem_size[i]);
+	}
 }
 
 /**
@@ -264,6 +273,88 @@ static unsigned long get_fadump_area_size(void)
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
+	fw_dump.boot_mem_size[i] = rsize;
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
 static void __init fadump_reserve_crash_area(unsigned long base,
 					     unsigned long size)
 {
@@ -310,6 +401,10 @@ int __init fadump_reserve_mem(void)
 				ALIGN(fw_dump.boot_memory_size,
 							FADUMP_CMA_ALIGNMENT);
 #endif
+		if (!fadump_get_boot_mem_regions()) {
+			pr_err("Too many holes in boot memory area to enable fadump\n");
+			goto error_out;
+		}
 	}
 
 	size = get_fadump_area_size();
@@ -319,7 +414,8 @@ int __init fadump_reserve_mem(void)
 	else
 		memory_boundary = memblock_end_of_DRAM();
 
-	base = fw_dump.boot_memory_size;
+	base = fw_dump.boot_mem_top;
+	base = PAGE_ALIGN(base);
 	if (fw_dump.dump_active) {
 		pr_info("Firmware-assisted dump is active.\n");
 
@@ -612,36 +708,39 @@ static int fadump_init_elfcore_header(char *bufp)
 static int fadump_setup_crash_memory_ranges(void)
 {
 	struct memblock_region *reg;
-	unsigned long long start, end;
-	int ret;
+	unsigned long long start, end, offset;
+	int i, ret;
 
 	pr_debug("Setup crash memory ranges.\n");
 	crash_mem_ranges = 0;
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
-	ret = fadump_add_crash_memory(RMA_START, fw_dump.boot_memory_size);
-	if (ret)
-		return ret;
+	for (i = 0; i < fw_dump.boot_mem_regs_cnt; i++) {
+		start = fw_dump.boot_mem_addr[i];
+		end = start + fw_dump.boot_mem_size[i];
+		ret = fadump_add_crash_memory(start, end);
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
@@ -662,17 +761,35 @@ static int fadump_setup_crash_memory_ranges(void)
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
+		rend = rstart + fw_dump.boot_mem_size[i];
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
@@ -715,7 +832,9 @@ static int fadump_create_elfcore_headers(char *bufp)
 	(elf->e_phnum)++;
 
 	/* setup PT_LOAD sections. */
-
+	j = 0;
+	offset = 0;
+	raddr = fw_dump.boot_mem_addr[0];
 	for (i = 0; i < crash_mem_ranges; i++) {
 		unsigned long long mbase, msize;
 		mbase = crash_memory_ranges[i].base;
@@ -730,13 +849,17 @@ static int fadump_create_elfcore_headers(char *bufp)
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
+				offset += fw_dump.boot_mem_size[j];
+				raddr = fw_dump.boot_mem_addr[++j];
+			}
 		}
 
 		phdr->p_paddr = mbase;
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index 2179126..9c68c83 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -30,6 +30,8 @@ static struct opal_fadump_mem_struct *opal_fdm;
 static void opal_fadump_update_config(struct fw_dump *fadump_conf,
 				      const struct opal_fadump_mem_struct *fdm)
 {
+	pr_debug("Boot memory regions count: %d\n", fdm->region_cnt);
+
 	/*
 	 * The destination address of the first boot memory region is the
 	 * destination address of boot memory regions.
@@ -44,15 +46,22 @@ static void opal_fadump_update_config(struct fw_dump *fadump_conf,
 static ulong opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 {
 	ulong addr = fadump_conf->reserve_dump_area_start;
+	int i;
 
 	opal_fdm = __va(fadump_conf->kernel_metadata);
 	opal_fdm->version = OPAL_FADUMP_VERSION;
-	opal_fdm->region_cnt = 1;
+	opal_fdm->region_cnt = 0;
 	opal_fdm->registered_regions = 0;
-	opal_fdm->rgn[0].src	= RMA_START;
-	opal_fdm->rgn[0].dest	= addr;
-	opal_fdm->rgn[0].size	= fadump_conf->boot_memory_size;
-	addr += fadump_conf->boot_memory_size;
+
+	/* RMA regions */
+	for (i = 0; i < fadump_conf->boot_mem_regs_cnt; i++) {
+		opal_fdm->rgn[i].src	= fadump_conf->boot_mem_addr[i];
+		opal_fdm->rgn[i].dest	= addr;
+		opal_fdm->rgn[i].size	= fadump_conf->boot_mem_size[i];
+
+		opal_fdm->region_cnt++;
+		addr += fadump_conf->boot_mem_size[i];
+	}
 
 	/*
 	 * Kernel metadata is passed to f/w and retrieved in capture kerenl.
@@ -236,5 +245,11 @@ int __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
 	fadump_conf->fadump_platform	= FADUMP_PLATFORM_POWERNV;
 	fadump_conf->fadump_supported	= 1;
 
+	/*
+	 * Firmware currently supports only 32-bit value for size,
+	 * align it to pagesize.
+	 */
+	fadump_conf->max_copy_size = _ALIGN_DOWN(U32_MAX, PAGE_SIZE);
+
 	return 1;
 }
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.h b/arch/powerpc/platforms/powernv/opal-fadump.h
index 7e5a579..423c9b2 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.h
+++ b/arch/powerpc/platforms/powernv/opal-fadump.h
@@ -16,9 +16,6 @@
 /* OPAL FADump structure format version */
 #define OPAL_FADUMP_VERSION			0x1
 
-/* Maximum number of memory regions kernel supports */
-#define OPAL_FADUMP_MAX_MEM_REGS		128
-
 /*
  * FADump memory structure for storing kernel metadata needed to
  * register-for/process crash dump. The address of this structure will
@@ -31,7 +28,7 @@ struct opal_fadump_mem_struct {
 	u16	region_cnt;		/* number of regions */
 	u16	registered_regions;	/* Regions registered for MPIPL */
 	u64	fadumphdr_addr;
-	struct opal_mpipl_region	rgn[OPAL_FADUMP_MAX_MEM_REGS];
+	struct opal_mpipl_region	rgn[FADUMP_MAX_MEM_REGS];
 } __attribute__((packed));
 
 #endif /* __PPC64_OPAL_FA_DUMP_H__ */
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index f2bcb1d..4372fb3 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -56,7 +56,14 @@ static void rtas_fadump_update_config(struct fw_dump *fadump_conf,
 static void rtas_fadump_get_config(struct fw_dump *fadump_conf,
 				   const struct rtas_fadump_mem_struct *fdm)
 {
-	fadump_conf->boot_memory_size = be64_to_cpu(fdm->rmr_region.source_len);
+	fadump_conf->boot_mem_addr[0] =
+		be64_to_cpu(fdm->rmr_region.source_address);
+	fadump_conf->boot_mem_size[0] =
+		be64_to_cpu(fdm->rmr_region.source_len);
+	fadump_conf->boot_memory_size = fadump_conf->boot_mem_size[0];
+
+	fadump_conf->boot_mem_top = fadump_conf->boot_memory_size;
+	fadump_conf->boot_mem_regs_cnt = 1;
 	rtas_fadump_update_config(fadump_conf, fdm);
 }
 
@@ -535,6 +542,9 @@ int __init rtas_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
 	fadump_conf->fadump_platform	= FADUMP_PLATFORM_PSERIES;
 	fadump_conf->fadump_supported	= 1;
 
+	/* Firmware supports 64-bit value for size, align it to pagesize. */
+	fadump_conf->max_copy_size = _ALIGN_DOWN(U64_MAX, PAGE_SIZE);
+
 	/*
 	 * The 'ibm,kernel-dump' rtas node is present only if there is
 	 * dump data waiting for us.
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.h b/arch/powerpc/platforms/pseries/rtas-fadump.h
index 0cc6dfe3..25da5b8 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.h
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.h
@@ -67,6 +67,11 @@ struct rtas_fadump_mem_struct {
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
 

