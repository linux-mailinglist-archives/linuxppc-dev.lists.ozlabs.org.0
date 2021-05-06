Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C52FC3757A7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 17:39:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbd6q5p5nz3cXp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 01:39:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm3 header.b=Zg+hQIwW;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=BMvmeNAr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm3 header.b=Zg+hQIwW; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=BMvmeNAr; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbd2t49xRz3019
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 01:36:06 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C1697580B92;
 Thu,  6 May 2021 11:27:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 06 May 2021 11:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding; s=fm3; bh=WM/6yw4DbUOeZ
 Qua2xBOphgta4VgYuLUaDHBkJrEgcU=; b=Zg+hQIwW1OH4i+LZYZkg6EMPR2e/z
 mwHnFDj5A3p1witMQW6QJ5AKdqQ2x5hE6ru7DK5DhvlmRC4ohNCZUwnZ7mbMVWJ/
 vedp69BcjkrriRFJJ0EYUXOLcgjjb7by74IbDooOPu7WRP2pfwsfOz9aFv5xzohi
 DAK4M4MMBTBJg909uvnOyQQwFnVGvJTwZ78Sqy+r00ReBx2AdYlD3HC1Xn+nejpm
 aVAPnFyjG/F6HQTL+11bsp4f4EuYJeORcAKkjyl1vM46kzqpURLPIRuDrWxSgInG
 Lktr4oXw+03sv39JRvm/NC1A4nCjNJAJvX9eKSBJehplGZtKvIR4smHgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=WM/6yw4DbUOeZQua2xBOphgta4VgYuLUaDHBkJrEgcU=; b=BMvmeNAr
 Ze+uMLX0HnQ+fxidLY20Gi/maR2IIbkK7Ip1rXT2+OVXEBl8fgmuQKiIVqkxrAp3
 UKcjtwhNXJWDVbPhL+cnj0KUe/QighhpeZnOL7iLe9m1cx3yDv6OgLXqt7NHChCt
 b7YBnTNUss1+2Zz8cXpgZAEWvb76k2DIJ31Oo3IVKBpdGMh3neMIXK0pa3BNmm7e
 efWgEKQTSmJXiY6pH+hTu6r52iPcRXqzNzrMbWRr1NAr5tgfMZtUBBWuDJ4dIKE8
 C61XlFdIqvkXCKNND2nQElVlEKRe0lL51usBbG6TwoMSIuBRo2gzFT0MULRz/oL4
 PsE/Em6unM3rBA==
X-ME-Sender: <xms:yAqUYOhX6llbT-5X17OxGs-xYUWrKL2LazPZXnDcGZx2GFPwa2LlOw>
 <xme:yAqUYPD5l1X-qxymzuOaLkO4uekCksfc3j92KshqhmSprvhXUS017K1qSl5DYw9M-
 LMSsT2IGWNe_UnDGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfrhgggfestdhqredtredttdenucfhrhhomhepkghiucgj
 rghnuceoiihirdihrghnsehsvghnthdrtghomheqnecuggftrfgrthhtvghrnhepieejue
 dvueduuefhgefhheeiuedvtedvuefgieegveetueeiueehtdegudehfeelnecukfhppeef
 hedrudeigedrvdegiedrfeegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpe
 hmrghilhhfrhhomhepiihirdihrghnsehsvghnthdrtghomh
X-ME-Proxy: <xmx:yAqUYGFj43yl8inbsEruX7yRgQnIrN6DM0k525AmMeuyReQs0qDm_Q>
 <xmx:yAqUYHTiaXgKff6E8wDNHLqnxoeXWJFrrridMDPobjfy0wWC3PDDgA>
 <xmx:yAqUYLxnvf3-5n7DjdyAmR49vh_yj994LkFtBAt3pXvakn0InUTPEQ>
 <xmx:yAqUYIiMaUdpa5Pjw8ZETBk5x_8Yx2ZoP2Gd9E0ZBWcCMqgYJLeZfQ>
Received: from Threadripper.local
 (ec2-35-164-246-34.us-west-2.compute.amazonaws.com [35.164.246.34])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu,  6 May 2021 11:27:00 -0400 (EDT)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: [RFC PATCH 3/7] mm: memory_hotplug: decouple memory_block size with
 section size.
Date: Thu,  6 May 2021 11:26:19 -0400
Message-Id: <20210506152623.178731-4-zi.yan@sent.com>
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

To enable subsection memory online/offline, we need to remove the
assumption of memory_block size being greater or equal to section size.

The following changes are made:
1. use (start_pfn, nr_pages) pair to specify memory_block size instead of
   start_section_nr.
2. calculate memory_block id using phys / memory_block_size_bytes()
   instead of section number.

The memory_block minimum size is set to the smaller of 128MB (the old
x86_64 section size) and section size instead.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 drivers/base/memory.c  | 176 ++++++++++++++++++++---------------------
 drivers/base/node.c    |   2 +-
 include/linux/memory.h |   8 +-
 mm/memory_hotplug.c    |   6 +-
 4 files changed, 98 insertions(+), 94 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index b31b3af5c490..141431eb64a4 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -50,19 +50,15 @@ int mhp_online_type_from_str(const char *str)
=20
 static int sections_per_block;
=20
-static inline unsigned long memory_block_id(unsigned long section_nr)
+static inline unsigned long phys_to_block_id(unsigned long phys)
 {
-	return section_nr / sections_per_block;
+	return phys / memory_block_size_bytes();
 }
=20
 static inline unsigned long pfn_to_block_id(unsigned long pfn)
 {
-	return memory_block_id(pfn_to_section_nr(pfn));
-}
-
-static inline unsigned long phys_to_block_id(unsigned long phys)
-{
-	return pfn_to_block_id(PFN_DOWN(phys));
+	/* calculate using memory_block_size_bytes() */
+	return phys_to_block_id(PFN_PHYS(pfn));
 }
=20
 static int memory_subsys_online(struct device *dev);
@@ -118,7 +114,7 @@ static ssize_t phys_index_show(struct device *dev,
 	struct memory_block *mem =3D to_memory_block(dev);
 	unsigned long phys_index;
=20
-	phys_index =3D mem->start_section_nr / sections_per_block;
+	phys_index =3D pfn_to_section_nr(mem->start_pfn);
=20
 	return sysfs_emit(buf, "%08lx\n", phys_index);
 }
@@ -171,8 +167,8 @@ int memory_notify(unsigned long val, void *v)
=20
 static int memory_block_online(struct memory_block *mem)
 {
-	unsigned long start_pfn =3D section_nr_to_pfn(mem->start_section_nr);
-	unsigned long nr_pages =3D PAGES_PER_SECTION * sections_per_block;
+	unsigned long start_pfn =3D mem->start_pfn;
+	unsigned long nr_pages =3D mem->nr_pages;
 	unsigned long nr_vmemmap_pages =3D mem->nr_vmemmap_pages;
 	struct zone *zone;
 	int ret;
@@ -212,8 +208,8 @@ static int memory_block_online(struct memory_block *mem)
=20
 static int memory_block_offline(struct memory_block *mem)
 {
-	unsigned long start_pfn =3D section_nr_to_pfn(mem->start_section_nr);
-	unsigned long nr_pages =3D PAGES_PER_SECTION * sections_per_block;
+	unsigned long start_pfn =3D mem->start_pfn;
+	unsigned long nr_pages =3D mem->nr_pages;
 	unsigned long nr_vmemmap_pages =3D mem->nr_vmemmap_pages;
 	struct zone *zone;
 	int ret;
@@ -260,7 +256,7 @@ memory_block_action(struct memory_block *mem, unsigned =
long action)
 		break;
 	default:
 		WARN(1, KERN_WARNING "%s(%ld, %ld) unknown action: "
-		     "%ld\n", __func__, mem->start_section_nr, action, action);
+		     "%ld\n", __func__, mem->start_pfn, mem->nr_pages, action);
 		ret =3D -EINVAL;
 	}
=20
@@ -366,7 +362,7 @@ static ssize_t phys_device_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct memory_block *mem =3D to_memory_block(dev);
-	unsigned long start_pfn =3D section_nr_to_pfn(mem->start_section_nr);
+	unsigned long start_pfn =3D mem->start_pfn;
=20
 	return sysfs_emit(buf, "%d\n",
 			  arch_get_memory_phys_device(start_pfn));
@@ -390,8 +386,8 @@ static ssize_t valid_zones_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct memory_block *mem =3D to_memory_block(dev);
-	unsigned long start_pfn =3D section_nr_to_pfn(mem->start_section_nr);
-	unsigned long nr_pages =3D PAGES_PER_SECTION * sections_per_block;
+	unsigned long start_pfn =3D mem->start_pfn;
+	unsigned long nr_pages =3D mem->nr_pages;
 	struct zone *default_zone;
 	int len =3D 0;
 	int nid;
@@ -575,16 +571,6 @@ static struct memory_block *find_memory_block_by_id(un=
signed long block_id)
 	return mem;
 }
=20
-/*
- * Called under device_hotplug_lock.
- */
-struct memory_block *find_memory_block(struct mem_section *section)
-{
-	unsigned long block_id =3D memory_block_id(__section_nr(section));
-
-	return find_memory_block_by_id(block_id);
-}
-
 static struct attribute *memory_memblk_attrs[] =3D {
 	&dev_attr_phys_index.attr,
 	&dev_attr_state.attr,
@@ -614,7 +600,7 @@ int register_memory(struct memory_block *memory)
 	int ret;
=20
 	memory->dev.bus =3D &memory_subsys;
-	memory->dev.id =3D memory->start_section_nr / sections_per_block;
+	memory->dev.id =3D memory->start_pfn / (memory_block_size_bytes() >> PAGE=
_SHIFT);
 	memory->dev.release =3D memory_block_release;
 	memory->dev.groups =3D memory_memblk_attr_groups;
 	memory->dev.offline =3D memory->state =3D=3D MEM_OFFLINE;
@@ -633,57 +619,89 @@ int register_memory(struct memory_block *memory)
 	return ret;
 }
=20
-static int init_memory_block(unsigned long block_id, unsigned long state,
+static void unregister_memory(struct memory_block *memory)
+{
+	if (WARN_ON_ONCE(memory->dev.bus !=3D &memory_subsys))
+		return;
+
+	WARN_ON(xa_erase(&memory_blocks, memory->dev.id) =3D=3D NULL);
+
+	/* drop the ref. we got via find_memory_block() */
+	put_device(&memory->dev);
+	device_unregister(&memory->dev);
+}
+
+static int init_memory_blocks(unsigned long start_pfn, unsigned long num_p=
ages, unsigned long state,
 			     unsigned long nr_vmemmap_pages)
 {
 	struct memory_block *mem;
 	int ret =3D 0;
+	unsigned long block_nr_pages =3D memory_block_size_bytes() / PAGE_SIZE;
+	unsigned long block_start_pfn;
=20
-	mem =3D find_memory_block_by_id(block_id);
-	if (mem) {
-		put_device(&mem->dev);
-		return -EEXIST;
-	}
-	mem =3D kzalloc(sizeof(*mem), GFP_KERNEL);
-	if (!mem)
-		return -ENOMEM;
-
-	mem->start_section_nr =3D block_id * sections_per_block;
-	mem->state =3D state;
-	mem->nid =3D NUMA_NO_NODE;
-	mem->nr_vmemmap_pages =3D nr_vmemmap_pages;
+	for (block_start_pfn =3D start_pfn; num_pages !=3D 0; block_start_pfn +=
=3D block_nr_pages) {
+		unsigned long block_id =3D pfn_to_block_id(block_start_pfn);
=20
-	ret =3D register_memory(mem);
-
-	return ret;
+		mem =3D find_memory_block_by_id(block_id);
+		if (mem) {
+			put_device(&mem->dev);
+			return -EEXIST;
+		}
+		mem =3D kzalloc(sizeof(*mem), GFP_KERNEL);
+		if (!mem)
+			return -ENOMEM;
+
+		mem->start_pfn =3D block_start_pfn;
+		mem->nr_pages =3D min(num_pages, block_nr_pages);
+		mem->state =3D state;
+		mem->nid =3D NUMA_NO_NODE;
+		mem->nr_vmemmap_pages =3D nr_vmemmap_pages;
+
+		ret =3D register_memory(mem);
+
+		if (ret) {
+			unsigned long unregister_block_pfn;
+
+			for (unregister_block_pfn =3D start_pfn;
+			     unregister_block_pfn < block_start_pfn;
+			     unregister_block_pfn -=3D block_nr_pages) {
+				block_id =3D pfn_to_block_id(unregister_block_pfn);
+				mem =3D find_memory_block_by_id(block_id);
+				if (WARN_ON_ONCE(!mem))
+					continue;
+				unregister_memory(mem);
+			}
+			return -EINVAL;
+		}
+		if (num_pages > block_nr_pages)
+			num_pages -=3D block_nr_pages;
+		else
+			num_pages =3D 0;
+	}
+	return 0;
 }
=20
-static int add_memory_block(unsigned long base_section_nr)
+static void add_whole_section_memory_block(unsigned long base_section_nr)
 {
-	int section_count =3D 0;
-	unsigned long nr;
+	int ret;
+	unsigned long start_pfn =3D section_nr_to_pfn(base_section_nr);
+	unsigned long nr_pages =3D 0;
+	struct mem_section *ms =3D __nr_to_section(base_section_nr);
=20
-	for (nr =3D base_section_nr; nr < base_section_nr + sections_per_block;
-	     nr++)
-		if (present_section_nr(nr))
-			section_count++;
+	if (bitmap_full(ms->usage->subsection_map, SUBSECTIONS_PER_SECTION))
+		nr_pages =3D PAGES_PER_SECTION;
+	else
+		nr_pages =3D PAGES_PER_SUBSECTION *
+			bitmap_weight(ms->usage->subsection_map, SUBSECTIONS_PER_SECTION);
=20
-	if (section_count =3D=3D 0)
-		return 0;
-	return init_memory_block(memory_block_id(base_section_nr),
-				 MEM_ONLINE, 0);
-}
=20
-static void unregister_memory(struct memory_block *memory)
-{
-	if (WARN_ON_ONCE(memory->dev.bus !=3D &memory_subsys))
+	if (!nr_pages)
 		return;
=20
-	WARN_ON(xa_erase(&memory_blocks, memory->dev.id) =3D=3D NULL);
-
-	/* drop the ref. we got via find_memory_block() */
-	put_device(&memory->dev);
-	device_unregister(&memory->dev);
+	ret =3D init_memory_blocks(start_pfn, nr_pages, MEM_ONLINE, 0);
+	if (ret)
+		panic("%s() failed to add memory block: %d\n", __func__,
+		      ret);
 }
=20
 /*
@@ -696,31 +714,16 @@ static void unregister_memory(struct memory_block *me=
mory)
 int create_memory_block_devices(unsigned long start, unsigned long size,
 				unsigned long vmemmap_pages)
 {
-	const unsigned long start_block_id =3D pfn_to_block_id(PFN_DOWN(start));
-	unsigned long end_block_id =3D pfn_to_block_id(PFN_DOWN(start + size));
-	struct memory_block *mem;
-	unsigned long block_id;
+	unsigned long start_pfn =3D PFN_DOWN(start);
+	unsigned long end_pfn =3D PFN_DOWN(start + size);
 	int ret =3D 0;
=20
 	if (WARN_ON_ONCE(!IS_ALIGNED(start, memory_block_size_bytes()) ||
 			 !IS_ALIGNED(size, memory_block_size_bytes())))
 		return -EINVAL;
=20
-	for (block_id =3D start_block_id; block_id !=3D end_block_id; block_id++)=
 {
-		ret =3D init_memory_block(block_id, MEM_OFFLINE, vmemmap_pages);
-		if (ret)
-			break;
-	}
-	if (ret) {
-		end_block_id =3D block_id;
-		for (block_id =3D start_block_id; block_id !=3D end_block_id;
-		     block_id++) {
-			mem =3D find_memory_block_by_id(block_id);
-			if (WARN_ON_ONCE(!mem))
-				continue;
-			unregister_memory(mem);
-		}
-	}
+	ret =3D init_memory_blocks(start_pfn, end_pfn - start_pfn, MEM_OFFLINE, v=
memmap_pages);
+
 	return ret;
 }
=20
@@ -807,10 +810,7 @@ void __init memory_dev_init(void)
 	 */
 	for (nr =3D 0; nr <=3D __highest_present_section_nr;
 	     nr +=3D sections_per_block) {
-		ret =3D add_memory_block(nr);
-		if (ret)
-			panic("%s() failed to add memory block: %d\n", __func__,
-			      ret);
+		add_whole_section_memory_block(nr);
 	}
 }
=20
diff --git a/drivers/base/node.c b/drivers/base/node.c
index 2c36f61d30bc..76d67b8ddf1b 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -809,7 +809,7 @@ static int register_mem_block_under_node_early(struct m=
emory_block *mem_blk,
 					       void *arg)
 {
 	unsigned long memory_block_pfns =3D memory_block_size_bytes() / PAGE_SIZE;
-	unsigned long start_pfn =3D section_nr_to_pfn(mem_blk->start_section_nr);
+	unsigned long start_pfn =3D mem_blk->start_pfn;
 	unsigned long end_pfn =3D start_pfn + memory_block_pfns - 1;
 	int nid =3D *(int *)arg;
 	unsigned long pfn;
diff --git a/include/linux/memory.h b/include/linux/memory.h
index 97e92e8b556a..e9590c7c6a9e 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -21,10 +21,15 @@
 #include <linux/mutex.h>
 #include <linux/notifier.h>
=20
+#if SECTION_SIZE_BITS > 27  /* 128MB */
+#define MIN_MEMORY_BLOCK_SIZE     (1UL << 27)
+#else
 #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
+#endif
=20
 struct memory_block {
-	unsigned long start_section_nr;
+	unsigned long start_pfn;
+	unsigned long nr_pages;
 	unsigned long state;		/* serialized by the dev->lock */
 	int online_type;		/* for passing data to online routine */
 	int nid;			/* NID for this memory block */
@@ -90,7 +95,6 @@ int create_memory_block_devices(unsigned long start, unsi=
gned long size,
 void remove_memory_block_devices(unsigned long start, unsigned long size);
 extern void memory_dev_init(void);
 extern int memory_notify(unsigned long val, void *v);
-extern struct memory_block *find_memory_block(struct mem_section *);
 typedef int (*walk_memory_blocks_func_t)(struct memory_block *, void *);
 extern int walk_memory_blocks(unsigned long start, unsigned long size,
 			      void *arg, walk_memory_blocks_func_t func);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 70620d0dd923..6e93b0ecc5cb 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1872,8 +1872,8 @@ static int check_memblock_offlined_cb(struct memory_b=
lock *mem, void *arg)
 	if (unlikely(ret)) {
 		phys_addr_t beginpa, endpa;
=20
-		beginpa =3D PFN_PHYS(section_nr_to_pfn(mem->start_section_nr));
-		endpa =3D beginpa + memory_block_size_bytes() - 1;
+		beginpa =3D PFN_PHYS(mem->start_pfn);
+		endpa =3D beginpa + mem->nr_pages * PAGE_SIZE - 1;
 		pr_warn("removing memory fails, because memory [%pa-%pa] is onlined\n",
 			&beginpa, &endpa);
=20
@@ -2079,7 +2079,7 @@ static int try_offline_memory_block(struct memory_blo=
ck *mem, void *arg)
 	 * with multiple zones within one memory block will be rejected
 	 * by offlining code ... so we don't care about that.
 	 */
-	page =3D pfn_to_online_page(section_nr_to_pfn(mem->start_section_nr));
+	page =3D pfn_to_online_page(mem->start_pfn);
 	if (page && zone_idx(page_zone(page)) =3D=3D ZONE_MOVABLE)
 		online_type =3D MMOP_ONLINE_MOVABLE;
=20
--=20
2.30.2

