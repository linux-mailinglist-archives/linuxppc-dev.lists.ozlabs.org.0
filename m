Return-Path: <linuxppc-dev+bounces-14252-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D87C67625
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:18:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9XsJ07lPz3f26;
	Tue, 18 Nov 2025 16:16:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763442994;
	cv=none; b=bidN4qm/5yP/Ss7crP9PoHMDV0NgxsguNHsDPDnpDc/KmsSEjEekg/3JHKVAr+9BAZXhzljc7SJ3vQbivHM5CC8Ak/g78SMOkUSJgYHWmiRAKUwsDlK3G7zdYSAz86WqKnfv1iJsSNIgopjg0rqxSAnzaTNEQwllfi7qbK4A6wG9wqLl5HTfsPvHMIpKVUSPUEOJgYU8Dntz7cJh2pie4sGMQhKryU4P4HfCsKCbvp1EFNkmFmtjYHpfDx35r/eN6BxFQCzbAR13wX/4i1X/YPs5JgkhiYzjD7sKxP9DIGymWJVT1SFVHUvQDJbweghwgJVHCBwTe2pZ+Lvn4NUSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763442994; c=relaxed/relaxed;
	bh=wpD3/Bm7sGWpOU7mqGoqyLeTupfR9EfJ0JdO0qw2AEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGEODs+XTWx1UOwftiXoWNOXMnetV3O4ylYKsKhTCZrIGPaqtM4i8+1nh0fF4iR1vNDFNo5iEJ+x+F+X5jk9HsaXV8dmbiQpIlMnBG0AJMarVaWonGt/4rpUzXSrsyD08L/aITzTTmQ22xCy1hFN7nZslrYzwYS0U8cdvOtT8zuDAg7n1VtgEwqxSDCfUBQ5xtcXUL8oCk92oqKp1kXkTk1lQgGtB796koJ4PfOD+XOAerFMaAF4b7LL62vktP/V1xC7mvMLrY1CC50H7LQyUuXzFhzqEnPGJFwYlpmmSgZeNAKpCeEa9yqIpy1nOJFIogKhdQK5mKX0qzk58rVMmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=JV5uJUt1; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=JV5uJUt1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xrz6QRcz30WD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=wpD3/Bm7sGWpOU7mqGoqyLeTupfR9EfJ0JdO0qw2AEQ=; b=JV5uJUt1ITFYYkAKYlbaasyk0N
	PW5LOmB0G7kEAnq97/Pz7SL51bNXf0DH11bVMNSSo4VwTsOpOeAHHK4hjh1p3gNPqgDjORQ4PbR8J
	KK7IVJelLsoIjwKAA7hEb/jarXycA6T50GWykdatgQp0BauELpU7gwCBfVEySxkZarZ3jA74FYqzk
	14zTBSbWYbuUP+E0SR2hyM5Imgnf1u0+rTSIuPM1/R7wCIuTMjeEEb6IZySpBQnw/dlJz2Ddi015D
	mo4bEEYz1oWEajNUCAw8mVLVUOHlcTH5qN9tMMRtFWAcpt6zvtZFD+/rj8NlfIFJO8X/JjIUZtHSM
	ubkRfpiQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4a-0000000GEfk-1u7R;
	Tue, 18 Nov 2025 05:16:12 +0000
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
Subject: [PATCH v4 51/54] get rid of kill_litter_super()
Date: Tue, 18 Nov 2025 05:16:00 +0000
Message-ID: <20251118051604.3868588-52-viro@zeniv.linux.org.uk>
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

Not used anymore.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 Documentation/filesystems/porting.rst |  7 +++++++
 fs/dcache.c                           | 21 ---------------------
 fs/internal.h                         |  1 -
 fs/super.c                            |  8 --------
 include/linux/dcache.h                |  1 -
 include/linux/fs.h                    |  1 -
 6 files changed, 7 insertions(+), 32 deletions(-)

diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesystems/porting.rst
index 7233b04668fc..4921b3b0662a 100644
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@ -1309,3 +1309,10 @@ a different length, use
 	vfs_parse_fs_qstr(fc, key, &QSTR_LEN(value, len))
 
 instead.
+
+---
+
+**mandatory**
+
+kill_litter_super() is gone; convert to DCACHE_PERSISTENT use (as all
+in-tree filesystems have done).
diff --git a/fs/dcache.c b/fs/dcache.c
index 3cc6c3876177..5ee2e78a91b3 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -3167,27 +3167,6 @@ bool is_subdir(struct dentry *new_dentry, struct dentry *old_dentry)
 }
 EXPORT_SYMBOL(is_subdir);
 
-static enum d_walk_ret d_genocide_kill(void *data, struct dentry *dentry)
-{
-	struct dentry *root = data;
-	if (dentry != root) {
-		if (d_unhashed(dentry) || !dentry->d_inode ||
-		    dentry->d_flags & DCACHE_PERSISTENT)
-			return D_WALK_SKIP;
-
-		if (!(dentry->d_flags & DCACHE_GENOCIDE)) {
-			dentry->d_flags |= DCACHE_GENOCIDE;
-			dentry->d_lockref.count--;
-		}
-	}
-	return D_WALK_CONTINUE;
-}
-
-void d_genocide(struct dentry *parent)
-{
-	d_walk(parent, parent, d_genocide_kill);
-}
-
 void d_mark_tmpfile(struct file *file, struct inode *inode)
 {
 	struct dentry *dentry = file->f_path.dentry;
diff --git a/fs/internal.h b/fs/internal.h
index 9b2b4d116880..144686af6c36 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -227,7 +227,6 @@ extern void shrink_dcache_for_umount(struct super_block *);
 extern struct dentry *__d_lookup(const struct dentry *, const struct qstr *);
 extern struct dentry *__d_lookup_rcu(const struct dentry *parent,
 				const struct qstr *name, unsigned *seq);
-extern void d_genocide(struct dentry *);
 
 /*
  * pipe.c
diff --git a/fs/super.c b/fs/super.c
index 5bab94fb7e03..ee001f684d2a 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1284,14 +1284,6 @@ void kill_anon_super(struct super_block *sb)
 }
 EXPORT_SYMBOL(kill_anon_super);
 
-void kill_litter_super(struct super_block *sb)
-{
-	if (sb->s_root)
-		d_genocide(sb->s_root);
-	kill_anon_super(sb);
-}
-EXPORT_SYMBOL(kill_litter_super);
-
 int set_anon_super_fc(struct super_block *sb, struct fs_context *fc)
 {
 	return set_anon_super(sb, NULL);
diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index 6ec4066825e3..20a85144a00e 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -198,7 +198,6 @@ enum dentry_flags {
 	DCACHE_REFERENCED		= BIT(6),	/* Recently used, don't discard. */
 	DCACHE_DONTCACHE		= BIT(7),	/* Purge from memory on final dput() */
 	DCACHE_CANT_MOUNT		= BIT(8),
-	DCACHE_GENOCIDE			= BIT(9),
 	DCACHE_SHRINK_LIST		= BIT(10),
 	DCACHE_OP_WEAK_REVALIDATE	= BIT(11),
 	/*
diff --git a/include/linux/fs.h b/include/linux/fs.h
index f5037c556f61..95933ceaae51 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2728,7 +2728,6 @@ void retire_super(struct super_block *sb);
 void generic_shutdown_super(struct super_block *sb);
 void kill_block_super(struct super_block *sb);
 void kill_anon_super(struct super_block *sb);
-void kill_litter_super(struct super_block *sb);
 void deactivate_super(struct super_block *sb);
 void deactivate_locked_super(struct super_block *sb);
 int set_anon_super(struct super_block *s, void *data);
-- 
2.47.3


