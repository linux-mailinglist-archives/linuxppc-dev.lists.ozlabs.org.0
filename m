Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 715A21B29AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 16:30:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4965ZM341KzDqwW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 00:30:19 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=gLP3Bnsp; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=gLP3Bnsp; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4964s24sdczDqgD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 23:57:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587477475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TbNa5ZvjHBFhsrg6AbcWxyfvJayeZrwXmv/m3eCQCMk=;
 b=gLP3BnspF4GOrNzSqBWADcgxMxbMqMcM94eYtXEbr33wWP1mGEZxpU1wmV9bOdnDhHZhRY
 kMISWdpxdweAbCkuol1w4ysP28utxho4tofW0EH2OrcHD0mUtiEpQ3xUmGgNFysRCclm03
 0cPo2mhsHymejgnIjygzl0FWffLYsAA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587477475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TbNa5ZvjHBFhsrg6AbcWxyfvJayeZrwXmv/m3eCQCMk=;
 b=gLP3BnspF4GOrNzSqBWADcgxMxbMqMcM94eYtXEbr33wWP1mGEZxpU1wmV9bOdnDhHZhRY
 kMISWdpxdweAbCkuol1w4ysP28utxho4tofW0EH2OrcHD0mUtiEpQ3xUmGgNFysRCclm03
 0cPo2mhsHymejgnIjygzl0FWffLYsAA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-2DU2LUKqMs2EQIUcsU807A-1; Tue, 21 Apr 2020 09:57:51 -0400
X-MC-Unique: 2DU2LUKqMs2EQIUcsU807A-1
Received: by mail-wm1-f69.google.com with SMTP id 71so1398286wmb.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 06:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7IIEigFH4euYLZFcVPE/gY3sCMVw531UeBsz7uQYoxI=;
 b=XmFW98Vg7DpV52Qns1HghGgsAZq/PNWU6DLMdjk+a+mDMIARKLLVqs/jATn5rZ0R5j
 RmjitI2F9X3azTrHvJMJktH52OcpVbK4CcXLeBhhJWMPz8QuVbtet5CQ/0LLyMBUxiKV
 VtmYp4jQZyQa0KRf4e/p01qYVm/B/ITwkANj5rciw2uIJvDteufMw+GtGBJkFYF68pV0
 Q1qQQjO5dgNVopk//E9FXtyNbLzogNgzk0PKKvhjRHSoxY/4fhlAH8BKb2tAWVkiDAie
 3ab8QG8LKwi8ybaw7Mc+RKxpsJheL3oVlGUP5VImPZWIUZLmcH6Aszv9QuCa8SubMBcG
 BC9Q==
X-Gm-Message-State: AGi0Pua8es607m9pIN+P+sZdR87eT5UOW8QKNCqkTTq5FQQSIQQkQZ4S
 RI+P+lHZ8OC1+xB7I2utrpthC9K3M8vkLk36YCuH280CadJ6QtxtvDJuWc8BGVA831Mf493WwHa
 1eSSyTp1FSpDuy4u8YkvkHjNBeg==
X-Received: by 2002:a5d:4381:: with SMTP id i1mr23602727wrq.194.1587477470578; 
 Tue, 21 Apr 2020 06:57:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypLt+rusb9oWs62pfY+dvFUY9ArCxclByAUD1+dJnv6mqI25nq4oBzy1Rmpsj/zgn97n7WVQFg==
X-Received: by 2002:a5d:4381:: with SMTP id i1mr23602701wrq.194.1587477470222; 
 Tue, 21 Apr 2020 06:57:50 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.194])
 by smtp.gmail.com with ESMTPSA id f23sm3562989wml.4.2020.04.21.06.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:57:49 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 5/7] libfs: add file creation functions
Date: Tue, 21 Apr 2020 15:57:39 +0200
Message-Id: <20200421135741.30657-3-eesposit@redhat.com>
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

A bunch of code is duplicated between debugfs and tracefs, unify it to the
libfs library.

The code is very similar, except that dentry and inode creation are unified
into a single function (unlike start_creating in debugfs and tracefs, which
only takes care of dentries).  This adds an output parameter to the
creation functions, but pushes all error recovery into fs/libfs.c.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 fs/libfs.c         | 226 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  18 ++++
 2 files changed, 244 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index 5c76e4c648dc..90b0c221d9a2 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -751,6 +751,232 @@ struct inode *simple_alloc_anon_inode(struct simple_f=
s *fs)
 }
 EXPORT_SYMBOL(simple_alloc_anon_inode);
=20
+static struct dentry *failed_creating(struct simple_fs *fs, struct dentry =
*dentry)
+{
+=09inode_unlock(d_inode(dentry->d_parent));
+=09dput(dentry);
+=09simple_release_fs(fs);
+=09return ERR_PTR(-ENOMEM);
+}
+
+/**
+ * simplefs_create_dentry - creates a new dentry and inode
+ * @fs: a pointer to a struct simple_fs containing the reference counter
+ *      and vfs_mount pointer
+ * @type: the fs type
+ * @name: dentry name
+ * @parent: parent dentry. If this parameter is NULL,
+ *          then the dentry will be created in the root of the
+ *          filesystem.
+ * @inode: pointer that will contain a newly created inode
+ *
+ * This function returns a new dentry, or NULL on error.  On success, a
+ * new inode is created and stored into @inode.  Also note that the inode
+ * for the parent directory is locked by simplefs_create_dentry(),
+ * and will be unlocked by simple_finish_dentry().
+ **/
+struct dentry *simplefs_create_dentry(struct simple_fs *fs, struct file_sy=
stem_type *type,
+=09=09=09=09      const char *name, struct dentry *parent,
+=09=09=09=09      struct inode **inode)
+{
+=09struct dentry *dentry;
+=09int error;
+
+=09pr_debug("creating file '%s'\n", name);
+
+=09if (IS_ERR(parent))
+=09=09return parent;
+
+=09error =3D simple_pin_fs(fs, type);
+=09if (error) {
+=09=09pr_err("Unable to pin filesystem for file '%s'\n", name);
+=09=09return ERR_PTR(error);
+=09}
+
+=09/* If the parent is not specified, we create it in the root.
+=09 * We need the root dentry to do this, which is in the super
+=09 * block. A pointer to that is in the struct vfsmount that we
+=09 * have around.
+=09 */
+=09if (!parent)
+=09=09parent =3D fs->mount->mnt_root;
+
+=09inode_lock(d_inode(parent));
+=09dentry =3D lookup_one_len(name, parent, strlen(name));
+=09if (!IS_ERR(dentry) && d_really_is_positive(dentry)) {
+=09=09if (d_is_dir(dentry))
+=09=09=09pr_err("Directory '%s' with parent '%s' already present!\n",
+=09=09=09       name, parent->d_name.name);
+=09=09else
+=09=09=09pr_err("File '%s' in directory '%s' already present!\n",
+=09=09=09       name, parent->d_name.name);
+=09=09dput(dentry);
+=09=09dentry =3D ERR_PTR(-EEXIST);
+=09}
+
+=09if (IS_ERR(dentry)) {
+=09=09inode_unlock(d_inode(parent));
+=09=09simple_release_fs(fs);
+=09}
+
+
+=09if (IS_ERR(dentry))
+=09=09return dentry;
+
+=09*inode =3D new_inode_current_time(fs->mount->mnt_sb);
+=09if (unlikely(!(*inode))) {
+=09=09pr_err("out of free inodes, can not create file '%s'\n",
+=09=09       name);
+=09=09return failed_creating(fs, dentry);
+=09}
+
+=09return dentry;
+}
+EXPORT_SYMBOL(simplefs_create_dentry);
+
+/**
+ * simplefs_create_file - creates a new file dentry and inode
+ * @fs: a pointer to a struct simple_fs containing the reference counter
+ *      and vfs_mount pointer
+ * @type: the fs type
+ * @name: file name
+ * @mode: file mode
+ * @parent: parent dentry. If this parameter is NULL,
+ *          then the file will be created in the root of the
+ *          filesystem.
+ * @data: what will the file contain
+ * @inode: pointer that will contain a newly created inode
+ *
+ * This function returns a new dentry, or NULL on error.  On success, a
+ * new inode is created and stored into @inode.  Also note that the inode
+ * for the parent directory is locked by simplefs_create_dentry(),
+ * and will be unlocked by simple_finish_dentry().
+ **/
+struct dentry *simplefs_create_file(struct simple_fs *fs, struct file_syst=
em_type *type,
+=09=09=09=09    const char *name, umode_t mode,
+=09=09=09=09    struct dentry *parent, void *data,
+=09=09=09=09    struct inode **inode)
+{
+=09struct dentry *dentry;
+
+=09WARN_ON((mode & S_IFMT) && !S_ISREG(mode));
+=09mode |=3D S_IFREG;
+
+=09dentry =3D simplefs_create_dentry(fs, type, name, parent, inode);
+
+=09if (IS_ERR(dentry))
+=09=09return dentry;
+
+=09(*inode)->i_mode =3D mode;
+=09(*inode)->i_private =3D data;
+
+=09return dentry;
+}
+EXPORT_SYMBOL(simplefs_create_file);
+
+
+/**
+ * simplefs_finish_dentry- complete creation of a new dentry
+ * @dentry: the dentry being created
+ * @inode: the inode associated to the dentry
+ *
+ * This function completes the creation of a dentry.
+ * This includes associating @inode with the dentry, ensuring the link
+ * counts are consistent and informing fsnotify.
+ **/
+struct dentry *simplefs_finish_dentry(struct dentry *dentry, struct inode =
*inode)
+{
+=09d_instantiate(dentry, inode);
+=09if (S_ISDIR(inode->i_mode)) {
+=09=09inc_nlink(d_inode(dentry->d_parent));
+=09=09fsnotify_mkdir(d_inode(dentry->d_parent), dentry);
+=09} else {
+=09=09fsnotify_create(d_inode(dentry->d_parent), dentry);
+=09}
+=09inode_unlock(d_inode(dentry->d_parent));
+=09return dentry;
+}
+EXPORT_SYMBOL(simplefs_finish_dentry);
+
+/**
+ * simplefs_create_dir - creates a new directory dentry and inode
+ * @fs: a pointer to a struct simple_fs containing the reference counter
+ *      and vfs_mount pointer
+ * @type: the fs type
+ * @name: dir name
+ * @mode: dir mode
+ * @parent: parent dentry. If this parameter is NULL,
+ *          then the directory will be created in the root of the
+ *          filesystem.
+ * @inode: pointer that will contain a newly created inode
+ *
+ * This function returns a new dentry, or NULL on error.  On success, a
+ * new inode is created and stored into @inode.  Also note that the inode
+ * for the parent directory is locked by simplefs_create_dentry(),
+ * and will be unlocked by simple_finish_dentry().
+ **/
+struct dentry *simplefs_create_dir(struct simple_fs *fs, struct file_syste=
m_type *type,
+=09=09=09=09   const char *name, umode_t mode, struct dentry *parent,
+=09=09=09=09   struct inode **inode)
+{
+=09struct dentry *dentry;
+
+=09WARN_ON((mode & S_IFMT) && !S_ISDIR(mode));
+=09mode |=3D S_IFDIR;
+
+=09dentry =3D simplefs_create_dentry(fs, type, name, parent, inode);
+=09if (IS_ERR(dentry))
+=09=09return dentry;
+
+=09(*inode)->i_mode =3D mode;
+=09(*inode)->i_op =3D &simple_dir_inode_operations;
+=09(*inode)->i_fop =3D &simple_dir_operations;
+
+=09/* directory inodes start off with i_nlink =3D=3D 2 (for "." entry) */
+=09inc_nlink(*inode);
+=09return dentry;
+}
+EXPORT_SYMBOL(simplefs_create_dir);
+
+/**
+ * simplefs_create_symlink - creates a new symlink dentry and inode
+ * @fs: a pointer to a struct simple_fs containing the reference counter
+ *      and vfs_mount pointer
+ * @type: the fs type
+ * @name: symlink name
+ * @parent: parent dentry. If this parameter is NULL,
+ *          then the symbolic link will be created in the root of the
+ *          filesystem.
+ * @inode: pointer that will contain a newly created inode
+ *
+ * This function returns a new dentry, or NULL on error.  On success, a
+ * new inode is created and stored into @inode.  Also note that the inode
+ * for the parent directory is locked by simplefs_create_dentry(),
+ * and will be unlocked by simple_finish_dentry().
+ **/
+struct dentry *simplefs_create_symlink(struct simple_fs *fs, struct file_s=
ystem_type *type,
+=09=09=09=09       const char *name, struct dentry *parent,
+=09=09=09=09       const char *target, struct inode **inode)
+{
+=09struct dentry *dentry;
+=09char *link =3D kstrdup(target, GFP_KERNEL);
+
+=09if (!link)
+=09=09return ERR_PTR(-ENOMEM);
+
+=09dentry =3D simplefs_create_dentry(fs, type, name, parent, inode);
+=09if (IS_ERR(dentry)) {
+=09=09kfree_link(link);
+=09=09return dentry;
+=09}
+
+=09(*inode)->i_mode =3D S_IFLNK | S_IRWXUGO;
+=09(*inode)->i_link =3D link;
+=09(*inode)->i_op =3D &simple_symlink_inode_operations;
+=09return dentry;
+}
+EXPORT_SYMBOL(simplefs_create_symlink);
+
 /**
  * simple_read_from_buffer - copy data from the buffer to user space
  * @to: the user space buffer to read to
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 5e93de72118b..0569540fbe61 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3375,6 +3375,24 @@ extern void simple_release_fs(struct simple_fs *);
=20
 extern struct inode *simple_alloc_anon_inode(struct simple_fs *fs);
=20
+extern struct dentry *simplefs_create_dentry(struct simple_fs *fs,
+=09=09=09=09=09     struct file_system_type *type,
+=09=09=09=09=09     const char *name, struct dentry *parent,
+=09=09=09=09=09     struct inode **inode);
+struct dentry *simplefs_finish_dentry(struct dentry *dentry, struct inode =
*inode);
+
+extern struct dentry *simplefs_create_file(struct simple_fs *fs,
+=09=09=09=09=09   struct file_system_type *type,
+=09=09=09=09=09   const char *name, umode_t mode,
+=09=09=09=09=09   struct dentry *parent, void *data,
+=09=09=09=09=09   struct inode **inode);
+extern struct dentry *simplefs_create_dir(struct simple_fs *fs, struct fil=
e_system_type *type,
+=09=09=09=09=09  const char *name, umode_t mode, struct dentry *parent,
+=09=09=09=09=09  struct inode **inode);
+extern struct dentry *simplefs_create_symlink(struct simple_fs *fs, struct=
 file_system_type *type,
+=09=09=09=09=09      const char *name, struct dentry *parent,
+=09=09=09=09=09      const char *target, struct inode **inode);
+
 extern ssize_t simple_read_from_buffer(void __user *to, size_t count,
 =09=09=09loff_t *ppos, const void *from, size_t available);
 extern ssize_t simple_write_to_buffer(void *to, size_t available, loff_t *=
ppos,
--=20
2.25.2

