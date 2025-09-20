Return-Path: <linuxppc-dev+bounces-12475-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D083FB8C31B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:52:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1m41rhz3f46;
	Sat, 20 Sep 2025 17:48:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354508;
	cv=none; b=mUt3VZZXmTnMyGpCi3CbGC+JeekNR5X4JH3HIDCdWWUXLurBWarhpd+HZsrEKzBBS4pr0wvQKEnB2o+JGq9fQCYCJ9/UOv3NV4a4/tcpNoOy1rCruN+nCmahnQ8GmSPI/vlFck7gjVfjGZG7onc8XEnlGCqszDGt5eznPbRBTxbrloUKlP23k0rcUMqS40NWfDQu+joxo/Ov8qnwc+hsSJ2JyKPDa2JOWvbrR1PVk/vx4KyXe264ooDwErVbJbim6ngLxyT8UL50MzERVgk1oRKwp/9jl+WuUwNtY2awF3CxJuE/y65wN/XsFmV/+Y0gye4Mv7L7+c/E9fqfRVEWCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354508; c=relaxed/relaxed;
	bh=Kt5xEHMx+oGXrg9a3wt3WFau1p2+Ow+pw2GQ7mKAvTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJpthtDoTrsfTYuEsdgImLna8r6KPbV3An8LvGvAqbHAOiM9IhP2ZTpbrHW3RBCBrS/bGnD7nYZ0uJfkoJXmp3hwXqVXD8OMuu3tY66L+1YdMtPzyefSGU4N+47g7vn8yPGjC8/aTLunVuVOFPAxRIqYzSlvQdAbU6O6AcjN5QupPO0GFLB3DWJy2xXhS+IxRqw/XsJFDXixiCpa8ZCAW1nEca/eOK/DgZ0Jfesp7XwwUTJ4KNFCOXg3W/vB9azBDi+osqYy8FsSwJW9mH7hxMxNmb8hIJe80L5DH5k3zgFg+U6exM/SUtptOv8HNWxEbPkBX8gYwjiwF7x9RIAyCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=ZUHKPj2l; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=ZUHKPj2l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1W1m1mz3cmP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Kt5xEHMx+oGXrg9a3wt3WFau1p2+Ow+pw2GQ7mKAvTs=; b=ZUHKPj2lbGLNsYW8Syb9BRS8nI
	BqdgFmG5vH/cRfmJdLB8IEVySftrB7QN3XLbg1KTpOBqXEoSz2W50qPojXFUfxCDhEf4IlmIg7j33
	svCQMkaQTLbjB+8soDcP8DDIiqkKER4DPHbNciqLVaLJ/O17uQ8lJmjpHIjLzipsYarOcUg3FfEk4
	2dsEwfXY+EhFX04i88FrIw76g0YuF4HUvCNHSHphC5stRvSuy7PRJbR2+vfsFDkSQkzqVksiDaRoz
	tqvx6ILXHYuIyZltN2mTzpSNZgyZgnUOU2O8TEVzZeRLf+A1n2uizUFFrnwLcGw2EB406YgdVVTIQ
	qMXK/Jyg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsKG-0000000ExLx-2Ynu;
	Sat, 20 Sep 2025 07:48:08 +0000
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
Subject: [PATCH 33/39] convert functionfs
Date: Sat, 20 Sep 2025 08:47:52 +0100
Message-ID: <20250920074759.3564072-33-viro@zeniv.linux.org.uk>
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

All files are regular; ep0 is there all along, other ep* may appear
and go away during the filesystem lifetime; all of those are guaranteed
to be gone by the time we umount it.

Object creation is in ffs_sb_create_file(), removals - at ->kill_sb()
time (for ep0) or by simple_remove_by_name() from ffs_epfiles_destroy()
(for the rest of them).

Switch ffs_sb_create_file() to simple_start_creating()/d_make_persistent()/
simple_done_creating() and that's it.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 drivers/usb/gadget/function/f_fs.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 5c9a7bd4e41e..65d9109b4051 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1870,17 +1870,18 @@ static int ffs_sb_create_file(struct super_block *sb, const char *name,
 	struct dentry	*dentry;
 	struct inode	*inode;
 
-	dentry = d_alloc_name(sb->s_root, name);
-	if (!dentry)
-		return -ENOMEM;
-
 	inode = ffs_sb_make_inode(sb, data, fops, NULL, &ffs->file_perms);
-	if (!inode) {
-		dput(dentry);
+	if (!inode)
 		return -ENOMEM;
+	dentry = simple_start_creating(sb->s_root, name);
+	if (IS_ERR(dentry)) {
+		iput(inode);
+		return PTR_ERR(dentry);
 	}
 
-	d_add(dentry, inode);
+	d_make_persistent(dentry, inode);
+
+	simple_done_creating(dentry);
 	return 0;
 }
 
@@ -2067,7 +2068,7 @@ static int ffs_fs_init_fs_context(struct fs_context *fc)
 static void
 ffs_fs_kill_sb(struct super_block *sb)
 {
-	kill_litter_super(sb);
+	kill_anon_super(sb);
 	if (sb->s_fs_info)
 		ffs_data_closed(sb->s_fs_info);
 }
-- 
2.47.3


