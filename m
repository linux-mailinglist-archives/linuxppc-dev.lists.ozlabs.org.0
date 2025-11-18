Return-Path: <linuxppc-dev+bounces-14257-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74706C67681
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:19:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9XsN1ZXLz3fFV;
	Tue, 18 Nov 2025 16:16:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763442998;
	cv=none; b=RDkV69FZFUiHxfiTgMEKgdYEPtzr1J+VPcU+/j09+/2VKWQ5QmGHUgTf5MKUUJttRnPIoLXlWDEiPlB/hKiL4+8kcGVSXQ2ob1Bn3aYDqYwrEBoqYz/RlWf5/KgTBhQuF/6YPNEQ1661C0c+i1YBlB/5YVB3gKnF82NlxHyiRnGs0d6u7SaWelup0sauIWxvTNBZ1GwsSDjAy/Jnhs4RinmTC27IF7nDWXayGUWRu24gBsxGlHOgaYvNx1CjTg9yFQidtMwUFdB+cU/QJaPkFLru0VV4c+lhMnn+d/8nCHogEMwxdkSei8xEXWKX7bTMjkxzPvvpWuxDIADgk0RqLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763442998; c=relaxed/relaxed;
	bh=X8Ik4zuriSM27g5TIHw6N+EULicED7c6xnS6UrwX7a8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Azhz/SIZvHuA+h70GlCGJnzSOQKCL569LITDYC6eelgpHBThI9pO2xrpmMRpHRg2eVDnMWqPngOd8IzsXpzl2TsiSd1fUYA7R799tp0vV9CGKTSpDSNK0+w7S3MrerQhDjRIZhoAWg+8LsEy5NgYn2OP7b6sfpiD9jaFbel1o3X+IptvXRBQUwZNaMyTqm7d4JCF9yr9bXW56uz/U30/w3IOU3jt8lIqRxL7rp/FwXhcyz8l2xSZrow1YLEMMnJTYnsse1WUnGeHdPQ6+8xJkiLSG+o3npPPfOF4uSRYSaTaBCZF3VuY4Qx7aVz1KksSeLURzdgYnlIVOAYzu6SEzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=eyBtxzuw; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=eyBtxzuw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xs03B2Gz30Wn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=X8Ik4zuriSM27g5TIHw6N+EULicED7c6xnS6UrwX7a8=; b=eyBtxzuw2W0UkWIMfBVDRF5HnN
	c8pkSZ6zguaEQHjWZ/2YQVWhKYltYMabKcqdaSVO4M4nSBHEvb7H6hrRgv3jmvTtamxHVz3gp99D1
	z1QxeZmOHNQ69JiTj+PFPMwzsleOAP2O4YCBcNdYzfNZt/xCwQFsAl/k601PI53kDcXYwe/PyYQ+Q
	fMuF0SZf5Fj5C1eeAww+b1lbhyqIr9kOw39nNvvF1IVvn19yU0aIzYZm6xS2Bwnd6G+iVYXLguIEx
	ZCo8D8StM6Q9hNTpWs6R14iTEwhLT2QwOIIypZLis6Qeg5Em6Pv2BptOzgrwHZ36gOkTjqOy6RCtr
	1d6HSJSQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4X-0000000GETc-1Nbr;
	Tue, 18 Nov 2025 05:16:09 +0000
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
Subject: [PATCH v4 40/54] functionfs: switch to simple_remove_by_name()
Date: Tue, 18 Nov 2025 05:15:49 +0000
Message-ID: <20251118051604.3868588-41-viro@zeniv.linux.org.uk>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

No need to return dentry from ffs_sb_create_file() or keep it around
afterwards.

To avoid subtle issues with getting to ffs from epfiles in
ffs_epfiles_destroy(), pass the superblock as explicit argument.
Callers have it anyway.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 drivers/usb/gadget/function/f_fs.c | 51 +++++++++++++-----------------
 1 file changed, 22 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index c7cb23a15fd0..40868ceb765c 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -160,8 +160,6 @@ struct ffs_epfile {
 	struct ffs_data			*ffs;
 	struct ffs_ep			*ep;	/* P: ffs->eps_lock */
 
-	struct dentry			*dentry;
-
 	/*
 	 * Buffer for holding data from partial reads which may happen since
 	 * we’re rounding user read requests to a multiple of a max packet size.
@@ -271,11 +269,11 @@ struct ffs_desc_helper {
 };
 
 static int  __must_check ffs_epfiles_create(struct ffs_data *ffs);
-static void ffs_epfiles_destroy(struct ffs_epfile *epfiles, unsigned count);
+static void ffs_epfiles_destroy(struct super_block *sb,
+				struct ffs_epfile *epfiles, unsigned count);
 
-static struct dentry *
-ffs_sb_create_file(struct super_block *sb, const char *name, void *data,
-		   const struct file_operations *fops);
+static int ffs_sb_create_file(struct super_block *sb, const char *name,
+			      void *data, const struct file_operations *fops);
 
 /* Devices management *******************************************************/
 
@@ -1894,9 +1892,8 @@ ffs_sb_make_inode(struct super_block *sb, void *data,
 }
 
 /* Create "regular" file */
-static struct dentry *ffs_sb_create_file(struct super_block *sb,
-					const char *name, void *data,
-					const struct file_operations *fops)
+static int ffs_sb_create_file(struct super_block *sb, const char *name,
+			      void *data, const struct file_operations *fops)
 {
 	struct ffs_data	*ffs = sb->s_fs_info;
 	struct dentry	*dentry;
@@ -1904,16 +1901,16 @@ static struct dentry *ffs_sb_create_file(struct super_block *sb,
 
 	dentry = d_alloc_name(sb->s_root, name);
 	if (!dentry)
-		return NULL;
+		return -ENOMEM;
 
 	inode = ffs_sb_make_inode(sb, data, fops, NULL, &ffs->file_perms);
 	if (!inode) {
 		dput(dentry);
-		return NULL;
+		return -ENOMEM;
 	}
 
 	d_add(dentry, inode);
-	return dentry;
+	return 0;
 }
 
 /* Super block */
@@ -1956,10 +1953,7 @@ static int ffs_sb_fill(struct super_block *sb, struct fs_context *fc)
 		return -ENOMEM;
 
 	/* EP0 file */
-	if (!ffs_sb_create_file(sb, "ep0", ffs, &ffs_ep0_operations))
-		return -ENOMEM;
-
-	return 0;
+	return ffs_sb_create_file(sb, "ep0", ffs, &ffs_ep0_operations);
 }
 
 enum {
@@ -2196,7 +2190,7 @@ static void ffs_data_closed(struct ffs_data *ffs)
 							flags);
 
 			if (epfiles)
-				ffs_epfiles_destroy(epfiles,
+				ffs_epfiles_destroy(ffs->sb, epfiles,
 						 ffs->eps_count);
 
 			if (ffs->setup_state == FFS_SETUP_PENDING)
@@ -2255,7 +2249,7 @@ static void ffs_data_clear(struct ffs_data *ffs)
 	 * copy of epfile will save us from use-after-free.
 	 */
 	if (epfiles) {
-		ffs_epfiles_destroy(epfiles, ffs->eps_count);
+		ffs_epfiles_destroy(ffs->sb, epfiles, ffs->eps_count);
 		ffs->epfiles = NULL;
 	}
 
@@ -2352,6 +2346,7 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
 {
 	struct ffs_epfile *epfile, *epfiles;
 	unsigned i, count;
+	int err;
 
 	count = ffs->eps_count;
 	epfiles = kcalloc(count, sizeof(*epfiles), GFP_KERNEL);
@@ -2368,12 +2363,11 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
 			sprintf(epfile->name, "ep%02x", ffs->eps_addrmap[i]);
 		else
 			sprintf(epfile->name, "ep%u", i);
-		epfile->dentry = ffs_sb_create_file(ffs->sb, epfile->name,
-						 epfile,
-						 &ffs_epfile_operations);
-		if (!epfile->dentry) {
-			ffs_epfiles_destroy(epfiles, i - 1);
-			return -ENOMEM;
+		err = ffs_sb_create_file(ffs->sb, epfile->name,
+					 epfile, &ffs_epfile_operations);
+		if (err) {
+			ffs_epfiles_destroy(ffs->sb, epfiles, i - 1);
+			return err;
 		}
 	}
 
@@ -2386,16 +2380,15 @@ static void clear_one(struct dentry *dentry)
 	smp_store_release(&dentry->d_inode->i_private, NULL);
 }
 
-static void ffs_epfiles_destroy(struct ffs_epfile *epfiles, unsigned count)
+static void ffs_epfiles_destroy(struct super_block *sb,
+				struct ffs_epfile *epfiles, unsigned count)
 {
 	struct ffs_epfile *epfile = epfiles;
+	struct dentry *root = sb->s_root;
 
 	for (; count; --count, ++epfile) {
 		BUG_ON(mutex_is_locked(&epfile->mutex));
-		if (epfile->dentry) {
-			simple_recursive_removal(epfile->dentry, clear_one);
-			epfile->dentry = NULL;
-		}
+		simple_remove_by_name(root, epfile->name, clear_one);
 	}
 
 	kfree(epfiles);
-- 
2.47.3


