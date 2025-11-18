Return-Path: <linuxppc-dev+bounces-14260-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C88C6768E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:19:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9XsP5Ylyz3fJq;
	Tue, 18 Nov 2025 16:16:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763443000;
	cv=none; b=nW0AL6HALCJC7ZXxRT/fuRSJHQopeF8nBeh5x0p6UuX4iJ4JHInvktL0CZE5+NghC8Ztc4pUgEoMrmtA48WSD42ZzYrmMrWEFqTkqKRkNhXwcNSc0eW8AaVMk8DSFM1/jUTNUPj2gsh4o+vmEKa3Ha8UmayIueicP2LMm0Y3jVH26t1r7kPvn1LFMrNEqQplBWY5m0JQJik2Gf0Q9dw6AqgYv6tRKI2CsL9MLtcYDA2LqbIjw8rtJnsICgtl80It9jL5/BK9NTHj36oNJsBhVonbgQls8VQk86MVa0Paw2xgNeuhQwXNjJITjAjEqtV2wjI0dYumdZ34EXaZJiWpGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763443000; c=relaxed/relaxed;
	bh=bCMcASxW4GQs4KES7qr2omvwcK385DadzCf/GiIFZ/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W4lX9jjF7C2dTxJjgK1/TFzKHLIvbMiPVjYU/GbPWFYulAHmO0r1RUFFeD1Kc8izK96cJYat4GjdmTH4bES3oGpTPHuOci4lyvyC1a3kMync7HKT12IhbJMQXCcxFsAykncBE6eBxXPkw+ToEx463NUC8/WutLINM77iNzwMf+cvlKKHoMaaMVbZ6y0JoxLIJ6iKIwsLyztesyp8FjKuXRJOU+mcf3Mv9RNud9lls1+98hkYTOlnR2wKBh3r/OE351GhbD46IdNTX9/g70VE31QMmeuuNsoPgkwdao5NJzFH0kHRZenNxrlUXN00Ef9oX/UUADUV4emgpgtANdBHxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=uCkauw5A; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=uCkauw5A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xs05Nstz30dt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=bCMcASxW4GQs4KES7qr2omvwcK385DadzCf/GiIFZ/s=; b=uCkauw5A+4Bvso9qLFeFj1Mhln
	PxTRA/cPduLEhyO+A2VVz2/EmqJwyA16rNQdGxiP6j+kPNy+gsrgkZNUNqHyzC6x0nS6YHbtD9vw9
	GeCR6Z18w559fcISOe9iiR+5UGzVaERHrk5wgc7yAvdG9YCHheDQoqq793vXQZ9U6i1fiG5HYpML+
	a2Zv2RyYeCcw5rP7zDcZT01KnDtkdlEG88JZgU2nBbJx61YREp7hq6qeviV+CcQ8oSLhpTz45g7ZE
	A1BT1I9G+IskMCZjWdKaWk1WkSbgmQ7adytHh4E7gmlhjnevuliK6qicSbvVuvMt46sjTt2WEBove
	UQS2RpLw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4W-0000000GESp-26HW;
	Tue, 18 Nov 2025 05:16:08 +0000
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
Subject: [PATCH v4 32/54] convert binfmt_misc
Date: Tue, 18 Nov 2025 05:15:41 +0000
Message-ID: <20251118051604.3868588-33-viro@zeniv.linux.org.uk>
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


