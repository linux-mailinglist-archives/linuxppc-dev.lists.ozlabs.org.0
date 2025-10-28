Return-Path: <linuxppc-dev+bounces-13369-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBC6C12402
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 01:47:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwWsX6Mjpz3dWP;
	Tue, 28 Oct 2025 11:46:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761612400;
	cv=none; b=S2IAMz8khtPaFMV194B9hPua2Oh8NEN3talNh5Ib2fGr9vCzrCErnkuh3YwJje7KL290x6cYUT9ow4sbxvZMBgNEXKUItEyXerA49ZbHZPY+SP9gUetkRhb3BSL9DLxWo994obcvaXM9is7HovRuEjteyMNIhcCFTuDUtHBaFsD2/utXA7vd1wMnjkfLP8vIJD2K1/qsSEoGB+VzzYQiokvV1V/9EAPhZrrqTw4dACphAqkO5o89DF/Z6Q86NOLIRvDU/b3Mp5qTfObejyhUNKqHNwiet4B4yscQ+GSpF60FExx8lbNRwmTsyIc9BuefJB69LSDbLahTFRhZcfcGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761612400; c=relaxed/relaxed;
	bh=8VEUlF9JhG6FP5SEDR4ze5YZGwCC3RxL0G6kDzkTUDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yi5wZyg7ZCBa8TQuS2Bv5Mdet6pZefkD6Srq9mX1x0QCjXmFjKMurIcBPSno47OfFWC6Syg2fU1PLtVkl61V+AsOEupsns6VPMR6uNPqWVme1lgHd86NCoByMjOc7MaCDmT5CW2HoIBZ1OI/4QN3fLRRh2LTP7wwBcUqT54E4cHtQqprkGPqDwvZIKOaoo/yRQYEp5WTaJcuGeEqjSuAC7uyZfQ8H3NLKECTLP8gnx5lCbejvZwO83Z3/CzDOeefFRXjc1s3sad7GpXMgrJ57xgvLTW2+TwoeH3sDIRQn5wBVYzrtZKRfcx5zlNQx76vEjLyEHRbYm7qJkSGT4V2CA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=ZZi6wMhZ; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=ZZi6wMhZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwWsM6K2Lz30hN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 11:46:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=8VEUlF9JhG6FP5SEDR4ze5YZGwCC3RxL0G6kDzkTUDE=; b=ZZi6wMhZQmOlamZhoVFAN+5wJ0
	qn7ptGF3nnBZELZTTvCHFFxYcyQgGikSFr87FwlVC5rFdSl1je3r4NZeExdiMFlJV9n0UnLtoZBls
	kJ2JzKacJBnLvr916Buge0/yhNbkk6VrPnenxxNfx6fCM0XLYKHa1IG5Ay/kr/rNPylYz59mv9uCK
	2cdxz1Q7sCiwTvSQS8ZJMncDcPDgt8uvmVTJQhwonNzSEVJZ+Oeqc5iDEV16aWIXzYYba9BAWVzR4
	MUj1iEnBoNRgiAyJQZKdSLapuYAl2mILpO8J8AZsNBTUWcHHG/1Ladu85KDWZJ9kTw0PoK6gtQTD0
	z49FPwWg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXqp-00000001eWf-2Y4n;
	Tue, 28 Oct 2025 00:46:15 +0000
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
Subject: [PATCH v2 09/50] procfs: make /self and /thread_self dentries persistent
Date: Tue, 28 Oct 2025 00:45:28 +0000
Message-ID: <20251028004614.393374-10-viro@zeniv.linux.org.uk>
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
index 6299878e3d97..869677a26332 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -3585,14 +3585,12 @@ int proc_pid_readdir(struct file *file, struct dir_context *ctx)
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
index d1598576506c..c1e8eb984da8 100644
--- a/fs/proc/internal.h
+++ b/fs/proc/internal.h
@@ -373,6 +373,7 @@ static inline void proc_tty_init(void) {}
 extern struct proc_dir_entry proc_root;
 
 extern void proc_self_init(void);
+extern unsigned self_inum, thread_self_inum;
 
 /*
  * task_[no]mmu.c
diff --git a/fs/proc/root.c b/fs/proc/root.c
index 1e24e085c7d5..d8ca41d823e4 100644
--- a/fs/proc/root.c
+++ b/fs/proc/root.c
@@ -347,17 +347,11 @@ static void proc_kill_sb(struct super_block *sb)
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


