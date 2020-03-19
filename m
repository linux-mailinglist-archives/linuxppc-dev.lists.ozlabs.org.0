Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C97F18B77F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 14:34:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jnty1GKxzDr9v
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 00:34:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.74;
 helo=us-smtp-delivery-74.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=BsuE0ZBS; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jnQF0yK2zDrLb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 00:12:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584623568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88iyfgf6uemMR/FRnlDjgZQv5nsyNNsQWtkQXwJKijk=;
 b=BsuE0ZBS3WYk/My+WNaMrESrNuiM4kdwReL/2qoi7/C4mcrJzCrh5dtSSRcH5o4eVsDTce
 PDMginzv23Ld4wBeznV//pfqNATmX/cgyvo0n3uDIh7j/NiDFEB5PP5JV6KhGwyE0hXhDF
 tdtnpbyxRnFUzkbguJVvndqD+zMr1Vw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-49WSjLvPPsmX0RwL0MkBSw-1; Thu, 19 Mar 2020 09:12:45 -0400
X-MC-Unique: 49WSjLvPPsmX0RwL0MkBSw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D540DBA3;
 Thu, 19 Mar 2020 13:12:43 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A276D60BF7;
 Thu, 19 Mar 2020 13:12:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/8] drivers/base/memory: store mapping between MMOP_* and
 string in an array
Date: Thu, 19 Mar 2020 14:12:16 +0100
Message-Id: <20200319131221.14044-4-david@redhat.com>
In-Reply-To: <20200319131221.14044-1-david@redhat.com>
References: <20200319131221.14044-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Let's use a simple array which we can reuse soon. While at it, move the
string->mmop conversion out of the device hotplug lock.

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
 drivers/base/memory.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index e7e77cafef80..8a7f29c0bf97 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -28,6 +28,24 @@
=20
 #define MEMORY_CLASS_NAME	"memory"
=20
+static const char *const online_type_to_str[] =3D {
+	[MMOP_OFFLINE] =3D "offline",
+	[MMOP_ONLINE] =3D "online",
+	[MMOP_ONLINE_KERNEL] =3D "online_kernel",
+	[MMOP_ONLINE_MOVABLE] =3D "online_movable",
+};
+
+static int memhp_online_type_from_str(const char *str)
+{
+	int i;
+
+	for (i =3D 0; i < ARRAY_SIZE(online_type_to_str); i++) {
+		if (sysfs_streq(str, online_type_to_str[i]))
+			return i;
+	}
+	return -EINVAL;
+}
+
 #define to_memory_block(dev) container_of(dev, struct memory_block, dev)
=20
 static int sections_per_block;
@@ -236,26 +254,17 @@ static int memory_subsys_offline(struct device *dev=
)
 static ssize_t state_store(struct device *dev, struct device_attribute *=
attr,
 			   const char *buf, size_t count)
 {
+	const int online_type =3D memhp_online_type_from_str(buf);
 	struct memory_block *mem =3D to_memory_block(dev);
-	int ret, online_type;
+	int ret;
+
+	if (online_type < 0)
+		return -EINVAL;
=20
 	ret =3D lock_device_hotplug_sysfs();
 	if (ret)
 		return ret;
=20
-	if (sysfs_streq(buf, "online_kernel"))
-		online_type =3D MMOP_ONLINE_KERNEL;
-	else if (sysfs_streq(buf, "online_movable"))
-		online_type =3D MMOP_ONLINE_MOVABLE;
-	else if (sysfs_streq(buf, "online"))
-		online_type =3D MMOP_ONLINE;
-	else if (sysfs_streq(buf, "offline"))
-		online_type =3D MMOP_OFFLINE;
-	else {
-		ret =3D -EINVAL;
-		goto err;
-	}
-
 	switch (online_type) {
 	case MMOP_ONLINE_KERNEL:
 	case MMOP_ONLINE_MOVABLE:
@@ -271,7 +280,6 @@ static ssize_t state_store(struct device *dev, struct=
 device_attribute *attr,
 		ret =3D -EINVAL; /* should never happen */
 	}
=20
-err:
 	unlock_device_hotplug();
=20
 	if (ret < 0)
--=20
2.24.1

