Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 591CE2AA9ED
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Nov 2020 08:04:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CTQ8j3bdCzDr8H
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Nov 2020 18:04:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=pk+UXnWl; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CTQ2P4W4vzDr9w
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Nov 2020 17:58:37 +1100 (AEDT)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A5C82220B;
 Sun,  8 Nov 2020 06:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604818714;
 bh=bLvjJYeeBrvAhwsB8ydCu/dSvPoYTnDbCXIZfO7bBpA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pk+UXnWlD99VvXbDF/TM8NluRf6qHt6njISKMIY/ZhLcoZ71g+EEieqVkb7/Te7tn
 PyQ0+/KksGKCPio0RzFy+fVcBvLhWJNAcfeMQjudGY0NglGGihwGnU9qzcdkVR+ndk
 DGfk2klRTHHITuZudo1qWCv0LcwCklQzJcFInHgs=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 2/5] slab: debug: split slab_kernel_map() to map and unmap
 variants
Date: Sun,  8 Nov 2020 08:57:55 +0200
Message-Id: <20201108065758.1815-3-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201108065758.1815-1-rppt@kernel.org>
References: <20201108065758.1815-1-rppt@kernel.org>
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

Instead of using slab_kernel_map() with 'map' parameter to remap pages when
DEBUG_PAGEALLOC is enabled, use dedicated helpers slab_kernel_map() and
slab_kernel_unmap().

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 mm/slab.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/mm/slab.c b/mm/slab.c
index 07317386e150..0719421d69f7 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -1428,17 +1428,21 @@ static bool is_debug_pagealloc_cache(struct kmem_cache *cachep)
 	return false;
 }
 
-static void slab_kernel_map(struct kmem_cache *cachep, void *objp, int map)
+static void slab_kernel_map(struct kmem_cache *cachep, void *objp)
 {
 	if (!is_debug_pagealloc_cache(cachep))
 		return;
 
-	if (map)
-		debug_pagealloc_map_pages(virt_to_page(objp),
-					  cachep->size / PAGE_SIZE);
-	else
-		debug_pagealloc_unmap_pages(virt_to_page(objp),
-					    cachep->size / PAGE_SIZE);
+	debug_pagealloc_map_pages(virt_to_page(objp), cachep->size / PAGE_SIZE);
+}
+
+static void slab_kernel_unmap(struct kmem_cache *cachep, void *objp)
+{
+	if (!is_debug_pagealloc_cache(cachep))
+		return;
+
+	debug_pagealloc_unmap_pages(virt_to_page(objp),
+				    cachep->size / PAGE_SIZE);
 }
 
 static void poison_obj(struct kmem_cache *cachep, void *addr, unsigned char val)
@@ -1585,7 +1589,7 @@ static void slab_destroy_debugcheck(struct kmem_cache *cachep,
 
 		if (cachep->flags & SLAB_POISON) {
 			check_poison_obj(cachep, objp);
-			slab_kernel_map(cachep, objp, 1);
+			slab_kernel_map(cachep, objp);
 		}
 		if (cachep->flags & SLAB_RED_ZONE) {
 			if (*dbg_redzone1(cachep, objp) != RED_INACTIVE)
@@ -2360,7 +2364,7 @@ static void cache_init_objs_debug(struct kmem_cache *cachep, struct page *page)
 		/* need to poison the objs? */
 		if (cachep->flags & SLAB_POISON) {
 			poison_obj(cachep, objp, POISON_FREE);
-			slab_kernel_map(cachep, objp, 0);
+			slab_kernel_unmap(cachep, objp);
 		}
 	}
 #endif
@@ -2728,7 +2732,7 @@ static void *cache_free_debugcheck(struct kmem_cache *cachep, void *objp,
 
 	if (cachep->flags & SLAB_POISON) {
 		poison_obj(cachep, objp, POISON_FREE);
-		slab_kernel_map(cachep, objp, 0);
+		slab_kernel_unmap(cachep, objp);
 	}
 	return objp;
 }
@@ -2993,7 +2997,7 @@ static void *cache_alloc_debugcheck_after(struct kmem_cache *cachep,
 		return objp;
 	if (cachep->flags & SLAB_POISON) {
 		check_poison_obj(cachep, objp);
-		slab_kernel_map(cachep, objp, 1);
+		slab_kernel_map(cachep, objp);
 		poison_obj(cachep, objp, POISON_INUSE);
 	}
 	if (cachep->flags & SLAB_STORE_USER)
-- 
2.28.0

