Return-Path: <linuxppc-dev+bounces-12457-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 033F0B8C251
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:49:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1b4zz0z3dC0;
	Sat, 20 Sep 2025 17:48:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354499;
	cv=none; b=EF70nk+PyX0MBSVcDumKzFDTRw8BKn9tC7SjKLX5tufFEtM9K82zE9bBj6pzc+sZBWxiL5U/4fdgEE+X9IxKMMdYBEbTVre6Kr8yinMfpY6S7C6KSZ3l1N5wDN3D+rEi9WVOtRemtCUVdRk7pL+m8194q9PlMnmkRoZYydlVf9beEYqzkUBoWEdrrYE996lJv7fec0uUsW1I+kBr2IWA6oAQspADUOwXZLkTjgTfLRzs/UtQXCgThaBrXk/XIkEVXzV0V3qVI/p7kdZToWwEV/3vFAIsOo/KCYBp0gf/lURUFpLZsBLTO1yodbAUmNfblyqzXpFB4tgY04FTFSrSWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354499; c=relaxed/relaxed;
	bh=Rblw1/+FVpnDSF+tGzA58CitG6ZVFpPLgpN9TawlUAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L0rByBlMYDeihO99n5jJjN7BDz9ghut/tKrFypdDNDh3XxI97Tvr/EvXNRUy+Kc9jSoN243hybq53X/odi5JXWdOWjaPEMW6Tcg23s4DqtQDPQnukdE6Ov0hz9U30kFwvXksxX0Hy9H2pnHAXltUWVQMZGSwdQu7MagtXJRzqGKKlFJYxCg9X0IEJlsDwZaKp+d0QAaMQufYJEs9fufruy8k3wdlGAfpQZlJ4jH+txzLKCFiWYvIvozgSYdQF+cXhL2CJA92k85OcfwyU38xcx6h1kblvq2bE4O9Y56+qZY8EmkYZxYOvoFVJKe+GETou3oocCL/Rb5wJ8t3J8Xdsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=t9iONXrV; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=t9iONXrV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1R511Xz3ccl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Rblw1/+FVpnDSF+tGzA58CitG6ZVFpPLgpN9TawlUAc=; b=t9iONXrVV2xYR0Ohv6Uqq876VT
	EOLP68t82ONpzCjT6GTEie1WbU4Z5xuFIUQfrY7W3q92BniOaKvWeviTTUUvh/+gK6WzBnInI47DQ
	x3iQ1kIlshSd70ZWXETqVX7uIwzov3t0WdsszcElheVQ2bY76i0NDZRonXWE7dQyC9EiAmEQ6Bscb
	CjwXDS52jAujjzTldVIar/giui3Tc2BusRDf1/9QdkxmGstJBQO+kgyXUVlaXTOwelnzqjDTz1r+S
	6EokSysi9b0Fmqf/9VicVzGeuaGtZddJ9ODEOvwWRo69viMy5RpA5RqkrUcO3jKzhP58lRog6xhzc
	2jQZqg1A==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsKA-0000000ExEK-1Zwa;
	Sat, 20 Sep 2025 07:48:02 +0000
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
Subject: [PATCH 16/39] convert pstore
Date: Sat, 20 Sep 2025 08:47:35 +0100
Message-ID: <20250920074759.3564072-16-viro@zeniv.linux.org.uk>
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

object creation by d_alloc_name()+d_add() in pstore_mkfile(), removal -
via normal VFS codepaths (with ->unlink() using simple_unlink()) or
in pstore_put_backend_records() via locked_recursive_removal()

Replace d_add() with d_make_persistent()+dput() - that's what really
happens there.  The reference that goes into record->dentry is valid
only until the unlink (and explicitly cleared by pstore_unlink()).

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/pstore/inode.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/pstore/inode.c b/fs/pstore/inode.c
index 1a2e1185426c..bad479fbb0ff 100644
--- a/fs/pstore/inode.c
+++ b/fs/pstore/inode.c
@@ -373,7 +373,7 @@ int pstore_mkfile(struct dentry *root, struct pstore_record *record)
 	if (!dentry)
 		return -ENOMEM;
 
-	private->dentry = dentry;
+	private->dentry = dentry; // borrowed
 	private->record = record;
 	inode->i_size = private->total_size = size;
 	inode->i_private = private;
@@ -382,7 +382,8 @@ int pstore_mkfile(struct dentry *root, struct pstore_record *record)
 		inode_set_mtime_to_ts(inode,
 				      inode_set_ctime_to_ts(inode, record->time));
 
-	d_add(dentry, no_free_ptr(inode));
+	d_make_persistent(dentry, no_free_ptr(inode));
+	dput(dentry);
 
 	list_add(&(no_free_ptr(private))->list, &records_list);
 
@@ -465,7 +466,7 @@ static void pstore_kill_sb(struct super_block *sb)
 	guard(mutex)(&pstore_sb_lock);
 	WARN_ON(pstore_sb && pstore_sb != sb);
 
-	kill_litter_super(sb);
+	kill_anon_super(sb);
 	pstore_sb = NULL;
 
 	guard(mutex)(&records_list_lock);
-- 
2.47.3


