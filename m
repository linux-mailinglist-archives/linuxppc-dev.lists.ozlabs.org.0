Return-Path: <linuxppc-dev+bounces-14259-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 967DBC67699
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:19:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9XsN6mC0z3fHf;
	Tue, 18 Nov 2025 16:16:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763442997;
	cv=none; b=PbRFbDO7/vqg23ZVBuZrYkgvZoMbxJYjqG178iIYODNbDn2upZ0Yfz+sOVp3Gz8Qt7IcMFqMHbZmrD2Uuoro5Ty/nKHkzc8tBPxCOBDDNcDVLOtOIHsFDnfksZRYTt2ZGo8tJ/TRwtzTVTOlGM5+FVdEaVD5CVPonMuqepVQjbBfHSnUUL4ThXcXvJrSjpXvmJ4cVgF+F6sZK7ja8SbYlwb9R4OUPZ9vnMeExL+kfD7VuVnhOeb+uwCwjkh+JJcN6FVuTVPV0+IQQAvN9lvPXsXbQ4kfVWY7wb+S7de4s0Q7ZY9RGzDfEzFotVknlNVnmh9UIEor8hOCc55LKv475Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763442997; c=relaxed/relaxed;
	bh=NN/33ifYl1WumRWtJ01j5wECnyYUZIw+8lYgHF3pdkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i8y3PqOCnSM1RCMcwq3ff0JtEpZ0sUx4vve/7J3H8zcENFfDRG7wDByWl0SjTT2FCTiKoDjDfPM7+AjKoGkC0EfxFV0fYKE9uFcPcdqaftjGh1LThUuoqjVniLqaxck/gfYKBjNINT7ZSyi6B4F6/7liZ6x2P+Ds2SqOEE5pUptDW7uHqxRdUqsksuuC+snM+ZhDPNaAxMSkewv5Lk/UaXS6EGaYqSKbajvmy+xxwLGblwW9cWdKXHPNXyOO2HJ0jW0FSMqm+8iQuIS3GFT9CJH8UThsh8cDXLkrzST/p6IcwDSsZrgIQlZKHAi0CRxCcOP5uCnCUMTK5CLp2BPDMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=Swn8OWC9; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=Swn8OWC9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xs02JzXz30Wh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=NN/33ifYl1WumRWtJ01j5wECnyYUZIw+8lYgHF3pdkY=; b=Swn8OWC9emGgXeb+svd6xyIRtH
	O8+0bfGk7vkeVTnmYyKKioAH2dKMhnaFqOOdCZhfH7DTDKCUSFYkaejYy7x5Ny81bWQhjdQklMl7S
	Kd0VDr5NDP9eF1J4N8xntap3OHNW7LYMKQSxUanm+oLz2/1oJDnE6dgRVdmQLOR5vLoRgU8+aY8O1
	+aFljvFS4ROnasgOFbo/ITPdAlXRonmWAtPelnYbpVkk7vcidV3IaRtWRy+plvzUZekKUcxqbxUCM
	z/GnEDfM/zcm9STlAGaLt6i8N1wM/qw5FGnC6drFm7BAttYg7nCeiSYYhZseGYxd1llCsSW+9Jwv8
	PU9hcoXw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4Z-0000000GEch-2tzA;
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
Subject: [PATCH v4 49/54] convert nfsctl
Date: Tue, 18 Nov 2025 05:15:58 +0000
Message-ID: <20251118051604.3868588-50-viro@zeniv.linux.org.uk>
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

One instance per net-ns.  There's a fixed subset (several files in root,
an optional symlink in root + initially empty /clients/) + per-client
subdirectory in /clients/.  Clients can appear only after the filesystem
is there and they are all gone before it gets through ->kill_sb().

Fixed subset created in fill_super(), regular files by simple_fill_super(),
then a subdirectory and a symlink - manually.  It is removed by
kill_litter_super().

Per-client subdirectories are created by nfsd_client_mkdir() (populated
with client-supplied list of files in them).  Removed by nfsd_client_rmdir(),
which is simple_recursive_removal().

All dentries except for the ones from simple_fill_super() come from
	* nfsd_mkdir() (subdirectory, dentry from simple_start_creating()).
	  Called from fill_super() (creates initially empty /clients)
	  and from nfsd_client_mkdir (creates a per-client subdirectory
	  in /clients).
	* _nfsd_symlink() (symlink, dentry from simple_start_creating()), called
	  from fill_super().
	* nfsdfs_create_files() (regulars, dentry from simple_start_creating()),
	  called only from nfsd_client_mkdir().

Turn d_instatiate() + inode_unlock() into d_make_persistent() + simple_done_creating()
in nfsd_mkdir(), _nfsd_symlink() and nfsdfs_create_files() and we are done.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/nfsd/nfsctl.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/nfsd/nfsctl.c b/fs/nfsd/nfsctl.c
index 2b79129703d5..5ce9a49e76ba 100644
--- a/fs/nfsd/nfsctl.c
+++ b/fs/nfsd/nfsctl.c
@@ -1137,11 +1137,11 @@ static struct dentry *nfsd_mkdir(struct dentry *parent, struct nfsdfs_client *nc
 		inode->i_private = ncl;
 		kref_get(&ncl->cl_ref);
 	}
-	d_instantiate(dentry, inode);
+	d_make_persistent(dentry, inode);
 	inc_nlink(dir);
 	fsnotify_mkdir(dir, dentry);
-	inode_unlock(dir);
-	return dentry;
+	simple_done_creating(dentry);
+	return dentry;	// borrowed
 }
 
 #if IS_ENABLED(CONFIG_SUNRPC_GSS)
@@ -1170,9 +1170,9 @@ static void _nfsd_symlink(struct dentry *parent, const char *name,
 	inode->i_link = (char *)content;
 	inode->i_size = strlen(content);
 
-	d_instantiate(dentry, inode);
+	d_make_persistent(dentry, inode);
 	fsnotify_create(dir, dentry);
-	inode_unlock(dir);
+	simple_done_creating(dentry);
 }
 #else
 static inline void _nfsd_symlink(struct dentry *parent, const char *name,
@@ -1228,11 +1228,11 @@ static int nfsdfs_create_files(struct dentry *root,
 		kref_get(&ncl->cl_ref);
 		inode->i_fop = files->ops;
 		inode->i_private = ncl;
-		d_instantiate(dentry, inode);
+		d_make_persistent(dentry, inode);
 		fsnotify_create(dir, dentry);
 		if (fdentries)
-			fdentries[i] = dentry;
-		inode_unlock(dir);
+			fdentries[i] = dentry; // borrowed
+		simple_done_creating(dentry);
 	}
 	return 0;
 }
@@ -1346,7 +1346,7 @@ static void nfsd_umount(struct super_block *sb)
 
 	nfsd_shutdown_threads(net);
 
-	kill_litter_super(sb);
+	kill_anon_super(sb);
 	put_net(net);
 }
 
-- 
2.47.3


