Return-Path: <linuxppc-dev+bounces-14047-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85784C4BCAA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 07:57:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5HP30GTLz3dng;
	Tue, 11 Nov 2025 17:55:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762844150;
	cv=none; b=QopmePExjGv8cHGB8iE7In2WBOOiQQFKo5UE7YwB5fhYg4CctRKZoFbWHoEyY0fSFdkAg43P96NoeOduLXV0Q6VhRLx7sXQv2aVeFH+jW4otEPFkzNJHPzKs6J2GWWhIrTlEWtGAy0wnxMsih6HLa2393gXXJAtmuGsDIZp1BTmyRhMgEgjQ2r+FZ9zE0iHycMPQgez/yXXxBL1+30q+UMiEvBt5sA8hLxFube0kENWRv/zM12X3CRm0kbea6yGUbThnvmPHZ7FPodvirQlwYtALrpNZKDbKAW9YVIKI9goHYvMf8P2HK58M0ie5oJkegyxWjvuSXo/oazoSAaY6rA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762844150; c=relaxed/relaxed;
	bh=aIO5z+XlaxOUN+dxGxWKQXIfyt7HKUVO8xN2mehuHOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jz+PfGAlg5da6dt0UGOIExHDkyTBbolVxqZLzZ9qkgqtb63ihluagRgfJrEvnThEqst+VMFF13P9j/MfQLaAs+VYi7WuL/vxyoJLZ4WsmWag1HkO5N0xLx8zrvHRLuxR82FYyMpKDZoVDRJa/Khy8RR/v/YiGqRote/c6SYRYM9cUptX54GEor3I3dMFueoEzdNRgM5VTC82juGAB/ErIO4wiuWH8r+Sa+ZrNdBV4xzwskRz74Mkw7pgdpvqJdssQEVZaYdeYT1CxLxBtOd5H8ydxuESFu1pSM9yM5iZSgDiZJvukAtsQDDBrqYB2dHE09+zf+5f8QtdJjmCIDysSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=fQQLWDOI; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=fQQLWDOI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5HP16Sl5z3dX8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 17:55:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=aIO5z+XlaxOUN+dxGxWKQXIfyt7HKUVO8xN2mehuHOs=; b=fQQLWDOIQU+ymcNCRWD/5GW7sK
	eKR1VjOGfKbsuKfP5Vp260+aAx5GkV678UwOFuvqCmUfpROq3rMVfr9wj5D0b80dNNuSLwodGXcwZ
	bNGraoQ23tvzejiIiNPfhMjLNHtCwb5QC/bnFJRH8ExDJl4BgdeEAM50Lh8SMt66DUVqEmMTiz6dr
	SriBmp6n/sQApLR49n9tAeiqTk+MAPGdQGLrS0K/ugMA7SLP7JtttlfY3mcBHGECo1EiFGrUHP7mL
	HV7N5nsmHf8l4Uhxrko/5FeY2/29X5l8QilfKsIrWojIG8QJvO2ZIvNY/b0k/Rh+zff5LtAsZ8q+i
	3v+9o20A==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiHr-0000000BxG6-0CNL;
	Tue, 11 Nov 2025 06:55:31 +0000
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
Subject: [PATCH v3 44/50] convert rpc_pipefs
Date: Tue, 11 Nov 2025 06:55:13 +0000
Message-ID: <20251111065520.2847791-45-viro@zeniv.linux.org.uk>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251111065520.2847791-1-viro@zeniv.linux.org.uk>
References: <20251111065520.2847791-1-viro@zeniv.linux.org.uk>
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

Just use d_make_persistent() + dput() (and fold the latter into
simple_finish_creating()) and that's it...

NOTE: pipe->dentry is a borrowed reference - it does not contribute
to dentry refcount.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 net/sunrpc/rpc_pipe.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/net/sunrpc/rpc_pipe.c b/net/sunrpc/rpc_pipe.c
index 0bd1df2ebb47..379daefc4847 100644
--- a/net/sunrpc/rpc_pipe.c
+++ b/net/sunrpc/rpc_pipe.c
@@ -536,17 +536,16 @@ static int rpc_new_file(struct dentry *parent,
 
 	inode = rpc_get_inode(dir->i_sb, S_IFREG | mode);
 	if (unlikely(!inode)) {
-		dput(dentry);
-		inode_unlock(dir);
+		simple_done_creating(dentry);
 		return -ENOMEM;
 	}
 	inode->i_ino = iunique(dir->i_sb, 100);
 	if (i_fop)
 		inode->i_fop = i_fop;
 	rpc_inode_setowner(inode, private);
-	d_instantiate(dentry, inode);
+	d_make_persistent(dentry, inode);
 	fsnotify_create(dir, dentry);
-	inode_unlock(dir);
+	simple_done_creating(dentry);
 	return 0;
 }
 
@@ -563,18 +562,17 @@ static struct dentry *rpc_new_dir(struct dentry *parent,
 
 	inode = rpc_get_inode(dir->i_sb, S_IFDIR | mode);
 	if (unlikely(!inode)) {
-		dput(dentry);
-		inode_unlock(dir);
+		simple_done_creating(dentry);
 		return ERR_PTR(-ENOMEM);
 	}
 
 	inode->i_ino = iunique(dir->i_sb, 100);
 	inc_nlink(dir);
-	d_instantiate(dentry, inode);
+	d_make_persistent(dentry, inode);
 	fsnotify_mkdir(dir, dentry);
-	inode_unlock(dir);
+	simple_done_creating(dentry);
 
-	return dentry;
+	return dentry; // borrowed
 }
 
 static int rpc_populate(struct dentry *parent,
@@ -657,8 +655,7 @@ int rpc_mkpipe_dentry(struct dentry *parent, const char *name,
 
 	inode = rpc_get_inode(dir->i_sb, umode);
 	if (unlikely(!inode)) {
-		dput(dentry);
-		inode_unlock(dir);
+		simple_done_creating(dentry);
 		err = -ENOMEM;
 		goto failed;
 	}
@@ -668,10 +665,10 @@ int rpc_mkpipe_dentry(struct dentry *parent, const char *name,
 	rpci->private = private;
 	rpci->pipe = pipe;
 	rpc_inode_setowner(inode, private);
-	d_instantiate(dentry, inode);
-	pipe->dentry = dentry;
+	pipe->dentry = dentry; // borrowed
+	d_make_persistent(dentry, inode);
 	fsnotify_create(dir, dentry);
-	inode_unlock(dir);
+	simple_done_creating(dentry);
 	return 0;
 
 failed:
@@ -1206,7 +1203,7 @@ static void rpc_kill_sb(struct super_block *sb)
 					   sb);
 	mutex_unlock(&sn->pipefs_sb_lock);
 out:
-	kill_litter_super(sb);
+	kill_anon_super(sb);
 	put_net(net);
 }
 
-- 
2.47.3


