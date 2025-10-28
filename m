Return-Path: <linuxppc-dev+bounces-13409-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30681C125C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 01:52:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwWw069Pkz3flr;
	Tue, 28 Oct 2025 11:48:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761612528;
	cv=none; b=MX2yP6tp5mPTnSc6hn7Im+lzmE4+hLWUYt2DKz7KlVitXXMd0RqQDQcfTaKHy2CDTAjPIlGMtU7hSD6wNHa1hpLcnOUg1+bfr1qfMLIMw4zRBGY2kkr7ikMnTE/50cLMxD9kGC3n3AbIbNOB7JY4eicJ1iPj2uDYrteGAYX/hTc5H+AcYY3BeVXMF5Klr+PeYtSKnKNWIPo9LO0JDihxdlyPvE915CCwv6jwhVA/di/BBvE6KZPfl7gtjfrE+6IsiMe3h9MZfJSyAKnzxn61/9rl9UbIiK0TCZ9xB3hwrzvqx44uUL0eXDM5A34wGLYkGaf4hRjrrlEFId2Rk84b5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761612528; c=relaxed/relaxed;
	bh=bCMcASxW4GQs4KES7qr2omvwcK385DadzCf/GiIFZ/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAF6B+e2wiRcEDEU5aB66cz82aVX8OrCmjbXxsqmawziiz4AvfacJ0GyZ3TA674M1mntSMPHH0+SvU5D4gV0iEESaf5EwhSzLorhNb7fg5vVTBsKTMQ/SSWuKJgdgEA9UDj8XdT4cUVFzZROw5mIP5B2mZ+byaga4j9CS/kckh15h6FJEnM0l0laCXd+7p7/ZOhE4A5y5SXq0l4f9IZWJ87YRxQiXkiI9O01acRbZbhNbOxfwRo4Ll96o5Kqx/JhsJpzndJdCblpfx9iz0xG8JDHTZFzZfRaCgND6305Tqfo+F0gO/297WMQDBEb4ddOSqJHVn7gvUfEI+mIewVq2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=Dt+Nd6iW; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=Dt+Nd6iW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwWw02NjXz3dTV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 11:48:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=bCMcASxW4GQs4KES7qr2omvwcK385DadzCf/GiIFZ/s=; b=Dt+Nd6iW2PWT2BboUeHXj49Qkn
	Fjms7qsOsZELH0oc4wtwugPD6a8MqzEDL/kpUQIX3zjfUxV9mYiIFlFUAYUbuWKdarDqDFrp6TJAx
	uCoqjVXJBB1fuw2oijmLSN57dAE6UMl4qU8I/9eZyzeFLK4Q/4CEs7MFZMjXM+A8RC0wZUgZpOUb6
	BAEZB2v5CZRIw6+UdzV3t1ZgVXXdA7h45mEIKfA1noSQxEBC9IVm8V0x5VYLmxuTvEUS70HMAcq0D
	hhh+vZb6EzfsVHt1cVFbrbperlGVszCkTRm99S6pflACz5AVgvCPCKE4jG0HNCMo3+o+7dQVIga0R
	R1uO1oRA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXqr-00000001eZb-3pWj;
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
Subject: [PATCH v2 32/50] convert binfmt_misc
Date: Tue, 28 Oct 2025 00:45:51 +0000
Message-ID: <20251028004614.393374-33-viro@zeniv.linux.org.uk>
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

removals are done with locked_recursive_removal(); switch creations to
simple_start_creating()/d_make_persistent()/simple_done_creating() and
take them to a helper (add_entry()), while we are at it - simpler control
flow that way.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/binfmt_misc.c | 69 ++++++++++++++++++++++--------------------------
 1 file changed, 32 insertions(+), 37 deletions(-)

diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
index a839f960cd4a..2093f9dcd321 100644
--- a/fs/binfmt_misc.c
+++ b/fs/binfmt_misc.c
@@ -765,14 +765,41 @@ static const struct file_operations bm_entry_operations = {
 
 /* /register */
 
+/* add to filesystem */
+static int add_entry(Node *e, struct super_block *sb)
+{
+	struct dentry *dentry = simple_start_creating(sb->s_root, e->name);
+	struct inode *inode;
+	struct binfmt_misc *misc;
+
+	if (IS_ERR(dentry))
+		return PTR_ERR(dentry);
+
+	inode = bm_get_inode(sb, S_IFREG | 0644);
+	if (unlikely(!inode)) {
+		simple_done_creating(dentry);
+		return -ENOMEM;
+	}
+
+	refcount_set(&e->users, 1);
+	e->dentry = dentry;
+	inode->i_private = e;
+	inode->i_fop = &bm_entry_operations;
+
+	d_make_persistent(dentry, inode);
+	misc = i_binfmt_misc(inode);
+	write_lock(&misc->entries_lock);
+	list_add(&e->list, &misc->entries);
+	write_unlock(&misc->entries_lock);
+	simple_done_creating(dentry);
+	return 0;
+}
+
 static ssize_t bm_register_write(struct file *file, const char __user *buffer,
 			       size_t count, loff_t *ppos)
 {
 	Node *e;
-	struct inode *inode;
 	struct super_block *sb = file_inode(file)->i_sb;
-	struct dentry *root = sb->s_root, *dentry;
-	struct binfmt_misc *misc;
 	int err = 0;
 	struct file *f = NULL;
 
@@ -803,39 +830,7 @@ static ssize_t bm_register_write(struct file *file, const char __user *buffer,
 		e->interp_file = f;
 	}
 
-	inode_lock(d_inode(root));
-	dentry = lookup_noperm(&QSTR(e->name), root);
-	err = PTR_ERR(dentry);
-	if (IS_ERR(dentry))
-		goto out;
-
-	err = -EEXIST;
-	if (d_really_is_positive(dentry))
-		goto out2;
-
-	inode = bm_get_inode(sb, S_IFREG | 0644);
-
-	err = -ENOMEM;
-	if (!inode)
-		goto out2;
-
-	refcount_set(&e->users, 1);
-	e->dentry = dget(dentry);
-	inode->i_private = e;
-	inode->i_fop = &bm_entry_operations;
-
-	d_instantiate(dentry, inode);
-	misc = i_binfmt_misc(inode);
-	write_lock(&misc->entries_lock);
-	list_add(&e->list, &misc->entries);
-	write_unlock(&misc->entries_lock);
-
-	err = 0;
-out2:
-	dput(dentry);
-out:
-	inode_unlock(d_inode(root));
-
+	err = add_entry(e, sb);
 	if (err) {
 		if (f)
 			filp_close(f, NULL);
@@ -1028,7 +1023,7 @@ static struct file_system_type bm_fs_type = {
 	.name		= "binfmt_misc",
 	.init_fs_context = bm_init_fs_context,
 	.fs_flags	= FS_USERNS_MOUNT,
-	.kill_sb	= kill_litter_super,
+	.kill_sb	= kill_anon_super,
 };
 MODULE_ALIAS_FS("binfmt_misc");
 
-- 
2.47.3


