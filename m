Return-Path: <linuxppc-dev+bounces-14248-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF3CC67624
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:18:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9XsD6W1xz3dK9;
	Tue, 18 Nov 2025 16:16:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763442991;
	cv=none; b=lYwImCb1R2VqG+I4V+XyXFeSa+K6DEXLEXfgzKvLGihFpsQK8cSikRGXYZVrPy3erehQt5XUa7q0NXW5EghBQeSm7chR1rq3nOL4NFn1LmAB5GYUM6s+2tO+Q247lqawyZOkjhu7c7+pCJFjTjHj9NGQHR1hJi2auoc7zxNdhvxAnwEp85zDUPLDv3jab7n3VKBOCe2cRavhoHAivPwlT+lykHViSUU4wODDOymobUqsEqyC+YYNyJjGHzZxBETOKiWtp+yTvP084bhrsQPhxq5D22wZirjgdwUj3bXBFaAGfBHDAiyFWItwuo1xwyyARKtImL7gU4ooPTJwiyVkzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763442991; c=relaxed/relaxed;
	bh=tZCVSqTQSDDLvQs1X2myYSkLJtZwbiT5pTgxLsDWfWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hoCXLoqZYi85ccBWhe7dd3ynlhSSRQHKIxZuCF0SqErDSYNsYzvUP5vv8bgcUj9ruYhYHuDOFFFvaIr8iVZwbDNq4vacpG1RjSUMSMYUSbMmCxQO+Z2yeX31eweVddDrGSDVa6hdoep58uSqfUUoJFLcrndVC/+HHlf9p55lZ/mgJ+6Qfur5hlLUlj47PAtK+YYsOb28bJrZ8H1DqD6IVMb2GByTuGFA9yG5frtcSIDKqbFAGpaiYc7W5Lu7Qnj617VqlKTGwejkWISCYISNFz3GTqZaQkA5YicfzdZPwp2hvrM9oCjQq4iWt7MzW1G6fGu2aOJ7hpIpryPlN6FjTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=LeMawiHQ; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=LeMawiHQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xry3CHQz30Vb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=tZCVSqTQSDDLvQs1X2myYSkLJtZwbiT5pTgxLsDWfWg=; b=LeMawiHQ7jKHSt76eutlBW3Zs2
	s+rZfr3ileWw8U0iBYcz8v2ImHtWAxoclxDit7HsWTNNQmQKOMJkc0H1JsL4GuhLFLZAMtpbJFw3v
	5sBlLWQgFe0bcX9zWvwGz2Giq4KokVLbCiwbMNLTfCiXwtxQVQZeLPKNNBE7juy/rmT4e3GALwTZ5
	PEyKCfonsy9yCOuc26nYqza3cVari3TereVcpVEUdC67qgYTv+GiT8T0E7SLQpJSYJLJKgWMdFNWd
	Zh/sz9+hFx+PvVhRl7jo7ztL9IWysDkF6r54Lx6xBC6oEYA264W6d3qLG14Ze+qOGrr/0NYrKK5Sb
	Q2r9AhKw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4T-0000000GEQD-3C7U;
	Tue, 18 Nov 2025 05:16:05 +0000
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
Subject: [PATCH v4 07/54] convert simple_{link,unlink,rmdir,rename,fill_super}() to new primitives
Date: Tue, 18 Nov 2025 05:15:16 +0000
Message-ID: <20251118051604.3868588-8-viro@zeniv.linux.org.uk>
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
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Note that simple_unlink() et.al. are used by many filesystems; for now
they can not assume that persistency mark will have been set back
when the object got created.  Once all conversions are done we'll
have them complain if called for something that had not been marked
persistent.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/libfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index a033f35493d0..80f288a771e3 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -630,7 +630,7 @@ static void __simple_recursive_removal(struct dentry *dentry,
 				if (callback)
 					callback(victim);
 				fsnotify_delete(inode, d_inode(victim), victim);
-				dput(victim);		// unpin it
+				d_make_discardable(victim);
 			}
 			if (victim == dentry) {
 				inode_set_mtime_to_ts(inode,
@@ -764,8 +764,7 @@ int simple_link(struct dentry *old_dentry, struct inode *dir, struct dentry *den
 			      inode_set_ctime_to_ts(dir, inode_set_ctime_current(inode)));
 	inc_nlink(inode);
 	ihold(inode);
-	dget(dentry);
-	d_instantiate(dentry, inode);
+	d_make_persistent(dentry, inode);
 	return 0;
 }
 EXPORT_SYMBOL(simple_link);
@@ -798,7 +797,7 @@ int simple_unlink(struct inode *dir, struct dentry *dentry)
 	inode_set_mtime_to_ts(dir,
 			      inode_set_ctime_to_ts(dir, inode_set_ctime_current(inode)));
 	drop_nlink(inode);
-	dput(dentry);
+	d_make_discardable(dentry);
 	return 0;
 }
 EXPORT_SYMBOL(simple_unlink);
@@ -1078,7 +1077,8 @@ int simple_fill_super(struct super_block *s, unsigned long magic,
 		simple_inode_init_ts(inode);
 		inode->i_fop = files->ops;
 		inode->i_ino = i;
-		d_add(dentry, inode);
+		d_make_persistent(dentry, inode);
+		dput(dentry);
 	}
 	return 0;
 }
-- 
2.47.3


