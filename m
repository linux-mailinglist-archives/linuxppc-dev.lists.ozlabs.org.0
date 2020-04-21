Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB6E1B2A0C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 16:35:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4965hF0Jj8zDqwB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 00:35:25 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=WQqmQp1H; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=WQqmQp1H; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4964s40k59zDqVn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 23:57:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587477477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kmtwUC7V+MJ1MUJkO+8igv9Zdipw2p7Im+OneAOOFXw=;
 b=WQqmQp1HtBxxtrpHlZafYguVF2X3bkbYJ5sjzzwfdJzk3FgLp8EDvj1Bic0jP1L80tVdVy
 YiAmRaz4+8cQZrqKjtRfeu5Maet7VWRqdSiUVZtJkLP33Vlcfg3ZsOVtY9CBw8ytIMYe5L
 GC12v2O8jCf+IrgqFGBOrS5KI12A9y8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587477477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kmtwUC7V+MJ1MUJkO+8igv9Zdipw2p7Im+OneAOOFXw=;
 b=WQqmQp1HtBxxtrpHlZafYguVF2X3bkbYJ5sjzzwfdJzk3FgLp8EDvj1Bic0jP1L80tVdVy
 YiAmRaz4+8cQZrqKjtRfeu5Maet7VWRqdSiUVZtJkLP33Vlcfg3ZsOVtY9CBw8ytIMYe5L
 GC12v2O8jCf+IrgqFGBOrS5KI12A9y8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-oLr1DmOcPxitSBTT78H4ZQ-1; Tue, 21 Apr 2020 09:57:53 -0400
X-MC-Unique: oLr1DmOcPxitSBTT78H4ZQ-1
Received: by mail-wr1-f70.google.com with SMTP id g7so6631768wrw.18
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 06:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xjaOnzI5gdueJ0y4sy2VdCpkInG/pM8xAJAe7M5MwVA=;
 b=IJaZYZO4W6p56B/ApTjwr3BmBqzFLOgOPWduG+iZx2zKixSSMeK8GrhpbcD6htJFzu
 kinQGhC4cFFlUZRYk2HFWVi/w47WzXH/ogIHxElZODjhPiVQ8T+EXjAHb5BawFQQfzP6
 2e7DvliUyWEJYAkwzVOXsDTm1iHVVYC2bO/of2j8MHbwkkqWmVony2tEXp0yyxAvhKCw
 hDtEpimwad3vUDvkw3PuDkezbWqNuStts54FSBNKm7rIrsi+psTA/y3+j/p8raULOWAN
 yvgWxLptNoS8oNK7WABQLKZrE+W04BrQxxXdf7Es0NkMiAXygM8abYuHjaxP++DDb8rj
 0YrQ==
X-Gm-Message-State: AGi0PuaOX1+uBdG6JmgMSiF5//8I29bCbe9pV5vkz2xLSHGVc2JbByWc
 XPUhgd/Jqe0k4Gq/kacj1s6Tv02rJib+VkfSnz27DLB7VZzYDYOYkR0bJdNPKrDQuoeJpB09sop
 NQK5BrR3hGrR2tyr61G9nfY1WRA==
X-Received: by 2002:a1c:9c0a:: with SMTP id f10mr5022050wme.139.1587477472393; 
 Tue, 21 Apr 2020 06:57:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypIlG2viM+l0EuPG6wic3zBlhrKU/He9H0puv0ur4Y4UIWdpPnCyTzA3FMh8mbZkb38/fp+4ZQ==
X-Received: by 2002:a1c:9c0a:: with SMTP id f10mr5022031wme.139.1587477472153; 
 Tue, 21 Apr 2020 06:57:52 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.194])
 by smtp.gmail.com with ESMTPSA id f23sm3562989wml.4.2020.04.21.06.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:57:51 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 6/7] debugfs: switch to simplefs inode creation API
Date: Tue, 21 Apr 2020 15:57:40 +0200
Message-Id: <20200421135741.30657-4-eesposit@redhat.com>
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

The only difference, compared to the pre-existing code, is that symlink
creation now triggers fsnotify_create.  This was a bug in the debugfs
code, since for example vfs_symlink does call fsnotify_create.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 fs/debugfs/inode.c | 144 +++++----------------------------------------
 1 file changed, 15 insertions(+), 129 deletions(-)

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index 5dbb74a23e7c..ccbeea9e5f6c 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -305,68 +305,6 @@ struct dentry *debugfs_lookup(const char *name, struct=
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
@@ -375,32 +313,17 @@ static struct dentry *__debugfs_create_file(const cha=
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
-=09inode =3D debugfs_get_inode(dentry->d_sb);
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
@@ -533,29 +456,16 @@ EXPORT_SYMBOL_GPL(debugfs_create_file_size);
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
-=09inode =3D debugfs_get_inode(dentry->d_sb);
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
@@ -575,29 +485,19 @@ struct dentry *debugfs_create_automount(const char *n=
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
-=09inode =3D debugfs_get_inode(dentry->d_sb);
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
@@ -629,28 +529,14 @@ struct dentry *debugfs_create_symlink(const char *nam=
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
-=09inode =3D debugfs_get_inode(dentry->d_sb);
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

