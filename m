Return-Path: <linuxppc-dev+bounces-13360-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DC1C123C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 01:46:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwWsR7247z3bsb;
	Tue, 28 Oct 2025 11:46:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761612395;
	cv=none; b=LlaiMNoU7kJMmJyuJd8qyaHJEBzKhgDpdaL2cF9DZfLt4OuGT4+A/1SSTmx/nIOJPA6kIyLcoFSQ9671UzuQR9jgFGpn/8x2o27QmNeEHCemXfNSibUoVdi8d4LcNiVn4L05bVT8EWXD9I4wxCyWTt/F9a4QGwVYtrxoNbY7Fao8SYo26ixT5xtrFYa51P42fmEdHVx7r52dnd0mU7IoNdL11mKtnlkMV9NR3PEVJo8C4JSlGKtgCSeX1veft94WNr72gbJgXWCKlB8s8QdmpkX3pkPSxTVu86/ZQ1FasuxzXspgcnAZbQUultiVsJS8W1Zug4uQM8LMh5KnHus2nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761612395; c=relaxed/relaxed;
	bh=sU0Rwyb1f70hxWqGLaDrX9gfHmhzhxjXEuqfS3xyBnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qajqpr35B4SMzowfM/wsE3soRJYaWVXI73bB1R9Tzt8khEIMdzNelB+eV6wwzNdpZu3kpUJFVSxKd8Oa2Te1Vh+zSTSdktf6jAWWFjXjDWrhLOsDUtt+rZOHX0fmG2LWmx4sKb5yrdaxGu72nDpqX0kxVJ15jU9EVNZ396q3rWagh92aE0LBTU2oic/yWxp6zOBjyUf/iWSBqc2QIZBBWZ0lbsXW2j/foPXthmuIGCWWBjunD4HvcRwvygXB34EjJb6nMvf4hfvCirUBXP6VlkAwyw7WT3/klp9j21apHqjcHAbMqNPaEO/VC6zhYcajDvWehH61J2pv5T2tb1zutQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=aezvGRHC; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=aezvGRHC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwWsM6y9Pz3bf4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 11:46:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=sU0Rwyb1f70hxWqGLaDrX9gfHmhzhxjXEuqfS3xyBnk=; b=aezvGRHCAvghStX3Ot6akRYpUE
	1NYciV5CtxHpLzJAoEByhqUGZCqM2jR9V9yjSv5TtgO478v10dNgSG45eYSF4vEiepoN4lND+f1cp
	xw3HAEKFsvAEXsrc3hs7rvl7cA6u2BsRlakJSCpTDl3WcNXb1vZ6qaNk4ZZ2LXWmHqEGjfpWB5puv
	RLpIbUkW9d/NrEw3RCyXWcw/XhPdPXgCObU59mjLpO6JAiZ466tyzKUwZBn0YeQSggWYHCi+SzqQa
	9FzpN28Wy5jziRDlq1AnNJD0iePGY6o2wVoBpbkOQJAhgTITpW1PqiazuaQmUq3GB8dy/pJ0VmaS4
	Hf4MMDyg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXqt-00000001eha-4Bho;
	Tue, 28 Oct 2025 00:46:20 +0000
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
Subject: [PATCH v2 43/50] convert hypfs
Date: Tue, 28 Oct 2025 00:46:02 +0000
Message-ID: <20251028004614.393374-44-viro@zeniv.linux.org.uk>
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


