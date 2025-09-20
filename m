Return-Path: <linuxppc-dev+bounces-12474-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75EFB8C31A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:52:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1m3xtfz3f41;
	Sat, 20 Sep 2025 17:48:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354508;
	cv=none; b=kVj6JDdCHclOMiGA8p2651p97DXDnZ4/JabF7QJZ2MOkNDByALZtM1GOjq3e+7LdHXEdaCOxCkDi5EiJaCLzMZXaWUOnfGoDkKesV9olyf/CJ/oMDwXhwAHXfhRn+NkuzFx8orFyi4ejN1Y0unBa0/DvG1Npy71uMOhyJS/2Ub4cuXp/b5qRYIQR7MdLUzvsjVwG430qbXxtF6GgcU+3re7YpXqf8Kl/siWi7EPXoPLIKA+Br4fLaSLbTlZ1+lMNzTQOV0NeQAjvUm2lu2hGxN8D0x8WBrlMVRxoj3Na4TIKGMhh11FqPhjvlAfYlk/+b84BpO/5t3+6HaM84AXd/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354508; c=relaxed/relaxed;
	bh=V2I7OUIWBFRscgYYRdCjjF8wTtyFfkGTFabZVJfLoxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPttLGd/K6jYNS5ASIu/ORnA1TcIesS2C15a2r4gC1P44/MsqC5E7ewIVHJyBCS4HM1M6BOfcK0u94SOFS9xwzq53GoyQ0LhJnuVBHbpT3yqGjSVMIRW9EzTUJahemiLstplmdRT7YXiNIS7BYw2HJz2A3NG7wj5MNKvV87c+TFIyMb2m7Pz6MF0Dc2tYz79bYHbiWzQE9KTmgrmn341VqWxn7NwxlyJMFXzwRS3GxZTxpjHxteWV2N0obMiwj6jC9YPs94PJC4ZlpY7WHKHDuLLz2Fb8LhKUThXNNvfQxJeOMCQtUkL/1dR90s5Q9LXqvIOJFAux12SzFMXKMz5bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=pD4mFh9B; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=pD4mFh9B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1W3T85z3cnS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=V2I7OUIWBFRscgYYRdCjjF8wTtyFfkGTFabZVJfLoxo=; b=pD4mFh9BRC1dnf7SHGUZrVB5mK
	DAk58StnHJnuz34FnQl1HvRD1TDl7iszbrHoYPbCnfwpkOZ4dMuc3AqXH1j+jPnxfvYbNcAbJJiFx
	VP36scCd152zIzcX4mPaDfgvAoAxZ3WA5qaNbw+gIMfly4BtzasSyDqP4MrJGi6QtPbNdRTPcMW81
	kvAFyxYkNsNfG8mtqR8OeIfZ5dE1tOHl9wEUBz4jlw2Yo1JdSpey0kK4JhBqHh+jzIVmrR63gbild
	iDbqrfLYFJj3lRworHvKrFPvSn+sxdmkiSFcU11T0z/7RsZ8F0nT8ANZ7dCoQE9nbuWzk2b9tC1Ld
	eidcKYJA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsKH-0000000ExMv-23xH;
	Sat, 20 Sep 2025 07:48:09 +0000
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
Subject: [PATCH 35/39] convert gadgetfs
Date: Sat, 20 Sep 2025 08:47:54 +0100
Message-ID: <20250920074759.3564072-35-viro@zeniv.linux.org.uk>
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

same as functionfs

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 drivers/usb/gadget/legacy/inode.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index fcc5f5455625..6b7adf153407 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1989,17 +1989,20 @@ static int gadgetfs_create_file (struct super_block *sb, char const *name,
 	struct dentry	*dentry;
 	struct inode	*inode;
 
-	dentry = d_alloc_name(sb->s_root, name);
-	if (!dentry)
-		return -ENOMEM;
-
 	inode = gadgetfs_make_inode (sb, data, fops,
 			S_IFREG | (default_perm & S_IRWXUGO));
-	if (!inode) {
-		dput(dentry);
+	if (!inode)
 		return -ENOMEM;
+
+	dentry = simple_start_creating(sb->s_root, name);
+	if (IS_ERR(dentry)) {
+		iput(inode);
+		return PTR_ERR(dentry);
 	}
-	d_add (dentry, inode);
+
+	d_make_persistent(dentry, inode);
+
+	simple_done_creating(dentry);
 	return 0;
 }
 
@@ -2096,7 +2099,7 @@ static void
 gadgetfs_kill_sb (struct super_block *sb)
 {
 	mutex_lock(&sb_mutex);
-	kill_litter_super (sb);
+	kill_anon_super (sb);
 	if (the_device) {
 		put_dev (the_device);
 		the_device = NULL;
-- 
2.47.3


