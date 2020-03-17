Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 813AE187EE2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 11:57:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hVVT36tQzDqgN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 21:57:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.74;
 helo=us-smtp-delivery-74.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=bzZs2WNX; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hVLV4nM7zDqfC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 21:50:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584442207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9+aMWLUapVvNMXY/iDTt59UcxSOTA2pdOne/agbEdHc=;
 b=bzZs2WNXkmdol9Zg85xx7XBPe4V/y4RizvYPFdsEzestsn9W3CrRbGSE9d4e3BGrLJFBVE
 /bh9ZW8JVyLfe+JLltm9vqHOR+c2nGLZAhAFaOH++8SsaOKr4gQUlu82dZWJhmzzj3KD/V
 ShBYkZICHYL09oENfNIPWkQDj8JxeT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-tM93PLi1MDS_IoxpDVxnVw-1; Tue, 17 Mar 2020 06:50:05 -0400
X-MC-Unique: tM93PLi1MDS_IoxpDVxnVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AD59107ACC9;
 Tue, 17 Mar 2020 10:50:03 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-136.ams2.redhat.com [10.36.112.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5DBF73865;
 Tue, 17 Mar 2020 10:49:57 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] drivers/base/memory: map MMOP_OFFLINE to 0
Date: Tue, 17 Mar 2020 11:49:36 +0100
Message-Id: <20200317104942.11178-3-david@redhat.com>
In-Reply-To: <20200317104942.11178-1-david@redhat.com>
References: <20200317104942.11178-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 Baoquan He <bhe@redhat.com>, David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Michal Hocko <mhocko@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Historically, we used the value -1. Just treat 0 as the special
case now. Clarify a comment (which was wrong, when we come via
device_online() the first time, the online_type would have been 0 /
MEM_ONLINE). The default is now always MMOP_OFFLINE. This removes the
last user of the manual "-1", which didn't use the enum value.

This is a preparation to use the online_type as an array index.

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
Acked-by: Michal Hocko <mhocko@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Baoquan He <bhe@redhat.com>
Cc: Wei Yang <richard.weiyang@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/base/memory.c          | 11 ++++-------
 include/linux/memory_hotplug.h |  2 +-
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 8c5ce42c0fc3..e7e77cafef80 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -211,17 +211,14 @@ static int memory_subsys_online(struct device *dev)
 		return 0;
=20
 	/*
-	 * If we are called from state_store(), online_type will be
-	 * set >=3D 0 Otherwise we were called from the device online
-	 * attribute and need to set the online_type.
+	 * When called via device_online() without configuring the online_type,
+	 * we want to default to MMOP_ONLINE.
 	 */
-	if (mem->online_type < 0)
+	if (mem->online_type =3D=3D MMOP_OFFLINE)
 		mem->online_type =3D MMOP_ONLINE;
=20
 	ret =3D memory_block_change_state(mem, MEM_ONLINE, MEM_OFFLINE);
-
-	/* clear online_type */
-	mem->online_type =3D -1;
+	mem->online_type =3D MMOP_OFFLINE;
=20
 	return ret;
 }
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplu=
g.h
index 261dbf010d5d..c2e06ed5e0e9 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -48,7 +48,7 @@ enum {
 /* Types for control the zone type of onlined and offlined memory */
 enum {
 	/* Offline the memory. */
-	MMOP_OFFLINE =3D -1,
+	MMOP_OFFLINE =3D 0,
 	/* Online the memory. Zone depends, see default_zone_for_pfn(). */
 	MMOP_ONLINE,
 	/* Online the memory to ZONE_NORMAL. */
--=20
2.24.1

