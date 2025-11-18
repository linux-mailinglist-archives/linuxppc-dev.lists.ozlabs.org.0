Return-Path: <linuxppc-dev+bounces-14270-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3542C676E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:20:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9Xsd6fGSz3fRD;
	Tue, 18 Nov 2025 16:16:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763443010;
	cv=none; b=fxDNKxVvJm8zdM/52LI4WMjL94AZSBisaRxwXjwXFKUjluYVZcsne3gTjLYTBlMUKMPEVFajKB6m3Z21IMQRUjOJCpsyQ+s1PDpa3IlRdbwZxvxwpTWXm1niQiU+BUcqsDSJIEGi/rRGV3V8LTpTtGQzgU06aoZTx+kfpu2t+69W+jEvP7rVizmlk0ammEHYxwsBcKMfD4er7wXm3PH7C2gqKk+F+z/2hSDtEn+pmRAhmz+OMF4JHOVydoFL8djf6Uq2mXnV5jdQjfpbbPO0Q+dF7wKJzk8WzBPUf1HxzwA8bfAWkivNYpXSRBbtM+sq1+GGzmhh9ZJjf/i4wdK6Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763443010; c=relaxed/relaxed;
	bh=W4Rux38+4wafzrtHIPx/pAtSqJiq0rCT3/CghgJ+qB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L195HErxHStiERgHsCyKsqZjQ7xSfaU8PazNUCN2ZOF2zLFA/6GPE8pTJPx2CZqlD5XJeuIIhgXAUAhV2DnXnNaJrn3Enb/fgMmGvUn//XD3gUex1efDRFCMTwcyfF4OYvXNLA/wypaL/3D5EJqkS2ngphGUp6c/MVxjdMXPbSpgKq7bi5OVJpAGx2oxNsIUQct0B8JsRh7BuXKmXcT6UYownWBRinlJ1A/apdI+RngEzydLihDJ0Dthc1jWihI38mk0NT27ihSflx04gnQ+iETkQvc9yXvvpTp1br+2Qvk2ikQwyxg4WS6eKiEyQn1Lw0vlasIn9AONTTZhyCWDYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=IjzD6SZN; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=IjzD6SZN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xs15W6Rz3bb6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=W4Rux38+4wafzrtHIPx/pAtSqJiq0rCT3/CghgJ+qB0=; b=IjzD6SZNXZ75C/fjOmEaQfJprG
	st1rZe+yTGOATslq/EHEeNfCyI3fQTgrrCV/xwDy09PJSc20HZ9/ok0I0a6gCKmEXdF6E8xreFNhp
	OgidLo1jv4DB8vfCPjI7+oGZVX3/oxkW1jyzqdo2J6X/UdDJYlW2D3R3PLUowglk9et6/yxJjtxYZ
	KNTgNk9hRf7Szz3u6z00J01G2unFzLttC/ER2KnYlhR10MLCFBlSJTocJz2mk767MUGk7sNN/rxqv
	o/P8JiVlYvDsCT5f0UsCsVRKt74WvBpr3DKdGHm8BMKE9Iiy6gn6+QnxHbtC7Bfhkk0QlZ5G0yBJ+
	3ninlNHA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4T-0000000GEPt-1rsH;
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
Subject: [PATCH v4 03/54] new helper: simple_remove_by_name()
Date: Tue, 18 Nov 2025 05:15:12 +0000
Message-ID: <20251118051604.3868588-4-viro@zeniv.linux.org.uk>
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

simple_recursive_removal(), but instead of victim dentry it takes
parent + name.

Used to be open-coded in fs/fuse/control.c, but there's no need to expose
the guts of that thing there and there are other potential users, so
let's lift it into libfs...

Acked-by: Miklos Szeredi <mszeredi@redhat.com>
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


