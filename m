Return-Path: <linuxppc-dev+bounces-12455-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C11B8C242
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:49:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1Z3ClTz3dBX;
	Sat, 20 Sep 2025 17:48:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354498;
	cv=none; b=bMkQkruZBIXuA7EmLZ1+ry+4JIXU5FrR9DyKLJ09Tr1XCQMJvEcz3DlDmgm0qI1M3aD+fQsWaNn7INDVFbxXKJddABrU08TJq+LtYgsmhwkc6jcfMCAN6Rh9uTzx7GE4JLmedel2HcuwOFWbmpdZ3R6TjZZnBl/k8JV4nZXNckFDChUHJoYXs67X8uZGYegjNJXmmEWDjc+q7YLVzdMhQkScy8TDVYsfNdg1yCxZqbZdUwBsw2dtjJdPsLKSL8SJH6fmBZP1VCMrhVpkvUWOQgPD6f2aoofH+pNvSLxc1bv3gzk84zk8UCO+aUcbtusO7KqlfpNjHSnh1c3wGyBVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354498; c=relaxed/relaxed;
	bh=SHIurh1L4ZAnx8Qlum7bXJSPzKE6mjESH5b9zbhJwo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R1EAHumvpeqoM1QUj4M+gGEVqJy4QvhVf09en4WC5Hm2tlSzGW0EWwKWREaYiXvOeNQlUP1L4WgAyq8Mq9qYq9vOOM4Nth3ZCeISulk0NgM6osQwC1JGxU0b1ytChL1g6l+9XD/ZtyD2nms1rH96ATSBRjDWhmDlsRvLFGDyMKKqFKe/PQB1WJn8ICOAttRj74f+nPQaTdJpB22w0177mU8sqbstGJWGLsLGQkNV72UaCDwypYaPQDxf3TnUAgFBvOaGZLzTmdoHtNB76jYVSKmJcBjB5boNsQW4U+SL9JiLGRH75xa4SaCZ1Xu5Y4T0/ceDzsAGii5o245UhqAe9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=Xd+fhdH+; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=Xd+fhdH+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1R3JNvz3ccN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=SHIurh1L4ZAnx8Qlum7bXJSPzKE6mjESH5b9zbhJwo0=; b=Xd+fhdH+XROIHkZFDeHvNlvGi9
	2XDjMdW0HBBVLKWurJFnhokxryB8V7D0GP7K9K48Gtb4JvIpea72Lqt8zNNKOf1gP5ZbalRwMA/Xa
	yenZDqNr5o036U952M8Q9k5Bu6ohbdqU0HFDCyc6fPRdm2ziCCaevvpNIj7uKyx3g9vd4hAlQDwt6
	c8ELFtaoSFtPE5hO03NWrFizgx12s47mZFKBGy+doHIlOiXqU3YuIlOy0VtCexqTUQuHeQJTezd2p
	jSOqkfX7/7qhwr/ni2e5+G3Ar9WkN1ld9PMG0uKudvozKird2FxqtQkzzEQcZ1pcbRkVKTC1IJWsa
	ezXbChyQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsK9-0000000ExDc-3YnV;
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
Subject: [PATCH 14/39] convert dlmfs
Date: Sat, 20 Sep 2025 08:47:33 +0100
Message-ID: <20250920074759.3564072-14-viro@zeniv.linux.org.uk>
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
persistent in ->create() and ->mkdir() and that's it (removal side
doesn't need any changes, since it uses simple_rmdir() for ->rmdir()
and calls simple_unlink() from ->unlink()).

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/ocfs2/dlmfs/dlmfs.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/ocfs2/dlmfs/dlmfs.c b/fs/ocfs2/dlmfs/dlmfs.c
index 5130ec44e5e1..c1419765a8fb 100644
--- a/fs/ocfs2/dlmfs/dlmfs.c
+++ b/fs/ocfs2/dlmfs/dlmfs.c
@@ -441,8 +441,7 @@ static struct dentry *dlmfs_mkdir(struct mnt_idmap * idmap,
 	ip->ip_conn = conn;
 
 	inc_nlink(dir);
-	d_instantiate(dentry, inode);
-	dget(dentry);	/* Extra count - pin the dentry in core */
+	d_make_persistent(dentry, inode);
 
 	status = 0;
 bail:
@@ -480,8 +479,7 @@ static int dlmfs_create(struct mnt_idmap *idmap,
 		goto bail;
 	}
 
-	d_instantiate(dentry, inode);
-	dget(dentry);	/* Extra count - pin the dentry in core */
+	d_make_persistent(dentry, inode);
 bail:
 	return status;
 }
@@ -574,7 +572,7 @@ static int dlmfs_init_fs_context(struct fs_context *fc)
 static struct file_system_type dlmfs_fs_type = {
 	.owner		= THIS_MODULE,
 	.name		= "ocfs2_dlmfs",
-	.kill_sb	= kill_litter_super,
+	.kill_sb	= kill_anon_super,
 	.init_fs_context = dlmfs_init_fs_context,
 };
 MODULE_ALIAS_FS("ocfs2_dlmfs");
-- 
2.47.3


