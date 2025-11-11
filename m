Return-Path: <linuxppc-dev+bounces-14041-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AECC4BC7A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 07:57:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5HP05ppyz3dW7;
	Tue, 11 Nov 2025 17:55:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762844148;
	cv=none; b=BrkSitkrCKsOLb7aYv6YDIW2BmilIDFShWjSP88Apt0iAVyImHgd9N3neMWTI40PZmDmqyjBR8FK/1T+ODqVH1DpAN4dRwpZITszbCl6+EurwR4OmKrKtarzGBWQT2vmcXXcwOA2vNsV2R8yLqdsu8zQljcivxBaFwp/aJmuN4OWbjHSW83UkfK3oLItz5jvBdwb03YHsRb1xw8EGlGG6B00U4g9NMux3nseqVCvaVMcxTk807pgBJ7O8cmVius9ohcUp5SELB2jkTxO2VtQOjyEgFHmjfApLO8iTnHkPYL3a+bvRy0aHYz08NQtfwYYZr2cX9rqalKA4m2SZp9dmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762844148; c=relaxed/relaxed;
	bh=Swq0voO+aKDUTzOh35qGY7dyE9PZZpqvfSqrFdp+4zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CzzlGFNkslJbVlYPglEbOAejoDtki+3OeECwWFsWEYJvnhfoygwm7f2fy15yfzElOQxCIvvhm4vCcLP0N/ISgwCRTXHbdNjXF+nYWk5+occiUQR0sgF0r4x5XhGgYJ25aLaNfgpgbPw0eZCj5vEXUdDLXt2mxbgfGqmAO2dD/D662RJRHMwZKl0mgmJ8WcoLIMYVBj4E5n5wn7RAes8BtcVGtQ/mnT4FOuOs+K0iQL2rUumbroFxj92FmkyYwpiZUocXb427gsCboxR5i7CAuiMy+tscDStudiOZPPCTPOsIYIYHui4p5r6XdhTZ0B3N2Rwftp6pXysFG0HRY7wqfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=hM6msKPS; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=hM6msKPS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5HNt2tLqz3060
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 17:55:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Swq0voO+aKDUTzOh35qGY7dyE9PZZpqvfSqrFdp+4zM=; b=hM6msKPSIkdjC0WuzKYvaQi8y8
	SMuoUsmVVskXl3viTWYdFMHDSs8cfuh8pOhMNc5KX4MsBtLI1gAxDkLn1mZ/iWpVkcIQJV0ThCVZ7
	22fj9roVqJ4E9onmNfDu4LvkO58PJBbm9Hz02mcX43J/Lo/SwpbUieAaCU2FrVmktHXwyF5uszsU7
	O3VsQ5TYfXnLP4aVqxvjJyrTyrP6WhsIjlAUGUHmQ2uT32yLmdkhwpy0mttsq3V733OXEC2Xl/nww
	0zp3NYPnTyNY12tOtir+MEyRwQDaZSghmv619Rpla3YEUAQnn/G3sSXKhTygu/EatNxfEEtcgC6Wn
	d0e4bw0Q==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiHi-0000000BwxV-2gUL;
	Tue, 11 Nov 2025 06:55:22 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-fsdevel@vger.kernel.org
Cc: torvalds@linux-foundation.org,
	brauner@kernel.org,
	jack@suse.cz,
	raven@themaw.net,
	miklos@szeredi.hu,
	neil@brown.name,
	a.hindborg@kernel.org,
	linux-mm@kvack.org,
	linux-efi@vger.kernel.org,
	ocfs2-devel@lists.linux.dev,
	kees@kernel.org,
	rostedt@goodmis.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	paul@paul-moore.com,
	casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org,
	john.johansen@canonical.com,
	selinux@vger.kernel.org,
	borntraeger@linux.ibm.com,
	bpf@vger.kernel.org
Subject: [PATCH v3 08/50] convert ramfs and tmpfs
Date: Tue, 11 Nov 2025 06:54:37 +0000
Message-ID: <20251111065520.2847791-9-viro@zeniv.linux.org.uk>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251111065520.2847791-1-viro@zeniv.linux.org.uk>
References: <20251111065520.2847791-1-viro@zeniv.linux.org.uk>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Quite a bit is already done by infrastructure changes (simple_link(),
simple_unlink()) - all that is left is replacing d_instantiate() +
pinning dget() (in ->symlink() and ->mknod()) with d_make_persistent(),
and, in case of shmem, using simple_unlink() and simple_link() in
->unlink() and ->link() resp., instead of open-coding those there.
Since d_make_persistent() accepts (and hashes) unhashed ones, shmem
situation gets simpler - we no longer care whether ->lookup() has hashed
the sucker.

With that done, we don't need kill_litter_super() for these filesystems
anymore - by the umount time all remaining dentries will be marked
persistent and kill_litter_super() will boil down to call of
kill_anon_super().

The same goes for devtmpfs and rootfs - they are handled by
ramfs or by shmem, depending upon config.

NB: strictly speaking, both devtmpfs and rootfs ought to use
ramfs_kill_sb() if they end up using ramfs; that's a separate
story and the only impact of "just use kill_{litter,anon}_super()"
is that we fail to free their sb->s_fs_info... on reboot.
That's orthogonal to the changes in this series - kill_litter_super()
is identical to kill_anon_super() for those at this point.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 drivers/base/devtmpfs.c |  2 +-
 fs/ramfs/inode.c        |  8 +++-----
 init/do_mounts.c        |  2 +-
 mm/shmem.c              | 38 ++++++++------------------------------
 4 files changed, 13 insertions(+), 37 deletions(-)

diff --git a/drivers/base/devtmpfs.c b/drivers/base/devtmpfs.c
index 9d4e46ad8352..a63b0ff0c432 100644
--- a/drivers/base/devtmpfs.c
+++ b/drivers/base/devtmpfs.c
@@ -70,7 +70,7 @@ static struct file_system_type internal_fs_type = {
 #else
 	.init_fs_context = ramfs_init_fs_context,
 #endif
-	.kill_sb = kill_litter_super,
+	.kill_sb = kill_anon_super,
 };
 
 /* Simply take a ref on the existing mount */
diff --git a/fs/ramfs/inode.c b/fs/ramfs/inode.c
index 41f9995da7ca..505d10a0cb36 100644
--- a/fs/ramfs/inode.c
+++ b/fs/ramfs/inode.c
@@ -110,8 +110,7 @@ ramfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 			goto out;
 		}
 
-		d_instantiate(dentry, inode);
-		dget(dentry);	/* Extra count - pin the dentry in core */
+		d_make_persistent(dentry, inode);
 		error = 0;
 		inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
 	}
@@ -154,8 +153,7 @@ static int ramfs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 
 		error = page_symlink(inode, symname, l);
 		if (!error) {
-			d_instantiate(dentry, inode);
-			dget(dentry);
+			d_make_persistent(dentry, inode);
 			inode_set_mtime_to_ts(dir,
 					      inode_set_ctime_current(dir));
 		} else
@@ -313,7 +311,7 @@ int ramfs_init_fs_context(struct fs_context *fc)
 void ramfs_kill_sb(struct super_block *sb)
 {
 	kfree(sb->s_fs_info);
-	kill_litter_super(sb);
+	kill_anon_super(sb);
 }
 
 static struct file_system_type ramfs_fs_type = {
diff --git a/init/do_mounts.c b/init/do_mounts.c
index 6af29da8889e..810878fb55b6 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -507,7 +507,7 @@ static int rootfs_init_fs_context(struct fs_context *fc)
 struct file_system_type rootfs_fs_type = {
 	.name		= "rootfs",
 	.init_fs_context = rootfs_init_fs_context,
-	.kill_sb	= kill_litter_super,
+	.kill_sb	= kill_anon_super,
 };
 
 void __init init_rootfs(void)
diff --git a/mm/shmem.c b/mm/shmem.c
index b9081b817d28..a38f71519813 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -3858,12 +3858,7 @@ shmem_mknod(struct mnt_idmap *idmap, struct inode *dir,
 	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
 	inode_inc_iversion(dir);
 
-	if (IS_ENABLED(CONFIG_UNICODE) && IS_CASEFOLDED(dir))
-		d_add(dentry, inode);
-	else
-		d_instantiate(dentry, inode);
-
-	dget(dentry); /* Extra count - pin the dentry in core */
+	d_make_persistent(dentry, inode);
 	return error;
 
 out_iput:
@@ -3924,7 +3919,7 @@ static int shmem_link(struct dentry *old_dentry, struct inode *dir,
 		      struct dentry *dentry)
 {
 	struct inode *inode = d_inode(old_dentry);
-	int ret = 0;
+	int ret;
 
 	/*
 	 * No ordinary (disk based) filesystem counts links as inodes;
@@ -3936,29 +3931,19 @@ static int shmem_link(struct dentry *old_dentry, struct inode *dir,
 	if (inode->i_nlink) {
 		ret = shmem_reserve_inode(inode->i_sb, NULL);
 		if (ret)
-			goto out;
+			return ret;
 	}
 
 	ret = simple_offset_add(shmem_get_offset_ctx(dir), dentry);
 	if (ret) {
 		if (inode->i_nlink)
 			shmem_free_inode(inode->i_sb, 0);
-		goto out;
+		return ret;
 	}
 
 	dir->i_size += BOGO_DIRENT_SIZE;
-	inode_set_mtime_to_ts(dir,
-			      inode_set_ctime_to_ts(dir, inode_set_ctime_current(inode)));
 	inode_inc_iversion(dir);
-	inc_nlink(inode);
-	ihold(inode);	/* New dentry reference */
-	dget(dentry);	/* Extra pinning count for the created dentry */
-	if (IS_ENABLED(CONFIG_UNICODE) && IS_CASEFOLDED(dir))
-		d_add(dentry, inode);
-	else
-		d_instantiate(dentry, inode);
-out:
-	return ret;
+	return simple_link(old_dentry, dir, dentry);
 }
 
 static int shmem_unlink(struct inode *dir, struct dentry *dentry)
@@ -3971,11 +3956,8 @@ static int shmem_unlink(struct inode *dir, struct dentry *dentry)
 	simple_offset_remove(shmem_get_offset_ctx(dir), dentry);
 
 	dir->i_size -= BOGO_DIRENT_SIZE;
-	inode_set_mtime_to_ts(dir,
-			      inode_set_ctime_to_ts(dir, inode_set_ctime_current(inode)));
 	inode_inc_iversion(dir);
-	drop_nlink(inode);
-	dput(dentry);	/* Undo the count from "create" - does all the work */
+	simple_unlink(dir, dentry);
 
 	/*
 	 * For now, VFS can't deal with case-insensitive negative dentries, so
@@ -4130,11 +4112,7 @@ static int shmem_symlink(struct mnt_idmap *idmap, struct inode *dir,
 	dir->i_size += BOGO_DIRENT_SIZE;
 	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
 	inode_inc_iversion(dir);
-	if (IS_ENABLED(CONFIG_UNICODE) && IS_CASEFOLDED(dir))
-		d_add(dentry, inode);
-	else
-		d_instantiate(dentry, inode);
-	dget(dentry);
+	d_make_persistent(dentry, inode);
 	return 0;
 
 out_remove_offset:
@@ -5334,7 +5312,7 @@ static struct file_system_type shmem_fs_type = {
 #ifdef CONFIG_TMPFS
 	.parameters	= shmem_fs_parameters,
 #endif
-	.kill_sb	= kill_litter_super,
+	.kill_sb	= kill_anon_super,
 	.fs_flags	= FS_USERNS_MOUNT | FS_ALLOW_IDMAP | FS_MGTIME,
 };
 
-- 
2.47.3


