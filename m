Return-Path: <linuxppc-dev+bounces-14051-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C03DC4BD01
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 07:58:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5HP63Jhdz3f8T;
	Tue, 11 Nov 2025 17:55:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762844154;
	cv=none; b=WSsEDgHrBbEDfIUTkc3lqKFtCtfoBVKlOSga0GT9h1Q5eFqzHJh5QO4Et+oj6mZ0JI9g1eBW9mIL4o5g698yo2uN0HaHWSEO7fCfPUaxfl3nCX3tqkYAFtPP6Zd3ENOzxRAwhZVs91SVKxOra/mm5HKJniSF5ekVO+v3VvOC/YtfTYBe4UaJu2rMDcrNHIIstIY5RRRH7jPf8wxBLZTwJsdC08kYcI3ZmVvVUHbOe6RXky4EKPH6qgRR+dgpZn7LwjKrgVrL5CQ6w49UKkGHN4IqO7GiS3L0zHEFo+28+m7MU4XayhdrhpVgj35Gym9gy+DoJ/B4G+9AlzuL1ikOww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762844154; c=relaxed/relaxed;
	bh=JiG9nHcsxcwZpHb/L0Tx41DaV7imD29tLb/ai1sU578=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lwjp894ke8LxtsH2YENNYgWe9doeXXMc1YKVeRvaDQF880D/NKUp32zcphiwGXq5XUpiRKAzgTSpyzAv/hiixUdWvwBaWlFyTnLelFUeOCZWs60UZVMfErRe+0OaeBGRO1vzrNDkr/0fL7/Afp4QIzXXfmwTYPAkNPEgINcgyG8jkvr/1ccp2x85H/1ZaggcqaqvY+y/wyremiLekZ8GgE8fNiYChZOxfa0XQuZiLbQ6Vrd0m7KEd/xg5/xFEHBkuW/VnpWxVs4qWDGY9Fwo5B8r+/uFKThbIKkcl6zC6OiG1SpqD1H4LAc59lV0Cwc/PRscVp7c8ojsHaz2891AZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=KJyJxRMc; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=KJyJxRMc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5HP55z5Mz3dy3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 17:55:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=JiG9nHcsxcwZpHb/L0Tx41DaV7imD29tLb/ai1sU578=; b=KJyJxRMc0dvbQcOITZBVA+WBk6
	ifKPkydBj5RdVYpkYeX6lt/kJ7ld5xb0t53muvLxLstYnB5Kj+ibW1kF1JoNVPQmbi/Msmgp6IIua
	rxkVOKwaX09nya1yIHsO/LXlke4OexR2bBkWG9LhOwtpTOY2ugBYceF0WF/wnns6qgtdqeY6EhATx
	NaphnnRAzZNypERmbf3t7xl0oXOouhXWk5Ks9Gq+2D+L1HLZ20izPqJ7SWklcqVqWcK8WfltyTXu1
	JWzC4NyfbA4dtQ5vb8jg0/lTWmXs+f02YOh/csRHhSEvARsXS9htgina50+ZEPcUaq8myz/AFR1Nu
	i5DDMhaA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiHj-0000000BwyK-2Gux;
	Tue, 11 Nov 2025 06:55:23 +0000
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
Subject: [PATCH v3 14/50] convert mqueue
Date: Tue, 11 Nov 2025 06:54:43 +0000
Message-ID: <20251111065520.2847791-15-viro@zeniv.linux.org.uk>
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


