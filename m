Return-Path: <linuxppc-dev+bounces-14054-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6568AC4BD22
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 07:59:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5HPD4ZqYz3fGQ;
	Tue, 11 Nov 2025 17:56:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762844160;
	cv=none; b=bkamcgwdbqxHk/p8ulagSgEXrk7CrJFSSsS1zhASfW7CWXm24Z0SuW8BE8Cix/E/cIY8xz+Z87zz60KLgkRTZynLr7WtuaLc5PQ+IcgnmmVZM75wJCaEtoCY2V8abhduvVjNMsKcmbZ9QUg7sClU3i9AXdlIHbZHke/9YcQW1EFP8sffv3gydZJy4hY066HSjK5ujn/VpaYwCc6eEoFOPn4UXllskz0hhqEz5Oe9nx1zUVh2ZTTVyKFU4JylhZ2cqib3cyBt+gXtn9/pjWcQ5XpVGJf43khwFwLtjjCrdJMrgw/b9Jttn1wQtQFir03+ARC4b2+3OVmXBUkxs44kZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762844160; c=relaxed/relaxed;
	bh=/QE5WDCT/6E4/9SENMzbAx4/TtK/VNDZoQCVo0AmPFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TKQclNXjkaIqD6jkMHEWciHFyUbImnrzIMW0wLl3f0uVlgNuynKqJfVST+g2AgrnbODM9A4ykb6ZtBxn3Mytfpa2PTZmiLB9qa+7KZNJq3v9JyklRhKdrCCTmitfXVQ1P/aQ40iQU/2Nc5HqqTI3EAWUXGcyhzBmpzm33+h4gQvy/4bi3UyfMsYu3cRfGrw37OIa5Odf2zRXw6bsX8GhlEthfDdUoCxxmbUol0UI3uMrFsCwRVDmnSif355zJjE1Sxsf4hbg4TWBF6t1hrYZG9JDeRWgBOCbwzpU/BfdkfrIdT9UdoX1hHQGRYs0SAiYDe06+FBmVurX8vDod7mwZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=hgd1T/hR; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=hgd1T/hR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5HPC6pCbz30Lv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 17:55:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=/QE5WDCT/6E4/9SENMzbAx4/TtK/VNDZoQCVo0AmPFA=; b=hgd1T/hR7hFzvqa4/FhQi64LUF
	DpGBGzt8FSozWK1vHT1CSAIxtkOUMD9lfA+Yg5jssmzeqp36q2yrCN1/ha/2TSHNgQG0WInh76BP3
	S+rZAUnPIolPPEO6FsPoyNn3RAH6ashTBW/05hTa2+Gf9ltR3CmC8s3eEAvGIOLEzKZj8ctY0MWWd
	QcP46qJ8955VSBOzIya9NtrbLAAv7jtnZPWHr1LfNQ6KwEohpuZdrws6OkrXvoNH5ypk/dY4ZvEtL
	t26DMKkl5jl6E+GclnSqGx58FWqgLhyI4nW3pOThpZWg0niou86/LHLxzvZcrzqxg9WNlmOEQl9PK
	HXAt9dmA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiHt-0000000BxNT-1JUi;
	Tue, 11 Nov 2025 06:55:33 +0000
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
Subject: [PATCH v3 48/50] convert securityfs
Date: Tue, 11 Nov 2025 06:55:17 +0000
Message-ID: <20251111065520.2847791-49-viro@zeniv.linux.org.uk>
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

securityfs uses simple_recursive_removal(), but does not bother to mark
dentries persistent.  This is the only place where it still happens; get
rid of that irregularity.

* use simple_{start,done}_creating() and d_make_persitent(); kill_litter_super()
use was already gone, since we empty the filesystem instance before it gets
shut down.

Acked-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 security/inode.c | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/security/inode.c b/security/inode.c
index bf7b5e2e6955..73df5db7f831 100644
--- a/security/inode.c
+++ b/security/inode.c
@@ -127,24 +127,19 @@ static struct dentry *securityfs_create_dentry(const char *name, umode_t mode,
 		parent = mount->mnt_root;
 	}
 
-	dir = d_inode(parent);
-
-	inode_lock(dir);
-	dentry = lookup_noperm(&QSTR(name), parent);
-	if (IS_ERR(dentry))
+	inode = new_inode(parent->d_sb);
+	if (unlikely(!inode)) {
+		dentry = ERR_PTR(-ENOMEM);
 		goto out;
-
-	if (d_really_is_positive(dentry)) {
-		error = -EEXIST;
-		goto out1;
 	}
 
-	inode = new_inode(dir->i_sb);
-	if (!inode) {
-		error = -ENOMEM;
-		goto out1;
-	}
+	dir = d_inode(parent);
 
+	dentry = simple_start_creating(parent, name);
+	if (IS_ERR(dentry)) {
+		iput(inode);
+		goto out;
+	}
 	inode->i_ino = get_next_ino();
 	inode->i_mode = mode;
 	simple_inode_init_ts(inode);
@@ -160,15 +155,11 @@ static struct dentry *securityfs_create_dentry(const char *name, umode_t mode,
 	} else {
 		inode->i_fop = fops;
 	}
-	d_instantiate(dentry, inode);
-	inode_unlock(dir);
-	return dentry;
+	d_make_persistent(dentry, inode);
+	simple_done_creating(dentry);
+	return dentry; // borrowed
 
-out1:
-	dput(dentry);
-	dentry = ERR_PTR(error);
 out:
-	inode_unlock(dir);
 	if (pinned)
 		simple_release_fs(&mount, &mount_count);
 	return dentry;
-- 
2.47.3


