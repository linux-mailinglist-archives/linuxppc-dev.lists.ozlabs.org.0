Return-Path: <linuxppc-dev+bounces-14057-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ED9C4BD3D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 07:59:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5HPQ5q4jz3fK1;
	Tue, 11 Nov 2025 17:56:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762844170;
	cv=none; b=OBRCnuJSCv94Cd5mkp4HGjObd4QiTF0rksXKLyGfzV7r9z/5zGnxo5PuUG5EywqcX91JpNOP9Qn7rp+iS4bs+9TaTBSF92+FVM3GQC8S2/G3Ide+Mi0rcljfTZ4d0cIhCWHVSoUAwHQdnjM0dk+aAdSffZV3KDEgXbQ0ZiSX6sdD8Rm3gFoOPSRlYUYKuyvWCNTPoJCFMG+ebRtfyQrxGsRFmlVaoDwhHIHOkvCuMsJm1Y5TZYcyD+q2LgS/Cme11ZJPiKz3ESeOMHrjGaeIrz4urO8YHVKV3DAq/0ZJa48qLcHbgf+3OCFJKzkcIeKzTlZ5iE1PmypEY1pKHHzylg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762844170; c=relaxed/relaxed;
	bh=AovK4oTG8i9mD8KDrbZrZDCi+2Kh5o4vX35c5oMMEjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nxKIxxEJSyo3kbIdbf0O6pIQqmVdJUlRub8m9IUE39n9P6kpjML96Rz3UNAN7Z3ob3G1ccVZxad8fSwAWRH/xIRTzbEIQSt6ntTtV7BJdP+l4GPE72tdnsGgZkD4hCgd4I+uihPsq60ZepCNAwHgIJNqnNaRolk53sUT6to6hhh8TaW+g8nGOCiy9zc27gF/M8y+SduuViWycXl7KrFPa0R/9sC/Ts0GxbawKjPL2k+GexmB7iDr4K5hAiE6aZsa1xN6/UBq4E55Iv1fxteogLIBBnNzv0xTS161f+YigLfa2A8tKhEPs9MGuNvsIgMq7/Ixiu0cqEzKKAiS4W9jDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=odzar9we; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=odzar9we;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5HPQ1PnFz2yx8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 17:56:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=AovK4oTG8i9mD8KDrbZrZDCi+2Kh5o4vX35c5oMMEjA=; b=odzar9weixBzYX42VUwPE8PYUf
	DnpEWbjsupemEddy27qT0QEladdomZrTuxiiYhnT0M3EgQ774jwpEHRyJniCoyxXzBmW61bHT5Qxn
	WMeToZUkmaW/5WUOL3G6/um5bstbPf0PLLijdD8s2ltQG6JOeiOTR4MoOnuzgb8d3bTmn2faGk2FP
	K5KJ3To7GTbCuzAssuAQ1Cow7i4xvRz7BVXCVE8gWQPNGtbw8ePBzXInYNoEF0DQFNFs9cTs+khFJ
	rzOoaoUTkPzhr4mKruj4ilzPBx2woTM4O/0sHKSLOoiVFVSmR0DRMkQO/Ua5XjjdZ79/YBdCfLOd3
	xMemXTYA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiHl-0000000Bwzb-2GZL;
	Tue, 11 Nov 2025 06:55:25 +0000
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
Subject: [PATCH v3 25/50] ibmasmfs: get rid of ibmasmfs_dir_ops
Date: Tue, 11 Nov 2025 06:54:54 +0000
Message-ID: <20251111065520.2847791-26-viro@zeniv.linux.org.uk>
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

it is always equal (and always had been equal) to &simple_dir_operations

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 drivers/misc/ibmasm/ibmasmfs.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/ibmasm/ibmasmfs.c b/drivers/misc/ibmasm/ibmasmfs.c
index a6cde74efb68..824c5b664985 100644
--- a/drivers/misc/ibmasm/ibmasmfs.c
+++ b/drivers/misc/ibmasm/ibmasmfs.c
@@ -97,8 +97,6 @@ static const struct super_operations ibmasmfs_s_ops = {
 	.drop_inode	= inode_just_drop,
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


