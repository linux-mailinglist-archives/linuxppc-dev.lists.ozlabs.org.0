Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8EB1E20B7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 13:13:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WWXc2nmszDqRd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 21:13:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=CL1ERG+B; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=CL1ERG+B; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WWM55KGHzDqLD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 21:04:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590491086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5O6wmB+OtEgOpdTgMhwmvMej/HndgSjcssxfpqUYQvo=;
 b=CL1ERG+Bx4ujKAODpmGsBTEss3mh3YCVFTJTyN0fU5OF2oSEb/iOAv9GeoHfzuZIh/1Aoy
 qSYvrQBAVW94lFjGyBrwkrUzZnkW9eNvIURjKfydSOFRapzTlrPTv9ZiZVYm3xRXZ65kIz
 BvWQeSG++y9M/sOVgcCBBSesw1O+v+Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590491086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5O6wmB+OtEgOpdTgMhwmvMej/HndgSjcssxfpqUYQvo=;
 b=CL1ERG+Bx4ujKAODpmGsBTEss3mh3YCVFTJTyN0fU5OF2oSEb/iOAv9GeoHfzuZIh/1Aoy
 qSYvrQBAVW94lFjGyBrwkrUzZnkW9eNvIURjKfydSOFRapzTlrPTv9ZiZVYm3xRXZ65kIz
 BvWQeSG++y9M/sOVgcCBBSesw1O+v+Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-ypQjkMEGP8eZZr9kXonI8Q-1; Tue, 26 May 2020 07:04:44 -0400
X-MC-Unique: ypQjkMEGP8eZZr9kXonI8Q-1
Received: by mail-wr1-f71.google.com with SMTP id s7so3134439wrm.16
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 04:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5O6wmB+OtEgOpdTgMhwmvMej/HndgSjcssxfpqUYQvo=;
 b=SBX9mIV25QeHFvtLFuuH58oB1sKIDl+yzurXZw4IQHHneDcMrD20EKRTFERwjVnPFE
 swh7hCxm9qIECiIbUBPSfF/PSqlFenQo72ByjheCIMPg+MQzGlesAf2tYpN6uVckdHot
 FoGmwqyhUqJlw2724fsSbar1PGwzM0yomBEKFgWCDjxCMAgWEI7Ox6Z+SHRRDfgogtWm
 cNOmFRrruCUx4cnWjYUTlc5tQF0ai2GePSdW4gUotHez9GGEtvl/+xNrInJhjSEG4fQU
 zPyQzGC7Sap23ghLHLQ3dGpAIVGbH9THarpRga/041FRjI0BIbX5uozlyRYrJyKAfZ4v
 ayFA==
X-Gm-Message-State: AOAM531RFH9fOU0ra5DFJCRC/j8/4qjorH52AqVsmTOY1TwhgNmFpFwH
 bdGphZ2lDJhXdAnfdujaoJjWNF3ll3bwo+gQYXPc7L0SRpGnZFAk7J1rKJrqCZxZAb79t4erc9l
 3egQhCG+VTwHcv7xyE2F7ptmeMQ==
X-Received: by 2002:a1c:c2c5:: with SMTP id s188mr923820wmf.18.1590491082948; 
 Tue, 26 May 2020 04:04:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5nQZudivZ6Pr1hFC05FMBitfCfMfBgLsi4yLshtoZEJ/TmA0F8Yn3yi1E4u4AmyKLDArSrw==
X-Received: by 2002:a1c:c2c5:: with SMTP id s188mr923747wmf.18.1590491082186; 
 Tue, 26 May 2020 04:04:42 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.118])
 by smtp.gmail.com with ESMTPSA id d6sm22928240wrj.90.2020.05.26.04.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 04:04:30 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH v3 3/7] kunit: tests for stats_fs API
Date: Tue, 26 May 2020 13:03:13 +0200
Message-Id: <20200526110318.69006-4-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200526110318.69006-1-eesposit@redhat.com>
References: <20200526110318.69006-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
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
 linux-s390@vger.kernel.org, linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Jonathan Adams <jwadams@google.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Rientjes <rientjes@google.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add kunit tests to extensively test the stats_fs API functionality.

In order to run them, the kernel .config must set CONFIG_KUNIT=y
and a new .kunitconfig file must be created with CONFIG_STATS_FS=y
and CONFIG_STATS_FS_TEST=y

Tests can be then started by running the following command from the root
directory of the linux kernel source tree:
./tools/testing/kunit/kunit.py run --timeout=30 --jobs=`nproc --all`

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 fs/Kconfig                   |    6 +
 fs/stats_fs/Makefile         |    2 +
 fs/stats_fs/stats_fs-tests.c | 1097 ++++++++++++++++++++++++++++++++++
 3 files changed, 1105 insertions(+)
 create mode 100644 fs/stats_fs/stats_fs-tests.c

diff --git a/fs/Kconfig b/fs/Kconfig
index 684ad61129ab..02bbb0e4cdf7 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -227,6 +227,12 @@ config STATS_FS
 	  stats_fs is a virtual file system that provides counters and
 	  other statistics about the running kernel.
 
+config STATS_FS_TEST
+	bool "Tests for stats_fs"
+	depends on STATS_FS && KUNIT
+	help
+	  tests for the stats_fs API.
+
 config STATS_FS_API
 	bool
 	imply STATS_FS
diff --git a/fs/stats_fs/Makefile b/fs/stats_fs/Makefile
index bd988daa4c39..bc59a54d5721 100644
--- a/fs/stats_fs/Makefile
+++ b/fs/stats_fs/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 stats_fs-objs	:= stats_fs.o
+stats_fs-tests-objs	:= stats_fs-tests.o
 
 obj-$(CONFIG_STATS_FS)	    += stats_fs.o
 obj-$(CONFIG_STATS_FS_STUB) += stub.o
+obj-$(CONFIG_STATS_FS_TEST) += stats_fs-tests.o
diff --git a/fs/stats_fs/stats_fs-tests.c b/fs/stats_fs/stats_fs-tests.c
new file mode 100644
index 000000000000..bbac133d7fe7
--- /dev/null
+++ b/fs/stats_fs/stats_fs-tests.c
@@ -0,0 +1,1097 @@
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
+#define STATS_FS_STAT(el, x, ...)                                              \
+	{                                                                      \
+		.name = #x, .offset = offsetof(struct container, el.x),        \
+		##__VA_ARGS__                                                  \
+	}
+
+#define ARR_SIZE(el) ((int)(sizeof(el) / sizeof(struct stats_fs_value) - 1))
+
+struct test_values_struct {
+	uint64_t u64;
+	int32_t s32;
+	bool bo;
+	uint8_t u8;
+	int16_t s16;
+};
+
+struct container {
+	struct test_values_struct vals;
+};
+
+struct stats_fs_value test_values[6] = {
+	STATS_FS_STAT(vals, u64, .type = &stats_fs_type_u64,
+		      .aggr_kind = STATS_FS_NONE,
+		      .value_flag = STATS_FS_FLOATING_VALUE),
+	STATS_FS_STAT(vals, s32, .type = &stats_fs_type_s32,
+		      .aggr_kind = STATS_FS_NONE),
+	STATS_FS_STAT(vals, bo, .type = &stats_fs_type_bool,
+		      .aggr_kind = STATS_FS_NONE,
+		      .value_flag = STATS_FS_FLOATING_VALUE),
+	STATS_FS_STAT(vals, u8, .type = &stats_fs_type_u8,
+		      .aggr_kind = STATS_FS_NONE),
+	STATS_FS_STAT(vals, s16, .type = &stats_fs_type_s16,
+		      .aggr_kind = STATS_FS_NONE,
+		      .value_flag = STATS_FS_FLOATING_VALUE),
+	{ NULL },
+};
+
+struct stats_fs_value test_aggr[4] = {
+	STATS_FS_STAT(vals, s32, .type = &stats_fs_type_s32,
+		      .aggr_kind = STATS_FS_MIN,
+		      .value_flag = STATS_FS_FLOATING_VALUE),
+	STATS_FS_STAT(vals, bo, .type = &stats_fs_type_bool,
+		      .aggr_kind = STATS_FS_MAX,
+		      .value_flag = STATS_FS_FLOATING_VALUE),
+	STATS_FS_STAT(vals, u64, .type = &stats_fs_type_u64,
+		      .aggr_kind = STATS_FS_SUM,
+		      .value_flag = STATS_FS_FLOATING_VALUE),
+	{ NULL },
+};
+
+struct stats_fs_value test_same_name[3] = {
+	STATS_FS_STAT(vals, s32, .type = &stats_fs_type_s32,
+		      .aggr_kind = STATS_FS_NONE),
+	STATS_FS_STAT(vals, s32, .type = &stats_fs_type_s32,
+		      .aggr_kind = STATS_FS_MIN),
+	{ NULL },
+};
+
+struct stats_fs_value test_all_aggr[6] = {
+	STATS_FS_STAT(vals, s32, .type = &stats_fs_type_s32,
+		      .aggr_kind = STATS_FS_MIN),
+	STATS_FS_STAT(vals, bo, .type = &stats_fs_type_bool,
+		      .aggr_kind = STATS_FS_COUNT_ZERO,
+		      .value_flag = STATS_FS_FLOATING_VALUE),
+	STATS_FS_STAT(vals, u64, .type = &stats_fs_type_u64,
+		      .aggr_kind = STATS_FS_SUM),
+	STATS_FS_STAT(vals, u8, .type = &stats_fs_type_u8,
+		      .aggr_kind = STATS_FS_AVG,
+		      .value_flag = STATS_FS_FLOATING_VALUE),
+	STATS_FS_STAT(vals, s16, .type = &stats_fs_type_s16,
+		      .aggr_kind = STATS_FS_MAX,
+		      .value_flag = STATS_FS_FLOATING_VALUE),
+	{ NULL },
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
+struct container cont = {
+	.vals = {
+			.u64 = def_u64,
+			.s32 = def_val_s32,
+			.bo = def_val_bool,
+			.u8 = def_val_u8,
+			.s16 = def_val_s16,
+		},
+};
+
+struct container cont2 = {
+	.vals = {
+			.u64 = def_u64,
+			.s32 = def_val2_s32,
+			.bo = def_val2_bool,
+			.u8 = def_val2_u8,
+			.s16 = def_val2_s16,
+		},
+};
+
+static void get_stats_at_addr(struct stats_fs_source *src, void *addr,
+			      int *aggr, int *val, int use_addr)
+{
+	struct stats_fs_value *entry;
+	struct stats_fs_value_source *src_entry;
+	int counter_val = 0, counter_aggr = 0;
+
+	list_for_each_entry (src_entry, &src->values_head, list_element) {
+		if (use_addr && src_entry->base_addr != addr)
+			continue;
+
+		for (entry = src_entry->values; entry->name; entry++) {
+			if (entry->aggr_kind == STATS_FS_NONE)
+				counter_val++;
+			else
+				counter_aggr++;
+		}
+	}
+
+	if (aggr)
+		*aggr = counter_aggr;
+
+	if (val)
+		*val = counter_val;
+}
+
+int source_has_subsource(struct stats_fs_source *src,
+			 struct stats_fs_source *sub)
+{
+	struct stats_fs_source *entry;
+
+	list_for_each_entry (entry, &src->subordinates_head, list_element) {
+		if (entry == sub)
+			return 1;
+	}
+	return 0;
+}
+
+int get_number_subsources(struct stats_fs_source *src)
+{
+	struct stats_fs_source *entry;
+	int counter = 0;
+
+	list_for_each_entry (entry, &src->subordinates_head, list_element) {
+		counter++;
+	}
+	return counter;
+}
+
+int get_number_values(struct stats_fs_source *src)
+{
+	int counter = 0;
+
+	get_stats_at_addr(src, NULL, NULL, &counter, 0);
+	return counter;
+}
+
+int get_total_number_values(struct stats_fs_source *src)
+{
+	struct stats_fs_source *sub_entry;
+	int counter = 0;
+
+	get_stats_at_addr(src, NULL, NULL, &counter, 0);
+
+	list_for_each_entry (sub_entry, &src->subordinates_head, list_element) {
+		counter += get_total_number_values(sub_entry);
+	}
+
+	return counter;
+}
+
+int get_number_aggregates(struct stats_fs_source *src)
+{
+	int counter = 0;
+
+	get_stats_at_addr(src, NULL, &counter, NULL, 1);
+	return counter;
+}
+
+int get_number_values_with_base(struct stats_fs_source *src, void *addr)
+{
+	int counter = 0;
+
+	get_stats_at_addr(src, addr, NULL, &counter, 1);
+	return counter;
+}
+
+int get_number_aggr_with_base(struct stats_fs_source *src, void *addr)
+{
+	int counter = 0;
+
+	get_stats_at_addr(src, addr, &counter, NULL, 1);
+	return counter;
+}
+
+static void test_empty_folder(struct kunit *test)
+{
+	struct stats_fs_source *src;
+
+	src = stats_fs_source_create(0, "kvm_%d", 123);
+	KUNIT_EXPECT_EQ(test, strcmp(src->name, "kvm_123"), 0);
+	KUNIT_EXPECT_EQ(test, get_number_subsources(src), 0);
+	KUNIT_EXPECT_EQ(test, get_number_values(src), 0);
+	KUNIT_EXPECT_EQ(test, get_number_aggregates(src), 0);
+	stats_fs_source_put(src);
+}
+
+static void test_add_subfolder(struct kunit *test)
+{
+	struct stats_fs_source *src, *sub;
+
+	src = stats_fs_source_create(0, "parent");
+	sub = stats_fs_source_create(0, "child");
+	stats_fs_source_add_subordinate(src, sub);
+	KUNIT_EXPECT_EQ(test, source_has_subsource(src, sub), true);
+	KUNIT_EXPECT_EQ(test, get_number_subsources(src), 1);
+	KUNIT_EXPECT_EQ(test, get_number_values(src), 0);
+	KUNIT_EXPECT_EQ(test, get_number_aggregates(src), 0);
+	KUNIT_EXPECT_EQ(test, get_number_values(sub), 0);
+	KUNIT_EXPECT_EQ(test, get_number_aggregates(sub), 0);
+	KUNIT_EXPECT_EQ(test, get_total_number_values(src), 0);
+
+	stats_fs_source_put(sub);
+	sub = stats_fs_source_create(0, "not a child");
+	KUNIT_EXPECT_EQ(test, source_has_subsource(src, sub), false);
+	KUNIT_EXPECT_EQ(test, get_number_subsources(src), 1);
+
+	stats_fs_source_put(sub);
+	stats_fs_source_put(src);
+}
+
+static void test_add_value(struct kunit *test)
+{
+	struct stats_fs_source *src;
+	int n;
+
+	src = stats_fs_source_create(0, "parent");
+
+	// add values
+	n = stats_fs_source_add_values(src, test_values, &cont, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_values_with_base(src, &cont);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+
+	// add same values, nothing happens
+	n = stats_fs_source_add_values(src, test_values, &cont, 0);
+	KUNIT_EXPECT_EQ(test, n, -EEXIST);
+	n = get_number_values_with_base(src, &cont);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+
+	// size is invaried
+	KUNIT_EXPECT_EQ(test, get_number_values(src), ARR_SIZE(test_values));
+
+	// no aggregates
+	n = get_number_aggr_with_base(src, &cont);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, get_number_values(src), ARR_SIZE(test_values));
+	KUNIT_EXPECT_EQ(test, get_number_aggregates(src), 0);
+
+	stats_fs_source_put(src);
+}
+
+static void test_add_value_in_subfolder(struct kunit *test)
+{
+	struct stats_fs_source *src, *sub, *sub_not;
+	int n;
+
+	src = stats_fs_source_create(0, "parent");
+	sub = stats_fs_source_create(0, "child");
+
+	// src -> sub
+	stats_fs_source_add_subordinate(src, sub);
+
+	// add values
+	n = stats_fs_source_add_values(sub, test_values, &cont, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_values_with_base(sub, &cont);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+	KUNIT_EXPECT_EQ(test, get_number_values(src), 0);
+	KUNIT_EXPECT_EQ(test, get_number_aggregates(src), 0);
+	KUNIT_EXPECT_EQ(test, get_total_number_values(src),
+			ARR_SIZE(test_values));
+
+	KUNIT_EXPECT_EQ(test, get_number_values(sub), ARR_SIZE(test_values));
+	// no values in sub
+	KUNIT_EXPECT_EQ(test, get_number_aggregates(sub), 0);
+
+	// different folder
+	sub_not = stats_fs_source_create(0, "not a child");
+
+	// add values
+	n = stats_fs_source_add_values(sub_not, test_values, &cont, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_values_with_base(sub_not, &cont);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+	KUNIT_EXPECT_EQ(test, get_number_values(src), 0);
+	KUNIT_EXPECT_EQ(test, get_number_aggregates(src), 0);
+	KUNIT_EXPECT_EQ(test, get_total_number_values(src),
+			ARR_SIZE(test_values));
+
+	// remove sub, check values is 0
+	stats_fs_source_remove_subordinate(src, sub);
+	KUNIT_EXPECT_EQ(test, get_total_number_values(src), 0);
+
+	// re-add sub, check value are added
+	stats_fs_source_add_subordinate(src, sub);
+	KUNIT_EXPECT_EQ(test, get_total_number_values(src),
+			ARR_SIZE(test_values));
+
+	// add sub_not, check value are twice as many
+	stats_fs_source_add_subordinate(src, sub_not);
+	KUNIT_EXPECT_EQ(test, get_total_number_values(src),
+			ARR_SIZE(test_values) * 2);
+
+	KUNIT_EXPECT_EQ(test, get_number_values(sub_not),
+			ARR_SIZE(test_values));
+	KUNIT_EXPECT_EQ(test, get_number_aggregates(sub_not), 0);
+
+	stats_fs_source_put(sub);
+	stats_fs_source_put(sub_not);
+	stats_fs_source_put(src);
+}
+
+static void test_search_value(struct kunit *test)
+{
+	struct stats_fs_source *src;
+	uint64_t ret;
+	int n;
+
+	src = stats_fs_source_create(0, "parent");
+
+	// add values
+	n = stats_fs_source_add_values(src, test_values, &cont, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_values_with_base(src, &cont);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+
+	// get u64
+	n = stats_fs_source_get_value_by_name(src, "u64", &ret);
+	KUNIT_EXPECT_EQ(test, ret, def_u64);
+	KUNIT_EXPECT_EQ(test, n, 0);
+
+	n = stats_fs_source_get_value_by_name(src, "s32", &ret);
+	KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val_s32);
+	KUNIT_EXPECT_EQ(test, n, 0);
+
+	n = stats_fs_source_get_value_by_name(src, "bo", &ret);
+	KUNIT_EXPECT_EQ(test, ((bool)ret), def_val_bool);
+	KUNIT_EXPECT_EQ(test, n, 0);
+
+	// get a non-added value
+	n = stats_fs_source_get_value_by_name(src, "does not exist", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+	stats_fs_source_put(src);
+}
+
+static void test_search_value_in_subfolder(struct kunit *test)
+{
+	struct stats_fs_source *src, *sub;
+	uint64_t ret;
+	int n;
+
+	src = stats_fs_source_create(0, "parent");
+	sub = stats_fs_source_create(0, "child");
+
+	// src -> sub
+	stats_fs_source_add_subordinate(src, sub);
+
+	// add values to sub
+	n = stats_fs_source_add_values(sub, test_values, &cont, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_values_with_base(sub, &cont);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+
+	n = stats_fs_source_get_value_by_name(sub, "u64", &ret);
+	KUNIT_EXPECT_EQ(test, ret, def_u64);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = stats_fs_source_get_value_by_name(src, "u64", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+	n = stats_fs_source_get_value_by_name(sub, "s32", &ret);
+	KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val_s32);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = stats_fs_source_get_value_by_name(src, "s32", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+	n = stats_fs_source_get_value_by_name(sub, "bo", &ret);
+	KUNIT_EXPECT_EQ(test, ((bool)ret), def_val_bool);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = stats_fs_source_get_value_by_name(src, "bo", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+	n = stats_fs_source_get_value_by_name(sub, "does not exist", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, -ENOENT);
+	n = stats_fs_source_get_value_by_name(src, "does not exist", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+	stats_fs_source_put(sub);
+	stats_fs_source_put(src);
+}
+
+static void test_search_value_in_empty_folder(struct kunit *test)
+{
+	struct stats_fs_source *src;
+	uint64_t ret;
+	int n;
+
+	src = stats_fs_source_create(0, "empty folder");
+	KUNIT_EXPECT_EQ(test, get_number_aggregates(src), 0);
+	KUNIT_EXPECT_EQ(test, get_number_subsources(src), 0);
+	KUNIT_EXPECT_EQ(test, get_number_values(src), 0);
+
+	n = stats_fs_source_get_value_by_name(src, "u64", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+	n = stats_fs_source_get_value_by_name(src, "s32", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+	n = stats_fs_source_get_value_by_name(src, "bo", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+	n = stats_fs_source_get_value_by_name(src, "does not exist", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+	stats_fs_source_put(src);
+}
+
+static void test_add_aggregate(struct kunit *test)
+{
+	struct stats_fs_source *src;
+	int n;
+
+	src = stats_fs_source_create(0, "parent");
+
+	// add aggr to src, no values
+	n = stats_fs_source_add_values(src, test_aggr, NULL, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_values_with_base(src, NULL);
+	KUNIT_EXPECT_EQ(test, n, 0);
+
+	// count values
+	n = get_number_aggr_with_base(src, NULL);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_aggr));
+
+	// add same array again, should not be added
+	n = stats_fs_source_add_values(src, test_aggr, NULL, 0);
+	KUNIT_EXPECT_EQ(test, n, -EEXIST);
+	n = get_number_aggr_with_base(src, NULL);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_aggr));
+
+	KUNIT_EXPECT_EQ(test, get_number_values(src), 0);
+	KUNIT_EXPECT_EQ(test, get_number_aggregates(src), ARR_SIZE(test_aggr));
+
+	stats_fs_source_put(src);
+}
+
+static void test_add_aggregate_in_subfolder(struct kunit *test)
+{
+	struct stats_fs_source *src, *sub, *sub_not;
+	int n;
+
+	src = stats_fs_source_create(0, "parent");
+	sub = stats_fs_source_create(0, "child");
+	// src->sub
+	stats_fs_source_add_subordinate(src, sub);
+
+	// add aggr to sub
+	n = stats_fs_source_add_values(sub, test_aggr, NULL, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(sub, NULL);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_aggr));
+	KUNIT_EXPECT_EQ(test, get_number_values(src), 0);
+	KUNIT_EXPECT_EQ(test, get_number_aggregates(src), 0);
+	KUNIT_EXPECT_EQ(test, get_total_number_values(src), 0);
+
+	KUNIT_EXPECT_EQ(test, get_number_values(sub), 0);
+	KUNIT_EXPECT_EQ(test, get_number_aggregates(sub), ARR_SIZE(test_aggr));
+
+	// not a child
+	sub_not = stats_fs_source_create(0, "not a child");
+
+	// add aggr to "not a child"
+	n = stats_fs_source_add_values(sub_not, test_aggr, NULL, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(sub_not, NULL);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_aggr));
+	KUNIT_EXPECT_EQ(test, get_number_values(src), 0);
+	KUNIT_EXPECT_EQ(test, get_number_aggregates(src), 0);
+	KUNIT_EXPECT_EQ(test, get_total_number_values(src), 0);
+
+	// remove sub
+	stats_fs_source_remove_subordinate(src, sub);
+	KUNIT_EXPECT_EQ(test, get_total_number_values(src), 0);
+
+	// re-add both
+	stats_fs_source_add_subordinate(src, sub);
+	KUNIT_EXPECT_EQ(test, get_total_number_values(src), 0);
+	stats_fs_source_add_subordinate(src, sub_not);
+	KUNIT_EXPECT_EQ(test, get_total_number_values(src), 0);
+
+	KUNIT_EXPECT_EQ(test, get_number_values(sub_not), 0);
+	KUNIT_EXPECT_EQ(test, get_number_aggregates(sub_not),
+			ARR_SIZE(test_aggr));
+
+	stats_fs_source_put(sub);
+	stats_fs_source_put(sub_not);
+	stats_fs_source_put(src);
+}
+
+static void test_search_aggregate(struct kunit *test)
+{
+	struct stats_fs_source *src;
+	uint64_t ret;
+	int n;
+
+	src = stats_fs_source_create(0, "parent");
+	n = stats_fs_source_add_values(src, test_aggr, NULL, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(src, NULL);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_aggr));
+	n = get_number_aggr_with_base(src, &cont);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = stats_fs_source_get_value_by_name(src, "u64", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, 0);
+
+	n = stats_fs_source_get_value_by_name(src, "s32", &ret);
+	KUNIT_EXPECT_EQ(test, (int64_t)ret, S64_MAX);
+	KUNIT_EXPECT_EQ(test, n, 0);
+
+	n = stats_fs_source_get_value_by_name(src, "bo", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, 0);
+
+	n = stats_fs_source_get_value_by_name(src, "does not exist", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, -ENOENT);
+	stats_fs_source_put(src);
+}
+
+static void test_search_aggregate_in_subfolder(struct kunit *test)
+{
+	struct stats_fs_source *src, *sub;
+	uint64_t ret;
+	int n;
+
+	src = stats_fs_source_create(0, "parent");
+	sub = stats_fs_source_create(0, "child");
+
+	stats_fs_source_add_subordinate(src, sub);
+
+	n = stats_fs_source_add_values(sub, test_aggr, NULL, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(sub, NULL);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_aggr));
+	n = get_number_aggr_with_base(sub, &cont);
+	KUNIT_EXPECT_EQ(test, n, 0);
+
+	// no u64 in test_aggr
+	n = stats_fs_source_get_value_by_name(sub, "u64", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = stats_fs_source_get_value_by_name(src, "u64", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+	n = stats_fs_source_get_value_by_name(sub, "s32", &ret);
+	KUNIT_EXPECT_EQ(test, (int64_t)ret, S64_MAX);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = stats_fs_source_get_value_by_name(src, "s32", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+	n = stats_fs_source_get_value_by_name(sub, "bo", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = stats_fs_source_get_value_by_name(src, "bo", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+	n = stats_fs_source_get_value_by_name(sub, "does not exist", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, -ENOENT);
+	n = stats_fs_source_get_value_by_name(src, "does not exist", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+	stats_fs_source_put(sub);
+	stats_fs_source_put(src);
+}
+
+void test_search_same(struct kunit *test)
+{
+	struct stats_fs_source *src;
+	uint64_t ret;
+	int n;
+
+	src = stats_fs_source_create(0, "parent");
+	n = stats_fs_source_add_values(src, test_same_name, &cont, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_values_with_base(src, &cont);
+	KUNIT_EXPECT_EQ(test, n, 1);
+	n = get_number_aggr_with_base(src, &cont);
+	KUNIT_EXPECT_EQ(test, n, 1);
+
+	n = stats_fs_source_add_values(src, test_same_name, &cont, 0);
+	KUNIT_EXPECT_EQ(test, n, -EEXIST);
+	n = get_number_values_with_base(src, &cont);
+	KUNIT_EXPECT_EQ(test, n, 1);
+	n = get_number_aggr_with_base(src, &cont);
+	KUNIT_EXPECT_EQ(test, n, 1);
+
+	// returns first the value
+	n = stats_fs_source_get_value_by_name(src, "s32", &ret);
+	KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val_s32);
+	KUNIT_EXPECT_EQ(test, n, 0);
+
+	stats_fs_source_put(src);
+}
+
+static void test_add_mixed(struct kunit *test)
+{
+	struct stats_fs_source *src;
+	int n;
+
+	src = stats_fs_source_create(0, "parent");
+
+	n = stats_fs_source_add_values(src, test_aggr, NULL, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_values_with_base(src, NULL);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = stats_fs_source_add_values(src, test_values, &cont, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(src, NULL);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_aggr));
+
+	n = stats_fs_source_add_values(src, test_values, &cont, 0);
+	KUNIT_EXPECT_EQ(test, n, -EEXIST);
+	n = get_number_values_with_base(src, &cont);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+	n = stats_fs_source_add_values(src, test_aggr, NULL, 0);
+	KUNIT_EXPECT_EQ(test, n, -EEXIST);
+	n = get_number_aggr_with_base(src, NULL);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_aggr));
+
+	KUNIT_EXPECT_EQ(test, get_number_values(src), ARR_SIZE(test_values));
+	KUNIT_EXPECT_EQ(test, get_number_aggregates(src), ARR_SIZE(test_aggr));
+	stats_fs_source_put(src);
+}
+
+static void test_search_mixed(struct kunit *test)
+{
+	struct stats_fs_source *src, *sub;
+	uint64_t ret;
+	int n;
+
+	src = stats_fs_source_create(0, "parent");
+	sub = stats_fs_source_create(0, "child");
+	stats_fs_source_add_subordinate(src, sub);
+
+	// src has the aggregates, sub the values. Just search
+	n = stats_fs_source_add_values(sub, test_values, &cont, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_values_with_base(sub, &cont);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+	n = stats_fs_source_add_values(src, test_aggr, &cont, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(src, &cont);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_aggr));
+
+	// u64 is sum so again same value
+	n = stats_fs_source_get_value_by_name(sub, "u64", &ret);
+	KUNIT_EXPECT_EQ(test, ret, def_u64);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = stats_fs_source_get_value_by_name(src, "u64", &ret);
+	KUNIT_EXPECT_EQ(test, ret, def_u64);
+	KUNIT_EXPECT_EQ(test, n, 0);
+
+	// s32 is min so return the value also in the aggregate
+	n = stats_fs_source_get_value_by_name(sub, "s32", &ret);
+	KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val_s32);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = stats_fs_source_get_value_by_name(src, "s32", &ret);
+	KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val_s32);
+	KUNIT_EXPECT_EQ(test, n, 0);
+
+	// bo is max
+	n = stats_fs_source_get_value_by_name(sub, "bo", &ret);
+	KUNIT_EXPECT_EQ(test, (bool)ret, def_val_bool);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = stats_fs_source_get_value_by_name(src, "bo", &ret);
+	KUNIT_EXPECT_EQ(test, (bool)ret, def_val_bool);
+	KUNIT_EXPECT_EQ(test, n, 0);
+
+	n = stats_fs_source_get_value_by_name(sub, "does not exist", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, -ENOENT);
+	n = stats_fs_source_get_value_by_name(src, "does not exist", &ret);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	KUNIT_EXPECT_EQ(test, n, -ENOENT);
+
+	stats_fs_source_put(sub);
+	stats_fs_source_put(src);
+}
+
+static void test_all_aggregations_agg_val_val(struct kunit *test)
+{
+	struct stats_fs_source *src, *sub1, *sub2;
+	uint64_t ret;
+	int n;
+
+	src = stats_fs_source_create(0, "parent");
+	sub1 = stats_fs_source_create(0, "child1");
+	sub2 = stats_fs_source_create(0, "child2");
+	stats_fs_source_add_subordinate(src, sub1);
+	stats_fs_source_add_subordinate(src, sub2);
+
+	n = stats_fs_source_add_values(sub1, test_all_aggr, &cont, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(sub1, &cont);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+	n = stats_fs_source_add_values(sub2, test_all_aggr, &cont2, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(sub2, &cont2);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+	n = stats_fs_source_add_values(src, test_all_aggr, NULL, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(src, NULL);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+	// sum
+	n = stats_fs_source_get_value_by_name(src, "u64", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ret, def_u64 * 2);
+
+	// min
+	n = stats_fs_source_get_value_by_name(src, "s32", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val_s32);
+
+	// count_0
+	n = stats_fs_source_get_value_by_name(src, "bo", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ret, 1ull);
+
+	// avg
+	n = stats_fs_source_get_value_by_name(src, "u8", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ret, 191ull);
+
+	// max
+	n = stats_fs_source_get_value_by_name(src, "s16", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, (int16_t)ret, def_val_s16);
+
+	stats_fs_source_put(sub1);
+	stats_fs_source_put(sub2);
+	stats_fs_source_put(src);
+}
+
+static void test_all_aggregations_val_agg_val(struct kunit *test)
+{
+	struct stats_fs_source *src, *sub1, *sub2;
+	uint64_t ret;
+	int n;
+
+	src = stats_fs_source_create(0, "parent");
+	sub1 = stats_fs_source_create(0, "child1");
+	sub2 = stats_fs_source_create(0, "child2");
+	stats_fs_source_add_subordinate(src, sub1);
+	stats_fs_source_add_subordinate(src, sub2);
+
+	n = stats_fs_source_add_values(src, test_all_aggr, &cont, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(src, &cont);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+	n = stats_fs_source_add_values(sub2, test_all_aggr, &cont2, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(sub2, &cont2);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+	n = stats_fs_source_add_values(sub1, test_all_aggr, NULL, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(sub1, NULL);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+	n = stats_fs_source_get_value_by_name(src, "u64", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ret, def_u64);
+	n = stats_fs_source_get_value_by_name(sub1, "u64", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	n = stats_fs_source_get_value_by_name(sub2, "u64", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ret, def_u64);
+
+	n = stats_fs_source_get_value_by_name(src, "s32", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val_s32);
+	n = stats_fs_source_get_value_by_name(sub1, "s32", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, (int64_t)ret, S64_MAX); // MIN
+	n = stats_fs_source_get_value_by_name(sub2, "s32", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val2_s32);
+
+	n = stats_fs_source_get_value_by_name(src, "bo", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, (bool)ret, def_val_bool);
+	n = stats_fs_source_get_value_by_name(sub1, "bo", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	n = stats_fs_source_get_value_by_name(sub2, "bo", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, (bool)ret, def_val2_bool);
+
+	n = stats_fs_source_get_value_by_name(src, "u8", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, (uint8_t)ret, def_val_u8);
+	n = stats_fs_source_get_value_by_name(sub1, "u8", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ret, 0ull);
+	n = stats_fs_source_get_value_by_name(sub2, "u8", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, (uint8_t)ret, def_val2_u8);
+
+	n = stats_fs_source_get_value_by_name(src, "s16", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, (int16_t)ret, def_val_s16);
+	n = stats_fs_source_get_value_by_name(sub1, "s16", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, (int64_t)ret, S64_MIN); // MAX
+	n = stats_fs_source_get_value_by_name(sub2, "s16", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, (int16_t)ret, def_val2_s16);
+
+	stats_fs_source_put(sub1);
+	stats_fs_source_put(sub2);
+	stats_fs_source_put(src);
+}
+
+static void test_all_aggregations_agg_val_val_sub(struct kunit *test)
+{
+	struct stats_fs_source *src, *sub1, *sub11;
+	uint64_t ret;
+	int n;
+
+	src = stats_fs_source_create(0, "parent");
+	sub1 = stats_fs_source_create(0, "child1");
+	sub11 = stats_fs_source_create(0, "child11");
+	stats_fs_source_add_subordinate(src, sub1);
+	stats_fs_source_add_subordinate(sub1, sub11); // changes here!
+
+	n = stats_fs_source_add_values(sub1, test_values, &cont, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_values_with_base(sub1, &cont);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+	n = stats_fs_source_add_values(sub11, test_values, &cont2, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_values_with_base(sub11, &cont2);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_values));
+
+	KUNIT_EXPECT_EQ(test, get_total_number_values(src),
+			ARR_SIZE(test_values) * 2);
+
+	n = stats_fs_source_add_values(sub1, test_all_aggr, &cont, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(sub1, &cont);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+	n = stats_fs_source_add_values(sub11, test_all_aggr, &cont2, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(sub11, &cont2);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+	n = stats_fs_source_add_values(src, test_all_aggr, NULL, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(src, NULL);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+	// sum
+	n = stats_fs_source_get_value_by_name(src, "u64", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ret, def_u64 * 2);
+
+	// min
+	n = stats_fs_source_get_value_by_name(src, "s32", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val_s32);
+
+	// count_0
+	n = stats_fs_source_get_value_by_name(src, "bo", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ret, 1ull);
+
+	// avg
+	n = stats_fs_source_get_value_by_name(src, "u8", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ret, 191ull);
+
+	// max
+	n = stats_fs_source_get_value_by_name(src, "s16", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, (int16_t)ret, def_val_s16);
+
+	stats_fs_source_put(sub1);
+	stats_fs_source_put(sub11);
+	stats_fs_source_put(src);
+}
+
+static void test_all_aggregations_agg_no_val_sub(struct kunit *test)
+{
+	struct stats_fs_source *src, *sub1, *sub11;
+	uint64_t ret;
+	int n;
+
+	src = stats_fs_source_create(0, "parent");
+	sub1 = stats_fs_source_create(0, "child1");
+	sub11 = stats_fs_source_create(0, "child11");
+	stats_fs_source_add_subordinate(src, sub1);
+	stats_fs_source_add_subordinate(sub1, sub11);
+
+	n = stats_fs_source_add_values(sub11, test_all_aggr, &cont2, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(sub11, &cont2);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+	KUNIT_EXPECT_EQ(test, get_total_number_values(src), 0);
+
+	n = stats_fs_source_add_values(src, test_all_aggr, NULL, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(src, NULL);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+	// sum
+	n = stats_fs_source_get_value_by_name(src, "u64", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ret, def_u64);
+
+	// min
+	n = stats_fs_source_get_value_by_name(src, "s32", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val2_s32);
+
+	// count_0
+	n = stats_fs_source_get_value_by_name(src, "bo", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ret, 1ull);
+
+	// avg
+	n = stats_fs_source_get_value_by_name(src, "u8", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, (uint8_t)ret, def_val2_u8);
+
+	// max
+	n = stats_fs_source_get_value_by_name(src, "s16", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, (int16_t)ret, def_val2_s16);
+
+	stats_fs_source_put(sub1);
+	stats_fs_source_put(sub11);
+	stats_fs_source_put(src);
+}
+
+static void test_all_aggregations_agg_agg_val_sub(struct kunit *test)
+{
+	struct stats_fs_source *src, *sub1, *sub11, *sub12;
+	uint64_t ret;
+	int n;
+
+	src = stats_fs_source_create(0, "parent");
+	sub1 = stats_fs_source_create(0, "child1");
+	sub11 = stats_fs_source_create(0, "child11");
+	sub12 = stats_fs_source_create(0, "child12");
+	stats_fs_source_add_subordinate(src, sub1);
+	stats_fs_source_add_subordinate(sub1, sub11);
+	stats_fs_source_add_subordinate(sub1, sub12);
+
+	n = stats_fs_source_add_values(sub11, test_all_aggr, &cont2, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(sub11, &cont2);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+	n = stats_fs_source_add_values(sub12, test_all_aggr, &cont, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(sub12, &cont);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+	KUNIT_EXPECT_EQ(test, get_total_number_values(src), 0);
+
+	n = stats_fs_source_add_values(src, test_all_aggr, NULL, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(src, NULL);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+	n = stats_fs_source_add_values(sub1, test_all_aggr, NULL, 0);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	n = get_number_aggr_with_base(sub1, NULL);
+	KUNIT_EXPECT_EQ(test, n, ARR_SIZE(test_all_aggr));
+
+	// sum
+	n = stats_fs_source_get_value_by_name(src, "u64", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ret, def_u64 * 2);
+
+	// min
+	n = stats_fs_source_get_value_by_name(src, "s32", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ((int32_t)ret), def_val_s32);
+
+	// count_0
+	n = stats_fs_source_get_value_by_name(src, "bo", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, ret, 1ull);
+
+	// avg
+	n = stats_fs_source_get_value_by_name(src, "u8", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, (uint8_t)ret,
+			(uint8_t)((def_val2_u8 + def_val_u8) / 2));
+
+	// max
+	n = stats_fs_source_get_value_by_name(src, "s16", &ret);
+	KUNIT_EXPECT_EQ(test, n, 0);
+	KUNIT_EXPECT_EQ(test, (int16_t)ret, def_val_s16);
+
+	stats_fs_source_put(sub1);
+	stats_fs_source_put(sub11);
+	stats_fs_source_put(sub12);
+	stats_fs_source_put(src);
+}
+
+static struct kunit_case stats_fs_test_cases[] = {
+	KUNIT_CASE(test_empty_folder),
+	KUNIT_CASE(test_add_subfolder),
+	KUNIT_CASE(test_add_value),
+	KUNIT_CASE(test_add_value_in_subfolder),
+	KUNIT_CASE(test_search_value),
+	KUNIT_CASE(test_search_value_in_subfolder),
+	KUNIT_CASE(test_search_value_in_empty_folder),
+	KUNIT_CASE(test_add_aggregate),
+	KUNIT_CASE(test_add_aggregate_in_subfolder),
+	KUNIT_CASE(test_search_aggregate),
+	KUNIT_CASE(test_search_aggregate_in_subfolder),
+	KUNIT_CASE(test_search_same),
+	KUNIT_CASE(test_add_mixed),
+	KUNIT_CASE(test_search_mixed),
+	KUNIT_CASE(test_all_aggregations_agg_val_val),
+	KUNIT_CASE(test_all_aggregations_val_agg_val),
+	KUNIT_CASE(test_all_aggregations_agg_val_val_sub),
+	KUNIT_CASE(test_all_aggregations_agg_no_val_sub),
+	KUNIT_CASE(test_all_aggregations_agg_agg_val_sub),
+	{}
+};
+
+static struct kunit_suite stats_fs_test_suite = {
+	.name = "stats_fs",
+	.test_cases = stats_fs_test_cases,
+};
+
+kunit_test_suite(stats_fs_test_suite);
-- 
2.25.4

