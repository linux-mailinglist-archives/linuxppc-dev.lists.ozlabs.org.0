Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 539F5459F5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 12:08:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QGWb6fpwzDrJt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 20:07:55 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QGNm4bdyzDrVY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 20:02:00 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A926B308FF30;
 Fri, 14 Jun 2019 10:01:47 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-252.ams2.redhat.com [10.36.116.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7A305D9D2;
 Fri, 14 Jun 2019 10:01:42 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/6] drivers/base/memory: Use "unsigned long" for block ids
Date: Fri, 14 Jun 2019 12:01:10 +0200
Message-Id: <20190614100114.311-3-david@redhat.com>
In-Reply-To: <20190614100114.311-1-david@redhat.com>
References: <20190614100114.311-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 14 Jun 2019 10:01:52 +0000 (UTC)
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
Cc: David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-mm@kvack.org,
 linux-acpi@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Block ids are just shifted section numbers, so let's also use
"unsigned long" for them, too.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/base/memory.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 5b3a2fd250ba..3ed08e67e64f 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -34,12 +34,12 @@ static DEFINE_MUTEX(mem_sysfs_mutex);
 
 static int sections_per_block;
 
-static inline int base_memory_block_id(unsigned long section_nr)
+static inline unsigned long base_memory_block_id(unsigned long section_nr)
 {
 	return section_nr / sections_per_block;
 }
 
-static inline int pfn_to_block_id(unsigned long pfn)
+static inline unsigned long pfn_to_block_id(unsigned long pfn)
 {
 	return base_memory_block_id(pfn_to_section_nr(pfn));
 }
@@ -587,7 +587,7 @@ int __weak arch_get_memory_phys_device(unsigned long start_pfn)
  * A reference for the returned object is held and the reference for the
  * hinted object is released.
  */
-static struct memory_block *find_memory_block_by_id(int block_id,
+static struct memory_block *find_memory_block_by_id(unsigned long block_id,
 						    struct memory_block *hint)
 {
 	struct device *hintdev = hint ? &hint->dev : NULL;
@@ -604,7 +604,7 @@ static struct memory_block *find_memory_block_by_id(int block_id,
 struct memory_block *find_memory_block_hinted(struct mem_section *section,
 					      struct memory_block *hint)
 {
-	int block_id = base_memory_block_id(__section_nr(section));
+	unsigned long block_id = base_memory_block_id(__section_nr(section));
 
 	return find_memory_block_by_id(block_id, hint);
 }
@@ -663,8 +663,8 @@ int register_memory(struct memory_block *memory)
 	return ret;
 }
 
-static int init_memory_block(struct memory_block **memory, int block_id,
-			     unsigned long state)
+static int init_memory_block(struct memory_block **memory,
+			     unsigned long block_id, unsigned long state)
 {
 	struct memory_block *mem;
 	unsigned long start_pfn;
@@ -730,8 +730,8 @@ static void unregister_memory(struct memory_block *memory)
  */
 int create_memory_block_devices(unsigned long start, unsigned long size)
 {
-	const int start_block_id = pfn_to_block_id(PFN_DOWN(start));
-	int end_block_id = pfn_to_block_id(PFN_DOWN(start + size));
+	const unsigned long start_block_id = pfn_to_block_id(PFN_DOWN(start));
+	unsigned long end_block_id = pfn_to_block_id(PFN_DOWN(start + size));
 	struct memory_block *mem;
 	unsigned long block_id;
 	int ret = 0;
@@ -767,10 +767,10 @@ int create_memory_block_devices(unsigned long start, unsigned long size)
  */
 void remove_memory_block_devices(unsigned long start, unsigned long size)
 {
-	const int start_block_id = pfn_to_block_id(PFN_DOWN(start));
-	const int end_block_id = pfn_to_block_id(PFN_DOWN(start + size));
+	const unsigned long start_block_id = pfn_to_block_id(PFN_DOWN(start));
+	const unsigned long end_block_id = pfn_to_block_id(PFN_DOWN(start + size));
 	struct memory_block *mem;
-	int block_id;
+	unsigned long block_id;
 
 	if (WARN_ON_ONCE(!IS_ALIGNED(start, memory_block_size_bytes()) ||
 			 !IS_ALIGNED(size, memory_block_size_bytes())))
-- 
2.21.0

