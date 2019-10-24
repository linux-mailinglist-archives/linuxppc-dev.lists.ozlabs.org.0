Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0551E3C3D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 21:44:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zd490zS4zDqJc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 06:44:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="fA35Lm0/"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zR0D6JFFzDqTq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 23:10:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571919034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ci8rTmGAQWvcufbTawC9IhJzwFepcNIlGotHVYhTC24=;
 b=fA35Lm0/4rM/DhyvYKjMnPhH55wQsNmhGbLvVb0qOLKPQw18ljSS1iirjVBN/wxmH+Aqxd
 fnfIFsiaTedNXl9CtUswpGbJ7MuVSSzTWDTS8eoFXrLpyyxD7LxbRPFokiqIPCPmTLwcOG
 U5DCep5yfeeT2q4kG7Q6vZa7RpD0A8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-OyS-w0OOPfCXkYu6xkkqOg-1; Thu, 24 Oct 2019 08:10:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17898800D49;
 Thu, 24 Oct 2019 12:10:23 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-141.ams2.redhat.com [10.36.116.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9159B52D1;
 Thu, 24 Oct 2019 12:10:01 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/10] mm/memory_hotplug: Don't allow to online/offline
 memory blocks with holes
Date: Thu, 24 Oct 2019 14:09:29 +0200
Message-Id: <20191024120938.11237-2-david@redhat.com>
In-Reply-To: <20191024120938.11237-1-david@redhat.com>
References: <20191024120938.11237-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: OyS-w0OOPfCXkYu6xkkqOg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 25 Oct 2019 06:41:16 +1100
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
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>, Kees Cook <keescook@chromium.org>,
 devel@driverdev.osuosl.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Juergen Gross <jgross@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Sasha Levin <sashal@kernel.org>,
 kvm-ppc@vger.kernel.org, Qian Cai <cai@lca.pw>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jim Mattson <jmattson@google.com>, Mel Gorman <mgorman@techsingularity.net>,
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Our onlining/offlining code is unnecessarily complicated. Only memory
blocks added during boot can have holes (a range that is not
IORESOURCE_SYSTEM_RAM). Hotplugged memory never has holes (e.g., see
add_memory_resource()). All boot memory is alread online.

Therefore, when we stop allowing to offline memory blocks with holes, we
implicitly no longer have to deal with onlining memory blocks with holes.

This allows to simplify the code. For example, we no longer have to
worry about marking pages that fall into memory holes PG_reserved when
onlining memory. We can stop setting pages PG_reserved.

Offlining memory blocks added during boot is usually not guranteed to work
either way (unmovable data might have easily ended up on that memory during
boot). So stopping to do that should not really hurt (+ people are not
even aware of a setup where that used to work and that the existing code
still works correctly with memory holes). For the use case of offlining
memory to unplug DIMMs, we should see no change. (holes on DIMMs would be
weird).

Please note that hardware errors (PG_hwpoison) are not memory holes and
not affected by this change when offlining.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory_hotplug.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 561371ead39a..8d81730cf036 100644
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
+=09 * Don't allow to offline memory blocks that contain holes.
+=09 * Consecuently, memory blocks with holes can never get onlined
+=09 * (hotplugged memory has no holes and all boot memory is online).
+=09 * This allows to simplify the onlining/offlining code quite a lot.
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

