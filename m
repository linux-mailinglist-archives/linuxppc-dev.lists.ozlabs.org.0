Return-Path: <linuxppc-dev+bounces-14032-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEEAC4BC29
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 07:56:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5HNv6CjYz30B0;
	Tue, 11 Nov 2025 17:55:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762844143;
	cv=none; b=K1YLJNK/8gBTxEjalEO7Z2kShCVr90BwPdH8jHi0/FS2P0UJFJY9iT205BRO3LNFZ5H/uUBjhGVKkqi4C2L6DryuGPMYTsdRl3d9/g1WNM0XLttlWqF9YaBIdehHdx5dPIW6hCUjvVW1Gx5cTJSmutLHUMIl05ybfE1at1NoUK+T5+bP+C0qQBmkrhfNVkaHQk7uzAGfcY9Pg1kICAx+5i48U94TUXuso8yzo526Nri8i9smF8kViYupa4mcCn/zm0MvjYBn7QJqrjrgdrAuI0W+Dwei4E41bDdit1AMoLxPXER4hVi0ticy33hdSQ734k5p+1zuZCVwYdam4qFYoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762844143; c=relaxed/relaxed;
	bh=LZ6yrPf10XyjUbpb0uoz9zDvZV76d0sxqTJxoq2o+VY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nd5wuotlO0c/9uT5IA/Hc7Q8nEfCBkysQNZbu8UywpBpYBr+SE1QRMwnQNvJ3gmGutx8HDGZ4q5EF5LTTYWl6n0IkTNRL2yM+8LKl6Gq+U0Ei0COhbZdCMslh4iILw4o2Z+PgdaqY2X3tF76Y4isfwr2QuX41WNJPNhgZfqRRVDde+iRi1TXJi/KN/V1KVW/n2TMIamS31llfNKJyTVIey1BNgRCqyYjQE1ao6hpsB7cC4IaZedMHMigMo5pzEcu49HsPUGF9zyWyCft+plXkN2hiVc3MEhjW8NON74IktrAwq2qovCfVHDogMDMzPfjmMGcg9rxJkmoma1Kh46GgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=WF+XWuZj; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=WF+XWuZj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5HNn2jgDz2yvL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 17:55:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=LZ6yrPf10XyjUbpb0uoz9zDvZV76d0sxqTJxoq2o+VY=; b=WF+XWuZjccDaSV23t3ZCfvZAqt
	Hohm1giogHgJTgIjz+BM3jhjjTLoMdwPuodAY78QeOg3GUBHZu1BGBA/33p1gpzOLqgCHsjuNsjeO
	sQETYjkIyeMGltUwxf2aDzIQ7PxRO17kuJJhunXpDKie7s9abJc1ZOCPUQ4749pSp/uNXUiW0pz9g
	5StKOHjXdngU9MjIt4G/vCYSMTp+hyY6F4EcS2NOjjVRYMEIOouxZxb3c/rhJhZKAuyInpomcfpJH
	67Y7Q5I6dHBaVWqSe0Uuoe3F6FPAUvCjSQfpY1qedvsKXQE0I+R1n4CVwDF5AEHhuS7B8QobBm68r
	RCaB/VuQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiHk-0000000Bwyw-24hu;
	Tue, 11 Nov 2025 06:55:24 +0000
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
Subject: [PATCH v3 21/50] debugfs: remove duplicate checks in callers of start_creating()
Date: Tue, 11 Nov 2025 06:54:50 +0000
Message-ID: <20251111065520.2847791-22-viro@zeniv.linux.org.uk>
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

we'd already verified that DEBUGFS_ALLOW_API was there in
start_creating() - it would've failed otherwise

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/debugfs/inode.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index 682120fdbb17..25a554331ac4 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -433,11 +433,6 @@ static struct dentry *__debugfs_create_file(const char *name, umode_t mode,
 	if (IS_ERR(dentry))
 		return dentry;
 
-	if (!(debugfs_allow & DEBUGFS_ALLOW_API)) {
-		failed_creating(dentry);
-		return ERR_PTR(-EPERM);
-	}
-
 	inode = debugfs_get_inode(dentry->d_sb);
 	if (unlikely(!inode)) {
 		pr_err("out of free dentries, can not create file '%s'\n",
@@ -583,11 +578,6 @@ struct dentry *debugfs_create_dir(const char *name, struct dentry *parent)
 	if (IS_ERR(dentry))
 		return dentry;
 
-	if (!(debugfs_allow & DEBUGFS_ALLOW_API)) {
-		failed_creating(dentry);
-		return ERR_PTR(-EPERM);
-	}
-
 	inode = debugfs_get_inode(dentry->d_sb);
 	if (unlikely(!inode)) {
 		pr_err("out of free dentries, can not create directory '%s'\n",
@@ -630,11 +620,6 @@ struct dentry *debugfs_create_automount(const char *name,
 	if (IS_ERR(dentry))
 		return dentry;
 
-	if (!(debugfs_allow & DEBUGFS_ALLOW_API)) {
-		failed_creating(dentry);
-		return ERR_PTR(-EPERM);
-	}
-
 	inode = debugfs_get_inode(dentry->d_sb);
 	if (unlikely(!inode)) {
 		pr_err("out of free dentries, can not create automount '%s'\n",
-- 
2.47.3


