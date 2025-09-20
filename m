Return-Path: <linuxppc-dev+bounces-12453-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD93FB8C220
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:49:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1X4Jd9z3d2N;
	Sat, 20 Sep 2025 17:48:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354496;
	cv=none; b=fkF31MUEDpt9tljewXOYfkk2R6SIGYHsaeDSHI/Lxsv58EqcTBq2/gBCN9y01u/v+N+i5MbbZrWU0LY7lW1fYs41RV8rXSyODJemVQY7L6Mf4UwYkHBIzH4A284ZxL2u/k/5bvsfw/3hbcY0C4w3U26spHSBZXV8/pNjXEBnHV4vkZTh1dwPqOt0hE/ZSNiDj4GQmqi8pPhqcBjrsWGC4NradNSplNtOiMR4lLXpVxehIO1kl5ztEV/o1qvbxO+yxuosoaO2SKOwJmbuNnhkw4sFjAlq8fQD+N0o02D1wiEyfWLPCPdosGtjl7sk2eTEj3X2p5YeYXVE8ios7DhVgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354496; c=relaxed/relaxed;
	bh=fWCUlMHi5omKZPse+rHltZIDpXcWWINKvoa2e5LYjd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fpPX/PMflU38Cvcn1J2zOMbXkQjqq/tbllOZUNkdPPhvaoChMRyRWi2y31gpDJ18hZ1Oce/VSV8MGk0vmmZoNOwdF1nrztcGlKl49Ha+F6/dpIJPVUBwWCGCxiOpDbXCWsn2swMFS7Mbfk8CdeSqkCi5bsSHA+HVTp2KPY9GT2RfTJ9EO3wITmaAgDT0JX6GU0+utkZXoZm24doFs74wLw3WhLE/RgmOtDinnDSEeAYz61vUAE+rEeIZCd7A8lK2gOOLEpAsGQeetLxjE+1ThRalq5gxKxhA2uQoSywp9cledUuXCxcT9Eg8wfO54OdqIwWc6Fx+EedjM5aidGa40A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=OQ5r0/I/; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=OQ5r0/I/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1R1Rkhz3cbg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=fWCUlMHi5omKZPse+rHltZIDpXcWWINKvoa2e5LYjd4=; b=OQ5r0/I/W6hUt+8wYII9TXI3wg
	zfMjZaN34q0Ac1B99Lez2+ujRCnk1aQp8ARPfAvAk68N6YSBlmO+HGFatdr1fYzQjHYSMZjRHE1Zt
	kaUyGIy2gHYuaGfG1meTLYQho2c7tPjSRrwm7oaHXte/uU6vFyh3TaNlkVx12zYqg4nHwOwg43JZb
	QqcaKOpff728N/6TdZ0WPMKp1IaidA6NJSGjvwObYSNsO08+R3DLlY5fIsaqw1xiGnD1AW0QABOVF
	7iw2dGUfxkNxRmIkTipCa/rLuayyHJAfnGPslDHNrGXxtoM86CMGESCM9fYweXe0NWDct/PI/7ln+
	cYyomVEA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsK9-0000000ExDn-44H6;
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
Subject: [PATCH 15/39] convert fuse_ctl
Date: Sat, 20 Sep 2025 08:47:34 +0100
Message-ID: <20250920074759.3564072-15-viro@zeniv.linux.org.uk>
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

objects are created in fuse_ctl_add_dentry() by d_alloc_name()+d_add(),
removed by simple_remove_by_name().

What we return is a borrowed reference - it is valid until the call of
fuse_ctl_remove_conn() and we depend upon the exclusion (on fuse_mutex)
for safety.  Return value is used only within the caller
(fuse_ctl_add_conn()).

Replace d_add() with d_make_persistent() + dput().  dput() is paired
with d_alloc_name() and return value is the result of d_make_persistent().

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/fuse/control.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/control.c b/fs/fuse/control.c
index 31fa816d0189..adcb81e04802 100644
--- a/fs/fuse/control.c
+++ b/fs/fuse/control.c
@@ -234,8 +234,14 @@ static struct dentry *fuse_ctl_add_dentry(struct dentry *parent,
 	inode->i_fop = fop;
 	set_nlink(inode, nlink);
 	inode->i_private = fc;
-	d_add(dentry, inode);
-
+	d_make_persistent(dentry, inode);
+	dput(dentry);
+
+	/*
+	 * We are returning a borrowed reference here - it's only good while
+	 * fuse_mutex is held.  Actually it's d_make_persistent() return
+	 * value...
+	 */
 	return dentry;
 }
 
@@ -345,7 +351,7 @@ static void fuse_ctl_kill_sb(struct super_block *sb)
 	fuse_control_sb = NULL;
 	mutex_unlock(&fuse_mutex);
 
-	kill_litter_super(sb);
+	kill_anon_super(sb);
 }
 
 static struct file_system_type fuse_ctl_fs_type = {
-- 
2.47.3


