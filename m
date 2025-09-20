Return-Path: <linuxppc-dev+bounces-12461-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8024B8C276
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:50:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1d6YSjz3dKR;
	Sat, 20 Sep 2025 17:48:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354501;
	cv=none; b=n9xYfA2THDxwrLPIKUH2Q/DJDyV/LiNNe0o2SqcLXMpQKBH/aMaGt4kIRBi2iV8xU+KHJBtAXR1PwmVsqGo8CNh0XtSSWlyUtnIVfgpsW3QyxV90spavedaKhnDDPlQI64P5j1Uue//xEJPy/jjEzLzu+kU7rC1zetHA3Qu075vVZaQDDUcdQVRmnio2X/D1RfFn2iXUC04DNgDuKRldtnUORfa5WWUugeL304kM4WrDuYLs8P25j9oC6QPga9GjOnJnmo4dMqfoDi4khjGi5jRc3i2tGOGbe6pM/jFkVn4aSI0ckF89x7uwmneCi5SmssVEjYaXvM4DIIUvKujDzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354501; c=relaxed/relaxed;
	bh=JiG9nHcsxcwZpHb/L0Tx41DaV7imD29tLb/ai1sU578=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c7V+mo48wsR+bTMnxDaMHF2TmnNHnZYVXEQaOTeEk3YeYfAwymvbXFcMszZ4z4Ua9Nia0+cjWEDnaR4KGd4L/hGkhuuK8W7Xf4Hhc8hxCzbh++GYm9uyqvJCT7p8gC4mVTZRGvh4RkmS5WcqLTYBQ8t7tJ97glJqEw/JbjBKHs/+hYiJ0zPhdvTNnu8pT5bTdf+8tiXC/3wcAJf+1Rx1nhhC7SXfpjDU9iGovSYoc+dO7kL6W6J7j3FJ7rpZTpgFxwjbIsQoJNrzJ/VJDaaWwmKtGIQxJVg8Wx8H7pbu935sYkeZa5ay0LV59wXwb5r8EPRXG2Ln7GON84g9dh+vJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=vtuBnJp1; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=vtuBnJp1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1S0NCqz3cdR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=JiG9nHcsxcwZpHb/L0Tx41DaV7imD29tLb/ai1sU578=; b=vtuBnJp1FKdRJaUi9wf6dBa+cw
	yFyba5mUeAFRsUmJroWbhRl2eUzKZlVVNqj5veAhvT6EC9M+C9P1/Y8zGdTeqZE/bI1HCme8sHdO9
	GcPjmOj3eT9y485+3rjAUNq69uFkp69CbzOdiVe81V46rzs0RvAuwHALDxEHK9F+mtRy7IyEHwrkQ
	W48r8UtFZtMv4LD8awybcvRGhiXenr5wHvuktQ8hFQb+XjdjbkZfFpItsbQfdQktAwp+/VAEU1+5f
	6XYhchXPqQgz+DLx4WbjOi5xYPuroCrhW+UL2w1nNz90dt4otfrX1DERefvNIrWozjB1cTQ8oHCXr
	q1esPHew==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsK9-0000000ExD1-2NQ8;
	Sat, 20 Sep 2025 07:48:01 +0000
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
Subject: [PATCH 12/39] convert mqueue
Date: Sat, 20 Sep 2025 08:47:31 +0100
Message-ID: <20250920074759.3564072-12-viro@zeniv.linux.org.uk>
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

All modifications via normal VFS codepaths; just take care of making
persistent in in mqueue_create_attr() and discardable in mqueue_unlink()
and it doesn't need kill_litter_super() at all.

mqueue_unlink() side is best handled by having it call simple_unlink()
rather than duplicating its guts...

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 ipc/mqueue.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/ipc/mqueue.c b/ipc/mqueue.c
index 093551fe66a7..5737130137bf 100644
--- a/ipc/mqueue.c
+++ b/ipc/mqueue.c
@@ -599,8 +599,7 @@ static int mqueue_create_attr(struct dentry *dentry, umode_t mode, void *arg)
 	dir->i_size += DIRENT_SIZE;
 	simple_inode_init_ts(dir);
 
-	d_instantiate(dentry, inode);
-	dget(dentry);
+	d_make_persistent(dentry, inode);
 	return 0;
 out_unlock:
 	spin_unlock(&mq_lock);
@@ -617,13 +616,8 @@ static int mqueue_create(struct mnt_idmap *idmap, struct inode *dir,
 
 static int mqueue_unlink(struct inode *dir, struct dentry *dentry)
 {
-	struct inode *inode = d_inode(dentry);
-
-	simple_inode_init_ts(dir);
 	dir->i_size -= DIRENT_SIZE;
-	drop_nlink(inode);
-	dput(dentry);
-	return 0;
+	return simple_unlink(dir, dentry);
 }
 
 /*
@@ -1638,7 +1632,7 @@ static const struct fs_context_operations mqueue_fs_context_ops = {
 static struct file_system_type mqueue_fs_type = {
 	.name			= "mqueue",
 	.init_fs_context	= mqueue_init_fs_context,
-	.kill_sb		= kill_litter_super,
+	.kill_sb		= kill_anon_super,
 	.fs_flags		= FS_USERNS_MOUNT,
 };
 
-- 
2.47.3


