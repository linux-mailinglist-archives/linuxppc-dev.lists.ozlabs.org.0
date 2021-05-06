Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5519A37578A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 17:38:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbd5K2bY5z3c7m
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 01:38:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm3 header.b=T0KbRP5g;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=aOU5zsie;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm3 header.b=T0KbRP5g; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=aOU5zsie; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbd2q1llhz3019
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 01:36:02 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B4CB4580B8E;
 Thu,  6 May 2021 11:27:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 06 May 2021 11:27:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm3; bh=TGHkkHAkwQqHn
 j9aDAhKOv79HjuXprQdprcBuBsFFK4=; b=T0KbRP5gtBWXhF4Ux0hC9vhmeJP1e
 ZNWCzZqupMvaDrWGOdg+tlueoRDckCMoXMNx00tZgMUseaOgRupoRp6jCCURDsZ1
 8RAbp0LIk5/tEFVPEsZK1OpJJafux2NtpFDToBd6y73sFIHzsEpQpSmF8AQsqCes
 SsC88QcjZoDWgREOtGXR8jCsNjh1KoJXzlIwZUzz9WOyyB5RaLDoz+XvHRKDRKru
 93xeSbjgnddbBgjvL/VYaqNZgIzT0Bfv2D600iHuRzZOpjaRuolNhCCf0QAT5u8u
 ZA+bykD6f34SYjZRDx//O13q/cA2bLufKiIfVirsQwzs4EjFMYEToo2RQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=TGHkkHAkwQqHnj9aDAhKOv79HjuXprQdprcBuBsFFK4=; b=aOU5zsie
 cl45ifwgQiRR5SSiU9wh+TWqPXXbjb9eiFmGBWLV5uAIkPUU4g0J7xPlnSAI8vvs
 kEvhe1a7jDKAKFTehB3Sbid1SlU2LoB5HqrD302qB1fBAOAChgyew+qtHe4Vsv90
 6wQmMWaiweG7GTk5j9iysl84arGN/KEIHzh1ZgsmSoRBMJeZph5BtASGSkNwAeUx
 vG5OeL3mzoyqZNQC/Xzv0AIRf/fcR/BFbHtanVij8kJz79UbRviRfKyiRbVjuAny
 55/axCWTO20DECgY/Lk5mijbhPBoPaTzm76gToJFvIxhqpYGCX44YCN8diMjERbQ
 h/Ia8R0YlucCGg==
X-ME-Sender: <xms:wwqUYILwzLjO0Z50acpaSmz55Gw1KJVA6wQSfVFeSg3nHoM0WMQrMw>
 <xme:wwqUYIJPJYtSbjSrSo7KbWUZumvsBgDwRQfJa5-bwQITMAfvVHKTaULL9z1nowXc7
 FZeJuLSKp5DblwbTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucdnrfhurhgthhgrshgvucdluddtmdenucfjughrpe
 fhvffufffkofgjfhhrggfgsedtqhertdertddtnecuhfhrohhmpegkihcujggrnhcuoeii
 ihdrhigrnhesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeeuvdeuudeuhf
 eghfehieeuvdetvdeugfeigeevteeuieeuhedtgeduheefleenucfkphepfeehrdduieeg
 rddvgeeirdefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpeiiihdrhigrnhesshgvnhhtrdgtohhm
X-ME-Proxy: <xmx:wwqUYIv-icO55lxLnHGJO9o5gLNKuFAugKvR8m-FwQSe1LyeoycsPg>
 <xmx:wwqUYFavebNJhfuADveQFkv-_ZdRCSa52IYFGwEn6jyT1XSR8MAnCg>
 <xmx:wwqUYPav4jERyhGkAtI4TOQInCbNV60-wlab09C6u1BaDPMHhCKJQKEqa6fAm1Q>
 <xmx:xAqUYHIRT1kid10Xzw4VnbTwy49abExqucu0-mv-w_AGki1w4D0eyA>
Received: from Threadripper.local
 (ec2-35-164-246-34.us-west-2.compute.amazonaws.com [35.164.246.34])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu,  6 May 2021 11:26:55 -0400 (EDT)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: [RFC PATCH 2/7] mm: set pageblock_order to the max of
 HUGETLB_PAGE_ORDER and MAX_ORDER-1
Date: Thu,  6 May 2021 11:26:18 -0400
Message-Id: <20210506152623.178731-3-zi.yan@sent.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210506152623.178731-1-zi.yan@sent.com>
References: <20210506152623.178731-1-zi.yan@sent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Zi Yan <ziy@nvidia.com>
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, x86@kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Zi Yan <ziy@nvidia.com>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Zi Yan <ziy@nvidia.com>

As MAX_ORDER can be increased to larger than hugetlb page orders,
pageblock_order will be limited at HUGETLB_PAGE_ORDER. It is not
ideal for anti-fragmentation for allocating pages from buddy allocator
with MAX_ORDER > HUGETLB_PAGE_ORDER. Make pageblock_order a variable and
set it to the max of HUGETLB_PAGE_ORDER, MAX_ORDER - 1.

Remove HUGETLB_PAGE_SIZE_VARIABLE as HUGETLB_PAGE does the same thing
now.

Export pageblock_order since virtio-mem module needs it.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 arch/ia64/Kconfig               |  1 -
 arch/powerpc/Kconfig            |  1 -
 include/linux/pageblock-flags.h |  9 ---------
 mm/Kconfig                      |  7 -------
 mm/page_alloc.c                 | 13 +++++++------
 mm/sparse.c                     |  2 +-
 6 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 279252e3e0f7..c6a150cde668 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -34,7 +34,6 @@ config IA64
 	select TTY
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_VIRT_CPU_ACCOUNTING
-	select HUGETLB_PAGE_SIZE_VARIABLE if HUGETLB_PAGE
 	select VIRT_TO_BUS
 	select GENERIC_IRQ_PROBE
 	select GENERIC_PENDING_IRQ if SMP
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8926461d25b2..9f27c131ed45 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -238,7 +238,6 @@ config PPC
 	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_N=
MI && !HAVE_HARDLOCKUP_DETECTOR_ARCH
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
-	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
 	select MMU_GATHER_RCU_TABLE_FREE
 	select MMU_GATHER_PAGE_SIZE
 	select HAVE_REGS_AND_STACK_ACCESS_API
diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flag=
s.h
index fff52ad370c1..efab85e2ae1c 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -30,18 +30,9 @@ enum pageblock_bits {
=20
 #ifdef CONFIG_HUGETLB_PAGE
=20
-#ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
-
 /* Huge page sizes are variable */
 extern unsigned int pageblock_order;
=20
-#else /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
-
-/* Huge pages are a constant size */
-#define pageblock_order		HUGETLB_PAGE_ORDER
-
-#endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
-
 #else /* CONFIG_HUGETLB_PAGE */
=20
 /* If huge pages are not used, group by MAX_ORDER_NR_PAGES */
diff --git a/mm/Kconfig b/mm/Kconfig
index a8a367c30053..3466c3d09295 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -284,13 +284,6 @@ config ARCH_ENABLE_HUGEPAGE_MIGRATION
 config ARCH_ENABLE_THP_MIGRATION
 	bool
=20
-config HUGETLB_PAGE_SIZE_VARIABLE
-	def_bool n
-	help
-	  Allows the pageblock_order value to be dynamic instead of just standard
-	  HUGETLB_PAGE_ORDER when there are multiple HugeTLB page sizes available
-	  on a platform.
-
 config CONTIG_ALLOC
 	def_bool (MEMORY_ISOLATION && COMPACTION) || CMA
=20
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index a2fe714aed93..72bb4a300e03 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -256,8 +256,9 @@ bool pm_suspended_storage(void)
 }
 #endif /* CONFIG_PM_SLEEP */
=20
-#ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
+#ifdef CONFIG_HUGETLB_PAGE
 unsigned int pageblock_order __read_mostly;
+EXPORT_SYMBOL_GPL(pageblock_order);
 #endif
=20
 static void __free_pages_ok(struct page *page, unsigned int order,
@@ -7057,7 +7058,7 @@ static void __ref setup_usemap(struct zone *zone)
 static inline void setup_usemap(struct zone *zone) {}
 #endif /* CONFIG_SPARSEMEM */
=20
-#ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
+#ifdef CONFIG_HUGETLB_PAGE
=20
 /* Initialise the number of pages represented by NR_PAGEBLOCK_BITS */
 void __init set_pageblock_order(void)
@@ -7068,7 +7069,7 @@ void __init set_pageblock_order(void)
 	if (pageblock_order)
 		return;
=20
-	if (HPAGE_SHIFT > PAGE_SHIFT)
+	if ((HPAGE_SHIFT > PAGE_SHIFT) && (HUGETLB_PAGE_ORDER > (MAX_ORDER - 1)))
 		order =3D HUGETLB_PAGE_ORDER;
 	else
 		order =3D MAX_ORDER - 1;
@@ -7080,10 +7081,10 @@ void __init set_pageblock_order(void)
 	 */
 	pageblock_order =3D order;
 }
-#else /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
+#else /* CONFIG_HUGETLB_PAGE */
=20
 /*
- * When CONFIG_HUGETLB_PAGE_SIZE_VARIABLE is not set, set_pageblock_order()
+ * When CONFIG_HUGETLB_PAGE is not set, set_pageblock_order()
  * is unused as pageblock_order is set at compile-time. See
  * include/linux/pageblock-flags.h for the values of pageblock_order based=
 on
  * the kernel config
@@ -7092,7 +7093,7 @@ void __init set_pageblock_order(void)
 {
 }
=20
-#endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
+#endif /* CONFIG_HUGETLB_PAGE */
=20
 static unsigned long __init calc_memmap_size(unsigned long spanned_pages,
 						unsigned long present_pages)
diff --git a/mm/sparse.c b/mm/sparse.c
index 7637208b8874..1c2957807882 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -583,7 +583,7 @@ void __init sparse_init(void)
 	pnum_begin =3D first_present_section_nr();
 	nid_begin =3D sparse_early_nid(__nr_to_section(pnum_begin));
=20
-	/* Setup pageblock_order for HUGETLB_PAGE_SIZE_VARIABLE */
+	/* Setup pageblock_order for HUGETLB_PAGE */
 	set_pageblock_order();
=20
 	for_each_present_section_nr(pnum_begin + 1, pnum_end) {
--=20
2.30.2

