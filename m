Return-Path: <linuxppc-dev+bounces-12467-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADC5B8C2B7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:51:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1h1wDQz3dTb;
	Sat, 20 Sep 2025 17:48:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354503;
	cv=none; b=SCxrhCV4yVzZOm752j9E/zwhpYr+PBouC7uCzIZx7A6tQ3T9H1lQmKWh95r2FQvlXAzWCDWg9C8vY9Sjfipe8EvbFfbsFuR3jSqUv+H+u9mbeFulgsdF+zaV5n4kV29MjQpa8XzCFCLXhsOXcoOdJ/qqjAlf5AmtC7yoVxHSZ9CmyMvJOQ+Df9nxnoxyyVlq2XEzYDuzTjNkET2HAx506BnK2YR0gH2dtACfO86A9Mb6espB04Avi/8rIGpL7eixigP56GOd+O3CpiOHrXi2dk1nQKyYiEOLH/miCT4yoaam2CxSicEDST07lkjjhMJ0rdgt0u5jYzG8y6Ckhs1fNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354503; c=relaxed/relaxed;
	bh=9n+u5mJZbkVOGppwaF2sYBKKadIdALuqoKRX4rc7ffY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iL5Ny26GqAVWGq13aWCwzp0E4ruhBAKCoQupjaOFWJtv7cfK76Xxm3/VmampFd2TzT9B4xSbshUUo9xtsqo3VC2RO5IOwLz/o58/FiLYallJIjBeGhiPFXreffQu1UY4nxeOdQzGipKy0kB0yopyh3Dm7L+0LvT4BqJbAnj5tPmAdwuQscyTgm4CPUPkq+Rn+oq9BGsk4kpJEc0z2WpW0S+z0kafzbB05DOPTVsREsgWooMIMB4rgeH5vpbh+X7YSxoFRdxbMOhgUGoXgAjEc4M+JTl/FW30OVpAAGN1FkHAe+MpryNo6eap15XR8vHkXPPmgi2ijSTD23TEYUOJ0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=HiVW9csO; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=HiVW9csO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1S24ynz3cfH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=9n+u5mJZbkVOGppwaF2sYBKKadIdALuqoKRX4rc7ffY=; b=HiVW9csO5wBPzyUh4wvbC9GIYx
	YKGxOZnoP/Io27DxYX02JMpe8G4cANuBi3Itop3hCVYnYYAyZfVDGg/w4XSPPYbWB33ufeiJgLjBb
	HwXVmW32L3G0HSw9MordfN1F40Sj/1uLKukoUKkmbjskzbyYATwtnL1flJn2oqPpN1FqXFwY2H2XE
	R1OGCigYvOp7JKEm01oeADrVHA8pywFCJSeGriFVKr19RZxCb9KGZHnddfbIe1ER76Fn51NqNFHJ3
	qP6r1xoo1e7B7+cUg5lnU2Dkg4d6pU/ydQ0ARm3LSeYrti+KOoTXA8P81RPltMNGl8j9qkV6NWEBM
	sDJDZa5w==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsKC-0000000ExGF-12mR;
	Sat, 20 Sep 2025 07:48:04 +0000
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
Subject: [PATCH 24/39] convert devpts
Date: Sat, 20 Sep 2025 08:47:43 +0100
Message-ID: <20250920074759.3564072-24-viro@zeniv.linux.org.uk>
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

Two kinds of objects there - ptmx and everything else (pty).  The former is
created on mount and kept until the fs shutdown; the latter get created
and removed by tty layer (the references are borrowed into tty->driver_data).
The reference to ptmx dentry is also kept, but we only ever use it to
find ptmx inode on remount.

* turn d_add() into d_make_persistent() + dput()  both in mknod_ptmx() and
in devpts_pty_new().

* turn dput() to d_make_discardable() in devpts_pty_kill().

* switch mknod_ptmx() to simple_{start,done}_creating().

* instead of storing a reference to ptmx dentry pts_fs_info, store a reference
to its inode, seeing that this is what we use it for.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/devpts/inode.c | 57 +++++++++++++++++------------------------------
 1 file changed, 21 insertions(+), 36 deletions(-)

diff --git a/fs/devpts/inode.c b/fs/devpts/inode.c
index fdf22264a8e9..9f3de528c358 100644
--- a/fs/devpts/inode.c
+++ b/fs/devpts/inode.c
@@ -102,7 +102,7 @@ struct pts_fs_info {
 	struct ida allocated_ptys;
 	struct pts_mount_opts mount_opts;
 	struct super_block *sb;
-	struct dentry *ptmx_dentry;
+	struct inode *ptmx_inode; // borrowed
 };
 
 static inline struct pts_fs_info *DEVPTS_SB(struct super_block *sb)
@@ -259,7 +259,6 @@ static int devpts_parse_param(struct fs_context *fc, struct fs_parameter *param)
 static int mknod_ptmx(struct super_block *sb, struct fs_context *fc)
 {
 	int mode;
-	int rc = -ENOMEM;
 	struct dentry *dentry;
 	struct inode *inode;
 	struct dentry *root = sb->s_root;
@@ -268,18 +267,10 @@ static int mknod_ptmx(struct super_block *sb, struct fs_context *fc)
 	kuid_t ptmx_uid = current_fsuid();
 	kgid_t ptmx_gid = current_fsgid();
 
-	inode_lock(d_inode(root));
-
-	/* If we have already created ptmx node, return */
-	if (fsi->ptmx_dentry) {
-		rc = 0;
-		goto out;
-	}
-
-	dentry = d_alloc_name(root, "ptmx");
-	if (!dentry) {
+	dentry = simple_start_creating(root, "ptmx");
+	if (IS_ERR(dentry)) {
 		pr_err("Unable to alloc dentry for ptmx node\n");
-		goto out;
+		return PTR_ERR(dentry);
 	}
 
 	/*
@@ -287,9 +278,9 @@ static int mknod_ptmx(struct super_block *sb, struct fs_context *fc)
 	 */
 	inode = new_inode(sb);
 	if (!inode) {
+		simple_done_creating(dentry);
 		pr_err("Unable to alloc inode for ptmx node\n");
-		dput(dentry);
-		goto out;
+		return -ENOMEM;
 	}
 
 	inode->i_ino = 2;
@@ -299,23 +290,18 @@ static int mknod_ptmx(struct super_block *sb, struct fs_context *fc)
 	init_special_inode(inode, mode, MKDEV(TTYAUX_MAJOR, 2));
 	inode->i_uid = ptmx_uid;
 	inode->i_gid = ptmx_gid;
+	fsi->ptmx_inode = inode;
 
-	d_add(dentry, inode);
+	d_make_persistent(dentry, inode);
 
-	fsi->ptmx_dentry = dentry;
-	rc = 0;
-out:
-	inode_unlock(d_inode(root));
-	return rc;
+	simple_done_creating(dentry);
+
+	return 0;
 }
 
 static void update_ptmx_mode(struct pts_fs_info *fsi)
 {
-	struct inode *inode;
-	if (fsi->ptmx_dentry) {
-		inode = d_inode(fsi->ptmx_dentry);
-		inode->i_mode = S_IFCHR|fsi->mount_opts.ptmxmode;
-	}
+	fsi->ptmx_inode->i_mode = S_IFCHR|fsi->mount_opts.ptmxmode;
 }
 
 static int devpts_reconfigure(struct fs_context *fc)
@@ -461,7 +447,7 @@ static void devpts_kill_sb(struct super_block *sb)
 	if (fsi)
 		ida_destroy(&fsi->allocated_ptys);
 	kfree(fsi);
-	kill_litter_super(sb);
+	kill_anon_super(sb);
 }
 
 static struct file_system_type devpts_fs_type = {
@@ -534,16 +520,15 @@ struct dentry *devpts_pty_new(struct pts_fs_info *fsi, int index, void *priv)
 	sprintf(s, "%d", index);
 
 	dentry = d_alloc_name(root, s);
-	if (dentry) {
-		dentry->d_fsdata = priv;
-		d_add(dentry, inode);
-		fsnotify_create(d_inode(root), dentry);
-	} else {
+	if (!dentry) {
 		iput(inode);
-		dentry = ERR_PTR(-ENOMEM);
+		return ERR_PTR(-ENOMEM);
 	}
-
-	return dentry;
+	dentry->d_fsdata = priv;
+	d_make_persistent(dentry, inode);
+	fsnotify_create(d_inode(root), dentry);
+	dput(dentry);
+	return dentry; // borrowed
 }
 
 /**
@@ -573,7 +558,7 @@ void devpts_pty_kill(struct dentry *dentry)
 	drop_nlink(dentry->d_inode);
 	d_drop(dentry);
 	fsnotify_unlink(d_inode(dentry->d_parent), dentry);
-	dput(dentry);	/* d_alloc_name() in devpts_pty_new() */
+	d_make_discardable(dentry);
 }
 
 static int __init init_devpts_fs(void)
-- 
2.47.3


