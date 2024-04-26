Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2558B3015
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 08:12:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r78UmTQl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQj6w1qBHz3vt7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 16:12:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r78UmTQl;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQj3K0CZKz3dWK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 16:09:01 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4VQj3J6wByz4wbr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 16:09:00 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4VQj3J6mdXz4wcd; Fri, 26 Apr 2024 16:09:00 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r78UmTQl;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4VQj3J3mT9z4wbr
	for <linuxppc-dev@ozlabs.org>; Fri, 26 Apr 2024 16:09:00 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43Q5rusY012492;
	Fri, 26 Apr 2024 06:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cIF9SUyi9dEkmlnjqAXk0+quVfIl0oh4aKeAvVeTPpU=;
 b=r78UmTQllQczK+7nlVuLLd6eqiPcEbAQesw5fm+b/+dtrmaQHGEukSBowcJ07IJi03Dm
 e0ZOGFGECQL18FgUsA73T6KfVfPdGAMfMBL+3k85iCllPSZlnzu/DnZ8GF+ezbmxRWXs
 grH8BpaJTQeIgOSwUZa7Ur8LNvzAGZ0hp7O3D8hr+t+zNYUvA7/E0igf9cSvDnKM4zjk
 txA5uNhZuuzrHs0WioRqFQnlCPQXdfTJ4Y/FWVYxpLz6kT6mWznOGkI8V1jIQUF3hv2y
 iwM3W3VNACXLXN5kOn7zbC7bI3FtOm1q8dLdTt9ieF7Un3QSHzq2758RtGyc1CXD325p JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xr5uk046c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 06:08:26 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43Q68PVe002024;
	Fri, 26 Apr 2024 06:08:26 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xr5uk0469-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 06:08:25 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43Q56kFb023065;
	Fri, 26 Apr 2024 06:08:25 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xms1pe45a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 06:08:25 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43Q68JnG47710594
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Apr 2024 06:08:21 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0E9620040;
	Fri, 26 Apr 2024 06:08:18 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A53852004B;
	Fri, 26 Apr 2024 06:08:09 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.111.8])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Apr 2024 06:08:09 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v19 3/6] powerpc/kexec: move *_memory_ranges functions to ranges.c
Date: Fri, 26 Apr 2024 11:37:25 +0530
Message-ID: <20240426060728.559753-4-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426060728.559753-1-sourabhjain@linux.ibm.com>
References: <20240426060728.559753-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: p_so4lp6TDsTgrF7P004XNe2ORf7vc2q
X-Proofpoint-ORIG-GUID: f0Lk3nHGUH6VJFtFRGjO4eGPkoyTc7XR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_06,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404260035
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Valentin Schneider <vschneid@redhat.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the following functions form kexec/{file_load_64.c => ranges.c} and
make them public so that components other than KEXEC_FILE can also use
these functions.
1. get_exclude_memory_ranges
2. get_reserved_memory_ranges
3. get_crash_memory_ranges
4. get_usable_memory_ranges

Later in the series get_crash_memory_ranges function is utilized for
in-kernel updates to kdump image during CPU/Memory hotplug or
online/offline events for both kexec_load and kexec_file_load syscalls.

Since the above functions are moved to ranges.c, some of the helper
functions in ranges.c are no longer required to be public. Mark them as
static and removed them from kexec_ranges.h header file.

Finally, remove the CONFIG_KEXEC_FILE build dependency for range.c
because it is required for other config, such as CONFIG_CRASH_DUMP.

No functional changes are intended.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Acked-by: Hari Bathini <hbathini@linux.ibm.com>
Cc: Akhil Raj <lf32.dev@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Baoquan He <bhe@redhat.com>
Cc: Borislav Petkov (AMD) <bp@alien8.de>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Dufour <laurent.dufour@fr.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mimi Zohar <zohar@linux.ibm.com>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: kexec@lists.infradead.org
Cc: x86@kernel.org
---

* No changes in v19.

 arch/powerpc/include/asm/kexec_ranges.h |  19 +-
 arch/powerpc/kexec/Makefile             |   4 +-
 arch/powerpc/kexec/file_load_64.c       | 190 --------------------
 arch/powerpc/kexec/ranges.c             | 227 +++++++++++++++++++++++-
 4 files changed, 224 insertions(+), 216 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec_ranges.h b/arch/powerpc/include/asm/kexec_ranges.h
index f83866a19e87..8489e844b447 100644
--- a/arch/powerpc/include/asm/kexec_ranges.h
+++ b/arch/powerpc/include/asm/kexec_ranges.h
@@ -7,19 +7,8 @@
 void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
 struct crash_mem *realloc_mem_ranges(struct crash_mem **mem_ranges);
 int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
-int add_tce_mem_ranges(struct crash_mem **mem_ranges);
-int add_initrd_mem_range(struct crash_mem **mem_ranges);
-#ifdef CONFIG_PPC_64S_HASH_MMU
-int add_htab_mem_range(struct crash_mem **mem_ranges);
-#else
-static inline int add_htab_mem_range(struct crash_mem **mem_ranges)
-{
-	return 0;
-}
-#endif
-int add_kernel_mem_range(struct crash_mem **mem_ranges);
-int add_rtas_mem_range(struct crash_mem **mem_ranges);
-int add_opal_mem_range(struct crash_mem **mem_ranges);
-int add_reserved_mem_ranges(struct crash_mem **mem_ranges);
-
+int get_exclude_memory_ranges(struct crash_mem **mem_ranges);
+int get_reserved_memory_ranges(struct crash_mem **mem_ranges);
+int get_crash_memory_ranges(struct crash_mem **mem_ranges);
+int get_usable_memory_ranges(struct crash_mem **mem_ranges);
 #endif /* _ASM_POWERPC_KEXEC_RANGES_H */
diff --git a/arch/powerpc/kexec/Makefile b/arch/powerpc/kexec/Makefile
index 8e469c4da3f8..470eb0453e17 100644
--- a/arch/powerpc/kexec/Makefile
+++ b/arch/powerpc/kexec/Makefile
@@ -3,11 +3,11 @@
 # Makefile for the linux kernel.
 #
 
-obj-y				+= core.o core_$(BITS).o
+obj-y				+= core.o core_$(BITS).o ranges.o
 
 obj-$(CONFIG_PPC32)		+= relocate_32.o
 
-obj-$(CONFIG_KEXEC_FILE)	+= file_load.o ranges.o file_load_$(BITS).o elf_$(BITS).o
+obj-$(CONFIG_KEXEC_FILE)	+= file_load.o file_load_$(BITS).o elf_$(BITS).o
 obj-$(CONFIG_VMCORE_INFO)	+= vmcore_info.o
 obj-$(CONFIG_CRASH_DUMP)	+= crash.o
 
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 1bc65de6174f..6a01f62b8fcf 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -47,83 +47,6 @@ const struct kexec_file_ops * const kexec_file_loaders[] = {
 	NULL
 };
 
-/**
- * get_exclude_memory_ranges - Get exclude memory ranges. This list includes
- *                             regions like opal/rtas, tce-table, initrd,
- *                             kernel, htab which should be avoided while
- *                             setting up kexec load segments.
- * @mem_ranges:                Range list to add the memory ranges to.
- *
- * Returns 0 on success, negative errno on error.
- */
-static int get_exclude_memory_ranges(struct crash_mem **mem_ranges)
-{
-	int ret;
-
-	ret = add_tce_mem_ranges(mem_ranges);
-	if (ret)
-		goto out;
-
-	ret = add_initrd_mem_range(mem_ranges);
-	if (ret)
-		goto out;
-
-	ret = add_htab_mem_range(mem_ranges);
-	if (ret)
-		goto out;
-
-	ret = add_kernel_mem_range(mem_ranges);
-	if (ret)
-		goto out;
-
-	ret = add_rtas_mem_range(mem_ranges);
-	if (ret)
-		goto out;
-
-	ret = add_opal_mem_range(mem_ranges);
-	if (ret)
-		goto out;
-
-	ret = add_reserved_mem_ranges(mem_ranges);
-	if (ret)
-		goto out;
-
-	/* exclude memory ranges should be sorted for easy lookup */
-	sort_memory_ranges(*mem_ranges, true);
-out:
-	if (ret)
-		pr_err("Failed to setup exclude memory ranges\n");
-	return ret;
-}
-
-/**
- * get_reserved_memory_ranges - Get reserve memory ranges. This list includes
- *                              memory regions that should be added to the
- *                              memory reserve map to ensure the region is
- *                              protected from any mischief.
- * @mem_ranges:                 Range list to add the memory ranges to.
- *
- * Returns 0 on success, negative errno on error.
- */
-static int get_reserved_memory_ranges(struct crash_mem **mem_ranges)
-{
-	int ret;
-
-	ret = add_rtas_mem_range(mem_ranges);
-	if (ret)
-		goto out;
-
-	ret = add_tce_mem_ranges(mem_ranges);
-	if (ret)
-		goto out;
-
-	ret = add_reserved_mem_ranges(mem_ranges);
-out:
-	if (ret)
-		pr_err("Failed to setup reserved memory ranges\n");
-	return ret;
-}
-
 /**
  * __locate_mem_hole_top_down - Looks top down for a large enough memory hole
  *                              in the memory regions between buf_min & buf_max
@@ -322,119 +245,6 @@ static int locate_mem_hole_bottom_up_ppc64(struct kexec_buf *kbuf,
 }
 
 #ifdef CONFIG_CRASH_DUMP
-/**
- * get_usable_memory_ranges - Get usable memory ranges. This list includes
- *                            regions like crashkernel, opal/rtas & tce-table,
- *                            that kdump kernel could use.
- * @mem_ranges:               Range list to add the memory ranges to.
- *
- * Returns 0 on success, negative errno on error.
- */
-static int get_usable_memory_ranges(struct crash_mem **mem_ranges)
-{
-	int ret;
-
-	/*
-	 * Early boot failure observed on guests when low memory (first memory
-	 * block?) is not added to usable memory. So, add [0, crashk_res.end]
-	 * instead of [crashk_res.start, crashk_res.end] to workaround it.
-	 * Also, crashed kernel's memory must be added to reserve map to
-	 * avoid kdump kernel from using it.
-	 */
-	ret = add_mem_range(mem_ranges, 0, crashk_res.end + 1);
-	if (ret)
-		goto out;
-
-	ret = add_rtas_mem_range(mem_ranges);
-	if (ret)
-		goto out;
-
-	ret = add_opal_mem_range(mem_ranges);
-	if (ret)
-		goto out;
-
-	ret = add_tce_mem_ranges(mem_ranges);
-out:
-	if (ret)
-		pr_err("Failed to setup usable memory ranges\n");
-	return ret;
-}
-
-/**
- * get_crash_memory_ranges - Get crash memory ranges. This list includes
- *                           first/crashing kernel's memory regions that
- *                           would be exported via an elfcore.
- * @mem_ranges:              Range list to add the memory ranges to.
- *
- * Returns 0 on success, negative errno on error.
- */
-static int get_crash_memory_ranges(struct crash_mem **mem_ranges)
-{
-	phys_addr_t base, end;
-	struct crash_mem *tmem;
-	u64 i;
-	int ret;
-
-	for_each_mem_range(i, &base, &end) {
-		u64 size = end - base;
-
-		/* Skip backup memory region, which needs a separate entry */
-		if (base == BACKUP_SRC_START) {
-			if (size > BACKUP_SRC_SIZE) {
-				base = BACKUP_SRC_END + 1;
-				size -= BACKUP_SRC_SIZE;
-			} else
-				continue;
-		}
-
-		ret = add_mem_range(mem_ranges, base, size);
-		if (ret)
-			goto out;
-
-		/* Try merging adjacent ranges before reallocation attempt */
-		if ((*mem_ranges)->nr_ranges == (*mem_ranges)->max_nr_ranges)
-			sort_memory_ranges(*mem_ranges, true);
-	}
-
-	/* Reallocate memory ranges if there is no space to split ranges */
-	tmem = *mem_ranges;
-	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
-		tmem = realloc_mem_ranges(mem_ranges);
-		if (!tmem)
-			goto out;
-	}
-
-	/* Exclude crashkernel region */
-	ret = crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);
-	if (ret)
-		goto out;
-
-	/*
-	 * FIXME: For now, stay in parity with kexec-tools but if RTAS/OPAL
-	 *        regions are exported to save their context at the time of
-	 *        crash, they should actually be backed up just like the
-	 *        first 64K bytes of memory.
-	 */
-	ret = add_rtas_mem_range(mem_ranges);
-	if (ret)
-		goto out;
-
-	ret = add_opal_mem_range(mem_ranges);
-	if (ret)
-		goto out;
-
-	/* create a separate program header for the backup region */
-	ret = add_mem_range(mem_ranges, BACKUP_SRC_START, BACKUP_SRC_SIZE);
-	if (ret)
-		goto out;
-
-	sort_memory_ranges(*mem_ranges, false);
-out:
-	if (ret)
-		pr_err("Failed to setup crash memory ranges\n");
-	return ret;
-}
-
 /**
  * check_realloc_usable_mem - Reallocate buffer if it can't accommodate entries
  * @um_info:                  Usable memory buffer and ranges info.
diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
index 33b780049aaf..b1f4267d9b17 100644
--- a/arch/powerpc/kexec/ranges.c
+++ b/arch/powerpc/kexec/ranges.c
@@ -20,9 +20,13 @@
 #include <linux/kexec.h>
 #include <linux/of.h>
 #include <linux/slab.h>
+#include <linux/memblock.h>
+#include <linux/crash_core.h>
 #include <asm/sections.h>
 #include <asm/kexec_ranges.h>
+#include <asm/crashdump-ppc64.h>
 
+#if defined(CONFIG_KEXEC_FILE) || defined(CONFIG_CRASH_DUMP)
 /**
  * get_max_nr_ranges - Get the max no. of ranges crash_mem structure
  *                     could hold, given the size allocated for it.
@@ -234,13 +238,16 @@ int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
 	return __add_mem_range(mem_ranges, base, size);
 }
 
+#endif /* CONFIG_KEXEC_FILE || CONFIG_CRASH_DUMP */
+
+#ifdef CONFIG_KEXEC_FILE
 /**
  * add_tce_mem_ranges - Adds tce-table range to the given memory ranges list.
  * @mem_ranges:         Range list to add the memory range(s) to.
  *
  * Returns 0 on success, negative errno on error.
  */
-int add_tce_mem_ranges(struct crash_mem **mem_ranges)
+static int add_tce_mem_ranges(struct crash_mem **mem_ranges)
 {
 	struct device_node *dn = NULL;
 	int ret = 0;
@@ -279,7 +286,7 @@ int add_tce_mem_ranges(struct crash_mem **mem_ranges)
  *
  * Returns 0 on success, negative errno on error.
  */
-int add_initrd_mem_range(struct crash_mem **mem_ranges)
+static int add_initrd_mem_range(struct crash_mem **mem_ranges)
 {
 	u64 base, end;
 	int ret;
@@ -296,7 +303,6 @@ int add_initrd_mem_range(struct crash_mem **mem_ranges)
 	return ret;
 }
 
-#ifdef CONFIG_PPC_64S_HASH_MMU
 /**
  * add_htab_mem_range - Adds htab range to the given memory ranges list,
  *                      if it exists
@@ -304,14 +310,18 @@ int add_initrd_mem_range(struct crash_mem **mem_ranges)
  *
  * Returns 0 on success, negative errno on error.
  */
-int add_htab_mem_range(struct crash_mem **mem_ranges)
+static int add_htab_mem_range(struct crash_mem **mem_ranges)
 {
+
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	if (!htab_address)
 		return 0;
 
 	return add_mem_range(mem_ranges, __pa(htab_address), htab_size_bytes);
-}
+#else
+	return 0;
 #endif
+}
 
 /**
  * add_kernel_mem_range - Adds kernel text region to the given
@@ -320,18 +330,20 @@ int add_htab_mem_range(struct crash_mem **mem_ranges)
  *
  * Returns 0 on success, negative errno on error.
  */
-int add_kernel_mem_range(struct crash_mem **mem_ranges)
+static int add_kernel_mem_range(struct crash_mem **mem_ranges)
 {
 	return add_mem_range(mem_ranges, 0, __pa(_end));
 }
+#endif /* CONFIG_KEXEC_FILE */
 
+#if defined(CONFIG_KEXEC_FILE) || defined(CONFIG_CRASH_DUMP)
 /**
  * add_rtas_mem_range - Adds RTAS region to the given memory ranges list.
  * @mem_ranges:         Range list to add the memory range to.
  *
  * Returns 0 on success, negative errno on error.
  */
-int add_rtas_mem_range(struct crash_mem **mem_ranges)
+static int add_rtas_mem_range(struct crash_mem **mem_ranges)
 {
 	struct device_node *dn;
 	u32 base, size;
@@ -356,7 +368,7 @@ int add_rtas_mem_range(struct crash_mem **mem_ranges)
  *
  * Returns 0 on success, negative errno on error.
  */
-int add_opal_mem_range(struct crash_mem **mem_ranges)
+static int add_opal_mem_range(struct crash_mem **mem_ranges)
 {
 	struct device_node *dn;
 	u64 base, size;
@@ -374,7 +386,9 @@ int add_opal_mem_range(struct crash_mem **mem_ranges)
 	of_node_put(dn);
 	return ret;
 }
+#endif /* CONFIG_KEXEC_FILE || CONFIG_CRASH_DUMP */
 
+#ifdef CONFIG_KEXEC_FILE
 /**
  * add_reserved_mem_ranges - Adds "/reserved-ranges" regions exported by f/w
  *                           to the given memory ranges list.
@@ -382,7 +396,7 @@ int add_opal_mem_range(struct crash_mem **mem_ranges)
  *
  * Returns 0 on success, negative errno on error.
  */
-int add_reserved_mem_ranges(struct crash_mem **mem_ranges)
+static int add_reserved_mem_ranges(struct crash_mem **mem_ranges)
 {
 	int n_mem_addr_cells, n_mem_size_cells, i, len, cells, ret = 0;
 	struct device_node *root = of_find_node_by_path("/");
@@ -412,3 +426,198 @@ int add_reserved_mem_ranges(struct crash_mem **mem_ranges)
 
 	return ret;
 }
+
+/**
+ * get_reserved_memory_ranges - Get reserve memory ranges. This list includes
+ *                              memory regions that should be added to the
+ *                              memory reserve map to ensure the region is
+ *                              protected from any mischief.
+ * @mem_ranges:                 Range list to add the memory ranges to.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int get_reserved_memory_ranges(struct crash_mem **mem_ranges)
+{
+	int ret;
+
+	ret = add_rtas_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_tce_mem_ranges(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_reserved_mem_ranges(mem_ranges);
+out:
+	if (ret)
+		pr_err("Failed to setup reserved memory ranges\n");
+	return ret;
+}
+
+/**
+ * get_exclude_memory_ranges - Get exclude memory ranges. This list includes
+ *                             regions like opal/rtas, tce-table, initrd,
+ *                             kernel, htab which should be avoided while
+ *                             setting up kexec load segments.
+ * @mem_ranges:                Range list to add the memory ranges to.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int get_exclude_memory_ranges(struct crash_mem **mem_ranges)
+{
+	int ret;
+
+	ret = add_tce_mem_ranges(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_initrd_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_htab_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_kernel_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_rtas_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_opal_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_reserved_mem_ranges(mem_ranges);
+	if (ret)
+		goto out;
+
+	/* exclude memory ranges should be sorted for easy lookup */
+	sort_memory_ranges(*mem_ranges, true);
+out:
+	if (ret)
+		pr_err("Failed to setup exclude memory ranges\n");
+	return ret;
+}
+
+#ifdef CONFIG_CRASH_DUMP
+/**
+ * get_usable_memory_ranges - Get usable memory ranges. This list includes
+ *                            regions like crashkernel, opal/rtas & tce-table,
+ *                            that kdump kernel could use.
+ * @mem_ranges:               Range list to add the memory ranges to.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int get_usable_memory_ranges(struct crash_mem **mem_ranges)
+{
+	int ret;
+
+	/*
+	 * Early boot failure observed on guests when low memory (first memory
+	 * block?) is not added to usable memory. So, add [0, crashk_res.end]
+	 * instead of [crashk_res.start, crashk_res.end] to workaround it.
+	 * Also, crashed kernel's memory must be added to reserve map to
+	 * avoid kdump kernel from using it.
+	 */
+	ret = add_mem_range(mem_ranges, 0, crashk_res.end + 1);
+	if (ret)
+		goto out;
+
+	ret = add_rtas_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_opal_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_tce_mem_ranges(mem_ranges);
+out:
+	if (ret)
+		pr_err("Failed to setup usable memory ranges\n");
+	return ret;
+}
+#endif /* CONFIG_CRASH_DUMP */
+#endif /* CONFIG_KEXEC_FILE */
+
+#ifdef CONFIG_CRASH_DUMP
+/**
+ * get_crash_memory_ranges - Get crash memory ranges. This list includes
+ *                           first/crashing kernel's memory regions that
+ *                           would be exported via an elfcore.
+ * @mem_ranges:              Range list to add the memory ranges to.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int get_crash_memory_ranges(struct crash_mem **mem_ranges)
+{
+	phys_addr_t base, end;
+	struct crash_mem *tmem;
+	u64 i;
+	int ret;
+
+	for_each_mem_range(i, &base, &end) {
+		u64 size = end - base;
+
+		/* Skip backup memory region, which needs a separate entry */
+		if (base == BACKUP_SRC_START) {
+			if (size > BACKUP_SRC_SIZE) {
+				base = BACKUP_SRC_END + 1;
+				size -= BACKUP_SRC_SIZE;
+			} else
+				continue;
+		}
+
+		ret = add_mem_range(mem_ranges, base, size);
+		if (ret)
+			goto out;
+
+		/* Try merging adjacent ranges before reallocation attempt */
+		if ((*mem_ranges)->nr_ranges == (*mem_ranges)->max_nr_ranges)
+			sort_memory_ranges(*mem_ranges, true);
+	}
+
+	/* Reallocate memory ranges if there is no space to split ranges */
+	tmem = *mem_ranges;
+	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
+		tmem = realloc_mem_ranges(mem_ranges);
+		if (!tmem)
+			goto out;
+	}
+
+	/* Exclude crashkernel region */
+	ret = crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);
+	if (ret)
+		goto out;
+
+	/*
+	 * FIXME: For now, stay in parity with kexec-tools but if RTAS/OPAL
+	 *        regions are exported to save their context at the time of
+	 *        crash, they should actually be backed up just like the
+	 *        first 64K bytes of memory.
+	 */
+	ret = add_rtas_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_opal_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	/* create a separate program header for the backup region */
+	ret = add_mem_range(mem_ranges, BACKUP_SRC_START, BACKUP_SRC_SIZE);
+	if (ret)
+		goto out;
+
+	sort_memory_ranges(*mem_ranges, false);
+out:
+	if (ret)
+		pr_err("Failed to setup crash memory ranges\n");
+	return ret;
+}
+#endif /* CONFIG_CRASH_DUMP */
-- 
2.44.0

