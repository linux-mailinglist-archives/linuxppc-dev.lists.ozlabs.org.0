Return-Path: <linuxppc-dev+bounces-12458-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E16B8C25A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 09:50:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTM1c0pGBz3dDg;
	Sat, 20 Sep 2025 17:48:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758354499;
	cv=none; b=XTEVX3XMT8d2qfE/ywetCAStfJ2XCe5071krMJtxOiblNLKJl/KKVoipIYuWCQAsM6mSX2vj7Om/6ApZIuFCqGZoTomq/k7i3a6d8GhkoX6DyDaOm3jjhIcG8USinSB3S8JT3NyUZItuG0Ec7gbNw3UCbBm2CCrMbl9hvrA4XOSCovi8btzzCybz0UIyz+gTgcS3unqc+o0cmHcEJP9FpHgr0aQJljLMOwaFTYvd0zN6g7kIxCbrpQyU/59Pf2cS7OK0BIqOi4WqRbT8KnWqsYRjQK8FN6lq967RxsvqwNojex6LvUE10HASLL/LTT7gO36R2orGIHv6bwjNjJgoTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758354499; c=relaxed/relaxed;
	bh=cZQ+/o3tr5dpemhKGUjYS6VsiGOwzb8RklREPcRpDvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CTSl7wlpwhDw5MTkOCoEBpMwd/1KKBNNXtnrH3sBhjgTNGgaaREteglPTlTcELVKKU1I9IDqBSadaG0yGXqvyzhxKMZ23s8be9JJ2EGHb0WP8+7PmrvTeIy7LaOLZJ06Ud70SD1nLScARbJc+eBdiM7HDX5TqXvbe51dgNI+fI7maBf9E05/5UxrRNr2hA9Jjd4l0ZIlsoFjfcuqZqVeMTKx3CERunOwRKdsmB4j0L9+B3ZpapfpnFmJ0oMao9wjXutqO9ZLCMw03FPS+xoTjLYGIs4ZGKbwUAG+DBsYJFeVZXGNx99E3m1B1o2unXgbkk3/B5HM4twXFGpXeXW0Lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=nE9xTD2O; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=nE9xTD2O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTM1R6jJLz3cdD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 17:48:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=cZQ+/o3tr5dpemhKGUjYS6VsiGOwzb8RklREPcRpDvg=; b=nE9xTD2O4CN6wpP4Ngft7mDdEL
	TuZcXGmk/7d3wdqCXaaVxrTXc2OSHAbf15SV7sa5HU6UiK2gZpavjRj9N/aM6/PamsDBqcxAg4fXm
	OL7LPJpsFT9Jl7xe0XrmWdWBiFpFHZhhH/JfesOcQStv2NO2kG0XrRzVAr5lhdazpsjPHAOuItv2C
	S+yo4rTy7pFfdpmUCBoKURVolp6v7OcIvRfTEnu/FPhKU0okt9N0AcAnFJKVTrkky6Vb87jl6b6wj
	aBs7nHDF0M7wtjRq/0toFn10gpnC2nogDPVajqxejcGgVd/KFjsC9q6b5xdmDwzw3ajlyOkSCo2U2
	SQIPPJtw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsKB-0000000ExF6-022R;
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
Subject: [PATCH 19/39] debugfs: remove duplicate checks in callers of start_creating()
Date: Sat, 20 Sep 2025 08:47:38 +0100
Message-ID: <20250920074759.3564072-19-viro@zeniv.linux.org.uk>
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

we'd already verified that DEBUGFS_ALLOW_API was there in
start_creating() - it would've failed otherwise

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/debugfs/inode.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index 1302995d6816..95eb57566d26 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -432,11 +432,6 @@ static struct dentry *__debugfs_create_file(const char *name, umode_t mode,
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
@@ -582,11 +577,6 @@ struct dentry *debugfs_create_dir(const char *name, struct dentry *parent)
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
@@ -629,11 +619,6 @@ struct dentry *debugfs_create_automount(const char *name,
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


