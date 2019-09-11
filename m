Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A500AFF39
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 16:53:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T4dt1N7xzF3DK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 00:53:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4VL0x8GzF394
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:46:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4VK3xPnz8t0n
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:46:49 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4VK3Ngpz9sDB; Thu, 12 Sep 2019 00:46:49 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46T4VJ6WbDz9s4Y
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:46:48 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEge1G107402
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:46:46 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uy107na4s-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:46:46 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:46:44 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:46:41 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEkdJt22020168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:46:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91861AE057;
 Wed, 11 Sep 2019 14:46:39 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E114AE04D;
 Wed, 11 Sep 2019 14:46:37 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:46:37 +0000 (GMT)
Subject: [PATCH v6 02/36] powerpc/fadump: add helper functions
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:16:36 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0008-0000-0000-000003146B7F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0009-0000-0000-00004A32D7AB
Message-Id: <156821318971.5656.9281936950510635858.stgit@hbathini.in.ibm.com>
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

Add helper functions to setup & free CPU notes buffer and to find if a
given memory area is contiguous. Also, use boolean as return type for
the function that finds if boot memory area is contiguous. While at
it, save the virtual address of CPU notes buffer instead of physical
address as virtual address is used often.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

* New patch to add a few helper functions. Also, save vaddr for CPU notes
  buffer in fw_dump structure.


 arch/powerpc/include/asm/fadump-internal.h |    2 
 arch/powerpc/kernel/fadump.c               |  127 +++++++++++++++-------------
 2 files changed, 67 insertions(+), 62 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index 071f377..16e2781 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -71,7 +71,7 @@ struct fw_dump {
 	unsigned long	boot_memory_size;
 
 	unsigned long	fadumphdr_addr;
-	unsigned long	cpu_notes_buf;
+	unsigned long	cpu_notes_buf_vaddr;
 	unsigned long	cpu_notes_buf_size;
 
 	int		ibm_configure_kernel_dump;
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 7c55044..e2b83a9 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -201,31 +201,29 @@ int is_fadump_active(void)
 }
 
 /*
- * Returns 1, if there are no holes in boot memory area,
- * 0 otherwise.
+ * Returns true, if there are no holes in memory area between d_start to d_end,
+ * false otherwise.
  */
-static int is_boot_memory_area_contiguous(void)
+static bool is_fadump_mem_area_contiguous(u64 d_start, u64 d_end)
 {
 	struct memblock_region *reg;
-	unsigned long tstart, tend;
-	unsigned long start_pfn = PHYS_PFN(RMA_START);
-	unsigned long end_pfn = PHYS_PFN(RMA_START + fw_dump.boot_memory_size);
-	unsigned int ret = 0;
+	bool ret = false;
+	u64 start, end;
 
 	for_each_memblock(memory, reg) {
-		tstart = max(start_pfn, memblock_region_memory_base_pfn(reg));
-		tend = min(end_pfn, memblock_region_memory_end_pfn(reg));
-		if (tstart < tend) {
-			/* Memory hole from start_pfn to tstart */
-			if (tstart > start_pfn)
+		start = max_t(u64, d_start, reg->base);
+		end = min_t(u64, d_end, (reg->base + reg->size));
+		if (d_start < end) {
+			/* Memory hole from d_start to start */
+			if (start > d_start)
 				break;
 
-			if (tend == end_pfn) {
-				ret = 1;
+			if (end == d_end) {
+				ret = true;
 				break;
 			}
 
-			start_pfn = tend + 1;
+			d_start = end + 1;
 		}
 	}
 
@@ -233,32 +231,25 @@ static int is_boot_memory_area_contiguous(void)
 }
 
 /*
+ * Returns true, if there are no holes in boot memory area,
+ * false otherwise.
+ */
+static bool is_boot_memory_area_contiguous(void)
+{
+	return is_fadump_mem_area_contiguous(0, fw_dump.boot_memory_size);
+}
+
+/*
  * Returns true, if there are no holes in reserved memory area,
  * false otherwise.
  */
 static bool is_reserved_memory_area_contiguous(void)
 {
-	struct memblock_region *reg;
-	unsigned long start, end;
-	unsigned long d_start = fw_dump.reserve_dump_area_start;
-	unsigned long d_end = d_start + fw_dump.reserve_dump_area_size;
+	u64 d_start, d_end;
 
-	for_each_memblock(memory, reg) {
-		start = max(d_start, (unsigned long)reg->base);
-		end = min(d_end, (unsigned long)(reg->base + reg->size));
-		if (d_start < end) {
-			/* Memory hole from d_start to start */
-			if (start > d_start)
-				break;
-
-			if (end == d_end)
-				return true;
-
-			d_start = end + 1;
-		}
-	}
-
-	return false;
+	d_start	= fw_dump.reserve_dump_area_start;
+	d_end	= d_start + fw_dump.reserve_dump_area_size;
+	return is_fadump_mem_area_contiguous(d_start, d_end);
 }
 
 /* Print firmware assisted dump configurations for debugging purpose. */
@@ -785,7 +776,7 @@ static void fadump_update_elfcore_header(char *bufp)
 	phdr = (struct elf_phdr *)bufp;
 
 	if (phdr->p_type == PT_NOTE) {
-		phdr->p_paddr = fw_dump.cpu_notes_buf;
+		phdr->p_paddr	= __pa(fw_dump.cpu_notes_buf_vaddr);
 		phdr->p_offset	= phdr->p_paddr;
 		phdr->p_filesz	= fw_dump.cpu_notes_buf_size;
 		phdr->p_memsz = fw_dump.cpu_notes_buf_size;
@@ -793,7 +784,7 @@ static void fadump_update_elfcore_header(char *bufp)
 	return;
 }
 
-static void *fadump_cpu_notes_buf_alloc(unsigned long size)
+static void *fadump_alloc_buffer(unsigned long size)
 {
 	void *vaddr;
 	struct page *page;
@@ -811,7 +802,7 @@ static void *fadump_cpu_notes_buf_alloc(unsigned long size)
 	return vaddr;
 }
 
-static void fadump_cpu_notes_buf_free(unsigned long vaddr, unsigned long size)
+static void fadump_free_buffer(unsigned long vaddr, unsigned long size)
 {
 	struct page *page;
 	unsigned long order, count, i;
@@ -824,6 +815,36 @@ static void fadump_cpu_notes_buf_free(unsigned long vaddr, unsigned long size)
 	__free_pages(page, order);
 }
 
+static s32 fadump_setup_cpu_notes_buf(u32 num_cpus)
+{
+	/* Allocate buffer to hold cpu crash notes. */
+	fw_dump.cpu_notes_buf_size = num_cpus * sizeof(note_buf_t);
+	fw_dump.cpu_notes_buf_size = PAGE_ALIGN(fw_dump.cpu_notes_buf_size);
+	fw_dump.cpu_notes_buf_vaddr =
+		(unsigned long)fadump_alloc_buffer(fw_dump.cpu_notes_buf_size);
+	if (!fw_dump.cpu_notes_buf_vaddr) {
+		pr_err("Failed to allocate %ld bytes for CPU notes buffer\n",
+		       fw_dump.cpu_notes_buf_size);
+		return -ENOMEM;
+	}
+
+	pr_debug("Allocated buffer for cpu notes of size %ld at 0x%lx\n",
+		 fw_dump.cpu_notes_buf_size,
+		 fw_dump.cpu_notes_buf_vaddr);
+	return 0;
+}
+
+static void fadump_free_cpu_notes_buf(void)
+{
+	if (!fw_dump.cpu_notes_buf_vaddr)
+		return;
+
+	fadump_free_buffer(fw_dump.cpu_notes_buf_vaddr,
+			   fw_dump.cpu_notes_buf_size);
+	fw_dump.cpu_notes_buf_vaddr = 0;
+	fw_dump.cpu_notes_buf_size = 0;
+}
+
 /*
  * Read CPU state dump data and convert it into ELF notes.
  * The CPU dump starts with magic number "REGSAVE". NumCpusOffset should be
@@ -870,19 +891,11 @@ static int __init fadump_build_cpu_notes(const struct fadump_mem_struct *fdm)
 	vaddr += sizeof(u32);
 	reg_entry = (struct fadump_reg_entry *)vaddr;
 
-	/* Allocate buffer to hold cpu crash notes. */
-	fw_dump.cpu_notes_buf_size = num_cpus * sizeof(note_buf_t);
-	fw_dump.cpu_notes_buf_size = PAGE_ALIGN(fw_dump.cpu_notes_buf_size);
-	note_buf = fadump_cpu_notes_buf_alloc(fw_dump.cpu_notes_buf_size);
-	if (!note_buf) {
-		printk(KERN_ERR "Failed to allocate 0x%lx bytes for "
-			"cpu notes buffer\n", fw_dump.cpu_notes_buf_size);
-		return -ENOMEM;
-	}
-	fw_dump.cpu_notes_buf = __pa(note_buf);
+	rc = fadump_setup_cpu_notes_buf(num_cpus);
+	if (rc != 0)
+		return rc;
 
-	pr_debug("Allocated buffer for cpu notes of size %ld at %p\n",
-			(num_cpus * sizeof(note_buf_t)), note_buf);
+	note_buf = (u32 *)fw_dump.cpu_notes_buf_vaddr;
 
 	if (fw_dump.fadumphdr_addr)
 		fdh = __va(fw_dump.fadumphdr_addr);
@@ -920,10 +933,7 @@ static int __init fadump_build_cpu_notes(const struct fadump_mem_struct *fdm)
 	return 0;
 
 error_out:
-	fadump_cpu_notes_buf_free((unsigned long)__va(fw_dump.cpu_notes_buf),
-					fw_dump.cpu_notes_buf_size);
-	fw_dump.cpu_notes_buf = 0;
-	fw_dump.cpu_notes_buf_size = 0;
+	fadump_free_cpu_notes_buf();
 	return rc;
 
 }
@@ -1470,13 +1480,8 @@ static void fadump_invalidate_release_mem(void)
 	fw_dump.reserve_dump_area_size = get_fadump_area_size();
 
 	fadump_release_memory(reserved_area_start, reserved_area_end);
-	if (fw_dump.cpu_notes_buf) {
-		fadump_cpu_notes_buf_free(
-				(unsigned long)__va(fw_dump.cpu_notes_buf),
-				fw_dump.cpu_notes_buf_size);
-		fw_dump.cpu_notes_buf = 0;
-		fw_dump.cpu_notes_buf_size = 0;
-	}
+	fadump_free_cpu_notes_buf();
+
 	/* Initialize the kernel dump memory structure for FAD registration. */
 	init_fadump_mem_struct(&fdm, fw_dump.reserve_dump_area_start);
 }

