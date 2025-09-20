Return-Path: <linuxppc-dev+bounces-12447-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7D3B8C1E5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:48:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1T5gMnz3cj3;
	Sat, 20 Sep 2025 17:48:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354493;
	cv=none; b=NyLGUm5Y7+Xhlck+zM+6pRDIoj1S6G/N2+1Z9BptMfySFaklbovhqAPuG/yr6v+UwN5zBy3D7MEqlW32kJztxGIcMQhB9AAvI6QuZTCb6nWZ4aMW+5NQezkM4KF/wwZv8vkR0qjNo6xht2/DIzZ80d1YlpsscJUwt5I2zsQdgoaizc1Uvslo8KlANlOOfPkShtt5hSlan7qajoQc/iwVDgI/ijcNoExb/KHt5zUftZmicbIeFQuy4rV/ARtEabElvQY1qkQqW+slrLpEyEJ/8L5vlo5ZiPuGTOjlzQZB7m1JjLCPszrtaDUw669btMj0XnTqCj+uhvtQTeMr2mI6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354493; c=relaxed/relaxed;
	bh=nXGw1nJCnekakkZR178NLSh8+iviODtKUClSm5rridQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NuZVaeAoF7PGysUhexyh9lUSt+qlNNTk6lRff56gLf3tCY+FsFeWsRF9FVYso8/E3V3Q4RR8Yo1+4lWySwAoNVQ0gKwpxnMMN9sujeFu6QX1Sq4mxQBsaFxZ71RKEnbYa3tQGaop8WH3q4q3lTqWG23Bx6X3viAUIHicZp6XuhScQVDgh8M+Lx801Ykerib+f/Cpvo8u3AXlO1yhtzwJRQN/8o4UGateJGNLLUiOpB9TtA6RaFWKMEHSE8ortyx7O6tuCI69s3r/ZqYaGDKB3WqVy6ZEjGU7h1QWRZPGv45aeC89qfmzicO7rrHrmNuesXcQZyXGNuFkLTluKrJBsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=o3oTpbJK; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=o3oTpbJK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1P3Nr1z3cYN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=nXGw1nJCnekakkZR178NLSh8+iviODtKUClSm5rridQ=; b=o3oTpbJKkO0Lf5LxTLzK7R+SjW
	TY+nHLhBwrZkYyS9WBssOe4sbsADlN+jFSeqzXZkOQjGi2O4Aeo4KhKCAL+uoM08I/W6ppWx/eK1G
	YY8o3Jj4jFbuvUFckeTwI7kn0RccvdITK6eax7xeINKs4OwT/iQ0BWdCvr1W1NtLfklNt2YFIfGss
	68ABYs9XQgrWJX+naaa+H9ogU1NzX9gubWis+XzSZ+Z7Tx5H+qt9YdoGGZ7ruUliSz3cMb8b90ji/
	7Mbnbd+9p8UeOzS7783Z6QXJvmks9Z1wfcIsVpewlB6Iyx3Yx+N1W+Yy8PBzZxrdZ5aUqlwZ39did
	6Uy9Kuyw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsK9-0000000ExCj-0reI;
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
Subject: [PATCH 09/39] convert xenfs
Date: Sat, 20 Sep 2025 08:47:28 +0100
Message-ID: <20250920074759.3564072-9-viro@zeniv.linux.org.uk>
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

entirely static tree, populated by simple_fill_super().  Can switch
to kill_anon_super() without any other changes.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 drivers/xen/xenfs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/xenfs/super.c b/drivers/xen/xenfs/super.c
index d7d64235010d..37ea7c5c0346 100644
--- a/drivers/xen/xenfs/super.c
+++ b/drivers/xen/xenfs/super.c
@@ -88,7 +88,7 @@ static struct file_system_type xenfs_type = {
 	.owner =	THIS_MODULE,
 	.name =		"xenfs",
 	.init_fs_context = xenfs_init_fs_context,
-	.kill_sb =	kill_litter_super,
+	.kill_sb =	kill_anon_super,
 };
 MODULE_ALIAS_FS("xenfs");
 
-- 
2.47.3


