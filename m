Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F19F11A7D3F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 15:22:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491mP26jkTzDqbB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 23:22:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=T9XOagZZ; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491lYT4xdHzDqZQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 22:44:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586868266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fZ6xsK3V0N91Fk8iBgZd6BgXsfySMhIjcPWAROHMn1Y=;
 b=T9XOagZZ9qqTvd5vZu43LN2CyGB+XARX1831qR/1OxiwHY4btCe+4FHJ9ujYlpXMmJTwfR
 s4qKwB73o8Kcw92yLVF4yKIVJrI3jPGlLfhXLDyE0FfyM3tmu7pKjVPXqFiziZtmEMuN4t
 nuGJ/48CkvpYn97g8C8o167XxaJKThg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-6obAIY5PPkOVLj0CpobG4Q-1; Tue, 14 Apr 2020 08:44:25 -0400
X-MC-Unique: 6obAIY5PPkOVLj0CpobG4Q-1
Received: by mail-wr1-f69.google.com with SMTP id r11so7566391wrx.21
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 05:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=41gcpXPXsxw0iFMzm+k+g/C6jCPBlhyC8+dVJ9Pc1fA=;
 b=pmjC/corQeBb3NqpuSAIUR8WCCItsanqgrzfWib6J6+3GJ68OlE0dkV6AjnsQz17Za
 AKgQEWCf/5c3n9WlUUtJGiNPjiue+gcmWSXQno4qCiNSKoMSFOTS/WAKsvqwcfpF27gs
 0w3kdCrpoqxx87zOMh9YroziyNFC+BCThahjaVZqQt6RnmS6NjLBq9epJpdO0GY6EX1n
 U59v0jPxYh3ZiUiOTC2SDUFjFjw5vaqS6JUSx4k/TVGBOl2LNnm55QuErr7r1XJ25BKf
 T+eZ67lqyQlkHsDBGzVksWlgDqjqp/rM3Ym/gdmEJTehHeVbfosEMXjMJXrppE5081WQ
 WKAA==
X-Gm-Message-State: AGi0PuYwvTFU9uX4B9Ypio50aX7ksgu2rO6RlV7MyfNUxmqJwjwSFgAF
 8QZtAt8UYM+osnqgwtQidJOA9ew/xn0eyUZkzmNxotge9+UdmPmoGl4SVHGzKZy/1o6fwZkpAzY
 N4xtS7MfvN0Y4mV/DNDWCP75c8g==
X-Received: by 2002:a1c:147:: with SMTP id 68mr24229390wmb.28.1586868264250;
 Tue, 14 Apr 2020 05:44:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypLG15Rdex4MNDkfLSgxNLw13YiMYBHA340JgiTMak7ycYuMs+tWPpamut6Uc41GnMvfLqOpAg==
X-Received: by 2002:a1c:147:: with SMTP id 68mr24229312wmb.28.1586868263915;
 Tue, 14 Apr 2020 05:44:23 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.210])
 by smtp.gmail.com with ESMTPSA id m14sm16948816wrs.76.2020.04.14.05.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:44:23 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-nfs@vger.kernel.org
Subject: [PATCH 7/8] debugfs: switch to simplefs inode creation API
Date: Tue, 14 Apr 2020 14:43:01 +0200
Message-Id: <20200414124304.4470-8-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200414124304.4470-1-eesposit@redhat.com>
References: <20200414124304.4470-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 14 Apr 2020 22:51:51 +1000
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

The only difference, compared to the pre-existing code, is that symlink
creation now triggers fsnotify_create.  This was a bug in the debugfs
code, since for example vfs_symlink does call fsnotify_create.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 fs/debugfs/inode.c | 144 +++++----------------------------------------
 1 file changed, 15 insertions(+), 129 deletions(-)

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index 834b5872ca0d..7a2369373b85 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -294,68 +294,6 @@ struct dentry *debugfs_lookup(const char *name, struct=
 dentry *parent)
 }
 EXPORT_SYMBOL_GPL(debugfs_lookup);
=20
-static struct dentry *start_creating(const char *name, struct dentry *pare=
nt)
-{
-=09struct dentry *dentry;
-=09int error;
-
-=09pr_debug("creating file '%s'\n", name);
-
-=09if (IS_ERR(parent))
-=09=09return parent;
-
-=09error =3D simple_pin_fs(&debugfs, &debug_fs_type);
-=09if (error) {
-=09=09pr_err("Unable to pin filesystem for file '%s'\n", name);
-=09=09return ERR_PTR(error);
-=09}
-
-=09/* If the parent is not specified, we create it in the root.
-=09 * We need the root dentry to do this, which is in the super
-=09 * block. A pointer to that is in the struct vfsmount that we
-=09 * have around.
-=09 */
-=09if (!parent)
-=09=09parent =3D debugfs.mount->mnt_root;
-
-=09inode_lock(d_inode(parent));
-=09if (unlikely(IS_DEADDIR(d_inode(parent))))
-=09=09dentry =3D ERR_PTR(-ENOENT);
-=09else
-=09=09dentry =3D lookup_one_len(name, parent, strlen(name));
-=09if (!IS_ERR(dentry) && d_really_is_positive(dentry)) {
-=09=09if (d_is_dir(dentry))
-=09=09=09pr_err("Directory '%s' with parent '%s' already present!\n",
-=09=09=09       name, parent->d_name.name);
-=09=09else
-=09=09=09pr_err("File '%s' in directory '%s' already present!\n",
-=09=09=09       name, parent->d_name.name);
-=09=09dput(dentry);
-=09=09dentry =3D ERR_PTR(-EEXIST);
-=09}
-
-=09if (IS_ERR(dentry)) {
-=09=09inode_unlock(d_inode(parent));
-=09=09simple_release_fs(&debugfs);
-=09}
-
-=09return dentry;
-}
-
-static struct dentry *failed_creating(struct dentry *dentry)
-{
-=09inode_unlock(d_inode(dentry->d_parent));
-=09dput(dentry);
-=09simple_release_fs(&debugfs);
-=09return ERR_PTR(-ENOMEM);
-}
-
-static struct dentry *end_creating(struct dentry *dentry)
-{
-=09inode_unlock(d_inode(dentry->d_parent));
-=09return dentry;
-}
-
 static struct dentry *__debugfs_create_file(const char *name, umode_t mode=
,
 =09=09=09=09struct dentry *parent, void *data,
 =09=09=09=09const struct file_operations *proxy_fops,
@@ -364,32 +302,17 @@ static struct dentry *__debugfs_create_file(const cha=
r *name, umode_t mode,
 =09struct dentry *dentry;
 =09struct inode *inode;
=20
-=09if (!(mode & S_IFMT))
-=09=09mode |=3D S_IFREG;
-=09BUG_ON(!S_ISREG(mode));
-=09dentry =3D start_creating(name, parent);
-
+=09dentry =3D simplefs_create_file(&debugfs, &debug_fs_type,
+=09=09=09=09      name, mode, parent, data, &inode);
 =09if (IS_ERR(dentry))
 =09=09return dentry;
=20
-=09inode =3D simple_new_inode(dentry->d_sb);
-=09if (unlikely(!inode)) {
-=09=09pr_err("out of free dentries, can not create file '%s'\n",
-=09=09       name);
-=09=09return failed_creating(dentry);
-=09}
-
-=09inode->i_mode =3D mode;
-=09inode->i_private =3D data;
-
 =09inode->i_op =3D &debugfs_file_inode_operations;
 =09inode->i_fop =3D proxy_fops;
 =09dentry->d_fsdata =3D (void *)((unsigned long)real_fops |
 =09=09=09=09DEBUGFS_FSDATA_IS_REAL_FOPS_BIT);
=20
-=09d_instantiate(dentry, inode);
-=09fsnotify_create(d_inode(dentry->d_parent), dentry);
-=09return end_creating(dentry);
+=09return simplefs_finish_dentry(dentry, inode);
 }
=20
 /**
@@ -522,29 +445,16 @@ EXPORT_SYMBOL_GPL(debugfs_create_file_size);
  */
 struct dentry *debugfs_create_dir(const char *name, struct dentry *parent)
 {
-=09struct dentry *dentry =3D start_creating(name, parent);
+=09struct dentry *dentry;
 =09struct inode *inode;
=20
+=09dentry =3D simplefs_create_dir(&debugfs, &debug_fs_type,
+=09=09=09=09     name, 0755, parent, &inode);
 =09if (IS_ERR(dentry))
 =09=09return dentry;
=20
-=09inode =3D simple_new_inode(dentry->d_sb);
-=09if (unlikely(!inode)) {
-=09=09pr_err("out of free dentries, can not create directory '%s'\n",
-=09=09       name);
-=09=09return failed_creating(dentry);
-=09}
-
-=09inode->i_mode =3D S_IFDIR | S_IRWXU | S_IRUGO | S_IXUGO;
 =09inode->i_op =3D &debugfs_dir_inode_operations;
-=09inode->i_fop =3D &simple_dir_operations;
-
-=09/* directory inodes start off with i_nlink =3D=3D 2 (for "." entry) */
-=09inc_nlink(inode);
-=09d_instantiate(dentry, inode);
-=09inc_nlink(d_inode(dentry->d_parent));
-=09fsnotify_mkdir(d_inode(dentry->d_parent), dentry);
-=09return end_creating(dentry);
+=09return simplefs_finish_dentry(dentry, inode);
 }
 EXPORT_SYMBOL_GPL(debugfs_create_dir);
=20
@@ -564,29 +474,19 @@ struct dentry *debugfs_create_automount(const char *n=
ame,
 =09=09=09=09=09debugfs_automount_t f,
 =09=09=09=09=09void *data)
 {
-=09struct dentry *dentry =3D start_creating(name, parent);
+=09struct dentry *dentry;
 =09struct inode *inode;
=20
+=09dentry =3D simplefs_create_dentry(&debugfs, &debug_fs_type, name, paren=
t,
+=09=09=09=09=09&inode);
 =09if (IS_ERR(dentry))
 =09=09return dentry;
=20
-=09inode =3D simple_new_inode(dentry->d_sb);
-=09if (unlikely(!inode)) {
-=09=09pr_err("out of free dentries, can not create automount '%s'\n",
-=09=09       name);
-=09=09return failed_creating(dentry);
-=09}
-
 =09make_empty_dir_inode(inode);
 =09inode->i_flags |=3D S_AUTOMOUNT;
 =09inode->i_private =3D data;
 =09dentry->d_fsdata =3D (void *)f;
-=09/* directory inodes start off with i_nlink =3D=3D 2 (for "." entry) */
-=09inc_nlink(inode);
-=09d_instantiate(dentry, inode);
-=09inc_nlink(d_inode(dentry->d_parent));
-=09fsnotify_mkdir(d_inode(dentry->d_parent), dentry);
-=09return end_creating(dentry);
+=09return simplefs_finish_dentry(dentry, inode);
 }
 EXPORT_SYMBOL(debugfs_create_automount);
=20
@@ -618,28 +518,14 @@ struct dentry *debugfs_create_symlink(const char *nam=
e, struct dentry *parent,
 {
 =09struct dentry *dentry;
 =09struct inode *inode;
-=09char *link =3D kstrdup(target, GFP_KERNEL);
-=09if (!link)
-=09=09return ERR_PTR(-ENOMEM);
=20
-=09dentry =3D start_creating(name, parent);
-=09if (IS_ERR(dentry)) {
-=09=09kfree(link);
+=09dentry =3D simplefs_create_symlink(&debugfs, &debug_fs_type,
+=09=09=09=09=09 name, parent, target, &inode);
+=09if (IS_ERR(dentry))
 =09=09return dentry;
-=09}
=20
-=09inode =3D simple_new_inode(dentry->d_sb);
-=09if (unlikely(!inode)) {
-=09=09pr_err("out of free dentries, can not create symlink '%s'\n",
-=09=09       name);
-=09=09kfree(link);
-=09=09return failed_creating(dentry);
-=09}
-=09inode->i_mode =3D S_IFLNK | S_IRWXUGO;
 =09inode->i_op =3D &debugfs_symlink_inode_operations;
-=09inode->i_link =3D link;
-=09d_instantiate(dentry, inode);
-=09return end_creating(dentry);
+=09return simplefs_finish_dentry(dentry, inode);
 }
 EXPORT_SYMBOL_GPL(debugfs_create_symlink);
=20
--=20
2.25.2

