Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 538861202AE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 11:32:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47byK13b8PzDqSH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 21:32:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="NITuPJbL"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47byH51LKczDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2019 21:31:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576492269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Eo005stHRd9C8m5vBASr94rer3WPzPVBtfLVLTsOZZo=;
 b=NITuPJbLOcemBHHPJDB1gmUZxyFb/GvKypQeAm7uyCPyBatpxWiZUKAwLQFU6cEQJWYOB5
 Jd6MyDyt5aLJejhL10Vl/Z2LZ/ieq4d1D2jjoFvOeiRPBwlIpu/DmlBtU2Nmejq0oeFuNm
 E0nwUjfjf5UVOvrk1RYtvOlyQgBDBu8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-8fcKe7vtONSMgfiW6jjRQw-1; Mon, 16 Dec 2019 05:31:06 -0500
X-MC-Unique: 8fcKe7vtONSMgfiW6jjRQw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5041CDC23;
 Mon, 16 Dec 2019 10:31:04 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.36.118.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D75485C241;
 Mon, 16 Dec 2019 10:30:58 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] powerpc/pseries/cmm: fix managed page counts when
 migrating pages between zones
Date: Mon, 16 Dec 2019 11:30:58 +0100
Message-Id: <20191216103058.4958-1-david@redhat.com>
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
Cc: David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Richard Fontana <rfontana@redhat.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Arun KS <arunks@codeaurora.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 63341ab03706 (virtio-balloon: fix managed page counts when migrati=
ng
pages between zones) fixed a long existing BUG in the virtio-balloon
driver when pages would get migrated between zones.  I did not try to
reproduce on powerpc, but looking at the code, the same should apply to
powerpc/cmm ever since it started using the balloon compaction
infrastructure (luckily just recently).

In case we have to migrate a ballon page to a newpage of another zone, th=
e
managed page count of both zones is wrong. Paired with memory offlining
(which will adjust the managed page count), we can trigger kernel crashes
and all kinds of different symptoms.

Fix it by properly adjusting the managed page count when migrating if
the zone changed.

We'll temporarily modify the totalram page count. If this ever becomes a
problem, we can fine tune by providing helpers that don't touch
the totalram pages (e.g., adjust_zone_managed_page_count()).

Fixes: fe030c9b85e6 ("powerpc/pseries/cmm: Implement balloon compaction")
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Richard Fontana <rfontana@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arun KS <arunks@codeaurora.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---

v1 -> v2:
- Link virtio-balloon fix commit
- Check if the zone changed
- Move fixup further up, before enqueuing the new newpage (where we are
  guaranteed to hold a reference to both pages)

---
 arch/powerpc/platforms/pseries/cmm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platform=
s/pseries/cmm.c
index 91571841df8a..9dba7e880885 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -539,6 +539,16 @@ static int cmm_migratepage(struct balloon_dev_info *=
b_dev_info,
 	/* balloon page list reference */
 	get_page(newpage);
=20
+	/*
+	 * When we migrate a page to a different zone, we have to fixup the
+	 * count of both involved zones as we adjusted the managed page count
+	 * when inflating.
+	 */
+	if (page_zone(page) !=3D page_zone(newpage)) {
+		adjust_managed_page_count(page, 1);
+		adjust_managed_page_count(newpage, -1);
+	}
+
 	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
 	balloon_page_insert(b_dev_info, newpage);
 	balloon_page_delete(page);
--=20
2.23.0

