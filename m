Return-Path: <linuxppc-dev+bounces-14071-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E41C4BDD1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 08:01:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5HRL0QVBz308j;
	Tue, 11 Nov 2025 17:57:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762844269;
	cv=none; b=dSwPoHJDpmf5YVytC5vK8wQX6kmbMvT2VQF29XmMPyt8Hk1pAdzGgu5fomKaGcgvTQPEHlOVy8Agx8FK510cRZUycSkr0NvYNzijFfJZqdk9i3DrES9RiDmS+WCRlaPsQCjgP1iUzTKaXNlgb2HdC2UccRmJd/LvOkiQ3s+03QdojZpw+jZsNfU9AdedrUslFF44KfZ7WBn4UTF/j3vmeoz5X+YEuE8ACjock6DpsAgTy9bwEfOvodq+TJECXZ4ABcQpEBWtvLb/FCyGFt9i1Tdepb6myJbrXccsP0kDsiFxPb8zWoV4MUv4yI0Gms9ZecpN2tGoKFuTMFNmvOA6wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762844269; c=relaxed/relaxed;
	bh=WKINhvrphJyrNwMIsOfgnLwqrkhKPlvlu+weyrXrIrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i7ZaZN9jMdpg7QZ+CypDIPtzt8OHLQOpNndpYvNRbGVVzJJq0DUAT+83IovNiVC4yRLv2hQXZMZqt3/jbtDPNlqt5/conFO7yewBBNJ5ZrTL2V3MhMFUPJQh7vJLY46j1KkiwVDEP3gHeSGREIMC/mPxiyS8umOD4vnDnsu90qiqLV3LgoE7pfst8GHZMX70/crmfaHrcLyYpHRCJmRZYKvTXI42Ap/5Wy+XHrDKJIfgcu1yTZs6bHSmdZrxokwRVoDqatcqiPOq3R4lF5m2QAs2NYEWi28U3xmccxPGK6B40Cff69N6kE+VPO85ZzA+agTtSBFlj5CoIYMr+ziACw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=I/pjxcaH; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=I/pjxcaH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5HRK1v0Wz3080
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 17:57:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=WKINhvrphJyrNwMIsOfgnLwqrkhKPlvlu+weyrXrIrI=; b=I/pjxcaHFuWqmzpdIenmacuMOH
	aq3cr35oehDoPW359bMKvb6c6KWUoxbBSQ2G3ldspISxYPF9RuYak10Xx3e+eHgt8lcYwIUx8PWd5
	n48wI6Ja4l0zXmFmcSKvD2hIWlFyiZWHI3NYWs1S0q6MSqY/21Kbj266yiuuIGjs4yJnjtYj7YWjG
	AaiKqhUTtdf+hIgM8y6q22/U7TuKt23LIqH3zhKzwQU5kpjFf0+Ct2RifQPBTm0EKmQA0DIcvY0TE
	okXU1h7E09WAXuaXA+cIsui7rVE9YFszhKtGLHIn6iCmbbQfwCWZgGLgwFjWLAl/8FkdRugPY7cBH
	I6FbTrPQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiHj-0000000Bwxo-025Z;
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
Subject: [PATCH v3 10/50] configfs, securityfs: kill_litter_super() not needed
Date: Tue, 11 Nov 2025 06:54:39 +0000
Message-ID: <20251111065520.2847791-11-viro@zeniv.linux.org.uk>
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

These are guaranteed to be empty by the time they are shut down;
both are single-instance and there is an internal mount maintained
for as long as there is any contents.

Both have that internal mount pinned by every object in root.

In other words, kill_litter_super() boils down to kill_anon_super()
for those.

Reviewed-by: Joel Becker <jlbec@evilplan.org>
Acked-by: Paul Moore <paul@paul-moore> (LSM)
Acked-by: Andreas Hindborg <a.hindborg@kernel.org> (configfs)
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/configfs/mount.c | 2 +-
 security/inode.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/configfs/mount.c b/fs/configfs/mount.c
index 456c4a2efb53..4929f3431189 100644
--- a/fs/configfs/mount.c
+++ b/fs/configfs/mount.c
@@ -116,7 +116,7 @@ static struct file_system_type configfs_fs_type = {
 	.owner		= THIS_MODULE,
 	.name		= "configfs",
 	.init_fs_context = configfs_init_fs_context,
-	.kill_sb	= kill_litter_super,
+	.kill_sb	= kill_anon_super,
 };
 MODULE_ALIAS_FS("configfs");
 
diff --git a/security/inode.c b/security/inode.c
index 43382ef8896e..bf7b5e2e6955 100644
--- a/security/inode.c
+++ b/security/inode.c
@@ -70,7 +70,7 @@ static struct file_system_type fs_type = {
 	.owner =	THIS_MODULE,
 	.name =		"securityfs",
 	.init_fs_context = securityfs_init_fs_context,
-	.kill_sb =	kill_litter_super,
+	.kill_sb =	kill_anon_super,
 };
 
 /**
-- 
2.47.3


