Return-Path: <linuxppc-dev+bounces-12492-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA33B8E8CB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 00:26:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVLSb308mz2xgQ;
	Mon, 22 Sep 2025 08:26:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758493599;
	cv=none; b=bK4wb44KgABP3+kJmvjjWJwrww9Gado31VtoJBRZvL2YC5zbibWGhrBwTJQ5EUpq/t1hDvvqa1QMBHEtSan/xXB1JsZ7QZ4csm0Re83tIvDA3uwbU8MrzRWpIDLr/EmVr16SNuf9jQEXG1c/4GwY5/NwzQNKsLzzZ/MFDezLnLgaCZfRnpFwjRnOkzxEOJMfrA+fKdObQua41lpAyEMAGF3nO/9mxW61TT7Lhk4U9XiFRzsosfCnJBlOVlbTxUZ5Cjh/hjLX8Cml/8FRZ1r98NLowOM6UsA/a/PoY21oVy1pbGF3gTkiitZtbFojUZ/ZI+geYXRojS27jYfBJDXsdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758493599; c=relaxed/relaxed;
	bh=vlILJqwe+hl8iDH5chyH6rCDu8EauUbPjDhI89Nes6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuTEfLfhzC2HtzpK64h3yPbXKymHU+L5u3bs2nRVCZxl3oc0sBUWiYIh/MDsKTx/kx6V7ThxS/T3Vzo7C66IE9OFPPZHPBDhPUBYW8l4eKM4o85zkBrtMJ97f0buXTsSX+YZGWMHnbS/krYakUqMTYkMXBueH+hCY1AlXzrpCETBl0TVLU5LvswMZG4gPadKMRHi0ylppal0pnWgef4QPxDALHtWQX8z+LYbmLnE8osF/WTm7wQb5Um7rl60ZF9BxDKl2Rusu6hmSuCr/t+uVcPWTWxoqkp0YM9epgc50wmoKPgLu5XDguaMLkk9u/GrgKb7J4ga7kwvfO4x6G2KGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=usSSiHDQ; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=usSSiHDQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVLSX0Ldqz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Sep 2025 08:26:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
	bh=vlILJqwe+hl8iDH5chyH6rCDu8EauUbPjDhI89Nes6o=; b=usSSiHDQ2Qbq/moPc13PFOUsWD
	OZvJvj3RMtsst8Itt4LV6ByI/pzdDEGYN59hMSjI9D0WKjMpT8umQJlX0udr+u4Z6EjToaCR2MjnL
	JebpsLsLxysXhYvgIRefuiFMxaAfazcku591eCGxw6/Bs7jzvr5ECie8rG4QZaTP+dCdYplQgGebB
	YeDuAM/mp6sz+txh4iD92ykjvSJ0E6qNuH5HhVaoO7funuh+WDy1Dw1yHMep3uwkJGBdVEjnzoTwA
	wjFjO1cvVgjL6w9gvL00vzdQ4iPjYVLDWXrxzvViNv4wuO++/Zm/0MKeyjfWXJDfNuQ+w27Vk9XKP
	fM2DzG5w==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0SVf-00000003poQ-2RiS;
	Sun, 21 Sep 2025 22:26:19 +0000
Date: Sun, 21 Sep 2025 23:26:19 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Paul Moore <paul@paul-moore.com>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
	brauner@kernel.org, jack@suse.cz, raven@themaw.net,
	miklos@szeredi.hu, a.hindborg@kernel.org, linux-mm@kvack.org,
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	kees@kernel.org, rostedt@goodmis.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org, borntraeger@linux.ibm.com
Subject: Re: [PATCH 31/39] convert selinuxfs
Message-ID: <20250921222619.GO39973@ZenIV>
References: <20250920074156.GK39973@ZenIV>
 <20250920074759.3564072-1-viro@zeniv.linux.org.uk>
 <20250920074759.3564072-31-viro@zeniv.linux.org.uk>
 <CAHC9VhTRsQtncKx4bkbkSqVXpZyQLHbvKkcaVO-ss21Fq36r+Q@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHC9VhTRsQtncKx4bkbkSqVXpZyQLHbvKkcaVO-ss21Fq36r+Q@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Sep 21, 2025 at 04:44:28PM -0400, Paul Moore wrote:
> On Sat, Sep 20, 2025 at 3:48 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > Tree has invariant part + two subtrees that get replaced upon each
> > policy load.  Invariant parts stay for the lifetime of filesystem,
> > these two subdirs - from policy load to policy load (serialized
> > on lock_rename(root, ...)).
> >
> > All object creations are via d_alloc_name()+d_add() inside selinuxfs,
> > all removals are via simple_recursive_removal().
> >
> > Turn those d_add() into d_make_persistent()+dput() and that's mostly it.
> > Don't bother to store the dentry of /policy_capabilities - it belongs
> > to invariant part of tree and we only use it to populate that directory,
> > so there's no reason to keep it around afterwards.
> 
> Minor comment on that below, as well as a comment style nitpick, but
> overall no major concerns from me.

FWIW, how's this for the preparatory part?

commit 17f3b70a28233078dd3dae3cf773b68fcd899950
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Sun Sep 21 18:09:48 2025 -0400

    selinuxfs: don't stash the dentry of /policy_capabilities
    
    Don't bother to store the dentry of /policy_capabilities - it belongs
    to invariant part of tree and we only use it to populate that directory,
    so there's no reason to keep it around afterwards.
    
    Same situation as with /avc, /ss, etc.  There are two directories that
    get replaced on policy load - /class and /booleans.  These we need to
    stash (and update the pointers on policy reload); /policy_capabilities
    is not in the same boat.
    
    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index 9aa1d03ab612..482a2cac9640 100644
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
@@ -1879,23 +1877,24 @@ static int sel_make_classes(struct selinux_policy *newpolicy,
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
@@ -2079,15 +2078,13 @@ static int sel_fill_super(struct super_block *sb, struct fs_context *fc)
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

