Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1E01D8790
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 20:50:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qp4Q0STtzDqkL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 04:50:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Qp2K3DHfzDqc7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 04:48:49 +1000 (AEST)
IronPort-SDR: fulXmoAvzDzn8B1zxNl+LrrZDufrUQzLTbk1gHqhJx38ivyI7E5AMaIxMH8i6P19TYuvcjY2MB
 xCVd5b5VG/gg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 11:48:45 -0700
IronPort-SDR: A0dNOJcp3XVBRer+3SvVGXusda3bUk5OmiTTHwwN4BXAPX4zWgYa/kiDwvCtGSiDC+7pgbW2fC
 b75hGkYrg3kw==
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; d="scan'208";a="253140387"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 11:48:45 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] arch/{mips, sparc, microblaze,
 powerpc}: Don't enable pagefault/preempt twice
Date: Mon, 18 May 2020 11:48:43 -0700
Message-Id: <20200518184843.3029640-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150004.1423069-8-ira.weiny@intel.com>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
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
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

The kunmap_atomic clean up failed to remove one set of pagefault/preempt
enables when vaddr is not in the fixmap.

Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/microblaze/mm/highmem.c | 5 +----
 arch/mips/mm/highmem.c       | 5 +----
 arch/powerpc/mm/highmem.c    | 5 +----
 arch/sparc/mm/highmem.c      | 5 +----
 4 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/microblaze/mm/highmem.c b/arch/microblaze/mm/highmem.c
index ee8a422b2b76..92e0890416c9 100644
--- a/arch/microblaze/mm/highmem.c
+++ b/arch/microblaze/mm/highmem.c
@@ -57,11 +57,8 @@ void kunmap_atomic_high(void *kvaddr)
 	int type;
 	unsigned int idx;
 
-	if (vaddr < __fix_to_virt(FIX_KMAP_END)) {
-		pagefault_enable();
-		preempt_enable();
+	if (vaddr < __fix_to_virt(FIX_KMAP_END))
 		return;
-	}
 
 	type = kmap_atomic_idx();
 
diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
index 37e244cdb14e..8e8726992720 100644
--- a/arch/mips/mm/highmem.c
+++ b/arch/mips/mm/highmem.c
@@ -41,11 +41,8 @@ void kunmap_atomic_high(void *kvaddr)
 	unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
 	int type __maybe_unused;
 
-	if (vaddr < FIXADDR_START) { // FIXME
-		pagefault_enable();
-		preempt_enable();
+	if (vaddr < FIXADDR_START)
 		return;
-	}
 
 	type = kmap_atomic_idx();
 #ifdef CONFIG_DEBUG_HIGHMEM
diff --git a/arch/powerpc/mm/highmem.c b/arch/powerpc/mm/highmem.c
index 35071c2913f1..624b4438aff9 100644
--- a/arch/powerpc/mm/highmem.c
+++ b/arch/powerpc/mm/highmem.c
@@ -44,11 +44,8 @@ void kunmap_atomic_high(void *kvaddr)
 {
 	unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
 
-	if (vaddr < __fix_to_virt(FIX_KMAP_END)) {
-		pagefault_enable();
-		preempt_enable();
+	if (vaddr < __fix_to_virt(FIX_KMAP_END))
 		return;
-	}
 
 	if (IS_ENABLED(CONFIG_DEBUG_HIGHMEM)) {
 		int type = kmap_atomic_idx();
diff --git a/arch/sparc/mm/highmem.c b/arch/sparc/mm/highmem.c
index d237d902f9c3..6ff6e2a9f9b3 100644
--- a/arch/sparc/mm/highmem.c
+++ b/arch/sparc/mm/highmem.c
@@ -86,11 +86,8 @@ void kunmap_atomic_high(void *kvaddr)
 	unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
 	int type;
 
-	if (vaddr < FIXADDR_START) { // FIXME
-		pagefault_enable();
-		preempt_enable();
+	if (vaddr < FIXADDR_START)
 		return;
-	}
 
 	type = kmap_atomic_idx();
 
-- 
2.25.1

