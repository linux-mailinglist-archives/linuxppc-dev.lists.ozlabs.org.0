Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF631818DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 13:56:08 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48csQY4pFTzDqFC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 23:56:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=STC5jLeH; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48crsj6FcqzDqN1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 23:31:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583929863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/sbomtSLrHdGOruJ2tgfKohuV+eWUZQ6CK4TodM1MVc=;
 b=STC5jLeHV9F4WtrqjEZC2ycbbcD4zT57tkRKa875veFqojGxavYXiOWRkbkWalv+C1Y4CE
 x8QvZzd1VTG5Rm7kHVZbVhxMA/YzSzto0nCsAMLWK4TznS/a/YtzUc9ltSUqv6urpKmamc
 P/0lw2Nh9UHkzf4tqhJ99mvTHdiWVf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-qxhbtyNkOxiHCZULO3cxRA-1; Wed, 11 Mar 2020 08:31:01 -0400
X-MC-Unique: qxhbtyNkOxiHCZULO3cxRA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D47CBDBA7;
 Wed, 11 Mar 2020 12:30:59 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.36.118.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C017D5C1D4;
 Wed, 11 Mar 2020 12:30:55 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] mm/memory_hotplug: allow to specify a default
 online_type
Date: Wed, 11 Mar 2020 13:30:26 +0100
Message-Id: <20200311123026.16071-6-david@redhat.com>
In-Reply-To: <20200311123026.16071-1-david@redhat.com>
References: <20200311123026.16071-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: linux-hyperv@vger.kernel.org, Baoquan He <bhe@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Wei Yang <richard.weiyang@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For now, distributions implement advanced udev rules to essentially
- Don't online any hotplugged memory (s390x)
- Online all memory to ZONE_NORMAL (e.g., most virt environments like
  hyperv)
- Online all memory to ZONE_MOVABLE in case the zone imbalance is taken
  care of (e.g., bare metal, special virt environments)

In summary: All memory is usually onlined the same way, however, the
kernel always has to ask userspace to come up with the same answer.
E.g., HyperV always waits for a memory block to get onlined before
continuing, otherwise it might end up adding memory faster than
hotplugging it, which can result in strange OOM situations.

Let's allow to specify a default online_type, not just "online" and
"offline". This allows distributions to configure the default online_type
when booting up and be done with it.

We can now specify "offline", "online", "online_movable" and
"online_kernel" via
- "memhp_default_state=3D" on the kernel cmdline
- /sys/devices/systemn/memory/auto_online_blocks
just like we are able to specify for a single memory block via
/sys/devices/systemn/memory/memoryX/state

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Baoquan He <bhe@redhat.com>
Cc: Wei Yang <richard.weiyang@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/base/memory.c          | 11 +++++------
 include/linux/memory_hotplug.h |  2 ++
 mm/memory_hotplug.c            |  8 ++++----
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 8d3e16dab69f..2b09b68b9f78 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -35,7 +35,7 @@ static const char *const online_type_to_str[] =3D {
 	[MMOP_ONLINE_MOVABLE] =3D "online_movable",
 };
=20
-static int memhp_online_type_from_str(const char *str)
+int memhp_online_type_from_str(const char *str)
 {
 	int i;
=20
@@ -394,13 +394,12 @@ static ssize_t auto_online_blocks_store(struct devi=
ce *dev,
 					struct device_attribute *attr,
 					const char *buf, size_t count)
 {
-	if (sysfs_streq(buf, "online"))
-		memhp_default_online_type =3D MMOP_ONLINE;
-	else if (sysfs_streq(buf, "offline"))
-		memhp_default_online_type =3D MMOP_OFFLINE;
-	else
+	const int online_type =3D memhp_online_type_from_str(buf);
+
+	if (online_type < 0)
 		return -EINVAL;
=20
+	memhp_default_online_type =3D online_type;
 	return count;
 }
=20
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplu=
g.h
index c6e090b34c4b..ef55115320fb 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -117,6 +117,8 @@ extern int arch_add_memory(int nid, u64 start, u64 si=
ze,
 			struct mhp_restrictions *restrictions);
 extern u64 max_mem_size;
=20
+extern int memhp_online_type_from_str(const char *str);
+
 /* Default online_type (MMOP_*) when new memory blocks are added. */
 extern int memhp_default_online_type;
 /* If movable_node boot option specified */
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 01443c70aa27..4a96273eafa7 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -75,10 +75,10 @@ EXPORT_SYMBOL_GPL(memhp_default_online_type);
=20
 static int __init setup_memhp_default_state(char *str)
 {
-	if (!strcmp(str, "online"))
-		memhp_default_online_type =3D MMOP_ONLINE;
-	else if (!strcmp(str, "offline"))
-		memhp_default_online_type =3D MMOP_OFFLINE;
+	const int online_type =3D memhp_online_type_from_str(str);
+
+	if (online_type >=3D 0)
+		memhp_default_online_type =3D online_type;
=20
 	return 1;
 }
--=20
2.24.1

