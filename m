Return-Path: <linuxppc-dev+bounces-13403-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3741C1256A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 01:51:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwWth2qyDz3fTk;
	Tue, 28 Oct 2025 11:47:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761612460;
	cv=none; b=XdRTUJ+7CaLI2/fwEQcK3XpJp27UCkOhphgpnwhCHVm1GsVGDMFnYrty71hzMxAjwWcTRWaiDMS9eMQFqxl8eLaZ9IEgcyFF0AUAEXux3pg9dcoXjR4qVlgYsU0+R+dx1KQKi0lCcsCw6u2fnvC/Zish1YkWgJXqGYcTKonJFFGAX89vGCEBSyqWgwcDaZ//GEpkfkMoojKUfEvOwlxOTA2Iu52prpwsFHbn/iGDh7zRZS013KqNSOK2S7AU/D0rCB/r+jwYef3lxEzzoJcZBT3xiCj+eqAywKQYT1HlgovAZ8oG+KnQuED/kDZS7c9zs+8rQfEjaAaZXv2R+0MxgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761612460; c=relaxed/relaxed;
	bh=PCYFuUAfEyL0H++y1+uBZz/Bn18lJwb1nrzO1KgbXu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kTfKQnACieUlwe4ZOqZ84sZotY8npcHWim9d0jBqeLJO/cuUHJV9UKOmSLNQP8P/NsrHwgDOp5llmhSm22L7Z28cZyy0igNNwGOEzU1qeJpETSHoqmDHd9oRhaycjHQQUM9pGQ2J38f6Oijawo8G/fqISeNd370mpcNvIiGXksHoiXTEhFsI57/BX6gwgd0G57HeeXk7Gbl1LRvN40h12Y7kV9EBaM/QBo+m7mnyw+fkGLqdfWMQUuTE2Mxj4uTvkhgjKUSnyletOm7D9Iaw7cbSrWOHLceP5NhlB0aCKcc4CzjOCVNsr/Mv5biScfem2WQ0UQp1n8D4CP/aczqn5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=EWfgXsdi; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=EWfgXsdi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwWtf02mVz3c4d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 11:47:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=PCYFuUAfEyL0H++y1+uBZz/Bn18lJwb1nrzO1KgbXu4=; b=EWfgXsdiG3Fd92lYkqqo2qv86G
	VSuEIsAE3FCOGUjNJxAqt736qqVNAh1feZmW0K78PLH+93EYeUBDi1Xo4NzkphpULJWarhu9Oqrby
	pl/UZgIXr1W+2G5w/nMVZArRc7KcmUfNCfdq132QezWSLreZgiT2O+z3rW+qSNg88h4YVAyOKJk1k
	CxGSjVSLupRybFCX39EZff2pJknmU1Pf76gNozocEtWsm6ln0DjNrub4OI2ZwF1En+Jd3/MmNGXlz
	c4wZPg1r+A42g75MPjf1P4AKIc6OloMhv0P8DZccF6CGOiJ3b0QjBGhDWHq5pAJ98lhyAlfNWeLJD
	Jx20imGA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXqq-00000001eYP-45Hh;
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
Subject: [PATCH v2 22/50] convert efivarfs
Date: Tue, 28 Oct 2025 00:45:41 +0000
Message-ID: <20251028004614.393374-23-viro@zeniv.linux.org.uk>
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

Initially filesystem is populated with d_alloc_name() + d_add().
That becomes d_alloc_name() + d_make_persistent() + dput().
Dynamic creation is switched to d_make_persistent();
removal - to simple_unlink() (no point open-coding it in
efivarfs_unlink(), better call it there)

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/efivarfs/inode.c | 7 ++-----
 fs/efivarfs/super.c | 5 +++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/efivarfs/inode.c b/fs/efivarfs/inode.c
index 2891614abf8d..95dcad83da11 100644
--- a/fs/efivarfs/inode.c
+++ b/fs/efivarfs/inode.c
@@ -113,8 +113,7 @@ static int efivarfs_create(struct mnt_idmap *idmap, struct inode *dir,
 
 	inode->i_private = var;
 
-	d_instantiate(dentry, inode);
-	dget(dentry);
+	d_make_persistent(dentry, inode);
 
 	return 0;
 }
@@ -126,9 +125,7 @@ static int efivarfs_unlink(struct inode *dir, struct dentry *dentry)
 	if (efivar_entry_delete(var))
 		return -EINVAL;
 
-	drop_nlink(d_inode(dentry));
-	dput(dentry);
-	return 0;
+	return simple_unlink(dir, dentry);
 };
 
 const struct inode_operations efivarfs_dir_inode_operations = {
diff --git a/fs/efivarfs/super.c b/fs/efivarfs/super.c
index 1f4d8ce56667..298ab3c929eb 100644
--- a/fs/efivarfs/super.c
+++ b/fs/efivarfs/super.c
@@ -278,7 +278,8 @@ static int efivarfs_create_dentry(struct super_block *sb, efi_char16_t *name16,
 	inode->i_private = entry;
 	i_size_write(inode, size + sizeof(__u32)); /* attributes + data */
 	inode_unlock(inode);
-	d_add(dentry, inode);
+	d_make_persistent(dentry, inode);
+	dput(dentry);
 
 	return 0;
 
@@ -522,7 +523,7 @@ static void efivarfs_kill_sb(struct super_block *sb)
 	struct efivarfs_fs_info *sfi = sb->s_fs_info;
 
 	blocking_notifier_chain_unregister(&efivar_ops_nh, &sfi->nb);
-	kill_litter_super(sb);
+	kill_anon_super(sb);
 
 	kfree(sfi);
 }
-- 
2.47.3


