Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05460E0B7D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 20:35:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yMcg6t0lzDqJ5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 05:34:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="JfgIN10o"; 
 dkim-atps=neutral
X-Greylist: delayed 89 seconds by postgrey-1.36 at bilbo;
 Wed, 23 Oct 2019 04:14:49 AEDT
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yKr92PVyzDqLy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 04:14:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571764486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AZH06pjD8CJbFdhi6tvHbczu1qJrML9IKvQHQzytrv0=;
 b=JfgIN10olwVuY1uDGQuD93Iv82nvvTW37Vxu+eKpFBOb9Sr70l4wOlSVGHPo6ryC2ndYyx
 zQmSzFdwq6Pwe+ome9fTVpjuiJ5KvhtRNS6LY2gKpt8SNfP0ZB0nQDwEU8eyxo25R4sZyL
 uU6kS+9ot6EgtEEzB8Hivqlef+Lft7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-GNMLLVycPz2hWyHgrsFHmQ-1; Tue, 22 Oct 2019 13:13:37 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03CD81800D6A;
 Tue, 22 Oct 2019 17:13:31 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-248.ams2.redhat.com [10.36.116.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C74C05DA8D;
 Tue, 22 Oct 2019 17:13:07 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v1 01/12] mm/memory_hotplug: Don't allow to online/offline
 memory blocks with holes
Date: Tue, 22 Oct 2019 19:12:28 +0200
Message-Id: <20191022171239.21487-2-david@redhat.com>
In-Reply-To: <20191022171239.21487-1-david@redhat.com>
References: <20191022171239.21487-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: GNMLLVycPz2hWyHgrsFHmQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 23 Oct 2019 05:28:43 +1100
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>,
 =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 Ben Chan <benchan@chromium.org>, Kees Cook <keescook@chromium.org>,
 devel@driverdev.osuosl.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Madhumitha Prabakaran <madhumithabiw@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Nishka Dasgupta <nishkadg.linux@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Juergen Gross <jgross@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 =?UTF-8?q?Simon=20Sandstr=C3=B6m?= <simon@nikanor.nu>,
 Dan Williams <dan.j.williams@intel.com>, kvm-ppc@vger.kernel.org,
 Qian Cai <cai@lca.pw>, Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Todd Poynor <toddpoynor@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Allison Randal <allison@lohutok.net>, Jim Mattson <jmattson@google.com>,
 Vandana BN <bnvandana@gmail.com>, Jeremy Sowden <jeremy@azazel.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Rob Springer <rspringer@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Our onlining/offlining code is unnecessarily complicated. Only memory
blocks added during boot can have holes. Hotplugged memory never has
holes. That memory is already online.

When we stop allowing to offline memory blocks with holes, we implicitly
stop to online memory blocks with holes.

This allows to simplify the code. For example, we no longer have to
worry about marking pages that fall into memory holes PG_reserved when
onlining memory. We can stop setting pages PG_reserved.

Offlining memory blocks added during boot is usually not guranteed to work
either way. So stopping to do that (if anybody really used and tested
this over the years) should not really hurt. For the use case of
offlining memory to unplug DIMMs, we should see no change. (holes on
DIMMs would be weird)

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory_hotplug.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 561371ead39a..7210f4375279 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1447,10 +1447,19 @@ static void node_states_clear_node(int node, struct=
 memory_notify *arg)
 =09=09node_clear_state(node, N_MEMORY);
 }
=20
+static int count_system_ram_pages_cb(unsigned long start_pfn,
+=09=09=09=09     unsigned long nr_pages, void *data)
+{
+=09unsigned long *nr_system_ram_pages =3D data;
+
+=09*nr_system_ram_pages +=3D nr_pages;
+=09return 0;
+}
+
 static int __ref __offline_pages(unsigned long start_pfn,
 =09=09  unsigned long end_pfn)
 {
-=09unsigned long pfn, nr_pages;
+=09unsigned long pfn, nr_pages =3D 0;
 =09unsigned long offlined_pages =3D 0;
 =09int ret, node, nr_isolate_pageblock;
 =09unsigned long flags;
@@ -1461,6 +1470,20 @@ static int __ref __offline_pages(unsigned long start=
_pfn,
=20
 =09mem_hotplug_begin();
=20
+=09/*
+=09 * We don't allow to offline memory blocks that contain holes
+=09 * and consecuently don't allow to online memory blocks that contain
+=09 * holes. This allows to simplify the code quite a lot and we don't
+=09 * have to mess with PG_reserved pages for memory holes.
+=09 */
+=09walk_system_ram_range(start_pfn, end_pfn - start_pfn, &nr_pages,
+=09=09=09      count_system_ram_pages_cb);
+=09if (nr_pages !=3D end_pfn - start_pfn) {
+=09=09ret =3D -EINVAL;
+=09=09reason =3D "memory holes";
+=09=09goto failed_removal;
+=09}
+
 =09/* This makes hotplug much easier...and readable.
 =09   we assume this for now. .*/
 =09if (!test_pages_in_a_zone(start_pfn, end_pfn, &valid_start,
@@ -1472,7 +1495,6 @@ static int __ref __offline_pages(unsigned long start_=
pfn,
=20
 =09zone =3D page_zone(pfn_to_page(valid_start));
 =09node =3D zone_to_nid(zone);
-=09nr_pages =3D end_pfn - start_pfn;
=20
 =09/* set above range as isolated */
 =09ret =3D start_isolate_page_range(start_pfn, end_pfn,
--=20
2.21.0

