Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5E7EB353
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 16:01:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473pS84wYXzDr9K
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 02:01:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="IcPOzcsq"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473nmb3XPlzF5nL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 01:30:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572532235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hdK9AU9y2RagTsYY1CTHXbikq1GyDp415JyKkuQAWjo=;
 b=IcPOzcsqKra3nzUy5rHYuJRha9Otgj1uCegv73arMnWzU7KPdPFfxojeB9MBzdo+2dWXd2
 10Ypzkg+ckVudnggvksH2HVk/L0JiwhC3KHeFzJcVqQlhSxpS88QCRxufgb7FL1u/X+j6N
 xtl15sCvXCmwS7tOgkoVY88/iKV1+8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-7DfiSHdLM3227xLe1wgTig-1; Thu, 31 Oct 2019 10:30:33 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72F43800D49;
 Thu, 31 Oct 2019 14:30:31 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.118.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F1F25D6D6;
 Thu, 31 Oct 2019 14:30:27 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 09/12] powerpc/pseries: CMM: Switch to balloon_page_alloc()
Date: Thu, 31 Oct 2019 15:29:30 +0100
Message-Id: <20191031142933.10779-10-david@redhat.com>
In-Reply-To: <20191031142933.10779-1-david@redhat.com>
References: <20191031142933.10779-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 7DfiSHdLM3227xLe1wgTig-1
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
Cc: Michal Hocko <mhocko@suse.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 David Hildenbrand <david@redhat.com>,
 Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Arun KS <arunks@codeaurora.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

balloon_page_alloc() will use GFP_HIGHUSER_MOVABLE in case we have
CONFIG_BALLOON_COMPACTION. This is now possible, as balloon pages are
movable with CONFIG_BALLOON_COMPACTION. Without
CONFIG_BALLOON_COMPACTION, GFP_HIGHUSER is used.

Note that apart from that, balloon_page_alloc() uses the following
flags:
    __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN
And current code used:
    GFP_NOIO | __GFP_NOWARN | __GFP_NORETRY | __GFP_NOMEMALLOC

GFP_HIGHUSER/GFP_HIGHUSER_MOVABLE include
    __GFP_RECLAIM | __GFP_IO | __GFP_FS | __GFP_HARDWALL | __GFP_HIGHMEM

GFP_NOIO is __GFP_RECLAIM.

With CONFIG_BALLOON_COMPACTION, we essentially add:
    __GFP_IO | __GFP_FS | __GFP_HARDWALL | __GFP_HIGHMEM | __GFP_MOVABLE

Without CONFIG_BALLOON_COMPACTION, we essentially add:
    __GFP_IO | __GFP_FS | __GFP_HARDWALL | __GFP_HIGHMEM

I assume this is fine, as this is what all other balloon compaction
users use. If it turns out to be a problem, we could add
__GFP_MOVABLE manually if we have CONFIG_BALLOON_COMPACTION.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arun KS <arunks@codeaurora.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/pseries/cmm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/=
pseries/cmm.c
index 235fd7fe9df1..a6ec2bbb1f91 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -147,8 +147,7 @@ static long cmm_alloc_pages(long nr)
 =09=09=09break;
 =09=09}
=20
-=09=09page =3D alloc_page(GFP_NOIO | __GFP_NOWARN | __GFP_NORETRY |
-=09=09=09=09  __GFP_NOMEMALLOC);
+=09=09page =3D balloon_page_alloc();
 =09=09if (!page)
 =09=09=09break;
 =09=09rc =3D plpar_page_set_loaned(page);
--=20
2.21.0

