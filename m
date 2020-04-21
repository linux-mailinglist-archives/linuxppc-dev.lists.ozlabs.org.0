Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3113B1B290B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 16:08:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49655Z2C1czDqvH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 00:08:50 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=DUzu/Ig8; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=DUzu/Ig8; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4964k30n83zDqcY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 23:51:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587477112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mTBNFPW+AQMdeg68c1pNcWIuAsHKKnTdkyH39ffrfEE=;
 b=DUzu/Ig8/NkOYTvxN1bm1w/lxP54NBWYtDDdUsjx4H61y35G4mqpXwd5O52MJZq6bPjlOC
 GOgDFH2IUYN3plE8GVAY31RQ2KCiDh8o60UAznn6h20F6/5Z7mWVwrUEKbPpeeGcaLOWk0
 erl6GMHMzifiY+WfUJj0J9C8vnHkSFc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587477112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mTBNFPW+AQMdeg68c1pNcWIuAsHKKnTdkyH39ffrfEE=;
 b=DUzu/Ig8/NkOYTvxN1bm1w/lxP54NBWYtDDdUsjx4H61y35G4mqpXwd5O52MJZq6bPjlOC
 GOgDFH2IUYN3plE8GVAY31RQ2KCiDh8o60UAznn6h20F6/5Z7mWVwrUEKbPpeeGcaLOWk0
 erl6GMHMzifiY+WfUJj0J9C8vnHkSFc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-MZAVTxxdP4OObQSMt3jd-g-1; Tue, 21 Apr 2020 09:51:46 -0400
X-MC-Unique: MZAVTxxdP4OObQSMt3jd-g-1
Received: by mail-wm1-f71.google.com with SMTP id u11so1392213wmc.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 06:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uEO79FtubqXMahKIwTgMnvnxLKfl/MCXROyTj0OBoJ0=;
 b=U3WFF/lqSEHEw9KlYvz3QV+ltfduSH+P1bd/ctPCquYCJw7UzJNfNjx7xQekamha3a
 pMk5tP74UTQvENpRmM3Ss0Y2xQvAqsxWooB5IOl+snhv5/VZ6WFxBO+vZ1hOxKoKRtde
 i38rp56eNa4y4P/pfJkGdO4fdzBs7N5xfQkxs+7D+Gh4O/Nw0FyG+IXtGUBSCkJHJGrr
 7fArXeiqygcJrBAPIi691R/LwX33WNHMrE7uKKwwtEZpMTnJqEUtLI27H/ndSwR8Zu3B
 uSpDcrfAZfCNB/bRQB/tCe/rAYYHMwpdAxjIl95BtI9KUg1CZBlvS+dES4choghmSQbZ
 E52Q==
X-Gm-Message-State: AGi0Pua29f4K71Mh0uU+heOZNfZR241NCkBTcn9g3UeLznAZP+Xls/T1
 xE6kEj6kVZuihc+KcAnMBp9qPo6jI/tESk71vfewQYdXXYKeuoMJyIyyXN9R2ZO1Y6ukaCyHlYJ
 kpfY7m1YJWcNr+EPEbYqtO/ymJQ==
X-Received: by 2002:a05:6000:114b:: with SMTP id
 d11mr11202377wrx.138.1587477104838; 
 Tue, 21 Apr 2020 06:51:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypJsZggx2G3tX02r+CIpkhG0GKbStWvZ8dzSX+QBPAQPkgkEDhh7nt3yzU3c0QsyRLr3LyQW5w==
X-Received: by 2002:a05:6000:114b:: with SMTP id
 d11mr11202330wrx.138.1587477104368; 
 Tue, 21 Apr 2020 06:51:44 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.194])
 by smtp.gmail.com with ESMTPSA id a187sm3565830wmh.40.2020.04.21.06.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:51:43 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 2/7] libfs: wrap simple_pin_fs/simple_release_fs arguments
 in a struct
Date: Tue, 21 Apr 2020 15:51:14 +0200
Message-Id: <20200421135119.30007-3-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200421135119.30007-1-eesposit@redhat.com>
References: <20200421135119.30007-1-eesposit@redhat.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, linux-scsi@vger.kernel.org,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>, Uma Krishnan <ukrishn@linux.ibm.com>,
 John Johansen <john.johansen@canonical.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, Joel Becker <jlbec@evilplan.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Simplify passing the count and mount to simple_pin_fs and
simple_release_fs by wrapping them in the simple_fs struct,
in preparation for adding more high level operations to
fs/libfs.c

There is no functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 drivers/gpu/drm/drm_drv.c       | 11 ++++----
 drivers/misc/cxl/api.c          | 13 +++++-----
 drivers/scsi/cxlflash/ocxl_hw.c | 14 +++++-----
 fs/binfmt_misc.c                |  9 +++----
 fs/configfs/mount.c             | 10 +++-----
 fs/debugfs/inode.c              | 22 ++++++++--------
 fs/libfs.c                      | 45 +++++++++++++++++++++++++--------
 fs/tracefs/inode.c              | 18 ++++++-------
 include/linux/fs.h              | 10 ++++++--
 security/apparmor/apparmorfs.c  | 25 +++++++++---------
 security/inode.c                | 11 ++++----
 11 files changed, 103 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7b1a628d1f6e..e29424d64874 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -514,8 +514,7 @@ EXPORT_SYMBOL(drm_dev_unplug);
  * iput(), but this way you'd end up with a new vfsmount for each inode.
  */
=20
-static int drm_fs_cnt;
-static struct vfsmount *drm_fs_mnt;
+static struct simple_fs drm_fs;
=20
 static int drm_fs_init_fs_context(struct fs_context *fc)
 {
@@ -534,15 +533,15 @@ static struct inode *drm_fs_inode_new(void)
 =09struct inode *inode;
 =09int r;
=20
-=09r =3D simple_pin_fs(&drm_fs_type, &drm_fs_mnt, &drm_fs_cnt);
+=09r =3D simple_pin_fs(&drm_fs, &drm_fs_type);
 =09if (r < 0) {
 =09=09DRM_ERROR("Cannot mount pseudo fs: %d\n", r);
 =09=09return ERR_PTR(r);
 =09}
=20
-=09inode =3D alloc_anon_inode(drm_fs_mnt->mnt_sb);
+=09inode =3D alloc_anon_inode(drm_fs.mount->mnt_sb);
 =09if (IS_ERR(inode))
-=09=09simple_release_fs(&drm_fs_mnt, &drm_fs_cnt);
+=09=09simple_release_fs(&drm_fs);
=20
 =09return inode;
 }
@@ -551,7 +550,7 @@ static void drm_fs_inode_free(struct inode *inode)
 {
 =09if (inode) {
 =09=09iput(inode);
-=09=09simple_release_fs(&drm_fs_mnt, &drm_fs_cnt);
+=09=09simple_release_fs(&drm_fs);
 =09}
 }
=20
diff --git a/drivers/misc/cxl/api.c b/drivers/misc/cxl/api.c
index b493de962153..67e4808bce49 100644
--- a/drivers/misc/cxl/api.c
+++ b/drivers/misc/cxl/api.c
@@ -31,8 +31,7 @@
=20
 #define CXL_PSEUDO_FS_MAGIC=090x1697697f
=20
-static int cxl_fs_cnt;
-static struct vfsmount *cxl_vfs_mount;
+static struct simple_fs cxl_fs;
=20
 static int cxl_fs_init_fs_context(struct fs_context *fc)
 {
@@ -50,7 +49,7 @@ static struct file_system_type cxl_fs_type =3D {
 void cxl_release_mapping(struct cxl_context *ctx)
 {
 =09if (ctx->kernelapi && ctx->mapping)
-=09=09simple_release_fs(&cxl_vfs_mount, &cxl_fs_cnt);
+=09=09simple_release_fs(&cxl_fs);
 }
=20
 static struct file *cxl_getfile(const char *name,
@@ -66,20 +65,20 @@ static struct file *cxl_getfile(const char *name,
 =09if (fops->owner && !try_module_get(fops->owner))
 =09=09return ERR_PTR(-ENOENT);
=20
-=09rc =3D simple_pin_fs(&cxl_fs_type, &cxl_vfs_mount, &cxl_fs_cnt);
+=09rc =3D simple_pin_fs(&cxl_fs, &cxl_fs_type);
 =09if (rc < 0) {
 =09=09pr_err("Cannot mount cxl pseudo filesystem: %d\n", rc);
 =09=09file =3D ERR_PTR(rc);
 =09=09goto err_module;
 =09}
=20
-=09inode =3D alloc_anon_inode(cxl_vfs_mount->mnt_sb);
+=09inode =3D alloc_anon_inode(cxl_fs.mount->mnt_sb);
 =09if (IS_ERR(inode)) {
 =09=09file =3D ERR_CAST(inode);
 =09=09goto err_fs;
 =09}
=20
-=09file =3D alloc_file_pseudo(inode, cxl_vfs_mount, name,
+=09file =3D alloc_file_pseudo(inode, cxl_fs.mount, name,
 =09=09=09=09 flags & (O_ACCMODE | O_NONBLOCK), fops);
 =09if (IS_ERR(file))
 =09=09goto err_inode;
@@ -91,7 +90,7 @@ static struct file *cxl_getfile(const char *name,
 err_inode:
 =09iput(inode);
 err_fs:
-=09simple_release_fs(&cxl_vfs_mount, &cxl_fs_cnt);
+=09simple_release_fs(&cxl_fs);
 err_module:
 =09module_put(fops->owner);
 =09return file;
diff --git a/drivers/scsi/cxlflash/ocxl_hw.c b/drivers/scsi/cxlflash/ocxl_h=
w.c
index 7018cd802569..7fa98dd4fa28 100644
--- a/drivers/scsi/cxlflash/ocxl_hw.c
+++ b/drivers/scsi/cxlflash/ocxl_hw.c
@@ -29,8 +29,7 @@
=20
 #define OCXLFLASH_FS_MAGIC      0x1697698f
=20
-static int ocxlflash_fs_cnt;
-static struct vfsmount *ocxlflash_vfs_mount;
+static struct simple_fs ocxlflash_fs;
=20
 static int ocxlflash_fs_init_fs_context(struct fs_context *fc)
 {
@@ -51,7 +50,7 @@ static struct file_system_type ocxlflash_fs_type =3D {
 static void ocxlflash_release_mapping(struct ocxlflash_context *ctx)
 {
 =09if (ctx->mapping)
-=09=09simple_release_fs(&ocxlflash_vfs_mount, &ocxlflash_fs_cnt);
+=09=09simple_release_fs(&ocxlflash_fs);
 =09ctx->mapping =3D NULL;
 }
=20
@@ -79,15 +78,14 @@ static struct file *ocxlflash_getfile(struct device *de=
v, const char *name,
 =09=09goto err1;
 =09}
=20
-=09rc =3D simple_pin_fs(&ocxlflash_fs_type, &ocxlflash_vfs_mount,
-=09=09=09   &ocxlflash_fs_cnt);
+=09rc =3D simple_pin_fs(&ocxlflash_fs, &ocxlflash_fs_type);
 =09if (unlikely(rc < 0)) {
 =09=09dev_err(dev, "%s: Cannot mount ocxlflash pseudofs rc=3D%d\n",
 =09=09=09__func__, rc);
 =09=09goto err2;
 =09}
=20
-=09inode =3D alloc_anon_inode(ocxlflash_vfs_mount->mnt_sb);
+=09inode =3D alloc_anon_inode(ocxlflash_fs.mount->mnt_sb);
 =09if (IS_ERR(inode)) {
 =09=09rc =3D PTR_ERR(inode);
 =09=09dev_err(dev, "%s: alloc_anon_inode failed rc=3D%d\n",
@@ -95,7 +93,7 @@ static struct file *ocxlflash_getfile(struct device *dev,=
 const char *name,
 =09=09goto err3;
 =09}
=20
-=09file =3D alloc_file_pseudo(inode, ocxlflash_vfs_mount, name,
+=09file =3D alloc_file_pseudo(inode, ocxlflash_fs.mount, name,
 =09=09=09=09 flags & (O_ACCMODE | O_NONBLOCK), fops);
 =09if (IS_ERR(file)) {
 =09=09rc =3D PTR_ERR(file);
@@ -110,7 +108,7 @@ static struct file *ocxlflash_getfile(struct device *de=
v, const char *name,
 err4:
 =09iput(inode);
 err3:
-=09simple_release_fs(&ocxlflash_vfs_mount, &ocxlflash_fs_cnt);
+=09simple_release_fs(&ocxlflash_fs);
 err2:
 =09module_put(fops->owner);
 err1:
diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
index cdb45829354d..3cff446f222b 100644
--- a/fs/binfmt_misc.c
+++ b/fs/binfmt_misc.c
@@ -64,8 +64,7 @@ typedef struct {
=20
 static DEFINE_RWLOCK(entries_lock);
 static struct file_system_type bm_fs_type;
-static struct vfsmount *bm_mnt;
-static int entry_count;
+static struct simple_fs bm_fs;
=20
 /*
  * Max length of the register string.  Determined by:
@@ -623,7 +622,7 @@ static void kill_node(Node *e)
 =09drop_nlink(d_inode(dentry));
 =09d_drop(dentry);
 =09dput(dentry);
-=09simple_release_fs(&bm_mnt, &entry_count);
+=09simple_release_fs(&bm_fs);
 }
=20
 /* /<entry> */
@@ -718,7 +717,7 @@ static ssize_t bm_register_write(struct file *file, con=
st char __user *buffer,
 =09if (!inode)
 =09=09goto out2;
=20
-=09err =3D simple_pin_fs(&bm_fs_type, &bm_mnt, &entry_count);
+=09err =3D simple_pin_fs(&bm_fs, &bm_fs_type);
 =09if (err) {
 =09=09iput(inode);
 =09=09inode =3D NULL;
@@ -732,7 +731,7 @@ static ssize_t bm_register_write(struct file *file, con=
st char __user *buffer,
 =09=09if (IS_ERR(f)) {
 =09=09=09err =3D PTR_ERR(f);
 =09=09=09pr_notice("register: failed to install interpreter file %s\n", e-=
>interpreter);
-=09=09=09simple_release_fs(&bm_mnt, &entry_count);
+=09=09=09simple_release_fs(&bm_fs);
 =09=09=09iput(inode);
 =09=09=09inode =3D NULL;
 =09=09=09goto out2;
diff --git a/fs/configfs/mount.c b/fs/configfs/mount.c
index 0c6e8cf61953..9fb2791e5eed 100644
--- a/fs/configfs/mount.c
+++ b/fs/configfs/mount.c
@@ -24,9 +24,8 @@
 /* Random magic number */
 #define CONFIGFS_MAGIC 0x62656570
=20
-static struct vfsmount *configfs_mount =3D NULL;
+static struct simple_fs configfs_fs;
 struct kmem_cache *configfs_dir_cachep;
-static int configfs_mnt_count =3D 0;
=20
=20
 static void configfs_free_inode(struct inode *inode)
@@ -123,14 +122,13 @@ MODULE_ALIAS_FS("configfs");
=20
 struct dentry *configfs_pin_fs(void)
 {
-=09int err =3D simple_pin_fs(&configfs_fs_type, &configfs_mount,
-=09=09=09     &configfs_mnt_count);
-=09return err ? ERR_PTR(err) : configfs_mount->mnt_root;
+=09int err =3D simple_pin_fs(&configfs_fs, &configfs_fs_type);
+=09return err ? ERR_PTR(err) : configfs_fs.mount->mnt_root;
 }
=20
 void configfs_release_fs(void)
 {
-=09simple_release_fs(&configfs_mount, &configfs_mnt_count);
+=09simple_release_fs(&configfs_fs);
 }
=20
=20
diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index b7f2e971ecbc..5dbb74a23e7c 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -32,8 +32,7 @@
=20
 #define DEBUGFS_DEFAULT_MODE=090700
=20
-static struct vfsmount *debugfs_mount;
-static int debugfs_mount_count;
+static struct simple_fs debugfs;
 static bool debugfs_registered;
=20
 /*
@@ -297,7 +296,7 @@ struct dentry *debugfs_lookup(const char *name, struct =
dentry *parent)
 =09=09return NULL;
=20
 =09if (!parent)
-=09=09parent =3D debugfs_mount->mnt_root;
+=09=09parent =3D debugfs.mount->mnt_root;
=20
 =09dentry =3D lookup_positive_unlocked(name, parent, strlen(name));
 =09if (IS_ERR(dentry))
@@ -316,8 +315,7 @@ static struct dentry *start_creating(const char *name, =
struct dentry *parent)
 =09if (IS_ERR(parent))
 =09=09return parent;
=20
-=09error =3D simple_pin_fs(&debug_fs_type, &debugfs_mount,
-=09=09=09      &debugfs_mount_count);
+=09error =3D simple_pin_fs(&debugfs, &debug_fs_type);
 =09if (error) {
 =09=09pr_err("Unable to pin filesystem for file '%s'\n", name);
 =09=09return ERR_PTR(error);
@@ -329,7 +327,7 @@ static struct dentry *start_creating(const char *name, =
struct dentry *parent)
 =09 * have around.
 =09 */
 =09if (!parent)
-=09=09parent =3D debugfs_mount->mnt_root;
+=09=09parent =3D debugfs.mount->mnt_root;
=20
 =09inode_lock(d_inode(parent));
 =09if (unlikely(IS_DEADDIR(d_inode(parent))))
@@ -349,7 +347,7 @@ static struct dentry *start_creating(const char *name, =
struct dentry *parent)
=20
 =09if (IS_ERR(dentry)) {
 =09=09inode_unlock(d_inode(parent));
-=09=09simple_release_fs(&debugfs_mount, &debugfs_mount_count);
+=09=09simple_release_fs(&debugfs);
 =09}
=20
 =09return dentry;
@@ -359,7 +357,7 @@ static struct dentry *failed_creating(struct dentry *de=
ntry)
 {
 =09inode_unlock(d_inode(dentry->d_parent));
 =09dput(dentry);
-=09simple_release_fs(&debugfs_mount, &debugfs_mount_count);
+=09simple_release_fs(&debugfs);
 =09return ERR_PTR(-ENOMEM);
 }
=20
@@ -676,9 +674,9 @@ static void __debugfs_file_removed(struct dentry *dentr=
y)
=20
 static void remove_one(struct dentry *victim)
 {
-        if (d_is_reg(victim))
+=09if (d_is_reg(victim))
 =09=09__debugfs_file_removed(victim);
-=09simple_release_fs(&debugfs_mount, &debugfs_mount_count);
+=09simple_release_fs(&debugfs);
 }
=20
 /**
@@ -699,9 +697,9 @@ void debugfs_remove(struct dentry *dentry)
 =09if (IS_ERR_OR_NULL(dentry))
 =09=09return;
=20
-=09simple_pin_fs(&debug_fs_type, &debugfs_mount, &debugfs_mount_count);
+=09simple_pin_fs(&debugfs, &debug_fs_type);
 =09simple_recursive_removal(dentry, remove_one);
-=09simple_release_fs(&debugfs_mount, &debugfs_mount_count);
+=09simple_release_fs(&debugfs);
 }
 EXPORT_SYMBOL_GPL(debugfs_remove);
=20
diff --git a/fs/libfs.c b/fs/libfs.c
index 3759fbacf522..54e07ae986ca 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -665,39 +665,64 @@ EXPORT_SYMBOL(simple_fill_super);
=20
 static DEFINE_SPINLOCK(pin_fs_lock);
=20
-int simple_pin_fs(struct file_system_type *type, struct vfsmount **mount, =
int *count)
+/**
+ * simple_pin_fs - generic function to pin (mount if needed,
+ *                otherwise add a reference to the mount) a filesystem
+ * @fs: a pointer to a the simple_fs struct containing a struct vfs_mount
+ *      pointer (that can be NULL) and a counter.
+ * @type: a pointer to the file system type used by vfs_kern_mount.
+ *
+ * This function sets fs->mount if NULL, by calling vfs_kern_mount
+ * on @type.
+ * It also takes care of incrementing the reference counter.
+ *
+ * This function will return 0 in case of success, and PTR_ERR(-ERROR)
+ * if vfs_kern_mount fails.
+ **/
+int simple_pin_fs(struct simple_fs *fs, struct file_system_type *type)
 {
 =09struct vfsmount *mnt =3D NULL;
 =09spin_lock(&pin_fs_lock);
-=09if (unlikely(!*mount)) {
+=09if (unlikely(!fs->mount)) {
 =09=09spin_unlock(&pin_fs_lock);
 =09=09mnt =3D vfs_kern_mount(type, SB_KERNMOUNT, type->name, NULL);
 =09=09if (IS_ERR(mnt))
 =09=09=09return PTR_ERR(mnt);
 =09=09spin_lock(&pin_fs_lock);
-=09=09if (!*mount)
-=09=09=09*mount =3D mnt;
+=09=09if (!fs->mount)
+=09=09=09fs->mount =3D mnt;
 =09}
-=09mntget(*mount);
-=09++*count;
+=09mntget(fs->mount);
+=09++fs->count;
 =09spin_unlock(&pin_fs_lock);
 =09mntput(mnt);
 =09return 0;
 }
 EXPORT_SYMBOL(simple_pin_fs);
=20
-void simple_release_fs(struct vfsmount **mount, int *count)
+/**
+ * simple_release_fs - decrements the reference counter and unmounts the
+ *                    file system.
+ * @fs: a pointer to a struct simple_fs containing the reference counter
+ *      and vfs_mount pointer
+ *
+ * This function decrements the refcount of the given file system and
+ * if 0 sets the mount pointer to NULL.
+ **/
+void simple_release_fs(struct simple_fs *fs)
 {
 =09struct vfsmount *mnt;
 =09spin_lock(&pin_fs_lock);
-=09mnt =3D *mount;
-=09if (!--*count)
-=09=09*mount =3D NULL;
+=09mnt =3D fs->mount;
+=09if (!--fs->count)
+=09=09fs->mount =3D NULL;
 =09spin_unlock(&pin_fs_lock);
 =09mntput(mnt);
 }
 EXPORT_SYMBOL(simple_release_fs);
=20
+
+
 /**
  * simple_read_from_buffer - copy data from the buffer to user space
  * @to: the user space buffer to read to
diff --git a/fs/tracefs/inode.c b/fs/tracefs/inode.c
index 0ee8c6dfb036..370eb38ff1ad 100644
--- a/fs/tracefs/inode.c
+++ b/fs/tracefs/inode.c
@@ -24,8 +24,7 @@
=20
 #define TRACEFS_DEFAULT_MODE=090700
=20
-static struct vfsmount *tracefs_mount;
-static int tracefs_mount_count;
+static struct simple_fs tracefs;
 static bool tracefs_registered;
=20
 static ssize_t default_read_file(struct file *file, char __user *buf,
@@ -316,8 +315,7 @@ static struct dentry *start_creating(const char *name, =
struct dentry *parent)
=20
 =09pr_debug("tracefs: creating file '%s'\n",name);
=20
-=09error =3D simple_pin_fs(&trace_fs_type, &tracefs_mount,
-=09=09=09      &tracefs_mount_count);
+=09error =3D simple_pin_fs(&tracefs, &trace_fs_type);
 =09if (error)
 =09=09return ERR_PTR(error);
=20
@@ -327,7 +325,7 @@ static struct dentry *start_creating(const char *name, =
struct dentry *parent)
 =09 * have around.
 =09 */
 =09if (!parent)
-=09=09parent =3D tracefs_mount->mnt_root;
+=09=09parent =3D tracefs.mount->mnt_root;
=20
 =09inode_lock(parent->d_inode);
 =09if (unlikely(IS_DEADDIR(parent->d_inode)))
@@ -341,7 +339,7 @@ static struct dentry *start_creating(const char *name, =
struct dentry *parent)
=20
 =09if (IS_ERR(dentry)) {
 =09=09inode_unlock(parent->d_inode);
-=09=09simple_release_fs(&tracefs_mount, &tracefs_mount_count);
+=09=09simple_release_fs(&tracefs);
 =09}
=20
 =09return dentry;
@@ -351,7 +349,7 @@ static struct dentry *failed_creating(struct dentry *de=
ntry)
 {
 =09inode_unlock(dentry->d_parent->d_inode);
 =09dput(dentry);
-=09simple_release_fs(&tracefs_mount, &tracefs_mount_count);
+=09simple_release_fs(&tracefs);
 =09return NULL;
 }
=20
@@ -504,7 +502,7 @@ __init struct dentry *tracefs_create_instance_dir(const=
 char *name,
=20
 static void remove_one(struct dentry *victim)
 {
-=09simple_release_fs(&tracefs_mount, &tracefs_mount_count);
+=09simple_release_fs(&tracefs);
 }
=20
 /**
@@ -520,9 +518,9 @@ void tracefs_remove(struct dentry *dentry)
 =09if (IS_ERR_OR_NULL(dentry))
 =09=09return;
=20
-=09simple_pin_fs(&trace_fs_type, &tracefs_mount, &tracefs_mount_count);
+=09simple_pin_fs(&tracefs, &trace_fs_type);
 =09simple_recursive_removal(dentry, remove_one);
-=09simple_release_fs(&tracefs_mount, &tracefs_mount_count);
+=09simple_release_fs(&tracefs);
 }
=20
 /**
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 4f6f59b4f22a..a3691c132b3a 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3363,8 +3363,14 @@ struct tree_descr { const char *name; const struct f=
ile_operations *ops; int mod
 struct dentry *d_alloc_name(struct dentry *, const char *);
 extern int simple_fill_super(struct super_block *, unsigned long,
 =09=09=09     const struct tree_descr *);
-extern int simple_pin_fs(struct file_system_type *, struct vfsmount **moun=
t, int *count);
-extern void simple_release_fs(struct vfsmount **mount, int *count);
+
+struct simple_fs {
+=09struct vfsmount *mount;
+=09int count;
+};
+
+extern int simple_pin_fs(struct simple_fs *, struct file_system_type *);
+extern void simple_release_fs(struct simple_fs *);
=20
 extern ssize_t simple_read_from_buffer(void __user *to, size_t count,
 =09=09=09loff_t *ppos, const void *from, size_t available);
diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.=
c
index 36f848734902..00f0158fb1e1 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -140,8 +140,7 @@ static int mangle_name(const char *name, char *target)
  */
=20
 #define AAFS_NAME=09=09"apparmorfs"
-static struct vfsmount *aafs_mnt;
-static int aafs_count;
+static struct simple_fs aafs;
=20
=20
 static int aafs_show_path(struct seq_file *seq, struct dentry *dentry)
@@ -273,7 +272,7 @@ static struct dentry *aafs_create(const char *name, umo=
de_t mode,
 =09if (!(mode & S_IFMT))
 =09=09mode =3D (mode & S_IALLUGO) | S_IFREG;
=20
-=09error =3D simple_pin_fs(&aafs_ops, &aafs_mnt, &aafs_count);
+=09error =3D simple_pin_fs(&aafs, &aafs_ops);
 =09if (error)
 =09=09return ERR_PTR(error);
=20
@@ -303,7 +302,7 @@ static struct dentry *aafs_create(const char *name, umo=
de_t mode,
=20
 fail_lock:
 =09inode_unlock(dir);
-=09simple_release_fs(&aafs_mnt, &aafs_count);
+=09simple_release_fs(&aafs);
=20
 =09return ERR_PTR(error);
 }
@@ -395,7 +394,7 @@ static void aafs_remove(struct dentry *dentry)
 =09=09dput(dentry);
 =09}
 =09inode_unlock(dir);
-=09simple_release_fs(&aafs_mnt, &aafs_count);
+=09simple_release_fs(&aafs);
 }
=20
=20
@@ -1824,7 +1823,7 @@ static int ns_mkdir_op(struct inode *dir, struct dent=
ry *dentry, umode_t mode)
 =09 * for pin_fs
 =09 */
 =09inode_unlock(dir);
-=09error =3D simple_pin_fs(&aafs_ops, &aafs_mnt, &aafs_count);
+=09error =3D simple_pin_fs(&aafs, &aafs_ops);
 =09mutex_lock_nested(&parent->lock, parent->level);
 =09inode_lock_nested(dir, I_MUTEX_PARENT);
 =09if (error)
@@ -1845,7 +1844,7 @@ static int ns_mkdir_op(struct inode *dir, struct dent=
ry *dentry, umode_t mode)
 =09aa_put_ns(ns);=09=09/* list ref remains */
 out_pin:
 =09if (error)
-=09=09simple_release_fs(&aafs_mnt, &aafs_count);
+=09=09simple_release_fs(&aafs);
 out:
 =09mutex_unlock(&parent->lock);
 =09aa_put_ns(parent);
@@ -2580,7 +2579,7 @@ static const char *policy_get_link(struct dentry *den=
try,
 =09=09return ERR_PTR(-ECHILD);
=20
 =09ns =3D aa_get_current_ns();
-=09path.mnt =3D mntget(aafs_mnt);
+=09path.mnt =3D mntget(aafs.mount);
 =09path.dentry =3D dget(ns_dir(ns));
 =09error =3D nd_jump_link(&path);
 =09aa_put_ns(ns);
@@ -2631,10 +2630,10 @@ static int __init aa_create_aafs(void)
 =09}
=20
 =09/* setup apparmorfs used to virtualize policy/ */
-=09aafs_mnt =3D kern_mount(&aafs_ops);
-=09if (IS_ERR(aafs_mnt))
+=09aafs.mount =3D kern_mount(&aafs_ops);
+=09if (IS_ERR(aafs.mount))
 =09=09panic("can't set apparmorfs up\n");
-=09aafs_mnt->mnt_sb->s_flags &=3D ~SB_NOUSER;
+=09aafs.mount->mnt_sb->s_flags &=3D ~SB_NOUSER;
=20
 =09/* Populate fs tree. */
 =09error =3D entry_create_dir(&aa_sfs_entry, NULL);
@@ -2667,8 +2666,8 @@ static int __init aa_create_aafs(void)
=20
 =09/* policy tree referenced by magic policy symlink */
 =09mutex_lock_nested(&root_ns->lock, root_ns->level);
-=09error =3D __aafs_ns_mkdir(root_ns, aafs_mnt->mnt_root, ".policy",
-=09=09=09=09aafs_mnt->mnt_root);
+=09error =3D __aafs_ns_mkdir(root_ns, aafs.mount->mnt_root, ".policy",
+=09=09=09=09aafs.mount->mnt_root);
 =09mutex_unlock(&root_ns->lock);
 =09if (error)
 =09=09goto error;
diff --git a/security/inode.c b/security/inode.c
index 6c326939750d..8a1bee35470a 100644
--- a/security/inode.c
+++ b/security/inode.c
@@ -22,8 +22,7 @@
 #include <linux/lsm_hooks.h>
 #include <linux/magic.h>
=20
-static struct vfsmount *mount;
-static int mount_count;
+static struct simple_fs securityfs;
=20
 static void securityfs_free_inode(struct inode *inode)
 {
@@ -118,12 +117,12 @@ static struct dentry *securityfs_create_dentry(const =
char *name, umode_t mode,
=20
 =09pr_debug("securityfs: creating file '%s'\n",name);
=20
-=09error =3D simple_pin_fs(&fs_type, &mount, &mount_count);
+=09error =3D simple_pin_fs(&securityfs, &fs_type);
 =09if (error)
 =09=09return ERR_PTR(error);
=20
 =09if (!parent)
-=09=09parent =3D mount->mnt_root;
+=09=09parent =3D securityfs.mount->mnt_root;
=20
 =09dir =3D d_inode(parent);
=20
@@ -168,7 +167,7 @@ static struct dentry *securityfs_create_dentry(const ch=
ar *name, umode_t mode,
 =09dentry =3D ERR_PTR(error);
 out:
 =09inode_unlock(dir);
-=09simple_release_fs(&mount, &mount_count);
+=09simple_release_fs(&securityfs);
 =09return dentry;
 }
=20
@@ -309,7 +308,7 @@ void securityfs_remove(struct dentry *dentry)
 =09=09dput(dentry);
 =09}
 =09inode_unlock(dir);
-=09simple_release_fs(&mount, &mount_count);
+=09simple_release_fs(&securityfs);
 }
 EXPORT_SYMBOL_GPL(securityfs_remove);
=20
--=20
2.25.2

