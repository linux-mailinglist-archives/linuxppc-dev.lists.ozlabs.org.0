Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC77F1C37B3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 13:08:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G0T80nFczDqRm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 21:08:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=M/3m8C8Z; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=LTIaO4CI; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G0NL67sBzDqSy
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 21:04:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588590238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3E8UBZTYTox4VLwjEYk2pBtN+8m2yL4UgGYOQf1uRNE=;
 b=M/3m8C8Zq6dgxvuSjWJ88A6c8xExObR9DuRm0aDXV0IPnBOpVms7j1hmm/QbV+wPj2gSkB
 w4SGN/fvrjJGVhz2cgprtCVR9DTmyGADLVZEcEi4L6rgVqbT743Ri7ZVMgBbJSlL9sAXxM
 GTKAW5RolGXb3yv7+kvXvGJxoWX7PU4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588590239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3E8UBZTYTox4VLwjEYk2pBtN+8m2yL4UgGYOQf1uRNE=;
 b=LTIaO4CIXcaQVOgYOvLbUVdIXAcxx0ygFD3MbgZ5XNJj9TzhYHYi/W7g5MfrHXME9OBynZ
 HrNh4n3at9I0UN0tzj+raRKh31duhs45jNVGK3t78NnK8NaCCRrByOeeupMj8T7NnUpDku
 P3Ux8GOOJP8qRa41j1VKAS6bgdN4SjA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-Vqw5ppEwMmSyNsT3VKaD0w-1; Mon, 04 May 2020 07:03:57 -0400
X-MC-Unique: Vqw5ppEwMmSyNsT3VKaD0w-1
Received: by mail-wm1-f69.google.com with SMTP id h184so4677205wmf.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 May 2020 04:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fSn3n1+VKSGdJaAakXEFfOuaSKKQn6CmMSoun+hZIb8=;
 b=Pi6mYpEEOIxEWLXqyBx2sf3OwV9bYiX0DIomc7cL37fqy44FJZE+JBG+byg/n+SYVW
 RkNJTTJrnWyENTgTaZHLTHgEw6fgvp82oZjjOOjay4qXJZs/NEdc+S03lCqLIfB84XaP
 TjBe1Vk/yiaDX6316gFUwIqHjK8A7Mkem8pZYT9P44gX5PUZIm7c/tkpXYa7PwBtqnDD
 yCijXSfOfUKCHW6bTFrrNl3mx+BBgrFszxXFzVFlMFxCkRl7rXZwVGBvbr+4YGEKtXxC
 l008ZORjTBZOVDF+e98ROVL6gZ2DYF/hPwakm5TglNjNjKtbbW/wssY90jCgQlEryrDJ
 RzHA==
X-Gm-Message-State: AGi0PubCkiU2amNuJL6/pOBfjLToVhgU6zYwPvSUv5I+JGkR2mVAz46r
 ZXWr5gM5FavlFXraMtgJtyF8HBpF4Hf/aFsgv5WWmvbjKoilr4uU5ew3aBUe9cCERgqy+w+62QT
 M2x3vRUH5lAh/HLmVNSZ9ejBIdw==
X-Received: by 2002:a05:600c:2284:: with SMTP id
 4mr13390254wmf.97.1588590235191; 
 Mon, 04 May 2020 04:03:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypLJqu3DOrztAyLE6v9HzeLihNpmYDouMJppNQ0dvBekcYyyFI3qXLea1b9RhQ4EcLdqXBNh8g==
X-Received: by 2002:a05:600c:2284:: with SMTP id
 4mr13390197wmf.97.1588590234420; 
 Mon, 04 May 2020 04:03:54 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.213])
 by smtp.gmail.com with ESMTPSA id a13sm10885750wrv.67.2020.05.04.04.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 04:03:53 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH v2 2/5] stats_fs API: create,
 add and remove stats_fs sources and values
Date: Mon,  4 May 2020 13:03:41 +0200
Message-Id: <20200504110344.17560-3-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200504110344.17560-1-eesposit@redhat.com>
References: <20200504110344.17560-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 linux-s390@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 linux-mips@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduction to the stats_fs API, that allows to easily create, add
and remove stats_fs sources and values. The API allows to easily building
the statistics directory tree to automatically gather them for the linux
kernel. The main functionalities are: create a source, add child
sources/values/aggregates, register it to the root source (that on
the virtual fs would be /sys/kernel/statsfs), ad perform a search for
a value/aggregate.

This allows creating any kind of source tree, making it more flexible
also to future readjustments.

The API representation is only logical and will be backed up
by a virtual file system in patch 4.
Its usage will be shared between the stats_fs file system
and the end-users like kvm, the former calling it when it needs to
display and clear statistics, the latter to add values and sources.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 MAINTAINERS              |   7 +
 fs/Kconfig               |   6 +
 fs/Makefile              |   1 +
 fs/stats_fs/Makefile     |   4 +
 fs/stats_fs/internal.h   |  20 ++
 fs/stats_fs/stats_fs.c   | 610 +++++++++++++++++++++++++++++++++++++++
 include/linux/stats_fs.h | 289 +++++++++++++++++++
 7 files changed, 937 insertions(+)
 create mode 100644 fs/stats_fs/Makefile
 create mode 100644 fs/stats_fs/internal.h
 create mode 100644 fs/stats_fs/stats_fs.c
 create mode 100644 include/linux/stats_fs.h

diff --git a/MAINTAINERS b/MAINTAINERS
index b816a453b10e..a8403d07cee5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5229,6 +5229,13 @@ F:=09include/linux/debugfs.h
 F:=09include/linux/kobj*
 F:=09lib/kobj*
=20
+STATS_FS
+M:=09Paolo Bonzini <pbonzini@redhat.com>
+R:=09Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
+S:=09Supported
+F:=09include/linux/stats_fs.h
+F:=09fs/stats_fs
+
 DRIVERS FOR ADAPTIVE VOLTAGE SCALING (AVS)
 M:=09Kevin Hilman <khilman@kernel.org>
 M:=09Nishanth Menon <nm@ti.com>
diff --git a/fs/Kconfig b/fs/Kconfig
index f08fbbfafd9a..1b0de0f19e96 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -328,4 +328,10 @@ source "fs/unicode/Kconfig"
 config IO_WQ
 =09bool
=20
+config STATS_FS
+=09bool "Statistics Filesystem"
+=09help
+=09  stats_fs is a virtual file system that provides counters and
+=09  other statistics about the running kernel.
+
 endmenu
diff --git a/fs/Makefile b/fs/Makefile
index 2ce5112b02c8..91558eca0cf7 100644
--- a/fs/Makefile
+++ b/fs/Makefile
@@ -125,6 +125,7 @@ obj-$(CONFIG_BEFS_FS)=09=09+=3D befs/
 obj-$(CONFIG_HOSTFS)=09=09+=3D hostfs/
 obj-$(CONFIG_CACHEFILES)=09+=3D cachefiles/
 obj-$(CONFIG_DEBUG_FS)=09=09+=3D debugfs/
+obj-$(CONFIG_STATS_FS)=09=09+=3D stats_fs/
 obj-$(CONFIG_TRACING)=09=09+=3D tracefs/
 obj-$(CONFIG_OCFS2_FS)=09=09+=3D ocfs2/
 obj-$(CONFIG_BTRFS_FS)=09=09+=3D btrfs/
diff --git a/fs/stats_fs/Makefile b/fs/stats_fs/Makefile
new file mode 100644
index 000000000000..94fe52d590d5
--- /dev/null
+++ b/fs/stats_fs/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+stats_fs-objs=09:=3D stats_fs.o
+
+obj-$(CONFIG_STATS_FS)=09+=3D stats_fs.o
diff --git a/fs/stats_fs/internal.h b/fs/stats_fs/internal.h
new file mode 100644
index 000000000000..ddf262a60736
--- /dev/null
+++ b/fs/stats_fs/internal.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _STATS_FS_INTERNAL_H_
+#define _STATS_FS_INTERNAL_H_
+
+#include <linux/list.h>
+#include <linux/kref.h>
+#include <linux/rwsem.h>
+#include <linux/stats_fs.h>
+
+/* values, grouped by base */
+struct stats_fs_value_source {
+=09void *base_addr;
+=09bool files_created;
+=09struct stats_fs_value *values;
+=09struct list_head list_element;
+};
+
+int stats_fs_val_get_mode(struct stats_fs_value *val);
+
+#endif /* _STATS_FS_INTERNAL_H_ */
diff --git a/fs/stats_fs/stats_fs.c b/fs/stats_fs/stats_fs.c
new file mode 100644
index 000000000000..b63de12769e2
--- /dev/null
+++ b/fs/stats_fs/stats_fs.c
@@ -0,0 +1,610 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/module.h>
+#include <linux/errno.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/slab.h>
+#include <linux/rwsem.h>
+#include <linux/list.h>
+#include <linux/kref.h>
+#include <linux/limits.h>
+#include <linux/stats_fs.h>
+
+#include "internal.h"
+
+struct stats_fs_aggregate_value {
+=09uint64_t sum, min, max;
+=09uint32_t count, count_zero;
+};
+
+static int is_val_signed(struct stats_fs_value *val)
+{
+=09return val->type & STATS_FS_SIGN;
+}
+
+int stats_fs_val_get_mode(struct stats_fs_value *val)
+{
+=09return val->mode ? val->mode : 0644;
+}
+
+static struct stats_fs_value *find_value(struct stats_fs_value_source *src=
,
+=09=09=09=09=09 struct stats_fs_value *val)
+{
+=09struct stats_fs_value *entry;
+
+=09for (entry =3D src->values; entry->name; entry++) {
+=09=09if (entry =3D=3D val)
+=09=09=09return entry;
+=09}
+=09return NULL;
+}
+
+static struct stats_fs_value *
+search_value_in_source(struct stats_fs_source *src, struct stats_fs_value =
*arg,
+=09=09       struct stats_fs_value_source **val_src)
+{
+=09struct stats_fs_value *entry;
+=09struct stats_fs_value_source *src_entry;
+
+=09list_for_each_entry (src_entry, &src->values_head, list_element) {
+=09=09entry =3D find_value(src_entry, arg);
+=09=09if (entry) {
+=09=09=09*val_src =3D src_entry;
+=09=09=09return entry;
+=09=09}
+=09}
+
+=09return NULL;
+}
+
+/* Called with rwsem held for writing */
+static struct stats_fs_value_source *create_value_source(void *base)
+{
+=09struct stats_fs_value_source *val_src;
+
+=09val_src =3D kzalloc(sizeof(struct stats_fs_value_source), GFP_KERNEL);
+=09if (!val_src)
+=09=09return ERR_PTR(-ENOMEM);
+
+=09val_src->base_addr =3D base;
+=09INIT_LIST_HEAD(&val_src->list_element);
+
+=09return val_src;
+}
+
+int stats_fs_source_add_values(struct stats_fs_source *source,
+=09=09=09       struct stats_fs_value *stat, void *ptr)
+{
+=09struct stats_fs_value_source *val_src;
+=09struct stats_fs_value_source *entry;
+
+=09down_write(&source->rwsem);
+
+=09list_for_each_entry (entry, &source->values_head, list_element) {
+=09=09if (entry->base_addr =3D=3D ptr && entry->values =3D=3D stat) {
+=09=09=09up_write(&source->rwsem);
+=09=09=09return -EEXIST;
+=09=09}
+=09}
+
+=09val_src =3D create_value_source(ptr);
+=09val_src->values =3D (struct stats_fs_value *)stat;
+
+=09/* add the val_src to the source list */
+=09list_add(&val_src->list_element, &source->values_head);
+
+=09up_write(&source->rwsem);
+
+=09return 0;
+}
+EXPORT_SYMBOL_GPL(stats_fs_source_add_values);
+
+void stats_fs_source_add_subordinate(struct stats_fs_source *source,
+=09=09=09=09     struct stats_fs_source *sub)
+{
+=09down_write(&source->rwsem);
+
+=09stats_fs_source_get(sub);
+=09list_add(&sub->list_element, &source->subordinates_head);
+
+=09up_write(&source->rwsem);
+}
+EXPORT_SYMBOL_GPL(stats_fs_source_add_subordinate);
+
+/* Called with rwsem held for writing */
+static void
+stats_fs_source_remove_subordinate_locked(struct stats_fs_source *source,
+=09=09=09=09=09  struct stats_fs_source *sub)
+{
+=09struct stats_fs_source *src_entry;
+
+=09list_for_each_entry (src_entry, &source->subordinates_head,
+=09=09=09     list_element) {
+=09=09if (src_entry =3D=3D sub) {
+=09=09=09list_del_init(&src_entry->list_element);
+=09=09=09stats_fs_source_put(src_entry);
+=09=09=09return;
+=09=09}
+=09}
+}
+
+void stats_fs_source_remove_subordinate(struct stats_fs_source *source,
+=09=09=09=09=09struct stats_fs_source *sub)
+{
+=09down_write(&source->rwsem);
+=09stats_fs_source_remove_subordinate_locked(source, sub);
+=09up_write(&source->rwsem);
+}
+EXPORT_SYMBOL_GPL(stats_fs_source_remove_subordinate);
+
+/* Called with rwsem held for reading */
+static uint64_t get_simple_value(struct stats_fs_value_source *src,
+=09=09=09=09 struct stats_fs_value *val)
+{
+=09uint64_t value_found;
+=09void *address;
+
+=09address =3D src->base_addr + val->offset;
+
+=09switch (val->type) {
+=09case STATS_FS_U8:
+=09=09value_found =3D *((uint8_t *)address);
+=09=09break;
+=09case STATS_FS_U8 | STATS_FS_SIGN:
+=09=09value_found =3D *((int8_t *)address);
+=09=09break;
+=09case STATS_FS_U16:
+=09=09value_found =3D *((uint16_t *)address);
+=09=09break;
+=09case STATS_FS_U16 | STATS_FS_SIGN:
+=09=09value_found =3D *((int16_t *)address);
+=09=09break;
+=09case STATS_FS_U32:
+=09=09value_found =3D *((uint32_t *)address);
+=09=09break;
+=09case STATS_FS_U32 | STATS_FS_SIGN:
+=09=09value_found =3D *((int32_t *)address);
+=09=09break;
+=09case STATS_FS_U64:
+=09=09value_found =3D *((uint64_t *)address);
+=09=09break;
+=09case STATS_FS_U64 | STATS_FS_SIGN:
+=09=09value_found =3D *((int64_t *)address);
+=09=09break;
+=09case STATS_FS_BOOL:
+=09=09value_found =3D *((uint8_t *)address);
+=09=09break;
+=09default:
+=09=09value_found =3D 0;
+=09=09break;
+=09}
+
+=09return value_found;
+}
+
+/* Called with rwsem held for reading */
+static void clear_simple_value(struct stats_fs_value_source *src,
+=09=09=09       struct stats_fs_value *val)
+{
+=09void *address;
+
+=09address =3D src->base_addr + val->offset;
+
+=09switch (val->type) {
+=09case STATS_FS_U8:
+=09=09*((uint8_t *)address) =3D 0;
+=09=09break;
+=09case STATS_FS_U8 | STATS_FS_SIGN:
+=09=09*((int8_t *)address) =3D 0;
+=09=09break;
+=09case STATS_FS_U16:
+=09=09*((uint16_t *)address) =3D 0;
+=09=09break;
+=09case STATS_FS_U16 | STATS_FS_SIGN:
+=09=09*((int16_t *)address) =3D 0;
+=09=09break;
+=09case STATS_FS_U32:
+=09=09*((uint32_t *)address) =3D 0;
+=09=09break;
+=09case STATS_FS_U32 | STATS_FS_SIGN:
+=09=09*((int32_t *)address) =3D 0;
+=09=09break;
+=09case STATS_FS_U64:
+=09=09*((uint64_t *)address) =3D 0;
+=09=09break;
+=09case STATS_FS_U64 | STATS_FS_SIGN:
+=09=09*((int64_t *)address) =3D 0;
+=09=09break;
+=09case STATS_FS_BOOL:
+=09=09*((uint8_t *)address) =3D 0;
+=09=09break;
+=09default:
+=09=09break;
+=09}
+}
+
+/* Called with rwsem held for reading */
+static void
+search_all_simple_values(struct stats_fs_source *src,
+=09=09=09 struct stats_fs_value_source *ref_src_entry,
+=09=09=09 struct stats_fs_value *val,
+=09=09=09 struct stats_fs_aggregate_value *agg)
+{
+=09struct stats_fs_value_source *src_entry;
+=09uint64_t value_found;
+
+=09list_for_each_entry (src_entry, &src->values_head, list_element) {
+=09=09/* skip aggregates */
+=09=09if (src_entry->base_addr =3D=3D NULL)
+=09=09=09continue;
+
+=09=09/* useless to search here */
+=09=09if (src_entry->values !=3D ref_src_entry->values)
+=09=09=09continue;
+
+=09=09/* must be here */
+=09=09value_found =3D get_simple_value(src_entry, val);
+=09=09agg->sum +=3D value_found;
+=09=09agg->count++;
+=09=09agg->count_zero +=3D (value_found =3D=3D 0);
+
+=09=09if (is_val_signed(val)) {
+=09=09=09agg->max =3D (((int64_t)value_found) >=3D
+=09=09=09=09    ((int64_t)agg->max)) ?
+=09=09=09=09=09   value_found :
+=09=09=09=09=09   agg->max;
+=09=09=09agg->min =3D (((int64_t)value_found) <=3D
+=09=09=09=09    ((int64_t)agg->min)) ?
+=09=09=09=09=09   value_found :
+=09=09=09=09=09   agg->min;
+=09=09} else {
+=09=09=09agg->max =3D (value_found >=3D agg->max) ? value_found :
+=09=09=09=09=09=09=09       agg->max;
+=09=09=09agg->min =3D (value_found <=3D agg->min) ? value_found :
+=09=09=09=09=09=09=09       agg->min;
+=09=09}
+=09}
+}
+
+/* Called with rwsem held for reading */
+static void
+do_recursive_aggregation(struct stats_fs_source *root,
+=09=09=09 struct stats_fs_value_source *ref_src_entry,
+=09=09=09 struct stats_fs_value *val,
+=09=09=09 struct stats_fs_aggregate_value *agg)
+{
+=09struct stats_fs_source *subordinate;
+
+=09/* search all simple values in this folder */
+=09search_all_simple_values(root, ref_src_entry, val, agg);
+
+=09/* recursively search in all subfolders */
+=09list_for_each_entry (subordinate, &root->subordinates_head,
+=09=09=09     list_element) {
+=09=09down_read(&subordinate->rwsem);
+=09=09do_recursive_aggregation(subordinate, ref_src_entry, val, agg);
+=09=09up_read(&subordinate->rwsem);
+=09}
+}
+
+/* Called with rwsem held for reading */
+static void init_aggregate_value(struct stats_fs_aggregate_value *agg,
+=09=09=09=09 struct stats_fs_value *val)
+{
+=09agg->count =3D agg->count_zero =3D agg->sum =3D 0;
+=09if (is_val_signed(val)) {
+=09=09agg->max =3D S64_MIN;
+=09=09agg->min =3D S64_MAX;
+=09} else {
+=09=09agg->max =3D 0;
+=09=09agg->min =3D U64_MAX;
+=09}
+}
+
+/* Called with rwsem held for reading */
+static void store_final_value(struct stats_fs_aggregate_value *agg,
+=09=09=09      struct stats_fs_value *val, uint64_t *ret)
+{
+=09int operation;
+
+=09operation =3D val->aggr_kind | is_val_signed(val);
+
+=09switch (operation) {
+=09case STATS_FS_AVG:
+=09=09*ret =3D agg->count ? agg->sum / agg->count : 0;
+=09=09break;
+=09case STATS_FS_AVG | STATS_FS_SIGN:
+=09=09*ret =3D agg->count ? ((int64_t)agg->sum) / agg->count : 0;
+=09=09break;
+=09case STATS_FS_SUM:
+=09case STATS_FS_SUM | STATS_FS_SIGN:
+=09=09*ret =3D agg->sum;
+=09=09break;
+=09case STATS_FS_MIN:
+=09case STATS_FS_MIN | STATS_FS_SIGN:
+=09=09*ret =3D agg->min;
+=09=09break;
+=09case STATS_FS_MAX:
+=09case STATS_FS_MAX | STATS_FS_SIGN:
+=09=09*ret =3D agg->max;
+=09=09break;
+=09case STATS_FS_COUNT_ZERO:
+=09case STATS_FS_COUNT_ZERO | STATS_FS_SIGN:
+=09=09*ret =3D agg->count_zero;
+=09=09break;
+=09default:
+=09=09break;
+=09}
+}
+
+/* Called with rwsem held for reading */
+static int stats_fs_source_get_value_locked(struct stats_fs_source *source=
,
+=09=09=09=09=09    struct stats_fs_value *arg,
+=09=09=09=09=09    uint64_t *ret)
+{
+=09struct stats_fs_value_source *src_entry;
+=09struct stats_fs_value *found;
+=09struct stats_fs_aggregate_value aggr;
+
+=09*ret =3D 0;
+
+=09if (!arg)
+=09=09return -ENOENT;
+
+=09/* look in simple values */
+=09found =3D search_value_in_source(source, arg, &src_entry);
+
+=09if (!found) {
+=09=09printk(KERN_ERR "Stats_fs: Value in source \"%s\" not found!\n",
+=09=09       source->name);
+=09=09return -ENOENT;
+=09}
+
+=09if (src_entry->base_addr !=3D NULL) {
+=09=09*ret =3D get_simple_value(src_entry, found);
+=09=09return 0;
+=09}
+
+=09/* look in aggregates */
+=09init_aggregate_value(&aggr, found);
+=09do_recursive_aggregation(source, src_entry, found, &aggr);
+=09store_final_value(&aggr, found, ret);
+
+=09return 0;
+}
+
+int stats_fs_source_get_value(struct stats_fs_source *source,
+=09=09=09      struct stats_fs_value *arg, uint64_t *ret)
+{
+=09int retval;
+
+=09down_read(&source->rwsem);
+=09retval =3D stats_fs_source_get_value_locked(source, arg, ret);
+=09up_read(&source->rwsem);
+
+=09return retval;
+}
+EXPORT_SYMBOL_GPL(stats_fs_source_get_value);
+
+/* Called with rwsem held for reading */
+static void set_all_simple_values(struct stats_fs_source *src,
+=09=09=09=09  struct stats_fs_value_source *ref_src_entry,
+=09=09=09=09  struct stats_fs_value *val)
+{
+=09struct stats_fs_value_source *src_entry;
+
+=09list_for_each_entry (src_entry, &src->values_head, list_element) {
+=09=09/* skip aggregates */
+=09=09if (src_entry->base_addr =3D=3D NULL)
+=09=09=09continue;
+
+=09=09/* wrong to search here */
+=09=09if (src_entry->values !=3D ref_src_entry->values)
+=09=09=09continue;
+
+=09=09if (src_entry->base_addr &&
+=09=09    src_entry->values =3D=3D ref_src_entry->values)
+=09=09=09clear_simple_value(src_entry, val);
+=09}
+}
+
+/* Called with rwsem held for reading */
+static void do_recursive_clean(struct stats_fs_source *root,
+=09=09=09       struct stats_fs_value_source *ref_src_entry,
+=09=09=09       struct stats_fs_value *val)
+{
+=09struct stats_fs_source *subordinate;
+
+=09/* search all simple values in this folder */
+=09set_all_simple_values(root, ref_src_entry, val);
+
+=09/* recursively search in all subfolders */
+=09list_for_each_entry (subordinate, &root->subordinates_head,
+=09=09=09     list_element) {
+=09=09down_read(&subordinate->rwsem);
+=09=09do_recursive_clean(subordinate, ref_src_entry, val);
+=09=09up_read(&subordinate->rwsem);
+=09}
+}
+
+/* Called with rwsem held for reading */
+static int stats_fs_source_clear_locked(struct stats_fs_source *source,
+=09=09=09=09=09struct stats_fs_value *val)
+{
+=09struct stats_fs_value_source *src_entry;
+=09struct stats_fs_value *found;
+
+=09if (!val)
+=09=09return -ENOENT;
+
+=09/* look in simple values */
+=09found =3D search_value_in_source(source, val, &src_entry);
+
+=09if (!found) {
+=09=09printk(KERN_ERR "Stats_fs: Value in source \"%s\" not found!\n",
+=09=09       source->name);
+=09=09return -ENOENT;
+=09}
+
+=09if (src_entry->base_addr !=3D NULL) {
+=09=09clear_simple_value(src_entry, found);
+=09=09return 0;
+=09}
+
+=09/* look in aggregates */
+=09do_recursive_clean(source, src_entry, found);
+
+=09return 0;
+}
+
+int stats_fs_source_clear(struct stats_fs_source *source,
+=09=09=09  struct stats_fs_value *val)
+{
+=09int retval;
+
+=09down_read(&source->rwsem);
+=09retval =3D stats_fs_source_clear_locked(source, val);
+=09up_read(&source->rwsem);
+
+=09return retval;
+}
+
+/* Called with rwsem held for reading */
+static struct stats_fs_value *
+find_value_by_name(struct stats_fs_value_source *src, char *val)
+{
+=09struct stats_fs_value *entry;
+
+=09for (entry =3D src->values; entry->name; entry++)
+=09=09if (!strcmp(entry->name, val))
+=09=09=09return entry;
+
+=09return NULL;
+}
+
+/* Called with rwsem held for reading */
+static struct stats_fs_value *
+search_in_source_by_name(struct stats_fs_source *src, char *name)
+{
+=09struct stats_fs_value *entry;
+=09struct stats_fs_value_source *src_entry;
+
+=09list_for_each_entry (src_entry, &src->values_head, list_element) {
+=09=09entry =3D find_value_by_name(src_entry, name);
+=09=09if (entry)
+=09=09=09return entry;
+=09}
+
+=09return NULL;
+}
+
+int stats_fs_source_get_value_by_name(struct stats_fs_source *source,
+=09=09=09=09      char *name, uint64_t *ret)
+{
+=09struct stats_fs_value *val;
+=09int retval;
+
+=09down_read(&source->rwsem);
+=09val =3D search_in_source_by_name(source, name);
+
+=09if (!val) {
+=09=09*ret =3D 0;
+=09=09up_read(&source->rwsem);
+=09=09return -ENOENT;
+=09}
+
+=09retval =3D stats_fs_source_get_value_locked(source, val, ret);
+=09up_read(&source->rwsem);
+
+=09return retval;
+}
+EXPORT_SYMBOL_GPL(stats_fs_source_get_value_by_name);
+
+void stats_fs_source_get(struct stats_fs_source *source)
+{
+=09kref_get(&source->refcount);
+}
+EXPORT_SYMBOL_GPL(stats_fs_source_get);
+
+void stats_fs_source_revoke(struct stats_fs_source *source)
+{
+=09struct stats_fs_value_source *val_src_entry;
+
+=09down_write(&source->rwsem);
+
+=09list_for_each_entry (val_src_entry, &source->values_head, list_element)
+=09=09val_src_entry->base_addr =3D NULL;
+
+=09up_write(&source->rwsem);
+}
+EXPORT_SYMBOL_GPL(stats_fs_source_revoke);
+
+/* Called with rwsem held for writing
+ *
+ * The refcount is 0 and the lock was taken before refcount
+ * went from 1 to 0
+ */
+static void stats_fs_source_destroy(struct kref *kref_source)
+{
+=09struct stats_fs_value_source *val_src_entry;
+=09struct list_head *it, *safe;
+=09struct stats_fs_source *child, *source;
+
+=09source =3D container_of(kref_source, struct stats_fs_source, refcount);
+
+=09/* iterate through the values and delete them */
+=09list_for_each_safe (it, safe, &source->values_head) {
+=09=09val_src_entry =3D list_entry(it, struct stats_fs_value_source,
+=09=09=09=09=09   list_element);
+=09=09kfree(val_src_entry);
+=09}
+
+=09/* iterate through the subordinates and delete them */
+=09list_for_each_safe (it, safe, &source->subordinates_head) {
+=09=09child =3D list_entry(it, struct stats_fs_source, list_element);
+=09=09stats_fs_source_remove_subordinate_locked(source, child);
+=09}
+
+=09up_write(&source->rwsem);
+=09kfree(source->name);
+=09kfree(source);
+}
+
+void stats_fs_source_put(struct stats_fs_source *source)
+{
+=09kref_put_rwsem(&source->refcount, stats_fs_source_destroy,
+=09=09       &source->rwsem);
+}
+EXPORT_SYMBOL_GPL(stats_fs_source_put);
+
+struct stats_fs_source *stats_fs_source_create(const char *fmt, ...)
+{
+=09va_list ap;
+=09char buf[100];
+=09struct stats_fs_source *ret;
+=09int char_needed;
+
+=09va_start(ap, fmt);
+=09char_needed =3D vsnprintf(buf, 100, fmt, ap);
+=09va_end(ap);
+
+=09ret =3D kzalloc(sizeof(struct stats_fs_source), GFP_KERNEL);
+=09if (!ret)
+=09=09return ERR_PTR(-ENOMEM);
+
+=09ret->name =3D kstrdup(buf, GFP_KERNEL);
+=09if (!ret->name) {
+=09=09kfree(ret);
+=09=09return ERR_PTR(-ENOMEM);
+=09}
+
+=09kref_init(&ret->refcount);
+=09init_rwsem(&ret->rwsem);
+
+=09INIT_LIST_HEAD(&ret->values_head);
+=09INIT_LIST_HEAD(&ret->subordinates_head);
+=09INIT_LIST_HEAD(&ret->list_element);
+
+=09return ret;
+}
+EXPORT_SYMBOL_GPL(stats_fs_source_create);
diff --git a/include/linux/stats_fs.h b/include/linux/stats_fs.h
new file mode 100644
index 000000000000..dc2d2e11f5ea
--- /dev/null
+++ b/include/linux/stats_fs.h
@@ -0,0 +1,289 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ *  stats_fs.h - a tiny little statistics file system
+ *
+ *  Copyright (C) 2020 Emanuele Giuseppe Esposito
+ *  Copyright (C) 2020 Redhat.
+ *
+ */
+
+#ifndef _STATS_FS_H_
+#define _STATS_FS_H_
+
+#include <linux/list.h>
+
+/* Used to distinguish signed types */
+#define STATS_FS_SIGN 0x8000
+
+enum stat_type {
+=09STATS_FS_U8 =3D 0,
+=09STATS_FS_U16 =3D 1,
+=09STATS_FS_U32 =3D 2,
+=09STATS_FS_U64 =3D 3,
+=09STATS_FS_BOOL =3D 4,
+=09STATS_FS_S8 =3D STATS_FS_U8 | STATS_FS_SIGN,
+=09STATS_FS_S16 =3D STATS_FS_U16 | STATS_FS_SIGN,
+=09STATS_FS_S32 =3D STATS_FS_U32 | STATS_FS_SIGN,
+=09STATS_FS_S64 =3D STATS_FS_U64 | STATS_FS_SIGN,
+};
+
+enum stat_aggr {
+=09STATS_FS_NONE =3D 0,
+=09STATS_FS_SUM,
+=09STATS_FS_MIN,
+=09STATS_FS_MAX,
+=09STATS_FS_COUNT_ZERO,
+=09STATS_FS_AVG,
+};
+
+struct stats_fs_value {
+=09/* Name of the stat */
+=09char *name;
+
+=09/* Offset from base address to field containing the value */
+=09int offset;
+
+=09/* Type of the stat BOOL,U64,... */
+=09enum stat_type type;
+
+=09/* Aggregate type: MIN, MAX, SUM,... */
+=09enum stat_aggr aggr_kind;
+
+=09/* File mode */
+=09uint16_t mode;
+};
+
+struct stats_fs_source {
+=09struct kref refcount;
+
+=09char *name;
+
+=09/* list of source stats_fs_value_source*/
+=09struct list_head values_head;
+
+=09/* list of struct stats_fs_source for subordinate sources */
+=09struct list_head subordinates_head;
+
+=09struct list_head list_element;
+
+=09struct rw_semaphore rwsem;
+
+=09struct dentry *source_dentry;
+};
+
+#if defined(CONFIG_STATS_FS)
+
+/**
+ * stats_fs_source_create - create a stats_fs_source
+ * Creates a stats_fs_source with the given name. This
+ * does not mean it will be backed by the filesystem yet, it will only
+ * be visible to the user once one of its parents (or itself) are
+ * registered in stats_fs.
+ *
+ * Returns a pointer to a stats_fs_source if it succeeds.
+ * This or one of the parents' pointer must be passed to the stats_fs_put(=
)
+ * function when the file is to be removed.  If an error occurs,
+ * ERR_PTR(-ERROR) will be returned.
+ */
+struct stats_fs_source *stats_fs_source_create(const char *fmt, ...);
+
+/**
+ * stats_fs_source_add_values - adds values to the given source
+ * @source: a pointer to the source that will receive the values
+ * @val: a pointer to the NULL terminated stats_fs_value array to add
+ * @base_ptr: a pointer to the base pointer used by these values
+ *
+ * In addition to adding values to the source, also create the
+ * files in the filesystem if the source already is backed up by a directo=
ry.
+ *
+ * Returns 0 it succeeds. If the value are already in the
+ * source and have the same base_ptr, -EEXIST is returned.
+ */
+int stats_fs_source_add_values(struct stats_fs_source *source,
+=09=09=09       struct stats_fs_value *val, void *base_ptr);
+
+/**
+ * stats_fs_source_add_subordinate - adds a child to the given source
+ * @parent: a pointer to the parent source
+ * @child: a pointer to child source to add
+ *
+ * Recursively create all files in the stats_fs filesystem
+ * only if the parent has already a dentry (created with
+ * stats_fs_source_register).
+ * This avoids the case where this function is called before register.
+ */
+void stats_fs_source_add_subordinate(struct stats_fs_source *parent,
+=09=09=09=09     struct stats_fs_source *child);
+
+/**
+ * stats_fs_source_remove_subordinate - removes a child from the given sou=
rce
+ * @parent: a pointer to the parent source
+ * @child: a pointer to child source to remove
+ *
+ * Look if there is such child in the parent. If so,
+ * it will remove all its files and call stats_fs_put on the child.
+ */
+void stats_fs_source_remove_subordinate(struct stats_fs_source *parent,
+=09=09=09=09=09struct stats_fs_source *child);
+
+/**
+ * stats_fs_source_get_value - search a value in the source (and
+ * subordinates)
+ * @source: a pointer to the source that will be searched
+ * @val: a pointer to the stats_fs_value to search
+ * @ret: a pointer to the uint64_t that will hold the found value
+ *
+ * Look up in the source if a value with same value pointer
+ * exists.
+ * If not, it will return -ENOENT. If it exists and it's a simple value
+ * (not an aggregate), the value that it points to will be returned.
+ * If it exists and it's an aggregate (aggr_type !=3D STATS_FS_NONE), all
+ * subordinates will be recursively searched and every simple value match
+ * will be used to aggregate the final result. For example if it's a sum,
+ * all suboordinates having the same value will be sum together.
+ *
+ * This function will return 0 it succeeds.
+ */
+int stats_fs_source_get_value(struct stats_fs_source *source,
+=09=09=09      struct stats_fs_value *val, uint64_t *ret);
+
+/**
+ * stats_fs_source_get_value_by_name - search a value in the source (and
+ * subordinates)
+ * @source: a pointer to the source that will be searched
+ * @name: a pointer to the string representing the value to search
+ *        (for example "exits")
+ * @ret: a pointer to the uint64_t that will hold the found value
+ *
+ * Same as stats_fs_source_get_value, but initially the name is used
+ * to search in the given source if there is a value with a matching
+ * name. If so, stats_fs_source_get_value will be called with the found
+ * value, otherwise -ENOENT will be returned.
+ */
+int stats_fs_source_get_value_by_name(struct stats_fs_source *source,
+=09=09=09=09      char *name, uint64_t *ret);
+
+/**
+ * stats_fs_source_clear - search and clears a value in the source (and
+ * subordinates)
+ * @source: a pointer to the source that will be searched
+ * @val: a pointer to the stats_fs_value to search
+ *
+ * Look up in the source if a value with same value pointer
+ * exists.
+ * If not, it will return -ENOENT. If it exists and it's a simple value
+ * (not an aggregate), the value that it points to will be set to 0.
+ * If it exists and it's an aggregate (aggr_type !=3D STATS_FS_NONE), all
+ * subordinates will be recursively searched and every simple value match
+ * will be set to 0.
+ *
+ * This function will return 0 it succeeds.
+ */
+int stats_fs_source_clear(struct stats_fs_source *source,
+=09=09=09  struct stats_fs_value *val);
+
+/**
+ * stats_fs_source_revoke - disconnect the source from its backing data
+ * @source: a pointer to the source that will be revoked
+ *
+ * Ensure that stats_fs will not access the data that were passed to
+ * stats_fs_source_add_value for this source.
+ *
+ * Because open files increase the reference count for a stats_fs_source,
+ * the source can end up living longer than the data that provides the
+ * values for the source.  Calling stats_fs_source_revoke just before the
+ * backing data is freed avoids accesses to freed data structures.  The
+ * sources will return 0.
+ */
+void stats_fs_source_revoke(struct stats_fs_source *source);
+
+/**
+ * stats_fs_source_get - increases refcount of source
+ * @source: a pointer to the source whose refcount will be increased
+ */
+void stats_fs_source_get(struct stats_fs_source *source);
+
+/**
+ * stats_fs_source_put - decreases refcount of source and deletes if neede=
d
+ * @source: a pointer to the source whose refcount will be decreased
+ *
+ * If refcount arrives to zero, take care of deleting
+ * and free the source resources and files, by firstly recursively calling
+ * stats_fs_source_remove_subordinate to the child and then deleting
+ * its own files and allocations.
+ */
+void stats_fs_source_put(struct stats_fs_source *source);
+
+/**
+ * stats_fs_initialized - returns true if stats_fs fs has been registered
+ */
+bool stats_fs_initialized(void);
+
+#else
+
+#include <linux/err.h>
+
+/*
+ * We do not return NULL from these functions if CONFIG_STATS_FS is not en=
abled
+ * so users have a chance to detect if there was a real error or not.  We =
don't
+ * want to duplicate the design decision mistakes of procfs and devfs agai=
n.
+ */
+
+static inline struct stats_fs_source *stats_fs_source_create(const char *f=
mt,
+=09=09=09=09=09=09=09     ...)
+{
+=09return ERR_PTR(-ENODEV);
+}
+
+static inline int stats_fs_source_add_values(struct stats_fs_source *sourc=
e,
+=09=09=09=09=09     struct stats_fs_value *val,
+=09=09=09=09=09     void *base_ptr)
+{
+=09return -ENODEV;
+}
+
+static inline void
+stats_fs_source_add_subordinate(struct stats_fs_source *parent,
+=09=09=09=09struct stats_fs_source *child)
+{ }
+
+static inline void
+stats_fs_source_remove_subordinate(struct stats_fs_source *parent,
+=09=09=09=09   struct stats_fs_source *child)
+{ }
+
+static inline int stats_fs_source_get_value(struct stats_fs_source *source=
,
+=09=09=09=09=09    struct stats_fs_value *val,
+=09=09=09=09=09    uint64_t *ret)
+{
+=09return -ENODEV;
+}
+
+static inline int
+stats_fs_source_get_value_by_name(struct stats_fs_source *source, char *na=
me,
+=09=09=09=09  uint64_t *ret)
+{
+=09return -ENODEV;
+}
+
+static inline int stats_fs_source_clear(struct stats_fs_source *source,
+=09=09=09=09=09struct stats_fs_value *val)
+{
+=09return -ENODEV;
+}
+
+static inline void stats_fs_source_revoke(struct stats_fs_source *source)
+{ }
+
+static inline void stats_fs_source_get(struct stats_fs_source *source)
+{ }
+
+static inline void stats_fs_source_put(struct stats_fs_source *source)
+{ }
+
+static inline bool stats_fs_initialized(void)
+{ }
+
+#endif
+
+#endif
--=20
2.25.2

