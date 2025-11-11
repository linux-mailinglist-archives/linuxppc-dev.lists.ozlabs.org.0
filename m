Return-Path: <linuxppc-dev+bounces-14067-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C4BC4BDA7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 08:00:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5HQ46kvlz3fRF;
	Tue, 11 Nov 2025 17:56:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762844204;
	cv=none; b=OVz0uQ8bU+ExZwNVv7zPmkvU+7otbk8PsCGtw8IXvtpGRtgPBuvqgAlfCYE+1wj6JRSmvsp4QQrwOcNdZdemgqQ33j/LS6AJFSQVZiaAXSZrEjD3KPqej8zUemMkhOeW/1j/3p46TwDBTsG4vIQv+9Dq79ZJYXfiiaKyNjOS4zchVcQ/Odma2MsD7d5HpPuItpqoKfiVMqqoPvTZrqHGsB4r4WHGzOb9eISgdB69ZRwhVA4bV47RFX0LsIHZTtiZpDg8YaVI0Vw8I+AqHxh9ijADeLya5OiEc90ixUl42mIh57Epnl94vehp30f2q4UWcZmLpIuO1R3S4O8WwKj8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762844204; c=relaxed/relaxed;
	bh=lB/gWST5s3/zNGGpGrNmQn0s9XjLn6XUo6NFB74HdeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJG4C5qEa8QYsWZDgq5yhTU0APKHnikzswiYDarfD+fD/QLzq0mktv5r9yVATpI0oTJbOfs9cGVv09VYdbaVmW1h04zHQVqkrNLybkiBLpsemnqxt61cIf8MUBX9a+8U3g38ZTn22e1h1VkIw0+s1TEM+5QJkkh4i9per8gPN01YttCZ+3UsO1NgRl3Y2vMiKdHfqQNuCd55gJ6oeXI6KqRihUj0zrGNhjsZV7WLjDeEXUDA+GWlGxWKzBswavfPwfhJxqWw1jgdHdQppEm89BfzCz/IOx8vNu3n6Vm/uhHy3yZT9gPaSaNuVb2rIh/l5/Ue63126qKNdRjZt/OysA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=J53TPJ+O; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=J53TPJ+O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5HQ270v0z301N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 17:56:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=lB/gWST5s3/zNGGpGrNmQn0s9XjLn6XUo6NFB74HdeU=; b=J53TPJ+OZ5kZaHTrq85iExMJ+0
	ESCvD/mY3AUsQJbPBplyGJvh+DHfa6CJDgQjwYe04T03q5fZxVnFU0fMIh0322RWs9ZOTmhrzBB4F
	M7pYyqB4AJ1pH5/4yHMfI4b55YVk9UTCBH3TyPGbn2v0fBFizfaZELuSNxzb5Gn9xTdxjsRHFHBov
	Vbxe51f2IOsquNV3XRN/456KamzLZYI0lkolF+ELEVzocIV/iNa1VqfookQvrhsRG+cJ5VKjQ4CKf
	g24MHsi3z0nxP8/d+QstBk8c4urCx51+yd1QoDelaMTgnAdd/wT1JKm9FpFgd8pogNRRcXpLYc3aG
	PGOz2OPQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiHh-0000000BwtD-1BG9;
	Tue, 11 Nov 2025 06:55:21 +0000
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
Subject: [PATCH v3 01/50] fuse_ctl_add_conn(): fix nlink breakage in case of early failure
Date: Tue, 11 Nov 2025 06:54:30 +0000
Message-ID: <20251111065520.2847791-2-viro@zeniv.linux.org.uk>
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

fuse_ctl_remove_conn() used to decrement the link count of root
manually; that got subsumed by simple_recursive_removal(), but
in case when subdirectory creation has failed the latter won't
get called.

Just move the modification of parent's link count into
fuse_ctl_add_dentry() to keep the things simple.  Allows to
get rid of the nlink argument as well...

Fixes: fcaac5b42768 "fuse_ctl: use simple_recursive_removal()"
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/fuse/control.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/fuse/control.c b/fs/fuse/control.c
index bb407705603c..5247df896c5d 100644
--- a/fs/fuse/control.c
+++ b/fs/fuse/control.c
@@ -205,8 +205,7 @@ static const struct file_operations fuse_conn_congestion_threshold_ops = {
 
 static struct dentry *fuse_ctl_add_dentry(struct dentry *parent,
 					  struct fuse_conn *fc,
-					  const char *name,
-					  int mode, int nlink,
+					  const char *name, int mode,
 					  const struct inode_operations *iop,
 					  const struct file_operations *fop)
 {
@@ -232,7 +231,10 @@ static struct dentry *fuse_ctl_add_dentry(struct dentry *parent,
 	if (iop)
 		inode->i_op = iop;
 	inode->i_fop = fop;
-	set_nlink(inode, nlink);
+	if (S_ISDIR(mode)) {
+		inc_nlink(d_inode(parent));
+		inc_nlink(inode);
+	}
 	inode->i_private = fc;
 	d_add(dentry, inode);
 
@@ -252,22 +254,21 @@ int fuse_ctl_add_conn(struct fuse_conn *fc)
 		return 0;
 
 	parent = fuse_control_sb->s_root;
-	inc_nlink(d_inode(parent));
 	sprintf(name, "%u", fc->dev);
-	parent = fuse_ctl_add_dentry(parent, fc, name, S_IFDIR | 0500, 2,
+	parent = fuse_ctl_add_dentry(parent, fc, name, S_IFDIR | 0500,
 				     &simple_dir_inode_operations,
 				     &simple_dir_operations);
 	if (!parent)
 		goto err;
 
-	if (!fuse_ctl_add_dentry(parent, fc, "waiting", S_IFREG | 0400, 1,
+	if (!fuse_ctl_add_dentry(parent, fc, "waiting", S_IFREG | 0400,
 				 NULL, &fuse_ctl_waiting_ops) ||
-	    !fuse_ctl_add_dentry(parent, fc, "abort", S_IFREG | 0200, 1,
+	    !fuse_ctl_add_dentry(parent, fc, "abort", S_IFREG | 0200,
 				 NULL, &fuse_ctl_abort_ops) ||
 	    !fuse_ctl_add_dentry(parent, fc, "max_background", S_IFREG | 0600,
-				 1, NULL, &fuse_conn_max_background_ops) ||
+				 NULL, &fuse_conn_max_background_ops) ||
 	    !fuse_ctl_add_dentry(parent, fc, "congestion_threshold",
-				 S_IFREG | 0600, 1, NULL,
+				 S_IFREG | 0600, NULL,
 				 &fuse_conn_congestion_threshold_ops))
 		goto err;
 
-- 
2.47.3


