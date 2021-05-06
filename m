Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D685237578E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 17:38:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbd5p6NSsz3cCp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 01:38:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm3 header.b=vtLuAgKH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=A/fF9xZE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm3 header.b=vtLuAgKH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=A/fF9xZE; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbd2t4KZSz3021
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 01:36:06 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 71F10580B96;
 Thu,  6 May 2021 11:27:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 06 May 2021 11:27:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm3; bh=qMAcSPfa3+cns
 kyYYIug3mYJD6YPqlrp2UQ4EuPYWbE=; b=vtLuAgKHZkDwSV7IEZxfPQeS0i3od
 uHpKdWO1xcEauvSAdrI0PKRkEwsYOnT4bXXbgcJ7k+PfuFslrZeyYZS735rskONI
 iamYJyO1wXcaPT7TJQ03m0Uc3uGQ7qFAOQHQKoT42rWc1TzStBMxZEqD2gnhAm7i
 7z6qcArs4OOnyZCf4w+Eq7DZtkzw/BjhgNu2sLVFuYHp0PcxhOre0uFmxb6zTUoi
 E8FBovJ39w2c32lrc7+rIROM1vd2Rvzl5CLItfaWfphh145TnW9ZyGxcQhhLvGVG
 TGgIHJwei7XBBlErWT+PQ59ZJV1I468hx8tF2+reH07GsMVBX6l1mju3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=qMAcSPfa3+cnskyYYIug3mYJD6YPqlrp2UQ4EuPYWbE=; b=A/fF9xZE
 aVi6cOoeWYwnn/g0KjDniMYoWv/W0ohiBN2QsYTn6BHlLnDf2TDA8t7uH5T7/N7p
 f1T4CifW3tWAl0rxH0XcTRRLmYVK31P/vzemd6wPDJW0wMnCkdEntCf33G3781H1
 D96lT9GosU4olO9VFDPbOgt2Yg0w4OgmJc72YlvF8E7+e/8jJgMJ7sp8pqsnYs6n
 w+INleKbjrPR9bGljr/C0b53Q2bs4MxAVIPEqstzpY4SwNOzZuDloMcGEDcs6XNr
 CKImonVyY0GNaPlhwbeNoZSn1RT2cayY8mVAYcMGqjcGZGLfUiGHcHE3H6LYCmnG
 k0FIJQRqYNwB4Q==
X-ME-Sender: <xms:0AqUYN4LVz0rqTnTZKlVfdieypH_vVbMKVcUqB014qb712HwxY8tIA>
 <xme:0AqUYK6dVw-M6RW3COGAknrn55C8tZF6W1qJcLB4EySho-uQAlOmDBm5oFD-4BDnu
 myJMPY1708iWvCkgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfrhgggfestdhqredtredttdenucfhrhhomhepkghiucgj
 rghnuceoiihirdihrghnsehsvghnthdrtghomheqnecuggftrfgrthhtvghrnhepieejue
 dvueduuefhgefhheeiuedvtedvuefgieegveetueeiueehtdegudehfeelnecukfhppeef
 hedrudeigedrvdegiedrfeegnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpe
 hmrghilhhfrhhomhepiihirdihrghnsehsvghnthdrtghomh
X-ME-Proxy: <xmx:0AqUYEfPwHcyBp3dweyqOsoINPhZ2PziO_0IGA8SsuckhEa-u3fgrg>
 <xmx:0AqUYGJ3qSP2fAyg6y5A4oOGSFMGtnL3ygHtsYpRjvKJ9hrU2aX2gQ>
 <xmx:0AqUYBKlBbfBEsgDk3s-PyOLIw_3qgVSaLTEU5ynU8CrG78psQ1Tmw>
 <xmx:0AqUYK5EJFa6lfrJhm18kbdzw_ur-QEIu6zM3s5-5hlbws6nsEbAuA>
Received: from Threadripper.local
 (ec2-35-164-246-34.us-west-2.compute.amazonaws.com [35.164.246.34])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu,  6 May 2021 11:27:08 -0400 (EDT)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: [RFC PATCH 5/7] mm: memory_hotplug,
 sparse: enable memory hotplug/hotremove subsections
Date: Thu,  6 May 2021 11:26:21 -0400
Message-Id: <20210506152623.178731-6-zi.yan@sent.com>
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

Remove the section size alignment checks for memory hotplug/hotremove,
so that we can online/offline subsection memory.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/memory_hotplug.c | 16 +++++++++-------
 mm/page_isolation.c |  4 ----
 mm/sparse.c         | 17 ++++++++++++++---
 3 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 6e93b0ecc5cb..5384bb62ac10 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -661,12 +661,15 @@ static void online_pages_range(unsigned long start_pf=
n, unsigned long nr_pages)
 	 * When using memmap_on_memory, the range might not be aligned to
 	 * MAX_ORDER_NR_PAGES - 1, but pageblock aligned. __ffs() will detect
 	 * this and the first chunk to online will be pageblock_nr_pages.
+	 * When onlining subsections, the range might be smaller than MAX_ORDER
+	 * - 1, use __ffs(nr_pages) to get the right size.
 	 */
 	for (pfn =3D start_pfn; pfn < end_pfn;) {
-		int order =3D min(MAX_ORDER - 1UL, __ffs(pfn));
+		int order =3D min3(MAX_ORDER - 1UL, __ffs(pfn), __ffs(nr_pages));
=20
 		(*online_page_callback)(pfn_to_page(pfn), order);
 		pfn +=3D (1UL << order);
+		nr_pages -=3D (1UL << order);
 	}
=20
 	/* mark all involved sections as online */
@@ -912,16 +915,16 @@ int __ref online_pages(unsigned long pfn, unsigned lo=
ng nr_pages, struct zone *z
 	struct memory_notify arg;
=20
 	/*
-	 * {on,off}lining is constrained to full memory sections (or more
+	 * {on,off}lining is constrained to memory subsections (or more
 	 * precisly to memory blocks from the user space POV).
 	 * memmap_on_memory is an exception because it reserves initial part
 	 * of the physical memory space for vmemmaps. That space is pageblock
 	 * aligned.
 	 */
 	if (WARN_ON_ONCE(!nr_pages ||
-			 !IS_ALIGNED(pfn, pageblock_nr_pages) ||
-			 !IS_ALIGNED(pfn + nr_pages, PAGES_PER_SECTION)))
+			 !IS_ALIGNED(pfn + nr_pages, PAGES_PER_SUBSECTION))) {
 		return -EINVAL;
+	}
=20
 	mem_hotplug_begin();
=20
@@ -1702,15 +1705,14 @@ int __ref offline_pages(unsigned long start_pfn, un=
signed long nr_pages)
 	char *reason;
=20
 	/*
-	 * {on,off}lining is constrained to full memory sections (or more
+	 * {on,off}lining is constrained to memory subsections (or more
 	 * precisly to memory blocks from the user space POV).
 	 * memmap_on_memory is an exception because it reserves initial part
 	 * of the physical memory space for vmemmaps. That space is pageblock
 	 * aligned.
 	 */
 	if (WARN_ON_ONCE(!nr_pages ||
-			 !IS_ALIGNED(start_pfn, pageblock_nr_pages) ||
-			 !IS_ALIGNED(start_pfn + nr_pages, PAGES_PER_SECTION)))
+			 !IS_ALIGNED(start_pfn + nr_pages, PAGES_PER_SUBSECTION)))
 		return -EINVAL;
=20
 	mem_hotplug_begin();
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index c1b9b8848382..7f1791faf03f 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -147,7 +147,6 @@ __first_valid_page(unsigned long pfn, unsigned long nr_=
pages)
  * be MIGRATE_ISOLATE.
  * @start_pfn:		The lower PFN of the range to be isolated.
  * @end_pfn:		The upper PFN of the range to be isolated.
- *			start_pfn/end_pfn must be aligned to pageblock_order.
  * @migratetype:	Migrate type to set in error recovery.
  * @flags:		The following flags are allowed (they can be combined in
  *			a bit mask)
@@ -190,9 +189,6 @@ int start_isolate_page_range(unsigned long start_pfn, u=
nsigned long end_pfn,
 	unsigned long undo_pfn;
 	struct page *page;
=20
-	BUG_ON(!IS_ALIGNED(start_pfn, pageblock_nr_pages));
-	BUG_ON(!IS_ALIGNED(end_pfn, pageblock_nr_pages));
-
 	for (pfn =3D start_pfn;
 	     pfn < end_pfn;
 	     pfn +=3D pageblock_nr_pages) {
diff --git a/mm/sparse.c b/mm/sparse.c
index 1c2957807882..09b5e6978ab0 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -251,7 +251,8 @@ void __init subsection_map_init(unsigned long pfn, unsi=
gned long nr_pages)
 /* Record a memory area against a node. */
 static void __init memory_present(int nid, unsigned long start, unsigned l=
ong end)
 {
-	unsigned long pfn;
+	unsigned long pfn, nr_pages;
+	unsigned long section, end_sec, start_sec;
=20
 #ifdef CONFIG_SPARSEMEM_EXTREME
 	if (unlikely(!mem_section)) {
@@ -268,9 +269,17 @@ static void __init memory_present(int nid, unsigned lo=
ng start, unsigned long en
=20
 	start &=3D PAGE_SECTION_MASK;
 	mminit_validate_memmodel_limits(&start, &end);
-	for (pfn =3D start; pfn < end; pfn +=3D PAGES_PER_SECTION) {
-		unsigned long section =3D pfn_to_section_nr(pfn);
+	start_sec =3D pfn_to_section_nr(start);
+	end_sec =3D pfn_to_section_nr(end - 1);
+	pfn =3D start;
+	nr_pages =3D end - start;
+
+	for (section =3D start_sec; section <=3D end_sec; section++) {
 		struct mem_section *ms;
+		unsigned long pfns;
+
+		pfns =3D min(nr_pages, PAGES_PER_SECTION
+				- (pfn & ~PAGE_SECTION_MASK));
=20
 		sparse_index_init(section, nid);
 		set_section_nid(section, nid);
@@ -281,6 +290,8 @@ static void __init memory_present(int nid, unsigned lon=
g start, unsigned long en
 							SECTION_IS_ONLINE;
 			section_mark_present(ms);
 		}
+		pfn +=3D pfns;
+		nr_pages -=3D pfns;
 	}
 }
=20
--=20
2.30.2

