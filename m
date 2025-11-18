Return-Path: <linuxppc-dev+bounces-14238-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1527C67588
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 06:17:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9Xs46YQsz3bsQ;
	Tue, 18 Nov 2025 16:16:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763442983;
	cv=none; b=QaXMBknUvjP51E5Ig8HcmAfVpB+2qHcLhVOl2ei11QpZxBihALgbVC2w0KN2tweYOnq8WrrMT59GLOlenG79gbKBz8m7fZP8lKgrkiLdB27q+MA4QPF5OLL4J5D1uzqADA39aYXm8snQiTBY1VakMiD68QKjHMLtU0E1cg6K4woytKhwbC8AwLOTvQ9cc3ojfE91IDZ5ITk+/+rcAxQr/f7uRyhL0j08v2o7WMQwwSLYRC4ZFDtpc+C4fIPtQG/lC+/QlhwUpF69RYzAcX2Ze55IhlE8vv0Lbd0YqWa0YfzinPJskXa0YXa2jghITpe0ysZFClB7WnTgu/VZxjVZMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763442983; c=relaxed/relaxed;
	bh=0EOMkT/UFsYLOkQCFILn7xjwHlMa0Zq2h7YoVPTnFkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hhWt87W8rpDsWYwwEPdVzwvaA2bv2MHB6VmcGR4gFwGCHwCctr/M/BDd4uioZG+XgVCACQc0RmcxphCLMCGTVEsCldZPTmItSYejZJY3+/V9HjeiCuofXOW1UD+K2CiUzrsgowT+AMYZgg77Xs8z+RWo//rhMNMcMw8D1IdL8iwxB5iemo4+/xf6eTJejki0GM8sk6kUPrAUXT3wRSLFP90KjVCJNhpqR7n9Opc9QUF3fXPqG988E4hnyT2L7UTskdgnDVeKjL17lYP4lZIwV6jD4ZZ5wTQrLh19ZArMoxYdfIjzVv3WMOnjO0pQZr+xhz2t+dCqOL5PIlHkBJWKcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=YMQMfC95; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=YMQMfC95;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Xry21dfz30TM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 16:16:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=0EOMkT/UFsYLOkQCFILn7xjwHlMa0Zq2h7YoVPTnFkU=; b=YMQMfC95UzXpLnsV+MX99bUiC4
	cvz/Aak/sdeVYYm1wdUV2YNlDYiycXWNQYdo5idTX2iZSBMODEOrqf4iSHEKVdt1TzvhXFOF8RzX8
	IjdaoaRvSduE7wcMeRcl64wQ4BFqwO5ZwHxbzRIzCFv5e1kXQa14bytNI9mbxuasJ7R1jVElyQutN
	mFeKClenuE+KOJAHjbE9U4qouT6EwdCy+N1wlVRFH4D4GHTd4vxsByBID2Z4RPzSpkigpAVv5ENuw
	BCETuW6vudii5uC+ts1uwJiaMtJT2YzEASyX1/UfwsObbbvb55Z/pqkAsIEdy3RZhKajBuUQDb7Yg
	G/fThDHw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLE4W-0000000GESc-0zv6;
	Tue, 18 Nov 2025 05:16:08 +0000
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
Subject: [PATCH v4 30/54] autofs_{rmdir,unlink}: dentry->d_fsdata->dentry == dentry there
Date: Tue, 18 Nov 2025 05:15:39 +0000
Message-ID: <20251118051604.3868588-31-viro@zeniv.linux.org.uk>
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

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/autofs/root.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/autofs/root.c b/fs/autofs/root.c
index 174c7205fee4..39794633d484 100644
--- a/fs/autofs/root.c
+++ b/fs/autofs/root.c
@@ -623,12 +623,11 @@ static int autofs_dir_symlink(struct mnt_idmap *idmap,
 static int autofs_dir_unlink(struct inode *dir, struct dentry *dentry)
 {
 	struct autofs_sb_info *sbi = autofs_sbi(dir->i_sb);
-	struct autofs_info *ino = autofs_dentry_ino(dentry);
 	struct autofs_info *p_ino;
 
 	p_ino = autofs_dentry_ino(dentry->d_parent);
 	p_ino->count--;
-	dput(ino->dentry);
+	dput(dentry);
 
 	d_inode(dentry)->i_size = 0;
 	clear_nlink(d_inode(dentry));
@@ -710,7 +709,7 @@ static int autofs_dir_rmdir(struct inode *dir, struct dentry *dentry)
 
 	p_ino = autofs_dentry_ino(dentry->d_parent);
 	p_ino->count--;
-	dput(ino->dentry);
+	dput(dentry);
 	d_inode(dentry)->i_size = 0;
 	clear_nlink(d_inode(dentry));
 
-- 
2.47.3


