Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A564CC3F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 12:50:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tz9r03rKzDrLv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 20:50:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TysJ1lTJzDrDl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 20:36:04 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3AF3386663;
 Thu, 20 Jun 2019 10:36:02 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-88.ams2.redhat.com [10.36.117.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 628215C66B;
 Thu, 20 Jun 2019 10:35:59 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] drivers/base/memory.c: Get rid of
 find_memory_block_hinted()
Date: Thu, 20 Jun 2019 12:35:20 +0200
Message-Id: <20190620103520.23481-7-david@redhat.com>
In-Reply-To: <20190620103520.23481-1-david@redhat.com>
References: <20190620103520.23481-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 20 Jun 2019 10:36:02 +0000 (UTC)
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 David Hildenbrand <david@redhat.com>,
 "mike.travis@hpe.com" <mike.travis@hpe.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-mm@kvack.org,
 linux-acpi@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No longer needed, let's remove it. Also, drop the "hint" parameter
completely from "find_memory_block_by_id", as nobody needs it anymore.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: "mike.travis@hpe.com" <mike.travis@hpe.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/base/memory.c  | 32 ++++++++++----------------------
 include/linux/memory.h |  2 --
 2 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 0204384b4d1d..fefb64d3588e 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -592,26 +592,12 @@ int __weak arch_get_memory_phys_device(unsigned long start_pfn)
  * A reference for the returned object is held and the reference for the
  * hinted object is released.
  */
-static struct memory_block *find_memory_block_by_id(unsigned long block_id,
-						    struct memory_block *hint)
+static struct memory_block *find_memory_block_by_id(unsigned long block_id)
 {
-	struct device *hintdev = hint ? &hint->dev : NULL;
 	struct device *dev;
 
-	dev = subsys_find_device_by_id(&memory_subsys, block_id, hintdev);
-	if (hint)
-		put_device(&hint->dev);
-	if (!dev)
-		return NULL;
-	return to_memory_block(dev);
-}
-
-struct memory_block *find_memory_block_hinted(struct mem_section *section,
-					      struct memory_block *hint)
-{
-	unsigned long block_id = base_memory_block_id(__section_nr(section));
-
-	return find_memory_block_by_id(block_id, hint);
+	dev = subsys_find_device_by_id(&memory_subsys, block_id, NULL);
+	return dev ? to_memory_block(dev) : NULL;
 }
 
 /*
@@ -624,7 +610,9 @@ struct memory_block *find_memory_block_hinted(struct mem_section *section,
  */
 struct memory_block *find_memory_block(struct mem_section *section)
 {
-	return find_memory_block_hinted(section, NULL);
+	unsigned long block_id = base_memory_block_id(__section_nr(section));
+
+	return find_memory_block_by_id(block_id);
 }
 
 static struct attribute *memory_memblk_attrs[] = {
@@ -675,7 +663,7 @@ static int init_memory_block(struct memory_block **memory,
 	unsigned long start_pfn;
 	int ret = 0;
 
-	mem = find_memory_block_by_id(block_id, NULL);
+	mem = find_memory_block_by_id(block_id);
 	if (mem) {
 		put_device(&mem->dev);
 		return -EEXIST;
@@ -755,7 +743,7 @@ int create_memory_block_devices(unsigned long start, unsigned long size)
 		end_block_id = block_id;
 		for (block_id = start_block_id; block_id != end_block_id;
 		     block_id++) {
-			mem = find_memory_block_by_id(block_id, NULL);
+			mem = find_memory_block_by_id(block_id);
 			mem->section_count = 0;
 			unregister_memory(mem);
 		}
@@ -782,7 +770,7 @@ void remove_memory_block_devices(unsigned long start, unsigned long size)
 
 	mutex_lock(&mem_sysfs_mutex);
 	for (block_id = start_block_id; block_id != end_block_id; block_id++) {
-		mem = find_memory_block_by_id(block_id, NULL);
+		mem = find_memory_block_by_id(block_id);
 		if (WARN_ON_ONCE(!mem))
 			continue;
 		mem->section_count = 0;
@@ -882,7 +870,7 @@ int walk_memory_blocks(unsigned long start, unsigned long size,
 	int ret = 0;
 
 	for (block_id = start_block_id; block_id <= end_block_id; block_id++) {
-		mem = find_memory_block_by_id(block_id, NULL);
+		mem = find_memory_block_by_id(block_id);
 		if (!mem)
 			continue;
 
diff --git a/include/linux/memory.h b/include/linux/memory.h
index b3b388775a30..02e633f3ede0 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -116,8 +116,6 @@ void remove_memory_block_devices(unsigned long start, unsigned long size);
 extern int memory_dev_init(void);
 extern int memory_notify(unsigned long val, void *v);
 extern int memory_isolate_notify(unsigned long val, void *v);
-extern struct memory_block *find_memory_block_hinted(struct mem_section *,
-							struct memory_block *);
 extern struct memory_block *find_memory_block(struct mem_section *);
 typedef int (*walk_memory_blocks_func_t)(struct memory_block *, void *);
 extern int walk_memory_blocks(unsigned long start, unsigned long size,
-- 
2.21.0

