Return-Path: <linuxppc-dev+bounces-14256-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 771EEC67666
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:19:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9XsN0qpjz30Vs;
	Tue, 18 Nov 2025 16:16:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763442993;
	cv=none; b=FkmqXryMCtVs0qxCyWNAqrZPNnpv7rT23p038WhRHThf2KTlflylJDg73oCt19HUcLO+UAkmjahbpoJPa8Z7bSO+up3fZjmak7ZX+J9QjfLSNaonxQm7Th88asfn8WHYAebVpyN2/Qnr4aIsze548OmeOTQhSLI14MgtXIlR+M9LEe8usQ/3l+DuFNB/KNLRlH49VR8DU3cY2stjOJXRkuEJnfjvkrNQ9WJV/gCEeg1NOWNCzNJZKGUIPA13exZ8cHCVL9W334OqAG8L0d9TSw8vNyjoijrBDmnnpSLxfsHZ7pfAAv64/FICEIqgN+CKQWum2wnZyBhGqZxnisFHxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763442993; c=relaxed/relaxed;
	bh=sU0Rwyb1f70hxWqGLaDrX9gfHmhzhxjXEuqfS3xyBnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RG8EG5iiIrqHDQ7kBK3qCv3KyAWPm0RqDi5XC6xM82z3O+ix+kzfBCmFQqoQzKg9kV2fodzJd5JjaHwd/0CSSqKTPKlXF5jKod4DtLZQNF60omRvI8HT9JqzTY0d4W3IOUx7+6QK1OjohL8g1dcQ12UphaK2esxgNZqCHf78D6S4SDmfXcB2R399XZCrFHmWS02vqaQT362RBy4xq0YhCPenDaUOpbtMBNHq+nr9pTRWKPP5MDf/ZnaLx4D6v1If3ahw1XMU7v2Zm8K5dqSxZa1MQZCR5KSOUAO0Wi1f0YsXn8qEpRNt/CMp51wc2vE0HahLHhDxiTuFJ2Lx9PuGKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=tvP+Rm/V; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=tvP+Rm/V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xrz3XlPz30Vv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=sU0Rwyb1f70hxWqGLaDrX9gfHmhzhxjXEuqfS3xyBnk=; b=tvP+Rm/VUpFEtjTr5flW9AZmbU
	EzRtigGLTzsKq+yofPuIueTOmYfV6zi1I2TwuPtT4PHJPyuXP1Nc9lVhj59h2gYy4cFJq4LhZprop
	8ROzJjA86BGtttEVo7zzpWV8snzvasJlqumptzAGTNUTgNkToBAF6Mo6SjcDieMNQ7YYjtXCzisGi
	xYIVaaWwZiJNaqIArUEL4pOtTYOpcwX81Jc4rYYhr0q/ERBWw7VHcz3FQjVCL3Z1fPKPvorH8ODG4
	+Lr1JnaIN5qc2SyQI2UEBN9yNgcAtpy83rsAK2ffeQM7yd8Lt/4NmPt35xVbfRI9BzvSluCk2t3ZX
	lNMovGhw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4Z-0000000GEZu-0Uh8;
	Tue, 18 Nov 2025 05:16:11 +0000
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
Subject: [PATCH v4 47/54] convert hypfs
Date: Tue, 18 Nov 2025 05:15:56 +0000
Message-ID: <20251118051604.3868588-48-viro@zeniv.linux.org.uk>
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


