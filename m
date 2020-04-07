Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 980231A0ECF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 16:03:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xTdR3SJvzDqGM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 00:03:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=IdI9lcLr; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xTRd2tcCzDqLx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 23:54:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586267672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hECXe/ScdXiWieGl51KSz97pYlZ6hab45z2McF4NSw=;
 b=IdI9lcLra1qXWT1NjMpnHiR0bj+XzhTwt7/vuI7mp8PGUrzDzRC9cvJ+9PDYc5/He+8dMM
 KAB8T3mpr5LKgrqoHFI8EgpUL8fQkuWkfAJhu5Wn7/pkO3m92YEbiwys9UHtAI0NHr7dWv
 E4Yox6+8QMwWb00OQGJGmJH0N2/gZc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-2W7s--LtNgSfmWht8rBhpw-1; Tue, 07 Apr 2020 09:54:30 -0400
X-MC-Unique: 2W7s--LtNgSfmWht8rBhpw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BFE21088384;
 Tue,  7 Apr 2020 13:54:26 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-167.ams2.redhat.com [10.36.114.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03C8A96FB1;
 Tue,  7 Apr 2020 13:54:23 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] powerpc/pseries/hotplug-memory: stop checking
 is_mem_section_removable()
Date: Tue,  7 Apr 2020 15:54:15 +0200
Message-Id: <20200407135416.24093-2-david@redhat.com>
In-Reply-To: <20200407135416.24093-1-david@redhat.com>
References: <20200407135416.24093-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
 David Hildenbrand <david@redhat.com>, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In commit 53cdc1cb29e8 ("drivers/base/memory.c: indicate all memory
blocks as removable"), the user space interface to compute whether a memo=
ry
block can be offlined (exposed via
/sys/devices/system/memory/memoryX/removable) has effectively been
deprecated. We want to remove the leftovers of the kernel implementation.

When offlining a memory block (mm/memory_hotplug.c:__offline_pages()),
we'll start by:
1. Testing if it contains any holes, and reject if so
2. Testing if pages belong to different zones, and reject if so
3. Isolating the page range, checking if it contains any unmovable pages

Using is_mem_section_removable() before trying to offline is not only rac=
y,
it can easily result in false positives/negatives. Let's stop manually
checking is_mem_section_removable(), and let device_offline() handle it
completely instead. We can remove the racy is_mem_section_removable()
implementation next.

We now take more locks (e.g., memory hotplug lock when offlining and the
zone lock when isolating), but maybe we should optimize that
implementation instead if this ever becomes a real problem (after all,
memory unplug is already an expensive operation). We started using
is_mem_section_removable() in commit 51925fb3c5c9 ("powerpc/pseries:
Implement memory hotplug remove in the kernel"), with the initial
hotremove support of lmbs.

Cc: Nathan Fontenot <nfont@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Baoquan He <bhe@redhat.com>
Cc: Wei Yang <richard.weiyang@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 .../platforms/pseries/hotplug-memory.c        | 26 +++----------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/power=
pc/platforms/pseries/hotplug-memory.c
index b2cde1732301..5ace2f9a277e 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -337,39 +337,19 @@ static int pseries_remove_mem_node(struct device_no=
de *np)
=20
 static bool lmb_is_removable(struct drmem_lmb *lmb)
 {
-	int i, scns_per_block;
-	bool rc =3D true;
-	unsigned long pfn, block_sz;
-	u64 phys_addr;
-
 	if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
 		return false;
=20
-	block_sz =3D memory_block_size_bytes();
-	scns_per_block =3D block_sz / MIN_MEMORY_BLOCK_SIZE;
-	phys_addr =3D lmb->base_addr;
-
 #ifdef CONFIG_FA_DUMP
 	/*
 	 * Don't hot-remove memory that falls in fadump boot memory area
 	 * and memory that is reserved for capturing old kernel memory.
 	 */
-	if (is_fadump_memory_area(phys_addr, block_sz))
+	if (is_fadump_memory_area(lmb->base_addr, memory_block_size_bytes()))
 		return false;
 #endif
-
-	for (i =3D 0; i < scns_per_block; i++) {
-		pfn =3D PFN_DOWN(phys_addr);
-		if (!pfn_in_present_section(pfn)) {
-			phys_addr +=3D MIN_MEMORY_BLOCK_SIZE;
-			continue;
-		}
-
-		rc =3D rc && is_mem_section_removable(pfn, PAGES_PER_SECTION);
-		phys_addr +=3D MIN_MEMORY_BLOCK_SIZE;
-	}
-
-	return rc;
+	/* device_offline() will determine if we can actually remove this lmb *=
/
+	return true;
 }
=20
 static int dlpar_add_lmb(struct drmem_lmb *);
--=20
2.25.1

