Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E29D81C0871
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 22:44:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CnS95QxfzDrHP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 06:44:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CnKT5RZxzDqB2
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 06:38:52 +1000 (AEST)
IronPort-SDR: EzqQlmwMRZwpbRvtiLfAsQlyH2lt6qGEfgJ306wokqAsS4g90OmUGg3nxVf0SVfZOlXMpJgMXI
 E8NT3OK34yqw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 13:38:50 -0700
IronPort-SDR: D17QC4GuvkvagsbQzhsWMllqtH4pQoXw3+YB8DmVDQH5kIEwBMTkXxo65c+tv10pHrRcqkGuZ7
 BLWcgEAlXhRQ==
X-IronPort-AV: E=Sophos;i="5.73,337,1583222400"; d="scan'208";a="293688007"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 13:38:49 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH V1 01/10] arch/kmap: Remove BUG_ON()
Date: Thu, 30 Apr 2020 13:38:36 -0700
Message-Id: <20200430203845.582900-2-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200430203845.582900-1-ira.weiny@intel.com>
References: <20200430203845.582900-1-ira.weiny@intel.com>
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
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

Replace the use of BUG_ON(in_interrupt()) in the kmap() and kunmap()
in favor of might_sleep().

Besides the benefits of might_sleep(), this normalizes the
implementations such that they can be made generic in subsequent
patches.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/arc/include/asm/highmem.h        | 2 +-
 arch/arc/mm/highmem.c                 | 2 +-
 arch/arm/mm/highmem.c                 | 2 +-
 arch/csky/mm/highmem.c                | 2 +-
 arch/microblaze/include/asm/highmem.h | 2 +-
 arch/mips/mm/highmem.c                | 2 +-
 arch/nds32/mm/highmem.c               | 2 +-
 arch/powerpc/include/asm/highmem.h    | 2 +-
 arch/sparc/include/asm/highmem.h      | 4 ++--
 arch/x86/mm/highmem_32.c              | 3 +--
 arch/xtensa/include/asm/highmem.h     | 4 ++--
 11 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/arch/arc/include/asm/highmem.h b/arch/arc/include/asm/highmem.h
index 1af00accb37f..042e92921c4c 100644
--- a/arch/arc/include/asm/highmem.h
+++ b/arch/arc/include/asm/highmem.h
@@ -45,7 +45,7 @@ static inline void flush_cache_kmaps(void)
 
 static inline void kunmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
index fc8849e4f72e..39ef7b9a3aa9 100644
--- a/arch/arc/mm/highmem.c
+++ b/arch/arc/mm/highmem.c
@@ -51,7 +51,7 @@ static pte_t * fixmap_page_table;
 
 void *kmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return page_address(page);
 
diff --git a/arch/arm/mm/highmem.c b/arch/arm/mm/highmem.c
index a76f8ace9ce6..cc6eb79ef20c 100644
--- a/arch/arm/mm/highmem.c
+++ b/arch/arm/mm/highmem.c
@@ -42,7 +42,7 @@ EXPORT_SYMBOL(kmap);
 
 void kunmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
diff --git a/arch/csky/mm/highmem.c b/arch/csky/mm/highmem.c
index 813129145f3d..690d678649d1 100644
--- a/arch/csky/mm/highmem.c
+++ b/arch/csky/mm/highmem.c
@@ -29,7 +29,7 @@ EXPORT_SYMBOL(kmap);
 
 void kunmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
diff --git a/arch/microblaze/include/asm/highmem.h b/arch/microblaze/include/asm/highmem.h
index 332c78e15198..99ced7278b5c 100644
--- a/arch/microblaze/include/asm/highmem.h
+++ b/arch/microblaze/include/asm/highmem.h
@@ -66,7 +66,7 @@ static inline void *kmap(struct page *page)
 
 static inline void kunmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
index d08e6d7d533b..edd889f6cede 100644
--- a/arch/mips/mm/highmem.c
+++ b/arch/mips/mm/highmem.c
@@ -28,7 +28,7 @@ EXPORT_SYMBOL(kmap);
 
 void kunmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
diff --git a/arch/nds32/mm/highmem.c b/arch/nds32/mm/highmem.c
index 022779af6148..4c7c28e994ea 100644
--- a/arch/nds32/mm/highmem.c
+++ b/arch/nds32/mm/highmem.c
@@ -24,7 +24,7 @@ EXPORT_SYMBOL(kmap);
 
 void kunmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
diff --git a/arch/powerpc/include/asm/highmem.h b/arch/powerpc/include/asm/highmem.h
index a4b65b186ec6..529512f6d65a 100644
--- a/arch/powerpc/include/asm/highmem.h
+++ b/arch/powerpc/include/asm/highmem.h
@@ -74,7 +74,7 @@ static inline void *kmap(struct page *page)
 
 static inline void kunmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
diff --git a/arch/sparc/include/asm/highmem.h b/arch/sparc/include/asm/highmem.h
index 18d776925c45..7dd2d4b3f980 100644
--- a/arch/sparc/include/asm/highmem.h
+++ b/arch/sparc/include/asm/highmem.h
@@ -55,7 +55,7 @@ void kunmap_high(struct page *page);
 
 static inline void *kmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return page_address(page);
 	return kmap_high(page);
@@ -63,7 +63,7 @@ static inline void *kmap(struct page *page)
 
 static inline void kunmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
diff --git a/arch/x86/mm/highmem_32.c b/arch/x86/mm/highmem_32.c
index 0a1898b8552e..8af66382672b 100644
--- a/arch/x86/mm/highmem_32.c
+++ b/arch/x86/mm/highmem_32.c
@@ -15,8 +15,7 @@ EXPORT_SYMBOL(kmap);
 
 void kunmap(struct page *page)
 {
-	if (in_interrupt())
-		BUG();
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
diff --git a/arch/xtensa/include/asm/highmem.h b/arch/xtensa/include/asm/highmem.h
index 04e9340eac4b..413848cc1e56 100644
--- a/arch/xtensa/include/asm/highmem.h
+++ b/arch/xtensa/include/asm/highmem.h
@@ -73,7 +73,7 @@ static inline void *kmap(struct page *page)
 	 */
 	BUILD_BUG_ON(PKMAP_BASE <
 		     TLBTEMP_BASE_1 + TLBTEMP_SIZE);
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return page_address(page);
 	return kmap_high(page);
@@ -81,7 +81,7 @@ static inline void *kmap(struct page *page)
 
 static inline void kunmap(struct page *page)
 {
-	BUG_ON(in_interrupt());
+	might_sleep();
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
-- 
2.25.1

