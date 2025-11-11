Return-Path: <linuxppc-dev+bounces-14053-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5D6C4BD16
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 07:59:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5HP72wh8z3fDd;
	Tue, 11 Nov 2025 17:55:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762844155;
	cv=none; b=QnvaBCO+Trf8racqs9E8uJ45llN+95e4GIWmw8UcOkjGzLaPy9aDirtvMJ/oAmGCGqP42o4w+OqxLrV9ay0K5bVXzg3YbftFr9uXoMUxSLmSYf7w1zHMTutm5EdZuQDKKA/0umEcnfVXauJpVSXY2aO3VXmMwRTNXxgiHNgqH6x/yl8Ml3hsDnWWM4ZDcHJ7UwlAIA5IcAhboWhVvTQYXiN3CIQZ7H+yB1jjqnk7zxOMtAdDRMJzRhPlYdcI/aH5Pdlau2QvoyjpZogTShgeO8MV/m+fYj2JsLZsFRBjZL5BwQc1iG0tVlQhKI1CZd/GGfbpRztlNLlGG7dF+apdvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762844155; c=relaxed/relaxed;
	bh=nSvwG6RsfCAVSbS4+/4CBqqk98DhL2WOLYlzO7apNsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gX5baYZElKxd7s2UMXnn18AgyyYGKnidN1uTaezuZq1oijpNWpyp9GPEdQ//SDRfsDDq5YOSmn1x0nP5wlfg3iSEiatGxdIiBvHHLzH2hXUSJ18+pEspb97gmCOzRcKhli/D2G98Km8kh8uMdw24kH+pfs11D6oC4srDx45K76HGqpPkk2xSqvZyAbWLrRuuRzRolUExzKeHp9CE20QP5ukt9QHbZa4PjQkvO07N+jenkpsQZH6UbJDqSJ1BD4XMfYAbYbIvi3VpczCjtkXvj+49zFWaC2vvIZJ4qPRRG/3pheD1bJe3gTjo9rLUUHeWpTjy4Tk5covZhvB1q8Emhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=wefX/RwZ; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=wefX/RwZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5HP660mtz3fBy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 17:55:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=nSvwG6RsfCAVSbS4+/4CBqqk98DhL2WOLYlzO7apNsA=; b=wefX/RwZfv4dtD69RnkIvTZIqG
	PTG9ZHWW0bW4yX7BJNMx9wJ7AcDjxOPZ6mjVbD4CD7BuvVWvQMZWwS9FOaVlQbm4I+8IkYhfOsXlM
	LgAZbd4hEKtquq0INN1Hk/j7AThuKTggf/CXmrE8+aLBpMOzJ+dusy+dlWnpKk/WOKN+JT0pQ754g
	vwcnMguWJwt8rzuweaSc75VPeWvEKDrpB3XyL32RFnJstyZqvdfTe5Gw+9cBZ54VZCTp+8o5rC9hI
	YtwPtgJegXuyGqE0TaBkvEIYqX6np1Vq3VZldMhc7DFvG2ZPaj3ELNQUELCXJPOcMQ6DUTDp0hZz0
	oBUOoPcA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiHj-0000000Bwyb-3vRs;
	Tue, 11 Nov 2025 06:55:24 +0000
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
Subject: [PATCH v3 18/50] convert pstore
Date: Tue, 11 Nov 2025 06:54:47 +0000
Message-ID: <20251111065520.2847791-19-viro@zeniv.linux.org.uk>
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

object creation by d_alloc_name()+d_add() in pstore_mkfile(), removal -
via normal VFS codepaths (with ->unlink() using simple_unlink()) or
in pstore_put_backend_records() via locked_recursive_removal()

Replace d_add() with d_make_persistent()+dput() - that's what really
happens there.  The reference that goes into record->dentry is valid
only until the unlink (and explicitly cleared by pstore_unlink()).

Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/pstore/inode.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/pstore/inode.c b/fs/pstore/inode.c
index b4e55c90f8dc..71deffcc3356 100644
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


