Return-Path: <linuxppc-dev+bounces-14045-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B24C4BCA1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 07:57:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5HP22WRSz3dXX;
	Tue, 11 Nov 2025 17:55:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762844149;
	cv=none; b=b77RKr8Ox6nwZVnV52/V3Or/xxLnIrZmqbskxMBcWM/1VacBYTqkuK6pQOaoCPAxSLXUo/NxvmcoMu6nU/F9XYhZS0woZWrD/E+NNprwOj9xEF9JBooVsizptTvWkmRI+YKbLxiO1bZWBIDQhIMtwlEb+0k1RZksjhf/kQO69QpwlUo6XgKPZk/ssHcmPMOH3sAqXz/VvgMzZ9zaxfmnY1SX2bxgX3Zx9vfmwAAK4RLg6XaPDZWi3HRXkjS/qJA7coeF+4pPG9ShBa4EyFwzFEaZ03f+zUpTc8yypDF8uvTijP5KRDUKwmXZZNub25r5Hww/4gK3jIfkGsYBf5jXOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762844149; c=relaxed/relaxed;
	bh=8X770T8ZfjCDu3xB4E5AEqp0VoQs0dPMEWp6Hxra23A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X4fXVJMpFfukFz1gIog7VSgLswpGIaLqlCiz1CEOA3rm28XGzboagw9QDVnrVzaJF+gNgoMk15tFQ5qPljU9JnmUP9Qe8Q990Sr9Bh9UkAh5YSH3Uzxy3ZAmZwZrgXvLBBkiMNY5MQLHa/b/GRQI3wJVRR7HjyWD87UKFOO6XrXfEaupIaInvFRSNM0XFdTCjcqCHmfjezapA7icu4YCGh2zkpMyb9ztqoY1H1hl13nupMe8LQHcDvG+D7Vxx0zWk3rXKCxVZLcxKWmYMAxo8FeEQJ4aNB1lxfHu4A4zo2VOLqFipu11CGBATe/cy8JDO4ceuP9RGnVWW8m2r+4UMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=YCDudwCD; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=YCDudwCD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5HNy66Tyz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 17:55:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=8X770T8ZfjCDu3xB4E5AEqp0VoQs0dPMEWp6Hxra23A=; b=YCDudwCDT/n4mN+8CVGG/MVpKv
	HXMKHDYa0eAoCZBp7rPVUFHDcK55zwx1kWLUNU/sTXQtPOfR3YBdohIuk01gmUmOXc/gGOIW4MLHN
	q6hwsoi7Q0hkY8ti3IDavzsEsJjvTcWMl/b5dG/LunvamKdSimus6KhyaPw/wM3O9nXkobmOoIbcy
	JhlSaMb2V2j7YUnd3PIhI1A58jHvLBk/2CPMyNlE6TqswKB/6vHKcHwuv0QG3ZP8RVWL+7zcPvn3r
	6ydR3Iwc37imHuIzYZPdqsSdfuzz3FZg2HijNLeMjmh1ddGfHdq/TvOa1SEfgR6yONrujxgrznqfg
	/X3ZcTKg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiHm-0000000Bx2N-3R3y;
	Tue, 11 Nov 2025 06:55:27 +0000
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
Subject: [PATCH v3 33/50] selinuxfs: don't stash the dentry of /policy_capabilities
Date: Tue, 11 Nov 2025 06:55:02 +0000
Message-ID: <20251111065520.2847791-34-viro@zeniv.linux.org.uk>
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

Don't bother to store the dentry of /policy_capabilities - it belongs
to invariant part of tree and we only use it to populate that directory,
so there's no reason to keep it around afterwards.

Same situation as with /avc, /ss, etc.  There are two directories that
get replaced on policy load - /class and /booleans.  These we need to
stash (and update the pointers on policy reload); /policy_capabilities
is not in the same boat.

Acked-by: Paul Moore <paul@paul-moore.com>
Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Tested-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 security/selinux/selinuxfs.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index 232e087bce3e..b39e919c27b1 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -75,7 +75,6 @@ struct selinux_fs_info {
 	struct dentry *class_dir;
 	unsigned long last_class_ino;
 	bool policy_opened;
-	struct dentry *policycap_dir;
 	unsigned long last_ino;
 	struct super_block *sb;
 };
@@ -117,7 +116,6 @@ static void selinux_fs_info_free(struct super_block *sb)
 
 #define BOOL_DIR_NAME "booleans"
 #define CLASS_DIR_NAME "class"
-#define POLICYCAP_DIR_NAME "policy_capabilities"
 
 #define TMPBUFLEN	12
 static ssize_t sel_read_enforce(struct file *filp, char __user *buf,
@@ -1871,23 +1869,24 @@ static int sel_make_classes(struct selinux_policy *newpolicy,
 	return rc;
 }
 
-static int sel_make_policycap(struct selinux_fs_info *fsi)
+static int sel_make_policycap(struct dentry *dir)
 {
+	struct super_block *sb = dir->d_sb;
 	unsigned int iter;
 	struct dentry *dentry = NULL;
 	struct inode *inode = NULL;
 
 	for (iter = 0; iter <= POLICYDB_CAP_MAX; iter++) {
 		if (iter < ARRAY_SIZE(selinux_policycap_names))
-			dentry = d_alloc_name(fsi->policycap_dir,
+			dentry = d_alloc_name(dir,
 					      selinux_policycap_names[iter]);
 		else
-			dentry = d_alloc_name(fsi->policycap_dir, "unknown");
+			dentry = d_alloc_name(dir, "unknown");
 
 		if (dentry == NULL)
 			return -ENOMEM;
 
-		inode = sel_make_inode(fsi->sb, S_IFREG | 0444);
+		inode = sel_make_inode(sb, S_IFREG | 0444);
 		if (inode == NULL) {
 			dput(dentry);
 			return -ENOMEM;
@@ -2071,15 +2070,13 @@ static int sel_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto err;
 	}
 
-	fsi->policycap_dir = sel_make_dir(sb->s_root, POLICYCAP_DIR_NAME,
-					  &fsi->last_ino);
-	if (IS_ERR(fsi->policycap_dir)) {
-		ret = PTR_ERR(fsi->policycap_dir);
-		fsi->policycap_dir = NULL;
+	dentry = sel_make_dir(sb->s_root, "policy_capabilities", &fsi->last_ino);
+	if (IS_ERR(dentry)) {
+		ret = PTR_ERR(dentry);
 		goto err;
 	}
 
-	ret = sel_make_policycap(fsi);
+	ret = sel_make_policycap(dentry);
 	if (ret) {
 		pr_err("SELinux: failed to load policy capabilities\n");
 		goto err;
-- 
2.47.3


