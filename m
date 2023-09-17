Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 406027A343A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Sep 2023 10:04:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YP/m/Add;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RpL6r1HKwz3cgv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Sep 2023 18:04:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YP/m/Add;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RpL510Dbyz3bNm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Sep 2023 18:02:45 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RpL4z2HGPz4x5r
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Sep 2023 18:02:43 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RpL4z29q6z4x5j; Sun, 17 Sep 2023 18:02:43 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YP/m/Add;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RpL4y1dt9z4x3j;
	Sun, 17 Sep 2023 18:02:41 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38H7ca0O027262;
	Sun, 17 Sep 2023 08:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9I/p6273+ABDdyejIka3rguDzjlcWHayTppRB80zPDU=;
 b=YP/m/AddNoXOPot+jCvN4cZ4s5vu11tp2Ny2VXooNshcXP6JdjAifVXWwPAAuo5/p7xW
 seDlbXZTuZrDGUw4LsYzNqTLS5F1aTDUJugoFedhugtpDzqXpBFbU33AbJnC4bCl4P6n
 swhx0APzSvtcENfuljUdb67EjWNcboJiM3erfl5AMHds2ROIwKPEuUz3dpIsINawMJnk
 FYzi1NxjcXCKr+laJafWc1LmlfVipRz22er9EVjTLdF967evwFco2rUtuQyIyf959OHh
 Z9g66HhbRAErQ6V1yaQjjR92i/k8lqKxTuNLoYq0v6vlvyR2rqZE32ENUwco4N7rfafV 0w== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t54c5pj57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Sep 2023 08:02:38 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38H56b1s031177;
	Sun, 17 Sep 2023 08:02:38 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t5r6k1nuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Sep 2023 08:02:37 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38H82Y5363504760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 17 Sep 2023 08:02:34 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4BF992004B;
	Sun, 17 Sep 2023 08:02:34 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF68820040;
	Sun, 17 Sep 2023 08:02:31 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.102.48])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 17 Sep 2023 08:02:31 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 1/3] powerpc: make fadump resilient with memory add/remove events
Date: Sun, 17 Sep 2023 13:32:23 +0530
Message-ID: <20230917080225.561627-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230917080225.561627-1-sourabhjain@linux.ibm.com>
References: <20230917080225.561627-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2wrlctPhkniBdbdPfThZdBhKww1oXSLr
X-Proofpoint-ORIG-GUID: 2wrlctPhkniBdbdPfThZdBhKww1oXSLr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_20,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309170070
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
Cc: mahesh@linux.vnet.ibm.com, adityag@linux.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Due to changes in memory resources caused by either memory hotplug or
online/offline events, the elfcorehdr, which describes the CPUs and
memory of the crashed kernel to the kernel that collects the dump (knows
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
   elfcorehdr is later recreated with to additional memblock regions,
   its size will increase, potentially leading to memory corruption.

Address the aforementioned challenges by shifting the creation of
elfcorehdr from the first kernel (also referred as the crashed kernel),
where it was created and frequently recreated for every memory
add/remove event, to the fadump kernel. As a result, the elfcorehdr only
needs to be created once, thus eliminating the necessity to re-register
fadump during memory add/remove events.

At present, the first kernel prepares the elfcorehdr and stores it in
the fadump reserved area. Subsequently, it includes the start address of
the elfcorehdr in the elfcorehdr_addr attribute of the fadump header.
The fadump header holds information like elfcorehdr address, crashing
CPU details, etc. The first kernel prepares the fadump header and stores
it in the fadump reserved area. In the event of first kernel crash the
second boots and access the fadump header prepared by first kernel and
do the following in a platform-specific fucntion
[rtas|opal]_fadump_process:

1. Sanity check for fadump header
2. Update CPU notes in elfcorehdr
3. Set the global variable elfcorehdr_addr to the address of the
   fadump header's elfcorehdr. For vmcore module to process it later on.

Along with the above, update the setup_fadump()/fadump.c to create
elfcorehdr in second/fadump kernel.

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
the crashed kernel's vmcoreinfo address and size to the fadump kernel.

Table 1 below illustrates kernel's ability to collect dump if either the
first/crashed kernel or the second/fadump kernel does not have the
changes introduced here. Consider the 'old kernel' as the kernel without
this patch, and the 'new kernel' as the kernel with this patch included.

+----------+------------------------+------------------------+-------+
| scenario |  first/crashed kernel  |  second/fadump kernel  |  Dump |
+----------+------------------------+------------------------+-------+
|    1     |       old kernel       |        new kernel      |  Yes  |
+----------+------------------------+------------------------+-------+
|    2     |       new kernel       |        old kernel      |  No   |
+----------+------------------------+------------------------+-------+

			      Table 1

Scenario 1:
-----------
Since the magic number of fadump header is updated, the second kernel
can differentiate the crashed kernel is of type 'new kernel' or
'old kernel' and act accordingly. In this scenario, since the crashed
kernel is of type 'old kernel,' the fadump kernel skips elfcorehdr
creation and uses the one prepared in the first kernel itself to collect
the dump.

Scenario 2:
-----------
Since 'old kernel' as the fadump kernel is NOT capable of processing
fadump header with updated magic number from 'new kernel' hence it
gracefully fails with the below error and dump collection fails in this
scenario.

[    0.007365] rtas fadump: Crash info header is not valid.

Add a version field to the fadump_crash_info_header structure to avoid
the need to change its magic number in the future. Adding a version
field to the fadump header was one of the TODO items listed in
Documentation/powerpc/firmware-assisted-dump.rst.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/fadump-internal.h   |  24 +-
 arch/powerpc/kernel/fadump.c                 | 356 +++++++++++--------
 arch/powerpc/platforms/powernv/opal-fadump.c |  18 +-
 arch/powerpc/platforms/pseries/rtas-fadump.c |  23 +-
 4 files changed, 238 insertions(+), 183 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index 27f9e11eda28..7be3d8894520 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -42,7 +42,25 @@ static inline u64 fadump_str_to_u64(const char *str)
 
 #define FADUMP_CPU_UNKNOWN		(~((u32)0))
 
-#define FADUMP_CRASH_INFO_MAGIC		fadump_str_to_u64("FADMPINF")
+/*
+ * The introduction of new fields in the fadump crash info header has
+ * led to a change in the magic key, from `FADMPINF` to `FADMPSIG`.
+ * This alteration ensures backward compatibility, enabling the kernel
+ * with the updated fadump crash info to handle kernel dumps from older
+ * kernels.
+ *
+ * To prevent the need for further changes to the magic number in the
+ * event of future modifications to the fadump header, a version field
+ * has been introduced to track the fadump crash info header version.
+ *
+ * Historically, there was no connection between the magic number and
+ * the fadump crash info header version. However, moving forward, the
+ * `FADMPINF` magic number in header will be treated as version 0, while
+ * the `FADMPSIG` magic number in header will include a version field to
+ * determine its version.
+ */
+#define FADUMP_CRASH_INFO_MAGIC		fadump_str_to_u64("FADMPSIG")
+#define FADUMP_VERSION			1
 
 /* fadump crash info structure */
 struct fadump_crash_info_header {
@@ -51,6 +69,10 @@ struct fadump_crash_info_header {
 	u32		crashing_cpu;
 	struct pt_regs	regs;
 	struct cpumask	cpu_mask;
+	u32		version;
+	u64		elfcorehdr_size;
+	u64		vmcoreinfo_raddr;
+	u64		vmcoreinfo_size;
 };
 
 struct fadump_memory_range {
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 3ff2da7b120b..23c4c65b0f1a 100644
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
@@ -1073,13 +989,28 @@ static inline unsigned long fadump_relocate(unsigned long paddr)
 	return raddr;
 }
 
-static int fadump_create_elfcore_headers(char *bufp)
+static void populate_elf_pt_load(struct elf_phdr *phdr, u64 start,
+			     u64 size, unsigned long long offset)
 {
-	unsigned long long raddr, offset;
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
 	struct elf_phdr *phdr;
 	struct elfhdr *elf;
-	int i, j;
+	u64 boot_mem_dest_addr;
+	unsigned long long i, ra_start, ra_end, ra_size, mstart, mend;
 
+	bufp = (char *) fdh->elfcorehdr_addr;
 	fadump_init_elfcore_header(bufp);
 	elf = (struct elfhdr *)bufp;
 	bufp += sizeof(struct elfhdr);
@@ -1113,54 +1044,69 @@ static int fadump_create_elfcore_headers(char *bufp)
 	phdr->p_vaddr	= 0;
 	phdr->p_align	= 0;
 
-	phdr->p_paddr	= fadump_relocate(paddr_vmcoreinfo_note());
-	phdr->p_offset	= phdr->p_paddr;
-	phdr->p_memsz	= phdr->p_filesz = VMCOREINFO_NOTE_SIZE;
+	phdr->p_paddr 	= phdr->p_offset = fdh->vmcoreinfo_raddr;
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
+	 * setup PT_LOAD sections.
+	 * first include boot memory regions and then add rest of the memory
+	 * regions
+	 */
+	boot_mem_dest_addr = fw_dump.boot_mem_dest_addr;
+	for (i = 0; i < fw_dump.boot_mem_regs_cnt; i++)
+	{
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
+				 fw_dump.boot_mem_sz[i],
+				 boot_mem_dest_addr);
+		/* Increment number of program headers. */
+		(elf->e_phnum)++;
+		boot_mem_dest_addr += fw_dump.boot_mem_sz[i];
+	}
+
+	/* Memory reserved for fadump in first kernel */
+	ra_start = fw_dump.reserve_dump_area_start;
+	ra_size = get_fadump_area_size();
+	ra_end = ra_start + ra_size;
+
+	phdr = (struct elf_phdr *)bufp;
+	for_each_mem_range(i, &mstart, &mend) {
+		/*
+		 * Skip the memory regions that already added
+		 * to elfcorehdr.
+		 */
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
+		/* Handle memblock regions overlaps with reserved area */
+		if ((ra_start < mend) && (ra_end > mstart)) {
+			if ((mstart < ra_start) && (mend > ra_end)) {
+				populate_elf_pt_load(phdr, mstart, ra_start - mstart, mstart);
+				elf->e_phnum++;
+				bufp += sizeof(struct elf_phdr);
+				phdr = (struct elf_phdr *)bufp;
+				populate_elf_pt_load(phdr, ra_end, mend - ra_end, ra_end);
+			} else if (mstart < ra_start) {
+				populate_elf_pt_load(phdr, mstart, ra_start - mstart, mstart);
+			} else if (ra_end < mend) {
+				populate_elf_pt_load(phdr, ra_end, mend - ra_end, ra_end);
+			}
+		} else {
+			populate_elf_pt_load(phdr, mstart, mend - mstart, mstart);
+		}
 
-		/* Increment number of program headers. */
-		(elf->e_phnum)++;
+		elf->e_phnum++;
+		bufp += sizeof(struct elf_phdr);
+		phdr = (struct elf_phdr *) bufp;
 	}
-	return 0;
 }
 
 static unsigned long init_fadump_header(unsigned long addr)
@@ -1175,9 +1121,16 @@ static unsigned long init_fadump_header(unsigned long addr)
 
 	memset(fdh, 0, sizeof(struct fadump_crash_info_header));
 	fdh->magic_number = FADUMP_CRASH_INFO_MAGIC;
-	fdh->elfcorehdr_addr = addr;
+	/* Elfcorehdr will now be prepared in the second kernel. */
+	fdh->elfcorehdr_addr = 0;
 	/* We will set the crashing cpu id in crash_fadump() during crash. */
 	fdh->crashing_cpu = FADUMP_CPU_UNKNOWN;
+	fdh->version = FADUMP_VERSION;
+
+	/* Need below vmcoreinfo in second kernel to prepare elfcorehdr. */
+	fdh->vmcoreinfo_raddr = fadump_relocate(paddr_vmcoreinfo_note());
+	fdh->vmcoreinfo_size = VMCOREINFO_NOTE_SIZE;
+
 	/*
 	 * When LPAR is terminated by PYHP, ensure all possible CPUs'
 	 * register data is processed while exporting the vmcore.
@@ -1190,8 +1143,6 @@ static unsigned long init_fadump_header(unsigned long addr)
 static int register_fadump(void)
 {
 	unsigned long addr;
-	void *vaddr;
-	int ret;
 
 	/*
 	 * If no memory is reserved then we can not register for firmware-
@@ -1200,18 +1151,10 @@ static int register_fadump(void)
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
@@ -1230,7 +1173,6 @@ void fadump_cleanup(void)
 	} else if (fw_dump.dump_registered) {
 		/* Un-register Firmware-assisted dump if it was registered. */
 		fw_dump.ops->fadump_unregister(&fw_dump);
-		fadump_free_mem_ranges(&crash_mrange_info);
 	}
 
 	if (fw_dump.ops->fadump_cleanup)
@@ -1416,6 +1358,50 @@ static void fadump_release_memory(u64 begin, u64 end)
 		fadump_release_reserved_area(tstart, end);
 }
 
+/*
+ * To determine fadump header version, the following conditions apply
+ * - If magic_number is FADMPINF, return 0
+ * - If magic_number is FADMPSIG, return the version value.
+ * - Otherwise, return -E (header is not valid).
+ */
+static u32 get_fadump_crash_header_version(struct fadump_crash_info_header *fdh)
+{
+	if (fdh->magic_number == fadump_str_to_u64("FADMPINF"))
+		return 0;
+	else if (fdh->magic_number == FADUMP_CRASH_INFO_MAGIC)
+		return fdh->version;
+
+	return -EINVAL;
+}
+
+static void fadump_free_elfcorehdr_buf(void)
+{
+	struct fadump_crash_info_header *fdh;
+
+	if(!fw_dump.fadumphdr_addr)
+		return;
+
+	fdh = (struct fadump_crash_info_header *) __va(fw_dump.fadumphdr_addr);
+
+	/* For fadump version 1 the memory for elfcorehdr is dynamically
+	 * allocated in second kernel so free it. */
+	if (get_fadump_crash_header_version(fdh) != 1)
+		return;
+
+	if (fdh->elfcorehdr_addr == 0 || fdh->elfcorehdr_size == 0)
+		return;
+
+	/*
+	 * Reset the global `elfcoredhr_add` before freeing `elfcorehdr`
+	 * memory so that other kernel modules, like `vmcore`, do not
+	 * access the invalid memory.
+	 */
+	elfcorehdr_addr = ELFCORE_ADDR_MAX;
+	fadump_free_buffer(fdh->elfcorehdr_addr, fdh->elfcorehdr_size);
+	fdh->elfcorehdr_addr = 0;
+	fdh->elfcorehdr_size = 0;
+}
+
 static void fadump_invalidate_release_mem(void)
 {
 	mutex_lock(&fadump_mutex);
@@ -1424,6 +1410,8 @@ static void fadump_invalidate_release_mem(void)
 		return;
 	}
 
+	/* Free elfcorehdr buf before cleaning up the fadump reserved area. */
+	fadump_free_elfcorehdr_buf();
 	fadump_cleanup();
 	mutex_unlock(&fadump_mutex);
 
@@ -1632,6 +1620,93 @@ static void __init fadump_init_files(void)
 	return;
 }
 
+static int __init fadump_setup_elfcorehdr_buf(struct fadump_crash_info_header *fdh)
+{
+	char *bufp;
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
+	bufp = (char *)fadump_alloc_buffer(elfcorehdr_size);
+	if (!bufp) {
+		pr_err("Failed to allocate %lu bytes for elfcorehdr\n",
+		       elfcorehdr_size);
+		return -ENOMEM;
+	}
+	fdh->elfcorehdr_addr = (u64)bufp;
+	fdh->elfcorehdr_size = elfcorehdr_size;
+	return 0;
+}
+
+/*
+ * Process an active dump in four steps. First, verify the crash info header
+ * signature/magic number for integrity and accuracy. Second, if the fadump
+ * version is greater than 0, prepare the elfcorehdr; for fadump version 0,
+ * it's already created in the first kernel as part of the fadump reserved
+ * area. Third, let the platform update CPU notes in elfcorehdr. Finally,
+ * set elfcorehdr_addr so that the vmcore module can export the elfcore
+ * header through '/proc/vmcore'.
+ */
+static void process_fadump(void)
+{
+	int fadump_version;
+	struct fadump_crash_info_header *fdh;
+
+	fdh = (struct fadump_crash_info_header *) __va(fw_dump.fadumphdr_addr);
+	if (!fdh) {
+		pr_err("Crash info header is empty.\n");
+		goto err_out;
+	}
+
+	fadump_version = get_fadump_crash_header_version(fdh);
+
+	/*
+	 * fadump version zero indicates that fadump crash info header
+	 * is corrupted.
+	 */
+	if (fadump_version < 0) {
+		pr_err("Crash info header is not valid.\n");
+		goto err_out;
+	}
+
+	/*
+	 * If crashed kernel's fadump crash info header version is 1,
+	 * then create elfcorehdr here.
+	 */
+	if (fadump_version >= 1) {
+		if (fadump_setup_elfcorehdr_buf(fdh))
+			goto err_out;
+
+		fadump_populate_elfcorehdr(fdh);
+	}
+
+	/*
+	 * If dump process fails then invalidate the registration
+	 * and release memory before proceeding for re-registration.
+	 */
+	if (fw_dump.ops->fadump_process(&fw_dump) < 0)
+		goto err_out;
+
+	/*
+	 * elfcore header is now ready to be exported.
+	 *
+	 * set elfcorehdr_addr so that vmcore module will export the
+	 * elfcore header through '/proc/vmcore'.
+	 */
+	elfcorehdr_addr = fdh->elfcorehdr_addr;
+	return;
+
+err_out:
+	fadump_invalidate_release_mem();
+}
+
 /*
  * Prepare for firmware-assisted dump.
  */
@@ -1651,12 +1726,7 @@ int __init setup_fadump(void)
 	 * saving it to the disk.
 	 */
 	if (fw_dump.dump_active) {
-		/*
-		 * if dump process fails then invalidate the registration
-		 * and release memory before proceeding for re-registration.
-		 */
-		if (fw_dump.ops->fadump_process(&fw_dump) < 0)
-			fadump_invalidate_release_mem();
+		process_fadump();
 	}
 	/* Initialize the kernel dump memory structure and register with f/w */
 	else if (fw_dump.reserve_dump_area_size) {
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index 964f464b1b0e..a44d75cefc9e 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
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
index b5853e9fcc3c..3366082705d5 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -394,9 +394,6 @@ static int __init rtas_fadump_build_cpu_notes(struct fw_dump *fadump_conf)
  */
 static int __init rtas_fadump_process(struct fw_dump *fadump_conf)
 {
-	struct fadump_crash_info_header *fdh;
-	int rc = 0;
-
 	if (!fdm_active || !fadump_conf->fadumphdr_addr)
 		return -EINVAL;
 
@@ -415,25 +412,7 @@ static int __init rtas_fadump_process(struct fw_dump *fadump_conf)
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
2.41.0

