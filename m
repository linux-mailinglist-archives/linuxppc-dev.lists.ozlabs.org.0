Return-Path: <linuxppc-dev+bounces-14031-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB34C4BC26
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 07:56:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5HNv5GYqz2yvM;
	Tue, 11 Nov 2025 17:55:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762844143;
	cv=none; b=buEtgGPrp2uHOmSuu51l0QGLZvmBCpuoN2SPaBDtKt+A2U9edWakTwWD7jEJbjv92hYN1iOfutc7Shbt3b46lJUVPE0eYUshmri2DxIj34d3lcT53apT+Cs6fP5GWdrEWyiimW1BGd5zwdH54K5pUK5QyMLD6uY+W9AE8AvCaY9MLuC9UkCEmToe1u+g4xwyNkxFKbEu9TuHtKrSCBHL2bdfnb1YjRJzjyGuwAlEvXDrmlbMJhP8FADs5z1cuS9S7m8l6/Lcsv3zVc3gtvtbp4xGKeEkBV6iAxusaugRHKkuaTwlwtB06G1L9qAvjWj0It8cqxjpvPuga4NK8MePtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762844143; c=relaxed/relaxed;
	bh=fTvrbo3mOzTGCel3agLEDWiwlpX39p3niSGJ7gA+srw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NzD2cZvFCxKBZAh4R14pfCdR6OZflfef4PdLUXPdHsXXSxUW88u4KOYmElvV/oog9hHJ9ZZ4NdfG++fz57P5CNEoeSk25LKFJQsRMuWds013GlqMhPrG44A6TqmS4VKAZYaSzHzstO7thcp09gmx6rH/dw4tBj2yNr5un99L89wCS/UrF2CVG4cAOJnyJB+Iwx/HsIsf6AiZuW2mvOzlHuCSmCuf6obHji9wV3MlDGD4bc3uzSTX92EVHP5RtVrslBly6G2yeLHZQmyP1gctu8Sx5+wq29iJp6Thdkb7t7zpk3qwHE27uKphwYNhkcQy7HZacICtYyTEa12ovRjVmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=qH7TBk+e; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=qH7TBk+e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5HNp68pNz2yvW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 17:55:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=fTvrbo3mOzTGCel3agLEDWiwlpX39p3niSGJ7gA+srw=; b=qH7TBk+eHDvm5siQkKlw8FrzJW
	5Jui0fzA1zXpfadChbrGfDRhwWzG9A5d3XeSOOD9mgbukwwt8ilhKYsGWlBDSIwpBddE6btAAtNO1
	Q+UfbQyrVcMNQ6/tVYxuZ11sG1+GQLxgGfZ6/dzMsBqwd7J4360gzf1wxR/Ha9FhGqS7Q7RPS/Z19
	7nm0ndxcMPWJn1kWEBx+YxLOZz5dZlD+HOAVoPRbQBr+KLbYHRTaXR/j7mT3o1NzDnCTzvSyaGs4t
	ot+pnKsJnuiV+NRDNWD4nZHhKUnDl7BjtUBnp6m+dEeVUEtt52QIfrLLCGG074PcsdayQbP7DUbrZ
	ze0yilYA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiHj-0000000BwyB-1e67;
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
Subject: [PATCH v3 13/50] convert hugetlbfs
Date: Tue, 11 Nov 2025 06:54:42 +0000
Message-ID: <20251111065520.2847791-14-viro@zeniv.linux.org.uk>
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

Very much ramfs-like; dget()+d_instantiate() -> d_make_persistent()
(in two places) is all it takes.

NB: might make sense to turn its ->put_super() into ->kill_sb().

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/hugetlbfs/inode.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index f42548ee9083..83273677183d 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -975,8 +975,7 @@ static int hugetlbfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 	if (!inode)
 		return -ENOSPC;
 	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
-	d_instantiate(dentry, inode);
-	dget(dentry);/* Extra count - pin the dentry in core */
+	d_make_persistent(dentry, inode);
 	return 0;
 }
 
@@ -1023,10 +1022,9 @@ static int hugetlbfs_symlink(struct mnt_idmap *idmap,
 	if (inode) {
 		int l = strlen(symname)+1;
 		error = page_symlink(inode, symname, l);
-		if (!error) {
-			d_instantiate(dentry, inode);
-			dget(dentry);
-		} else
+		if (!error)
+			d_make_persistent(dentry, inode);
+		else
 			iput(inode);
 	}
 	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
@@ -1483,7 +1481,7 @@ static struct file_system_type hugetlbfs_fs_type = {
 	.name			= "hugetlbfs",
 	.init_fs_context	= hugetlbfs_init_fs_context,
 	.parameters		= hugetlb_fs_parameters,
-	.kill_sb		= kill_litter_super,
+	.kill_sb		= kill_anon_super,
 	.fs_flags               = FS_ALLOW_IDMAP,
 };
 
-- 
2.47.3


