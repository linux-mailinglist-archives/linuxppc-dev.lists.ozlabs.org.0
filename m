Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7038B1315CF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 17:12:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47s0s46KQbzDqGh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 03:12:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47s0qD0P0KzDqFZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 03:10:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47s0qC62tBz8t59
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 03:10:47 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47s0qC5VzNz9sR1; Tue,  7 Jan 2020 03:10:47 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47s0qB6c9Xz9sQp
 for <linuxppc-dev@ozlabs.org>; Tue,  7 Jan 2020 03:10:46 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 92B91AE8A;
 Mon,  6 Jan 2020 16:10:42 +0000 (UTC)
Date: Mon, 6 Jan 2020 17:10:41 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Mahesh Jagannath Salgaonkar <mahesh@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] powerpc: avoid adjusting memory_limit for capture
 kernel memory reservation
Message-ID: <20200106161041.GU4113@kitsune.suse.cz>
References: <156166326909.13320.3330203549978146193.stgit@hbathini.in.ibm.com>
 <156166327993.13320.10788410344711883330.stgit@hbathini.in.ibm.com>
 <20190722194923.4be2a1be@naga.suse.cz>
 <eea7ef41-9067-ceb4-1b57-13aee705ba91@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eea7ef41-9067-ceb4-1b57-13aee705ba91@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 24, 2019 at 11:26:59AM +0530, Mahesh Jagannath Salgaonkar wrote:
> On 7/22/19 11:19 PM, Michal Suchánek wrote:
> > On Fri, 28 Jun 2019 00:51:19 +0530
> > Hari Bathini <hbathini@linux.ibm.com> wrote:
> > 
> >> Currently, if memory_limit is specified and it overlaps with memory to
> >> be reserved for capture kernel, memory_limit is adjusted to accommodate
> >> capture kernel. With memory reservation for capture kernel moved later
> >> (after enforcing memory limit), this adjustment no longer holds water.
> >> So, avoid adjusting memory_limit and error out instead.
> > 
> > Can you split out the memory limit adjustment out of memory reservation
> > so it can still be adjusted?
> 
> Do you mean adjust the memory limit before we do the actual reservation ?

Yes, without that you get a regression in ability to enable fadump with
limited memory - something like the below patch should fix it. Then
again, there is no code to un-move the memory_limit in case the allocation
fails, and we now have cma allocation which is dubious to allocate
beyond memory_limit. So maybe removing the memory_limit adjustment is a
bugfix removing 'feature' that has bitrotten over time.

Thanks

Michal

From: Michal Suchanek <msuchanek@suse.de>
Date: Mon, 6 Jan 2020 14:55:40 +0100
Subject: [PATCH 2/2] powerpc/fadump: adjust memlimit before MMU early init

Moving the farump memory reservation before early MMU init makes the
memlimit adjustment to make room for fadump ineffective.

Move the adjustment back before early MMU init.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/powerpc/include/asm/fadump.h |  3 +-
 arch/powerpc/kernel/fadump.c      | 80 +++++++++++++++++++++++--------
 arch/powerpc/kernel/prom.c        |  3 ++
 3 files changed, 66 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm/fadump.h
index 526a6a647312..76d3cbe1379c 100644
--- a/arch/powerpc/include/asm/fadump.h
+++ b/arch/powerpc/include/asm/fadump.h
@@ -30,6 +30,7 @@ static inline void fadump_cleanup(void) { }
 #if defined(CONFIG_FA_DUMP) || defined(CONFIG_PRESERVE_FA_DUMP)
 extern int early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
 				      int depth, void *data);
-extern int fadump_reserve_mem(void);
+int fadump_adjust_memlimit(void);
+int fadump_reserve_mem(void);
 #endif
 #endif /* _ASM_POWERPC_FADUMP_H */
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 8ad6d8d1cdbe..4d76452dcb3d 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -431,19 +431,22 @@ static int __init fadump_get_boot_mem_regions(void)
 	return ret;
 }
 
-int __init fadump_reserve_mem(void)
+static inline u64 fadump_get_reserve_alignment(void)
 {
-	u64 base, size, mem_boundary, bootmem_min, align = PAGE_SIZE;
-	bool is_memblock_bottom_up = memblock_bottom_up();
-	int ret = 1;
+	u64 align = PAGE_SIZE;
 
-	if (!fw_dump.fadump_enabled)
-		return 0;
+#ifdef CONFIG_CMA
+	if (!fw_dump.nocma)
+		align = FADUMP_CMA_ALIGNMENT;
+#endif
 
-	if (!fw_dump.fadump_supported) {
-		pr_info("Firmware-Assisted Dump is not supported on this hardware\n");
-		goto error_out;
-	}
+	return align;
+}
+
+static inline u64 fadump_get_bootmem_min(void)
+{
+	u64 bootmem_min = 0;
+	u64 align = fadump_get_reserve_alignment();
 
 	/*
 	 * Initialize boot memory size
@@ -455,7 +458,6 @@ int __init fadump_reserve_mem(void)
 			PAGE_ALIGN(fadump_calculate_reserve_size());
 #ifdef CONFIG_CMA
 		if (!fw_dump.nocma) {
-			align = FADUMP_CMA_ALIGNMENT;
 			fw_dump.boot_memory_size =
 				ALIGN(fw_dump.boot_memory_size, align);
 		}
@@ -472,8 +474,43 @@ int __init fadump_reserve_mem(void)
 			pr_err("Too many holes in boot memory area to enable fadump\n");
 			goto error_out;
 		}
+
+	}
+
+	return bootmem_min;
+error_out:
+	fw_dump.fadump_enabled = 0;
+	return 0;
+}
+
+int __init fadump_adjust_memlimit(void)
+{
+	u64 size, bootmem_min;
+
+	if (!fw_dump.fadump_enabled)
+		return 0;
+
+	if (!fw_dump.fadump_supported) {
+		pr_info("Firmware-Assisted Dump is not supported on this hardware\n");
+		fw_dump.fadump_enabled = 0;
+		return 0;
 	}
 
+#ifdef CONFIG_HUGETLB_PAGE
+	if (fw_dump.dump_active) {
+		/*
+		 * FADump capture kernel doesn't care much about hugepages.
+		 * In fact, handling hugepages in capture kernel is asking for
+		 * trouble. So, disable HugeTLB support when fadump is active.
+		 */
+		hugetlb_disabled = true;
+	}
+#endif
+
+	bootmem_min = fadump_get_bootmem_min();
+	if (!bootmem_min)
+		return 0;
+
 	/*
 	 * Calculate the memory boundary.
 	 * If memory_limit is less than actual memory boundary then reserve
@@ -490,6 +527,19 @@ int __init fadump_reserve_mem(void)
 		printk(KERN_INFO "Adjusted memory_limit for firmware-assisted"
 				" dump, now %#016llx\n", memory_limit);
 	}
+
+	return 0;
+}
+
+int __init fadump_reserve_mem(void)
+{
+	u64 base, size, mem_boundary, align = fadump_get_reserve_alignment();
+	bool is_memblock_bottom_up = memblock_bottom_up();
+	int ret = 1;
+
+	if (!fw_dump.fadump_enabled)
+		return 0;
+
 	if (memory_limit)
 		mem_boundary = memory_limit;
 	else
@@ -501,14 +551,6 @@ int __init fadump_reserve_mem(void)
 	if (fw_dump.dump_active) {
 		pr_info("Firmware-assisted dump is active.\n");
 
-#ifdef CONFIG_HUGETLB_PAGE
-		/*
-		 * FADump capture kernel doesn't care much about hugepages.
-		 * In fact, handling hugepages in capture kernel is asking for
-		 * trouble. So, disable HugeTLB support when fadump is active.
-		 */
-		hugetlb_disabled = true;
-#endif
 		/*
 		 * If last boot has crashed then reserve all the memory
 		 * above boot memory size so that we don't touch it until
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 7b6cdd9bf78d..4fff8c2222b1 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -731,6 +731,9 @@ void __init early_init_devtree(void *params)
 	if (PHYSICAL_START > MEMORY_START)
 		memblock_reserve(MEMORY_START, 0x8000);
 	reserve_kdump_trampoline();
+#if defined(CONFIG_FA_DUMP) || defined(CONFIG_PRESERVE_FA_DUMP)
+	fadump_adjust_memlimit();
+#endif
 	early_reserve_mem();
 
 	/* Ensure that total memory size is page-aligned. */
-- 
2.23.0

