Return-Path: <linuxppc-dev+bounces-13406-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C232C12596
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 01:52:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwWtj1RyGz3fVP;
	Tue, 28 Oct 2025 11:47:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761612460;
	cv=none; b=jZ67HY1owmwmszoaw5gwesNylJI7mwYPgCQnkEHa9b4QHU4yWIzvzIQYhcNca2yTL1b8VIXkFutdZM88ybgk1mbWWhvcv1YqdHAV6NVloeIJ+DNTlG6VI73hYDsRig23aOPZjgIS5vdI49w2bSQcFrrQkw+/PT6/SYXD3YvI1/RQyAPyIUFkACduzwzN+rvvcxeiSSVxArdwOTNziJukp8AxWDs3xcW1WKXBUyS158Xr1pM2fdpgbMDJ+yMh/6VqOKW2aTqlThA3a0LkB8/i81Pl1D7fvX2aEv+Bj1/c4+Z2N+v+1SdUta8W+55jFtMvorkU50sjG38t+VUAUziSVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761612460; c=relaxed/relaxed;
	bh=KjlhtDhBu18/9JmgPyyx9lDuBAywfgEoPZuaBcmvHHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BYDJBZwXcPSCOGM5Y2eQqFw7y/fy8qwp4frX4U+rWxWIYVaQVTwOx7ZOqkBvKoSqx8fDA//XLa7eylzMnQL5/44Y1TB2+OK+33Mnk83M4tRJmn8azy8Q8dN+V3r6AF63t4KcSAfknNN0hpp1DNsZWUB7Iz+ViM8zjpJahVNf1raVzQ2El2sDfQdEohyJizhJWuGmw2f8+BQjxjCDEY85UAr8wHtCS80qN1aAS+pXahYYyuMyvT9eeX2nrutoQTtIQ2+CN+KzQ6nEnelLYTZotQJ7CPiXcC0JjsHIfBCcp5lyeTyWh5cufFLOedlOJytn7NldPZIbbGeUz3LMf2zpgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=phZVBEpG; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=phZVBEpG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwWth0BFMz3fTR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 11:47:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=KjlhtDhBu18/9JmgPyyx9lDuBAywfgEoPZuaBcmvHHc=; b=phZVBEpGiYICQyEE9X/keIVY/a
	CmhYmQ8VOyIHYl2COlyCH2bMlcgZVwhskAuU0zEBihISwgQZ3Xdms6rzKWduPKsZZwouTfNOJq2v7
	mk2ZsgZ9vYND+utkyglLqPp0K8aN2Tdltcu7EHR3T1qKuMd/wfSEFNStRKKAFMJEffwJTNPuRJObb
	YYwNC3ZZnpcS9MHYSijdehjaE6XcuRtB7a4FmWUjpYSK5Wb0TVn2YxvyaJ0cepqq7f0eN2+qseEWm
	4aqpOM+SJDuyH4b/awxgssyJShv1mo9PTSWTfbzphmTK1Np0FCjREro3MHoYhRL3vjHNu5a33bLvJ
	ylojuCcg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXqo-00000001eVf-3zhD;
	Tue, 28 Oct 2025 00:46:14 +0000
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
Subject: [PATCH v2 03/50] new helper: simple_remove_by_name()
Date: Tue, 28 Oct 2025 00:45:22 +0000
Message-ID: <20251028004614.393374-4-viro@zeniv.linux.org.uk>
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

simple_recursive_removal(), but instead of victim dentry it takes
parent + name.

Used to be open-coded in fs/fuse/control.c, but there's no need to expose
the guts of that thing there and there are other potential users, so
let's lift it into libfs...

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/fuse/control.c  |  7 +------
 fs/libfs.c         | 13 +++++++++++++
 include/linux/fs.h |  2 ++
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/fs/fuse/control.c b/fs/fuse/control.c
index 5247df896c5d..3dca752127ff 100644
--- a/fs/fuse/control.c
+++ b/fs/fuse/control.c
@@ -290,18 +290,13 @@ static void remove_one(struct dentry *dentry)
  */
 void fuse_ctl_remove_conn(struct fuse_conn *fc)
 {
-	struct dentry *dentry;
 	char name[32];
 
 	if (!fuse_control_sb || fc->no_control)
 		return;
 
 	sprintf(name, "%u", fc->dev);
-	dentry = lookup_noperm_positive_unlocked(&QSTR(name), fuse_control_sb->s_root);
-	if (!IS_ERR(dentry)) {
-		simple_recursive_removal(dentry, remove_one);
-		dput(dentry);	// paired with lookup_noperm_positive_unlocked()
-	}
+	simple_remove_by_name(fuse_control_sb->s_root, name, remove_one);
 }
 
 static int fuse_ctl_fill_super(struct super_block *sb, struct fs_context *fsc)
diff --git a/fs/libfs.c b/fs/libfs.c
index ce8c496a6940..d029aff41f66 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -655,6 +655,19 @@ void simple_recursive_removal(struct dentry *dentry,
 }
 EXPORT_SYMBOL(simple_recursive_removal);
 
+void simple_remove_by_name(struct dentry *parent, const char *name,
+                           void (*callback)(struct dentry *))
+{
+	struct dentry *dentry;
+
+	dentry = lookup_noperm_positive_unlocked(&QSTR(name), parent);
+	if (!IS_ERR(dentry)) {
+		simple_recursive_removal(dentry, callback);
+		dput(dentry);	// paired with lookup_noperm_positive_unlocked()
+	}
+}
+EXPORT_SYMBOL(simple_remove_by_name);
+
 /* caller holds parent directory with I_MUTEX_PARENT */
 void locked_recursive_removal(struct dentry *dentry,
                               void (*callback)(struct dentry *))
diff --git a/include/linux/fs.h b/include/linux/fs.h
index c895146c1444..28bd4e8d3892 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3631,6 +3631,8 @@ extern int simple_rename(struct mnt_idmap *, struct inode *,
 			 unsigned int);
 extern void simple_recursive_removal(struct dentry *,
                               void (*callback)(struct dentry *));
+extern void simple_remove_by_name(struct dentry *, const char *,
+                              void (*callback)(struct dentry *));
 extern void locked_recursive_removal(struct dentry *,
                               void (*callback)(struct dentry *));
 extern int noop_fsync(struct file *, loff_t, loff_t, int);
-- 
2.47.3


