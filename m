Return-Path: <linuxppc-dev+bounces-14253-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8D0C67645
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:18:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9XsJ0zG5z3f46;
	Tue, 18 Nov 2025 16:16:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763442994;
	cv=none; b=Heww/6pNJYJBQhrWUFrrk3kyxe77Kw7MA661C/eymV6vo+qOOjbTQQtSGdU/SLfhxhG1mQN9bds3jTLaGSMJOu4ry+2ThjpXaJjiRihQQJrGkaWYYTfESeco4ys1hMGNjarIxEl52p4R8rWBSDq8dFpmbXtc7zqeLXBH3MgXmItzvY75/9MG8m95F7U/UjwOz/5HIcNGtPP4eHDhV7K3CubqMQWBvoEyxUnIQ3E6wcr8Krdb5xl3lCUxREyqvSzKTmPQUr2Im5ztYgKpMEwzFUvKaDYEk6nbSU7MMEND8gk5sl7JSflF1Cr4f0Mm6m6rNjafr6Ptw/kAYa+UEkKwfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763442994; c=relaxed/relaxed;
	bh=FZUuqKrs+nqWkpfLt5q4RrHggbnk1CWWQm+NX1Cw0DM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZXu3lL5caleb2CH7fKoFrMK+uWzcnzfRFFSUDtzVh021QDdRcaG7hsr9qbXfr2q7tDgL0dvW6GNrvR1stqdK1ngyOiMBVKDBuhLDpafHE4XIFoirhYkNWfB+5IoJ7yeJYnWUC+1gFauG2QPG4FXRleG9EnEfBQdRuOUworLjI9LcR7LQ6JVl6yLUSe0uAPnUndKyUgIHgCQzgS8i9rWsBdvvRrb9uI7EBcQ1SnpKLH0NValj0cDN7LyhSe7qaJZBG8c9QF8aTTXUWp+8c0GBwwOTjV7vbgNpEvKenPMDnFKe1uiSv9psHfTMSUSYwZnPDklt5hOBJTEWELc2MJSogQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=YJuOa56O; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=YJuOa56O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xrz5lgSz30W9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=FZUuqKrs+nqWkpfLt5q4RrHggbnk1CWWQm+NX1Cw0DM=; b=YJuOa56O1MjxYGTgaENOoy61GE
	pW9BzUrfOK+4o3p4qm+AJO0GBRfVwfQIkuRSUxdY+22Q3QUMcnZIT7TV5oOi/iLqJgLHtYRjjp0Cz
	icaAAzCWMnLekniPfnn9IyaYt1f9ZUuMsv1I+L50s53kJJCvGsOd5aHDpW1EkZAH+UEd0J0GlZPjs
	pjfdjwxDOhzoiPPnLnBcovS5mXBMc2w/Pwa8nhiquqr7IPOWftRwjnGCeHNTQ76lgTpBvLJwnm24o
	GlJGTEgxKAwsZtFGDSsdzA5CdC9Wz+bO6RgwK3mR7wGYbekp/XVbxHmh7icarI9y/w9mr+YZhhyQL
	2EEZJN9g==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4W-0000000GET9-3lku;
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
Subject: [PATCH v4 35/54] convert selinuxfs
Date: Tue, 18 Nov 2025 05:15:44 +0000
Message-ID: <20251118051604.3868588-36-viro@zeniv.linux.org.uk>
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

Tree has invariant part + two subtrees that get replaced upon each
policy load.  Invariant parts stay for the lifetime of filesystem,
these two subdirs - from policy load to policy load (serialized
on lock_rename(root, ...)).

All object creations are via d_alloc_name()+d_add() inside selinuxfs,
all removals are via simple_recursive_removal().

Turn those d_add() into d_make_persistent()+dput() and that's mostly it.

Acked-by: Paul Moore <paul@paul-moore.com>
Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Tested-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 security/selinux/selinuxfs.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index f088776dbbd3..eae565358db4 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -1205,7 +1205,8 @@ static struct dentry *sel_attach(struct dentry *parent, const char *name,
 		iput(inode);
 		return ERR_PTR(-ENOMEM);
 	}
-	d_add(dentry, inode);
+	d_make_persistent(dentry, inode);
+	dput(dentry);
 	return dentry;
 }
 
@@ -1934,10 +1935,11 @@ static struct dentry *sel_make_swapover_dir(struct super_block *sb,
 	/* directory inodes start off with i_nlink == 2 (for "." entry) */
 	inc_nlink(inode);
 	inode_lock(sb->s_root->d_inode);
-	d_add(dentry, inode);
+	d_make_persistent(dentry, inode);
 	inc_nlink(sb->s_root->d_inode);
 	inode_unlock(sb->s_root->d_inode);
-	return dentry;
+	dput(dentry);
+	return dentry;	// borrowed
 }
 
 #define NULL_FILE_NAME "null"
@@ -2080,7 +2082,7 @@ static int sel_init_fs_context(struct fs_context *fc)
 static void sel_kill_sb(struct super_block *sb)
 {
 	selinux_fs_info_free(sb);
-	kill_litter_super(sb);
+	kill_anon_super(sb);
 }
 
 static struct file_system_type sel_fs_type = {
-- 
2.47.3


