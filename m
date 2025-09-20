Return-Path: <linuxppc-dev+bounces-12450-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFB1B8C212
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:49:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1W4bKQz3cnZ;
	Sat, 20 Sep 2025 17:48:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354495;
	cv=none; b=FfiYnVm/j5bzVqv2Zb2IQXL54DDU31nVhkrdIxhyehH/otzg4ZP4QhrstEvxbRAkOa6I+9uaxjQ27d7LaSUpopn4UAEbUbAGd3w9NeMDcvBiYupb2gWiV8flfOC91N/xaltXIYjwT7tCTjsAt9B/CI9GpJ4B0EKnhXOx36DfqtkIfFEZ9+aLYmabzSQ/Q4z6tMkde3gmsX5R/iy97JaLiRyjf6Edf8ynHotJXZm1cR6+q4HpIJ8JqKu9yYr43bDLxRVNMLk0GrIws0W3oa7jDGLHTzsftf5iKOgn50/Z6Ehb1rh9GDvIHY8kvBqGZ/eEj5uxRP+88ZCOQrAVNcx+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354495; c=relaxed/relaxed;
	bh=A8YKDw/ZJpGmy7UJsDRR+U4SJc3qy9aBRX8nF/jK6hA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UaLwcYB5Z+osKQ58Z4B0L5GTbgaYv2teqD6PfL9o2C05njBhkPwIr2dA+2D6bFuNOjJY13SwBMqWo78MGzbPAoZnLivd/JrqCQe9etHUEdHytYA2B9mPi920wSQhEMtWMcARDhE0E3oMLwfXUvszgIIhLOG/lYCYk3nSZbVezlrFkOuVrpOMFDAJUuVzM7TDaEfmta1cD72WXzSW5lrEczJH3bGLXqr71h4WAldkK/4P7QkQfxZKI223fjVsF7Y5n6iM+Ss+yLYPsV57X2XnAeCbLAywPwgY9mdSf5spFHuZy4Fe7C6UsI9h/v2QvBwfEjS6zBDZ4Myzk4jNZMzC8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=jtFtOrXI; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=jtFtOrXI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1Q0VyRz3cYy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=A8YKDw/ZJpGmy7UJsDRR+U4SJc3qy9aBRX8nF/jK6hA=; b=jtFtOrXI4fTFhphzd0e6wCmi/7
	JjfIpq8JVZN0EjhyoCpioom7D36QQWeM+yiMqXo7UyNAhDGENLZfaj8CgT9raBOYi92eUtrZBfY64
	yZGwFoe3hLGxZEx4WRUtBKsP5JJ+4y6mIjY//tlqgYfDaBin7dr80b8nU7eqvGBcO9GVLeyEWOfPF
	6WhTRHOHnHnr29AlRGpEtJLgKI9r0mB9rJqxXoL8Trk34PZMr51jToLyVUzZzH5/5NvFaCW4gfAO3
	sWbSLJeMzU+YOYGsK/VYRApWAeTTG7X/44xYcs26iWLUm/sobfmkbIRo3Bx1AJdpGHLMEdF1eP0VD
	nUnMHeyw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsK8-0000000ExC4-3HZU;
	Sat, 20 Sep 2025 07:48:00 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-fsdevel@vger.kernel.org
Cc: torvalds@linux-foundation.org,
	brauner@kernel.org,
	jack@suse.cz,
	raven@themaw.net,
	miklos@szeredi.hu,
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
	borntraeger@linux.ibm.com
Subject: [PATCH 06/39] convert ramfs and tmpfs
Date: Sat, 20 Sep 2025 08:47:25 +0100
Message-ID: <20250920074759.3564072-6-viro@zeniv.linux.org.uk>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920074759.3564072-1-viro@zeniv.linux.org.uk>
References: <20250920074156.GK39973@ZenIV>
 <20250920074759.3564072-1-viro@zeniv.linux.org.uk>
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
and, in case of shmem, unpinning dput() in ->unlink() with d_make_discardable().
Since d_make_persistent() accepts (and hashes) unhashed ones,
shmem situation gets simpler - we no longer care whether ->lookup()
has hashed the sucker.

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
 mm/shmem.c              | 23 +++++------------------
 4 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/base/devtmpfs.c b/drivers/base/devtmpfs.c
index 31bfb3194b4c..30b5ae8d79cf 100644
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
index f8874c3b8c1e..3cc36b1c60b3 100644
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
index e2c76a30802b..2d5832a1e67a 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -3922,12 +3922,7 @@ shmem_mknod(struct mnt_idmap *idmap, struct inode *dir,
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
@@ -4016,11 +4011,7 @@ static int shmem_link(struct dentry *old_dentry, struct inode *dir,
 	inode_inc_iversion(dir);
 	inc_nlink(inode);
 	ihold(inode);	/* New dentry reference */
-	dget(dentry);	/* Extra pinning count for the created dentry */
-	if (IS_ENABLED(CONFIG_UNICODE) && IS_CASEFOLDED(dir))
-		d_add(dentry, inode);
-	else
-		d_instantiate(dentry, inode);
+	d_make_persistent(dentry, inode);
 out:
 	return ret;
 }
@@ -4039,7 +4030,7 @@ static int shmem_unlink(struct inode *dir, struct dentry *dentry)
 			      inode_set_ctime_to_ts(dir, inode_set_ctime_current(inode)));
 	inode_inc_iversion(dir);
 	drop_nlink(inode);
-	dput(dentry);	/* Undo the count from "create" - does all the work */
+	d_make_discardable(dentry);
 
 	/*
 	 * For now, VFS can't deal with case-insensitive negative dentries, so
@@ -4194,11 +4185,7 @@ static int shmem_symlink(struct mnt_idmap *idmap, struct inode *dir,
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
@@ -5395,7 +5382,7 @@ static struct file_system_type shmem_fs_type = {
 #ifdef CONFIG_TMPFS
 	.parameters	= shmem_fs_parameters,
 #endif
-	.kill_sb	= kill_litter_super,
+	.kill_sb	= kill_anon_super,
 	.fs_flags	= FS_USERNS_MOUNT | FS_ALLOW_IDMAP | FS_MGTIME,
 };
 
-- 
2.47.3


