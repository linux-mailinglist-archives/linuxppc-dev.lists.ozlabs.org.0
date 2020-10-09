Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BA5289983
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 22:14:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7K675W9GzDqRD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Oct 2020 07:14:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7JbV4WzVzDqY6;
 Sat, 10 Oct 2020 06:51:01 +1100 (AEDT)
IronPort-SDR: 38qb9klponF0s85PbZg/61LhK3JeEw/UCs7rq0cd+5ymkqb6ReRYRi2E3J1zBuFo4uBsNH03LP
 lsuqnzK/myiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="164743615"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="164743615"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:50:59 -0700
IronPort-SDR: /j9oTf64Lc/fwCVe0LT3Z3/pz5zJXnOJNQAbfqyJqoBSoEhIO3zt/eOhOuH8Xl1K1eBwx2q0zq
 2edyiKrU43UQ==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="519846797"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:50:59 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 04/58] kmap: Add stray access protection for
 device pages
Date: Fri,  9 Oct 2020 12:49:39 -0700
Message-Id: <20201009195033.3208459-5-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kselftest@vger.kernel.org,
 samba-technical@lists.samba.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, linux-cachefs@redhat.com,
 intel-wired-lan@lists.osuosl.org, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

Device managed pages may have additional protections.  These protections
need to be removed prior to valid use by kernel users.

Check for special treatment of device managed pages in kmap and take
action if needed.  We use kmap as an interface for generic kernel code
because under normal circumstances it would be a bug for general kernel
code to not use kmap prior to accessing kernel memory.  Therefore, this
should allow any valid kernel users to seamlessly use these pages
without issues.

Because of the critical nature of kmap it must be pointed out that the
over head on regular DRAM is carefully implemented to be as fast as
possible.  Furthermore the underlying MSR write required on device pages
when protected is better than a normal MSR write.

Specifically, WRMSR(MSR_IA32_PKRS) is not serializing but still
maintains ordering properties similar to WRPKRU.  The current SDM
section on PKRS needs updating but should be the same as that of WRPKRU.
So to quote from the WRPKRU text:

	WRPKRU will never execute speculatively. Memory accesses
	affected by PKRU register will not execute (even speculatively)
	until all prior executions of WRPKRU have completed execution
	and updated the PKRU register.

Still this will make accessing pmem more expensive from the kernel but
the overhead is minimized and many pmem users access this memory through
user page mappings which are not affected at all.

Cc: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 include/linux/highmem.h | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 14e6202ce47f..2a9806e3b8d2 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -8,6 +8,7 @@
 #include <linux/mm.h>
 #include <linux/uaccess.h>
 #include <linux/hardirq.h>
+#include <linux/memremap.h>
 
 #include <asm/cacheflush.h>
 
@@ -31,6 +32,20 @@ static inline void invalidate_kernel_vmap_range(void *vaddr, int size)
 
 #include <asm/kmap_types.h>
 
+static inline void dev_page_enable_access(struct page *page, bool global)
+{
+	if (!page_is_access_protected(page))
+		return;
+	dev_access_enable(global);
+}
+
+static inline void dev_page_disable_access(struct page *page, bool global)
+{
+	if (!page_is_access_protected(page))
+		return;
+	dev_access_disable(global);
+}
+
 #ifdef CONFIG_HIGHMEM
 extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
 extern void kunmap_atomic_high(void *kvaddr);
@@ -55,6 +70,11 @@ static inline void *kmap(struct page *page)
 	else
 		addr = kmap_high(page);
 	kmap_flush_tlb((unsigned long)addr);
+	/*
+	 * Even non-highmem pages may have additional access protections which
+	 * need to be checked and potentially enabled.
+	 */
+	dev_page_enable_access(page, true);
 	return addr;
 }
 
@@ -63,6 +83,11 @@ void kunmap_high(struct page *page);
 static inline void kunmap(struct page *page)
 {
 	might_sleep();
+	/*
+	 * Even non-highmem pages may have additional access protections which
+	 * need to be checked and potentially disabled.
+	 */
+	dev_page_disable_access(page, true);
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
@@ -85,6 +110,7 @@ static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 {
 	preempt_disable();
 	pagefault_disable();
+	dev_page_enable_access(page, false);
 	if (!PageHighMem(page))
 		return page_address(page);
 	return kmap_atomic_high_prot(page, prot);
@@ -137,6 +163,7 @@ static inline unsigned long totalhigh_pages(void) { return 0UL; }
 static inline void *kmap(struct page *page)
 {
 	might_sleep();
+	dev_page_enable_access(page, true);
 	return page_address(page);
 }
 
@@ -146,6 +173,7 @@ static inline void kunmap_high(struct page *page)
 
 static inline void kunmap(struct page *page)
 {
+	dev_page_disable_access(page, true);
 #ifdef ARCH_HAS_FLUSH_ON_KUNMAP
 	kunmap_flush_on_unmap(page_address(page));
 #endif
@@ -155,6 +183,7 @@ static inline void *kmap_atomic(struct page *page)
 {
 	preempt_disable();
 	pagefault_disable();
+	dev_page_enable_access(page, false);
 	return page_address(page);
 }
 #define kmap_atomic_prot(page, prot)	kmap_atomic(page)
@@ -216,7 +245,8 @@ static inline void kmap_atomic_idx_pop(void)
 #define kunmap_atomic(addr)                                     \
 do {                                                            \
 	BUILD_BUG_ON(__same_type((addr), struct page *));       \
-	kunmap_atomic_high(addr);                                  \
+	dev_page_disable_access(kmap_to_page(addr), false);     \
+	kunmap_atomic_high(addr);                               \
 	pagefault_enable();                                     \
 	preempt_enable();                                       \
 } while (0)
-- 
2.28.0.rc0.12.gb6a658bd00c9

