Return-Path: <linuxppc-dev+bounces-14261-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92888C676F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:20:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9XsR2btDz3fKs;
	Tue, 18 Nov 2025 16:16:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763442997;
	cv=none; b=X0ER5JwZMJIIClUGeORllA3YOyFihlKLK48oAYrUrDSze0iKS2YyguRQ4zIbnmqZ+85QLyqSK71Ponj8I9nI9adFhq04PI+LSO1oWTKHM1On9N/YP2MbGNXBfQg5LLSMNx4WcHLLDALXspryhB7XIZD3VDxcdl/fd8MXiGRtRwdFD2BVxG3LdSzgwBuhC4lK/CWb0mkanv6EJpAnWSyMsbojbIBMia58s/84tJ0O+5N48zymbKN2Ytq2qnuhWWAW5LTwXs9zhss1uG6kE6C5bgh8otVkHPn7ZBJUpcYjPex5DaeoEvX/0sbf0rpIrf2p3MgVSXshKzyUimwmFlhZIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763442997; c=relaxed/relaxed;
	bh=nhVZHCo/8A/9+8ahzyAjs/jwjY1fv4im71qjOl+I68U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNnVLso6cKlIG0b1Wg822A8NYoZJIaGwPXSb9vARmZqxDnZuZ5eAW22cevVhnG4bDYNXVNDhe02uPEftR+RAQnUz4brYktnsZbbx2jMFhvt0lfJBY6oaOZTmMXQNK+W7x/Xxt7Sv3jnVKLcqo3Amx4BPLDqoOQFzekVJVNH7jBQB+OLl8q37HSc1MPcMvZxeRo1xBchDanGDp6ubzDFOWT6tuXZseFMPhQPLT26VdvPa43Yj48flAd7viEpgh6rkNnr36RJah7uqBc7Wy/pI6wDD8CQgstGXL+ZXoi7CmGy/GqsGeGsJkpYsERmsr1wBXyAnEdvYXrlgekZqXJoRdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=sCKcYQQF; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=sCKcYQQF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xs01hp1z30WT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=nhVZHCo/8A/9+8ahzyAjs/jwjY1fv4im71qjOl+I68U=; b=sCKcYQQFYhGPvXEzlHhOh9bWij
	H5MQd9kCPmQVUA6YWHyhBZHmFSCAgXjrZRQ5O81Be72hzvbz5+MzIkc8s8p+CgkyvbFcFAEykozvS
	bSkfY81PC2r/dBiQSpL+Zc8b1349rLF/vkvf1v6qCpR6l88y/PzzpQiapeFUGqfCBuGZp5zClEjoD
	WClb7bBiH1DgSW/Mc2GHafGAjiHKsjAlRLA2YAaRfuJjkrtv7291R5S3RfKNjL5csEk2dMPB3enQ5
	AjSJdzQwK4i/EGNR6ktNkcjwxvexDbo43h13EaNpm4hiRlFK9Q6LiMHALtdId9OHsVb1ApMJr1+nX
	qBTt8OKA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4Z-0000000GEdj-3nX7;
	Tue, 18 Nov 2025 05:16:11 +0000
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
	bpf@vger.kernel.org,
	clm@meta.com
Subject: [PATCH v4 50/54] convert rust_binderfs
Date: Tue, 18 Nov 2025 05:15:59 +0000
Message-ID: <20251118051604.3868588-51-viro@zeniv.linux.org.uk>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
References: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
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

Parallel to binderfs stuff:
	* use simple_start_creating()/simple_done_creating()/d_make_persistent()
instead of manual inode_lock()/lookup_noperm()/d_instanitate()/inode_unlock().
	* allocate inode first - simpler cleanup that way.
	* use simple_recursive_removal() instead of open-coding it.
	* switch to kill_anon_super()

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 drivers/android/binder/rust_binderfs.c | 121 +++++++------------------
 1 file changed, 33 insertions(+), 88 deletions(-)

diff --git a/drivers/android/binder/rust_binderfs.c b/drivers/android/binder/rust_binderfs.c
index 6b497146b698..c69026df775c 100644
--- a/drivers/android/binder/rust_binderfs.c
+++ b/drivers/android/binder/rust_binderfs.c
@@ -178,28 +178,17 @@ static int binderfs_binder_device_create(struct inode *ref_inode,
 	}
 
 	root = sb->s_root;
-	inode_lock(d_inode(root));
-
-	/* look it up */
-	dentry = lookup_noperm(&QSTR(req->name), root);
+	dentry = simple_start_creating(root, req->name);
 	if (IS_ERR(dentry)) {
-		inode_unlock(d_inode(root));
 		ret = PTR_ERR(dentry);
 		goto err;
 	}
 
-	if (d_really_is_positive(dentry)) {
-		/* already exists */
-		dput(dentry);
-		inode_unlock(d_inode(root));
-		ret = -EEXIST;
-		goto err;
-	}
-
 	inode->i_private = device;
-	d_instantiate(dentry, inode);
+	d_make_persistent(dentry, inode);
+
 	fsnotify_create(root->d_inode, dentry);
-	inode_unlock(d_inode(root));
+	simple_done_creating(dentry);
 
 	return 0;
 
@@ -472,37 +461,9 @@ static struct inode *binderfs_make_inode(struct super_block *sb, int mode)
 	return ret;
 }
 
-static struct dentry *binderfs_create_dentry(struct dentry *parent,
-					     const char *name)
-{
-	struct dentry *dentry;
-
-	dentry = lookup_noperm(&QSTR(name), parent);
-	if (IS_ERR(dentry))
-		return dentry;
-
-	/* Return error if the file/dir already exists. */
-	if (d_really_is_positive(dentry)) {
-		dput(dentry);
-		return ERR_PTR(-EEXIST);
-	}
-
-	return dentry;
-}
-
 void rust_binderfs_remove_file(struct dentry *dentry)
 {
-	struct inode *parent_inode;
-
-	parent_inode = d_inode(dentry->d_parent);
-	inode_lock(parent_inode);
-	if (simple_positive(dentry)) {
-		dget(dentry);
-		simple_unlink(parent_inode, dentry);
-		d_delete(dentry);
-		dput(dentry);
-	}
-	inode_unlock(parent_inode);
+	simple_recursive_removal(dentry, NULL);
 }
 
 static struct dentry *rust_binderfs_create_file(struct dentry *parent, const char *name,
@@ -510,31 +471,23 @@ static struct dentry *rust_binderfs_create_file(struct dentry *parent, const cha
 						void *data)
 {
 	struct dentry *dentry;
-	struct inode *new_inode, *parent_inode;
-	struct super_block *sb;
-
-	parent_inode = d_inode(parent);
-	inode_lock(parent_inode);
-
-	dentry = binderfs_create_dentry(parent, name);
-	if (IS_ERR(dentry))
-		goto out;
-
-	sb = parent_inode->i_sb;
-	new_inode = binderfs_make_inode(sb, S_IFREG | 0444);
-	if (!new_inode) {
-		dput(dentry);
-		dentry = ERR_PTR(-ENOMEM);
-		goto out;
-	}
+	struct inode *new_inode;
 
+	new_inode = binderfs_make_inode(parent->d_sb, S_IFREG | 0444);
+	if (!new_inode)
+		return ERR_PTR(-ENOMEM);
 	new_inode->i_fop = fops;
 	new_inode->i_private = data;
-	d_instantiate(dentry, new_inode);
-	fsnotify_create(parent_inode, dentry);
 
-out:
-	inode_unlock(parent_inode);
+	dentry = simple_start_creating(parent, name);
+	if (IS_ERR(dentry)) {
+		iput(new_inode);
+		return dentry;
+	}
+
+	d_make_persistent(dentry, new_inode);
+	fsnotify_create(parent->d_inode, dentry);
+	simple_done_creating(dentry);
 	return dentry;
 }
 
@@ -556,34 +509,26 @@ static struct dentry *binderfs_create_dir(struct dentry *parent,
 					  const char *name)
 {
 	struct dentry *dentry;
-	struct inode *new_inode, *parent_inode;
-	struct super_block *sb;
-
-	parent_inode = d_inode(parent);
-	inode_lock(parent_inode);
-
-	dentry = binderfs_create_dentry(parent, name);
-	if (IS_ERR(dentry))
-		goto out;
+	struct inode *new_inode;
 
-	sb = parent_inode->i_sb;
-	new_inode = binderfs_make_inode(sb, S_IFDIR | 0755);
-	if (!new_inode) {
-		dput(dentry);
-		dentry = ERR_PTR(-ENOMEM);
-		goto out;
-	}
+	new_inode = binderfs_make_inode(parent->d_sb, S_IFDIR | 0755);
+	if (!new_inode)
+		return ERR_PTR(-ENOMEM);
 
 	new_inode->i_fop = &simple_dir_operations;
 	new_inode->i_op = &simple_dir_inode_operations;
 
-	set_nlink(new_inode, 2);
-	d_instantiate(dentry, new_inode);
-	inc_nlink(parent_inode);
-	fsnotify_mkdir(parent_inode, dentry);
+	dentry = simple_start_creating(parent, name);
+	if (IS_ERR(dentry)) {
+		iput(new_inode);
+		return dentry;
+	}
 
-out:
-	inode_unlock(parent_inode);
+	inc_nlink(parent->d_inode);
+	set_nlink(new_inode, 2);
+	d_make_persistent(dentry, new_inode);
+	fsnotify_mkdir(parent->d_inode, dentry);
+	simple_done_creating(dentry);
 	return dentry;
 }
 
@@ -802,7 +747,7 @@ static void binderfs_kill_super(struct super_block *sb)
 	 * During inode eviction struct binderfs_info is needed.
 	 * So first wipe the super_block then free struct binderfs_info.
 	 */
-	kill_litter_super(sb);
+	kill_anon_super(sb);
 
 	if (info && info->ipc_ns)
 		put_ipc_ns(info->ipc_ns);
-- 
2.47.3


