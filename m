Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F711C30EF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 03:12:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49FlFN17xpzDqHK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 11:12:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49FlBM03v4zDqfG
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 11:09:29 +1000 (AEST)
IronPort-SDR: uzfLm5vKYi8jgvznV8wpE3oS3FPOLSjNzD3w4UkoYdfkymPY7qUG2S7Z9cjEJkGkaHrSmjfuoX
 ar4+cV9ZInlg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2020 18:09:27 -0700
IronPort-SDR: Fc2IIc9c2THj/HwNYcVXgIy3ANuD6CfXzgcUpSYeSxuPrkm+NdoaedfEUy5/ze1d2Nc6Rr/ExU
 7n2k4cO5wh4w==
X-IronPort-AV: E=Sophos;i="5.73,350,1583222400"; d="scan'208";a="433937305"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2020 18:09:26 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH V2 08/11] arch/kmap: Ensure kmap_prot visibility
Date: Sun,  3 May 2020 18:09:09 -0700
Message-Id: <20200504010912.982044-9-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200504010912.982044-1-ira.weiny@intel.com>
References: <20200504010912.982044-1-ira.weiny@intel.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

We want to support kmap_atomic_prot() on all architectures and it makes
sense to define kmap_atomic() to use the default kmap_prot.

So we ensure all arch's have a globally available kmap_prot either as a
define or exported symbol.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/microblaze/include/asm/highmem.h | 2 +-
 arch/microblaze/mm/init.c             | 3 ---
 arch/powerpc/include/asm/highmem.h    | 2 +-
 arch/powerpc/mm/mem.c                 | 3 ---
 arch/sparc/mm/highmem.c               | 1 +
 5 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/microblaze/include/asm/highmem.h b/arch/microblaze/include/asm/highmem.h
index 1b8a3c5102bd..033ac5b5c2da 100644
--- a/arch/microblaze/include/asm/highmem.h
+++ b/arch/microblaze/include/asm/highmem.h
@@ -25,8 +25,8 @@
 #include <linux/uaccess.h>
 #include <asm/fixmap.h>
 
+#define kmap_prot		PAGE_KERNEL
 extern pte_t *kmap_pte;
-extern pgprot_t kmap_prot;
 extern pte_t *pkmap_page_table;
 
 /*
diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
index 1ffbfa96b9b8..a467686c13af 100644
--- a/arch/microblaze/mm/init.c
+++ b/arch/microblaze/mm/init.c
@@ -49,8 +49,6 @@ unsigned long lowmem_size;
 #ifdef CONFIG_HIGHMEM
 pte_t *kmap_pte;
 EXPORT_SYMBOL(kmap_pte);
-pgprot_t kmap_prot;
-EXPORT_SYMBOL(kmap_prot);
 
 static inline pte_t *virt_to_kpte(unsigned long vaddr)
 {
@@ -68,7 +66,6 @@ static void __init highmem_init(void)
 	pkmap_page_table = virt_to_kpte(PKMAP_BASE);
 
 	kmap_pte = virt_to_kpte(__fix_to_virt(FIX_KMAP_BEGIN));
-	kmap_prot = PAGE_KERNEL;
 }
 
 static void highmem_setup(void)
diff --git a/arch/powerpc/include/asm/highmem.h b/arch/powerpc/include/asm/highmem.h
index 373a470df205..ee5de974c5ef 100644
--- a/arch/powerpc/include/asm/highmem.h
+++ b/arch/powerpc/include/asm/highmem.h
@@ -29,8 +29,8 @@
 #include <asm/page.h>
 #include <asm/fixmap.h>
 
+#define kmap_prot		PAGE_KERNEL
 extern pte_t *kmap_pte;
-extern pgprot_t kmap_prot;
 extern pte_t *pkmap_page_table;
 
 /*
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 041ed7cfd341..3f642b058731 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -64,8 +64,6 @@ bool init_mem_is_free;
 #ifdef CONFIG_HIGHMEM
 pte_t *kmap_pte;
 EXPORT_SYMBOL(kmap_pte);
-pgprot_t kmap_prot;
-EXPORT_SYMBOL(kmap_prot);
 #endif
 
 pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
@@ -245,7 +243,6 @@ void __init paging_init(void)
 	pkmap_page_table = virt_to_kpte(PKMAP_BASE);
 
 	kmap_pte = virt_to_kpte(__fix_to_virt(FIX_KMAP_BEGIN));
-	kmap_prot = PAGE_KERNEL;
 #endif /* CONFIG_HIGHMEM */
 
 	printk(KERN_DEBUG "Top of RAM: 0x%llx, Total RAM: 0x%llx\n",
diff --git a/arch/sparc/mm/highmem.c b/arch/sparc/mm/highmem.c
index 469786bc430f..9f06d75e88e1 100644
--- a/arch/sparc/mm/highmem.c
+++ b/arch/sparc/mm/highmem.c
@@ -33,6 +33,7 @@
 #include <asm/vaddrs.h>
 
 pgprot_t kmap_prot;
+EXPORT_SYMBOL(kmap_prot);
 
 static pte_t *kmap_pte;
 
-- 
2.25.1

