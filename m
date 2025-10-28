Return-Path: <linuxppc-dev+bounces-13388-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD641C124BB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 01:50:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwWsl41FWz3fLT;
	Tue, 28 Oct 2025 11:46:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761612411;
	cv=none; b=icySuVbywjs+zijPekUiL1PvwHNkspi8Xz00Hy7kNWCp/oM5eSh53SXruOZf71fLEhxNrlfp/ijkb6bld56JI5hjHA5aiFdg72XqN35Z+RdPDjjuandOJXEfzzh4E7BQTft3oY8Y8yIT2bLMUGWAUwkeYKwL7iJ/vPzTty6SVuTIF0/mUvSYKpWkuF75x0DUXuXpTmO/qgscuEGkrKL3+71c2MWF//QPlC0YgEWsePxtnqQB0DLI38+7BwyQQE9X9+LLayqam0Poa54Sy4mMcDOZuvPQxvCBV7Rj159eYwI+shJzXxjl9u/44F2INo/KJuyJfS8iQI3QXflDZzjGFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761612411; c=relaxed/relaxed;
	bh=ndxAHMuLfdVjp4xlYpconlsf87kf7dRAnlN4D1FUhRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M0U2HvxL0jNhG8mMgJdbQ97ynH9Cfd0Kv+CtAxcTgCJK8gBhQnF1wpFWqR33l4dsdoA+nQeixZ0wJZqxsX8fUuaYms1RUPxwnV+b5ZI3XSeXMNslDaCnedQzULvZoC2droLu2TMNGDo+xLUTYanNvrAipT/sfrZsWHITAhSRz1exmBOPxYHhzTzXU9RX0De2t3NOQ8SW+NU8jHloI3Fn5yr8T63+Z3BtBM6dh1XpKJTl1eOL/riKWwkEx+lvLHBNUSeaLM7c6x7BWb7ajWKFwCSYk779z/6/QnkVyDh53Z1xzzgSz+9Ry6Av/aaCI7nE9pQUhpndqvTq0Hr/MPKUog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=NNADoC0Q; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=NNADoC0Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwWsk6Nqxz3fKb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 11:46:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ndxAHMuLfdVjp4xlYpconlsf87kf7dRAnlN4D1FUhRg=; b=NNADoC0QPzOHCvpif5Y6e7a21b
	pBUl0PzQ+IbvulPa+5tPA6AYicypuEQu8dMfylLQwaQtkai7ovjgavXoa4QSIk03b9I7tHbu5Ui2G
	bH5HuyZJVGEzFLnAU1CjpdshSGu+5HGErnDr7Xoyjg8OKPvkEJgEdtnovBatL4w5lf2IS1aeo9W2L
	f3CGHfaqs7ieul+HvK3Bx6t7Hwj3JTB8DvOazlJC/2oKsxH7ii56OfH6l4GjJW5d5bidKmJn9cymO
	sUr51YT8JdGsX84IivLBri+O+pSZKpC9yDGcN7MedyXezf6ggKTBqn0qumg/oFCTa8sA0OZBMHp8q
	+JO4W54Q==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXqr-00000001eYx-1tlz;
	Tue, 28 Oct 2025 00:46:17 +0000
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
Subject: [PATCH v2 27/50] binderfs: use simple_start_creating()
Date: Tue, 28 Oct 2025 00:45:46 +0000
Message-ID: <20251028004614.393374-28-viro@zeniv.linux.org.uk>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
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

binderfs_binder_device_create() gets simpler, binderfs_create_dentry() simply
goes away...

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 drivers/android/binderfs.c | 43 +++++---------------------------------
 1 file changed, 5 insertions(+), 38 deletions(-)

diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
index be8e64eb39ec..a7b0a773d47f 100644
--- a/drivers/android/binderfs.c
+++ b/drivers/android/binderfs.c
@@ -183,24 +183,11 @@ static int binderfs_binder_device_create(struct inode *ref_inode,
 	}
 
 	root = sb->s_root;
-	inode_lock(d_inode(root));
-
-	/* look it up */
-	dentry = lookup_noperm(&QSTR(name), root);
+	dentry = simple_start_creating(root, name);
 	if (IS_ERR(dentry)) {
-		inode_unlock(d_inode(root));
 		ret = PTR_ERR(dentry);
 		goto err;
 	}
-
-	if (d_really_is_positive(dentry)) {
-		/* already exists */
-		dput(dentry);
-		inode_unlock(d_inode(root));
-		ret = -EEXIST;
-		goto err;
-	}
-
 	inode->i_private = device;
 	d_instantiate(dentry, inode);
 	fsnotify_create(root->d_inode, dentry);
@@ -481,24 +468,6 @@ static struct inode *binderfs_make_inode(struct super_block *sb, int mode)
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
 struct dentry *binderfs_create_file(struct dentry *parent, const char *name,
 				    const struct file_operations *fops,
 				    void *data)
@@ -508,11 +477,10 @@ struct dentry *binderfs_create_file(struct dentry *parent, const char *name,
 	struct super_block *sb;
 
 	parent_inode = d_inode(parent);
-	inode_lock(parent_inode);
 
-	dentry = binderfs_create_dentry(parent, name);
+	dentry = simple_start_creating(parent, name);
 	if (IS_ERR(dentry))
-		goto out;
+		return dentry;
 
 	sb = parent_inode->i_sb;
 	new_inode = binderfs_make_inode(sb, S_IFREG | 0444);
@@ -540,11 +508,10 @@ static struct dentry *binderfs_create_dir(struct dentry *parent,
 	struct super_block *sb;
 
 	parent_inode = d_inode(parent);
-	inode_lock(parent_inode);
 
-	dentry = binderfs_create_dentry(parent, name);
+	dentry = simple_start_creating(parent, name);
 	if (IS_ERR(dentry))
-		goto out;
+		return dentry;
 
 	sb = parent_inode->i_sb;
 	new_inode = binderfs_make_inode(sb, S_IFDIR | 0755);
-- 
2.47.3


