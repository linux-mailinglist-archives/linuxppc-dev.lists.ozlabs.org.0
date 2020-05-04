Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F26C31C37C0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 13:12:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G0Yc1xvlzDqQS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 21:12:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=JFEqnepc; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=JFEqnepc; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G0NM6R96zDqXM
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 21:04:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588590241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sl5RGJ2NhUfyiwfaPWoM7LmMxPW+cEyIREtKmT2oa9I=;
 b=JFEqnepcbMXeehFcbap64lKmlKGybKWRp+HMgOQzMlYdkEHmDh47Pj04wwLhbFQ4cVhM//
 GhBkhx1K/f5k4tkjAJL9BtemJj0w7w6yOpSGBX1x2rlzDXeqkVsJrHKh93OeO2LdzhaF1A
 9XPZ+ZZj9zejVG6Y7pyC8OcxVIUJONo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588590241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sl5RGJ2NhUfyiwfaPWoM7LmMxPW+cEyIREtKmT2oa9I=;
 b=JFEqnepcbMXeehFcbap64lKmlKGybKWRp+HMgOQzMlYdkEHmDh47Pj04wwLhbFQ4cVhM//
 GhBkhx1K/f5k4tkjAJL9BtemJj0w7w6yOpSGBX1x2rlzDXeqkVsJrHKh93OeO2LdzhaF1A
 9XPZ+ZZj9zejVG6Y7pyC8OcxVIUJONo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-8UZqNKZPMnG0SaBIPcnQNw-1; Mon, 04 May 2020 07:03:59 -0400
X-MC-Unique: 8UZqNKZPMnG0SaBIPcnQNw-1
Received: by mail-wr1-f72.google.com with SMTP id r11so10554318wrx.21
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 May 2020 04:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HGTNvTFWRk5PNhFeR+pDoIIHcLadrpmg+OUkZLe0AM0=;
 b=F8va5fAC5O1i0SvIL2fCLn4EyZYBwQOd5Ux7yzmxeDfPrBAPZOFSQX5bS8+7ehUAnT
 hb2e9PzsemOeqtcP35sQuXyoUw70xwubNLYTy+vlDPFuga0seakAgUz+8XwJlSBMO9mX
 ru7RJJtNhaKNJe6REgMkZ2YNOptk37tQzGakgUfAu2QAiABn0ceo3zstueiHoyaQgPau
 stofj8N2XnbZOzvCIKn25x1OlqB7UaLZTs2kLYooC4nH/IddAYcoZ9xwwwj8+PYQGmyk
 ozrklYjUruaz6vuzcyad0J9SLiZQzfVi2rid+et59qY0mRQhNpaRZwpbc3xDfjo2zUBK
 V69w==
X-Gm-Message-State: AGi0PubQC/VXUIvtBlNMKxleFU5Aaza0mAhjrTrhCY0HQfyo1e/VNnmg
 JzHu+kDvaRLsQ7x85bx2s0COAIEY3EMFeDbGxfpkXgQhPkUHVf4t7oVyCnPJCalb3UcMNttTw+V
 MF2El3pVxdir2uukseiPhMwuNxQ==
X-Received: by 2002:a05:600c:21ca:: with SMTP id
 x10mr13389618wmj.113.1588590237221; 
 Mon, 04 May 2020 04:03:57 -0700 (PDT)
X-Google-Smtp-Source: APiQypKjeQyVv5zRPQ7aICRYZ0sMZAtZDqbG7MhZ3RkTKsWX40wgBG0HIR9xnW0BIQwyAeP1qUNYhA==
X-Received: by 2002:a05:600c:21ca:: with SMTP id
 x10mr13389521wmj.113.1588590236123; 
 Mon, 04 May 2020 04:03:56 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.213])
 by smtp.gmail.com with ESMTPSA id a13sm10885750wrv.67.2020.05.04.04.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 04:03:55 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH v2 3/5] kunit: tests for stats_fs API
Date: Mon,  4 May 2020 13:03:42 +0200
Message-Id: <20200504110344.17560-4-eesposit@redhat.com>
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

Add kunit tests to extensively test the stats_fs API functionality.

In order to run them, the kernel .config must set CONFIG_KUNIT=3Dy
and a new .kunitconfig file must be created with CONFIG_STATS_FS=3Dy
and CONFIG_STATS_FS_TEST=3Dy

Tests can be then started by running the following command from the root
directory of the linux kernel source tree:
./tools/testing/kunit/kunit.py run --timeout=3D30 --jobs=3D`nproc --all`

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 fs/Kconfig                   |    6 +
 fs/stats_fs/Makefile         |    2 +
 fs/stats_fs/stats_fs-tests.c | 1088 ++++++++++++++++++++++++++++++++++
 3 files changed, 1096 insertions(+)
 create mode 100644 fs/stats_fs/stats_fs-tests.c

diff --git a/fs/Kconfig b/fs/Kconfig
index 1b0de0f19e96..0844e8defd22 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -334,4 +334,10 @@ config STATS_FS
 =09  stats_fs is a virtual file system that provides counters and
 =09  other statistics about the running kernel.
=20
+config STATS_FS_TEST
+=09bool "Tests for stats_fs"
+=09depends on STATS_FS && KUNIT
+=09help
+=09  tests for the stats_fs API.
+
 endmenu
diff --git a/fs/stats_fs/Makefile b/fs/stats_fs/Makefile
index 94fe52d590d5..9db130fac6b6 100644
--- a/fs/stats_fs/Makefile
+++ b/fs/stats_fs/Makefile
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 stats_fs-objs=09:=3D stats_fs.o
+stats_fs-tests-objs=09:=3D stats_fs-tests.o
=20
 obj-$(CONFIG_STATS_FS)=09+=3D stats_fs.o
+obj-$(CONFIG_STATS_FS_TEST) +=3D stats_fs-tests.o
diff --git a/fs/stats_fs/stats_fs-tests.c b/fs/stats_fs/stats_fs-tests.c
new file mode 100644
index 000000000000..46c3fb510ee9
--- /dev/null
+++ b/fs/stats_fs/stats_fs-tests.c
@@ -0,0 +1,1088 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/module.h>
+#include <linux/errno.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/slab.h>
+#include <linux/anon_inodes.h>
+#include <linux/spinlock.h>
+#include <linux/uaccess.h>
+#include <linux/rwsem.h>
+#include <linux/list.h>
+#include <linux/kref.h>
+
+#include <linux/limits.h>
+#include <linux/stats_fs.h>
+#include <kunit/test.h>
+#include "internal.h"
+
+#define STATS_FS_STAT(el, x, ...)                                         =
     \
+=09{                                                                      =
\
+=09=09.name =3D #x, .offset =3D offsetof(struct container, el.x),        \
+=09=09##__VA_ARGS__                                                  \
+=09}
+
+#define ARR_SIZE(el) ((int)(sizeof(el) / sizeof(struct stats_fs_value) - 1=
))
+
+struct test_values_struct {
+=09uint64_t u64;
+=09int32_t s32;
+=09bool bo;
+=09uint8_t u8;
+=09int16_t s16;
+};
+
+struct container {
+=09struct test_values_struct vals;
+};
+
+struct stats_fs_value test_values[6] =3D {
+=09STATS_FS_STAT(vals, u64, .type =3D STATS_FS_U64,
+=09=09      .aggr_kind =3D STATS_FS_NONE, .mode =3D 0),
+=09STATS_FS_STAT(vals, s32, .type =3D STATS_FS_S32,
+=09=09      .aggr_kind =3D STATS_FS_NONE, .mode =3D 0),
+=09STATS_FS_STAT(vals, bo, .type =3D STATS_FS_BOOL,
+=09=09      .aggr_kind =3D STATS_FS_NONE, .mode =3D 0),
+=09STATS_FS_STAT(vals, u8, .type =3D STATS_FS_U8, .aggr_kind =3D STATS_FS_=
NONE,
+=09=09      .mode =3D 0),
+=09STATS_FS_STAT(vals, s16, .type =3D STATS_FS_S16,
+=09=09      .aggr_kind =3D STATS_FS_NONE, .mode =3D 0),
+=09{ NULL },
+};
+
+struct stats_fs_value test_aggr[4] =3D {
+=09STATS_FS_STAT(vals, s32, .type =3D STATS_FS_S32,
+=09=09      .aggr_kind =3D STATS_FS_MIN, .mode =3D 0),
+=09STATS_FS_STAT(vals, bo, .type =3D STATS_FS_BOOL,
+=09=09      .aggr_kind =3D STATS_FS_MAX, .mode =3D 0),
+=09STATS_FS_STAT(vals, u64, .type =3D STATS_FS_U64,
+=09=09      .aggr_kind =3D STATS_FS_SUM, .mode =3D 0),
+=09{ NULL },
+};
+
+struct stats_fs_value test_same_name[3] =3D {
+=09STATS_FS_STAT(vals, s32, .type =3D STATS_FS_S32,
+=09=09      .aggr_kind =3D STATS_FS_NONE, .mode =3D 0),
+=09STATS_FS_STAT(vals, s32, .type =3D STATS_FS_S32,
+=09=09      .aggr_kind =3D STATS_FS_MIN, .mode =3D 0),
+=09{ NULL },
+};
+
+struct stats_fs_value test_all_aggr[6] =3D {
+=09STATS_FS_STAT(vals, s32, .type =3D STATS_FS_S32,
+=09=09      .aggr_kind =3D STATS_FS_MIN, .mode =3D 0),
+=09STATS_FS_STAT(vals, bo, .type =3D STATS_FS_BOOL,
+=09=09      .aggr_kind =3D STATS_FS_COUNT_ZERO, .mode =3D 0),
+=09STATS_FS_STAT(vals, u64, .type =3D STATS_FS_U64,
+=09=09      .aggr_kind =3D STATS_FS_SUM, .mode =3D 0),
+=09STATS_FS_STAT(vals, u8, .type =3D STATS_FS_U8, .aggr_kind =3D STATS_FS_=
AVG,
+=09=09      .mode =3D 0),
+=09STATS_FS_STAT(vals, s16, .type =3D STATS_FS_S16,
+=09=09      .aggr_kind =3D STATS_FS_MAX, .mode =3D 0),
+=09{ NULL },
+};
+
+#define def_u64 ((uint64_t)64)
+
+#define def_val_s32 ((int32_t)S32_MIN)
+#define def_val_bool ((bool)true)
+#define def_val_u8 ((uint8_t)127)
+#define def_val_s16 ((int16_t)10000)
+
+#define def_val2_s32 ((int32_t)S16_MAX)
+#define def_val2_bool ((bool)false)
+#define def_val2_u8 ((uint8_t)255)
+#define def_val2_s16 ((int16_t)-20000)
+
+struct container cont =3D {
+=09.vals =3D {
+=09=09=09.u64 =3D def_u64,
+=09=09=09.s32 =3D def_val_s32,
+=09=09=09.bo =3D def_val_bool,
+=09=09=09.u8 =3D def_val_u8,
+=09=09=09.s16 =3D def_val_s16,
+=09=09},
+};
+
+struct container cont2 =3D {
+=09.vals =3D {
+=09=09=09.u64 =3D def_u64,
+=09=09=09.s32 =3D def_val2_s32,
+=09=09=09.bo =3D def_val2_bool,
+=09=09=09.u8 =3D def_val2_u8,
+=09=09=09.s16 =3D def_val2_s16,
+=09=09},
+};
+
+static void get_stats_at_addr(struct stats_fs_source *src, void *addr,
+=09=09=09      int *aggr, int *val, int use_addr)
+{
+=09struct stats_fs_value *entry;
+=09struct stats_fs_value_source *src_entry;
+=09int counter_val =3D 0, counter_aggr =3D 0;
+
+=09list_for_each_entry (src_entry, &src->values_head, list_element) {
+=09=09if (use_addr && src_entry->base_addr !=3D addr)
+=09=09=09continue;
+
+=09=09for (entry =3D src_entry->values; entry->name; entry++) {
+=09=09=09if (entry->aggr_kind =3D=3D STATS_FS_NONE)
+=09=09=09=09counter_val++;
+=09=09=09else
+=09=09=09=09counter_aggr++;
+=09=09}
+=09}
+
+=09if (aggr)
+=09=09*aggr =3D counter_aggr;
+
+=09if (val)
+=09=09*val =3D counter_val;
+}
+
+int source_has_subsource(struct stats_fs_source *src,
+=09=09=09 struct stats_fs_source *sub)
+{
+=09struct stats_fs_source *entry;
+
+=09list_for_each_entry (entry, &src->subordinates_head, list_element) {
+=09=09if (entry =3D=3D sub)
+=09=09=09return 1;
+=09}
+=09return 0;
+}
+
+int get_number_subsources(struct stats_fs_source *src)
+{
+=09struct stats_fs_source *entry;
+=09int counter =3D 0;
+
+=09list_for_each_entry (entry, &src->subordinates_head, list_element) {
+=09=09counter++;
+=09}
+=09return counter;
+}
+
+int get_number_values(struct stats_fs_source *src)
+{
+=09int counter =3D 0;
+
+=09get_stats_at_addr(src, NULL, NULL, &counter, 0);
+=09return counter;
+}
+
+int get_total_number_values(struct stats_fs_source *src)
+{
+=09struct stats_fs_source *sub_entry;
+=09int counter =3D 0;
+
+=09get_stats_at_addr(src, NULL, NULL, &counter, 0);
+
+=09list_for_each_entry (sub_entry, &src->subordinates_head, list_element) =
{
+=09=09counter +=3D get_total_number_values(sub_entry);
+=09}
+
+=09return counter;
+}
+
+int get_number_aggregates(struct stats_fs_source *src)
+{
+=09int counter =3D 0;
+
+=09get_stats_at_addr(src, NULL, &counter, NULL, 1);
+=09return counter;
+}
+
+int get_number_values_with_base(struct stats_fs_source *src, void *addr)
+{
+=09int counter =3D 0;
+
+=09get_stats_at_addr(src, addr, NULL, &counter, 1);
+=09return counter;
+}
+
+int get_number_aggr_with_base(struct stats_fs_source *src, void *addr)
+{
+=09int counter =3D 0;
+
+=09get_stats_at_addr(src, addr, &counter, NULL, 1);
+=09return counter;
+}
+
+static void test_empty_folder(struct kunit *test)
+{
+=09struct stats_fs_source *src;
+
+=09src =3D stats_fs_source_create("kvm_%d", 123);
+=09KUNIT_EXPECT_EQ(test, strcmp(src->name, "kvm_123"), 0);
+=09KUNIT_EXPECT_EQ(test, get_number_subsources(src), 0);
+=09KUNIT_EXPECT_EQ(test, get_number_values(src), 0);
+=09KUNIT_EXPECT_EQ(test, get_number_aggregates(src), 0);
+=09stats_fs_source_put(src);
+}
+
+static void test_add_subfolder(struct kunit *test)
+{
+=09struct stats_fs_source *src, *sub;
+
+=09src =3D stats_fs_source_create("parent");
+=09sub =3D stats_fs_source_create("child");
+=09stats_fs_source_add_subordinate(src, sub);
+=09KUNIT_EXPECT_EQ(test, source_has_subsource(src, sub), true);
+=09KUNIT_EXPECT_EQ(test, get_number_subsources(src), 1);
+=09KUNIT_EXPECT_EQ(test, get_number_values(src), 0);
+=09KUNIT_EXPECT_EQ(test, get_number_aggregates(src), 0);
+=09KUNIT_EXPECT_EQ(test, get_number_values(sub), 0);
+=09KUNIT_EXPECT_EQ(test, get_number_aggregates(sub), 0);
+=09KUNIT_EXPECT_EQ(test, get_total_number_values(src), 0);
+
+=09stats_fs_source_put(sub);
+=09sub =3D stats_fs_source_create("not a child");
+=09KUNIT_EXPECT_EQ(test, source_has_subsource(src, sub), false);
+=09KUNIT_EXPECT_EQ(test, get_number_subsources(src), 1);
+
+=09stats_fs_source_put(sub);
+=09stats_fs_source_put(src);
+}
+
+static void test_add_value(struct kunit *test)
+{
+=09struct stats_fs_source *src;
+=09int n;
+
+=09src =3D stats_fs_source_create("parent");
+
+=09// add values
+=09n =3D stats_fs_source_add_values(src, test_values, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_values_with_base(src, &cont);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+
+=09// add same values, nothing happens
+=09n =3D stats_fs_source_add_values(src, test_values, &cont);
+=09KUNIT_EXPECT_EQ(test, n, -EEXIST);
+=09n =3D get_number_values_with_base(src, &cont);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+
+=09// size is invaried
+=09KUNIT_EXPECT_EQ(test, get_number_values(src), ARR_SIZE(test_values));
+
+=09// no aggregates
+=09n =3D get_number_aggr_with_base(src, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, get_number_values(src), ARR_SIZE(test_values));
+=09KUNIT_EXPECT_EQ(test, get_number_aggregates(src), 0);
+
+=09stats_fs_source_put(src);
+}
+
+static void test_add_value_in_subfolder(struct kunit *test)
+{
+=09struct stats_fs_source *src, *sub, *sub_not;
+=09int n;
+
+=09src =3D stats_fs_source_create("parent");
+=09sub =3D stats_fs_source_create("child");
+
+=09// src -> sub
+=09stats_fs_source_add_subordinate(src, sub);
+
+=09// add values
+=09n =3D stats_fs_source_add_values(sub, test_values, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_values_with_base(sub, &cont);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+=09KUNIT_EXPECT_EQ(test, get_number_values(src), 0);
+=09KUNIT_EXPECT_EQ(test, get_number_aggregates(src), 0);
+=09KUNIT_EXPECT_EQ(test, get_total_number_values(src),
+=09=09=09ARR_SIZE(test_values));
+
+=09KUNIT_EXPECT_EQ(test, get_number_values(sub), ARR_SIZE(test_values));
+=09// no values in sub
+=09KUNIT_EXPECT_EQ(test, get_number_aggregates(sub), 0);
+
+=09// different folder
+=09sub_not =3D stats_fs_source_create("not a child");
+
+=09// add values
+=09n =3D stats_fs_source_add_values(sub_not, test_values, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_values_with_base(sub_not, &cont);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+=09KUNIT_EXPECT_EQ(test, get_number_values(src), 0);
+=09KUNIT_EXPECT_EQ(test, get_number_aggregates(src), 0);
+=09KUNIT_EXPECT_EQ(test, get_total_number_values(src),
+=09=09=09ARR_SIZE(test_values));
+
+=09// remove sub, check values is 0
+=09stats_fs_source_remove_subordinate(src, sub);
+=09KUNIT_EXPECT_EQ(test, get_total_number_values(src), 0);
+
+=09// re-add sub, check value are added
+=09stats_fs_source_add_subordinate(src, sub);
+=09KUNIT_EXPECT_EQ(test, get_total_number_values(src),
+=09=09=09ARR_SIZE(test_values));
+
+=09// add sub_not, check value are twice as many
+=09stats_fs_source_add_subordinate(src, sub_not);
+=09KUNIT_EXPECT_EQ(test, get_total_number_values(src),
+=09=09=09ARR_SIZE(test_values) * 2);
+
+=09KUNIT_EXPECT_EQ(test, get_number_values(sub_not),
+=09=09=09ARR_SIZE(test_values));
+=09KUNIT_EXPECT_EQ(test, get_number_aggregates(sub_not), 0);
+
+=09stats_fs_source_put(sub);
+=09stats_fs_source_put(sub_not);
+=09stats_fs_source_put(src);
+}
+
+static void test_search_value(struct kunit *test)
+{
+=09struct stats_fs_source *src;
+=09uint64_t ret;
+=09int n;
+
+=09src =3D stats_fs_source_create("parent");
+
+=09// add values
+=09n =3D stats_fs_source_add_values(src, test_values, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_values_with_base(src, &cont);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+
+=09// get u64
+=09n =3D stats_fs_source_get_value_by_name(src, "u64", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, def_u64);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+
+=09n =3D stats_fs_source_get_value_by_name(src, "s32", &ret);
+=09KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val_s32);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+
+=09n =3D stats_fs_source_get_value_by_name(src, "bo", &ret);
+=09KUNIT_EXPECT_EQ(test, ((bool)ret), def_val_bool);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+
+=09// get a non-added value
+=09n =3D stats_fs_source_get_value_by_name(src, "does not exist", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+=09stats_fs_source_put(src);
+}
+
+static void test_search_value_in_subfolder(struct kunit *test)
+{
+=09struct stats_fs_source *src, *sub;
+=09uint64_t ret;
+=09int n;
+
+=09src =3D stats_fs_source_create("parent");
+=09sub =3D stats_fs_source_create("child");
+
+=09// src -> sub
+=09stats_fs_source_add_subordinate(src, sub);
+
+=09// add values to sub
+=09n =3D stats_fs_source_add_values(sub, test_values, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_values_with_base(sub, &cont);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+
+=09n =3D stats_fs_source_get_value_by_name(sub, "u64", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, def_u64);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D stats_fs_source_get_value_by_name(src, "u64", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+=09n =3D stats_fs_source_get_value_by_name(sub, "s32", &ret);
+=09KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val_s32);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D stats_fs_source_get_value_by_name(src, "s32", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+=09n =3D stats_fs_source_get_value_by_name(sub, "bo", &ret);
+=09KUNIT_EXPECT_EQ(test, ((bool)ret), def_val_bool);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D stats_fs_source_get_value_by_name(src, "bo", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+=09n =3D stats_fs_source_get_value_by_name(sub, "does not exist", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, -ENOENT);
+=09n =3D stats_fs_source_get_value_by_name(src, "does not exist", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+=09stats_fs_source_put(sub);
+=09stats_fs_source_put(src);
+}
+
+static void test_search_value_in_empty_folder(struct kunit *test)
+{
+=09struct stats_fs_source *src;
+=09uint64_t ret;
+=09int n;
+
+=09src =3D stats_fs_source_create("empty folder");
+=09KUNIT_EXPECT_EQ(test, get_number_aggregates(src), 0);
+=09KUNIT_EXPECT_EQ(test, get_number_subsources(src), 0);
+=09KUNIT_EXPECT_EQ(test, get_number_values(src), 0);
+
+=09n =3D stats_fs_source_get_value_by_name(src, "u64", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+=09n =3D stats_fs_source_get_value_by_name(src, "s32", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+=09n =3D stats_fs_source_get_value_by_name(src, "bo", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+=09n =3D stats_fs_source_get_value_by_name(src, "does not exist", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+=09stats_fs_source_put(src);
+}
+
+static void test_add_aggregate(struct kunit *test)
+{
+=09struct stats_fs_source *src;
+=09int n;
+
+=09src =3D stats_fs_source_create("parent");
+
+=09// add aggr to src, no values
+=09n =3D stats_fs_source_add_values(src, test_aggr, NULL);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_values_with_base(src, NULL);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+
+=09// count values
+=09n =3D get_number_aggr_with_base(src, NULL);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_aggr));
+
+=09// add same array again, should not be added
+=09n =3D stats_fs_source_add_values(src, test_aggr, NULL);
+=09KUNIT_EXPECT_EQ(test, n, -EEXIST);
+=09n =3D get_number_aggr_with_base(src, NULL);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_aggr));
+
+=09KUNIT_EXPECT_EQ(test, get_number_values(src), 0);
+=09KUNIT_EXPECT_EQ(test, get_number_aggregates(src), ARR_SIZE(test_aggr));
+
+=09stats_fs_source_put(src);
+}
+
+static void test_add_aggregate_in_subfolder(struct kunit *test)
+{
+=09struct stats_fs_source *src, *sub, *sub_not;
+=09int n;
+
+=09src =3D stats_fs_source_create("parent");
+=09sub =3D stats_fs_source_create("child");
+=09// src->sub
+=09stats_fs_source_add_subordinate(src, sub);
+
+=09// add aggr to sub
+=09n =3D stats_fs_source_add_values(sub, test_aggr, NULL);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(sub, NULL);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_aggr));
+=09KUNIT_EXPECT_EQ(test, get_number_values(src), 0);
+=09KUNIT_EXPECT_EQ(test, get_number_aggregates(src), 0);
+=09KUNIT_EXPECT_EQ(test, get_total_number_values(src), 0);
+
+=09KUNIT_EXPECT_EQ(test, get_number_values(sub), 0);
+=09KUNIT_EXPECT_EQ(test, get_number_aggregates(sub), ARR_SIZE(test_aggr));
+
+=09// not a child
+=09sub_not =3D stats_fs_source_create("not a child");
+
+=09// add aggr to "not a child"
+=09n =3D stats_fs_source_add_values(sub_not, test_aggr, NULL);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(sub_not, NULL);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_aggr));
+=09KUNIT_EXPECT_EQ(test, get_number_values(src), 0);
+=09KUNIT_EXPECT_EQ(test, get_number_aggregates(src), 0);
+=09KUNIT_EXPECT_EQ(test, get_total_number_values(src), 0);
+
+=09// remove sub
+=09stats_fs_source_remove_subordinate(src, sub);
+=09KUNIT_EXPECT_EQ(test, get_total_number_values(src), 0);
+
+=09// re-add both
+=09stats_fs_source_add_subordinate(src, sub);
+=09KUNIT_EXPECT_EQ(test, get_total_number_values(src), 0);
+=09stats_fs_source_add_subordinate(src, sub_not);
+=09KUNIT_EXPECT_EQ(test, get_total_number_values(src), 0);
+
+=09KUNIT_EXPECT_EQ(test, get_number_values(sub_not), 0);
+=09KUNIT_EXPECT_EQ(test, get_number_aggregates(sub_not),
+=09=09=09ARR_SIZE(test_aggr));
+
+=09stats_fs_source_put(sub);
+=09stats_fs_source_put(sub_not);
+=09stats_fs_source_put(src);
+}
+
+static void test_search_aggregate(struct kunit *test)
+{
+=09struct stats_fs_source *src;
+=09uint64_t ret;
+=09int n;
+
+=09src =3D stats_fs_source_create("parent");
+=09n =3D stats_fs_source_add_values(src, test_aggr, NULL);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(src, NULL);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_aggr));
+=09n =3D get_number_aggr_with_base(src, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D stats_fs_source_get_value_by_name(src, "u64", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+
+=09n =3D stats_fs_source_get_value_by_name(src, "s32", &ret);
+=09KUNIT_EXPECT_EQ(test, (int64_t)ret, S64_MAX);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+
+=09n =3D stats_fs_source_get_value_by_name(src, "bo", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+
+=09n =3D stats_fs_source_get_value_by_name(src, "does not exist", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, -ENOENT);
+=09stats_fs_source_put(src);
+}
+
+static void test_search_aggregate_in_subfolder(struct kunit *test)
+{
+=09struct stats_fs_source *src, *sub;
+=09uint64_t ret;
+=09int n;
+
+=09src =3D stats_fs_source_create("parent");
+=09sub =3D stats_fs_source_create("child");
+
+=09stats_fs_source_add_subordinate(src, sub);
+
+=09n =3D stats_fs_source_add_values(sub, test_aggr, NULL);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(sub, NULL);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_aggr));
+=09n =3D get_number_aggr_with_base(sub, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+
+=09// no u64 in test_aggr
+=09n =3D stats_fs_source_get_value_by_name(sub, "u64", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D stats_fs_source_get_value_by_name(src, "u64", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+=09n =3D stats_fs_source_get_value_by_name(sub, "s32", &ret);
+=09KUNIT_EXPECT_EQ(test, (int64_t)ret, S64_MAX);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D stats_fs_source_get_value_by_name(src, "s32", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+=09n =3D stats_fs_source_get_value_by_name(sub, "bo", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D stats_fs_source_get_value_by_name(src, "bo", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+=09n =3D stats_fs_source_get_value_by_name(sub, "does not exist", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, -ENOENT);
+=09n =3D stats_fs_source_get_value_by_name(src, "does not exist", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+=09stats_fs_source_put(sub);
+=09stats_fs_source_put(src);
+}
+
+void test_search_same(struct kunit *test)
+{
+=09struct stats_fs_source *src;
+=09uint64_t ret;
+=09int n;
+
+=09src =3D stats_fs_source_create("parent");
+=09n =3D stats_fs_source_add_values(src, test_same_name, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_values_with_base(src, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 1);
+=09n =3D get_number_aggr_with_base(src, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 1);
+
+=09n =3D stats_fs_source_add_values(src, test_same_name, &cont);
+=09KUNIT_EXPECT_EQ(test, n, -EEXIST);
+=09n =3D get_number_values_with_base(src, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 1);
+=09n =3D get_number_aggr_with_base(src, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 1);
+
+=09// returns first the value
+=09n =3D stats_fs_source_get_value_by_name(src, "s32", &ret);
+=09KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val_s32);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+
+=09stats_fs_source_put(src);
+}
+
+static void test_add_mixed(struct kunit *test)
+{
+=09struct stats_fs_source *src;
+=09int n;
+
+=09src =3D stats_fs_source_create("parent");
+
+=09n =3D stats_fs_source_add_values(src, test_aggr, NULL);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_values_with_base(src, NULL);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D stats_fs_source_add_values(src, test_values, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(src, NULL);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_aggr));
+
+=09n =3D stats_fs_source_add_values(src, test_values, &cont);
+=09KUNIT_EXPECT_EQ(test, n, -EEXIST);
+=09n =3D get_number_values_with_base(src, &cont);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+=09n =3D stats_fs_source_add_values(src, test_aggr, NULL);
+=09KUNIT_EXPECT_EQ(test, n, -EEXIST);
+=09n =3D get_number_aggr_with_base(src, NULL);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_aggr));
+
+=09KUNIT_EXPECT_EQ(test, get_number_values(src), ARR_SIZE(test_values));
+=09KUNIT_EXPECT_EQ(test, get_number_aggregates(src), ARR_SIZE(test_aggr));
+=09stats_fs_source_put(src);
+}
+
+static void test_search_mixed(struct kunit *test)
+{
+=09struct stats_fs_source *src, *sub;
+=09uint64_t ret;
+=09int n;
+
+=09src =3D stats_fs_source_create("parent");
+=09sub =3D stats_fs_source_create("child");
+=09stats_fs_source_add_subordinate(src, sub);
+
+=09// src has the aggregates, sub the values. Just search
+=09n =3D stats_fs_source_add_values(sub, test_values, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_values_with_base(sub, &cont);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+=09n =3D stats_fs_source_add_values(src, test_aggr, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(src, &cont);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_aggr));
+
+=09// u64 is sum so again same value
+=09n =3D stats_fs_source_get_value_by_name(sub, "u64", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, def_u64);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D stats_fs_source_get_value_by_name(src, "u64", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, def_u64);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+
+=09// s32 is min so return the value also in the aggregate
+=09n =3D stats_fs_source_get_value_by_name(sub, "s32", &ret);
+=09KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val_s32);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D stats_fs_source_get_value_by_name(src, "s32", &ret);
+=09KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val_s32);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+
+=09// bo is max
+=09n =3D stats_fs_source_get_value_by_name(sub, "bo", &ret);
+=09KUNIT_EXPECT_EQ(test, (bool)ret, def_val_bool);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D stats_fs_source_get_value_by_name(src, "bo", &ret);
+=09KUNIT_EXPECT_EQ(test, (bool)ret, def_val_bool);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+
+=09n =3D stats_fs_source_get_value_by_name(sub, "does not exist", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, -ENOENT);
+=09n =3D stats_fs_source_get_value_by_name(src, "does not exist", &ret);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+=09stats_fs_source_put(sub);
+=09stats_fs_source_put(src);
+}
+
+static void test_all_aggregations_agg_val_val(struct kunit *test)
+{
+=09struct stats_fs_source *src, *sub1, *sub2;
+=09uint64_t ret;
+=09int n;
+
+=09src =3D stats_fs_source_create("parent");
+=09sub1 =3D stats_fs_source_create("child1");
+=09sub2 =3D stats_fs_source_create("child2");
+=09stats_fs_source_add_subordinate(src, sub1);
+=09stats_fs_source_add_subordinate(src, sub2);
+
+=09n =3D stats_fs_source_add_values(sub1, test_all_aggr, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(sub1, &cont);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+=09n =3D stats_fs_source_add_values(sub2, test_all_aggr, &cont2);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(sub2, &cont2);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+=09n =3D stats_fs_source_add_values(src, test_all_aggr, NULL);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(src, NULL);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+=09// sum
+=09n =3D stats_fs_source_get_value_by_name(src, "u64", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ret, def_u64 * 2);
+
+=09// min
+=09n =3D stats_fs_source_get_value_by_name(src, "s32", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val_s32);
+
+=09// count_0
+=09n =3D stats_fs_source_get_value_by_name(src, "bo", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ret, 1ull);
+
+=09// avg
+=09n =3D stats_fs_source_get_value_by_name(src, "u8", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ret, 191ull);
+
+=09// max
+=09n =3D stats_fs_source_get_value_by_name(src, "s16", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, (int16_t)ret, def_val_s16);
+
+=09stats_fs_source_put(sub1);
+=09stats_fs_source_put(sub2);
+=09stats_fs_source_put(src);
+}
+
+static void test_all_aggregations_val_agg_val(struct kunit *test)
+{
+=09struct stats_fs_source *src, *sub1, *sub2;
+=09uint64_t ret;
+=09int n;
+
+=09src =3D stats_fs_source_create("parent");
+=09sub1 =3D stats_fs_source_create("child1");
+=09sub2 =3D stats_fs_source_create("child2");
+=09stats_fs_source_add_subordinate(src, sub1);
+=09stats_fs_source_add_subordinate(src, sub2);
+
+=09n =3D stats_fs_source_add_values(src, test_all_aggr, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(src, &cont);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+=09n =3D stats_fs_source_add_values(sub2, test_all_aggr, &cont2);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(sub2, &cont2);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+=09n =3D stats_fs_source_add_values(sub1, test_all_aggr, NULL);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(sub1, NULL);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+=09n =3D stats_fs_source_get_value_by_name(src, "u64", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ret, def_u64);
+=09n =3D stats_fs_source_get_value_by_name(sub1, "u64", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09n =3D stats_fs_source_get_value_by_name(sub2, "u64", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ret, def_u64);
+
+=09n =3D stats_fs_source_get_value_by_name(src, "s32", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val_s32);
+=09n =3D stats_fs_source_get_value_by_name(sub1, "s32", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, (int64_t)ret, S64_MAX); // MIN
+=09n =3D stats_fs_source_get_value_by_name(sub2, "s32", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val2_s32);
+
+=09n =3D stats_fs_source_get_value_by_name(src, "bo", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, (bool)ret, def_val_bool);
+=09n =3D stats_fs_source_get_value_by_name(sub1, "bo", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09n =3D stats_fs_source_get_value_by_name(sub2, "bo", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, (bool)ret, def_val2_bool);
+
+=09n =3D stats_fs_source_get_value_by_name(src, "u8", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, (uint8_t)ret, def_val_u8);
+=09n =3D stats_fs_source_get_value_by_name(sub1, "u8", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ret, 0ull);
+=09n =3D stats_fs_source_get_value_by_name(sub2, "u8", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, (uint8_t)ret, def_val2_u8);
+
+=09n =3D stats_fs_source_get_value_by_name(src, "s16", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, (int16_t)ret, def_val_s16);
+=09n =3D stats_fs_source_get_value_by_name(sub1, "s16", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, (int64_t)ret, S64_MIN); // MAX
+=09n =3D stats_fs_source_get_value_by_name(sub2, "s16", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, (int16_t)ret, def_val2_s16);
+
+=09stats_fs_source_put(sub1);
+=09stats_fs_source_put(sub2);
+=09stats_fs_source_put(src);
+}
+
+static void test_all_aggregations_agg_val_val_sub(struct kunit *test)
+{
+=09struct stats_fs_source *src, *sub1, *sub11;
+=09uint64_t ret;
+=09int n;
+
+=09src =3D stats_fs_source_create("parent");
+=09sub1 =3D stats_fs_source_create("child1");
+=09sub11 =3D stats_fs_source_create("child11");
+=09stats_fs_source_add_subordinate(src, sub1);
+=09stats_fs_source_add_subordinate(sub1, sub11); // changes here!
+
+=09n =3D stats_fs_source_add_values(sub1, test_values, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_values_with_base(sub1, &cont);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+=09n =3D stats_fs_source_add_values(sub11, test_values, &cont2);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_values_with_base(sub11, &cont2);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+
+=09KUNIT_EXPECT_EQ(test, get_total_number_values(src),
+=09=09=09ARR_SIZE(test_values) * 2);
+
+=09n =3D stats_fs_source_add_values(sub1, test_all_aggr, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(sub1, &cont);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+=09n =3D stats_fs_source_add_values(sub11, test_all_aggr, &cont2);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(sub11, &cont2);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+=09n =3D stats_fs_source_add_values(src, test_all_aggr, NULL);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(src, NULL);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+=09// sum
+=09n =3D stats_fs_source_get_value_by_name(src, "u64", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ret, def_u64 * 2);
+
+=09// min
+=09n =3D stats_fs_source_get_value_by_name(src, "s32", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val_s32);
+
+=09// count_0
+=09n =3D stats_fs_source_get_value_by_name(src, "bo", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ret, 1ull);
+
+=09// avg
+=09n =3D stats_fs_source_get_value_by_name(src, "u8", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ret, 191ull);
+
+=09// max
+=09n =3D stats_fs_source_get_value_by_name(src, "s16", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, (int16_t)ret, def_val_s16);
+
+=09stats_fs_source_put(sub1);
+=09stats_fs_source_put(sub11);
+=09stats_fs_source_put(src);
+}
+
+static void test_all_aggregations_agg_no_val_sub(struct kunit *test)
+{
+=09struct stats_fs_source *src, *sub1, *sub11;
+=09uint64_t ret;
+=09int n;
+
+=09src =3D stats_fs_source_create("parent");
+=09sub1 =3D stats_fs_source_create("child1");
+=09sub11 =3D stats_fs_source_create("child11");
+=09stats_fs_source_add_subordinate(src, sub1);
+=09stats_fs_source_add_subordinate(sub1, sub11);
+
+=09n =3D stats_fs_source_add_values(sub11, test_all_aggr, &cont2);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(sub11, &cont2);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+=09KUNIT_EXPECT_EQ(test, get_total_number_values(src), 0);
+
+=09n =3D stats_fs_source_add_values(src, test_all_aggr, NULL);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(src, NULL);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+=09// sum
+=09n =3D stats_fs_source_get_value_by_name(src, "u64", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ret, def_u64);
+
+=09// min
+=09n =3D stats_fs_source_get_value_by_name(src, "s32", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val2_s32);
+
+=09// count_0
+=09n =3D stats_fs_source_get_value_by_name(src, "bo", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ret, 1ull);
+
+=09// avg
+=09n =3D stats_fs_source_get_value_by_name(src, "u8", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, (uint8_t)ret, def_val2_u8);
+
+=09// max
+=09n =3D stats_fs_source_get_value_by_name(src, "s16", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, (int16_t)ret, def_val2_s16);
+
+=09stats_fs_source_put(sub1);
+=09stats_fs_source_put(sub11);
+=09stats_fs_source_put(src);
+}
+
+static void test_all_aggregations_agg_agg_val_sub(struct kunit *test)
+{
+=09struct stats_fs_source *src, *sub1, *sub11, *sub12;
+=09uint64_t ret;
+=09int n;
+
+=09src =3D stats_fs_source_create("parent");
+=09sub1 =3D stats_fs_source_create("child1");
+=09sub11 =3D stats_fs_source_create("child11");
+=09sub12 =3D stats_fs_source_create("child12");
+=09stats_fs_source_add_subordinate(src, sub1);
+=09stats_fs_source_add_subordinate(sub1, sub11);
+=09stats_fs_source_add_subordinate(sub1, sub12);
+
+=09n =3D stats_fs_source_add_values(sub11, test_all_aggr, &cont2);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(sub11, &cont2);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+=09n =3D stats_fs_source_add_values(sub12, test_all_aggr, &cont);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(sub12, &cont);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+=09KUNIT_EXPECT_EQ(test, get_total_number_values(src), 0);
+
+=09n =3D stats_fs_source_add_values(src, test_all_aggr, NULL);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(src, NULL);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+=09n =3D stats_fs_source_add_values(sub1, test_all_aggr, NULL);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09n =3D get_number_aggr_with_base(sub1, NULL);
+=09KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+=09// sum
+=09n =3D stats_fs_source_get_value_by_name(src, "u64", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ret, def_u64 * 2);
+
+=09// min
+=09n =3D stats_fs_source_get_value_by_name(src, "s32", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val_s32);
+
+=09// count_0
+=09n =3D stats_fs_source_get_value_by_name(src, "bo", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, ret, 1ull);
+
+=09// avg
+=09n =3D stats_fs_source_get_value_by_name(src, "u8", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, (uint8_t)ret,
+=09=09=09(uint8_t)((def_val2_u8 + def_val_u8) / 2));
+
+=09// max
+=09n =3D stats_fs_source_get_value_by_name(src, "s16", &ret);
+=09KUNIT_EXPECT_EQ(test, n, 0);
+=09KUNIT_EXPECT_EQ(test, (int16_t)ret, def_val_s16);
+
+=09stats_fs_source_put(sub1);
+=09stats_fs_source_put(sub11);
+=09stats_fs_source_put(sub12);
+=09stats_fs_source_put(src);
+}
+
+static struct kunit_case stats_fs_test_cases[] =3D {
+=09KUNIT_CASE(test_empty_folder),
+=09KUNIT_CASE(test_add_subfolder),
+=09KUNIT_CASE(test_add_value),
+=09KUNIT_CASE(test_add_value_in_subfolder),
+=09KUNIT_CASE(test_search_value),
+=09KUNIT_CASE(test_search_value_in_subfolder),
+=09KUNIT_CASE(test_search_value_in_empty_folder),
+=09KUNIT_CASE(test_add_aggregate),
+=09KUNIT_CASE(test_add_aggregate_in_subfolder),
+=09KUNIT_CASE(test_search_aggregate),
+=09KUNIT_CASE(test_search_aggregate_in_subfolder),
+=09KUNIT_CASE(test_search_same),
+=09KUNIT_CASE(test_add_mixed),
+=09KUNIT_CASE(test_search_mixed),
+=09KUNIT_CASE(test_all_aggregations_agg_val_val),
+=09KUNIT_CASE(test_all_aggregations_val_agg_val),
+=09KUNIT_CASE(test_all_aggregations_agg_val_val_sub),
+=09KUNIT_CASE(test_all_aggregations_agg_no_val_sub),
+=09KUNIT_CASE(test_all_aggregations_agg_agg_val_sub),
+=09{}
+};
+
+static struct kunit_suite stats_fs_test_suite =3D {
+=09.name =3D "stats_fs",
+=09.test_cases =3D stats_fs_test_cases,
+};
+
+kunit_test_suite(stats_fs_test_suite);
--=20
2.25.2

