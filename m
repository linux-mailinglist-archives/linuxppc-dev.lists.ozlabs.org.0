Return-Path: <linuxppc-dev+bounces-14286-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE79C67735
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:21:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9Xsk0hWXz3fVs;
	Tue, 18 Nov 2025 16:16:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=62.89.141.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763443014;
	cv=none; b=GUDhTJRr9yibEhG7lLxmSeDUj7unz3EqxR5Amf5IULx3QlMGmPF6aRHWK+zd5xWyWljfXUfjvuSuhbrTmreaMLRviwhNQ+YinFql6ivLqvUIm72qB6uPI2Rxtast1TKAJ/0wnFujS9ZWxEcmgUafApgzvoFzFabQFigbzPQpuyC7ls7upGVsKBcE8XWiuMIvl4OfzrevoiiMbb2KEIedQcKj7Y++7B89WM1gNGlNpt8qUw9DRXC2sv8vUa+2dREeyFouj69lpKXdacLFWwkcnnfESeUMgUT24GtvwJuL5HZdGgkzoPduWjyZXAXYitFIyxbAYSNiENYxyFjIqh5y2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763443014; c=relaxed/relaxed;
	bh=NeGicC5Z67ZOycdylyHVP58sPv/wzz9kpKbtM8vrBao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oHnhk6OZTipvypT65xE8w0dpxxePZhN9wGZuWUuozqaAo1o17rEomr0gZEwpahQ4T9kcjDU1YbsKykpZtSglXlcFSuoi/B4okeSIyhZv+waORL2tz2SzJC99fpuHHR8798M1P6qiUG7ej91duUDaM7QevHT8b8VU6ahBf7KM8EkHHk0BvWYuICIwrJfYl+vinDqwcEPc22aSxo9ycP5QoPVx0EoCJceDOtzqJ3xV9K6uS7VtH6t/xZPDNjLB10qt79u1bixBP8yTEDcczLBs7SogeBC4Cpxz860GHrJ6fZuy9Ng8WVs87y/dcK50QjMD9G1T3GXZymwhyF0WdV2kmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=foJK7sLd; dkim-atps=neutral; spf=none (client-ip=62.89.141.173; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=foJK7sLd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=62.89.141.173; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xs64f4pz3byZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=NeGicC5Z67ZOycdylyHVP58sPv/wzz9kpKbtM8vrBao=; b=foJK7sLdTQuza99mB2bmXypFjg
	misbqZX+4TBMEHJPS/CtDVLH2McNOV5pxbQLZgbbfKRKtXjjwnk2f01dTbYNr9VJA67kQswAXuh51
	v7BUg/u2sW2x15WikQA8wQUoxPjQvUSRM40WHr5yWeQrqH6TIN7Q0CfbUthRf/ZPJEgYcaLwIqney
	EiFj+aQFrcYDib7axbtElcqJ5Z2Zc3O6A2uzMZLefKpMbX2VuLIAZAam2xbQLYKSpMfh0jj6whvUK
	xLyQ6i2VSFIlc42oPP0Ujsax5Y00fFs/iuT46xZx6+SyspurjtX6r0yUUM8mE4LPm/R5jlmNfWkCw
	C8m4O0vQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4U-0000000GERB-3NMQ;
	Tue, 18 Nov 2025 05:16:06 +0000
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
Subject: [PATCH v4 15/54] convert bpf
Date: Tue, 18 Nov 2025 05:15:24 +0000
Message-ID: <20251118051604.3868588-16-viro@zeniv.linux.org.uk>
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
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

object creation goes through the normal VFS paths or approximation
thereof (user_path_create()/done_path_create() in case of bpf_obj_do_pin(),
open-coded simple_{start,done}_creating() in bpf_iter_link_pin_kernel()
at mount time), removals go entirely through the normal VFS paths (and
->unlink() is simple_unlink() there).

Enough to have bpf_dentry_finalize() use d_make_persistent() instead
of dget() and we are done.

Convert bpf_iter_link_pin_kernel() to simple_{start,done}_creating(),
while we are at it.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 kernel/bpf/inode.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
index 81780bcf8d25..9f866a010dad 100644
--- a/kernel/bpf/inode.c
+++ b/kernel/bpf/inode.c
@@ -144,8 +144,7 @@ static int bpf_inode_type(const struct inode *inode, enum bpf_type *type)
 static void bpf_dentry_finalize(struct dentry *dentry, struct inode *inode,
 				struct inode *dir)
 {
-	d_instantiate(dentry, inode);
-	dget(dentry);
+	d_make_persistent(dentry, inode);
 
 	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
 }
@@ -420,16 +419,12 @@ static int bpf_iter_link_pin_kernel(struct dentry *parent,
 	struct dentry *dentry;
 	int ret;
 
-	inode_lock(parent->d_inode);
-	dentry = lookup_noperm(&QSTR(name), parent);
-	if (IS_ERR(dentry)) {
-		inode_unlock(parent->d_inode);
+	dentry = simple_start_creating(parent, name);
+	if (IS_ERR(dentry))
 		return PTR_ERR(dentry);
-	}
 	ret = bpf_mkobj_ops(dentry, mode, link, &bpf_link_iops,
 			    &bpf_iter_fops);
-	dput(dentry);
-	inode_unlock(parent->d_inode);
+	simple_done_creating(dentry);
 	return ret;
 }
 
@@ -1080,7 +1075,7 @@ static void bpf_kill_super(struct super_block *sb)
 {
 	struct bpf_mount_opts *opts = sb->s_fs_info;
 
-	kill_litter_super(sb);
+	kill_anon_super(sb);
 	kfree(opts);
 }
 
-- 
2.47.3


