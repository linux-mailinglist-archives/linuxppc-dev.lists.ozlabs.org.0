Return-Path: <linuxppc-dev+bounces-12468-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D6AB8C2BD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:51:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1h2wCFz3dTp;
	Sat, 20 Sep 2025 17:48:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354504;
	cv=none; b=CwE8bnMK11fF4ypzBX0ur+gcSz1i/gu2R17K+okZxJo6EHQHWCZp8dLYSKsRT6NgmqbwHd79qblWxTNKf76k7HhYsMRAupWVc2giPGCTB8vIq0gmwzxuKworTpWTnmVGmwhNi9aA8QQdHx9Mx4GLpDd5UPVpTYfrGs3AQe7CeUQc15tSxTaxK+cpYeAU/a521PP8Ip7zQBWxSWJ5MeIHpEijBIviflfEeVe58RZ7bvcTqR3NIp8j+HKAxlYJsSSK6y/5VjQff/vIVjcOOoh9eStyL73ZKXXficsMtq0790c6B3t26gcRhE+VrmDLyRLwXAlHAS2eLWC3FC1Fy9v8aA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354504; c=relaxed/relaxed;
	bh=kzaFEv9+OIThBqJRm4CcvwF2gfE3udH1o+XUKpNiExM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZmsrqmEqCv1IaZu2JXpG2ObC49a+irSlg9MeOvt/pwq8N6xUsBA/BRG+pONat6je0rpszBuZDtrEkbs0Yc/AaqsyS7Xlqa9rC9671iNucUhkkDk9+3YwVYfaJTrra/NXgDFRzdcWPjAlLJRaEZqc4RB0RGV7ON3p+DbySov998CmLxOemcgali0uRZ2OfvdjtD2vU6NRt8f7yyRhpejWnyRoO8iNzgRiWFgBtXzNtUCz/30OJTHjfBcvX3cDaq1TgEoSYsaOJWsmgEIvhNamSlLN211HGfL8hbjGQ2xieG7rDiZh6HXafHr87AMVe9+dhCykbr8OjTNHtCs2sOhvTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=PKvPJeUS; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=PKvPJeUS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1S5DwVz3cgJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=kzaFEv9+OIThBqJRm4CcvwF2gfE3udH1o+XUKpNiExM=; b=PKvPJeUSUjSO2jC97UPtEsuYBU
	GhiacjgwtBT6JQG90tbTfMRaSqqvIDDy4hZCGHN867cVzcsKpZxc0ZXU6bd3PB1nZ7RWhPob23QZM
	gfBH5Pyt46stlc2x2of7psdlMvl5xDPys0pjr3+vdSTAlLapKkri20i7gCEwBI0B4lZLfyCHffXWX
	zx1mEDtSqDxvd6k3H1eAiboEEK1/4CtBqGiPdMeVovMQ3YjjX/pUIvyitm8wv2qrDbkBY0MneSVPd
	dmZC4zA52c1iFUpCX/lSvSWWpiYgygmmzNWfUcprkCy7eeGx+OespGnKo2/lrnpSTF8X96df+V+Ir
	INk+Kwew==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsKD-0000000ExHf-1LEH;
	Sat, 20 Sep 2025 07:48:05 +0000
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
Subject: [PATCH 27/39] convert binderfs
Date: Sat, 20 Sep 2025 08:47:46 +0100
Message-ID: <20250920074759.3564072-27-viro@zeniv.linux.org.uk>
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

Objects are created either by d_alloc_name()+d_add() (in
binderfs_ctl_create()) or by simple_start_creating()+d_instantiate().
Removals are by simple_recurisive_removal().

Switch d_add()/d_instantiate() to d_make_persistent() + dput().
Voila - kill_litter_super() is not needed anymore.

Fold dput()+unlocking the parent into simple_done_creating(), while
we are at it.

NOTE: return value of binderfs_create_file() is borrowed; it may get
stored in proc->binderfs_entry.  See binder_release()...

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 drivers/android/binderfs.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
index bb81280a3e9f..20c5b34fc775 100644
--- a/drivers/android/binderfs.c
+++ b/drivers/android/binderfs.c
@@ -187,9 +187,9 @@ static int binderfs_binder_device_create(struct inode *ref_inode,
 		goto err;
 	}
 	inode->i_private = device;
-	d_instantiate(dentry, inode);
+	d_make_persistent(dentry, inode);
 	fsnotify_create(root->d_inode, dentry);
-	inode_unlock(d_inode(root));
+	simple_done_creating(dentry);
 
 	binder_add_device(device);
 
@@ -430,7 +430,8 @@ static int binderfs_binder_ctl_create(struct super_block *sb)
 
 	inode->i_private = device;
 	info->control_dentry = dentry;
-	d_add(dentry, inode);
+	d_make_persistent(dentry, inode);
+	dput(dentry);
 
 	return 0;
 
@@ -477,19 +478,16 @@ struct dentry *binderfs_create_file(struct dentry *parent, const char *name,
 	sb = parent_inode->i_sb;
 	new_inode = binderfs_make_inode(sb, S_IFREG | 0444);
 	if (!new_inode) {
-		dput(dentry);
-		dentry = ERR_PTR(-ENOMEM);
-		goto out;
+		simple_done_creating(dentry);
+		return ERR_PTR(-ENOMEM);
 	}
 
 	new_inode->i_fop = fops;
 	new_inode->i_private = data;
-	d_instantiate(dentry, new_inode);
+	d_make_persistent(dentry, new_inode);
 	fsnotify_create(parent_inode, dentry);
-
-out:
-	inode_unlock(parent_inode);
-	return dentry;
+	simple_done_creating(dentry);
+	return dentry; // borrowed
 }
 
 static struct dentry *binderfs_create_dir(struct dentry *parent,
@@ -508,21 +506,18 @@ static struct dentry *binderfs_create_dir(struct dentry *parent,
 	sb = parent_inode->i_sb;
 	new_inode = binderfs_make_inode(sb, S_IFDIR | 0755);
 	if (!new_inode) {
-		dput(dentry);
-		dentry = ERR_PTR(-ENOMEM);
-		goto out;
+		simple_done_creating(dentry);
+		return ERR_PTR(-ENOMEM);
 	}
 
 	new_inode->i_fop = &simple_dir_operations;
 	new_inode->i_op = &simple_dir_inode_operations;
 
 	set_nlink(new_inode, 2);
-	d_instantiate(dentry, new_inode);
+	d_make_persistent(dentry, new_inode);
 	inc_nlink(parent_inode);
 	fsnotify_mkdir(parent_inode, dentry);
-
-out:
-	inode_unlock(parent_inode);
+	simple_done_creating(dentry);
 	return dentry;
 }
 
@@ -732,7 +727,7 @@ static void binderfs_kill_super(struct super_block *sb)
 	 * During inode eviction struct binderfs_info is needed.
 	 * So first wipe the super_block then free struct binderfs_info.
 	 */
-	kill_litter_super(sb);
+	kill_anon_super(sb);
 
 	if (info && info->ipc_ns)
 		put_ipc_ns(info->ipc_ns);
-- 
2.47.3


