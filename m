Return-Path: <linuxppc-dev+bounces-12460-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C06EB8C275
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:50:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1d6QBZz3dKJ;
	Sat, 20 Sep 2025 17:48:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354501;
	cv=none; b=BOcGbeaADCBcbcH62OkVxa54Vc8FYu1aVM49P4XBgfK8dzrMRe/vhrKxY7t3elVIsY//8ptL3BMSEOZ0nCu9L4bBWdIm4YdRCYG8e9LHGE0kP+P+uIXRw30Q/Uv/vsh+x3+AR1kDj9XlX0LoXbp/murv/nGO8ATyG3Ln+aaEZbZ3fLqXSkY1QIDDqWrmAj1fKtWQUlD4BqaMcedEL/MKw/wGG6sc9VBart25cSoVtVArPmcGeRox9XEpdNDCYUNGuvwPOQVsogwdQYow1p/IyUxTd7fgoEN78ExKpJpIqn6ybvkKyq9LHmn6llisyRPNhY2emBZ++OMQ4E7mMjDG4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354501; c=relaxed/relaxed;
	bh=4GckmVne9aZbxHVaiffTEmOK19oV0Ap0iZoO6zIdeCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZDdMotTxH7qduoNHdWct6+ubRGGmbK8aj//7Rz0NL9E6tVY9b0zj4o0d9hpKZhClH4472aY6WaeIHpAmQU5qPV/XTrqlH/8tH9uChkTqF8RyCf2PzVmi0nWE45cAiFUq2/QO76ebi8qIs5Rrgr77fIBQx89H83xdeNMpFyD53LBU7x98yNwq/LmwdT/raNzJzytuaif72PajX3c8jYxud37Nx/kpx1Z6DSTbEGpGnBaXqSoMF4uu0aQiYE9MLa28YI/TFhC35Ny9qX7sc5lwR2MDK70TGQMt8YKi2z/Tf54rDYhZGsbvLoOkLKxk4g0kant6fEk6OQ3W1i0IveRiDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=t9UrvmM5; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=t9UrvmM5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1S1Dj0z3cdg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=4GckmVne9aZbxHVaiffTEmOK19oV0Ap0iZoO6zIdeCU=; b=t9UrvmM5OQYc7vCwJTy5PEGD1w
	+awUfFUgSon14MdW6tOTa/rhGWa25zM5Hn+6VH4wQba64aQj6KKJrnFmJ++OVTlx3P2goKG4EuiJl
	cGk3Gk9ZNT7z7lVdTVgv54XlFDXS/qxKTYgRq2cTYtw8wh0ljsNeLSSQndW42cXEJ2FtV5Ti2vXXk
	C8/t+gbvnHlceS+y5Ov58sDEc40NB84G2TlhtoMZ5m9SiVzwe/BsUoLyqd4kf+mqh/hOGkKGb9gWP
	BhzBVMXzPDO3WcVMFM9Db8xjakJKm1+HRtA+eMRqSfy3zaK9i5mweZWeRkOnIq1e7WDMrNSaP3tWa
	I0eE3Zuw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsKB-0000000ExG0-4AXO;
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
Subject: [PATCH 23/39] ibmasmfs: get rid of ibmasmfs_dir_ops
Date: Sat, 20 Sep 2025 08:47:42 +0100
Message-ID: <20250920074759.3564072-23-viro@zeniv.linux.org.uk>
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

it is always equal (and always had been equal) to &simple_dir_operations

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 drivers/misc/ibmasm/ibmasmfs.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/ibmasm/ibmasmfs.c b/drivers/misc/ibmasm/ibmasmfs.c
index 785ce294f4b9..7427adff2a62 100644
--- a/drivers/misc/ibmasm/ibmasmfs.c
+++ b/drivers/misc/ibmasm/ibmasmfs.c
@@ -97,8 +97,6 @@ static const struct super_operations ibmasmfs_s_ops = {
 	.drop_inode	= generic_delete_inode,
 };
 
-static const struct file_operations *ibmasmfs_dir_ops = &simple_dir_operations;
-
 static struct file_system_type ibmasmfs_type = {
 	.owner          = THIS_MODULE,
 	.name           = "ibmasmfs",
@@ -122,7 +120,7 @@ static int ibmasmfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		return -ENOMEM;
 
 	root->i_op = &simple_dir_inode_operations;
-	root->i_fop = ibmasmfs_dir_ops;
+	root->i_fop = &simple_dir_operations;
 
 	sb->s_root = d_make_root(root);
 	if (!sb->s_root)
@@ -188,7 +186,7 @@ static struct dentry *ibmasmfs_create_dir(struct dentry *parent,
 	}
 
 	inode->i_op = &simple_dir_inode_operations;
-	inode->i_fop = ibmasmfs_dir_ops;
+	inode->i_fop = &simple_dir_operations;
 
 	d_make_persistent(dentry, inode);
 	dput(dentry);
-- 
2.47.3


