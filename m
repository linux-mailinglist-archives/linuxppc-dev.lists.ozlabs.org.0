Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 957951A7BC7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 15:07:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491m3Z5pddzDqWS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 23:07:06 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=FBMT36/f; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491lXw4bYyzDqdk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 22:44:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586868237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TDI13GYkH2qUTUEHiqJjSaS+DNI9ykXmZ5ji+6GiVLs=;
 b=FBMT36/fhdnC97qUddFGZo+0vkLmFwaVEZf7ZD2AzJSBTsFKD18WOlLLwnw+hz9TBZPmB5
 vXeDxbWVDe8oNvyWXXDEAsXIUZOFoR0v5DC33cWsE+zfkClA+Js7rDcyMqq3rOyW4BT5Me
 2QWQWt87F5A9lYWqkbYwomNbAur7ndA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-MF-r1suQOve4pcQFYuOY0Q-1; Tue, 14 Apr 2020 08:43:56 -0400
X-MC-Unique: MF-r1suQOve4pcQFYuOY0Q-1
Received: by mail-wr1-f69.google.com with SMTP id s11so3739169wru.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 05:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+/ZOC1mSf7836cAwwnVbykodwt6tVlgKdqt25tHv64=;
 b=tmcLQOYxLUidZ02EP/5pTvZjRJc6makQ+xXLIYageIFRECoyP1tw0FRmdT3CdW36mh
 8iXeT55/6rSQ7gzFc4XGCdQ0unk/y9V7vcqPLo2RCTBQSHOn2ZC+A2vfp10wz4wDwC2n
 H/OQIVQ3b0DQXeNq9irhlaUKhz2QyRqu1dWREZlYVb+oTPsQ8KikTILJPHJE0aPz49qc
 rFX+5I8efWIB1wxslUxxzO3uUwxlhjrqWUj2pnOK3rw0YpSAsLl/P+/zN+Q4CMb3XHjk
 78xKJG1mfR8r/WEISMqcxoqSMx8W9RzTX8NZGtTH7+ReJp+OCPdcPDeIwEfH2hIrLirR
 sMgQ==
X-Gm-Message-State: AGi0PuYntQDn8y2nSyaIHeJvBn0LLGafUujUJ9T3yU1YgwVzF4LAlp6m
 lszd41NMPWIO5+p3MqjE0qnDHhTWhyNp+RCmXNTN5weDX7Y0u1jiBj+r5dzK/2U+q4GCMLf9mBw
 k3fmBJpxHq4r9/irQPloDZDuDqg==
X-Received: by 2002:a05:600c:2341:: with SMTP id
 1mr22773902wmq.153.1586868234695; 
 Tue, 14 Apr 2020 05:43:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypIraG6pGixHUFzxqRqz9PglkzbJN9DYHdD4iNaidN315bM8P4DtvE8Hq2CP392Ys5AI4TBbWg==
X-Received: by 2002:a05:600c:2341:: with SMTP id
 1mr22773791wmq.153.1586868234119; 
 Tue, 14 Apr 2020 05:43:54 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.210])
 by smtp.gmail.com with ESMTPSA id m14sm16948816wrs.76.2020.04.14.05.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:43:53 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-nfs@vger.kernel.org
Subject: [PATCH 3/8] fs: wrap simple_pin_fs/simple_release_fs arguments in a
 struct
Date: Tue, 14 Apr 2020 14:42:57 +0200
Message-Id: <20200414124304.4470-4-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200414124304.4470-1-eesposit@redhat.com>
References: <20200414124304.4470-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 14 Apr 2020 22:51:50 +1000
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
Cc: Song Liu <songliubraving@fb.com>, linux-usb@vger.kernel.org,
 bpf@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 "J. Bruce Fields" <bfields@fieldses.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Hugh Dickins <hughd@google.com>,
 Paul Mackerras <paulus@samba.org>, John Johansen <john.johansen@canonical.com>,
 netdev@vger.kernel.org, linux-s390@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Andrew Donnellan <ajd@linux.ibm.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Matthew Garrett <matthew.garrett@nebula.com>, linux-efi@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-rdma@vger.kernel.org,
 Mark Fasheh <mark@fasheh.com>, Anton Vorontsov <anton@enomsg.org>,
 John Fastabend <john.fastabend@gmail.com>, James Morris <jmorris@namei.org>,
 Ard Biesheuvel <ardb@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, oprofile-list@lists.sf.net,
 Yonghong Song <yhs@fb.com>, Ian Kent <raven@themaw.net>,
 Andrii Nakryiko <andriin@fb.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, autofs@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Uma Krishnan <ukrishn@linux.ibm.com>, Maxime Ripard <mripard@kernel.org>,
 linux-fsdevel@vger.kernel.org, "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 KP Singh <kpsingh@chromium.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Felipe Balbi <balbi@kernel.org>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Iurii Zaikin <yzaikin@google.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Jeremy Kerr <jk@ozlabs.org>, Daniel Vetter <daniel@ffwll.ch>,
 Colin Cross <ccross@android.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, ocfs2-devel@oss.oracle.com,
 Joel Becker <jlbec@evilplan.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Simplify passing the count and mount to simple_pin_fs and simple_release_fs=
,
in preparation for adding more high level operations to the simplefs API.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 drivers/gpu/drm/drm_drv.c       | 11 +++++------
 drivers/misc/cxl/api.c          | 13 ++++++-------
 drivers/scsi/cxlflash/ocxl_hw.c | 14 ++++++--------
 fs/binfmt_misc.c                |  9 ++++-----
 fs/configfs/mount.c             | 10 ++++------
 fs/debugfs/inode.c              | 22 ++++++++++------------
 fs/simplefs.c                   | 20 ++++++++++----------
 fs/tracefs/inode.c              | 18 ++++++++----------
 include/linux/simplefs.h        |  9 +++++++--
 security/apparmor/apparmorfs.c  | 25 ++++++++++++-------------
 security/inode.c                | 11 +++++------
 11 files changed, 77 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 187a61091b5c..b4b357725be2 100644
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
index 0b8f8de7475a..6c6566d8bc17 100644
--- a/drivers/misc/cxl/api.c
+++ b/drivers/misc/cxl/api.c
@@ -32,8 +32,7 @@
=20
 #define CXL_PSEUDO_FS_MAGIC=090x1697697f
=20
-static int cxl_fs_cnt;
-static struct vfsmount *cxl_vfs_mount;
+static struct simple_fs cxl_fs;
=20
 static int cxl_fs_init_fs_context(struct fs_context *fc)
 {
@@ -51,7 +50,7 @@ static struct file_system_type cxl_fs_type =3D {
 void cxl_release_mapping(struct cxl_context *ctx)
 {
 =09if (ctx->kernelapi && ctx->mapping)
-=09=09simple_release_fs(&cxl_vfs_mount, &cxl_fs_cnt);
+=09=09simple_release_fs(&cxl_fs);
 }
=20
 static struct file *cxl_getfile(const char *name,
@@ -67,20 +66,20 @@ static struct file *cxl_getfile(const char *name,
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
@@ -92,7 +91,7 @@ static struct file *cxl_getfile(const char *name,
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
index 429f55651090..23afde0c6c0e 100644
--- a/drivers/scsi/cxlflash/ocxl_hw.c
+++ b/drivers/scsi/cxlflash/ocxl_hw.c
@@ -30,8 +30,7 @@
=20
 #define OCXLFLASH_FS_MAGIC      0x1697698f
=20
-static int ocxlflash_fs_cnt;
-static struct vfsmount *ocxlflash_vfs_mount;
+static struct simple_fs ocxlflash_fs;
=20
 static int ocxlflash_fs_init_fs_context(struct fs_context *fc)
 {
@@ -52,7 +51,7 @@ static struct file_system_type ocxlflash_fs_type =3D {
 static void ocxlflash_release_mapping(struct ocxlflash_context *ctx)
 {
 =09if (ctx->mapping)
-=09=09simple_release_fs(&ocxlflash_vfs_mount, &ocxlflash_fs_cnt);
+=09=09simple_release_fs(&ocxlflash_fs);
 =09ctx->mapping =3D NULL;
 }
=20
@@ -80,15 +79,14 @@ static struct file *ocxlflash_getfile(struct device *de=
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
@@ -96,7 +94,7 @@ static struct file *ocxlflash_getfile(struct device *dev,=
 const char *name,
 =09=09goto err3;
 =09}
=20
-=09file =3D alloc_file_pseudo(inode, ocxlflash_vfs_mount, name,
+=09file =3D alloc_file_pseudo(inode, ocxlflash_fs.mount, name,
 =09=09=09=09 flags & (O_ACCMODE | O_NONBLOCK), fops);
 =09if (IS_ERR(file)) {
 =09=09rc =3D PTR_ERR(file);
@@ -111,7 +109,7 @@ static struct file *ocxlflash_getfile(struct device *de=
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
index c764110f5f0b..475096a02a1a 100644
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
index 331c2f064f02..a671974f5b6f 100644
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
index 7b9fddced48f..ea54efc74c0d 100644
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
+    if (d_is_reg(victim))
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
diff --git a/fs/simplefs.c b/fs/simplefs.c
index 226d18963801..790d8beb9cc3 100644
--- a/fs/simplefs.c
+++ b/fs/simplefs.c
@@ -4,34 +4,34 @@
=20
 static DEFINE_SPINLOCK(pin_fs_lock);
=20
-int simple_pin_fs(struct file_system_type *type, struct vfsmount **mount, =
int *count)
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
diff --git a/fs/tracefs/inode.c b/fs/tracefs/inode.c
index 4353ca81e1d7..40ccfe737c3a 100644
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
diff --git a/include/linux/simplefs.h b/include/linux/simplefs.h
index 1076a44db308..18010414a16f 100644
--- a/include/linux/simplefs.h
+++ b/include/linux/simplefs.h
@@ -4,7 +4,12 @@
=20
 #include <linux/fs.h>
=20
-extern int simple_pin_fs(struct file_system_type *, struct vfsmount **moun=
t, int *count);
-extern void simple_release_fs(struct vfsmount **mount, int *count);
+struct simple_fs {
+=09struct vfsmount *mount;
+=09int count;
+};
+
+extern int simple_pin_fs(struct simple_fs *, struct file_system_type *);
+extern void simple_release_fs(struct simple_fs *);
=20
 #endif
diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.=
c
index d62d3fca47f2..75d70e6ba0a0 100644
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
index a9a9ee4de21d..0fcd03299e0d 100644
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

