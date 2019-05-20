Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE3222C1A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 08:31:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456pv34VrJzDqMb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 16:31:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="fNglIgpi"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456pnM312KzDqHf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 16:26:15 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id h17so6278104pgv.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 May 2019 23:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IND4DK6AF0QoInnEshwwD31YYGtI6KssiTiFqKpPG6c=;
 b=fNglIgpiOgPE6CtRvPvj6egq0Z23CkGoEJcqSdB2FuTRzeVH88UbaZz79aSN+p6wlP
 3oJVHrXASf/8cF/VPuPoL7va+RCUN3UBFcIITaF8yKS+IGrELMCnzlOZ+r9jslYanEa+
 SdaliBFoiBwZHTND0mqsPqZtudtfe2yBGrvug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IND4DK6AF0QoInnEshwwD31YYGtI6KssiTiFqKpPG6c=;
 b=NRSf/gATYjwvYRH3yeuDZthlDKnp7X3hIedD4iX5EvYlmMKRSWA9cYkV1PEp/c4hwu
 8VTZIO3RMFGUcHqWIdQ5EufYHd3jy5qkHVaDZ4JCJLIE/bgD6OpXhmlhf6lyTcyNBgG0
 XqLwtZEWuzIFXQIezfnpa4zJkbfBKNTisvmynSOhBXZVVZzUojTe5BCoxh2wPn/bqjDz
 QVJUBdOC8oefeGsCEwfhQHrhPUaA1AL3bkwO7PiIhqHTnCrqL+JesuzLbxBZFrtNmEw+
 IIcTYzN7z7ClUM5LEQb1Hik5IYWkIG3e9i5Hku3NJSVUzPK9iRpuQyLZtvar/u4lvU2n
 uMcA==
X-Gm-Message-State: APjAAAXEYOzDgAxNuzGLW0KhYC1MHul1RPCwk0kia5kKYGZ+BeR0PeUR
 ltozjBMIUvMJLb1Fn3Ad/pmauw==
X-Google-Smtp-Source: APXvYqyTuvFEhGITlx8k8bVjL+5JQNQUTdvjthf3PLDpp0AggEyEOY+WWhTDGxdqD1D0BOzGa7t2BA==
X-Received: by 2002:a63:d949:: with SMTP id e9mr73195712pgj.437.1558333573604; 
 Sun, 19 May 2019 23:26:13 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id r11sm19350574pgb.31.2019.05.19.23.26.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 19 May 2019 23:26:13 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: nayna@linux.ibm.com, cclaudio@linux.ibm.com, linux-fsdevel@vger.kernel.org,
 greg@kroah.com, linuxppc-dev@lists.ozlabs.org
Subject: [WIP RFC PATCH 3/6] fwvarfs: efi backend
Date: Mon, 20 May 2019 16:25:50 +1000
Message-Id: <20190520062553.14947-4-dja@axtens.net>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190520062553.14947-1-dja@axtens.net>
References: <20190520062553.14947-1-dja@axtens.net>
MIME-Version: 1.0
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a read-only EFI backend. This does not rely on efivarfs at all
(although it does borrow heavily from the code).

It only supports reading the variables, but it supports the same
format as efivarfs so tools like efivar continue to work if you
mount this filesystem in the same place.

Two small quirks:
 - efivarfs (at least as configured on Ubuntu) allows users to
   access the files, here only root can.
 - efivarfs makes GUID comparison case-insensitive, this does not.

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 Documentation/filesystems/fwvarfs.txt |   5 +
 fs/fwvarfs/Kconfig                    |  11 ++
 fs/fwvarfs/Makefile                   |   1 +
 fs/fwvarfs/efi.c                      | 177 ++++++++++++++++++++++++++
 fs/fwvarfs/fwvarfs.c                  |   4 +-
 fs/fwvarfs/fwvarfs.h                  |   4 +
 6 files changed, 201 insertions(+), 1 deletion(-)
 create mode 100644 fs/fwvarfs/efi.c

diff --git a/Documentation/filesystems/fwvarfs.txt b/Documentation/filesystems/fwvarfs.txt
index bf1bccba6ab9..7c1e921e5c50 100644
--- a/Documentation/filesystems/fwvarfs.txt
+++ b/Documentation/filesystems/fwvarfs.txt
@@ -32,6 +32,10 @@ Supported backends
    operations. Files created persist across mount/unmount but as no
    hardware is involved they do not persist across reboots.
 
+ * efi - a partial reimplementation of efivarfs against the fwvarfs
+   backend. Read-only with no creation or deletion, but sufficient that
+   efivar --print --name <whatever> works the same as efivarfs.
+
 Usage
 -----
 
@@ -40,6 +44,7 @@ mount -t fwvarfs <backend> <dir>
 For example:
 
 mount -t fwvarfs mem /fw/mem/
+mount -t fwvarfs efi /sys/firmware/efi/efivars
 
 API
 ---
diff --git a/fs/fwvarfs/Kconfig b/fs/fwvarfs/Kconfig
index 62a47cddd4b5..e4474da11dbc 100644
--- a/fs/fwvarfs/Kconfig
+++ b/fs/fwvarfs/Kconfig
@@ -23,3 +23,14 @@ config FWVAR_FS_MEM_BACKEND
 	  demonstration of fwvarfs.
 
 	  You can safely say N here unless you're exploring fwvarfs.
+
+config FWVAR_FS_EFI_BACKEND
+	bool "EFI backend"
+	depends on FWVAR_FS
+	help
+	  Include a read-only EFI backend, largely cribbed from
+	  efivarfs. This is handy for demonstrating that the same
+	  userspace tools can read from EFI variables over fwvarfs
+	  in the same way the do with efivarfs.
+
+	  Say N here unless you're exploring fwvarfs.
diff --git a/fs/fwvarfs/Makefile b/fs/fwvarfs/Makefile
index f1585baccabe..2ab9dfd650ca 100644
--- a/fs/fwvarfs/Makefile
+++ b/fs/fwvarfs/Makefile
@@ -6,3 +6,4 @@
 obj-$(CONFIG_FWVAR_FS)		+= fwvarfs.o
 
 obj-$(CONFIG_FWVAR_FS_MEM_BACKEND)		+= mem.o
+obj-$(CONFIG_FWVAR_FS_EFI_BACKEND)		+= efi.o
diff --git a/fs/fwvarfs/efi.c b/fs/fwvarfs/efi.c
new file mode 100644
index 000000000000..7aa5c186d0c9
--- /dev/null
+++ b/fs/fwvarfs/efi.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 IBM Corporation
+ * Author: Daniel Axtens
+ *
+ * Based on efivarfs:
+ * Copyright (C) 2012 Red Hat, Inc.
+ * Copyright (C) 2012 Jeremy Kerr <jeremy.kerr@canonical.com>
+ *
+ * We cheat by not allowing for case-insensitivity.
+ */
+
+#include <linux/fs.h>
+#include <linux/list.h>
+#include <linux/slab.h>
+#include "fwvarfs.h"
+
+#include <linux/efi.h>
+#include <linux/uuid.h>
+#include <linux/ucs2_string.h>
+
+static LIST_HEAD(efivar_list);
+static LIST_HEAD(efivar_file_list);
+
+struct fwvarfs_efi_file {
+	bool is_removable;
+	struct list_head list;
+	struct efivar_entry *entry;
+};
+
+// need a forward decl to pass down to register
+struct fwvarfs_backend fwvarfs_efi_backend;
+
+
+static ssize_t fwvarfs_efi_read(void *variable, char *buf,
+		size_t count, loff_t off)
+{
+	struct fwvarfs_efi_file *file_data = variable;
+	struct efivar_entry *var = file_data->entry;
+	unsigned long datasize = 0;
+	u32 attributes;
+	void *data;
+	ssize_t size = 0;
+	loff_t ppos = off;
+	int err;
+
+	err = efivar_entry_size(var, &datasize);
+
+	/*
+	 * efivarfs represents uncommitted variables with
+	 * zero-length files. Reading them should return EOF.
+	 */
+	if (err == -ENOENT)
+		return 0;
+	else if (err)
+		return err;
+
+	data = kmalloc(datasize + sizeof(attributes), GFP_KERNEL);
+
+	if (!data)
+		return -ENOMEM;
+
+	size = efivar_entry_get(var, &attributes, &datasize,
+				data + sizeof(attributes));
+	if (size)
+		goto out_free;
+
+	memcpy(data, &attributes, sizeof(attributes));
+	size = memory_read_from_buffer(buf, count, &ppos,
+				       data, datasize + sizeof(attributes));
+out_free:
+	kfree(data);
+
+	return size;
+}
+
+static int fwvarfs_efi_callback(efi_char16_t *name16, efi_guid_t vendor,
+				unsigned long name_size, void *data)
+{
+	struct efivar_entry *entry;
+	struct fwvarfs_efi_file *file_data;
+	unsigned long size = 0;
+	char *name;
+	int len;
+	int err = -ENOMEM;
+
+	file_data = kzalloc(sizeof(*file_data), GFP_KERNEL);
+	if (!file_data)
+		return err;
+
+	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
+	if (!entry)
+		goto fail;
+
+	memcpy(entry->var.VariableName, name16, name_size);
+	memcpy(&(entry->var.VendorGuid), &vendor, sizeof(efi_guid_t));
+
+	len = ucs2_utf8size(entry->var.VariableName);
+
+	/* name, plus '-', plus GUID, plus NUL */
+	name = kmalloc(len + 1 + EFI_VARIABLE_GUID_LEN + 1, GFP_KERNEL);
+	if (!name)
+		goto fail_entry;
+
+	ucs2_as_utf8(name, entry->var.VariableName, len);
+
+	if (efivar_variable_is_removable(entry->var.VendorGuid, name, len))
+		file_data->is_removable = true;
+
+	name[len] = '-';
+
+	efi_guid_to_str(&entry->var.VendorGuid, name + len + 1);
+
+	name[len + EFI_VARIABLE_GUID_LEN+1] = '\0';
+
+	efivar_entry_size(entry, &size);
+	err = efivar_entry_add(entry, &efivar_list);
+	if (err)
+		goto fail_name;
+
+	err = fwvarfs_register_var(&fwvarfs_efi_backend, name, file_data, size);
+	if (err)
+		goto fail_name;
+
+	INIT_LIST_HEAD(&file_data->list);
+	list_add(&efivar_file_list, &file_data->list);
+	file_data->entry = entry;
+
+	/* copied by the above, I think */
+	kfree(name);
+
+	return 0;
+fail_name:
+	kfree(name);
+fail_entry:
+	kfree(entry);
+fail:
+	kfree(file_data);
+	return err;
+}
+
+
+static void fwvarfs_efi_destroy(void *var)
+{
+	struct fwvarfs_efi_file *file_data = var;
+	struct efivar_entry *entry = file_data->entry;
+
+	// ignore error, eek.
+	efivar_entry_remove(entry);
+	kfree(entry);
+
+	list_del(&file_data->list);
+	kfree(file_data);
+}
+
+
+static int fwvarfs_efi_enumerate(void)
+{
+	int err;
+	struct fwvarfs_efi_file *pos, *tmp;
+
+	err = efivar_init(fwvarfs_efi_callback, NULL, true, &efivar_list);
+	if (err) {
+		list_for_each_entry_safe(pos, tmp, &efivar_file_list, list) {
+			fwvarfs_efi_destroy(pos);
+		}
+	}
+
+	return err;
+}
+
+struct fwvarfs_backend fwvarfs_efi_backend = {
+	.name = "efi",
+	.destroy = fwvarfs_efi_destroy,
+	.enumerate = fwvarfs_efi_enumerate,
+	.read = fwvarfs_efi_read,
+};
diff --git a/fs/fwvarfs/fwvarfs.c b/fs/fwvarfs/fwvarfs.c
index 99b7f2fd0f14..643ec6585b4d 100644
--- a/fs/fwvarfs/fwvarfs.c
+++ b/fs/fwvarfs/fwvarfs.c
@@ -22,7 +22,9 @@ static struct fwvarfs_backend *fwvarfs_backends[] = {
 #if CONFIG_FWVAR_FS_MEM_BACKEND
 	&fwvarfs_mem_backend,
 #endif
-
+#ifdef CONFIG_FWVAR_FS_EFI_BACKEND
+	&fwvarfs_efi_backend,
+#endif
 	NULL,
 };
 
diff --git a/fs/fwvarfs/fwvarfs.h b/fs/fwvarfs/fwvarfs.h
index b2944a3baaf7..49bde268401f 100644
--- a/fs/fwvarfs/fwvarfs.h
+++ b/fs/fwvarfs/fwvarfs.h
@@ -113,4 +113,8 @@ int fwvarfs_register_var(struct fwvarfs_backend *backend, const char *name,
 extern struct fwvarfs_backend fwvarfs_mem_backend;
 #endif
 
+#if defined(CONFIG_FWVAR_FS_EFI_BACKEND)
+extern struct fwvarfs_backend fwvarfs_efi_backend;
+#endif
+
 #endif /* FWVARFS_H */
-- 
2.19.1

