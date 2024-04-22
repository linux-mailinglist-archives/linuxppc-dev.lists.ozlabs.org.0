Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DA78AD573
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 22:01:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y4jvhO5V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNbjW2JXnz3d4H
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 06:01:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y4jvhO5V;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNbgx3sxmz3cXh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 05:59:57 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4VNbgw2SG7z4wyl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 05:59:56 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4VNbgw2Ph4z4x0C; Tue, 23 Apr 2024 05:59:56 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y4jvhO5V;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4VNbgw007Nz4wyl
	for <linuxppc-dev@ozlabs.org>; Tue, 23 Apr 2024 05:59:55 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43MJ1CV7010004;
	Mon, 22 Apr 2024 19:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gmYGKa7u6rNbiLBLjmLmMCM2aJCA0QHjyuyMR3BAVYE=;
 b=Y4jvhO5VJg/uo3hnCFfJOC6uBnDbgwUAj9HOxEs5QavXk2K/MlUPvochAPDQFE0GiJnr
 n49nHfuy04kWgMh/neu91OVB5TQ5BTIYwoCL2HyO1cxsoBXCmUQnmvoCXRS7EgV5Qth8
 Tp05sr+vwp6sFkwYvqNycuRaYIGfqmBrt9tm8TmpJABwRie1yg8J7xtkxpoyWbvyEUhG
 G3QB1yZenKmCzgSReamZIiyuEUNie7vPQcud/wrSNM+49+IrEp4b+lOq/11vfLhbIq3P
 2ICzQA6us3bdOCa57cTunjntsVoHiCyHSiVjw5HJ5iImQfzMqvXj++O52GuGgMps9Dx7 0w== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xnwhc03es-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 19:59:49 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43MJDcoL029929;
	Mon, 22 Apr 2024 19:59:48 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmr1t9u7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 19:59:48 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43MJxhkE43581716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Apr 2024 19:59:45 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 298AD2004B;
	Mon, 22 Apr 2024 19:59:43 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A824D20049;
	Mon, 22 Apr 2024 19:59:39 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.102.192])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 Apr 2024 19:59:39 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v10 1/3] powerpc: make fadump resilient with memory add/remove events
Date: Tue, 23 Apr 2024 01:29:30 +0530
Message-ID: <20240422195932.1583833-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240422195932.1583833-1-sourabhjain@linux.ibm.com>
References: <20240422195932.1583833-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5evquAAF1KcdjNUJE6ZFOF2DckiJn5bD
X-Proofpoint-ORIG-GUID: 5evquAAF1KcdjNUJE6ZFOF2DckiJn5bD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_14,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404220084
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Aditya Gupta <adityag@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Due to changes in memory resources caused by either memory hotplug or
online/offline events, the elfcorehdr, which describes the CPUs and
memory of the crashed kernel to the kernel that collects the dump (known
as second/fadump kernel), becomes outdated. Consequently, attempting
dump collection with an outdated elfcorehdr can lead to failed or
inaccurate dump collection.

Memory hotplug or online/offline events is referred as memory add/remove
events in reset of the commit message.

The current solution to address the aforementioned issue is as follows:
Monitor memory add/remove events in userspace using udev rules, and
re-register fadump whenever there are changes in memory resources. This
leads to the creation of a new elfcorehdr with updated system memory
information.

There are several notable issues associated with re-registering fadump
for every memory add/remove events.

1. Bulk memory add/remove events with udev-based fadump re-registration
   can lead to race conditions and, more importantly, it creates a wide
   window during which fadump is inactive until all memory add/remove
   events are settled.
2. Re-registering fadump for every memory add/remove event is
   inefficient.
3. The memory for elfcorehdr is allocated based on the memblock regions
   available during early boot and remains fixed thereafter. However, if
   elfcorehdr is later recreated with additional memblock regions, its
   size will increase, potentially leading to memory corruption.

Address the aforementioned challenges by shifting the creation of
elfcorehdr from the first kernel (also referred as the crashed kernel),
where it was created and frequently recreated for every memory
add/remove event, to the fadump kernel. As a result, the elfcorehdr only
needs to be created once, thus eliminating the necessity to re-register
fadump during memory add/remove events.

At present, the first kernel prepares fadump header and stores it in the
fadump reserved area. The fadump header includes the start address of
the elfcorehdr, crashing CPU details, and other relevant information. In
the event of a crash in the first kernel, the second/fadump boots and
accesses the fadump header prepared by the first kernel. It then
performs the following steps in a platform-specific function
[rtas|opal]_fadump_process:

1. Sanity check for fadump header
2. Update CPU notes in elfcorehdr

Along with the above, update the setup_fadump()/fadump.c to create
elfcorehdr and set its address to the global variable elfcorehdr_addr
for the vmcore module to process it in the second/fadump kernel.

Section below outlines the information required to create the elfcorehdr
and the changes made to make it available to the fadump kernel if it's
not already.

To create elfcorehdr, the following crashed kernel information is
required: CPU notes, vmcoreinfo, and memory ranges.

At present, the CPU notes are already prepared in the fadump kernel, so
no changes are needed in that regard. The fadump kernel has access to
all crashed kernel memory regions, including boot memory regions that
are relocated by firmware to fadump reserved areas, so no changes for
that either. However, it is necessary to add new members to the fadump
header, i.e., the 'fadump_crash_info_header' structure, in order to pass
the crashed kernel's vmcoreinfo address and its size to fadump kernel.

In addition to the vmcoreinfo address and size, there are a few other
attributes also added to the fadump_crash_info_header structure.

1. version:
   It stores the fadump header version, which is currently set to 1.
   This provides flexibility to update the fadump crash info header in
   the future without changing the magic number. For each change in the
   fadump header, the version will be increased. This will help the
   updated kernel determine how to handle kernel dumps from older
   kernels. The magic number remains relevant for checking fadump header
   corruption.

2. pt_regs_sz/cpu_mask_sz:
   Store size of pt_regs and cpu_mask structure of first kernel. These
   attributes are used to prevent dump processing if the sizes of
   pt_regs or cpu_mask structure differ between the first and fadump
   kernels.

Note: if either first/crashed kernel or second/fadump kernel do not have
the changes introduced here then kernel fail to collect the dump and
prints relevant error message on the console.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Aditya Gupta <adityag@linux.ibm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/include/asm/fadump-internal.h   |  31 +-
 arch/powerpc/kernel/fadump.c                 | 361 +++++++++++--------
 arch/powerpc/platforms/powernv/opal-fadump.c |  22 +-
 arch/powerpc/platforms/pseries/rtas-fadump.c |  34 +-
 4 files changed, 242 insertions(+), 206 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index 27f9e11eda28..5d706a7acc8a 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -42,13 +42,38 @@ static inline u64 fadump_str_to_u64(const char *str)
 
 #define FADUMP_CPU_UNKNOWN		(~((u32)0))
 
-#define FADUMP_CRASH_INFO_MAGIC		fadump_str_to_u64("FADMPINF")
+/*
+ * The introduction of new fields in the fadump crash info header has
+ * led to a change in the magic key from `FADMPINF` to `FADMPSIG` for
+ * identifying a kernel crash from an old kernel.
+ *
+ * To prevent the need for further changes to the magic number in the
+ * event of future modifications to the fadump crash info header, a
+ * version field has been introduced to track the fadump crash info
+ * header version.
+ *
+ * Consider a few points before adding new members to the fadump crash info
+ * header structure:
+ *
+ *  - Append new members; avoid adding them in between.
+ *  - Non-primitive members should have a size member as well.
+ *  - For every change in the fadump header, increment the
+ *    fadump header version. This helps the updated kernel decide how to
+ *    handle kernel dumps from older kernels.
+ */
+#define FADUMP_CRASH_INFO_MAGIC_OLD	fadump_str_to_u64("FADMPINF")
+#define FADUMP_CRASH_INFO_MAGIC		fadump_str_to_u64("FADMPSIG")
+#define FADUMP_HEADER_VERSION		1
 
 /* fadump crash info structure */
 struct fadump_crash_info_header {
 	u64		magic_number;
-	u64		elfcorehdr_addr;
+	u32		version;
 	u32		crashing_cpu;
+	u64		vmcoreinfo_raddr;
+	u64		vmcoreinfo_size;
+	u32		pt_regs_sz;
+	u32		cpu_mask_sz;
 	struct pt_regs	regs;
 	struct cpumask	cpu_mask;
 };
@@ -94,6 +119,8 @@ struct fw_dump {
 	u64		boot_mem_regs_cnt;
 
 	unsigned long	fadumphdr_addr;
+	u64		elfcorehdr_addr;
+	u64		elfcorehdr_size;
 	unsigned long	cpu_notes_buf_vaddr;
 	unsigned long	cpu_notes_buf_size;
 
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index d14eda1e8589..35254fc1516b 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -53,8 +53,6 @@ static struct kobject *fadump_kobj;
 static atomic_t cpus_in_fadump;
 static DEFINE_MUTEX(fadump_mutex);
 
-static struct fadump_mrange_info crash_mrange_info = { "crash", NULL, 0, 0, 0, false };
-
 #define RESERVED_RNGS_SZ	16384 /* 16K - 128 entries */
 #define RESERVED_RNGS_CNT	(RESERVED_RNGS_SZ / \
 				 sizeof(struct fadump_memory_range))
@@ -373,12 +371,6 @@ static unsigned long __init get_fadump_area_size(void)
 	size = PAGE_ALIGN(size);
 	size += fw_dump.boot_memory_size;
 	size += sizeof(struct fadump_crash_info_header);
-	size += sizeof(struct elfhdr); /* ELF core header.*/
-	size += sizeof(struct elf_phdr); /* place holder for cpu notes */
-	/* Program headers for crash memory regions. */
-	size += sizeof(struct elf_phdr) * (memblock_num_regions(memory) + 2);
-
-	size = PAGE_ALIGN(size);
 
 	/* This is to hold kernel metadata on platforms that support it */
 	size += (fw_dump.ops->fadump_get_metadata_size ?
@@ -931,36 +923,6 @@ static inline int fadump_add_mem_range(struct fadump_mrange_info *mrange_info,
 	return 0;
 }
 
-static int fadump_exclude_reserved_area(u64 start, u64 end)
-{
-	u64 ra_start, ra_end;
-	int ret = 0;
-
-	ra_start = fw_dump.reserve_dump_area_start;
-	ra_end = ra_start + fw_dump.reserve_dump_area_size;
-
-	if ((ra_start < end) && (ra_end > start)) {
-		if ((start < ra_start) && (end > ra_end)) {
-			ret = fadump_add_mem_range(&crash_mrange_info,
-						   start, ra_start);
-			if (ret)
-				return ret;
-
-			ret = fadump_add_mem_range(&crash_mrange_info,
-						   ra_end, end);
-		} else if (start < ra_start) {
-			ret = fadump_add_mem_range(&crash_mrange_info,
-						   start, ra_start);
-		} else if (ra_end < end) {
-			ret = fadump_add_mem_range(&crash_mrange_info,
-						   ra_end, end);
-		}
-	} else
-		ret = fadump_add_mem_range(&crash_mrange_info, start, end);
-
-	return ret;
-}
-
 static int fadump_init_elfcore_header(char *bufp)
 {
 	struct elfhdr *elf;
@@ -997,52 +959,6 @@ static int fadump_init_elfcore_header(char *bufp)
 	return 0;
 }
 
-/*
- * Traverse through memblock structure and setup crash memory ranges. These
- * ranges will be used create PT_LOAD program headers in elfcore header.
- */
-static int fadump_setup_crash_memory_ranges(void)
-{
-	u64 i, start, end;
-	int ret;
-
-	pr_debug("Setup crash memory ranges.\n");
-	crash_mrange_info.mem_range_cnt = 0;
-
-	/*
-	 * Boot memory region(s) registered with firmware are moved to
-	 * different location at the time of crash. Create separate program
-	 * header(s) for this memory chunk(s) with the correct offset.
-	 */
-	for (i = 0; i < fw_dump.boot_mem_regs_cnt; i++) {
-		start = fw_dump.boot_mem_addr[i];
-		end = start + fw_dump.boot_mem_sz[i];
-		ret = fadump_add_mem_range(&crash_mrange_info, start, end);
-		if (ret)
-			return ret;
-	}
-
-	for_each_mem_range(i, &start, &end) {
-		/*
-		 * skip the memory chunk that is already added
-		 * (0 through boot_memory_top).
-		 */
-		if (start < fw_dump.boot_mem_top) {
-			if (end > fw_dump.boot_mem_top)
-				start = fw_dump.boot_mem_top;
-			else
-				continue;
-		}
-
-		/* add this range excluding the reserved dump area. */
-		ret = fadump_exclude_reserved_area(start, end);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 /*
  * If the given physical address falls within the boot memory region then
  * return the relocated address that points to the dump region reserved
@@ -1073,36 +989,50 @@ static inline unsigned long fadump_relocate(unsigned long paddr)
 	return raddr;
 }
 
-static int fadump_create_elfcore_headers(char *bufp)
+static void __init populate_elf_pt_load(struct elf_phdr *phdr, u64 start,
+			     u64 size, unsigned long long offset)
 {
-	unsigned long long raddr, offset;
-	struct elf_phdr *phdr;
+	phdr->p_align	= 0;
+	phdr->p_memsz	= size;
+	phdr->p_filesz	= size;
+	phdr->p_paddr	= start;
+	phdr->p_offset	= offset;
+	phdr->p_type	= PT_LOAD;
+	phdr->p_flags	= PF_R|PF_W|PF_X;
+	phdr->p_vaddr	= (unsigned long)__va(start);
+}
+
+static void __init fadump_populate_elfcorehdr(struct fadump_crash_info_header *fdh)
+{
+	char *bufp;
 	struct elfhdr *elf;
-	int i, j;
+	struct elf_phdr *phdr;
+	u64 boot_mem_dest_offset;
+	unsigned long long i, ra_start, ra_end, ra_size, mstart, mend;
 
+	bufp = (char *) fw_dump.elfcorehdr_addr;
 	fadump_init_elfcore_header(bufp);
 	elf = (struct elfhdr *)bufp;
 	bufp += sizeof(struct elfhdr);
 
 	/*
-	 * setup ELF PT_NOTE, place holder for cpu notes info. The notes info
-	 * will be populated during second kernel boot after crash. Hence
-	 * this PT_NOTE will always be the first elf note.
+	 * Set up ELF PT_NOTE, a placeholder for CPU notes information.
+	 * The notes info will be populated later by platform-specific code.
+	 * Hence, this PT_NOTE will always be the first ELF note.
 	 *
 	 * NOTE: Any new ELF note addition should be placed after this note.
 	 */
 	phdr = (struct elf_phdr *)bufp;
 	bufp += sizeof(struct elf_phdr);
 	phdr->p_type = PT_NOTE;
-	phdr->p_flags = 0;
-	phdr->p_vaddr = 0;
-	phdr->p_align = 0;
-
-	phdr->p_offset = 0;
-	phdr->p_paddr = 0;
-	phdr->p_filesz = 0;
-	phdr->p_memsz = 0;
-
+	phdr->p_flags	= 0;
+	phdr->p_vaddr	= 0;
+	phdr->p_align	= 0;
+	phdr->p_offset	= 0;
+	phdr->p_paddr	= 0;
+	phdr->p_filesz	= 0;
+	phdr->p_memsz	= 0;
+	/* Increment number of program headers. */
 	(elf->e_phnum)++;
 
 	/* setup ELF PT_NOTE for vmcoreinfo */
@@ -1112,55 +1042,66 @@ static int fadump_create_elfcore_headers(char *bufp)
 	phdr->p_flags	= 0;
 	phdr->p_vaddr	= 0;
 	phdr->p_align	= 0;
-
-	phdr->p_paddr	= fadump_relocate(paddr_vmcoreinfo_note());
-	phdr->p_offset	= phdr->p_paddr;
-	phdr->p_memsz	= phdr->p_filesz = VMCOREINFO_NOTE_SIZE;
-
+	phdr->p_paddr	= phdr->p_offset = fdh->vmcoreinfo_raddr;
+	phdr->p_memsz	= phdr->p_filesz = fdh->vmcoreinfo_size;
 	/* Increment number of program headers. */
 	(elf->e_phnum)++;
 
-	/* setup PT_LOAD sections. */
-	j = 0;
-	offset = 0;
-	raddr = fw_dump.boot_mem_addr[0];
-	for (i = 0; i < crash_mrange_info.mem_range_cnt; i++) {
-		u64 mbase, msize;
-
-		mbase = crash_mrange_info.mem_ranges[i].base;
-		msize = crash_mrange_info.mem_ranges[i].size;
-		if (!msize)
-			continue;
-
+	/*
+	 * Setup PT_LOAD sections. first include boot memory regions
+	 * and then add rest of the memory regions.
+	 */
+	boot_mem_dest_offset = fw_dump.boot_mem_dest_addr;
+	for (i = 0; i < fw_dump.boot_mem_regs_cnt; i++) {
 		phdr = (struct elf_phdr *)bufp;
 		bufp += sizeof(struct elf_phdr);
-		phdr->p_type	= PT_LOAD;
-		phdr->p_flags	= PF_R|PF_W|PF_X;
-		phdr->p_offset	= mbase;
-
-		if (mbase == raddr) {
-			/*
-			 * The entire real memory region will be moved by
-			 * firmware to the specified destination_address.
-			 * Hence set the correct offset.
-			 */
-			phdr->p_offset = fw_dump.boot_mem_dest_addr + offset;
-			if (j < (fw_dump.boot_mem_regs_cnt - 1)) {
-				offset += fw_dump.boot_mem_sz[j];
-				raddr = fw_dump.boot_mem_addr[++j];
-			}
+		populate_elf_pt_load(phdr, fw_dump.boot_mem_addr[i],
+				     fw_dump.boot_mem_sz[i],
+				     boot_mem_dest_offset);
+		/* Increment number of program headers. */
+		(elf->e_phnum)++;
+		boot_mem_dest_offset += fw_dump.boot_mem_sz[i];
+	}
+
+	/* Memory reserved for fadump in first kernel */
+	ra_start = fw_dump.reserve_dump_area_start;
+	ra_size = get_fadump_area_size();
+	ra_end = ra_start + ra_size;
+
+	phdr = (struct elf_phdr *)bufp;
+	for_each_mem_range(i, &mstart, &mend) {
+		/* Boot memory regions already added, skip them now */
+		if (mstart < fw_dump.boot_mem_top) {
+			if (mend > fw_dump.boot_mem_top)
+				mstart = fw_dump.boot_mem_top;
+			else
+				continue;
 		}
 
-		phdr->p_paddr = mbase;
-		phdr->p_vaddr = (unsigned long)__va(mbase);
-		phdr->p_filesz = msize;
-		phdr->p_memsz = msize;
-		phdr->p_align = 0;
+		/* Handle memblock regions overlaps with fadump reserved area */
+		if ((ra_start < mend) && (ra_end > mstart)) {
+			if ((mstart < ra_start) && (mend > ra_end)) {
+				populate_elf_pt_load(phdr, mstart, ra_start - mstart, mstart);
+				/* Increment number of program headers. */
+				(elf->e_phnum)++;
+				bufp += sizeof(struct elf_phdr);
+				phdr = (struct elf_phdr *)bufp;
+				populate_elf_pt_load(phdr, ra_end, mend - ra_end, ra_end);
+			} else if (mstart < ra_start) {
+				populate_elf_pt_load(phdr, mstart, ra_start - mstart, mstart);
+			} else if (ra_end < mend) {
+				populate_elf_pt_load(phdr, ra_end, mend - ra_end, ra_end);
+			}
+		} else {
+		/* No overlap with fadump reserved memory region */
+			populate_elf_pt_load(phdr, mstart, mend - mstart, mstart);
+		}
 
 		/* Increment number of program headers. */
 		(elf->e_phnum)++;
+		bufp += sizeof(struct elf_phdr);
+		phdr = (struct elf_phdr *) bufp;
 	}
-	return 0;
 }
 
 static unsigned long init_fadump_header(unsigned long addr)
@@ -1175,14 +1116,25 @@ static unsigned long init_fadump_header(unsigned long addr)
 
 	memset(fdh, 0, sizeof(struct fadump_crash_info_header));
 	fdh->magic_number = FADUMP_CRASH_INFO_MAGIC;
-	fdh->elfcorehdr_addr = addr;
+	fdh->version = FADUMP_HEADER_VERSION;
 	/* We will set the crashing cpu id in crash_fadump() during crash. */
 	fdh->crashing_cpu = FADUMP_CPU_UNKNOWN;
+
+	/*
+	 * The physical address and size of vmcoreinfo are required in the
+	 * second kernel to prepare elfcorehdr.
+	 */
+	fdh->vmcoreinfo_raddr = fadump_relocate(paddr_vmcoreinfo_note());
+	fdh->vmcoreinfo_size = VMCOREINFO_NOTE_SIZE;
+
+
+	fdh->pt_regs_sz = sizeof(struct pt_regs);
 	/*
 	 * When LPAR is terminated by PYHP, ensure all possible CPUs'
 	 * register data is processed while exporting the vmcore.
 	 */
 	fdh->cpu_mask = *cpu_possible_mask;
+	fdh->cpu_mask_sz = sizeof(struct cpumask);
 
 	return addr;
 }
@@ -1190,8 +1142,6 @@ static unsigned long init_fadump_header(unsigned long addr)
 static int register_fadump(void)
 {
 	unsigned long addr;
-	void *vaddr;
-	int ret;
 
 	/*
 	 * If no memory is reserved then we can not register for firmware-
@@ -1200,18 +1150,10 @@ static int register_fadump(void)
 	if (!fw_dump.reserve_dump_area_size)
 		return -ENODEV;
 
-	ret = fadump_setup_crash_memory_ranges();
-	if (ret)
-		return ret;
-
 	addr = fw_dump.fadumphdr_addr;
 
 	/* Initialize fadump crash info header. */
 	addr = init_fadump_header(addr);
-	vaddr = __va(addr);
-
-	pr_debug("Creating ELF core headers at %#016lx\n", addr);
-	fadump_create_elfcore_headers(vaddr);
 
 	/* register the future kernel dump with firmware. */
 	pr_debug("Registering for firmware-assisted kernel dump...\n");
@@ -1230,7 +1172,6 @@ void fadump_cleanup(void)
 	} else if (fw_dump.dump_registered) {
 		/* Un-register Firmware-assisted dump if it was registered. */
 		fw_dump.ops->fadump_unregister(&fw_dump);
-		fadump_free_mem_ranges(&crash_mrange_info);
 	}
 
 	if (fw_dump.ops->fadump_cleanup)
@@ -1416,6 +1357,22 @@ static void fadump_release_memory(u64 begin, u64 end)
 		fadump_release_reserved_area(tstart, end);
 }
 
+static void fadump_free_elfcorehdr_buf(void)
+{
+	if (fw_dump.elfcorehdr_addr == 0 || fw_dump.elfcorehdr_size == 0)
+		return;
+
+	/*
+	 * Before freeing the memory of `elfcorehdr`, reset the global
+	 * `elfcorehdr_addr` to prevent modules like `vmcore` from accessing
+	 * invalid memory.
+	 */
+	elfcorehdr_addr = ELFCORE_ADDR_ERR;
+	fadump_free_buffer(fw_dump.elfcorehdr_addr, fw_dump.elfcorehdr_size);
+	fw_dump.elfcorehdr_addr = 0;
+	fw_dump.elfcorehdr_size = 0;
+}
+
 static void fadump_invalidate_release_mem(void)
 {
 	mutex_lock(&fadump_mutex);
@@ -1427,6 +1384,7 @@ static void fadump_invalidate_release_mem(void)
 	fadump_cleanup();
 	mutex_unlock(&fadump_mutex);
 
+	fadump_free_elfcorehdr_buf();
 	fadump_release_memory(fw_dump.boot_mem_top, memblock_end_of_DRAM());
 	fadump_free_cpu_notes_buf();
 
@@ -1632,6 +1590,102 @@ static void __init fadump_init_files(void)
 	return;
 }
 
+static int __init fadump_setup_elfcorehdr_buf(void)
+{
+	int elf_phdr_cnt;
+	unsigned long elfcorehdr_size;
+
+	/*
+	 * Program header for CPU notes comes first, followed by one for
+	 * vmcoreinfo, and the remaining program headers correspond to
+	 * memory regions.
+	 */
+	elf_phdr_cnt = 2 + fw_dump.boot_mem_regs_cnt + memblock_num_regions(memory);
+	elfcorehdr_size = sizeof(struct elfhdr) + (elf_phdr_cnt * sizeof(struct elf_phdr));
+	elfcorehdr_size = PAGE_ALIGN(elfcorehdr_size);
+
+	fw_dump.elfcorehdr_addr = (u64)fadump_alloc_buffer(elfcorehdr_size);
+	if (!fw_dump.elfcorehdr_addr) {
+		pr_err("Failed to allocate %lu bytes for elfcorehdr\n",
+		       elfcorehdr_size);
+		return -ENOMEM;
+	}
+	fw_dump.elfcorehdr_size = elfcorehdr_size;
+	return 0;
+}
+
+/*
+ * Check if the fadump header of crashed kernel is compatible with fadump kernel.
+ *
+ * It checks the magic number, endianness, and size of non-primitive type
+ * members of fadump header to ensure safe dump collection.
+ */
+static bool __init is_fadump_header_compatible(struct fadump_crash_info_header *fdh)
+{
+	if (fdh->magic_number == FADUMP_CRASH_INFO_MAGIC_OLD) {
+		pr_err("Old magic number, can't process the dump.\n");
+		return false;
+	}
+
+	if (fdh->magic_number != FADUMP_CRASH_INFO_MAGIC) {
+		if (fdh->magic_number == swab64(FADUMP_CRASH_INFO_MAGIC))
+			pr_err("Endianness mismatch between the crashed and fadump kernels.\n");
+		else
+			pr_err("Fadump header is corrupted.\n");
+
+		return false;
+	}
+
+	/*
+	 * Dump collection is not safe if the size of non-primitive type members
+	 * of the fadump header do not match between crashed and fadump kernel.
+	 */
+	if (fdh->pt_regs_sz != sizeof(struct pt_regs) ||
+	    fdh->cpu_mask_sz != sizeof(struct cpumask)) {
+		pr_err("Fadump header size mismatch.\n");
+		return false;
+	}
+
+	return true;
+}
+
+static void __init fadump_process(void)
+{
+	struct fadump_crash_info_header *fdh;
+
+	fdh = (struct fadump_crash_info_header *) __va(fw_dump.fadumphdr_addr);
+	if (!fdh) {
+		pr_err("Crash info header is empty.\n");
+		goto err_out;
+	}
+
+	/* Avoid processing the dump if fadump header isn't compatible */
+	if (!is_fadump_header_compatible(fdh))
+		goto err_out;
+
+	/* Allocate buffer for elfcorehdr */
+	if (fadump_setup_elfcorehdr_buf())
+		goto err_out;
+
+	fadump_populate_elfcorehdr(fdh);
+
+	/* Let platform update the CPU notes in elfcorehdr */
+	if (fw_dump.ops->fadump_process(&fw_dump) < 0)
+		goto err_out;
+
+	/*
+	 * elfcorehdr is now ready to be exported.
+	 *
+	 * set elfcorehdr_addr so that vmcore module will export the
+	 * elfcorehdr through '/proc/vmcore'.
+	 */
+	elfcorehdr_addr = virt_to_phys((void *)fw_dump.elfcorehdr_addr);
+	return;
+
+err_out:
+	fadump_invalidate_release_mem();
+}
+
 /*
  * Prepare for firmware-assisted dump.
  */
@@ -1651,12 +1705,7 @@ int __init setup_fadump(void)
 	 * saving it to the disk.
 	 */
 	if (fw_dump.dump_active) {
-		/*
-		 * if dump process fails then invalidate the registration
-		 * and release memory before proceeding for re-registration.
-		 */
-		if (fw_dump.ops->fadump_process(&fw_dump) < 0)
-			fadump_invalidate_release_mem();
+		fadump_process();
 	}
 	/* Initialize the kernel dump memory structure and register with f/w */
 	else if (fw_dump.reserve_dump_area_size) {
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index 964f464b1b0e..767a6b19e42a 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -513,8 +513,8 @@ opal_fadump_build_cpu_notes(struct fw_dump *fadump_conf,
 	final_note(note_buf);
 
 	pr_debug("Updating elfcore header (%llx) with cpu notes\n",
-		 fdh->elfcorehdr_addr);
-	fadump_update_elfcore_header(__va(fdh->elfcorehdr_addr));
+		 fadump_conf->elfcorehdr_addr);
+	fadump_update_elfcore_header((char *)fadump_conf->elfcorehdr_addr);
 	return 0;
 }
 
@@ -526,12 +526,7 @@ static int __init opal_fadump_process(struct fw_dump *fadump_conf)
 	if (!opal_fdm_active || !fadump_conf->fadumphdr_addr)
 		return rc;
 
-	/* Validate the fadump crash info header */
 	fdh = __va(fadump_conf->fadumphdr_addr);
-	if (fdh->magic_number != FADUMP_CRASH_INFO_MAGIC) {
-		pr_err("Crash info header is not valid.\n");
-		return rc;
-	}
 
 #ifdef CONFIG_OPAL_CORE
 	/*
@@ -545,18 +540,7 @@ static int __init opal_fadump_process(struct fw_dump *fadump_conf)
 		kernel_initiated = true;
 #endif
 
-	rc = opal_fadump_build_cpu_notes(fadump_conf, fdh);
-	if (rc)
-		return rc;
-
-	/*
-	 * We are done validating dump info and elfcore header is now ready
-	 * to be exported. set elfcorehdr_addr so that vmcore module will
-	 * export the elfcore header through '/proc/vmcore'.
-	 */
-	elfcorehdr_addr = fdh->elfcorehdr_addr;
-
-	return rc;
+	return opal_fadump_build_cpu_notes(fadump_conf, fdh);
 }
 
 static void opal_fadump_region_show(struct fw_dump *fadump_conf,
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index b5853e9fcc3c..214f37788b2d 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -375,11 +375,8 @@ static int __init rtas_fadump_build_cpu_notes(struct fw_dump *fadump_conf)
 	}
 	final_note(note_buf);
 
-	if (fdh) {
-		pr_debug("Updating elfcore header (%llx) with cpu notes\n",
-			 fdh->elfcorehdr_addr);
-		fadump_update_elfcore_header(__va(fdh->elfcorehdr_addr));
-	}
+	pr_debug("Updating elfcore header (%llx) with cpu notes\n", fadump_conf->elfcorehdr_addr);
+	fadump_update_elfcore_header((char *)fadump_conf->elfcorehdr_addr);
 	return 0;
 
 error_out:
@@ -389,14 +386,11 @@ static int __init rtas_fadump_build_cpu_notes(struct fw_dump *fadump_conf)
 }
 
 /*
- * Validate and process the dump data stored by firmware before exporting
- * it through '/proc/vmcore'.
+ * Validate and process the dump data stored by the firmware, and update
+ * the CPU notes of elfcorehdr.
  */
 static int __init rtas_fadump_process(struct fw_dump *fadump_conf)
 {
-	struct fadump_crash_info_header *fdh;
-	int rc = 0;
-
 	if (!fdm_active || !fadump_conf->fadumphdr_addr)
 		return -EINVAL;
 
@@ -415,25 +409,7 @@ static int __init rtas_fadump_process(struct fw_dump *fadump_conf)
 		return -EINVAL;
 	}
 
-	/* Validate the fadump crash info header */
-	fdh = __va(fadump_conf->fadumphdr_addr);
-	if (fdh->magic_number != FADUMP_CRASH_INFO_MAGIC) {
-		pr_err("Crash info header is not valid.\n");
-		return -EINVAL;
-	}
-
-	rc = rtas_fadump_build_cpu_notes(fadump_conf);
-	if (rc)
-		return rc;
-
-	/*
-	 * We are done validating dump info and elfcore header is now ready
-	 * to be exported. set elfcorehdr_addr so that vmcore module will
-	 * export the elfcore header through '/proc/vmcore'.
-	 */
-	elfcorehdr_addr = fdh->elfcorehdr_addr;
-
-	return 0;
+	return rtas_fadump_build_cpu_notes(fadump_conf);
 }
 
 static void rtas_fadump_region_show(struct fw_dump *fadump_conf,
-- 
2.44.0

