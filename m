Return-Path: <linuxppc-dev+bounces-13400-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C7AC12561
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 01:51:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwWtg1Yldz3fS4;
	Tue, 28 Oct 2025 11:47:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761612459;
	cv=none; b=QmYHyqH2s49WNvYC7JBTenwIgb8E+HfeDBEWazgP8XUr/3MhmuJ7nMprPo6tu+oltgXTnOwCzThRHdcO3oB1onrVzvnHYxw9ZjPjd6ktu355H1/nwIR0t2JLpLilitYOnNCHJDRRUd57QN2SiXHH6vtO04nmFEPeflCPLOwdUfh0AGVviSyZx2by0CoXROzgspWub8KWBSEXKAdxoSZ/Fsw6OaG72tnt/DPsKyHsfRd63UQp78Bl5/boWKe6/2Oq8eHm3obLhG4KvUIbUcnmpi626oXONGLUvfB385uG+n8VGI3+/KimsmcR8gb0ThAGKLioqs7NB/lTvwlUx1+TNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761612459; c=relaxed/relaxed;
	bh=OHt/Ew+g7B0pNZwOTBE8VBfCIPUfQxC19aVy8itf040=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J3Z2vRRLS4IZMxoa5p8g6LvOl2nmcmSuzbjg6ZbWkfcnFTT0stXKR2/82kq4uRobR4eM+VWrmkwSCE8lnAX5eLNCwNNpcwb586l7MMQ7RKylKY/QvkTXCbKlLuPTdBTVDZ7evkTQ9ipb3AWPEAYzVjY/AM4XWk+opFfB4RIeFLCoEmoJdwXtYhYrpwyaA/HmuahcMtRPOEn2U5hxL/Fpo0IugP2HPDDxkB8F4dcWh9YDtNmLmRSLovQrgq85Kpz8usWmg39m8XfFiyqJD14UyYRPtImPPkz85wxH/8gJnJPmG9lrdKfXaSIHTE3cJ1/VQPGP/dDVKcJOixxnk4XJSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=dpmtniKg; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=dpmtniKg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwWtd6wxdz3bfZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 11:47:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=OHt/Ew+g7B0pNZwOTBE8VBfCIPUfQxC19aVy8itf040=; b=dpmtniKgbg5gFqW2xm5+8kdYGJ
	hTEUxg2eRsoiSPIsC4/0/rf1gDnlubESIhlcx13vBoDnu9rk18uA8acv8bEkrsjKUUFm3h3rlpa1A
	fTf+rUS4AP/pzxQuw/nOBIEbP+sTz48lVgnHMf4+zcH8Er6FOrTD70RAkRvxDK2bYKPrzx7Dvmx6f
	EpEQEUKgw/qfWaAKtwjDUYmFOmwj2AFDVB8T4bmUhLFubUeMBhThmgssVXjpFRvReFgAFl54RPJy+
	6mv9CO2WjdrWQnKlDQh2qJmgQ0RF5kUsXnl3Ph4AvSk7srnGMPqRtdr7EXfmJSzPNcx5aa2cqmspm
	/qMvmccA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXqq-00000001eY8-39u1;
	Tue, 28 Oct 2025 00:46:16 +0000
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
Subject: [PATCH v2 20/50] convert debugfs
Date: Tue, 28 Oct 2025 00:45:39 +0000
Message-ID: <20251028004614.393374-21-viro@zeniv.linux.org.uk>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
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

similar to tracefs - simulation of normal codepath for creation,
simple_recursive_removal() for removal.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/debugfs/inode.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index 661a99a7dfbe..682120fdbb17 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -329,7 +329,7 @@ static struct file_system_type debug_fs_type = {
 	.name =		"debugfs",
 	.init_fs_context = debugfs_init_fs_context,
 	.parameters =	debugfs_param_specs,
-	.kill_sb =	kill_litter_super,
+	.kill_sb =	kill_anon_super,
 };
 MODULE_ALIAS_FS("debugfs");
 
@@ -405,16 +405,15 @@ static struct dentry *debugfs_start_creating(const char *name,
 
 static struct dentry *failed_creating(struct dentry *dentry)
 {
-	inode_unlock(d_inode(dentry->d_parent));
-	dput(dentry);
+	simple_done_creating(dentry);
 	simple_release_fs(&debugfs_mount, &debugfs_mount_count);
 	return ERR_PTR(-ENOMEM);
 }
 
 static struct dentry *end_creating(struct dentry *dentry)
 {
-	inode_unlock(d_inode(dentry->d_parent));
-	return dentry;
+	simple_done_creating(dentry);
+	return dentry; // borrowed
 }
 
 static struct dentry *__debugfs_create_file(const char *name, umode_t mode,
@@ -456,7 +455,7 @@ static struct dentry *__debugfs_create_file(const char *name, umode_t mode,
 	DEBUGFS_I(inode)->raw = real_fops;
 	DEBUGFS_I(inode)->aux = (void *)aux;
 
-	d_instantiate(dentry, inode);
+	d_make_persistent(dentry, inode);
 	fsnotify_create(d_inode(dentry->d_parent), dentry);
 	return end_creating(dentry);
 }
@@ -602,7 +601,7 @@ struct dentry *debugfs_create_dir(const char *name, struct dentry *parent)
 
 	/* directory inodes start off with i_nlink == 2 (for "." entry) */
 	inc_nlink(inode);
-	d_instantiate(dentry, inode);
+	d_make_persistent(dentry, inode);
 	inc_nlink(d_inode(dentry->d_parent));
 	fsnotify_mkdir(d_inode(dentry->d_parent), dentry);
 	return end_creating(dentry);
@@ -649,7 +648,7 @@ struct dentry *debugfs_create_automount(const char *name,
 	DEBUGFS_I(inode)->automount = f;
 	/* directory inodes start off with i_nlink == 2 (for "." entry) */
 	inc_nlink(inode);
-	d_instantiate(dentry, inode);
+	d_make_persistent(dentry, inode);
 	inc_nlink(d_inode(dentry->d_parent));
 	fsnotify_mkdir(d_inode(dentry->d_parent), dentry);
 	return end_creating(dentry);
@@ -704,7 +703,7 @@ struct dentry *debugfs_create_symlink(const char *name, struct dentry *parent,
 	inode->i_mode = S_IFLNK | S_IRWXUGO;
 	inode->i_op = &debugfs_symlink_inode_operations;
 	inode->i_link = link;
-	d_instantiate(dentry, inode);
+	d_make_persistent(dentry, inode);
 	return end_creating(dentry);
 }
 EXPORT_SYMBOL_GPL(debugfs_create_symlink);
-- 
2.47.3


