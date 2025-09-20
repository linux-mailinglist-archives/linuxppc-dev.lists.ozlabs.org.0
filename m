Return-Path: <linuxppc-dev+bounces-12463-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC63B8C28E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:50:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1f1C57z3dLR;
	Sat, 20 Sep 2025 17:48:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354501;
	cv=none; b=XajaAs33RF8rr7fi+hUTdhkE80vFEiFHdE/aAyH4Vb/K9VUW1zBkldaTBqeNMHJviW5T8X35w+T51Mc9rT2ldjU2CcaiKnyq0DtcPlGgEe2gNzIRn/8h3nRUBdL5UmAFiITdgz9GBj7QJ4cxUMS8Qd8pJs3uKxslv/v2DT2moCK847dQGYaSNlneSlSs3kYjA+SsNoFG/n+om5F0Q34oqYlE4hxOkSORWOJHK7XrpYSHyge77N8NT0k8PvlMvC47eMIlJkbTzf1rRrTv9jJMW6F6Hz7cnG/NltF7XFSNehhDN+dcByhPiQgwPvTox3Y/Ge9FjkZxo+bI9wvRakFRlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354501; c=relaxed/relaxed;
	bh=SHYH+cQVsm2L8KWlz63sd1N3QvfADJqbUf5fBvo0O9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hTCAqTRAF4+9aj3fmNDSoBroTm93mVA+maJC6EitTJCAUxR8xbthpSm/PsgNGAhqQ5kpwfGIkrmcNHnAd95BcoXu2VnLkmwChP9C3WtcObikUOXfGgyQz/2m1LBvNeP0padnUPJK8iKJc8cWqip/g7LwgcLy7K8dhBBIICScdvoehnPO2QqLs6ABuuRRAzTJEDI3ejoGjtvYrKYpW9SS0l/sB1pWfsH5hnd/RSyws8RrpHLLwaQJlOd4yIctIB1Ak+HrxpG/ws+0oNukZ8icFoe45AJr16tRZeU6ap6v/8arlliGN+ObwPaTg1tNS3gakXL0cqo1SYtpUgn8Ry3piA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=S0IOCIyb; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=S0IOCIyb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1S0Xw7z3cdV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=SHYH+cQVsm2L8KWlz63sd1N3QvfADJqbUf5fBvo0O9M=; b=S0IOCIybhpDVg55/sRTdTvowJ5
	klRE1xB/CDgAo2525KwT7F4L0heh7aXP7QN9Eh12RzsOJSHr1U27GatydApDoFWj72MXBXbhxUXEf
	mKDsQxDn4x2CPSC/RKYKCMeL/Kfm00JGEz52JxOZqSu09iztJptYnjDZ4G0ikALQ038MOm7LTwe7a
	ti/N6mdMrkwP6Go0mw2F7M2B/Z6cSx+Jm1o7bsBLLeGoM5s9BkeD5paoujT0kKglwj0OjDrGKTujh
	UE3q0/hIelsAycZGrSHLv0H8+7Ec0Dads2v9xZr/aqB1YnfGQ2hp1xxIp6tdYUzNFV7ycRMe8nwtB
	MCHBD53g==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsKB-0000000ExFR-0vOu;
	Sat, 20 Sep 2025 07:48:03 +0000
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
Subject: [PATCH 20/39] convert efivarfs
Date: Sat, 20 Sep 2025 08:47:39 +0100
Message-ID: <20250920074759.3564072-20-viro@zeniv.linux.org.uk>
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
index 4bb4002e3cdf..21208660bfe2 100644
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


