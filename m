Return-Path: <linuxppc-dev+bounces-14234-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C868DC6756F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:16:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9Xs33XYBz3blC;
	Tue, 18 Nov 2025 16:16:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763442983;
	cv=none; b=neTAOvwG8PkV6otKnRoBrFEdPetBJWV3WIFBBjU2Y7PIWbRM6NLS8K/7Ok7SyauKvWrwmhhZOjuV5jT8rNbC0uaSbM9g1c7EJtQnfu8MR9bZfQFX/pSEMqFi+2zQYjlHtTPTCtWGCi5U2tEQv2TnejfBbUtAfvro+NaQPuj2TVNE2AUJaSXlVBjVdu8GaK14mMYwO5QLocxeIDQzSUyraRBSQmlX1MfYYf6qc3M7SpDadD9oFrD1GSvcQZDVxRLBKBku2w/eG2IxhZrsd5sYn3xlJDXApY9PGLXn3WbvsVeOvWgcg/I67c1HpEkV2hITSegF9mxe8GNqK1nSr4y3Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763442983; c=relaxed/relaxed;
	bh=iatHkZ5szHUbSV6QRCjJzQR1r0SBUitYfnCBfKmo74w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJ4g840hL3x49apGXPNndF7Kp3hB+wy5NVUoUHcUcRjpS5IpAEbOVOIobQmprGV8WER+shV1SAATxS+UzjKwXpB4rxSLO7aBpxbAA8V1aEVn6xerXhjoCBGZOBgqwR6p6u8I7EBwqFup4tJe9xDZWjbAKr+rOYyL5AdKbfsf1V+yq9ps7HsTXS67ToNZnGkXGOexQlRw7/L1QHwTH2Wf09FTl2pPGOlOYloEarDSp1SInmSUrKZC1gK2uimJCkt2IOyuOxwRGURWOar1pSVineW1qTKaIEkxEne1q03l5eP1VOqT1ic7Mv1aTWmBy12vvUORdrM0JHnPy8xkiHUwBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=HKkg+A6i; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=HKkg+A6i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xry2wCzz30VR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=iatHkZ5szHUbSV6QRCjJzQR1r0SBUitYfnCBfKmo74w=; b=HKkg+A6iw446C1m+bFq5Rf4+zr
	WtzxBAxyNorJmfhyRzyCutjKbpfkUzb6VIIyZ8TGu3Pv492wCgVw6ATyFzN71gfh3aqxSmOywa+XX
	hXtWrNHEkFK2PL9+dRu7Z8frLeV186SMrTIwduMMNxQZA9WWgu1Xbuyqc4rH/zZ81ikczrbh/IxW2
	l/WWnVRxQ8RLKxM4KmzKbRVt4W4vhEj97gnK9cNxyXq1SbFlL+YtfCYjF6ajQqNa5BbTGC4R+ah0y
	xsxXQFz05BzncgXE23HUlDxD4flK2OxwCSKMJomxPUGuCy8x6RtOchSX9D93+FkOLWlu2GhngN0ZD
	53y4+dEQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4X-0000000GETl-1pH7;
	Tue, 18 Nov 2025 05:16:09 +0000
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
Subject: [PATCH v4 41/54] convert functionfs
Date: Tue, 18 Nov 2025 05:15:50 +0000
Message-ID: <20251118051604.3868588-42-viro@zeniv.linux.org.uk>
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
index 40868ceb765c..4bf61017b42d 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1899,17 +1899,18 @@ static int ffs_sb_create_file(struct super_block *sb, const char *name,
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
 
@@ -2098,7 +2099,7 @@ static void ffs_data_reset(struct ffs_data *ffs);
 static void
 ffs_fs_kill_sb(struct super_block *sb)
 {
-	kill_litter_super(sb);
+	kill_anon_super(sb);
 	if (sb->s_fs_info) {
 		struct ffs_data *ffs = sb->s_fs_info;
 		ffs->state = FFS_CLOSING;
-- 
2.47.3


