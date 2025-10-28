Return-Path: <linuxppc-dev+bounces-13404-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B520BC12587
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 01:51:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwWth4rXJz3fTv;
	Tue, 28 Oct 2025 11:47:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761612460;
	cv=none; b=khdtsOGDX/bIbiyI3gzOZqjSJHWBIvMnC1NpVR+dW9YsB5u6H94hTgw/tDiQQVD7yYRLJQ2gY/V1sCOoeQ/KTYyKZlnD+Xd2chyEL2SaJZgfbIt3zE3kN+Gcq9SJ58C3ehxTsarDjw7FRMXLTBNPdwHcHycibBfu9q+M/M/kxCBuTueyP7lZgTrzRN1J2R4VssgkOELxAC3FX0cSnaBBHK+iMX/mSGGxMFFjTtc5Si6XhUQb6jOYE5ldIZTvNZkcIzXM+facRQ3vkU8LrltDmZpVd46X/J3/fYbkZe8jUQVB1BO8m7Gdpn0lQVQH6VZ3l9fgpclm9M+Mwq01hhV2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761612460; c=relaxed/relaxed;
	bh=IB7wA0wn9kq4oYSSbdEKk+jzajBsWCKDcw62G4pXAEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XkH7nDhva0fC34FU5L4C99LKITcGHem3XmbCSBBY+FBcykl28uqZatNyAhruk1hhl4/wQ1J6OUbt/FmDzIQUXSsVBlMM0jCK8N/oprb+F4Rh/8gN7JSsgc+VaUOMl9AmUdGKiqDDWXYahVlMES8pnM17XUCDDMQWQtd0Yg1ShKV6+fTwEfGhlOxwtJhSOOyPUoottZ8pYu9IdVHGrzBIxkzrS/9/9Y7yXf5zvNxDwaPd0pcS0QhWan9R6oByncKhkqVf/jM9xeG/0UD0d0+CleBEQASi82B/bpURVEktugQgGKwXkczTsKlEI5AWIV9zDgT2x1AMgRZPr/j0I8yTHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=EbPZiJBf; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=EbPZiJBf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwWtf71HVz3cZL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 11:47:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=IB7wA0wn9kq4oYSSbdEKk+jzajBsWCKDcw62G4pXAEY=; b=EbPZiJBf0diW2/Ci6fQPYn6Jp9
	UVF8AdRM7j16koU+AET2zKguIIVi24r8ySvxjcePWT3utUedNDoOcgCHDVrEjJ8MbUeyrIfEKToRk
	ACuPFRIeyuXKTgzWj8GO+HMkQGS0h29HL202KSMMt8vUMaqsO4NE9FAf1YFTyb35bxyE5MpDasvAs
	kGBSugH7dYow7RHC+en6+HsaDrFlS/gkPlw6XWCZGRjnSIPH72kXRnhLYIit9XH3eo5oooarQ8NRf
	Z4XUb7qjfoEAoQ2CSki+R2MK4YrlS67NRW1QEPuyXm2iNr8Bk/fUql8yuX2Z752bTXE8oK2S1N7fA
	rTZFQ1IA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXqr-00000001eZT-3KDS;
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
Subject: [PATCH v2 31/50] convert autofs
Date: Tue, 28 Oct 2025 00:45:50 +0000
Message-ID: <20251028004614.393374-32-viro@zeniv.linux.org.uk>
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

creation/removal is via normal VFS paths; make ->mkdir() and ->symlink()
use d_make_persistent(); ->rmdir() and ->unlink() - d_make_discardable()
instead of dput() and that's it.

d_make_persistent() works for unhashed just fine...

Note that only persistent dentries are ever hashed there; unusual absense
of ->d_delete() in dentry_operations is due to that - anything that has
refcount reach 0 will be unhashed there, so it won't get to checking
->d_delete anyway.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/autofs/inode.c |  2 +-
 fs/autofs/root.c  | 10 ++++------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/autofs/inode.c b/fs/autofs/inode.c
index f5c16ffba013..eb86f893efbb 100644
--- a/fs/autofs/inode.c
+++ b/fs/autofs/inode.c
@@ -55,7 +55,7 @@ void autofs_kill_sb(struct super_block *sb)
 	}
 
 	pr_debug("shutting down\n");
-	kill_litter_super(sb);
+	kill_anon_super(sb);
 	if (sbi)
 		kfree_rcu(sbi, rcu);
 }
diff --git a/fs/autofs/root.c b/fs/autofs/root.c
index 39794633d484..fb6c8215456c 100644
--- a/fs/autofs/root.c
+++ b/fs/autofs/root.c
@@ -594,9 +594,8 @@ static int autofs_dir_symlink(struct mnt_idmap *idmap,
 	}
 	inode->i_private = cp;
 	inode->i_size = size;
-	d_add(dentry, inode);
 
-	dget(dentry);
+	d_make_persistent(dentry, inode);
 	p_ino = autofs_dentry_ino(dentry->d_parent);
 	p_ino->count++;
 
@@ -627,7 +626,7 @@ static int autofs_dir_unlink(struct inode *dir, struct dentry *dentry)
 
 	p_ino = autofs_dentry_ino(dentry->d_parent);
 	p_ino->count--;
-	dput(dentry);
+	d_make_discardable(dentry);
 
 	d_inode(dentry)->i_size = 0;
 	clear_nlink(d_inode(dentry));
@@ -709,7 +708,7 @@ static int autofs_dir_rmdir(struct inode *dir, struct dentry *dentry)
 
 	p_ino = autofs_dentry_ino(dentry->d_parent);
 	p_ino->count--;
-	dput(dentry);
+	d_make_discardable(dentry);
 	d_inode(dentry)->i_size = 0;
 	clear_nlink(d_inode(dentry));
 
@@ -739,12 +738,11 @@ static struct dentry *autofs_dir_mkdir(struct mnt_idmap *idmap,
 	inode = autofs_get_inode(dir->i_sb, S_IFDIR | mode);
 	if (!inode)
 		return ERR_PTR(-ENOMEM);
-	d_add(dentry, inode);
 
 	if (sbi->version < 5)
 		autofs_set_leaf_automount_flags(dentry);
 
-	dget(dentry);
+	d_make_persistent(dentry, inode);
 	p_ino = autofs_dentry_ino(dentry->d_parent);
 	p_ino->count++;
 	inc_nlink(dir);
-- 
2.47.3


