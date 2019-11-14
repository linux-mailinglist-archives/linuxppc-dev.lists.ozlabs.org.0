Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA42FC753
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 14:25:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DMfv2fwczF701
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 00:25:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="HaqAJpF0"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DMX31RXwzF7Y4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 00:19:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573737567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DzLYkRszegqqW9y6TySH5Na1v7DLZhrGRv6iPZCzz2w=;
 b=HaqAJpF0g6OeRsy2h/3DJje95H7lTyaScHoDzWz+MMy6RvUp+3LxAsBt6Rn0f+Fx+DXoav
 0+2m7W4+ahPA0csY9JHHTCpD90DuXKeaR+46x1ERQmp8HYJxcfoahDBjOgm9YRAhSzhyea
 rMftONrAd0/6colxAOSUbv5NHZKjtSs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-yhF_a1gEMSSlfy_JVwRXzg-1; Thu, 14 Nov 2019 08:19:24 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A114184B9F1;
 Thu, 14 Nov 2019 13:19:21 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-13.ams2.redhat.com [10.36.117.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 488E310375FC;
 Thu, 14 Nov 2019 13:19:12 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] mm: remove the memory isolate notifier
Date: Thu, 14 Nov 2019 14:19:09 +0100
Message-Id: <20191114131911.11783-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: yhF_a1gEMSSlfy_JVwRXzg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>,
 Pingfan Liu <kernelfans@gmail.com>, linux-mm@kvack.org,
 Alexander Potapenko <glider@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Qian Cai <cai@lca.pw>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wei Yang <richardw.yang@linux.intel.com>, Arun KS <arunks@codeaurora.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is the MM part of
=09https://lkml.org/lkml/2019/10/31/487

"We can get rid of the memory isolate notifier by switching to balloon
compaction in powerpc's CMM (Collaborative Memory Management). The memory
isolate notifier was only necessary to allow to offline memory blocks that
contain inflated/"loaned" pages - which also possible when the inflated
pages are movable (via balloon compaction). [...]"

Michael queued the POWERPC bits that remove the single user, but I am
missing ACKs for the MM bits. I think it makes sense to let these two
patches also go via Michael's tree, to avoid collissions. Thoughts?

v1 -> v2: (MM bits)
- "mm: remove the memory isolate notifier"
-- Remove another stale comment
-- Minor code cleanup

David Hildenbrand (2):
  mm: remove the memory isolate notifier
  mm: remove "count" parameter from has_unmovable_pages()

 drivers/base/memory.c          | 19 -----------------
 include/linux/memory.h         | 27 ------------------------
 include/linux/page-isolation.h |  4 ++--
 mm/memory_hotplug.c            |  2 +-
 mm/page_alloc.c                | 21 +++++++------------
 mm/page_isolation.c            | 38 ++++------------------------------
 6 files changed, 14 insertions(+), 97 deletions(-)

--=20
2.21.0

