Return-Path: <linuxppc-dev+bounces-12442-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C32AAB8C1A9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:48:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1P5tmcz3cYR;
	Sat, 20 Sep 2025 17:48:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354489;
	cv=none; b=M2dEODriuwc/lIA7qUro33Li9Bshi3HaZQA61fDdHOzqMUz3UCIGLpKabTCx3GvGgmOJaWNTUvmXXUfm8zc2Ep83CQkg9YQ8+ouElp8Mkk4NgszSyRJRfkA8w0PNVYtWWWk8+NK1M1vRx3PSR9FYiTikvk0w629Yq8J+KcYp4SUFLoBNq42NzuNrhZcQiguzZqbBRp0LlfRnIGH1XXpPB0wAa5OhzJdzSeuLVbqaKadDFS50iJXNvJdGemcQGrOUpQB5wtZ5xXNuS6lN6mPQM7m0rk0gKnWwbeKfHTZEfYk6I5RiVTczOUMk8lq6CBJVjB/xmcH7IAl8haNcpQraNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354489; c=relaxed/relaxed;
	bh=PAHSdKFZnF4Zow5YQA+xZ1lkb5Ydb+4Xwjcy3wk/6d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSmxNZzHPmso8bNoLsFLlX9TMYtVpZDL76gfcGexj544F7lnKmbo+6EvT6P1m33QgBNicZNukaSYCdgjETSQ0Vn/QE5NbRCPSKaXJbODfdf/5wn1nsXFdPAHjCGN/ttXUn08Sicd1ULAfNkIA9+/aLjBs0by2KXZk9aGeh3WP68LkheGV8R+OqIle2kemSVIwP5+Hnx+ilESi6UIEhRiwqIvdYGt6IcKvIgXtLrfr2RDt/OUR0VEs91T5WeLIz2eYSL6lH7yfY1oxdvvE9Q9IXleYawhT6MKQSFpYYJKmOUsc6yyEVct70TKisUW2Xdi46F6arBdVbpz4t7RdCLdqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=AQsoIyYj; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=AQsoIyYj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1N3Cmwz2ytg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=PAHSdKFZnF4Zow5YQA+xZ1lkb5Ydb+4Xwjcy3wk/6d4=; b=AQsoIyYjFl5JWsVoWRzNaCVStQ
	vfys2KyjQRZsc+oeGdfzgBSJpg3xWyZFHINqZvwJAziA91IMOtKItmxc1KDPkt0i6g5b13GWHHUNa
	PzZSQvGOVcmh4oE0GnFRnGbTL4GLrUs7T9THfqQjcHZpIFMadfIPbv0iuRdZ1Fs8l+vyrryvzxWcC
	SPERbfKp6XLxjdyiPMwaIYZ+9NAglN6uRStI02sMIHWP7wV7hX8fG7bJdjsfFwzHeq9GQzM4bJGc8
	++/1XTR87dLoJozQkKIvWstA1ZlBoZ3R5HKA7oNIhRLMhFnYU9j15bZPzbCbDEW7pap4SPWsVpifV
	rFnv3rvQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsK8-0000000ExCP-3wgx;
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
Subject: [PATCH 07/39] procfs: make /self and /thread_self dentries persistent
Date: Sat, 20 Sep 2025 08:47:26 +0100
Message-ID: <20250920074759.3564072-7-viro@zeniv.linux.org.uk>
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

... and there's no need to remember those pointers anywhere - ->kill_sb()
no longer needs to bother since kill_anon_super() will take care of
them anyway and proc_pid_readdir() only wants the inumbers, which
we had in a couple of static variables all along.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/proc/base.c          |  6 ++----
 fs/proc/internal.h      |  1 +
 fs/proc/root.c          | 14 ++++----------
 fs/proc/self.c          | 10 +++-------
 fs/proc/thread_self.c   | 11 +++--------
 include/linux/proc_fs.h |  2 --
 6 files changed, 13 insertions(+), 31 deletions(-)

diff --git a/fs/proc/base.c b/fs/proc/base.c
index 62d35631ba8c..f5071b0bdb1b 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -3583,14 +3583,12 @@ int proc_pid_readdir(struct file *file, struct dir_context *ctx)
 		return 0;
 
 	if (pos == TGID_OFFSET - 2) {
-		struct inode *inode = d_inode(fs_info->proc_self);
-		if (!dir_emit(ctx, "self", 4, inode->i_ino, DT_LNK))
+		if (!dir_emit(ctx, "self", 4, self_inum, DT_LNK))
 			return 0;
 		ctx->pos = pos = pos + 1;
 	}
 	if (pos == TGID_OFFSET - 1) {
-		struct inode *inode = d_inode(fs_info->proc_thread_self);
-		if (!dir_emit(ctx, "thread-self", 11, inode->i_ino, DT_LNK))
+		if (!dir_emit(ctx, "thread-self", 11, thread_self_inum, DT_LNK))
 			return 0;
 		ctx->pos = pos = pos + 1;
 	}
diff --git a/fs/proc/internal.h b/fs/proc/internal.h
index e737401d7383..e165e406c14d 100644
--- a/fs/proc/internal.h
+++ b/fs/proc/internal.h
@@ -373,6 +373,7 @@ static inline void proc_tty_init(void) {}
 extern struct proc_dir_entry proc_root;
 
 extern void proc_self_init(void);
+extern unsigned self_inum, thread_self_inum;
 
 /*
  * task_[no]mmu.c
diff --git a/fs/proc/root.c b/fs/proc/root.c
index ed86ac710384..7cedc08b92d3 100644
--- a/fs/proc/root.c
+++ b/fs/proc/root.c
@@ -261,17 +261,11 @@ static void proc_kill_sb(struct super_block *sb)
 {
 	struct proc_fs_info *fs_info = proc_sb_info(sb);
 
-	if (!fs_info) {
-		kill_anon_super(sb);
-		return;
-	}
-
-	dput(fs_info->proc_self);
-	dput(fs_info->proc_thread_self);
-
 	kill_anon_super(sb);
-	put_pid_ns(fs_info->pid_ns);
-	kfree_rcu(fs_info, rcu);
+	if (fs_info) {
+		put_pid_ns(fs_info->pid_ns);
+		kfree_rcu(fs_info, rcu);
+	}
 }
 
 static struct file_system_type proc_fs_type = {
diff --git a/fs/proc/self.c b/fs/proc/self.c
index b46fbfd22681..62d2c0cfe35c 100644
--- a/fs/proc/self.c
+++ b/fs/proc/self.c
@@ -31,12 +31,11 @@ static const struct inode_operations proc_self_inode_operations = {
 	.get_link	= proc_self_get_link,
 };
 
-static unsigned self_inum __ro_after_init;
+unsigned self_inum __ro_after_init;
 
 int proc_setup_self(struct super_block *s)
 {
 	struct inode *root_inode = d_inode(s->s_root);
-	struct proc_fs_info *fs_info = proc_sb_info(s);
 	struct dentry *self;
 	int ret = -ENOMEM;
 
@@ -51,18 +50,15 @@ int proc_setup_self(struct super_block *s)
 			inode->i_uid = GLOBAL_ROOT_UID;
 			inode->i_gid = GLOBAL_ROOT_GID;
 			inode->i_op = &proc_self_inode_operations;
-			d_add(self, inode);
+			d_make_persistent(self, inode);
 			ret = 0;
-		} else {
-			dput(self);
 		}
+		dput(self);
 	}
 	inode_unlock(root_inode);
 
 	if (ret)
 		pr_err("proc_fill_super: can't allocate /proc/self\n");
-	else
-		fs_info->proc_self = self;
 
 	return ret;
 }
diff --git a/fs/proc/thread_self.c b/fs/proc/thread_self.c
index 0e5050d6ab64..d6113dbe58e0 100644
--- a/fs/proc/thread_self.c
+++ b/fs/proc/thread_self.c
@@ -31,12 +31,11 @@ static const struct inode_operations proc_thread_self_inode_operations = {
 	.get_link	= proc_thread_self_get_link,
 };
 
-static unsigned thread_self_inum __ro_after_init;
+unsigned thread_self_inum __ro_after_init;
 
 int proc_setup_thread_self(struct super_block *s)
 {
 	struct inode *root_inode = d_inode(s->s_root);
-	struct proc_fs_info *fs_info = proc_sb_info(s);
 	struct dentry *thread_self;
 	int ret = -ENOMEM;
 
@@ -51,19 +50,15 @@ int proc_setup_thread_self(struct super_block *s)
 			inode->i_uid = GLOBAL_ROOT_UID;
 			inode->i_gid = GLOBAL_ROOT_GID;
 			inode->i_op = &proc_thread_self_inode_operations;
-			d_add(thread_self, inode);
+			d_make_persistent(thread_self, inode);
 			ret = 0;
-		} else {
-			dput(thread_self);
 		}
+		dput(thread_self);
 	}
 	inode_unlock(root_inode);
 
 	if (ret)
 		pr_err("proc_fill_super: can't allocate /proc/thread-self\n");
-	else
-		fs_info->proc_thread_self = thread_self;
-
 	return ret;
 }
 
diff --git a/include/linux/proc_fs.h b/include/linux/proc_fs.h
index f139377f4b31..19d1c5e5f335 100644
--- a/include/linux/proc_fs.h
+++ b/include/linux/proc_fs.h
@@ -66,8 +66,6 @@ enum proc_pidonly {
 
 struct proc_fs_info {
 	struct pid_namespace *pid_ns;
-	struct dentry *proc_self;        /* For /proc/self */
-	struct dentry *proc_thread_self; /* For /proc/thread-self */
 	kgid_t pid_gid;
 	enum proc_hidepid hide_pid;
 	enum proc_pidonly pidonly;
-- 
2.47.3


