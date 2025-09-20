Return-Path: <linuxppc-dev+bounces-12459-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C7EB8C260
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:50:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1c1hW3z3dDp;
	Sat, 20 Sep 2025 17:48:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354499;
	cv=none; b=TEvIPhfjmkBRVYHdIQpwNyS4vk4MYetc5xNbOSmzAVjNPIj09+YJnc/84qCvzMbryr0BpDaV5rytLrK5qizFrtGXyjQ04Z5z7aQ+loEPuKUUltJqauHRPamF2ECDFpCTCh1yeidKr7+Ev0HEXn6jTzplRGpgYtS8woK88ZHa+I73BqJEF4MNWhVLkHARlFtL887E3SOLn886SStZajDO0oI9ZADwr2sgMZ5Y8ikPNfC0XIMsgBDsgs6PIkcF2A/83Q4IOF9W8mKTK7dYl5w6MvnFd5FWbRfWqhkUnjErQ79s5+wI+bwaQMGuvz8hky+OLAoLPgSBEzfTLYgLl2x6VA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354499; c=relaxed/relaxed;
	bh=mdhevqsdWuF/cKTAc0dIZQiRUrUONHeuOHhbEA+hz9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mnt7lY0Y/9UX5yHc+G+8C20qvDT1dFKar4c1iUuvISfqkRgIunvDyM0UmOXFetMx0g3Awbv7bs3YwgfG8Yg5d9c8zk6Zs9WtqucYVuXCy5Asy8Cj5XSWOHuV0Lkd/fk8umCzLi65n6GHeF9FSqtqvAfG7PiIipWg0jc18J1Uphj5xc1f1pFOrdWpJB+TTCVTMNxdnQh9BgGMFgUaljtXTzDbCI3ijs+MOUI2sf4P2niChoQB2VR1/EIBdrf6Y32yX00JjSC4h3l0yX0PM0YKmERpFd9T47bLicHT9nHhV0D072nEBduJElLLAVOFrSn0+ujTY2WdSBRn4miPacU7Jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=JayErOdQ; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=JayErOdQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1R51pZz3ccf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=mdhevqsdWuF/cKTAc0dIZQiRUrUONHeuOHhbEA+hz9E=; b=JayErOdQO97E9P8HOT624tcwlV
	zR8JXRCLGJ/YGzM/Vh9C5VjfvI9cd7nCM4RnGAu6RjeKHfoCfXvj5oBQSOtDyLKTCtQjdynyimT8h
	L9/AyYpzJq/9KmPl1R1y28blWi1Zj+Vt1UiKPY/b6vnV9u+MsMHjatQ0eipe59pqyFMZ4ZfjjXa3g
	tclJ92LsYJjvNW9qDXplpZ9jPIFBYmzZXyKaPFZyhfayHKUMR6fQqtwzJmjMPjxA8Tqafvs+QxgfZ
	pB8Hd6CLqUbf0ATlajREcOgypejOhuBgOeXAh1nSHxfTE6iVKb/JYZBJaEqw1/BWTVOcRacla8XDK
	OnKcOctw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsKA-0000000ExEm-3DMp;
	Sat, 20 Sep 2025 07:48:02 +0000
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
Subject: [PATCH 18/39] convert debugfs
Date: Sat, 20 Sep 2025 08:47:37 +0100
Message-ID: <20250920074759.3564072-18-viro@zeniv.linux.org.uk>
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

similar to tracefs - simulation of normal codepath for creation,
simple_recursive_removal() for removal.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/debugfs/inode.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index c12d649df6a5..1302995d6816 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -329,7 +329,7 @@ static struct file_system_type debug_fs_type = {
 	.name =		"debugfs",
 	.init_fs_context = debugfs_init_fs_context,
 	.parameters =	debugfs_param_specs,
-	.kill_sb =	kill_litter_super,
+	.kill_sb =	kill_anon_super,
 };
 MODULE_ALIAS_FS("debugfs");
 
@@ -404,16 +404,15 @@ static struct dentry *start_creating(const char *name, struct dentry *parent)
 
 static struct dentry *failed_creating(struct dentry *dentry)
 {
-	inode_unlock(d_inode(dentry->d_parent));
-	dput(dentry);
+	simple_done_creating(dentry);
 	simple_release_fs(&debugfs_mount, &debugfs_mount_count);
 	return ERR_PTR(-ENOMEM);
 }
 
 static struct dentry *end_creating(struct dentry *dentry)
 {
-	inode_unlock(d_inode(dentry->d_parent));
-	return dentry;
+	simple_done_creating(dentry);
+	return dentry; // borrowed
 }
 
 static struct dentry *__debugfs_create_file(const char *name, umode_t mode,
@@ -455,7 +454,7 @@ static struct dentry *__debugfs_create_file(const char *name, umode_t mode,
 	DEBUGFS_I(inode)->raw = real_fops;
 	DEBUGFS_I(inode)->aux = (void *)aux;
 
-	d_instantiate(dentry, inode);
+	d_make_persistent(dentry, inode);
 	fsnotify_create(d_inode(dentry->d_parent), dentry);
 	return end_creating(dentry);
 }
@@ -601,7 +600,7 @@ struct dentry *debugfs_create_dir(const char *name, struct dentry *parent)
 
 	/* directory inodes start off with i_nlink == 2 (for "." entry) */
 	inc_nlink(inode);
-	d_instantiate(dentry, inode);
+	d_make_persistent(dentry, inode);
 	inc_nlink(d_inode(dentry->d_parent));
 	fsnotify_mkdir(d_inode(dentry->d_parent), dentry);
 	return end_creating(dentry);
@@ -648,7 +647,7 @@ struct dentry *debugfs_create_automount(const char *name,
 	DEBUGFS_I(inode)->automount = f;
 	/* directory inodes start off with i_nlink == 2 (for "." entry) */
 	inc_nlink(inode);
-	d_instantiate(dentry, inode);
+	d_make_persistent(dentry, inode);
 	inc_nlink(d_inode(dentry->d_parent));
 	fsnotify_mkdir(d_inode(dentry->d_parent), dentry);
 	return end_creating(dentry);
@@ -703,7 +702,7 @@ struct dentry *debugfs_create_symlink(const char *name, struct dentry *parent,
 	inode->i_mode = S_IFLNK | S_IRWXUGO;
 	inode->i_op = &debugfs_symlink_inode_operations;
 	inode->i_link = link;
-	d_instantiate(dentry, inode);
+	d_make_persistent(dentry, inode);
 	return end_creating(dentry);
 }
 EXPORT_SYMBOL_GPL(debugfs_create_symlink);
-- 
2.47.3


