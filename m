Return-Path: <linuxppc-dev+bounces-12465-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37353B8C2AE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:50:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1g75YZz3dTL;
	Sat, 20 Sep 2025 17:48:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354503;
	cv=none; b=d6LbAeibReB8KwBiHS39uyNYQTmyzkhMpfDzb5nzPSG5z2EqzoGdwZ+aOdDSMPFmSORVA5KX327t+is5lLV7DpgEdhuaxE+oxGkx8+hcgbXM17LcNpxu0+aAgSPK6CPwW5coKC2NSP5uLT7aeeZ8L3uOIuiUuoLHnJk1nEkp2Q44fnDHTAFHfesOat3/iWekqORWsQPRBWT7LtZ4JU0tGCs4hdgJeHpTQf8MrSIySGdt6/Ax8H24dOu8dK0dGs8JYye0e5OB/Vvxt8Q25mMGNqDkciiP92SMMdiRRWZ2AgUjHrVWbVhC1VaIWpU0P45v7X0n9vgJ7BUfNx+SSUunZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354503; c=relaxed/relaxed;
	bh=tT2z+6P9K4+uWY+P9oa4gJTY9OlBzdKJ3vGtwqwrgNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=caUdExcrI4A6JoKRuwtvClK7eCRoUHPcViSoE6i5Nhykm5l1OqRfsGfqdgO08dqcRlm44s1wOsxiFO8IjV7Hs2vlEW1UN+PK7H870V0BAivQckIhkxybUoTqR4Ktz++Zm5EzIJKfUDw229+NTk+vBcPiF9FKc6vVQVbDGxanCcCaOIwCV2KGvJPzRiEBFz2mBrTAVDczpDrWffKIxQYAj1u4xpFxW6ir/tVlChh8nfwL9iB8zBK9XCXJV8F83dUhOUOtI+nz3+ZY4WXnAbF2VP7LDIkq8zH7aZA+E4NKhgpPgZhi12b+r+bASxpsRwrqzva9SorGgxSKKZ+g4HJgGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=i+OJ/PxV; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=i+OJ/PxV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1S2Dpsz3cfL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=tT2z+6P9K4+uWY+P9oa4gJTY9OlBzdKJ3vGtwqwrgNU=; b=i+OJ/PxV0i+zEN1UV/pCBBmAu1
	GBYoW/VweRbwndK24Xf7NdzHCcO8A6oPJjshziH/PW6H11pmEc/lvptcl3mCt1cKQ27KmKAnLCN8p
	275aRw1SGU6kXTRihXlSHxM9lKGBXxOVKhxMjhAZdEwseioNCReGQpylOyklWo7FNXwKn/yHkQAwA
	F5b71tfyHPgUOlR8kfiBq9nob9/7I0lmN+Xlz5lWm6Hy9u+5yJGzf6SXo+GuiMOD3/saKK/YDoSnZ
	OCzUqvjdRYCk7wJMOWseq21+of+x4i/FNzLvjiHJjPeUUZnt53NpidpOpqLQaLMZfHRiCFg8J2Vwp
	I1n3Dl/g==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsKC-0000000ExGi-2cmZ;
	Sat, 20 Sep 2025 07:48:04 +0000
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
Subject: [PATCH 25/39] binderfs: use simple_start_creating()
Date: Sat, 20 Sep 2025 08:47:44 +0100
Message-ID: <20250920074759.3564072-25-viro@zeniv.linux.org.uk>
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

binderfs_binder_device_create() gets simpler, binderfs_create_dentry() simply
goes away...

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 drivers/android/binderfs.c | 43 +++++---------------------------------
 1 file changed, 5 insertions(+), 38 deletions(-)

diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
index 0d9d95a7fb60..41a0f3c26fcf 100644
--- a/drivers/android/binderfs.c
+++ b/drivers/android/binderfs.c
@@ -181,24 +181,11 @@ static int binderfs_binder_device_create(struct inode *ref_inode,
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
@@ -479,24 +466,6 @@ static struct inode *binderfs_make_inode(struct super_block *sb, int mode)
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
@@ -506,11 +475,10 @@ struct dentry *binderfs_create_file(struct dentry *parent, const char *name,
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
@@ -538,11 +506,10 @@ static struct dentry *binderfs_create_dir(struct dentry *parent,
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


