Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E66D1C37C8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 13:13:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G0bR4vQpzDqWR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 21:13:39 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=AnK2oY26; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=AnK2oY26; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G0NP6sYlzDqSy
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 21:04:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588590243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G+6wo9zErlQ8NQvwNlYmFOte7zpY2tp7+/wgFK/FOHE=;
 b=AnK2oY26vnxhLUtZz95Ft2OKpHLQ1tUOQFZ7sjMC4h/CsoqfABPuJ0z2zQPdkpQDA4oCFi
 tpdBni/Z81oh3K+nZGWNT1/gE5uM54yHWDM3Ea56EgzNhBLQbIBnGZvs0GZeG4w3ipxOGN
 IkFpmRg3t6jwxuHfcHtoS2dT/M0Ppss=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588590243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G+6wo9zErlQ8NQvwNlYmFOte7zpY2tp7+/wgFK/FOHE=;
 b=AnK2oY26vnxhLUtZz95Ft2OKpHLQ1tUOQFZ7sjMC4h/CsoqfABPuJ0z2zQPdkpQDA4oCFi
 tpdBni/Z81oh3K+nZGWNT1/gE5uM54yHWDM3Ea56EgzNhBLQbIBnGZvs0GZeG4w3ipxOGN
 IkFpmRg3t6jwxuHfcHtoS2dT/M0Ppss=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-ZEogKAg0OgOCbCR1dNGiIg-1; Mon, 04 May 2020 07:04:01 -0400
X-MC-Unique: ZEogKAg0OgOCbCR1dNGiIg-1
Received: by mail-wm1-f69.google.com with SMTP id f17so3296630wmm.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 May 2020 04:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1VkfN+lWbvFtfkCLXoWvPciyWXkGdcSzlEXtJA502Gk=;
 b=PywvXT02P+pfplOfdUYquunHyIcqpGPfC3Fw5OuPFmzLHVxBAT79SnZsAKpxs4JVYE
 q8k7gE1sye4JmryvKNme/yU8hmzpVyOYoqValKkmK4KNc4oMJ1czc78vGekJKAt7ci1I
 rfomb6ThENVqsTp0PU3l0eaY8HmpINY7+REieF06BPBZDzsEteAV4zU1mzcfZJnQfxgX
 2I7lhdd96PffvqeHYsAPr2WEyS5/NmHOo6yxvFADnNs6Z0zHowuFnWbYtUBkIjEPt/ci
 jomf03xwbOpk+kHlvOGQ0AETeY/d8YcUB6Nchmg82XObP0BbRgIeFg3O9ieFUzDJ/j7a
 b7Sw==
X-Gm-Message-State: AGi0PuZtxIASyFjo3DXDFjvETMwk73bwZ3vC6G12JKy9MtAEUaQryAHW
 BepM6CZ8bKPynIt0dtkYha7SpEk8GmfpfnHElk7kNwABBrRl0MEQliV3yD3558yVXqB4z/zGLC2
 BA6Vrwa+Du9vRmiBQflmdjITo3A==
X-Received: by 2002:adf:d4d0:: with SMTP id w16mr18692752wrk.264.1588590238153; 
 Mon, 04 May 2020 04:03:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypJMYICkAN9cpMz9cRRnOmDV9/d+/9UnH/NwQK5n40Rp0IwiF44IBJDbWOx2hddQWmKHbvqNNQ==
X-Received: by 2002:adf:d4d0:: with SMTP id w16mr18692707wrk.264.1588590237693; 
 Mon, 04 May 2020 04:03:57 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.213])
 by smtp.gmail.com with ESMTPSA id a13sm10885750wrv.67.2020.05.04.04.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 04:03:57 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH v2 4/5] stats_fs fs: virtual fs to show stats to the end-user
Date: Mon,  4 May 2020 13:03:43 +0200
Message-Id: <20200504110344.17560-5-eesposit@redhat.com>
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

Add virtual fs that maps stats_fs sources with directories, and values
(simple or aggregates) to files.

Every time a file is read/cleared, the fs internally invokes the stats_fs
API to get/set the requested value.

fs/stats_fs/inode.c is pretty much similar to what is done in
fs/debugfs/inode.c, with the exception that the API is only
composed by stats_fs_create_file, stats_fs_create_dir and stats_fs_remove.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 fs/stats_fs/Makefile       |   2 +-
 fs/stats_fs/inode.c        | 337 +++++++++++++++++++++++++++++++++++++
 fs/stats_fs/internal.h     |  15 ++
 fs/stats_fs/stats_fs.c     | 163 ++++++++++++++++++
 include/linux/stats_fs.h   |  15 ++
 include/uapi/linux/magic.h |   1 +
 tools/lib/api/fs/fs.c      |  21 +++
 7 files changed, 553 insertions(+), 1 deletion(-)
 create mode 100644 fs/stats_fs/inode.c

diff --git a/fs/stats_fs/Makefile b/fs/stats_fs/Makefile
index 9db130fac6b6..ac12c27545f6 100644
--- a/fs/stats_fs/Makefile
+++ b/fs/stats_fs/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-stats_fs-objs=09:=3D stats_fs.o
+stats_fs-objs=09:=3D inode.o stats_fs.o
 stats_fs-tests-objs=09:=3D stats_fs-tests.o
=20
 obj-$(CONFIG_STATS_FS)=09+=3D stats_fs.o
diff --git a/fs/stats_fs/inode.c b/fs/stats_fs/inode.c
new file mode 100644
index 000000000000..865ee91656ba
--- /dev/null
+++ b/fs/stats_fs/inode.c
@@ -0,0 +1,337 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  inode.c - part of stats_fs, a tiny little stats_fs file system
+ *
+ *  Copyright (C) 2020 Emanuele Giuseppe Esposito <eesposit@redhat.com>
+ *  Copyright (C) 2020 Redhat
+ */
+#define pr_fmt(fmt)=09"stats_fs: " fmt
+
+#include <linux/module.h>
+#include <linux/fs.h>
+#include <linux/mount.h>
+#include <linux/init.h>
+#include <linux/stats_fs.h>
+#include <linux/string.h>
+#include <linux/seq_file.h>
+#include <linux/parser.h>
+#include <linux/magic.h>
+#include <linux/slab.h>
+
+#include "internal.h"
+
+#define STATS_FS_DEFAULT_MODE=090700
+
+static struct simple_fs stats_fs;
+static bool stats_fs_registered;
+
+struct stats_fs_mount_opts {
+=09kuid_t uid;
+=09kgid_t gid;
+=09umode_t mode;
+};
+
+enum {
+=09Opt_uid,
+=09Opt_gid,
+=09Opt_mode,
+=09Opt_err
+};
+
+static const match_table_t tokens =3D {
+=09{Opt_uid, "uid=3D%u"},
+=09{Opt_gid, "gid=3D%u"},
+=09{Opt_mode, "mode=3D%o"},
+=09{Opt_err, NULL}
+};
+
+struct stats_fs_fs_info {
+=09struct stats_fs_mount_opts mount_opts;
+};
+
+static int stats_fs_parse_options(char *data, struct stats_fs_mount_opts *=
opts)
+{
+=09substring_t args[MAX_OPT_ARGS];
+=09int option;
+=09int token;
+=09kuid_t uid;
+=09kgid_t gid;
+=09char *p;
+
+=09opts->mode =3D STATS_FS_DEFAULT_MODE;
+
+=09while ((p =3D strsep(&data, ",")) !=3D NULL) {
+=09=09if (!*p)
+=09=09=09continue;
+
+=09=09token =3D match_token(p, tokens, args);
+=09=09switch (token) {
+=09=09case Opt_uid:
+=09=09=09if (match_int(&args[0], &option))
+=09=09=09=09return -EINVAL;
+=09=09=09uid =3D make_kuid(current_user_ns(), option);
+=09=09=09if (!uid_valid(uid))
+=09=09=09=09return -EINVAL;
+=09=09=09opts->uid =3D uid;
+=09=09=09break;
+=09=09case Opt_gid:
+=09=09=09if (match_int(&args[0], &option))
+=09=09=09=09return -EINVAL;
+=09=09=09gid =3D make_kgid(current_user_ns(), option);
+=09=09=09if (!gid_valid(gid))
+=09=09=09=09return -EINVAL;
+=09=09=09opts->gid =3D gid;
+=09=09=09break;
+=09=09case Opt_mode:
+=09=09=09if (match_octal(&args[0], &option))
+=09=09=09=09return -EINVAL;
+=09=09=09opts->mode =3D option & S_IALLUGO;
+=09=09=09break;
+=09=09/*
+=09=09 * We might like to report bad mount options here;
+=09=09 * but traditionally stats_fs has ignored all mount options
+=09=09 */
+=09=09}
+=09}
+
+=09return 0;
+}
+
+static int stats_fs_apply_options(struct super_block *sb)
+{
+=09struct stats_fs_fs_info *fsi =3D sb->s_fs_info;
+=09struct inode *inode =3D d_inode(sb->s_root);
+=09struct stats_fs_mount_opts *opts =3D &fsi->mount_opts;
+
+=09inode->i_mode &=3D ~S_IALLUGO;
+=09inode->i_mode |=3D opts->mode;
+
+=09inode->i_uid =3D opts->uid;
+=09inode->i_gid =3D opts->gid;
+
+=09return 0;
+}
+
+static int stats_fs_remount(struct super_block *sb, int *flags, char *data=
)
+{
+=09int err;
+=09struct stats_fs_fs_info *fsi =3D sb->s_fs_info;
+
+=09sync_filesystem(sb);
+=09err =3D stats_fs_parse_options(data, &fsi->mount_opts);
+=09if (err)
+=09=09goto fail;
+
+=09stats_fs_apply_options(sb);
+
+fail:
+=09return err;
+}
+
+static int stats_fs_show_options(struct seq_file *m, struct dentry *root)
+{
+=09struct stats_fs_fs_info *fsi =3D root->d_sb->s_fs_info;
+=09struct stats_fs_mount_opts *opts =3D &fsi->mount_opts;
+
+=09if (!uid_eq(opts->uid, GLOBAL_ROOT_UID))
+=09=09seq_printf(m, ",uid=3D%u",
+=09=09=09   from_kuid_munged(&init_user_ns, opts->uid));
+=09if (!gid_eq(opts->gid, GLOBAL_ROOT_GID))
+=09=09seq_printf(m, ",gid=3D%u",
+=09=09=09   from_kgid_munged(&init_user_ns, opts->gid));
+=09if (opts->mode !=3D STATS_FS_DEFAULT_MODE)
+=09=09seq_printf(m, ",mode=3D%o", opts->mode);
+
+=09return 0;
+}
+
+
+static void stats_fs_free_inode(struct inode *inode)
+{
+=09kfree(inode->i_private);
+=09free_inode_nonrcu(inode);
+}
+
+static const struct super_operations stats_fs_super_operations =3D {
+=09.statfs=09=09=3D simple_statfs,
+=09.remount_fs=09=3D stats_fs_remount,
+=09.show_options=09=3D stats_fs_show_options,
+=09.free_inode=09=3D stats_fs_free_inode,
+};
+
+static int stats_fs_fill_super(struct super_block *sb, void *data, int sil=
ent)
+{
+=09static const struct tree_descr stats_fs_files[] =3D {{""}};
+=09struct stats_fs_fs_info *fsi;
+=09int err;
+
+=09fsi =3D kzalloc(sizeof(struct stats_fs_fs_info), GFP_KERNEL);
+=09sb->s_fs_info =3D fsi;
+=09if (!fsi) {
+=09=09err =3D -ENOMEM;
+=09=09goto fail;
+=09}
+
+=09err =3D stats_fs_parse_options(data, &fsi->mount_opts);
+=09if (err)
+=09=09goto fail;
+
+=09err  =3D  simple_fill_super(sb, STATSFS_MAGIC, stats_fs_files);
+=09if (err)
+=09=09goto fail;
+
+=09sb->s_op =3D &stats_fs_super_operations;
+
+=09stats_fs_apply_options(sb);
+
+=09return 0;
+
+fail:
+=09kfree(fsi);
+=09sb->s_fs_info =3D NULL;
+=09return err;
+}
+
+static struct dentry *stats_fs_mount(struct file_system_type *fs_type,
+=09=09=09int flags, const char *dev_name,
+=09=09=09void *data)
+{
+=09return mount_single(fs_type, flags, data, stats_fs_fill_super);
+}
+
+static struct file_system_type stats_fs_fs_type =3D {
+=09.owner =3D=09THIS_MODULE,
+=09.name =3D=09=09"statsfs",
+=09.mount =3D=09stats_fs_mount,
+=09.kill_sb =3D=09kill_litter_super,
+};
+MODULE_ALIAS_FS("statsfs");
+
+
+/**
+ * stats_fs_create_file - create a file in the stats_fs filesystem
+ * @val: a pointer to a stats_fs_value containing all the infos of
+ * the file to create (name, permission)
+ * @src: a pointer to a stats_fs_source containing the dentry of where
+ * to add this file
+ *
+ * This function will return a pointer to a dentry if it succeeds.  This
+ * pointer must be passed to the stats_fs_remove() function when the file =
is
+ * to be removed (no automatic cleanup happens if your module is unloaded,
+ * you are responsible here.)  If an error occurs, ERR_PTR(-ERROR) will be
+ * returned.
+ *
+ * Val and src will be also inglobated in a ststsfs_data_inode struct
+ * that will be internally stored as inode->i_private and used in the
+ * get/set attribute functions (see stats_fs_ops in stats_fs.c).
+ */
+struct dentry *stats_fs_create_file(struct stats_fs_value *val, struct sta=
ts_fs_source *src)
+{
+=09struct dentry *dentry;
+=09struct inode *inode;
+=09struct stats_fs_data_inode *val_inode;
+
+=09val_inode =3D kzalloc(sizeof(struct stats_fs_data_inode), GFP_KERNEL);
+=09if (!val_inode) {
+=09=09printk(KERN_ERR
+=09=09=09"Kzalloc failure in stats_fs_create_files (ENOMEM)\n");
+=09=09return ERR_PTR(-ENOMEM);
+=09}
+
+=09val_inode->src =3D src;
+=09val_inode->val =3D val;
+
+
+=09dentry =3D simplefs_create_file(&stats_fs, &stats_fs_fs_type,
+=09=09=09=09      val->name, stats_fs_val_get_mode(val),
+=09=09=09=09=09  src->source_dentry, val_inode, &inode);
+=09if (IS_ERR(dentry))
+=09=09return dentry;
+
+=09inode->i_fop =3D &stats_fs_ops;
+
+=09return simplefs_finish_dentry(dentry, inode);
+}
+/**
+ * stats_fs_create_dir - create a directory in the stats_fs filesystem
+ * @name: a pointer to a string containing the name of the directory to
+ *        create.
+ * @parent: a pointer to the parent dentry for this file.  This should be =
a
+ *          directory dentry if set.  If this parameter is NULL, then the
+ *          directory will be created in the root of the stats_fs filesyst=
em.
+ *
+ * This function creates a directory in stats_fs with the given name.
+ *
+ * This function will return a pointer to a dentry if it succeeds.  This
+ * pointer must be passed to the stats_fs_remove() function when the file =
is
+ * to be removed (no automatic cleanup happens if your module is unloaded,
+ * you are responsible here.)  If an error occurs, ERR_PTR(-ERROR) will be
+ * returned.
+ */
+struct dentry *stats_fs_create_dir(const char *name, struct dentry *parent=
)
+{
+=09struct dentry *dentry;
+=09struct inode *inode;
+
+=09dentry =3D simplefs_create_dir(&stats_fs, &stats_fs_fs_type,
+=09=09=09=09     name, 0755, parent, &inode);
+=09if (IS_ERR(dentry))
+=09=09return dentry;
+
+=09inode->i_op =3D &simple_dir_inode_operations;
+=09return simplefs_finish_dentry(dentry, inode);
+}
+
+static void remove_one(struct dentry *victim)
+{
+=09simple_release_fs(&stats_fs);
+}
+
+/**
+ * stats_fs_remove - recursively removes a directory
+ * @dentry: a pointer to a the dentry of the directory to be removed.  If =
this
+ *          parameter is NULL or an error value, nothing will be done.
+ *
+ * This function recursively removes a directory tree in stats_fs that
+ * was previously created with a call to another stats_fs function
+ * (like stats_fs_create_file() or variants thereof.)
+ *
+ * This function is required to be called in order for the file to be
+ * removed, no automatic cleanup of files will happen when a module is
+ * removed, you are responsible here.
+ */
+void stats_fs_remove(struct dentry *dentry)
+{
+=09if (IS_ERR_OR_NULL(dentry))
+=09=09return;
+
+=09simple_pin_fs(&stats_fs, &stats_fs_fs_type);
+=09simple_recursive_removal(dentry, remove_one);
+=09simple_release_fs(&stats_fs);
+}
+/**
+ * stats_fs_initialized - Tells whether stats_fs has been registered
+ */
+bool stats_fs_initialized(void)
+{
+=09return stats_fs_registered;
+}
+EXPORT_SYMBOL_GPL(stats_fs_initialized);
+
+static int __init stats_fs_init(void)
+{
+=09int retval;
+
+=09retval =3D sysfs_create_mount_point(kernel_kobj, "statsfs");
+=09if (retval)
+=09=09return retval;
+
+=09retval =3D register_filesystem(&stats_fs_fs_type);
+=09if (retval)
+=09=09sysfs_remove_mount_point(kernel_kobj, "statsfs");
+=09else
+=09=09stats_fs_registered =3D true;
+
+=09return retval;
+}
+core_initcall(stats_fs_init);
diff --git a/fs/stats_fs/internal.h b/fs/stats_fs/internal.h
index ddf262a60736..1f7bb1da6c3c 100644
--- a/fs/stats_fs/internal.h
+++ b/fs/stats_fs/internal.h
@@ -15,6 +15,21 @@ struct stats_fs_value_source {
 =09struct list_head list_element;
 };
=20
+struct stats_fs_data_inode {
+=09struct stats_fs_source *src;
+=09struct stats_fs_value *val;
+};
+
+extern const struct file_operations stats_fs_ops;
+
+struct dentry *stats_fs_create_file(struct stats_fs_value *val,
+=09=09=09=09   struct stats_fs_source *src);
+
+struct dentry *stats_fs_create_dir(const char *name, struct dentry *parent=
);
+
+void stats_fs_remove(struct dentry *dentry);
+#define stats_fs_remove_recursive stats_fs_remove
+
 int stats_fs_val_get_mode(struct stats_fs_value *val);
=20
 #endif /* _STATS_FS_INTERNAL_H_ */
diff --git a/fs/stats_fs/stats_fs.c b/fs/stats_fs/stats_fs.c
index b63de12769e2..4ac6fe1ec62e 100644
--- a/fs/stats_fs/stats_fs.c
+++ b/fs/stats_fs/stats_fs.c
@@ -17,16 +17,114 @@ struct stats_fs_aggregate_value {
 =09uint32_t count, count_zero;
 };
=20
+static void stats_fs_source_remove_files(struct stats_fs_source *src);
+
 static int is_val_signed(struct stats_fs_value *val)
 {
 =09return val->type & STATS_FS_SIGN;
 }
=20
+static int stats_fs_attr_get(void *data, u64 *val)
+{
+=09int r =3D -EFAULT;
+=09struct stats_fs_data_inode *val_inode =3D
+=09=09(struct stats_fs_data_inode *)data;
+
+=09r =3D stats_fs_source_get_value(val_inode->src, val_inode->val, val);
+=09return r;
+}
+
+static int stats_fs_attr_clear(void *data, u64 val)
+{
+=09int r =3D -EFAULT;
+=09struct stats_fs_data_inode *val_inode =3D
+=09=09(struct stats_fs_data_inode *)data;
+
+=09if (val)
+=09=09return -EINVAL;
+
+=09r =3D stats_fs_source_clear(val_inode->src, val_inode->val);
+=09return r;
+}
+
 int stats_fs_val_get_mode(struct stats_fs_value *val)
 {
 =09return val->mode ? val->mode : 0644;
 }
=20
+static int stats_fs_attr_data_open(struct inode *inode, struct file *file)
+{
+=09struct stats_fs_data_inode *val_inode;
+=09char *fmt;
+
+=09val_inode =3D (struct stats_fs_data_inode *)inode->i_private;
+
+=09/* Inodes hold a  pointer to the source which is not included in the
+=09 * refcount, so they files be opened while destroy is running, but
+=09 * values are removed (base_addr =3D NULL) before the source is destroy=
ed.
+=09 */
+=09if (!kref_get_unless_zero(&val_inode->src->refcount))
+=09=09return -ENOENT;
+
+=09if (is_val_signed(val_inode->val))
+=09=09fmt =3D "%lld\n";
+=09else
+=09=09fmt =3D "%llu\n";
+
+=09if (simple_attr_open(inode, file, stats_fs_attr_get,
+=09=09=09     stats_fs_val_get_mode(val_inode->val) & 0222 ?
+=09=09=09=09     stats_fs_attr_clear :
+=09=09=09=09     NULL,
+=09=09=09     fmt)) {
+=09=09stats_fs_source_put(val_inode->src);
+=09=09return -ENOMEM;
+=09}
+=09return 0;
+}
+
+static int stats_fs_attr_release(struct inode *inode, struct file *file)
+{
+=09struct stats_fs_data_inode *val_inode;
+
+=09val_inode =3D (struct stats_fs_data_inode *)inode->i_private;
+
+=09simple_attr_release(inode, file);
+=09stats_fs_source_put(val_inode->src);
+
+=09return 0;
+}
+
+const struct file_operations stats_fs_ops =3D {
+=09.owner =3D THIS_MODULE,
+=09.open =3D stats_fs_attr_data_open,
+=09.release =3D stats_fs_attr_release,
+=09.read =3D simple_attr_read,
+=09.write =3D simple_attr_write,
+=09.llseek =3D no_llseek,
+};
+
+/* Called with rwsem held for writing */
+static void stats_fs_source_remove_files_locked(struct stats_fs_source *sr=
c)
+{
+=09struct stats_fs_source *child;
+
+=09if (src->source_dentry =3D=3D NULL)
+=09=09return;
+
+=09list_for_each_entry (child, &src->subordinates_head, list_element)
+=09=09stats_fs_source_remove_files(child);
+
+=09stats_fs_remove_recursive(src->source_dentry);
+=09src->source_dentry =3D NULL;
+}
+
+static void stats_fs_source_remove_files(struct stats_fs_source *src)
+{
+=09down_write(&src->rwsem);
+=09stats_fs_source_remove_files_locked(src);
+=09up_write(&src->rwsem);
+}
+
 static struct stats_fs_value *find_value(struct stats_fs_value_source *src=
,
 =09=09=09=09=09 struct stats_fs_value *val)
 {
@@ -57,6 +155,62 @@ search_value_in_source(struct stats_fs_source *src, str=
uct stats_fs_value *arg,
 =09return NULL;
 }
=20
+/* Called with rwsem held for writing */
+static void stats_fs_create_files_locked(struct stats_fs_source *source)
+{
+=09struct stats_fs_value_source *val_src;
+=09struct stats_fs_value *val;
+
+=09if (!source->source_dentry)
+=09=09return;
+
+=09list_for_each_entry (val_src, &source->values_head, list_element) {
+=09=09if (val_src->files_created)
+=09=09=09continue;
+
+=09=09for (val =3D val_src->values; val->name; val++)
+=09=09=09stats_fs_create_file(val, source);
+
+=09=09val_src->files_created =3D true;
+=09}
+}
+
+/* Called with rwsem held for writing */
+static void
+stats_fs_create_files_recursive_locked(struct stats_fs_source *source,
+=09=09=09=09       struct dentry *parent_dentry)
+{
+=09struct stats_fs_source *child;
+
+=09/* first check values in this folder, since it might be new */
+=09if (!source->source_dentry) {
+=09=09source->source_dentry =3D
+=09=09=09stats_fs_create_dir(source->name, parent_dentry);
+=09}
+
+=09stats_fs_create_files_locked(source);
+
+=09list_for_each_entry (child, &source->subordinates_head, list_element) {
+=09=09if (child->source_dentry =3D=3D NULL) {
+=09=09=09/* assume that if child has a folder,
+=09=09=09 * also the sub-child have that.
+=09=09=09 */
+=09=09=09down_write(&child->rwsem);
+=09=09=09stats_fs_create_files_recursive_locked(
+=09=09=09=09child, source->source_dentry);
+=09=09=09up_write(&child->rwsem);
+=09=09}
+=09}
+}
+
+void stats_fs_source_register(struct stats_fs_source *source)
+{
+=09down_write(&source->rwsem);
+=09stats_fs_create_files_recursive_locked(source, NULL);
+=09up_write(&source->rwsem);
+}
+EXPORT_SYMBOL_GPL(stats_fs_source_register);
+
 /* Called with rwsem held for writing */
 static struct stats_fs_value_source *create_value_source(void *base)
 {
@@ -93,6 +247,9 @@ int stats_fs_source_add_values(struct stats_fs_source *s=
ource,
 =09/* add the val_src to the source list */
 =09list_add(&val_src->list_element, &source->values_head);
=20
+=09/* create child if it's the case */
+=09stats_fs_create_files_locked(source);
+
 =09up_write(&source->rwsem);
=20
 =09return 0;
@@ -106,6 +263,9 @@ void stats_fs_source_add_subordinate(struct stats_fs_so=
urce *source,
=20
 =09stats_fs_source_get(sub);
 =09list_add(&sub->list_element, &source->subordinates_head);
+=09if (source->source_dentry)
+=09=09stats_fs_create_files_recursive_locked(sub,
+=09=09=09=09=09=09       source->source_dentry);
=20
 =09up_write(&source->rwsem);
 }
@@ -122,6 +282,7 @@ stats_fs_source_remove_subordinate_locked(struct stats_=
fs_source *source,
 =09=09=09     list_element) {
 =09=09if (src_entry =3D=3D sub) {
 =09=09=09list_del_init(&src_entry->list_element);
+=09=09=09stats_fs_source_remove_files(src_entry);
 =09=09=09stats_fs_source_put(src_entry);
 =09=09=09return;
 =09=09}
@@ -565,6 +726,8 @@ static void stats_fs_source_destroy(struct kref *kref_s=
ource)
 =09=09stats_fs_source_remove_subordinate_locked(source, child);
 =09}
=20
+=09stats_fs_source_remove_files_locked(source);
+
 =09up_write(&source->rwsem);
 =09kfree(source->name);
 =09kfree(source);
diff --git a/include/linux/stats_fs.h b/include/linux/stats_fs.h
index dc2d2e11f5ea..b04c42d827cf 100644
--- a/include/linux/stats_fs.h
+++ b/include/linux/stats_fs.h
@@ -87,6 +87,18 @@ struct stats_fs_source {
  */
 struct stats_fs_source *stats_fs_source_create(const char *fmt, ...);
=20
+/**
+ * stats_fs_source_register - register a source in the stats_fs filesystem
+ * @source: a pointer to the source that will be registered
+ *
+ * Add the given folder as direct child of /sys/kernel/statsfs.
+ * It also starts to recursively search its own child and create all folde=
rs
+ * and files if they weren't already. All subsequent add_subordinate calls
+ * on the same source that is used in this function will create correspond=
ing
+ * files and directories.
+ */
+void stats_fs_source_register(struct stats_fs_source *source);
+
 /**
  * stats_fs_source_add_values - adds values to the given source
  * @source: a pointer to the source that will receive the values
@@ -235,6 +247,9 @@ static inline struct stats_fs_source *stats_fs_source_c=
reate(const char *fmt,
 =09return ERR_PTR(-ENODEV);
 }
=20
+static inline void stats_fs_source_register(struct stats_fs_source *source=
)
+{ }
+
 static inline int stats_fs_source_add_values(struct stats_fs_source *sourc=
e,
 =09=09=09=09=09     struct stats_fs_value *val,
 =09=09=09=09=09     void *base_ptr)
diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
index d78064007b17..46c66ea3fc9e 100644
--- a/include/uapi/linux/magic.h
+++ b/include/uapi/linux/magic.h
@@ -10,6 +10,7 @@
 #define CRAMFS_MAGIC=09=090x28cd3d45=09/* some random number */
 #define CRAMFS_MAGIC_WEND=090x453dcd28=09/* magic number with the wrong en=
dianess */
 #define DEBUGFS_MAGIC          0x64626720
+#define STATSFS_MAGIC          0x73746174
 #define SECURITYFS_MAGIC=090x73636673
 #define SELINUX_MAGIC=09=090xf97cff8c
 #define SMACK_MAGIC=09=090x43415d53=09/* "SMAC" */
diff --git a/tools/lib/api/fs/fs.c b/tools/lib/api/fs/fs.c
index 027b18f7ed8c..6fe306206dfb 100644
--- a/tools/lib/api/fs/fs.c
+++ b/tools/lib/api/fs/fs.c
@@ -35,6 +35,10 @@
 #define TRACEFS_MAGIC          0x74726163
 #endif
=20
+#ifndef STATSFS_MAGIC
+#define STATSFS_MAGIC          0x73746174
+#endif
+
 #ifndef HUGETLBFS_MAGIC
 #define HUGETLBFS_MAGIC        0x958458f6
 #endif
@@ -76,6 +80,16 @@ static const char * const tracefs__known_mountpoints[] =
=3D {
 =090,
 };
=20
+#ifndef STATSFS_DEFAULT_PATH
+#define STATSFS_DEFAULT_PATH "/sys/kernel/statsfs"
+#endif
+
+static const char * const statsfs__known_mountpoints[] =3D {
+=09STATSFS_DEFAULT_PATH,
+=09"/statsfs",
+=090,
+};
+
 static const char * const hugetlbfs__known_mountpoints[] =3D {
 =090,
 };
@@ -100,6 +114,7 @@ enum {
 =09FS__TRACEFS =3D 3,
 =09FS__HUGETLBFS =3D 4,
 =09FS__BPF_FS =3D 5,
+=09FS__STATSFS =3D 6,
 };
=20
 #ifndef TRACEFS_MAGIC
@@ -127,6 +142,11 @@ static struct fs fs__entries[] =3D {
 =09=09.mounts=09=3D tracefs__known_mountpoints,
 =09=09.magic=09=3D TRACEFS_MAGIC,
 =09},
+=09[FS__STATSFS] =3D {
+=09=09.name=09=3D "statsfs",
+=09=09.mounts=09=3D statsfs__known_mountpoints,
+=09=09.magic=09=3D STATSFS_MAGIC,
+=09},
 =09[FS__HUGETLBFS] =3D {
 =09=09.name=09=3D "hugetlbfs",
 =09=09.mounts =3D hugetlbfs__known_mountpoints,
@@ -297,6 +317,7 @@ FS(sysfs,   FS__SYSFS);
 FS(procfs,  FS__PROCFS);
 FS(debugfs, FS__DEBUGFS);
 FS(tracefs, FS__TRACEFS);
+FS(statsfs, FS__STATSFS);
 FS(hugetlbfs, FS__HUGETLBFS);
 FS(bpf_fs, FS__BPF_FS);
=20
--=20
2.25.2

