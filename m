Return-Path: <linuxppc-dev+bounces-12477-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFA6B8C339
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:52:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1p17Xgz3f8N;
	Sat, 20 Sep 2025 17:48:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354510;
	cv=none; b=j2+MdDqjyByac67QDHGwSxHOIgzDXHDQIUjx4yGCo/aNeifm0GDeEvJcfvb1h7lg07OVAXMiz8BZFrIC4CzKkT3LXZgQaboqUh9NFrLHvb+SfTxsrbZIGhrNHyD69dlrEAvjPlWX+aGjrLUDaaaRcNSvMTdaqvVOeoFvlCgzVxFE3fsCqlZ8QeZm+EESK5gqcxFLHb5NgHnaECzHCIllzkqF2xrirVgL8PAAUCWOhq9mJoClGRxXaGaS6EC64zFHCij+gIFxOEriPqjsE3HQ8lzVNCl4stEAF8MMcjttdzZmt0qpjWBbNZ1M1Jkxlpy76feov2qZBnOqFPDwY/Vqvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354510; c=relaxed/relaxed;
	bh=sU0Rwyb1f70hxWqGLaDrX9gfHmhzhxjXEuqfS3xyBnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WBaGePKf3ndUNg7Vb0qdnNTNlXi3ddm1mFmLhtz58P3cWaSaW5Z9okcg+UapA9lwQfK2qiHINMzSs4ctkLTxxmYktjhof7mlUamYBtHI+d7gKQ+ZNhJPOzMz+8k5iqhbWfdF1Cy44xzS4JNcE10QXp05pV86a5exzs5W13J5XoaAgnW3f4C6HcxhrMMiM64ZVB4ycwOMcE6bJn6MQEtYhX+UajULsKa4TzCk++pJ8rx6Ifti9fZibBMixCz1ML7P15BCmrJYyEa4MFbRUIvGhpa3McdkD0v6yECK6y/bxEPJDTx5ZztUulXoBjdsYH6quVPavuEhWu9ZBNMydIqduw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=IZeE7J9d; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=IZeE7J9d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1Y6pJdz3d9B
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=sU0Rwyb1f70hxWqGLaDrX9gfHmhzhxjXEuqfS3xyBnk=; b=IZeE7J9dxm0UIt3ZnyfuObVDeK
	3JazmOLAU9OCPA74rcy0/qZe/amIJIXMYI3vowai3fBRIW6WPXusEJqIol2DXRDONpRN0ziWNrKds
	UJaTjYLCpnGBl8X5aqtC4UpNzQNgyicnQj1UmSk3byfQILVQJ8ptSZPmLXEB/PvzR5H/NHPdlc0Lm
	YX+AfSxoVuXNixjhQhCVMPn5Fi+7eKHA4giy5VAscZluoYRq/mf6No+R0gYK5dczC7u4e7/uZ5Wrd
	2F5Jfsv7VkSyW3rnhayFqA3BGkuexNvYbvxQOP2TsbscxWeHve2Cw44CJcNoezTZ8MURaejoCTOpc
	Jf4rvcGw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsKI-0000000ExO0-2YpW;
	Sat, 20 Sep 2025 07:48:10 +0000
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
Subject: [PATCH 39/39] convert hypfs
Date: Sat, 20 Sep 2025 08:47:58 +0100
Message-ID: <20250920074759.3564072-39-viro@zeniv.linux.org.uk>
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

just have hypfs_create_file() do the usual simple_start_creating()/
d_make_persistent()/simple_done_creating() and that's it

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/s390/hypfs/inode.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/arch/s390/hypfs/inode.c b/arch/s390/hypfs/inode.c
index 6a80ab2692be..98952543d593 100644
--- a/arch/s390/hypfs/inode.c
+++ b/arch/s390/hypfs/inode.c
@@ -311,7 +311,7 @@ static void hypfs_kill_super(struct super_block *sb)
 	struct hypfs_sb_info *sb_info = sb->s_fs_info;
 
 	hypfs_last_dentry = NULL;
-	kill_litter_super(sb);
+	kill_anon_super(sb);
 	kfree(sb_info);
 }
 
@@ -321,17 +321,13 @@ static struct dentry *hypfs_create_file(struct dentry *parent, const char *name,
 	struct dentry *dentry;
 	struct inode *inode;
 
-	inode_lock(d_inode(parent));
-	dentry = lookup_noperm(&QSTR(name), parent);
-	if (IS_ERR(dentry)) {
-		dentry = ERR_PTR(-ENOMEM);
-		goto fail;
-	}
+	dentry = simple_start_creating(parent, name);
+	if (IS_ERR(dentry))
+		return ERR_PTR(-ENOMEM);
 	inode = hypfs_make_inode(parent->d_sb, mode);
 	if (!inode) {
-		dput(dentry);
-		dentry = ERR_PTR(-ENOMEM);
-		goto fail;
+		simple_done_creating(dentry);
+		return ERR_PTR(-ENOMEM);
 	}
 	if (S_ISREG(mode)) {
 		inode->i_fop = &hypfs_file_ops;
@@ -346,10 +342,9 @@ static struct dentry *hypfs_create_file(struct dentry *parent, const char *name,
 	} else
 		BUG();
 	inode->i_private = data;
-	d_instantiate(dentry, inode);
-fail:
-	inode_unlock(d_inode(parent));
-	return dentry;
+	d_make_persistent(dentry, inode);
+	simple_done_creating(dentry);
+	return dentry;	 // borrowed
 }
 
 struct dentry *hypfs_mkdir(struct dentry *parent, const char *name)
-- 
2.47.3


