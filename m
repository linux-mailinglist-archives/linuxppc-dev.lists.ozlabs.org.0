Return-Path: <linuxppc-dev+bounces-12473-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ED7B8C30E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:51:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1l4cSrz3dwG;
	Sat, 20 Sep 2025 17:48:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354507;
	cv=none; b=FkPa5Muc0RqML35++7swrgCNRNYEqwBpWXDEM6MCa+cpWf63uPWtgysw1oll8ZH9HtlznHOd8kqvCoN5AwketMBXAnd7K/WWnDfVnEQ4w6KkB/A/M53pCu3C8PAfsULBoVNJrwbU0sjDecwOYBv6En/AgPK+Q4Ape5JmSDobgZ5ljOEcxaYDvdO5zh4vv2tjHqByhLFjcJHOJ5MVb1IXxlTofnRtZEYbJ/4FNZ2dngPghcptrqRlDoSh7HoPIspJ3dEqPpeVMzZBa/Yg46vGftgojswZs+YRKTrzSmqpmhrGHs5Elk6vNYseGTSXjLuCmNwnsw3ZrCDAB9nFcaKqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354507; c=relaxed/relaxed;
	bh=UN/hLnhmlCpkyT8pqk8o93EYJOuBVPC2UlrPzhJvYOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=egBqCUfc1tbpXh82JfSsPTOFrzCVccm7Qe9e08ytHrbzpWvx4Udj0AH0C+V0IYgqejNt6Jxj9J41opB0wrDlknJ8BKgs7T1zW74y/4NgGY78B4efL7jsbTEBW7weQl8bBy/CuCui6k6IA6voLVKDehw3DJu3PGhQPZDYhLlrOyR06bYty+tRJDbhU5Ekm8Jm5Q4HxGNX+mjWutivs3hTzdy9xAN8yeiUwKZoNAivMY1Aig1ZwxFf4aL/zaFXnwPiVLTW1nEr7bwvugKDPERyjl7oQmwVlx18UVmmCw1Yn9ttL9UkmUGnu0Q33IquIWRQp85irZYBnQKHkLYmiqbNhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=CuGI/d4s; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=CuGI/d4s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1V4NYdz3clB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=UN/hLnhmlCpkyT8pqk8o93EYJOuBVPC2UlrPzhJvYOk=; b=CuGI/d4sHECg4YG3QFRhwKGiio
	LZQLZ1AXIY0v2XvKXbsCbePxX3q82OZKpg6vOx/Hz/VGZIfhjGt/HsTLzoILkroLlOL5AHTH6fNaX
	z5m03HHpSlr3GjXUVAmhMmat4/hLKWnGYxShcLURw57cE2opHIKdkxco/PYvshUkM3dRb0NtexIgU
	WE0qEJMxd6DAWz3vBxhX4RVDd8tJiaklJjVtw+DbAtE11fu3yBwpTFpRuLhn4+WRjEl7uTfa0wv0R
	ygYS/byzth1L95yZPqBMRCbAkXlqLmiRbw5W6hEDt6k7/Hx4FEDT3gtOHe4e2CYi3e5Oim0kM0VGY
	/8l8Zepw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsKE-0000000ExJf-3qxA;
	Sat, 20 Sep 2025 07:48:07 +0000
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
Subject: [PATCH 31/39] convert selinuxfs
Date: Sat, 20 Sep 2025 08:47:50 +0100
Message-ID: <20250920074759.3564072-31-viro@zeniv.linux.org.uk>
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

Tree has invariant part + two subtrees that get replaced upon each
policy load.  Invariant parts stay for the lifetime of filesystem,
these two subdirs - from policy load to policy load (serialized
on lock_rename(root, ...)).

All object creations are via d_alloc_name()+d_add() inside selinuxfs,
all removals are via simple_recursive_removal().

Turn those d_add() into d_make_persistent()+dput() and that's mostly it.
Don't bother to store the dentry of /policy_capabilities - it belongs
to invariant part of tree and we only use it to populate that directory,
so there's no reason to keep it around afterwards.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 security/selinux/selinuxfs.c | 52 +++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index 9aa1d03ab612..dc1bb49664f2 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -75,7 +75,6 @@ struct selinux_fs_info {
 	struct dentry *class_dir;
 	unsigned long last_class_ino;
 	bool policy_opened;
-	struct dentry *policycap_dir;
 	unsigned long last_ino;
 	struct super_block *sb;
 };
@@ -1404,7 +1403,8 @@ static int sel_make_bools(struct selinux_policy *newpolicy, struct dentry *bool_
 		isec->initialized = LABEL_INITIALIZED;
 		inode->i_fop = &sel_bool_ops;
 		inode->i_ino = i|SEL_BOOL_INO_OFFSET;
-		d_add(dentry, inode);
+		d_make_persistent(dentry, inode);
+		dput(dentry);
 	}
 out:
 	free_page((unsigned long)page);
@@ -1614,7 +1614,8 @@ static int sel_make_avc_files(struct dentry *dir)
 
 		inode->i_fop = files[i].ops;
 		inode->i_ino = ++fsi->last_ino;
-		d_add(dentry, inode);
+		d_make_persistent(dentry, inode);
+		dput(dentry);
 	}
 
 	return 0;
@@ -1645,7 +1646,8 @@ static int sel_make_ss_files(struct dentry *dir)
 
 		inode->i_fop = files[i].ops;
 		inode->i_ino = ++fsi->last_ino;
-		d_add(dentry, inode);
+		d_make_persistent(dentry, inode);
+		dput(dentry);
 	}
 
 	return 0;
@@ -1696,7 +1698,8 @@ static int sel_make_initcon_files(struct dentry *dir)
 
 		inode->i_fop = &sel_initcon_ops;
 		inode->i_ino = i|SEL_INITCON_INO_OFFSET;
-		d_add(dentry, inode);
+		d_make_persistent(dentry, inode);
+		dput(dentry);
 	}
 
 	return 0;
@@ -1800,7 +1803,8 @@ static int sel_make_perm_files(struct selinux_policy *newpolicy,
 		inode->i_fop = &sel_perm_ops;
 		/* i+1 since perm values are 1-indexed */
 		inode->i_ino = sel_perm_to_ino(classvalue, i + 1);
-		d_add(dentry, inode);
+		d_make_persistent(dentry, inode);
+		dput(dentry);
 	}
 	rc = 0;
 out:
@@ -1831,7 +1835,8 @@ static int sel_make_class_dir_entries(struct selinux_policy *newpolicy,
 
 	inode->i_fop = &sel_class_ops;
 	inode->i_ino = sel_class_to_ino(index);
-	d_add(dentry, inode);
+	d_make_persistent(dentry, inode);
+	dput(dentry);
 
 	dentry = sel_make_dir(dir, "perms", &fsi->last_class_ino);
 	if (IS_ERR(dentry))
@@ -1879,7 +1884,7 @@ static int sel_make_classes(struct selinux_policy *newpolicy,
 	return rc;
 }
 
-static int sel_make_policycap(struct selinux_fs_info *fsi)
+static int sel_make_policycap(struct selinux_fs_info *fsi, struct dentry *dir)
 {
 	unsigned int iter;
 	struct dentry *dentry = NULL;
@@ -1887,10 +1892,10 @@ static int sel_make_policycap(struct selinux_fs_info *fsi)
 
 	for (iter = 0; iter <= POLICYDB_CAP_MAX; iter++) {
 		if (iter < ARRAY_SIZE(selinux_policycap_names))
-			dentry = d_alloc_name(fsi->policycap_dir,
+			dentry = d_alloc_name(dir,
 					      selinux_policycap_names[iter]);
 		else
-			dentry = d_alloc_name(fsi->policycap_dir, "unknown");
+			dentry = d_alloc_name(dir, "unknown");
 
 		if (dentry == NULL)
 			return -ENOMEM;
@@ -1903,7 +1908,8 @@ static int sel_make_policycap(struct selinux_fs_info *fsi)
 
 		inode->i_fop = &sel_policycap_ops;
 		inode->i_ino = iter | SEL_POLICYCAP_INO_OFFSET;
-		d_add(dentry, inode);
+		d_make_persistent(dentry, inode);
+		dput(dentry);
 	}
 
 	return 0;
@@ -1929,11 +1935,12 @@ static struct dentry *sel_make_dir(struct dentry *dir, const char *name,
 	inode->i_ino = ++(*ino);
 	/* directory inodes start off with i_nlink == 2 (for "." entry) */
 	inc_nlink(inode);
-	d_add(dentry, inode);
+	d_make_persistent(dentry, inode);
 	/* bump link count on parent directory, too */
 	inc_nlink(d_inode(dir));
 
-	return dentry;
+	dput(dentry);
+	return dentry; // borrowed
 }
 
 static int reject_all(struct mnt_idmap *idmap, struct inode *inode, int mask)
@@ -1966,10 +1973,11 @@ static struct dentry *sel_make_swapover_dir(struct super_block *sb,
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
@@ -2040,7 +2048,8 @@ static int sel_fill_super(struct super_block *sb, struct fs_context *fc)
 	isec->initialized = LABEL_INITIALIZED;
 
 	init_special_inode(inode, S_IFCHR | S_IRUGO | S_IWUGO, MKDEV(MEM_MAJOR, 3));
-	d_add(dentry, inode);
+	d_make_persistent(dentry, inode);
+	dput(dentry);
 
 	dentry = sel_make_dir(sb->s_root, "avc", &fsi->last_ino);
 	if (IS_ERR(dentry)) {
@@ -2079,15 +2088,14 @@ static int sel_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto err;
 	}
 
-	fsi->policycap_dir = sel_make_dir(sb->s_root, POLICYCAP_DIR_NAME,
+	dentry = sel_make_dir(sb->s_root, POLICYCAP_DIR_NAME,
 					  &fsi->last_ino);
-	if (IS_ERR(fsi->policycap_dir)) {
-		ret = PTR_ERR(fsi->policycap_dir);
-		fsi->policycap_dir = NULL;
+	if (IS_ERR(dentry)) {
+		ret = PTR_ERR(dentry);
 		goto err;
 	}
 
-	ret = sel_make_policycap(fsi);
+	ret = sel_make_policycap(fsi, dentry);
 	if (ret) {
 		pr_err("SELinux: failed to load policy capabilities\n");
 		goto err;
@@ -2119,7 +2127,7 @@ static int sel_init_fs_context(struct fs_context *fc)
 static void sel_kill_sb(struct super_block *sb)
 {
 	selinux_fs_info_free(sb);
-	kill_litter_super(sb);
+	kill_anon_super(sb);
 }
 
 static struct file_system_type sel_fs_type = {
-- 
2.47.3


